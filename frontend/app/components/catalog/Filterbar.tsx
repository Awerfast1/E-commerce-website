"use client";

interface Category {
  id: number;
  name: string;
}

interface Brand {
  id: number;
  name: string;
}

interface FilterSidebarProps {
  categories: Category[];
  brands: Brand[];
  selectedCategories: number[];
  selectedBrands: number[];
  maxPrice: number;
  onCategoryChange: (id: number) => void;
  onBrandChange: (id: number) => void;
  onPriceChange: (price: number) => void;
  onClearFilters: () => void;
}

export default function FilterSidebar({
  categories,
  brands,
  selectedCategories,
  selectedBrands,
  maxPrice,
  onCategoryChange,
  onBrandChange,
  onPriceChange,
  onClearFilters,
}: FilterSidebarProps) {


  console.log("The filter is running");
  return (
    <aside className="h-fit rounded-lg border border-gray-200 bg-white">

      {/* Header */}
      <div className="flex items-center justify-between border-b border-gray-200 px-4 py-4">
        <h2 className="font-bold text-gray-900">
          Filters
        </h2>

        <button
          onClick={onClearFilters}
          className="text-xs font-semibold text-blue-600 hover:text-blue-800"
        >
          Clear all
        </button>
      </div>

      <div className="space-y-5 p-4">

        {/* Categories */}
        <section>
          <h3 className="mb-3 text-sm font-bold text-gray-900">
            Categories
          </h3>

          <div className="max-h-64 space-y-2 overflow-y-auto">
            {categories.map((category) => (
              <label
                key={category.id}
                  onClick={() => {
                    console.log("LABEL CLICKED:", category.name);}}
                className="flex cursor-pointer items-center gap-2 text-sm text-gray-600 hover:text-blue-600"
              >
                <input
                  type="checkbox"
                  checked={selectedCategories.includes(category.id)}
                    onClick={() => {
                      console.log("CHECKBOX CLICKED:", category.name);
                    }}
                  onChange={() => {
                    console.log("Category clicked:", category.name, category.id);
                    onCategoryChange(category.id);
                  }}
                  className="h-4 w-4 accent-blue-600"
                />

                {category.name}
              </label>
            ))}
          </div>
        </section>

        <div className="border-t border-gray-100" />

        {/* Brands */}
        <section>
          <h3 className="mb-3 text-sm font-bold text-gray-900">
            Brands
          </h3>

          <div className="max-h-52 space-y-2 overflow-y-auto">
            {brands.map((brand) => (
              <label
                key={brand.id}
                className="flex cursor-pointer items-center gap-2 text-sm text-gray-600 hover:text-blue-600"
              >
                <input
                  type="checkbox"
                  checked={selectedBrands.includes(brand.id)}
                  onChange={() => onBrandChange(brand.id)}
                  className="h-4 w-4 accent-blue-600"
                />

                {brand.name}
              </label>
            ))}
          </div>
        </section>

        <div className="border-t border-gray-100" />

        {/* Price */}
        <section>
          <h3 className="mb-3 text-sm font-bold text-gray-900">
            Price Range
          </h3>

          <div className="mb-3 flex justify-between text-xs text-gray-500">
            <span>$0</span>
            <span>$3,000+</span>
          </div>

          <input
            type="range"
            min="0"
            max="3000"
            step="50"
            value={maxPrice}
            onChange={(e) => onPriceChange(Number(e.target.value))}
            className="w-full cursor-pointer accent-blue-600"
          />

          <p className="mt-3 rounded-md bg-gray-50 px-3 py-2 text-sm text-gray-700">
            Maximum price:{" "}
            <strong>
              {new Intl.NumberFormat("en-AU", {
                style: "currency",
                currency: "AUD",
                maximumFractionDigits: 0,
              }).format(maxPrice)}
            </strong>
          </p>
        </section>

      </div>
    </aside>
  );
}
