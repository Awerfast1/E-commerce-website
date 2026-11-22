import Link from "next/link";
import { notFound } from "next/navigation";
import { Metadata } from "next";
import supabaseProductsRaw from "../../../data/supabaseProducts.json";
import { products as dummyProducts } from "../../../data/Products";

interface ProductSpec {
  specification_name: string;
  specification_value: string;
}

interface ProductVariant {
  sku: string;
  price: number;
  compare_at_price: number;
}

interface ProductDetail {
  product_id: string;
  category_id?: string;
  product_name: string;
  slug: string;
  short_description?: string;
  description?: string;
  categories?: {
    slug: string;
    category_name: string;
  };
  brands?: {
    brand_name: string;
  };
  product_images?: {
    image_url: string;
    is_primary: boolean;
  }[];
  product_variants?: ProductVariant[];
  product_specifications?: ProductSpec[];
}

const supabaseProducts = supabaseProductsRaw as ProductDetail[];

// Format giá VNĐ
function formatVND(price: number) {
  return new Intl.NumberFormat("vi-VN", {
    style: "currency",
    currency: "VND",
  }).format(price);
}

// Generate static params cho build Next.js (bao gồm cả ID UUID từ Supabase và legacy number ID)
export function generateStaticParams() {
  const supabaseParams = supabaseProducts.map((p) => ({
    id: p.product_id,
  }));
  const legacyParams = dummyProducts.map((p) => ({
    id: String(p.id),
  }));
  return [...supabaseParams, ...legacyParams];
}

export async function generateMetadata({
  params,
}: {
  params: Promise<{ id: string }>;
}): Promise<Metadata> {
  const { id } = await params;
  const product = supabaseProducts.find((p) => p.product_id === id);
  if (product) {
    return {
      title: `${product.product_name} | ConGears`,
      description: product.short_description || product.description,
    };
  }
  const legacy = dummyProducts.find((p) => String(p.id) === id);
  if (legacy) {
    return {
      title: `${legacy.name} | ConGears`,
      description: legacy.shortDescription,
    };
  }
  return {
    title: "Sản phẩm | ConGears",
  };
}

export default async function ProductDetailPage({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const { id } = await params;

  // 1. Tìm trong database Supabase
  const supabaseProduct = supabaseProducts.find((p) => p.product_id === id);

  if (supabaseProduct) {
    const variant = supabaseProduct.product_variants?.[0];
    const price = variant?.price || 0;
    const compareAtPrice = variant?.compare_at_price || 0;
    const discount =
      compareAtPrice > price
        ? Math.round((1 - price / compareAtPrice) * 100)
        : 0;

    const brandName = supabaseProduct.brands?.brand_name || "Chính hãng";
    const categoryName = supabaseProduct.categories?.category_name || "Phụ kiện";
    const categorySlug = supabaseProduct.categories?.slug || "laptop";

    const primaryImage =
      supabaseProduct.product_images?.find((img) => img.is_primary)?.image_url ||
      supabaseProduct.product_images?.[0]?.image_url ||
      "https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=500&auto=format&fit=crop&q=60";

    return (
      <main className="w-full flex-1 bg-gray-50 py-8" lang="vi">
        <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
          {/* Breadcrumb điều hướng */}
          <nav className="mb-6 flex flex-wrap items-center gap-2 text-sm text-gray-500" aria-label="Đường dẫn">
            <Link href="/" className="hover:text-[#2585D5]">
              Trang chủ
            </Link>
            <span>›</span>
            <Link href={`/categories/${categorySlug}`} className="hover:text-[#2585D5]">
              {categoryName}
            </Link>
            <span>›</span>
            <span className="text-gray-900 font-medium truncate max-w-md">
              {supabaseProduct.product_name}
            </span>
          </nav>

          {/* Khối thông tin chính của sản phẩm */}
          <div className="grid grid-cols-1 gap-10 rounded-2xl border border-gray-200 bg-white p-6 shadow-sm md:grid-cols-2 md:p-10">
            {/* Ảnh sản phẩm */}
            <div className="relative flex min-h-[360px] items-center justify-center overflow-hidden rounded-xl bg-gray-50 p-6 border border-gray-100">
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img
                src={primaryImage}
                alt={supabaseProduct.product_name}
                className="max-h-[380px] w-full object-contain"
              />
            </div>

            {/* Chi tiết sản phẩm */}
            <div className="flex flex-col">
              {/* Thương hiệu & Danh mục */}
              <div className="mb-2 flex items-center gap-2 text-xs font-bold uppercase tracking-wider text-[#2585D5]">
                <span>{brandName}</span>
                <span>•</span>
                <span>{categoryName}</span>
              </div>

              {/* Tên sản phẩm */}
              <h1 className="mb-3 text-2xl sm:text-3xl font-bold text-gray-900 leading-tight">
                {supabaseProduct.product_name}
              </h1>

              {/* Mã sản phẩm */}
              <p className="mb-4 text-xs text-gray-500">
                Mã SP: <span className="font-mono text-gray-700">{variant?.sku || supabaseProduct.slug}</span>
              </p>

              {/* Mô tả ngắn */}
              <p className="mb-6 leading-relaxed text-gray-600 text-sm">
                {supabaseProduct.short_description || "Sản phẩm công nghệ chính hãng phân phối tại ConGears, bảo hành 12-24 tháng đổi mới 1:1."}
              </p>

              {/* Giá bán và Khuyến mãi */}
              <div className="mb-6 rounded-xl bg-gray-50 border border-gray-200/80 p-4">
                <div className="flex items-baseline gap-3">
                  <span className="text-3xl font-extrabold text-[#dc2626]">
                    {formatVND(price)}
                  </span>
                  {discount > 0 && (
                    <>
                      <del className="text-sm font-medium text-gray-400">
                        {formatVND(compareAtPrice)}
                      </del>
                      <span className="rounded bg-red-100 px-2 py-0.5 text-xs font-bold text-red-700">
                        -{discount}%
                      </span>
                    </>
                  )}
                </div>
                <div className="mt-2 flex items-center gap-2 text-xs text-emerald-700 font-semibold">
                  <span>✓ Còn hàng</span>
                  <span>•</span>
                  <span>Giao siêu tốc 2H</span>
                </div>
              </div>

              {/* Thông tin bảo hành & cam kết */}
              <div className="mb-6 space-y-2 text-sm text-gray-600 bg-blue-50/50 p-4 rounded-xl border border-blue-100">
                <div className="flex items-center gap-2">
                  <span className="text-blue-600 font-bold">🛡️ Bảo hành:</span>
                  <span>Chính hãng toàn quốc, đổi mới trong 30 ngày nếu lỗi.</span>
                </div>
                <div className="flex items-center gap-2">
                  <span className="text-blue-600 font-bold">📦 Hộp gồm:</span>
                  <span>Thân máy/phụ kiện, cáp kết nối, sách hướng dẫn sử dụng.</span>
                </div>
              </div>

              {/* Nút thao tác mua hàng */}
              <div className="mt-auto flex flex-col sm:flex-row gap-3">
                <Link
                  href="/gio-hang"
                  className="flex-1 rounded-xl bg-[#dc2626] hover:bg-[#b91c1c] text-white py-3.5 px-6 text-center font-bold transition shadow-sm"
                >
                  MUA NGAY (Giao tận nơi)
                </Link>
                <Link
                  href={`/categories/${categorySlug}`}
                  className="rounded-xl border border-gray-300 hover:bg-gray-100 text-gray-800 py-3.5 px-6 text-center font-semibold transition"
                >
                  Xem thêm {categoryName}
                </Link>
              </div>
            </div>
          </div>

          {/* Mô tả chi tiết */}
          <section className="mt-8 rounded-2xl border border-gray-200 bg-white p-6 md:p-8">
            <h2 className="mb-4 text-xl font-bold text-gray-900">
              Mô tả chi tiết sản phẩm
            </h2>
            <div className="prose max-w-none text-gray-600 leading-relaxed text-sm">
              <p>
                {supabaseProduct.description ||
                  `${supabaseProduct.product_name} là sản phẩm công nghệ cao cấp chính hãng từ ${brandName}. Được thiết kế với độ bền vượt trội, tích hợp công nghệ tiên tiến nhất đáp ứng hoàn hảo nhu cầu sử dụng công việc và giải trí hàng ngày.`}
              </p>
            </div>
          </section>

          {/* Thông số kỹ thuật */}
          {supabaseProduct.product_specifications && supabaseProduct.product_specifications.length > 0 && (
            <section className="mt-8 rounded-2xl border border-gray-200 bg-white p-6 md:p-8">
              <h2 className="mb-6 text-xl font-bold text-gray-900">
                Thông số kỹ thuật
              </h2>
              <div className="divide-y divide-gray-100 border-t border-gray-100">
                {supabaseProduct.product_specifications.map((spec, index) => (
                  <div
                    key={index}
                    className="grid grid-cols-1 sm:grid-cols-3 gap-2 sm:gap-4 py-3.5 text-sm"
                  >
                    <span className="font-medium text-gray-500">
                      {spec.specification_name}
                    </span>
                    <span className="sm:col-span-2 font-semibold text-gray-800">
                      {spec.specification_value}
                    </span>
                  </div>
                ))}
              </div>
            </section>
          )}
        </div>
      </main>
    );
  }

  // 2. Fallback cho legacy dummy products (ID: 101, 102)
  const legacy = dummyProducts.find((item) => String(item.id) === id);
  if (!legacy) {
    notFound();
  }

  return (
    <main className="w-full flex-1 bg-gray-50 py-10" lang="vi">
      <div className="mx-auto max-w-7xl px-8 md:px-16 lg:px-24">
        <div className="mb-8 flex flex-wrap items-center gap-2 text-sm text-gray-500">
          <Link href="/" className="hover:text-[#45A0F0]">
            Trang chủ
          </Link>
          <span>/</span>
          <span className="text-gray-900">{legacy.name}</span>
        </div>

        <div className="grid grid-cols-1 gap-10 rounded-2xl border border-gray-200 bg-white p-6 shadow-sm md:grid-cols-2 md:p-10">
          <div className="relative flex min-h-[350px] items-center justify-center overflow-hidden rounded-xl bg-gray-50 p-6">
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img
              src={legacy.images[0] || "https://placehold.co/800x800"}
              alt={legacy.name}
              className="max-h-[400px] w-full object-contain"
            />
          </div>

          <div className="flex flex-col">
            <p className="mb-2 text-sm font-semibold uppercase tracking-wide text-[#45A0F0]">
              {legacy.brand.name}
            </p>
            <h1 className="mb-4 text-3xl font-bold text-gray-900">{legacy.name}</h1>
            <p className="mb-4 text-sm text-gray-500">Model: {legacy.modelNumber}</p>
            <p className="mb-6 leading-7 text-gray-600">{legacy.shortDescription}</p>
            <div className="mb-6 border-y border-gray-200 py-5">
              <p className="text-3xl font-bold text-[#2585D5]">{formatVND(legacy.price * 25000)}</p>
            </div>
            <Link
              href="/"
              className="mt-auto block w-full rounded-lg bg-[#45A0F0] px-6 py-3 text-center font-semibold text-white transition hover:bg-[#2585D5]"
            >
              Về trang chủ
            </Link>
          </div>
        </div>
      </div>
    </main>
  );
}
