
"use client";

export type SortOption =
  | "featured"
  | "price-low"
  | "price-high"
  | "name";

interface CatalogToolbarProps {
  productCount: number;
  sortBy: SortOption;
  viewMode: "grid" | "list";
  onSortChange: (value: SortOption) => void;
  onViewChange: (value: "grid" | "list") => void;
}

export default function CatalogToolbar({
  productCount,
  sortBy,
  viewMode,
  onSortChange,
  onViewChange,
}: CatalogToolbarProps) {

  return (
    <div className="mb-4 flex flex-wrap items-center justify-between gap-3 rounded-lg border border-gray-200 bg-white p-4">

      {/* Product count */}
      <div>
        <p className="text-sm font-semibold text-gray-900">
          {productCount} Products
        </p>

        <p className="mt-1 text-xs text-gray-500">
          Showing matching products
        </p>
      </div>

      <div className="flex flex-wrap items-center gap-3">

        {/* Sorting */}
        <div className="flex items-center gap-2">
          <span className="hidden text-xs text-gray-500 sm:block">
            Sort by:
          </span>

          <select
            value={sortBy}
            onChange={(e) => onSortChange(e.target.value as SortOption)}
            className="rounded-md border border-gray-300 bg-white px-3 py-2 text-sm outline-none focus:border-blue-500"
          >
            <option value="featured">Featured</option>
            <option value="price-low">Price: Low to High</option>
            <option value="price-high">Price: High to Low</option>
            <option value="name">Name: A-Z</option>
          </select>
        </div>

        {/* View mode */}
        <div className="flex overflow-hidden rounded-md border border-gray-300">

          <button
            onClick={() => onViewChange("grid")}
            aria-label="Grid view"
            aria-pressed={viewMode === "grid"}
            className={`px-3 py-2 text-lg ${
              viewMode === "grid"
                ? "bg-blue-600 text-white"
                : "bg-white text-gray-600 hover:bg-gray-100"
            }`}
          >
            ▦
          </button>

          <button
            onClick={() => onViewChange("list")}
            aria-label="List view"
            aria-pressed={viewMode === "list"}
            className={`px-3 py-2 text-lg ${
              viewMode === "list"
                ? "bg-blue-600 text-white"
                : "bg-white text-gray-600 hover:bg-gray-100"
            }`}
          >
            ☰
          </button>

        </div>

      </div>
    </div>
  );
}
