import { NextRequest, NextResponse } from "next/server";
import { authenticateStoreUser, getAuthenticatedStoreDb } from "@/lib/store/storefrontMonitoring";

const ACCESS_COOKIE = "congears_access_token";
const uuidPattern = /^[0-9a-f]{8}-[0-9a-f]{4}-[1-8][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i;

type OrderBody = {
  requestId?: unknown;
  items?: unknown;
  recipient?: { name?: unknown; phone?: unknown; address?: unknown; ward?: unknown; district?: unknown; city?: unknown };
  note?: unknown;
  expectedTotal?: unknown;
};

function text(value: unknown, max: number) {
  return typeof value === "string" ? value.trim().slice(0, max) : "";
}

export async function POST(request: NextRequest) {
  const accessToken = request.cookies.get(ACCESS_COOKIE)?.value;
  if (!accessToken) return NextResponse.json({ error: "Vui lòng đăng nhập để đặt hàng." }, { status: 401 });

  try {
    const user = await authenticateStoreUser(accessToken);
    if (!user) return NextResponse.json({ error: "Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại." }, { status: 401 });

    const body = await request.json() as OrderBody;
    const requestId = text(body.requestId, 64);
    const recipient = body.recipient ?? {};
    const items = Array.isArray(body.items) ? body.items : [];
    if (!uuidPattern.test(requestId) || items.length < 1 || items.length > 30 || !Number.isSafeInteger(body.expectedTotal) || Number(body.expectedTotal) < 0) {
      return NextResponse.json({ error: "Thông tin đơn hàng không hợp lệ." }, { status: 400 });
    }

    const normalizedItems: { slug: string; quantity: number }[] = [];
    for (const raw of items) {
      if (!raw || typeof raw !== "object") return NextResponse.json({ error: "Sản phẩm trong giỏ không hợp lệ." }, { status: 400 });
      const value = raw as { slug?: unknown; quantity?: unknown };
      const slug = text(value.slug, 180);
      const quantity = Number(value.quantity);
      if (!/^[a-zA-Z0-9-]+$/.test(slug) || !Number.isSafeInteger(quantity) || quantity < 1 || quantity > 20) {
        return NextResponse.json({ error: "Sản phẩm hoặc số lượng không hợp lệ." }, { status: 400 });
      }
      normalizedItems.push({ slug, quantity });
    }

    const { data, error } = await getAuthenticatedStoreDb(accessToken).rpc("place_customer_order", {
      p_user_id: user.id,
      p_client_order_token: requestId,
      p_items: normalizedItems,
      p_recipient_name: text(recipient.name, 120),
      p_phone: text(recipient.phone, 40),
      p_address_line: text(recipient.address, 300),
      p_ward: text(recipient.ward, 120) || null,
      p_district: text(recipient.district, 120) || null,
      p_city: text(recipient.city, 120),
      p_expected_total: Number(body.expectedTotal),
      p_customer_note: text(body.note, 1000) || null,
    });

    if (error) {
      if (error.code === "PGRST202") {
        return NextResponse.json({ error: "Chức năng đặt hàng chưa được kích hoạt. Quản trị viên cần chạy migration database/order_intake_monitoring.sql trong Supabase SQL Editor." }, { status: 503 });
      }
      const status = error.code === "P0002" || error.code === "P0003" ? 409 : error.code === "22023" ? 400 : error.code === "42501" ? 403 : 500;
      return NextResponse.json({ error: status === 500 ? "Chưa thể tạo đơn hàng lúc này. Vui lòng thử lại." : error.message }, { status });
    }

    const order = Array.isArray(data) ? data[0] : data;
    if (!order) return NextResponse.json({ error: "Máy chủ chưa trả về thông tin đơn hàng." }, { status: 500 });
    return NextResponse.json({ order }, { status: 201 });
  } catch (error) {
    console.error("Order intake failed", error);
    return NextResponse.json({ error: "Không thể kết nối hệ thống đặt hàng. Vui lòng thử lại." }, { status: 503 });
  }
}
