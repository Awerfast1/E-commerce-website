"use client";

import Link from "next/link";
import { useSearchParams } from "next/navigation";
import { useState } from "react";
import css from "./LaptopCollection.module.css";
import type { QuickCategory } from "../../data/quickCategories";
import { categoryFilterDefinitions } from "../../data/categoryFilterDefinitions";

export interface CatalogProduct {
  product_id: string;
  category_id: string;
  brand_id?: string;
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
  product_variants?: {
    sku: string;
    price: number;
    compare_at_price: number;
  }[];
  product_specifications?: {
    specification_name: string;
    specification_value: string;
  }[];
}

function money(amount: number) {
  return new Intl.NumberFormat("vi-VN", { style: "currency", currency: "VND" }).format(amount);
}

function CategoryIllustration({ categorySlug, index }: { categorySlug: string; index: number }) {
  const colors = [
    { bg: "#eff6ff", stroke: "#2563eb" },
    { bg: "#f0fdf4", stroke: "#16a34a" },
    { bg: "#faf5ff", stroke: "#9333ea" },
    { bg: "#fff7ed", stroke: "#ea580c" },
    { bg: "#fdf2f8", stroke: "#db2777" },
  ];
  const theme = colors[index % colors.length];

  return (
    <svg viewBox="0 0 160 120" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
      <rect width="160" height="120" rx="8" fill={theme.bg} />
      {categorySlug === "keyboards" && (
        <g stroke={theme.stroke} strokeWidth="3" strokeLinecap="round" strokeLinejoin="round">
          <rect x="25" y="35" width="110" height="50" rx="6" />
          <path d="M40 48h8m12 0h8m12 0h8m12 0h8M40 60h8m12 0h8m12 0h8m12 0h8M50 72h60" />
        </g>
      )}
      {categorySlug === "mice" && (
        <g stroke={theme.stroke} strokeWidth="3" strokeLinecap="round" strokeLinejoin="round">
          <rect x="55" y="25" width="50" height="70" rx="25" />
          <line x1="80" y1="25" x2="80" y2="55" />
          <line x1="55" y1="50" x2="105" y2="50" />
        </g>
      )}
      {categorySlug === "headphones" && (
        <g stroke={theme.stroke} strokeWidth="3" strokeLinecap="round" strokeLinejoin="round">
          <path d="M45 65v-15a35 35 0 0 1 70 0v15" />
          <rect x="38" y="60" width="14" height="28" rx="7" />
          <rect x="108" y="60" width="14" height="28" rx="7" />
        </g>
      )}
      {categorySlug === "speakers" && (
        <g stroke={theme.stroke} strokeWidth="3" strokeLinecap="round" strokeLinejoin="round">
          <rect x="50" y="20" width="60" height="80" rx="8" />
          <circle cx="80" cy="42" r="8" />
          <circle cx="80" cy="72" r="15" />
          <circle cx="80" cy="72" r="5" />
        </g>
      )}
      {categorySlug === "storage" && (
        <g stroke={theme.stroke} strokeWidth="3" strokeLinecap="round" strokeLinejoin="round">
          <rect x="35" y="30" width="90" height="60" rx="8" />
          <path d="M50 45h60M50 60h40m15 15h5" />
          <circle cx="108" cy="75" r="3" fill={theme.stroke} />
        </g>
      )}
      {categorySlug === "chargers" && (
        <g stroke={theme.stroke} strokeWidth="3" strokeLinecap="round" strokeLinejoin="round">
          <rect x="50" y="35" width="60" height="55" rx="10" />
          <path d="M65 20v15m30-15v15" />
          <path d="M80 50l-6 12h12l-6 12" />
        </g>
      )}
      {categorySlug === "cables" && (
        <g stroke={theme.stroke} strokeWidth="3" strokeLinecap="round" strokeLinejoin="round">
          <path d="M35 85c25-15 30-50 55-50s20 25 35 25" />
          <rect x="25" y="80" width="14" height="18" rx="3" />
          <rect x="120" y="50" width="14" height="18" rx="3" />
        </g>
      )}
      {categorySlug === "power-banks" && (
        <g stroke={theme.stroke} strokeWidth="3" strokeLinecap="round" strokeLinejoin="round">
          <rect x="50" y="25" width="60" height="70" rx="8" />
          <rect x="65" y="18" width="30" height="7" rx="2" />
          <path d="M80 45l-5 11h10l-5 11" />
          <circle cx="65" cy="80" r="2.5" fill={theme.stroke} />
          <circle cx="80" cy="80" r="2.5" fill={theme.stroke} />
          <circle cx="95" cy="80" r="2.5" fill={theme.stroke} />
        </g>
      )}
      {categorySlug === "hubs-adapters" && (
        <g stroke={theme.stroke} strokeWidth="3" strokeLinecap="round" strokeLinejoin="round">
          <rect x="50" y="25" width="60" height="70" rx="10" />
          <line x1="80" y1="95" x2="80" y2="108" />
          <circle cx="80" cy="108" r="3" />
          <path d="M40 40h10m-10 20h10m-10 20h10" />
        </g>
      )}
      {categorySlug === "stands-mounts" && (
        <g stroke={theme.stroke} strokeWidth="3" strokeLinecap="round" strokeLinejoin="round">
          <path d="M40 95l25-50 20 20 30-15" />
          <path d="M30 100h100" />
          <rect x="60" y="25" width="35" height="48" rx="4" transform="rotate(-15 77 49)" />
        </g>
      )}
      {categorySlug === "phone-cases" && (
        <g stroke={theme.stroke} strokeWidth="3" strokeLinecap="round" strokeLinejoin="round">
          <rect x="52" y="18" width="56" height="84" rx="12" />
          <rect x="62" y="28" width="20" height="26" rx="5" />
          <circle cx="72" cy="41" r="5" />
        </g>
      )}
    </svg>
  );
}

export default function GenericCategoryCollection({
  category,
  products,
}: {
  category: QuickCategory;
  products: CatalogProduct[];
}) {
  const searchParams = useSearchParams();
  const brandParam = searchParams.get("brand") || "";
  const minParam = searchParams.get("min") || "";
  const maxParam = searchParams.get("max") || "";

  // Lấy bộ định nghĩa bộ lọc chuẩn GearVN cho danh mục này
  const gearvnFilters = categoryFilterDefinitions[category.slug] || [
    {
      key: "Khoảng giá",
      options: ["Dưới 300.000đ", "Từ 300.000đ - 600.000đ", "Từ 600.000đ - 1.2 triệu", "Trên 1.2 triệu"],
    },
    {
      key: "Thương hiệu",
      options: Array.from(new Set(products.map(p => p.brands?.brand_name).filter(Boolean) as string[])),
    },
  ];

  // Giá trị bộ lọc khởi tạo từ query params
  const initialFilters: Record<string, string> = {};
  if (brandParam) {
    const brandCriteria = gearvnFilters.find(f => f.key === "Thương hiệu");
    if (brandCriteria) {
      const matched = brandCriteria.options.find(b => b.toLowerCase() === brandParam.toLowerCase());
      if (matched) initialFilters["Thương hiệu"] = matched;
    }
  }

  const [userFilters, setUserFilters] = useState<Record<string, string> | null>(null);
  const [userMin, setUserMin] = useState<string | null>(null);
  const [userMax, setUserMax] = useState<string | null>(null);
  const [expanded, setExpanded] = useState<Record<string, boolean>>({});
  const [sort, setSort] = useState("Mặc định");

  const activeFilters = userFilters ?? initialFilters;
  const activeMin = userMin ?? minParam;
  const activeMax = userMax ?? maxParam;

  function reset() {
    setUserFilters({});
    setUserMin("");
    setUserMax("");
  }

  function toggle(key: string, value?: string) {
    if (key === "Khoảng giá") {
      setUserMin("");
      setUserMax("");
    }
    setUserFilters(old => ({ ...(old ?? activeFilters), [key]: value ?? "" }));
  }

  // Hàm parse khoảng giá chuỗi thành [min, max]
  function parsePriceRange(rangeStr: string): [number, number] {
    if (rangeStr.includes("Dưới")) {
      const match = rangeStr.match(/\d+(\.\d+)?/);
      const val = match ? parseFloat(match[0]) : 500000;
      const num = rangeStr.includes("triệu") ? val * 1e6 : val * 1000;
      return [0, num];
    }
    if (rangeStr.includes("Trên")) {
      const match = rangeStr.match(/\d+(\.\d+)?/);
      const val = match ? parseFloat(match[0]) : 1000000;
      const num = rangeStr.includes("triệu") ? val * 1e6 : val * 1000;
      return [num, Infinity];
    }
    // "Từ X - Y"
    const parts = rangeStr.replace("Từ ", "").split("-").map(s => s.trim());
    if (parts.length === 2) {
      const parseVal = (str: string) => {
        const m = str.match(/\d+(\.\d+)?/);
        const v = m ? parseFloat(m[0]) : 0;
        return str.includes("triệu") ? v * 1e6 : v * 1000;
      };
      return [parseVal(parts[0]), parseVal(parts[1])];
    }
    return [0, Infinity];
  }

  // Lọc sản phẩm
  const filteredProducts = products.filter(product => {
    const variant = product.product_variants?.[0];
    const price = variant?.price || 0;

    // Lọc theo ô tự nhập (Từ - Đến)
    if (activeMin && price < Number(activeMin)) return false;
    if (activeMax && price > Number(activeMax)) return false;

    // Lọc theo từng tiêu chí GearVN
    return Object.entries(activeFilters).every(([key, value]) => {
      if (!value) return true; // "Tất cả"

      if (key === "Thương hiệu") {
        return (
          product.brands?.brand_name?.toLowerCase() === value.toLowerCase() ||
          product.product_name.toLowerCase().includes(value.toLowerCase())
        );
      }

      if (key === "Khoảng giá") {
        const [low, high] = parsePriceRange(value);
        return price >= low && price <= high;
      }

      // Các tiêu chí khác: so khớp với tên sản phẩm hoặc mô tả / specs
      const fullText = (
        product.product_name +
        " " +
        (product.short_description || "") +
        " " +
        (product.description || "") +
        " " +
        (product.product_specifications?.map(s => s.specification_name + " " + s.specification_value).join(" ") || "")
      ).toLowerCase();

      return fullText.includes(value.toLowerCase());
    });
  });

  // Sắp xếp
  if (sort === "Giá tăng dần") {
    filteredProducts.sort((a, b) => (a.product_variants?.[0]?.price || 0) - (b.product_variants?.[0]?.price || 0));
  } else if (sort === "Giá giảm dần") {
    filteredProducts.sort((a, b) => (b.product_variants?.[0]?.price || 0) - (a.product_variants?.[0]?.price || 0));
  } else if (sort === "Tên A-Z") {
    filteredProducts.sort((a, b) => a.product_name.localeCompare(b.product_name, "vi"));
  }

  return (
    <main className={css.page}>
      {/* Breadcrumb đồng bộ với Laptop */}
      <nav className={css.breadcrumb} aria-label="Đường dẫn">
        <Link href="/">Trang chủ</Link>
        <span aria-hidden="true">/</span>
        <span aria-current="page">
          Tất cả {category.label} ({products.length} sản phẩm)
        </span>
      </nav>

      <h1>Danh mục {category.label}</h1>

      <div className={css.layout}>
        {/* Cột Bộ Lọc Aside bên trái chuẩn phong cách GearVN */}
        <aside>
          <header>
            <strong>Bộ lọc tìm kiếm</strong>
            <button onClick={reset}>Xóa lọc</button>
          </header>

          <div className={css.scroll}>
            {gearvnFilters.map(({ key, options }) => {
              const choices = options;
              const isExpanded = expanded[key];
              const displayed = isExpanded ? choices : choices.slice(0, 6);

              return (
                <details open key={key}>
                  <summary>{key}</summary>
                  <label>
                    <input
                      type="radio"
                      name={key}
                      checked={
                        !activeFilters[key] &&
                        !(key === "Khoảng giá" && (activeMin || activeMax))
                      }
                      onChange={() => toggle(key)}
                    />{" "}
                    Tất cả
                  </label>

                  {displayed.map(choice => (
                    <label key={choice}>
                      <input
                        type="radio"
                        name={key}
                        checked={activeFilters[key] === choice}
                        onChange={() => toggle(key, choice)}
                      />{" "}
                      {choice}
                    </label>
                  ))}

                  {choices.length > 6 && (
                    <button
                      type="button"
                      onClick={() => setExpanded(prev => ({ ...prev, [key]: !prev[key] }))}
                    >
                      {isExpanded ? "Thu gọn" : "Xem thêm"}
                    </button>
                  )}

                  {key === "Khoảng giá" && (
                    <>
                      <small>Hoặc nhập khoảng giá phù hợp với bạn:</small>
                      <div className={css.range}>
                        {[activeMin, activeMax].map((v, i) => (
                          <input
                            key={i}
                            aria-label={i ? "Giá tối đa" : "Giá tối thiểu"}
                            type="number"
                            min="0"
                            placeholder={i ? "Đến" : "Từ"}
                            value={v ?? ""}
                            onChange={e => {
                              setUserFilters(old => ({ ...(old ?? activeFilters), "Khoảng giá": "" }));
                              (i ? setUserMax : setUserMin)(e.target.value);
                            }}
                          />
                        ))}
                      </div>
                    </>
                  )}
                </details>
              );
            })}
          </div>
        </aside>

        {/* Khung hiển thị danh sách sản phẩm bên phải */}
        <section>
          <header className={css.toolbar}>
            <span aria-live="polite">
              Tìm thấy <b>{filteredProducts.length}</b> kết quả
            </span>

            {/* Sắp xếp */}
            <div className={css.sortOptions} role="group" aria-label="Sắp xếp sản phẩm">
              {["Mặc định", "Giá tăng dần", "Giá giảm dần", "Tên A-Z"].map((option, i) => (
                <span key={option}>
                  {i > 0 && <i aria-hidden="true">•</i>}
                  <button
                    type="button"
                    aria-pressed={sort === option}
                    onClick={() => setSort(option)}
                  >
                    {option}
                  </button>
                </span>
              ))}
            </div>
          </header>

          {/* Grid sản phẩm */}
          <div className={css.grid}>
            {filteredProducts.map((p, index) => {
              const variant = p.product_variants?.[0];
              const price = variant?.price || 0;
              const compareAtPrice = variant?.compare_at_price;
              const discountPercent = compareAtPrice && compareAtPrice > price
                ? Math.round((1 - price / compareAtPrice) * 100)
                : 0;

              return (
                <Link
                  href={`/Product/${p.product_id}`}
                  className={css.card}
                  key={p.product_id}
                  style={{ textDecoration: "none", color: "inherit", display: "flex", flexDirection: "column" }}
                >
                  <div className={css.art}>
                    <CategoryIllustration categorySlug={category.slug} index={index} />
                  </div>

                  <h2>{p.product_name}</h2>

                  <p>
                    {p.brands?.brand_name
                      ? `${p.brands.brand_name} · ${p.short_description || "Chính hãng ConGears"}`
                      : p.short_description || "Chính hãng"}
                  </p>

                  <footer>
                    {discountPercent > 0 && compareAtPrice && (
                      <small>
                        <del>{money(compareAtPrice)}</del> −{discountPercent}%
                      </small>
                    )}
                    <strong>{money(price)}</strong>
                  </footer>
                </Link>
              );
            })}
          </div>

          {!filteredProducts.length && (
            <div className={css.empty}>
              <h2>Không tìm thấy sản phẩm phù hợp</h2>
              <button onClick={reset}>Xóa bộ lọc</button>
            </div>
          )}
        </section>
      </div>
    </main>
  );
}
