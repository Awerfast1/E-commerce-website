import { NextRequest, NextResponse } from "next/server";
import { authenticateStoreUser, getAuthenticatedStoreDb } from "@/lib/store/storefrontMonitoring";

const ACCESS_COOKIE = "congears_access_token";

export async function POST(request: NextRequest) {
  const token = request.cookies.get(ACCESS_COOKIE)?.value;
  if (!token) return NextResponse.json({ error: "Vui lòng đăng nhập để xem giá đặt hàng." }, { status: 401 });

  try {
    const user = await authenticateStoreUser(token);
    if (!user) return NextResponse.json({ error: "Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại." }, { status: 401 });
    const body = await request.json() as { items?: unknown };
    if (!Array.isArray(body.items) || body.items.length < 1 || body.items.length > 30) {
      return NextResponse.json({ error: "Giỏ hàng đang trống hoặc không hợp lệ." }, { status: 400 });
    }

    const db = getAuthenticatedStoreDb(token);
    const items: { slug: string; name: string; quantity: number; unit_price: number; compare_at_price: number; line_total: number }[] = [];
    for (const raw of body.items) {
      if (!raw || typeof raw !== "object") return NextResponse.json({ error: "Sản phẩm trong giỏ không hợp lệ." }, { status: 400 });
      const value = raw as { slug?: unknown; quantity?: unknown };
      const slug = typeof value.slug === "string" ? value.slug.trim().slice(0, 180) : "";
      const quantity = Number(value.quantity);
      if (!/^[a-zA-Z0-9-]+$/.test(slug) || !Number.isSafeInteger(quantity) || quantity < 1 || quantity > 20) {
        return NextResponse.json({ error: "Sản phẩm hoặc số lượng không hợp lệ." }, { status: 400 });
      }

      const { data: product, error: productError } = await db.from("products")
        .select("product_id, product_name")
        .eq("slug", slug)
        .eq("is_active", true)
        .maybeSingle();
      if (productError) throw productError;
      if (!product) return NextResponse.json({ error: `Sản phẩm ${slug} chưa có trong catalog đặt hàng.` }, { status: 409 });

      const { data: variant, error: variantError } = await db.from("product_variants")
        .select("price, compare_at_price")
        .eq("product_id", product.product_id)
        .eq("is_active", true)
        .order("price", { ascending: true })
        .limit(1)
        .maybeSingle();
      if (variantError) throw variantError;
      if (!variant) return NextResponse.json({ error: `Sản phẩm ${product.product_name} hiện chưa có phiên bản đang bán.` }, { status: 409 });

      const unitPrice = Number(variant.price);
      const compareAtPrice = Math.max(unitPrice, Number(variant.compare_at_price || 0));
      items.push({
        slug,
        name: product.product_name,
        quantity,
        unit_price: unitPrice,
        compare_at_price: compareAtPrice,
        line_total: unitPrice * quantity,
      });
    }

    const subtotal = items.reduce((sum, item) => sum + item.line_total, 0);
    const listSubtotal = items.reduce((sum, item) => sum + item.compare_at_price * item.quantity, 0);
    await db.from("user_activity_logs").insert({
      user_id: user.id,
      event_type: "checkout_reviewed",
      description: "Khách hàng đã xem lại giá và thông tin trước khi đặt hàng.",
      metadata: { item_count: items.length, total_amount: subtotal },
    });
    return NextResponse.json({ quote: { items, subtotal, listSubtotal, discountAmount: listSubtotal - subtotal } });
  } catch (error) {
    console.error("Order quote failed", error);
    return NextResponse.json({ error: "Không thể lấy giá hiện tại từ catalog. Vui lòng thử lại." }, { status: 503 });
  }
}
