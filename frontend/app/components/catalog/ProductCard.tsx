
import Link from "next/link";
import type { Product } from "../../../types/catalog";
import { categories } from "../../../data/Categories";

interface ProductCardProps {
  product: Product;
  viewMode: "grid" | "list";
}

export default function ProductCard({
  product,
  viewMode,
}: ProductCardProps) {

  const category = categories.find(
    (item) => item.id === product.categoryId
  );

  const formatPrice = (price: number) => {
    return new Intl.NumberFormat("en-AU", {
      style: "currency",
      currency: "AUD",
      maximumFractionDigits: 0,
    }).format(price);
  };

  return (
    <Link
      href={`/Product/${product.id}`}
      className={`group overflow-hidden rounded-lg border border-gray-200 bg-white transition hover:border-blue-400 hover:shadow-md ${
        viewMode === "list"
          ? "flex flex-col sm:flex-row"
          : "flex flex-col"
      }`}
    >

      {/* Image */}
      <div
        className={`relative flex items-center justify-center bg-white p-5 ${
          viewMode === "list"
            ? "h-52 w-full shrink-0 sm:w-64"
            : "h-52 w-full"
        }`}
      >

        <span className="absolute left-3 top-3 rounded bg-gray-100 px-2 py-1 text-[10px] font-semibold uppercase text-gray-500">
          {category?.name ?? "Hardware"}
        </span>

        {product.images.length > 0 ? (
          <img
            src={product.images[0]}
            alt={product.name}
            loading="lazy"
            className="h-full w-full object-contain transition duration-300 group-hover:scale-105"
          />
        ) : (
          <p className="text-sm text-gray-300">
            No image available
          </p>
        )}

      </div>

      {/* Product information */}
      <div className="flex flex-1 flex-col border-t border-gray-100 p-4">

        <p className="mb-1 text-xs font-semibold uppercase tracking-wide text-blue-600">
          {product.brand.name}
        </p>

        <h3 className="mb-2 line-clamp-2 min-h-10 text-sm font-bold text-gray-900 group-hover:text-blue-600">
          {product.name}
        </h3>

        <p className="mb-3 line-clamp-2 text-xs leading-5 text-gray-500">
          {product.shortDescription}
        </p>

        {/* Specifications */}
        <div className="mb-4 space-y-1">
          {product.specifications.slice(0, 3).map((spec) => (
            <div
              key={spec.name}
              className="flex justify-between gap-2 text-xs"
            >
              <span className="text-gray-400">
                {spec.name}
              </span>

              <span className="text-right text-gray-600">
                {String(spec.value)}
                {spec.unit ? ` ${spec.unit}` : ""}
              </span>
            </div>
          ))}
        </div>

        {/* Price */}
        <div className="mt-auto border-t border-gray-100 pt-3">

          <p className="text-xs text-gray-400">
            Price
          </p>

          <p className="mt-1 text-xl font-bold text-gray-900">
            {formatPrice(product.price)}
          </p>

          <div className="mt-3 flex items-center justify-between">
            <span className="text-xs text-gray-400">
              SKU: {product.sku}
            </span>

            <span className="text-xs font-semibold text-blue-600">
              View Details →
            </span>
          </div>

        </div>

      </div>
    </Link>
  );
}
