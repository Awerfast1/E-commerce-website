
"use client";

import Link from "next/link";
import { useMemo, useState } from "react";
import { useRouter, useSearchParams } from "next/navigation";

import { products } from "../../data/Products";
import { categories } from "../../data/Categories";

import FilterSidebar from "../components/catalog/Filterbar";
import CatalogToolbar, {
  type SortOption,
} from "../components/catalog/CatalogToolbar";
import ProductCard from "../components/catalog/ProductCard";

export default function SearchContent() {

  // ==========================================
  // URL AND ROUTER
  // ==========================================

  const router = useRouter();
  const searchParams = useSearchParams();
  console.log("Current URL parameters:", searchParams.toString());
  // ==========================================
  // LOCAL STATE
  // Only view mode is not a catalogue filter.
  // ==========================================

  const [viewMode, setViewMode] =
    useState<"grid" | "list">("grid");

  // ==========================================
  // BRANDS
  // ==========================================

  const brands = useMemo(() => {
    return Array.from(
      new Map(
        products.map((product) => [
          product.brand.id,
          product.brand,
        ])
      ).values()
    ).sort((a, b) => a.name.localeCompare(b.name));
  }, []);

  // ==========================================
  // READ FILTERS FROM URL
  // ==========================================

  const search = searchParams.get("search") ?? "";

  const selectedCategories = searchParams
    .getAll("category")
    .map((value) => {
      // Support both category IDs and category names.
      const byId = categories.find(
        (category) => category.id === Number(value)
      );

      const byName = categories.find(
        (category) =>
          category.name.toLowerCase() === value.toLowerCase()
      );

      return byId?.id ?? byName?.id;
    })
    .filter((id): id is number => id !== undefined);

  const selectedBrands = searchParams
    .getAll("brand")
    .map((value) => {
      // Support both brand IDs and brand names.
      const byId = brands.find(
        (brand) => brand.id === Number(value)
      );

      const byName = brands.find(
        (brand) =>
          brand.name.toLowerCase() === value.toLowerCase()
      );

      return byId?.id ?? byName?.id;
    })
    .filter((id): id is number => id !== undefined);

  const priceParam = Number(searchParams.get("maxPrice"));

  const maxPrice =
    Number.isFinite(priceParam) && priceParam > 0
      ? priceParam
      : 3000;

  const validSortOptions: SortOption[] = [
    "featured",
    "price-low",
    "price-high",
    "name",
  ];

  const sortParam = searchParams.get("sort");

  const sortBy: SortOption =
    validSortOptions.includes(sortParam as SortOption)
      ? (sortParam as SortOption)
      : "featured";

  // ==========================================
  // UPDATE URL PARAMETERS
  // ==========================================

  function updateParams(
    updates: Record<string, string | string[] | null>
  ) {
    const params = new URLSearchParams(searchParams.toString());

    Object.entries(updates).forEach(([key, value]) => {
      params.delete(key);

      if (Array.isArray(value)) {
        value.forEach((item) => params.append(key, item));
      } else if (value !== null && value !== "") {
        params.set(key, value);
      }
    });

    const query = params.toString();

    router.replace(
      query ? `/Search?${query}` : "/Search",
      { scroll: false }
    );
  }

  // ==========================================
  // FILTER FUNCTIONS
  // ==========================================

  function toggleCategory(id: number) {
    console.log("TOGGLE CATEGORY RECEIVED:", id);
    const updated = selectedCategories.includes(id)
      ? selectedCategories.filter((item) => item !== id)
      : [...selectedCategories, id];

      console.log("UPDATED CATEGORIES:", updated);

    updateParams({
      category: updated.map(String),
    });
  }

  function toggleBrand(id: number) {
    const updated = selectedBrands.includes(id)
      ? selectedBrands.filter((item) => item !== id)
      : [...selectedBrands, id];

    updateParams({
      brand: updated.map(String),
    });
  }

  function changePrice(price: number) {
    updateParams({
      maxPrice: price >= 3000 ? null : String(price),
    });
  }

  function changeSearch(value: string) {
    updateParams({
      search: value || null,
    });
  }

  function changeSort(value: SortOption) {
    updateParams({
      sort: value === "featured" ? null : value,
    });
  }

  function clearFilters() {
    router.replace("/Search", { scroll: false });
  }

  // ==========================================
  // FILTER AND SORT PRODUCTS
  // ==========================================

  const filteredProducts = useMemo(() => {

    let result = products.filter((product) => {

      const matchesSearch =
        product.name.toLowerCase().includes(search.toLowerCase()) ||
        product.sku.toLowerCase().includes(search.toLowerCase()) ||
        product.brand.name.toLowerCase().includes(search.toLowerCase());

      const matchesCategory =
        selectedCategories.length === 0 ||
        selectedCategories.includes(product.categoryId);

      const matchesBrand =
        selectedBrands.length === 0 ||
        selectedBrands.includes(product.brand.id);

      const matchesPrice =
        product.price <= maxPrice;

      return (
        matchesSearch &&
        matchesCategory &&
        matchesBrand &&
        matchesPrice
      );
    });

    switch (sortBy) {
      case "price-low":
        result.sort((a, b) => a.price - b.price);
        break;

      case "price-high":
        result.sort((a, b) => b.price - a.price);
        break;

      case "name":
        result.sort((a, b) =>
          a.name.localeCompare(b.name)
        );
        break;

      default:
        break;
    }

    return result;

  }, [
    search,
    selectedCategories.join(","),
    selectedBrands.join(","),
    maxPrice,
    sortBy,
  ]);

  // ==========================================
  // PAGE
  // ==========================================

  return (
    <main className="min-h-screen bg-gray-50 py-8">

      <div className="mx-auto max-w-[1500px] px-4 md:px-8">

        {/* Breadcrumb */}
        <div className="mb-6 text-sm text-gray-500">
          <Link href="/" className="hover:text-blue-600">
            Home
          </Link>

          <span className="mx-2">/</span>

          <span className="font-medium text-gray-900">
            Products
          </span>
        </div>

        {/* Heading */}
        <div className="mb-7">
          <h1 className="text-2xl font-bold text-gray-900 md:text-3xl">
            PC Components & Hardware
          </h1>

          <p className="mt-2 text-sm text-gray-500">
            Explore our range of computer components,
            gaming hardware and accessories.
          </p>
        </div>

        {/* Search */}
        <div className="mb-6">
          <input
            type="text"
            value={search}
            onChange={(e) => changeSearch(e.target.value)}
            placeholder="Search products, brands or SKU..."
            className="w-full rounded-lg border border-gray-300 bg-white px-4 py-3 text-sm outline-none transition focus:border-blue-500 focus:ring-2 focus:ring-blue-100"
          />
        </div>

        {/* Main layout */}
        <div className="grid grid-cols-1 gap-6 lg:grid-cols-[240px_minmax(0,1fr)]">

          {/* LEFT SIDEBAR */}
          <FilterSidebar
            categories={categories}
            brands={brands}
            selectedCategories={selectedCategories}
            selectedBrands={selectedBrands}
            maxPrice={maxPrice}
            onCategoryChange={toggleCategory}
            onBrandChange={toggleBrand}
            onPriceChange={changePrice}
            onClearFilters={clearFilters}
          />

          {/* RIGHT PRODUCT SECTION */}
          <section className="min-w-0">

            {/* Toolbar */}
            <CatalogToolbar
              productCount={filteredProducts.length}
              sortBy={sortBy}
              viewMode={viewMode}
              onSortChange={changeSort}
              onViewChange={setViewMode}
            />

            {/* Active filters */}
            {(selectedCategories.length > 0 ||
              selectedBrands.length > 0 ||
              search !== "" ||
              maxPrice < 3000) && (

              <div className="mb-4 flex flex-wrap items-center gap-2">

                <span className="text-xs font-semibold text-gray-500">
                  Active filters:
                </span>

                {selectedCategories.map((id) => {
                  const category = categories.find(
                    (item) => item.id === id
                  );

                  return (
                    <button
                      key={id}
                      onClick={() => toggleCategory(id)}
                      className="rounded-full bg-blue-50 px-3 py-1 text-xs text-blue-700 hover:bg-blue-100"
                    >
                      {category?.name} ×
                    </button>
                  );
                })}

                {selectedBrands.map((id) => {
                  const brand = brands.find(
                    (item) => item.id === id
                  );

                  return (
                    <button
                      key={id}
                      onClick={() => toggleBrand(id)}
                      className="rounded-full bg-blue-50 px-3 py-1 text-xs text-blue-700 hover:bg-blue-100"
                    >
                      {brand?.name} ×
                    </button>
                  );
                })}

                {search && (
                  <button
                    onClick={() => changeSearch("")}
                    className="rounded-full bg-blue-50 px-3 py-1 text-xs text-blue-700"
                  >
                    Search: {search} ×
                  </button>
                )}

                {maxPrice < 3000 && (
                  <button
                    onClick={() => changePrice(3000)}
                    className="rounded-full bg-blue-50 px-3 py-1 text-xs text-blue-700"
                  >
                    Max price ×
                  </button>
                )}

              </div>
            )}

            {/* Product list */}
            {filteredProducts.length > 0 ? (

              <div
                className={
                  viewMode === "grid"
                    ? "grid grid-cols-1 gap-4 sm:grid-cols-2 xl:grid-cols-3 2xl:grid-cols-4"
                    : "flex flex-col gap-4"
                }
              >
                {filteredProducts.map((product) => (
                  <ProductCard
                    key={product.id}
                    product={product}
                    viewMode={viewMode}
                  />
                ))}
              </div>

            ) : (

              <div className="rounded-lg border border-gray-200 bg-white py-20 text-center">

                <h3 className="text-lg font-bold text-gray-900">
                  No products found
                </h3>

                <p className="mt-2 text-sm text-gray-500">
                  Try changing your search or filter options.
                </p>

                <button
                  onClick={clearFilters}
                  className="mt-5 rounded-lg bg-blue-600 px-5 py-2 text-sm font-semibold text-white hover:bg-blue-700"
                >
                  Clear Filters
                </button>

              </div>

            )}

          </section>
        </div>
      </div>
    </main>
  );
}
