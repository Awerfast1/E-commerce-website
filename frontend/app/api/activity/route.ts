import { NextRequest, NextResponse } from "next/server";
import { getAdminDb } from "@/lib/admin/supabaseAdmin";
import { authenticateStoreUser } from "@/lib/store/storefrontMonitoring";

const ACCESS_COOKIE = "congears_access_token";
const allowedEvents = new Set(["cart_added", "cart_removed", "cart_quantity_changed", "product_viewed"]);

export async function POST(request: NextRequest) {
  const accessToken = request.cookies.get(ACCESS_COOKIE)?.value;
  if (!accessToken) return NextResponse.json({ ok: true });

  try {
    const user = await authenticateStoreUser(accessToken);
    if (!user) return NextResponse.json({ ok: true });

    const body = await request.json() as { eventType?: unknown; slug?: unknown; quantity?: unknown };
    const eventType = typeof body.eventType === "string" ? body.eventType : "";
    const slug = typeof body.slug === "string" ? body.slug.trim().slice(0, 180) : "";
    if (!allowedEvents.has(eventType) || !/^[a-zA-Z0-9-]+$/.test(slug)) {
      return NextResponse.json({ error: "Hoạt động không hợp lệ." }, { status: 400 });
    }

    const db = getAdminDb();
    const isUuid = /^[0-9a-f]{8}-[0-9a-f]{4}-[1-8][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i.test(slug);
    const productQuery = db.from("products").select("product_id, product_name");
    const { data: product } = await (isUuid
      ? productQuery.eq("product_id", slug)
      : productQuery.eq("slug", slug)
    ).maybeSingle();
    const name = product?.product_name || slug;
    const quantity = Number.isSafeInteger(body.quantity) && Number(body.quantity) > 0
      ? Math.min(Number(body.quantity), 20)
      : null;
    const descriptions: Record<string, string> = {
      cart_added: `Đã thêm ${name} vào giỏ hàng.`,
      cart_removed: `Đã xóa ${name} khỏi giỏ hàng.`,
      cart_quantity_changed: `Đã cập nhật số lượng ${name}.`,
      product_viewed: `Đã xem sản phẩm ${name}.`,
    };
    const metadata: Record<string, string | number | null> = { slug };
    if (product?.product_id) metadata.product_id = product.product_id;
    if (quantity !== null) metadata.quantity = quantity;

    const { error } = await db.from("user_activity_logs").insert({
      user_id: user.id,
      event_type: eventType,
      description: descriptions[eventType],
      metadata,
    });
    if (error) throw error;

    if (product && eventType.startsWith("cart_")) {
      const { data: variant } = await db.from("product_variants")
        .select("variant_id")
        .eq("product_id", product.product_id)
        .eq("is_active", true)
        .order("price", { ascending: true })
        .limit(1)
        .maybeSingle();
      if (variant) {
        let { data: cart } = await db.from("shopping_carts")
          .select("cart_id")
          .eq("user_id", user.id)
          .maybeSingle();
        if (cart) {
          await db.from("shopping_carts").update({ updated_at: new Date().toISOString() }).eq("cart_id", cart.cart_id);
        } else {
          const { data: createdCart } = await db.from("shopping_carts")
            .insert({ user_id: user.id })
            .select("cart_id")
            .single();
          cart = createdCart;
        }
        if (cart) {
          const { data: cartItem } = await db.from("cart_items")
            .select("cart_item_id")
            .eq("cart_id", cart.cart_id)
            .eq("variant_id", variant.variant_id)
            .maybeSingle();
          if (eventType === "cart_removed" || quantity === null) {
            if (cartItem) await db.from("cart_items").delete().eq("cart_item_id", cartItem.cart_item_id);
          } else if (cartItem) {
            await db.from("cart_items").update({ quantity }).eq("cart_item_id", cartItem.cart_item_id);
          } else {
            await db.from("cart_items").insert({ cart_id: cart.cart_id, variant_id: variant.variant_id, quantity });
          }
        }
      }
    }

    if (eventType === "product_viewed" && product?.product_id) {
      await db.from("recently_viewed_products").upsert(
        { user_id: user.id, product_id: product.product_id, viewed_at: new Date().toISOString() },
        { onConflict: "user_id,product_id" },
      );
    }

    return NextResponse.json({ ok: true });
  } catch (error) {
    console.error("Activity record failed", error);
    return NextResponse.json({ ok: false }, { status: 503 });
  }
}
