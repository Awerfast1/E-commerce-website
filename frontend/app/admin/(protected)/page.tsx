import Link from "next/link";
import { connection } from "next/server";
import { Suspense } from "react";

import AdminIcon from "../AdminIcon";
import { formatCurrency, formatDate, formatNumber, statusTone } from "@/lib/admin/format";
import { getDashboardData, type DashboardData } from "@/lib/admin/dashboard";
import { tableHref } from "@/lib/admin/config";

export const instant = false;

export default function DashboardPage() {
  return (
    <Suspense fallback={<DashboardSkeleton />}>
      <DashboardContent />
    </Suspense>
  );
}

async function DashboardContent() {
  await connection();
  const data = await getDashboardData();
  return <DashboardView data={data} />;
}

function StatCard({
  label,
  value,
  hint,
  icon,
  tone = "slate",
  href,
}: {
  label: string;
  value: string;
  hint?: string;
  icon: string;
  tone?: "slate" | "emerald" | "blue" | "amber" | "rose" | "violet";
  href?: string;
}) {
  const tones: Record<string, string> = {
    slate: "bg-slate-900 text-white",
    emerald: "bg-emerald-50 text-emerald-700",
    blue: "bg-blue-50 text-blue-700",
    amber: "bg-amber-50 text-amber-700",
    rose: "bg-rose-50 text-rose-700",
    violet: "bg-violet-50 text-violet-700",
  };

  const body = (
    <div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm transition hover:border-slate-300 hover:shadow">
      <div className="flex items-start justify-between gap-3">
        <div>
          <p className="text-xs font-semibold uppercase tracking-wider text-slate-500">{label}</p>
          <p className="mt-2 text-2xl font-bold tracking-tight text-slate-900">{value}</p>
          {hint && <p className="mt-1 text-xs text-slate-500">{hint}</p>}
        </div>
        <span className={`grid h-11 w-11 shrink-0 place-items-center rounded-xl ${tones[tone]}`}>
          <AdminIcon name={icon} />
        </span>
      </div>
    </div>
  );

  return href ? <Link href={href}>{body}</Link> : body;
}

function RevenueChart({ monthly }: { monthly: DashboardData["revenue"]["monthly"] }) {
  const width = 720;
  const height = 200;
  const padding = { top: 16, right: 16, bottom: 28, left: 16 };
  const max = Math.max(...monthly.map((item) => item.value), 1);
  const innerWidth = width - padding.left - padding.right;
  const innerHeight = height - padding.top - padding.bottom;
  const step = monthly.length > 1 ? innerWidth / (monthly.length - 1) : innerWidth;

  const points = monthly.map((item, index) => {
    const x = padding.left + step * index;
    const y = padding.top + innerHeight - (item.value / max) * innerHeight;
    return { x, y, ...item };
  });

  const line = points.map((point) => `${point.x},${point.y}`).join(" ");
  const area = `${padding.left},${padding.top + innerHeight} ${line} ${padding.left + innerWidth},${padding.top + innerHeight}`;

  return (
    <div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm lg:col-span-2">
      <div className="flex flex-wrap items-center justify-between gap-2">
        <div>
          <h2 className="font-semibold text-slate-900">Doanh thu 6 tháng gần nhất</h2>
          <p className="text-xs text-slate-500">Chỉ tính các đơn đã xác nhận / đã giao / hoàn tất.</p>
        </div>
        <span className="rounded-full bg-emerald-50 px-3 py-1 text-xs font-semibold text-emerald-700">
          Tổng: {formatCurrency(monthly.reduce((sum, item) => sum + item.value, 0))}
        </span>
      </div>

      <div className="mt-4 overflow-hidden">
        <svg viewBox={`0 0 ${width} ${height}`} className="h-52 w-full" role="img" aria-label="Biểu đồ doanh thu 6 tháng">
          <defs>
            <linearGradient id="revenueFill" x1="0" y1="0" x2="0" y2="1">
              <stop offset="0%" stopColor="#10b981" stopOpacity="0.35" />
              <stop offset="100%" stopColor="#10b981" stopOpacity="0" />
            </linearGradient>
          </defs>
          {[0.25, 0.5, 0.75, 1].map((ratio) => (
            <line
              key={ratio}
              x1={padding.left}
              x2={width - padding.right}
              y1={padding.top + innerHeight * ratio}
              y2={padding.top + innerHeight * ratio}
              stroke="#e2e8f0"
              strokeDasharray="4 6"
            />
          ))}
          <polygon points={area} fill="url(#revenueFill)" />
          <polyline points={line} fill="none" stroke="#059669" strokeWidth={3} strokeLinejoin="round" strokeLinecap="round" />
          {points.map((point) => (
            <g key={point.label}>
              <circle cx={point.x} cy={point.y} r={4.5} fill="#ffffff" stroke="#059669" strokeWidth={2.5} />
              <text x={point.x} y={height - 8} textAnchor="middle" className="fill-slate-500 text-[11px]">
                {point.label}
              </text>
            </g>
          ))}
        </svg>
      </div>
    </div>
  );
}

function StatusBreakdown({ data }: { data: DashboardData["statusBreakdown"] }) {
  const total = data.reduce((sum, item) => sum + item.count, 0) || 1;

  return (
    <div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
      <h2 className="font-semibold text-slate-900">Trạng thái đơn hàng</h2>
      <p className="text-xs text-slate-500">Phân bổ toàn bộ đơn hiện có.</p>

      {data.length === 0 ? (
        <p className="mt-6 rounded-xl bg-slate-50 p-4 text-sm text-slate-500">Chưa có đơn hàng nào.</p>
      ) : (
        <div className="mt-4 space-y-3">
          {data.map((item) => (
            <div key={item.status}>
              <div className="mb-1 flex items-center justify-between text-xs">
                <span className="font-medium text-slate-700">{item.status}</span>
                <span className="text-slate-500">
                  {formatNumber(item.count)} · {Math.round((item.count / total) * 100)}%
                </span>
              </div>
              <div className="h-2 overflow-hidden rounded-full bg-slate-100">
                <div
                  className="h-full rounded-full bg-gradient-to-r from-emerald-400 to-emerald-600"
                  style={{ width: `${Math.max(4, (item.count / total) * 100)}%` }}
                />
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}

function TopProducts({ products }: { products: DashboardData["topProducts"] }) {
  const max = Math.max(...products.map((item) => item.revenue), 1);

  return (
    <div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="font-semibold text-slate-900">Sản phẩm bán chạy</h2>
          <p className="text-xs text-slate-500">Xếp theo doanh thu từ chi tiết đơn hàng.</p>
        </div>
        <Link href={tableHref("order_items")} className="text-xs font-semibold text-emerald-700 hover:underline">
          Xem tất cả
        </Link>
      </div>

      {products.length === 0 ? (
        <p className="mt-6 rounded-xl bg-slate-50 p-4 text-sm text-slate-500">Chưa có dữ liệu bán hàng.</p>
      ) : (
        <div className="mt-4 space-y-4">
          {products.map((product, index) => (
            <div key={product.name}>
              <div className="flex items-start justify-between gap-3">
                <p className="line-clamp-1 text-sm font-medium text-slate-800">
                  <span className="mr-2 inline-grid h-5 w-5 place-items-center rounded bg-slate-100 text-[10px] font-bold text-slate-500">
                    {index + 1}
                  </span>
                  {product.name}
                </p>
                <span className="shrink-0 text-sm font-semibold text-slate-900">{formatCurrency(product.revenue)}</span>
              </div>
              <div className="mt-1.5 h-1.5 overflow-hidden rounded-full bg-slate-100">
                <div
                  className="h-full rounded-full bg-gradient-to-r from-blue-400 to-blue-600"
                  style={{ width: `${Math.max(4, (product.revenue / max) * 100)}%` }}
                />
              </div>
              <p className="mt-1 text-[11px] text-slate-500">Đã bán {formatNumber(product.quantity)} sản phẩm</p>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}

function RecentOrders({ orders }: { orders: DashboardData["recentOrders"] }) {
  return (
    <div className="rounded-2xl border border-slate-200 bg-white shadow-sm lg:col-span-2">
      <div className="flex items-center justify-between border-b border-slate-100 px-5 py-4">
        <div>
          <h2 className="font-semibold text-slate-900">Đơn hàng gần đây</h2>
          <p className="text-xs text-slate-500">6 đơn mới nhất trong hệ thống.</p>
        </div>
        <Link href={tableHref("orders")} className="text-xs font-semibold text-emerald-700 hover:underline">
          Quản lý đơn hàng
        </Link>
      </div>

      {orders.length === 0 ? (
        <p className="p-5 text-sm text-slate-500">Chưa có đơn hàng nào.</p>
      ) : (
        <div className="overflow-x-auto">
          <table className="w-full text-left text-sm">
            <thead className="bg-slate-50 text-xs uppercase tracking-wide text-slate-500">
              <tr>
                <th className="px-5 py-3 font-semibold">Mã đơn</th>
                <th className="px-5 py-3 font-semibold">Khách hàng</th>
                <th className="px-5 py-3 font-semibold">Trạng thái</th>
                <th className="px-5 py-3 text-right font-semibold">Tổng tiền</th>
                <th className="px-5 py-3 font-semibold">Thời gian</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {orders.map((order) => (
                <tr key={order.order_id} className="hover:bg-slate-50/70">
                  <td className="px-5 py-3 font-semibold text-slate-900">
                    <Link href={`${tableHref("orders")}/${order.order_id}`} className="hover:text-emerald-700">
                      {order.order_code}
                    </Link>
                  </td>
                  <td className="px-5 py-3 text-slate-600">{order.profiles?.display_name || "—"}</td>
                  <td className="px-5 py-3">
                    <span className={`inline-flex rounded-full px-2.5 py-1 text-[11px] font-semibold ring-1 ring-inset ${statusTone(order.order_status)}`}>
                      {order.order_status}
                    </span>
                  </td>
                  <td className="px-5 py-3 text-right font-semibold text-slate-900">{formatCurrency(order.total_amount)}</td>
                  <td className="px-5 py-3 text-slate-500">{formatDate(order.placed_at, true)}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
}

function LowStock({ rows }: { rows: DashboardData["lowStock"] }) {
  return (
    <div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="font-semibold text-slate-900">Sắp hết hàng</h2>
          <p className="text-xs text-slate-500">Tồn thực tế dưới 10 sản phẩm.</p>
        </div>
        <Link href={tableHref("inventory")} className="text-xs font-semibold text-emerald-700 hover:underline">
          Xem kho
        </Link>
      </div>

      {rows.length === 0 ? (
        <p className="mt-6 rounded-xl bg-slate-50 p-4 text-sm text-slate-500">Không có mặt hàng nào sắp hết.</p>
      ) : (
        <div className="mt-4 space-y-3">
          {rows.map((row) => {
            const variant = Array.isArray(row.product_variants) ? row.product_variants[0] : row.product_variants;
            const product = Array.isArray(variant?.products) ? variant?.products[0] : variant?.products;
            return (
              <div key={row.inventory_id} className="flex items-start justify-between gap-3 rounded-xl bg-slate-50 p-3">
                <div className="min-w-0">
                  <p className="line-clamp-1 text-sm font-medium text-slate-800">{product?.product_name || "—"}</p>
                  <p className="text-[11px] text-slate-500">
                    {variant?.sku || "—"} · {row.warehouses?.warehouse_name || "—"}
                  </p>
                </div>
                <span
                  className={`shrink-0 rounded-full px-2.5 py-1 text-xs font-bold ring-1 ring-inset ${
                    row.quantity_on_hand <= 0
                      ? "bg-rose-50 text-rose-700 ring-rose-200"
                      : "bg-amber-50 text-amber-700 ring-amber-200"
                  }`}
                >
                  {formatNumber(row.quantity_on_hand)}
                </span>
              </div>
            );
          })}
        </div>
      )}
    </div>
  );
}

function DashboardView({ data }: { data: DashboardData }) {
  const { counts, revenue } = data;

  return (
    <div className="space-y-6">
      <div className="flex flex-wrap items-end justify-between gap-3">
        <div>
          <p className="text-xs font-bold uppercase tracking-[0.2em] text-emerald-600">Tổng quan</p>
          <h1 className="mt-1 text-2xl font-bold tracking-tight text-slate-900 lg:text-3xl">
            Chào mừng trở lại 👋
          </h1>
          <p className="mt-1 text-sm text-slate-500">
            Theo dõi hoạt động kinh doanh và dữ liệu cửa hàng ConGears.
          </p>
        </div>
        <div className="flex gap-2">
          <Link
            href={`${tableHref("products")}/new`}
            className="inline-flex items-center gap-2 rounded-xl bg-slate-950 px-4 py-2.5 text-sm font-semibold text-white transition hover:bg-slate-800"
          >
            <AdminIcon name="plus" className="h-4 w-4" />
            Thêm sản phẩm
          </Link>
          <Link
            href={tableHref("orders")}
            className="inline-flex items-center gap-2 rounded-xl border border-slate-200 bg-white px-4 py-2.5 text-sm font-semibold text-slate-700 transition hover:border-slate-300"
          >
            <AdminIcon name="receipt" className="h-4 w-4" />
            Đơn hàng
          </Link>
        </div>
      </div>

      <div className="grid gap-4 sm:grid-cols-2 xl:grid-cols-4">
        <StatCard
          label="Doanh thu"
          value={formatCurrency(revenue.total)}
          hint={`30 ngày: ${formatCurrency(revenue.last30Days)}`}
          icon="trend"
          tone="slate"
        />
        <StatCard
          label="Đơn hàng"
          value={formatNumber(counts.orders)}
          hint={`${formatNumber(counts.pendingOrders)} đơn chờ xác nhận`}
          icon="receipt"
          tone="blue"
          href={tableHref("orders")}
        />
        <StatCard
          label="Khách hàng"
          value={formatNumber(counts.customers)}
          hint="Tài khoản trong hệ thống"
          icon="users"
          tone="violet"
          href={tableHref("profiles")}
        />
        <StatCard
          label="Sản phẩm"
          value={formatNumber(counts.products)}
          hint={`${formatNumber(counts.activeProducts)} đang hiển thị`}
          icon="box"
          tone="emerald"
          href={tableHref("products")}
        />
      </div>

      <div className="grid gap-4 sm:grid-cols-2 xl:grid-cols-4">
        <StatCard
          label="Giá trị đơn TB"
          value={formatCurrency(revenue.averageOrder)}
          hint="Trên các đơn đã ghi nhận"
          icon="card"
          tone="blue"
        />
        <StatCard
          label="Tồn kho thấp"
          value={formatNumber(counts.lowStock)}
          hint="Mặt hàng dưới 10 sản phẩm"
          icon="warehouse"
          tone="amber"
          href={tableHref("inventory")}
        />
        <StatCard
          label="Đánh giá chờ duyệt"
          value={formatNumber(counts.pendingReviews)}
          hint="Cần kiểm duyệt nội dung"
          icon="star"
          tone="violet"
          href={tableHref("product_reviews")}
        />
        <StatCard
          label="Yêu cầu trả hàng"
          value={formatNumber(counts.requestedReturns)}
          hint="Đang chờ xử lý"
          icon="rotate"
          tone="rose"
          href={tableHref("returns")}
        />
      </div>

      <div className="grid gap-4 lg:grid-cols-3">
        <RevenueChart monthly={revenue.monthly} />
        <StatusBreakdown data={data.statusBreakdown} />
      </div>

      <div className="grid gap-4 lg:grid-cols-3">
        <TopProducts products={data.topProducts} />
        <LowStock rows={data.lowStock} />
        <div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
          <h2 className="font-semibold text-slate-900">Danh mục & thương hiệu</h2>
          <p className="text-xs text-slate-500">Cấu trúc catalog hiện tại.</p>
          <div className="mt-4 space-y-3">
            <Link
              href={tableHref("categories")}
              className="flex items-center justify-between rounded-xl bg-slate-50 px-4 py-3 transition hover:bg-slate-100"
            >
              <span className="flex items-center gap-3 text-sm font-medium text-slate-700">
                <AdminIcon name="folder" className="h-4 w-4 text-slate-400" />
                Danh mục
              </span>
              <span className="text-sm font-bold text-slate-900">{formatNumber(counts.categories)}</span>
            </Link>
            <Link
              href={tableHref("brands")}
              className="flex items-center justify-between rounded-xl bg-slate-50 px-4 py-3 transition hover:bg-slate-100"
            >
              <span className="flex items-center gap-3 text-sm font-medium text-slate-700">
                <AdminIcon name="tag" className="h-4 w-4 text-slate-400" />
                Thương hiệu
              </span>
              <span className="text-sm font-bold text-slate-900">{formatNumber(counts.brands)}</span>
            </Link>
            <Link
              href={tableHref("product_variants")}
              className="flex items-center justify-between rounded-xl bg-slate-50 px-4 py-3 transition hover:bg-slate-100"
            >
              <span className="flex items-center gap-3 text-sm font-medium text-slate-700">
                <AdminIcon name="layers" className="h-4 w-4 text-slate-400" />
                Phiên bản & giá
              </span>
              <span className="text-sm font-bold text-slate-900">Quản lý</span>
            </Link>
            <Link
              href={tableHref("product_images")}
              className="flex items-center justify-between rounded-xl bg-slate-50 px-4 py-3 transition hover:bg-slate-100"
            >
              <span className="flex items-center gap-3 text-sm font-medium text-slate-700">
                <AdminIcon name="image" className="h-4 w-4 text-slate-400" />
                Hình ảnh sản phẩm
              </span>
              <span className="text-sm font-bold text-slate-900">Quản lý</span>
            </Link>
          </div>
        </div>
      </div>

      <div className="grid gap-4 lg:grid-cols-3">
        <RecentOrders orders={data.recentOrders} />
        <div className="rounded-2xl border border-slate-200 bg-gradient-to-br from-slate-950 to-slate-800 p-5 text-white shadow-sm">
          <p className="text-xs font-semibold uppercase tracking-widest text-emerald-400">Gợi ý vận hành</p>
          <h2 className="mt-2 text-lg font-bold">Kiểm tra kho & đơn chờ</h2>
          <p className="mt-1 text-sm text-slate-300">
            Ưu tiên xử lý {formatNumber(counts.pendingOrders)} đơn đang chờ và {formatNumber(counts.lowStock)} mặt hàng sắp hết.
          </p>
          <div className="mt-4 space-y-2">
            <Link
              href={tableHref("orders")}
              className="flex items-center justify-between rounded-xl bg-white/10 px-4 py-3 text-sm font-medium transition hover:bg-white/15"
            >
              Đơn chờ xác nhận
              <span className="font-bold text-emerald-300">{formatNumber(counts.pendingOrders)}</span>
            </Link>
            <Link
              href={tableHref("shipments")}
              className="flex items-center justify-between rounded-xl bg-white/10 px-4 py-3 text-sm font-medium transition hover:bg-white/15"
            >
              Vận đơn cần theo dõi
              <AdminIcon name="arrow" className="h-4 w-4 text-slate-300" />
            </Link>
            <Link
              href={tableHref("product_reviews")}
              className="flex items-center justify-between rounded-xl bg-white/10 px-4 py-3 text-sm font-medium transition hover:bg-white/15"
            >
              Đánh giá chờ duyệt
              <span className="font-bold text-emerald-300">{formatNumber(counts.pendingReviews)}</span>
            </Link>
          </div>
        </div>
      </div>
    </div>
  );
}

function DashboardSkeleton() {
  return (
    <div className="space-y-6">
      <div className="h-20 animate-pulse rounded-2xl bg-white/70" />
      <div className="grid gap-4 sm:grid-cols-2 xl:grid-cols-4">
        {Array.from({ length: 4 }, (_, index) => (
          <div key={index} className="h-32 animate-pulse rounded-2xl bg-white/70" />
        ))}
      </div>
      <div className="grid gap-4 lg:grid-cols-3">
        <div className="h-72 animate-pulse rounded-2xl bg-white/70 lg:col-span-2" />
        <div className="h-72 animate-pulse rounded-2xl bg-white/70" />
      </div>
    </div>
  );
}
