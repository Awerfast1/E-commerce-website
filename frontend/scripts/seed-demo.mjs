/**
 * Seeds demo customers, orders and related business data for the admin dashboard.
 *
 * Usage:
 *   node --env-file=.env.local scripts/seed-demo.mjs
 *   node --env-file=.env.local scripts/seed-demo.mjs --reset
 *
 * All orders use the DEMO- prefix so they can be removed safely.
 */
import { createClient } from "@supabase/supabase-js";
import { randomUUID } from "node:crypto";

const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
const secret = process.env.SUPABASE_SECRET_KEY;

if (!url || !secret) {
  console.error("Missing NEXT_PUBLIC_SUPABASE_URL or SUPABASE_SECRET_KEY.");
  process.exit(1);
}

const reset = process.argv.includes("--reset");
const db = createClient(url, secret, {
  auth: { persistSession: false, autoRefreshToken: false },
});

const DEMO_PREFIX = "DEMO-";
const CUSTOMER_COUNT = 12;
const ORDER_COUNT = 56;

let seed = 20261122;
function random() {
  seed |= 0;
  seed = (seed + 0x6d2b79f5) | 0;
  let t = Math.imul(seed ^ (seed >>> 15), 1 | seed);
  t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t;
  return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
}
const pick = (items) => items[Math.floor(random() * items.length)];
const between = (min, max) => Math.floor(random() * (max - min + 1)) + min;
const addDays = (date, days) => new Date(date.getTime() + days * 86400000);
const iso = (date) => date.toISOString();

const customers = [
  ["Nguyễn Văn An", "0912345678", "12 Nguyễn Huệ"],
  ["Trần Thị Bình", "0987654321", "45 Lê Lợi"],
  ["Lê Hoàng Cường", "0905123456", "78 Hai Bà Trưng"],
  ["Phạm Thu Dung", "0938765432", "23 Trần Duy Hưng"],
  ["Hoàng Minh Đức", "0977123456", "56 Nguyễn Trãi"],
  ["Vũ Thị Hoa", "0967345678", "89 Cách Mạng Tháng 8"],
  ["Đặng Quốc Hùng", "0945678123", "101 Võ Văn Tần"],
  ["Bùi Thanh Lan", "0923456789", "34 Phan Xích Long"],
  ["Ngô Văn Minh", "0918765432", "67 Lý Thường Kiệt"],
  ["Đỗ Thị Ngọc", "0981122334", "12 Nguyễn Thị Minh Khai"],
  ["Phan Văn Phúc", "0909988776", "90 Điện Biên Phủ"],
  ["Lý Thị Quỳnh", "0932211445", "15 Pasteur"],
];

const cities = [
  ["Hà Nội", "Cầu Giấy", "Dịch Vọng"],
  ["Hà Nội", "Đống Đa", "Láng Hạ"],
  ["TP. Hồ Chí Minh", "Quận 1", "Bến Nghé"],
  ["TP. Hồ Chí Minh", "Quận 7", "Tân Phú"],
  ["Đà Nẵng", "Hải Châu", "Thạch Thang"],
];

const carriers = ["GHN", "GHTK", "Viettel Post", "J&T Express", "Ninja Van"];

function orderStatus() {
  const roll = random();
  if (roll < 0.42) return "COMPLETED";
  if (roll < 0.58) return "DELIVERED";
  if (roll < 0.7) return "SHIPPED";
  if (roll < 0.79) return "PROCESSING";
  if (roll < 0.87) return "CONFIRMED";
  if (roll < 0.94) return "PENDING";
  return "CANCELLED";
}

async function chunkedUpsert(table, rows, onConflict, size = 100) {
  for (let index = 0; index < rows.length; index += size) {
    const chunk = rows.slice(index, index + size);
    const { error } = await db.from(table).upsert(chunk, onConflict ? { onConflict } : undefined);
    if (error) throw new Error(`${table}: ${error.message}`);
  }
}

async function ensureCustomers() {
  const { data: authList, error: listError } = await db.auth.admin.listUsers({ page: 1, perPage: 1000 });
  if (listError) throw listError;

  const byEmail = new Map((authList?.users ?? []).map((user) => [user.email?.toLowerCase(), user]));
  const result = [];

  for (let index = 0; index < customers.length; index += 1) {
    const [name, phone, street] = customers[index];
    const email = `demo.customer${index + 1}@congears.demo`;

    let user = byEmail.get(email);
    if (!user) {
      const { data, error } = await db.auth.admin.createUser({
        email,
        password: `Demo@${1000 + index}!`,
        email_confirm: true,
        user_metadata: { display_name: name },
      });
      if (error && !/already/i.test(error.message)) throw error;
      if (data?.user) user = data.user;
    }

    if (!user) {
      const { data: refreshed } = await db.auth.admin.listUsers({ page: 1, perPage: 1000 });
      user = (refreshed?.users ?? []).find((item) => item.email?.toLowerCase() === email);
    }
    if (!user) throw new Error(`Could not create demo customer ${email}`);

    const [city, district, ward] = pick(cities);
    result.push({ id: user.id, name, phone, street, city, district, ward });
  }

  const now = iso(new Date());
  const profiles = result.map((customer) => ({
    user_id: customer.id,
    account_type: "CLIENT",
    account_status: "ACTIVE",
    display_name: customer.name,
    phone: customer.phone,
    created_at: now,
    updated_at: now,
  }));
  await chunkedUpsert("profiles", profiles, "user_id");

  const addresses = result.map((customer, index) => ({
    address_id: randomUUID(),
    user_id: customer.id,
    recipient_name: customer.name,
    phone: customer.phone,
    address_line: customer.street,
    ward: customer.ward,
    district: customer.district,
    city: customer.city,
    country: "Vietnam",
    is_default: true,
    created_at: iso(addDays(new Date(), -120 + index)),
  }));
  await deleteDemoCustomerAddresses(result.map((customer) => customer.id));
  await chunkedUpsert("customer_addresses", addresses);

  return result;
}

async function deleteDemoCustomerAddresses(userIds) {
  if (!userIds.length) return;
  const { error } = await db.from("customer_addresses").delete().in("user_id", userIds);
  if (error) throw error;
}

async function loadCatalog() {
  const { data, error } = await db
    .from("products")
    .select("product_id, product_name, product_variants(variant_id, sku, variant_name, price, compare_at_price, is_active)")
    .eq("is_active", true)
    .limit(2000);
  if (error) throw error;

  const variants = [];
  for (const product of data ?? []) {
    for (const variant of product.product_variants ?? []) {
      if (variant.is_active === false) continue;
      variants.push({
        productId: product.product_id,
        productName: product.product_name,
        variantId: variant.variant_id,
        sku: variant.sku,
        variantName: variant.variant_name || "Tiêu chuẩn",
        price: Number(variant.price || 0),
        compareAtPrice: Number(variant.compare_at_price || variant.price || 0),
      });
    }
  }
  if (!variants.length) throw new Error("No product variants found.");
  return variants;
}

async function resetDemoData() {
  const { data: orders, error } = await db
    .from("orders")
    .select("order_id")
    .like("order_code", `${DEMO_PREFIX}%`);
  if (error) throw error;
  const ids = (orders ?? []).map((order) => order.order_id);
  if (!ids.length) return;

  const orderItems = await db.from("order_items").select("order_item_id").in("order_id", ids);
  const orderItemIds = (orderItems.data ?? []).map((item) => item.order_item_id);
  if (orderItemIds.length) await db.from("warranties").delete().in("order_item_id", orderItemIds);

  const payments = await db.from("payments").select("payment_id").in("order_id", ids);
  const paymentIds = (payments.data ?? []).map((payment) => payment.payment_id);
  if (paymentIds.length) await db.from("refunds").delete().in("payment_id", paymentIds);

  const shipments = await db.from("shipments").select("shipment_id").in("order_id", ids);
  const shipmentIds = (shipments.data ?? []).map((shipment) => shipment.shipment_id);
  if (shipmentIds.length) {
    await db.from("shipment_tracking_events").delete().in("shipment_id", shipmentIds);
    await db.from("shipments").delete().in("order_id", ids);
  }

  await db.from("product_reviews").delete().in("order_id", ids);
  await db.from("returns").delete().in("order_id", ids);
  await db.from("payments").delete().in("order_id", ids);
  await db.from("order_addresses").delete().in("order_id", ids);
  await db.from("order_items").delete().in("order_id", ids);
  await db.from("orders").delete().in("order_id", ids);
  console.log(`Reset ${ids.length} demo orders.`);
}

async function seedInventory(variants) {
  const { data: inventory, error } = await db
    .from("inventory")
    .select("inventory_id, warehouse_id, variant_id, quantity_on_hand, quantity_reserved");
  if (error) throw error;

  const rows = (inventory ?? []).map((row, index) => {
    const low = index % 37 === 0;
    const onHand = low ? between(0, 8) : between(12, 140);
    return {
      inventory_id: row.inventory_id,
      warehouse_id: row.warehouse_id,
      variant_id: row.variant_id,
      quantity_on_hand: onHand,
      quantity_reserved: Math.min(onHand, between(0, 6)),
      updated_at: iso(addDays(new Date(), -between(0, 20))),
    };
  });

  await chunkedUpsert("inventory", rows, "inventory_id", 150);
  console.log(`Updated ${rows.length} inventory rows.`);
}

async function seedOrders(customerRows, variants) {
  const { data: methods, error: methodError } = await db
    .from("payment_methods")
    .select("payment_method_id, method_name")
    .eq("is_active", true);
  if (methodError) throw methodError;

  const orders = [];
  const items = [];
  const addresses = [];
  const payments = [];
  const shipments = [];
  const tracking = [];
  const returns = [];
  const refunds = [];
  const warranties = [];
  const reviews = [];
  const notifications = [];

  const now = new Date();
  const createdEmails = new Set();

  for (let index = 0; index < ORDER_COUNT; index += 1) {
    const customer = pick(customerRows);
    const status = orderStatus();
    const daysAgo = between(0, 150);
    const placedAt = addDays(now, -daysAgo);
    placedAt.setHours(between(8, 21), between(0, 59), between(0, 59), 0);
    const orderId = randomUUID();
    const itemCount = between(1, 3);
    const chosen = new Set();
    let subtotal = 0;

    for (let j = 0; j < itemCount; j += 1) {
      let variant = pick(variants);
      let guard = 0;
      while (chosen.has(variant.variantId) && guard < 12) {
        variant = pick(variants);
        guard += 1;
      }
      chosen.add(variant.variantId);
      const quantity = between(1, 2);
      const lineTotal = variant.price * quantity;
      subtotal += lineTotal;
      items.push({
        order_item_id: randomUUID(),
        order_id: orderId,
        variant_id: variant.variantId,
        product_name_snapshot: variant.productName,
        variant_name_snapshot: variant.variantName,
        sku_snapshot: variant.sku,
        unit_price: variant.price,
        quantity,
        line_total: lineTotal,
      });
    }

    const discount = Math.round(subtotal * (random() < 0.45 ? pick([0.05, 0.1, 0.15, 0.2]) : 0));
    const shippingFee = random() < 0.3 ? 0 : pick([25000, 30000, 35000, 45000]);
    const total = Math.max(0, subtotal - discount + shippingFee);

    orders.push({
      order_id: orderId,
      order_code: `${DEMO_PREFIX}${String(10000 + index)}`,
      user_id: customer.id,
      order_status: status,
      subtotal,
      discount_amount: discount,
      shipping_fee: shippingFee,
      total_amount: total,
      customer_note: random() < 0.2 ? pick(["Giao ngoài giờ hành chính", "Gọi trước khi giao", "Đóng gói cẩn thận"]) : null,
      placed_at: iso(placedAt),
      updated_at: iso(addDays(placedAt, between(0, 4))),
    });

    addresses.push({
      order_address_id: randomUUID(),
      order_id: orderId,
      recipient_name: customer.name,
      phone: customer.phone,
      address_line: customer.street,
      ward: customer.ward,
      district: customer.district,
      city: customer.city,
      country: "Vietnam",
    });

    const method = pick(methods ?? []);
    const paid = !["PENDING", "CANCELLED"].includes(status);
    const paymentId = randomUUID();
    payments.push({
      payment_id: paymentId,
      order_id: orderId,
      payment_method_id: method?.payment_method_id,
      amount: total,
      payment_status: paid ? "PAID" : "PENDING",
      provider_transaction_id: paid ? `TXN${between(100000, 999999)}${index}` : null,
      paid_at: paid ? iso(addDays(placedAt, 0)) : null,
      created_at: iso(placedAt),
    });

    if (["SHIPPED", "DELIVERED", "COMPLETED"].includes(status)) {
      const shipmentId = randomUUID();
      const shippedAt = addDays(placedAt, between(1, 2));
      const delivered = ["DELIVERED", "COMPLETED"].includes(status);
      shipments.push({
        shipment_id: shipmentId,
        order_id: orderId,
        carrier_name: pick(carriers),
        tracking_number: `VN${between(100000000, 999999999)}`,
        shipping_status: delivered ? "DELIVERED" : "IN_TRANSIT",
        shipped_at: iso(shippedAt),
        delivered_at: delivered ? iso(addDays(shippedAt, between(1, 4))) : null,
        created_at: iso(placedAt),
      });
      tracking.push({
        tracking_event_id: randomUUID(),
        shipment_id: shipmentId,
        event_status: "SHIPPED",
        event_description: "Đơn hàng đã được lấy từ kho",
        location: pick(["Hà Nội", "Đà Nẵng", "TP. Hồ Chí Minh"]),
        event_at: iso(shippedAt),
      });
      if (delivered) {
        tracking.push({
          tracking_event_id: randomUUID(),
          shipment_id: shipmentId,
          event_status: "DELIVERED",
          event_description: "Giao hàng thành công",
          location: customer.city,
          event_at: iso(addDays(shippedAt, between(1, 4))),
        });
      }
    }

    if (status === "COMPLETED" && random() < 0.14) {
      const approved = random() < 0.65;
      returns.push({
        return_id: randomUUID(),
        order_id: orderId,
        user_id: customer.id,
        return_reason: pick(["Sản phẩm không đúng mô tả", "Bị lỗi khi nhận hàng", "Đổi ý không cần nữa"]),
        return_status: approved ? "APPROVED" : "REQUESTED",
        requested_at: iso(addDays(placedAt, between(3, 10))),
        processed_at: approved ? iso(addDays(placedAt, between(11, 15))) : null,
      });

      if (approved && random() < 0.55) {
        refunds.push({
          refund_id: randomUUID(),
          payment_id: paymentId,
          amount: total,
          refund_reason: "Khách yêu cầu hoàn tiền",
          refund_status: "COMPLETED",
          created_at: iso(addDays(placedAt, between(8, 14))),
          processed_at: iso(addDays(placedAt, between(15, 20))),
        });
      }
    }

    if (["DELIVERED", "COMPLETED"].includes(status)) {
      for (const item of items.filter((row) => row.order_id === orderId)) {
        const start = addDays(placedAt, 2);
        warranties.push({
          warranty_id: randomUUID(),
          order_item_id: item.order_item_id,
          user_id: customer.id,
          warranty_start: start.toISOString().slice(0, 10),
          warranty_end: addDays(start, 365).toISOString().slice(0, 10),
          warranty_status: "ACTIVE",
        });
      }
    }

    if (["DELIVERED", "COMPLETED"].includes(status) && random() < 0.55) {
      const rated = items.filter((row) => row.order_id === orderId);
      const item = pick(rated);
      reviews.push({
        review_id: randomUUID(),
        product_id: variants.find((variant) => variant.variantId === item.variant_id)?.productId,
        user_id: customer.id,
        order_id: orderId,
        rating: between(3, 5),
        review_title: pick(["Rất hài lòng", "Sản phẩm tốt", "Đáng tiền", "Giao hàng nhanh"]),
        review_content: pick([
          "Đóng gói chắc chắn, sản phẩm đúng mô tả.",
          "Chất lượng ổn trong tầm giá, sẽ ủng hộ tiếp.",
          "Giao nhanh, nhân viên tư vấn nhiệt tình.",
        ]),
        review_status: random() < 0.65 ? "PUBLISHED" : "PENDING",
        created_at: iso(addDays(placedAt, between(3, 8))),
      });
    }

    if (!createdEmails.has(customer.id)) {
      createdEmails.add(customer.id);
      notifications.push({
        notification_id: randomUUID(),
        user_id: customer.id,
        title: "Chào mừng bạn đến với ConGears",
        message: "Cảm ơn bạn đã mua sắm tại ConGears. Theo dõi đơn hàng trong mục tài khoản của bạn.",
        notification_type: "SYSTEM",
        is_read: random() < 0.5,
        created_at: iso(addDays(now, -between(1, 30))),
      });
    }
  }

  await chunkedUpsert("orders", orders, "order_id");
  await chunkedUpsert("order_items", items, "order_item_id", 200);
  await chunkedUpsert("order_addresses", addresses, "order_address_id", 200);
  await chunkedUpsert("payments", payments, "payment_id", 200);
  if (shipments.length) await chunkedUpsert("shipments", shipments, "shipment_id", 200);
  if (tracking.length) await chunkedUpsert("shipment_tracking_events", tracking, "tracking_event_id", 200);
  if (returns.length) await chunkedUpsert("returns", returns, "return_id", 200);
  if (refunds.length) await chunkedUpsert("refunds", refunds, "refund_id", 200);
  if (warranties.length) await chunkedUpsert("warranties", warranties, "warranty_id", 200);
  if (reviews.length) await chunkedUpsert("product_reviews", reviews, "review_id", 200);
  if (notifications.length) await chunkedUpsert("notifications", notifications, "notification_id", 200);

  console.log(
    `Seeded ${orders.length} orders, ${items.length} items, ${payments.length} payments, ${reviews.length} reviews.`,
  );
}

async function seedWishlistsAndCarts(customerRows, variants) {
  const wishlists = customerRows.slice(0, 7).map((customer) => ({
    wishlist_id: randomUUID(),
    user_id: customer.id,
    created_at: iso(addDays(new Date(), -between(5, 60))),
  }));
  const wishlistItems = [];
  for (const list of wishlists) {
    const seen = new Set();
    for (let index = 0; index < between(2, 5); index += 1) {
      const variant = pick(variants);
      if (seen.has(variant.productId)) continue;
      seen.add(variant.productId);
      wishlistItems.push({
        wishlist_item_id: randomUUID(),
        wishlist_id: list.wishlist_id,
        product_id: variant.productId,
        created_at: iso(addDays(new Date(), -between(1, 30))),
      });
    }
  }

  const carts = customerRows.slice(2, 9).map((customer) => ({
    cart_id: randomUUID(),
    user_id: customer.id,
    created_at: iso(addDays(new Date(), -between(1, 20))),
    updated_at: iso(addDays(new Date(), -between(0, 2))),
  }));
  const cartItems = [];
  for (const cart of carts) {
    const seen = new Set();
    for (let index = 0; index < between(1, 3); index += 1) {
      const variant = pick(variants);
      if (seen.has(variant.variantId)) continue;
      seen.add(variant.variantId);
      cartItems.push({
        cart_item_id: randomUUID(),
        cart_id: cart.cart_id,
        variant_id: variant.variantId,
        quantity: between(1, 2),
        created_at: iso(addDays(new Date(), -between(0, 5))),
      });
    }
  }

  // Remove previous demo wishlists/carts to keep reruns idempotent.
  const userIds = customerRows.map((customer) => customer.id);
  const existingWishlists = await db.from("wishlists").select("wishlist_id").in("user_id", userIds);
  const wishlistIds = (existingWishlists.data ?? []).map((row) => row.wishlist_id);
  if (wishlistIds.length) {
    await db.from("wishlist_items").delete().in("wishlist_id", wishlistIds);
    await db.from("wishlists").delete().in("wishlist_id", wishlistIds);
  }

  const existingCarts = await db.from("shopping_carts").select("cart_id").in("user_id", userIds);
  const cartIds = (existingCarts.data ?? []).map((row) => row.cart_id);
  if (cartIds.length) {
    await db.from("cart_items").delete().in("cart_id", cartIds);
    await db.from("shopping_carts").delete().in("cart_id", cartIds);
  }

  if (wishlists.length) await chunkedUpsert("wishlists", wishlists, "wishlist_id");
  if (wishlistItems.length) await chunkedUpsert("wishlist_items", wishlistItems, "wishlist_item_id", 200);
  if (carts.length) await chunkedUpsert("shopping_carts", carts, "cart_id");
  if (cartItems.length) await chunkedUpsert("cart_items", cartItems, "cart_item_id", 200);

  console.log(`Seeded ${wishlists.length} wishlists and ${carts.length} carts.`);
}

async function main() {
  console.log("Connecting to", url);
  if (reset) await resetDemoData();

  const customerRows = await ensureCustomers();
  const variants = await loadCatalog();

  const existing = await db
    .from("orders")
    .select("*", { count: "exact", head: true })
    .like("order_code", `${DEMO_PREFIX}%`);

  if ((existing.count ?? 0) > 0) {
    console.log(`Found ${existing.count} existing demo orders. Use --reset to recreate them.`);
  } else {
    await seedOrders(customerRows, variants);
  }

  await seedWishlistsAndCarts(customerRows, variants);
  await seedInventory(variants);

  const counts = await Promise.all([
    db.from("orders").select("*", { count: "exact", head: true }),
    db.from("profiles").select("*", { count: "exact", head: true }),
    db.from("product_reviews").select("*", { count: "exact", head: true }),
  ]);

  console.log(
    `Done. orders=${counts[0].count ?? 0} customers=${counts[1].count ?? 0} reviews=${counts[2].count ?? 0}`,
  );
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
