import "server-only";

import { getAdminDb } from "./supabaseAdmin";

const REVENUE_STATUSES = new Set([
  "CONFIRMED",
  "PROCESSING",
  "SHIPPED",
  "DELIVERED",
  "COMPLETED",
  "PAID",
]);

export type RecentOrder = {
  order_id: string;
  order_code: string;
  order_status: string;
  total_amount: number;
  placed_at: string;
  profiles?: { display_name?: string | null } | null;
};

export type LowStockRow = {
  inventory_id: string;
  quantity_on_hand: number;
  quantity_reserved: number;
  warehouses?: { warehouse_name?: string | null } | null;
  product_variants?: {
    sku?: string | null;
    variant_name?: string | null;
    products?: { product_name?: string | null } | { product_name?: string | null }[] | null;
  } | null;
};

export type DashboardData = {
  counts: {
    products: number;
    activeProducts: number;
    categories: number;
    brands: number;
    customers: number;
    orders: number;
    pendingOrders: number;
    lowStock: number;
    pendingReviews: number;
    requestedReturns: number;
  };
  revenue: {
    total: number;
    last30Days: number;
    averageOrder: number;
    monthly: { label: string; value: number }[];
  };
  statusBreakdown: { status: string; count: number }[];
  topProducts: { name: string; quantity: number; revenue: number }[];
  recentOrders: RecentOrder[];
  lowStock: LowStockRow[];
};

function monthKey(date: Date) {
  return `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, "0")}`;
}

export async function getDashboardData(): Promise<DashboardData> {
  const db = getAdminDb();
  const now = new Date();
  const thirtyDaysAgo = new Date(now.getTime() - 30 * 24 * 60 * 60 * 1000);

  const [
    products,
    activeProducts,
    categories,
    brands,
    customers,
    ordersCount,
    pendingOrders,
    lowStockCount,
    pendingReviews,
    requestedReturns,
    ordersResult,
    itemsResult,
    recentOrdersResult,
    lowStockResult,
  ] = await Promise.all([
    db.from("products").select("*", { count: "exact", head: true }),
    db.from("products").select("*", { count: "exact", head: true }).eq("is_active", true),
    db.from("categories").select("*", { count: "exact", head: true }),
    db.from("brands").select("*", { count: "exact", head: true }),
    db.from("profiles").select("*", { count: "exact", head: true }),
    db.from("orders").select("*", { count: "exact", head: true }),
    db.from("orders").select("*", { count: "exact", head: true }).eq("order_status", "PENDING"),
    db.from("inventory").select("*", { count: "exact", head: true }).lt("quantity_on_hand", 10),
    db.from("product_reviews").select("*", { count: "exact", head: true }).eq("review_status", "PENDING"),
    db.from("returns").select("*", { count: "exact", head: true }).eq("return_status", "REQUESTED"),
    db
      .from("orders")
      .select("order_code, order_status, subtotal, discount_amount, shipping_fee, total_amount, placed_at")
      .order("placed_at", { ascending: true })
      .limit(5000),
    db
      .from("order_items")
      .select("product_name_snapshot, quantity, line_total")
      .limit(10000),
    db
      .from("orders")
      .select("order_id, order_code, order_status, total_amount, placed_at, profiles(display_name)")
      .order("placed_at", { ascending: false })
      .limit(6),
    db
      .from("inventory")
      .select(
        "inventory_id, quantity_on_hand, quantity_reserved, warehouses(warehouse_name), product_variants(sku, variant_name, products(product_name))",
      )
      .lt("quantity_on_hand", 10)
      .order("quantity_on_hand", { ascending: true })
      .limit(8),
  ]);

  const orderRows = (ordersResult.data ?? []) as {
    order_code: string;
    order_status: string;
    total_amount: number;
    placed_at: string;
  }[];

  const recognised = orderRows.filter((order) =>
    REVENUE_STATUSES.has(String(order.order_status ?? "").toUpperCase()),
  );

  const total = recognised.reduce((sum, order) => sum + Number(order.total_amount || 0), 0);
  const last30Days = recognised
    .filter((order) => new Date(order.placed_at) >= thirtyDaysAgo)
    .reduce((sum, order) => sum + Number(order.total_amount || 0), 0);
  const averageOrder = recognised.length ? total / recognised.length : 0;

  const monthly: { label: string; value: number }[] = [];
  for (let offset = 5; offset >= 0; offset -= 1) {
    const date = new Date(now.getFullYear(), now.getMonth() - offset, 1);
    const key = monthKey(date);
    const value = recognised
      .filter((order) => monthKey(new Date(order.placed_at)) === key)
      .reduce((sum, order) => sum + Number(order.total_amount || 0), 0);
    monthly.push({ label: `Th ${date.getMonth() + 1}/${String(date.getFullYear()).slice(2)}`, value });
  }

  const statusMap = new Map<string, number>();
  for (const order of orderRows) {
    const status = String(order.order_status || "UNKNOWN").toUpperCase();
    statusMap.set(status, (statusMap.get(status) ?? 0) + 1);
  }
  const statusBreakdown = Array.from(statusMap.entries())
    .map(([status, count]) => ({ status, count }))
    .sort((a, b) => b.count - a.count)
    .slice(0, 6);

  const productMap = new Map<string, { quantity: number; revenue: number }>();
  for (const item of (itemsResult.data ?? []) as {
    product_name_snapshot: string;
    quantity: number;
    line_total: number;
  }[]) {
    const name = item.product_name_snapshot || "Không xác định";
    const current = productMap.get(name) ?? { quantity: 0, revenue: 0 };
    current.quantity += Number(item.quantity || 0);
    current.revenue += Number(item.line_total || 0);
    productMap.set(name, current);
  }
  const topProducts = Array.from(productMap.entries())
    .map(([name, value]) => ({ name, ...value }))
    .sort((a, b) => b.revenue - a.revenue)
    .slice(0, 5);

  return {
    counts: {
      products: products.count ?? 0,
      activeProducts: activeProducts.count ?? 0,
      categories: categories.count ?? 0,
      brands: brands.count ?? 0,
      customers: customers.count ?? 0,
      orders: ordersCount.count ?? 0,
      pendingOrders: pendingOrders.count ?? 0,
      lowStock: lowStockCount.count ?? 0,
      pendingReviews: pendingReviews.count ?? 0,
      requestedReturns: requestedReturns.count ?? 0,
    },
    revenue: { total, last30Days, averageOrder, monthly },
    statusBreakdown,
    topProducts,
    recentOrders: (recentOrdersResult.data ?? []) as unknown as RecentOrder[],
    lowStock: (lowStockResult.data ?? []) as unknown as LowStockRow[],
  };
}
