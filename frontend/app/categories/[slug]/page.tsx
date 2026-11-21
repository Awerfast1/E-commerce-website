import Link from "next/link";
import LaptopCollection from "../../components/LaptopCollection";
import { Suspense } from "react";
import { notFound } from "next/navigation";
import { products } from "../../../data/Products";
import { quickCategories } from "../../../data/quickCategories";

export function generateStaticParams() {
  return quickCategories.map(category => ({ slug: category.slug }));
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

  const categoryProducts = products.filter(product => product.categoryId === category.id);

  return (
    <main className="w-full flex-1 bg-gray-50 py-10">
      <div className="mx-auto max-w-7xl px-8 md:px-16 lg:px-24">
        <h1 className="mb-8 text-3xl font-bold text-gray-900">{category.label}</h1>
        {categoryProducts.length ? (
          <div className="grid gap-5 sm:grid-cols-2 lg:grid-cols-3">
            {categoryProducts.map(product => (
              <Link key={product.id} href={`/Product/${product.id}`}
                className="rounded-xl border border-gray-200 bg-white p-6 shadow-sm transition hover:border-blue-400 hover:shadow-md">
                <h2 className="text-lg font-semibold text-gray-900">{product.name}</h2>
                <p className="mt-3 text-gray-600">{product.shortDescription}</p>
                <p className="mt-4 font-bold text-[#2585d5]">
                  {new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(product.price)}
                </p>
              </Link>
            ))}
          </div>
        ) : (
          <p className="rounded-xl bg-white p-8 text-gray-600">Sản phẩm trong danh mục này đang được cập nhật.</p>
        )}
      </div>
    </main>
  );
}

export default function CategoryPage(props: { params: Promise<{ slug: string }> }) {
  return (
    <Suspense
      fallback={
        <main className="w-full flex-1 bg-gray-50 py-10">
          <div className="mx-auto max-w-7xl px-8 md:px-16 lg:px-24">
            <p className="text-gray-500">Đang tải danh mục...</p>
          </div>
        </main>
      }
    >
      <CategoryContent {...props} />
    </Suspense>
  );
}
