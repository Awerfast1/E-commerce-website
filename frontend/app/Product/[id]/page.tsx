
import Link from "next/link";
import { notFound } from "next/navigation";

import { products } from "../../../data/Products";
import { categories } from "../../../data/Categories";

// Generate product routes during the build
export function generateStaticParams() {
  return products.map((product) => ({
    id: String(product.id),
  }));
}

// Format prices
function formatPrice(price: number) {
  return new Intl.NumberFormat("en-US", {
    style: "currency",
    currency: "USD",
  }).format(price);
}

// Product details page
export default async function ProductPage({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  // Get product ID from URL
  const { id } = await params;

  // Find the product
  const product = products.find(
    (item) => item.id === Number(id)
  );

  // Display 404 if product doesn't exist
  if (!product) {
    notFound();
  }

  // Find the product category
  const category = categories.find(
    (item) => item.id === product.categoryId
  );

  return (
    <main className="w-full flex-1 bg-gray-50 py-10">

      <div className="mx-auto max-w-7xl px-8 md:px-16 lg:px-24">

        {/* Breadcrumb navigation */}
        <div className="mb-8 flex flex-wrap items-center gap-2 text-sm text-gray-500">

          <Link href="/" className="hover:text-[#45A0F0]">
            Home
          </Link>

          <span>/</span>

          <Link href="/search" className="hover:text-[#45A0F0]">
            Products
          </Link>

          <span>/</span>

          <span className="text-gray-900">
            {product.name}
          </span>

        </div>

        {/* Main product information */}
        <div className="grid grid-cols-1 gap-10 rounded-2xl border border-gray-200 bg-white p-6 shadow-sm md:grid-cols-2 md:p-10">

          {/* Product image */}
          <div className="relative flex min-h-[350px] items-center justify-center overflow-hidden rounded-xl bg-gray-50 p-6">

            {product.images.length > 0 ? (
              <img
                src={product.images[0]}
                alt={product.name}
                className="max-h-[400px] w-full object-contain"
              />
            ) : (
              <p className="text-gray-400">
                No product image available
              </p>
            )}

          </div>

          {/* Product details */}
          <div className="flex flex-col">

            {/* Category and brand */}
            <p className="mb-2 text-sm font-semibold uppercase tracking-wide text-[#45A0F0]">
              {category?.name ?? "Other"} / {product.brand.name}
            </p>

            {/* Product name */}
            <h1 className="mb-4 text-3xl font-bold text-gray-900">
              {product.name}
            </h1>

            {/* Model number */}
            <p className="mb-4 text-sm text-gray-500">
              Model: {product.modelNumber}
            </p>

            {/* Short description */}
            <p className="mb-6 leading-7 text-gray-600">
              {product.shortDescription}
            </p>

            {/* Product price */}
            <div className="mb-6 border-y border-gray-200 py-5">

              <p className="mb-1 text-sm text-gray-500">
                Price
              </p>

              <p className="text-3xl font-bold text-[#2585D5]">
                {formatPrice(product.price)}
              </p>

            </div>

            {/* Additional product information */}
            <div className="mb-6 space-y-3 text-sm text-gray-600">

              <p>
                <span className="font-semibold text-gray-900">
                  SKU:
                </span>{" "}
                {product.sku}
              </p>

              <p>
                <span className="font-semibold text-gray-900">
                  Brand:
                </span>{" "}
                {product.brand.name}
              </p>

              <p>
                <span className="font-semibold text-gray-900">
                  Category:
                </span>{" "}
                {category?.name ?? "Other"}
              </p>

            </div>

            {/* Temporary shopping action */}
            <Link
              href="/search"
              className="mt-auto block w-full rounded-lg bg-[#45A0F0] px-6 py-3 text-center font-semibold text-white transition hover:bg-[#2585D5]"
            >
              Continue Shopping
            </Link>

          </div>
        </div>

        {/* Product description */}
        <section className="mt-10 rounded-2xl border border-gray-200 bg-white p-6 md:p-10">

          <h2 className="mb-4 text-2xl font-bold text-gray-900">
            Product Description
          </h2>

          <p className="leading-7 text-gray-600">
            {product.longDescription}
          </p>

        </section>

        {/* Technical specifications */}
        <section className="mt-8 rounded-2xl border border-gray-200 bg-white p-6 md:p-10">

          <h2 className="mb-6 text-2xl font-bold text-gray-900">
            Technical Specifications
          </h2>

          <div className="divide-y divide-gray-100">

            {product.specifications.map((specification) => (
              <div
                key={specification.name}
                className="grid grid-cols-2 gap-4 py-4 text-sm"
              >

                <span className="font-semibold text-gray-700">
                  {specification.name}
                </span>

                <span className="text-gray-600">
                  {String(specification.value)}
                  {specification.unit
                    ? ` ${specification.unit}`
                    : ""}
                </span>

              </div>
            ))}

          </div>

        </section>

      </div>
    </main>
  );
}
