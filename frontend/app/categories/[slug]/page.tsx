import Link from "next/link";
import LaptopCollection from "../../components/LaptopCollection";
import { Suspense } from "react";
import { notFound } from "next/navigation";
import { quickCategories } from "../../../data/quickCategories";
import supabaseProductsRaw from "../../../data/supabaseProducts.json";

interface SupabaseProduct {
  product_id: string;
  category_id: string;
  product_name: string;
  slug: string;
  short_description: string;
  categories?: {
    slug: string;
    category_name: string;
  };
  product_variants?: {
    sku: string;
    price: number;
    compare_at_price: number;
  }[];
}

const supabaseProducts = supabaseProductsRaw as SupabaseProduct[];

export function generateStaticParams() {
  return quickCategories.map(category => ({ slug: category.slug }));
}

function formatVND(amount: number) {
  return new Intl.NumberFormat("vi-VN", { style: "currency", currency: "VND" }).format(amount);
}

async function CategoryContent({
  params,
}: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = await params;
  const category = quickCategories.find(item => item.slug === slug);
  if (!category) notFound();
  if (slug === "laptop") return <LaptopCollection />;

  const categoryProducts = supabaseProducts.filter(
    product => product.categories?.slug === slug
  );

  return (
    <main className="w-full flex-1 bg-gray-50 py-10">
      <div className="mx-auto max-w-7xl px-8 md:px-16 lg:px-24">
        <div className="mb-8">
          <div className="flex items-center gap-2 text-sm text-gray-500 mb-2">
            <Link href="/" className="hover:text-blue-600">Trang chủ</Link>
            <span>/</span>
            <span className="text-gray-900 font-medium">{category.label}</span>
          </div>
          <h1 className="text-3xl font-bold text-gray-900">{category.label}</h1>
          <p className="mt-1 text-gray-500">{category.desc || "Danh mục sản phẩm chính hãng"}</p>
        </div>

        {categoryProducts.length ? (
          <div className="grid gap-5 sm:grid-cols-2 lg:grid-cols-4">
            {categoryProducts.map(product => {
              const variant = product.product_variants?.[0];
              const price = variant?.price || 0;
              const compareAtPrice = variant?.compare_at_price;

              return (
                <div
                  key={product.product_id}
                  className="group flex flex-col justify-between rounded-xl border border-gray-200 bg-white p-5 shadow-sm transition duration-200 hover:-translate-y-1 hover:border-blue-400 hover:shadow-lg"
                >
                  <div>
                    <div className="aspect-square w-full rounded-lg bg-blue-50/50 p-4 flex items-center justify-center mb-4">
                      <span className="text-4xl text-blue-500 font-bold opacity-30 select-none">
                        {category.label.slice(0, 2).toUpperCase()}
                      </span>
                    </div>

                    <p className="text-xs font-semibold text-blue-600 uppercase tracking-wider mb-1">
                      {category.label}
                    </p>
                    <h2 className="text-base font-semibold text-gray-900 line-clamp-2 mb-2 group-hover:text-blue-600 transition">
                      {product.product_name}
                    </h2>
                    <p className="text-xs text-gray-500 line-clamp-2 mb-4">
                      {product.short_description}
                    </p>
                  </div>

                  <div className="border-t border-gray-100 pt-3 mt-auto">
                    {compareAtPrice && compareAtPrice > price && (
                      <p className="text-xs text-gray-400 line-through">
                        {formatVND(compareAtPrice)}
                      </p>
                    )}
                    <p className="text-lg font-bold text-red-600">
                      {formatVND(price)}
                    </p>

                    <div className="mt-3">
                      <span className="inline-block text-xs font-medium text-green-700 bg-green-50 px-2 py-0.5 rounded">
                        Còn hàng
                      </span>
                    </div>
                  </div>
                </div>
              );
            })}
          </div>
        ) : (
          <div className="rounded-xl bg-white p-12 text-center text-gray-600 shadow-sm border border-gray-100">
            <p className="text-lg font-medium">Sản phẩm trong danh mục này đang được cập nhật thêm.</p>
            <Link href="/" className="inline-block mt-4 text-sm font-semibold text-blue-600 hover:underline">
              ← Quay về trang chủ
            </Link>
          </div>
        )}
      </div>
    </main>
  );
}

export default function CategoryPage(props: { params: Promise<{ slug: string }> }) {
  return (
    <Suspense fallback={<div className="min-h-96 w-full flex items-center justify-center text-gray-500">Đang tải danh mục...</div>}>
      <CategoryContent params={props.params} />
    </Suspense>
  );
}
