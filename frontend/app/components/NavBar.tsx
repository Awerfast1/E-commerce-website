"use client";

import Link from "next/link";
import { useCart } from "./cart";
import { useEffect, useRef, useState, useMemo } from "react";
import supabaseProductsRaw from "../../data/supabaseProducts.json";
import { megaMenuData } from "../../data/megaMenuData";
import styles from "./NavBar.module.css";

interface SearchProduct {
  product_id: string;
  slug: string;
  product_name: string;
  categorySlug: string;
  categoryName: string;
  brandName: string;
  price: number;
  compareAtPrice: number;
  imageUrl?: string;
}

const allSearchProducts: SearchProduct[] = (supabaseProductsRaw as any[]).map(p => {
  const variant = p.product_variants?.[0];
  const price = Number(variant?.price || 0);
  const compareAtPrice = Number(variant?.compare_at_price || price);
  const primaryImage =
    p.product_images?.find((img: any) => img.is_primary)?.image_url ||
    p.product_images?.[0]?.image_url ||
    "https://placehold.co/800x800?text=" + encodeURIComponent(p.product_name || "ConGears");

  return {
    product_id: p.product_id,
    slug: p.slug,
    product_name: p.product_name,
    categorySlug: p.categories?.slug || "laptop",
    categoryName: p.categories?.category_name || "Sản phẩm",
    brandName: p.brands?.brand_name || "",
    price,
    compareAtPrice,
    imageUrl: primaryImage,
  };
});

function getProductLink(product: SearchProduct): string {
  if (product.categorySlug === "laptop-gaming") {
    return `/gaming-laptops/${product.slug}`;
  }
  if (product.categorySlug === "laptop-van-phong") {
    return `/laptop-van-phong/${product.slug}`;
  }
  return `/Product/${product.product_id}`;
}

function highlightMatches(text: string, query: string) {
  if (!query.trim()) return text;
  const terms = query
    .trim()
    .split(/\s+/)
    .filter(Boolean)
    .map(t => t.replace(/[-/\\^$*+?.()|[\]{}]/g, "\\$&"));

  if (!terms.length) return text;

  const regex = new RegExp(`(${terms.join("|")})`, "gi");
  const parts = text.split(regex);

  return parts.map((part, i) => {
    const isMatch = terms.some(t => new RegExp(`^${t}$`, "i").test(part));
    return isMatch ? (
      <span key={i} className={styles.highlight}>
        {part}
      </span>
    ) : (
      part
    );
  });
}

const paths = {
  search: "M21 21l-5-5 M18 10.5a7.5 7.5 0 1 1-15 0 7.5 7.5 0 0 1 15 0Z",
  headset: "M2 14v-2a10 10 0 0 1 20 0v5a5 5 0 0 1-5 5h-4 M3 12h3a1 1 0 0 1 1 1v5H4a2 2 0 0 1-2-2v-2a2 2 0 0 1 1-2Z M21 12h-3a1 1 0 0 0-1 1v5h3a2 2 0 0 0 2-2v-2a2 2 0 0 0-1-2Z",
  orders: "M8 4H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-3 M8 2h8v4H8z M7 11h1m4 0h5M7 16h1m4 0h5",
  cart: "M2 3h3l3 13h11l3-10H6 M10 21a1 1 0 1 1 0-2 1 1 0 0 1 0 2Z M18 21a1 1 0 1 1 0-2 1 1 0 0 1 0 2Z",
  user: "M16 7a4 4 0 1 1-8 0 4 4 0 0 1 8 0Z M3 21v-2c0-5 18-5 18 0v2Z",
};

function Icon({ name }: { name: keyof typeof paths }) {
  return (
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
      <path d={paths[name]} />
    </svg>
  );
}

export const navCategories = [
  { label: "Laptop", slug: "laptop" },
  { label: "Bàn phím", slug: "keyboards" },
  { label: "Chuột", slug: "mice" },
  { label: "Tai nghe", slug: "headphones" },
  { label: "Loa", slug: "speakers" },
  { label: "Ổ cứng", slug: "storage" },
  { label: "Củ sạc", slug: "chargers" },
  { label: "Dây cáp", slug: "cables" },
  { label: "Pin dự phòng", slug: "power-banks" },
  { label: "Hub & Adapter", slug: "hubs-adapters" },
  { label: "Giá đỡ", slug: "stands-mounts" },
  { label: "Ốp & Cường lực", slug: "phone-cases" },
];

// 11 danh mục hiển thị trên thanh ngang lấp đầy chiều rộng thẩm mỹ và cân đối
export const topBarCategories = navCategories.slice(0, 11);

export default function NavBar() {
  const count = Object.values(useCart()).reduce((sum, n) => sum + n, 0);
  const [query, setQuery] = useState("");
  const [open, setOpen] = useState(false);
  const [activeCategory, setActiveCategory] = useState<string | null>(null);
  const [recentSearches, setRecentSearches] = useState<string[]>([]);
  const categoryDropdownRef = useRef<HTMLDetailsElement>(null);
  const searchContainerRef = useRef<HTMLFormElement>(null);

  useEffect(() => {
    try {
      const saved = localStorage.getItem("congears_recent_searches");
      if (saved) {
        setRecentSearches(JSON.parse(saved));
      } else {
        setRecentSearches(["bàn phím dareu", "chuột logitech"]);
      }
    } catch {
      setRecentSearches(["bàn phím dareu", "chuột logitech"]);
    }
  }, []);

  const saveRecentSearch = (termToSave: string) => {
    const trimmed = termToSave.trim();
    if (!trimmed) return;
    setRecentSearches(prev => {
      const updated = [trimmed, ...prev.filter(t => t.toLowerCase() !== trimmed.toLowerCase())].slice(0, 5);
      try {
        localStorage.setItem("congears_recent_searches", JSON.stringify(updated));
      } catch {
        // ignore storage errors
      }
      return updated;
    });
  };

  const removeRecentSearch = (termToRemove: string, e: React.MouseEvent) => {
    e.stopPropagation();
    e.preventDefault();
    setRecentSearches(prev => {
      const updated = prev.filter(t => t !== termToRemove);
      try {
        localStorage.setItem("congears_recent_searches", JSON.stringify(updated));
      } catch {
        // ignore
      }
      return updated;
    });
  };

  const clearAllRecent = (e: React.MouseEvent) => {
    e.stopPropagation();
    e.preventDefault();
    setRecentSearches([]);
    try {
      localStorage.removeItem("congears_recent_searches");
    } catch {
      // ignore
    }
  };

  const term = query.trim().toLowerCase();

  // Tìm kiếm thông minh: tách query thành các từ khóa con và check match trên tên sp, brand, category
  const matches = useMemo(() => {
    if (!term) return [];
    const tokens = term.split(/\s+/).filter(Boolean);
    return allSearchProducts
      .filter(product => {
        const fullSearchTarget = `${product.product_name} ${product.brandName} ${product.categoryName}`.toLowerCase();
        return tokens.every(tok => fullSearchTarget.includes(tok));
      })
      .slice(0, 6);
  }, [term]);

  // Sản phẩm nổi bật khi focus nhưng chưa nhập gì
  const featuredProducts = useMemo(() => {
    return allSearchProducts.slice(0, 5);
  }, []);

  const trendingKeywords = [
    "Bàn phím DareU",
    "Chuột Logitech",
    "Bàn phím cơ",
    "Laptop Gaming",
    "ASUS ROG",
    "SSD 1TB"
  ];

  useEffect(() => {
    function handleOutsideClick(event: PointerEvent) {
      const target = event.target as Node;
      if (!categoryDropdownRef.current?.contains(target)) {
        categoryDropdownRef.current?.removeAttribute("open");
        setActiveCategory(null);
      }
      if (!searchContainerRef.current?.contains(target)) {
        setOpen(false);
      }
    }

    document.addEventListener("pointerdown", handleOutsideClick);
    return () => document.removeEventListener("pointerdown", handleOutsideClick);
  }, []);

  const formatPrice = (val: number) => {
    return new Intl.NumberFormat("vi-VN").format(val) + "đ";
  };

  return (
    <header className={styles.header} lang="vi">
      <div className={styles.bar}>
        <Link className={styles.brand} href="/" aria-label="ConGears – Trang chủ">
          <span className={styles.brandMark} aria-hidden="true">N</span>
          CONGEARS
        </Link>
        <form
          ref={searchContainerRef}
          role="search"
          className={styles.search}
          onSubmit={event => {
            event.preventDefault();
            if (term) {
              saveRecentSearch(term);
              setOpen(false);
            }
          }}
          onKeyDown={event => {
            if (event.key === "Escape") setOpen(false);
          }}
        >
          <input
            type="search"
            aria-label="Tìm sản phẩm"
            placeholder="Bạn cần tìm gì?"
            value={query}
            onChange={event => {
              setQuery(event.target.value);
              setOpen(true);
            }}
            onFocus={() => setOpen(true)}
          />
          <button type="submit" aria-label="Tìm kiếm">
            <Icon name="search" />
          </button>

          {/* Modal kết quả tìm kiếm chuẩn GearVN */}
          {open && (
            <div className={styles.searchDropdown}>
              {term ? (
                /* Trạng thái 1: Đang có từ khóa tìm kiếm */
                <div>
                  <div className={styles.searchDropdownHeader}>
                    <span>Kết quả tìm kiếm</span>
                  </div>

                  {matches.length > 0 ? (
                    <div>
                      {matches.map(product => (
                        <Link
                          key={product.product_id}
                          href={getProductLink(product)}
                          className={styles.searchItem}
                          onClick={() => {
                            saveRecentSearch(term);
                            setOpen(false);
                          }}
                        >
                          {/* eslint-disable-next-line @next/next/no-img-element */}
                          <img
                            src={product.imageUrl}
                            alt={product.product_name}
                            className={styles.searchThumb}
                          />
                          <div className={styles.searchItemContent}>
                            <div className={styles.searchItemTitle}>
                              {highlightMatches(product.product_name, query)}
                            </div>
                            <div className={styles.searchBadgeRow}>
                              <span className={styles.badgeExpress}>⚡ HỎA TỐC</span>
                            </div>
                            <div className={styles.searchPriceRow}>
                              <span className={styles.priceSale}>
                                {formatPrice(product.price)}
                              </span>
                              {product.compareAtPrice > product.price && (
                                <span className={styles.priceOriginal}>
                                  {formatPrice(product.compareAtPrice)}
                                </span>
                              )}
                            </div>
                          </div>
                        </Link>
                      ))}

                      <Link
                        href={`/categories/keyboards`}
                        className={styles.searchFooter}
                        onClick={() => {
                          saveRecentSearch(term);
                          setOpen(false);
                        }}
                      >
                        → Xem tất cả kết quả cho &ldquo;{query}&rdquo;
                      </Link>
                    </div>
                  ) : (
                    <div style={{ padding: "24px 16px", textAlign: "center", color: "#6b7280" }}>
                      Không tìm thấy sản phẩm phù hợp với &ldquo;{query}&rdquo;
                    </div>
                  )}
                </div>
              ) : (
                /* Trạng thái 2: Focus ô input nhưng chưa gõ gì (Gợi ý, Sản phẩm nổi bật, Lịch sử, Xu hướng) */
                <div>
                  {/* Sản phẩm nổi bật */}
                  <div className={styles.searchDropdownHeader}>
                    <span>Sản phẩm nổi bật</span>
                  </div>
                  <div>
                    {featuredProducts.map(product => (
                      <Link
                        key={product.product_id}
                        href={getProductLink(product)}
                        className={styles.searchItem}
                        onClick={() => setOpen(false)}
                      >
                        {/* eslint-disable-next-line @next/next/no-img-element */}
                        <img
                          src={product.imageUrl}
                          alt={product.product_name}
                          className={styles.searchThumb}
                        />
                        <div className={styles.searchItemContent}>
                          <div className={styles.searchItemTitle}>
                            {product.product_name}
                          </div>
                          <div className={styles.searchPriceRow}>
                            <span className={styles.priceSale}>
                              {formatPrice(product.price)}
                            </span>
                            {product.compareAtPrice > product.price && (
                              <span className={styles.priceOriginal}>
                                {formatPrice(product.compareAtPrice)}
                              </span>
                            )}
                          </div>
                        </div>
                      </Link>
                    ))}
                  </div>

                  {/* Tìm kiếm gần đây */}
                  {recentSearches.length > 0 && (
                    <div style={{ borderTop: "1px solid #f3f4f6", marginTop: 8, paddingTop: 8 }}>
                      <div className={styles.searchDropdownHeader}>
                        <span>Tìm kiếm gần đây</span>
                        <button
                          type="button"
                          className={styles.clearHistoryBtn}
                          onClick={clearAllRecent}
                        >
                          Xóa tất cả
                        </button>
                      </div>
                      <div className={styles.recentList}>
                        {recentSearches.map((item, idx) => (
                          <div
                            key={idx}
                            className={styles.recentItem}
                            onClick={() => {
                              setQuery(item);
                              setOpen(true);
                            }}
                          >
                            <span className={styles.recentItemText}>
                              🕒 {item}
                            </span>
                            <button
                              type="button"
                              className={styles.removeRecentBtn}
                              title="Xóa"
                              onClick={(e) => removeRecentSearch(item, e)}
                            >
                              ×
                            </button>
                          </div>
                        ))}
                      </div>
                    </div>
                  )}

                  {/* Xu hướng tìm kiếm */}
                  <div style={{ borderTop: "1px solid #f3f4f6", paddingTop: 8 }}>
                    <div className={styles.searchDropdownHeader}>
                      <span>Xu hướng tìm kiếm</span>
                    </div>
                    <div className={styles.trendingList}>
                      {trendingKeywords.map((kw, idx) => (
                        <button
                          key={idx}
                          type="button"
                          className={styles.trendingTag}
                          onClick={() => {
                            setQuery(kw);
                            setOpen(true);
                          }}
                        >
                          📈 {kw}
                        </button>
                      ))}
                    </div>
                  </div>
                </div>
              )}
            </div>
          )}
        </form>
        <div className={styles.services}>
          <span><Icon name="headset" /><span>CSKH</span></span>
          <span><Icon name="orders" /><span>Tra cứu<br />đơn hàng</span></span>
        </div>
        <div className={styles.actions}>
          <Link className={styles.cartLink} href="/gio-hang" aria-label={`Giỏ hàng, ${count} sản phẩm`}>
            <Icon name="cart" />{count > 0 && <b>{count}</b>}
          </Link>
          <button disabled title="Đăng nhập đang được phát triển"><Icon name="user" />Đăng nhập</button>
        </div>
      </div>

      <nav
        className={styles.categoryNav}
        aria-label="Danh mục sản phẩm"
        onKeyDown={event => {
          if (event.key === "Escape") {
            categoryDropdownRef.current?.removeAttribute("open");
            setActiveCategory(null);
          }
        }}
      >
        <div className={styles.categoryBar}>
          <details ref={categoryDropdownRef}>
            <summary className={styles.categoryHeading} onClick={() => setActiveCategory(null)}>
              <span className={styles.menuIcon} aria-hidden="true"><span /><span /><span /></span>
              Danh mục
            </summary>
            <div className={styles.menuBackdrop} aria-hidden="true" />
            <div id="category-menu" className={styles.menuShell}>
              <div className={styles.menuContent} onMouseLeave={() => setActiveCategory(null)}>
                <div className={styles.menuList} aria-label="Danh mục chính">
                  {navCategories.map(cat => (
                    <button
                      key={cat.slug}
                      type="button"
                      className={activeCategory === cat.label ? styles.menuItemActive : styles.menuItem}
                      onMouseEnter={() => setActiveCategory(cat.label)}
                      onPointerMove={() => setActiveCategory(cat.label)}
                      onFocus={() => setActiveCategory(cat.label)}
                      onClick={() => setActiveCategory(cat.label)}
                    >
                      <span>{cat.label}</span>
                      <span aria-hidden="true">›</span>
                    </button>
                  ))}
                </div>

                <div className={styles.submenu} data-active={activeCategory ?? ""} aria-live="polite">
                  {activeCategory === "Laptop" ? (
                    <div className={styles.laptopMegaMenu}>
                      <div className={styles.megaHeader}>
                        <span className={styles.megaTitle}>Laptop</span>
                        <Link
                          href="/categories/laptop"
                          className={styles.megaViewAll}
                          onClick={() => categoryDropdownRef.current?.removeAttribute("open")}
                        >
                          Xem tất cả ›
                        </Link>
                      </div>

                      <div className={styles.megaGrid}>
                        {/* Cột 1: Thương hiệu & Giá bán */}
                        <div className={styles.megaCol}>
                          <h3 className={styles.megaColHeading}>Thương hiệu ›</h3>
                          <ul className={styles.megaList}>
                            {[
                              { label: "ACER", brand: "Acer" },
                              { label: "ASUS", brand: "ASUS" },
                              { label: "LENOVO", brand: "Lenovo" },
                              { label: "DELL", brand: "Dell" },
                              { label: "HP", brand: "HP" },
                              { label: "LG", brand: "LG" },
                              { label: "ALIENWARE", brand: "Alienware" },
                            ].map(({ label, brand }) => (
                              <li key={label}>
                                <Link
                                  href={`/categories/laptop?brand=${encodeURIComponent(brand)}`}
                                  onClick={() => categoryDropdownRef.current?.removeAttribute("open")}
                                >
                                  {label}
                                </Link>
                              </li>
                            ))}
                          </ul>

                          <h3 className={`${styles.megaColHeading} ${styles.mtSection}`}>Giá bán ›</h3>
                          <ul className={styles.megaList}>
                            {[
                              { label: "Dưới 15 triệu", max: "15000000" },
                              { label: "Từ 15 đến 25 triệu", min: "15000000", max: "25000000" },
                              { label: "Từ 25 đến 40 triệu", min: "25000000", max: "40000000" },
                              { label: "Trên 40 triệu", min: "40000000" },
                            ].map(({ label, min, max }) => {
                              const params = new URLSearchParams();
                              if (min) params.set("min", min);
                              if (max) params.set("max", max);
                              return (
                                <li key={label}>
                                  <Link
                                    href={`/categories/laptop?${params.toString()}`}
                                    onClick={() => categoryDropdownRef.current?.removeAttribute("open")}
                                  >
                                    {label}
                                  </Link>
                                </li>
                              );
                            })}
                          </ul>
                        </div>

                        {/* Cột 2: ACER & Nhu cầu */}
                        <div className={styles.megaCol}>
                          <h3 className={styles.megaColHeading}>ACER ›</h3>
                          <ul className={styles.megaList}>
                            {[
                              { label: "PREDATOR Series", series: "Predator Helios" },
                              { label: "NITRO Series", series: "Nitro" },
                              { label: "SWIFT Series", series: "Swift" },
                              { label: "ASPIRE Series", series: "Aspire" },
                            ].map(({ label, series }) => (
                              <li key={label}>
                                <Link
                                  href={`/categories/laptop?brand=Acer&series=${encodeURIComponent(series)}`}
                                  onClick={() => categoryDropdownRef.current?.removeAttribute("open")}
                                >
                                  {label}
                                </Link>
                              </li>
                            ))}
                          </ul>

                          <h3 className={`${styles.megaColHeading} ${styles.mtSection}`}>Nhu cầu ›</h3>
                          <ul className={styles.megaList}>
                            <li>
                              <Link
                                href="/categories/laptop?type=gaming"
                                onClick={() => categoryDropdownRef.current?.removeAttribute("open")}
                              >
                                Laptop Gaming
                              </Link>
                            </li>
                            <li>
                              <Link
                                href="/categories/laptop?type=office"
                                onClick={() => categoryDropdownRef.current?.removeAttribute("open")}
                              >
                                Laptop Văn Phòng
                              </Link>
                            </li>
                          </ul>
                        </div>

                        {/* Cột 3: ASUS & LENOVO */}
                        <div className={styles.megaCol}>
                          <h3 className={styles.megaColHeading}>ASUS ›</h3>
                          <ul className={styles.megaList}>
                            {[
                              { label: "ROG Series", series: "ROG Strix" },
                              { label: "TUF GAMING Series", series: "TUF Gaming" },
                              { label: "ZENBOOK Series", series: "Zenbook" },
                              { label: "VIVOBOOK Series", series: "Vivobook" },
                            ].map(({ label, series }) => (
                              <li key={label}>
                                <Link
                                  href={`/categories/laptop?brand=ASUS&series=${encodeURIComponent(series)}`}
                                  onClick={() => categoryDropdownRef.current?.removeAttribute("open")}
                                >
                                  {label}
                                </Link>
                              </li>
                            ))}
                          </ul>

                          <h3 className={`${styles.megaColHeading} ${styles.mtSection}`}>LENOVO ›</h3>
                          <ul className={styles.megaList}>
                            {[
                              { label: "LEGION Series", series: "Legion Pro" },
                              { label: "THINKPAD Series", series: "ThinkPad" },
                              { label: "THINKBOOK Series", series: "ThinkBook" },
                              { label: "IDEAPAD Series", series: "IdeaPad" },
                            ].map(({ label, series }) => (
                              <li key={label}>
                                <Link
                                  href={`/categories/laptop?brand=Lenovo&series=${encodeURIComponent(series)}`}
                                  onClick={() => categoryDropdownRef.current?.removeAttribute("open")}
                                >
                                  {label}
                                </Link>
                              </li>
                            ))}
                          </ul>
                        </div>

                        {/* Cột 4: DELL, HP & LG */}
                        <div className={styles.megaCol}>
                          <h3 className={styles.megaColHeading}>DELL & ALIENWARE ›</h3>
                          <ul className={styles.megaList}>
                            {[
                              { label: "XPS Series", series: "XPS" },
                              { label: "INSPIRON Series", series: "Inspiron" },
                              { label: "ALIENWARE Series", series: "Area-51" },
                            ].map(({ label, series }) => (
                              <li key={label}>
                                <Link
                                  href={`/categories/laptop?series=${encodeURIComponent(series)}`}
                                  onClick={() => categoryDropdownRef.current?.removeAttribute("open")}
                                >
                                  {label}
                                </Link>
                              </li>
                            ))}
                          </ul>

                          <h3 className={`${styles.megaColHeading} ${styles.mtSection}`}>HP & LG ›</h3>
                          <ul className={styles.megaList}>
                            {[
                              { label: "ENVY Series", series: "Envy" },
                              { label: "PAVILION Series", series: "Pavilion" },
                              { label: "GRAM Series", series: "gram" },
                            ].map(({ label, series }) => (
                              <li key={label}>
                                <Link
                                  href={`/categories/laptop?series=${encodeURIComponent(series)}`}
                                  onClick={() => categoryDropdownRef.current?.removeAttribute("open")}
                                >
                                  {label}
                                </Link>
                              </li>
                            ))}
                          </ul>
                        </div>
                      </div>
                    </div>
                  ) : activeCategory && megaMenuData[activeCategory] ? (
                    (() => {
                      const data = megaMenuData[activeCategory];
                      return (
                        <div className={styles.laptopMegaMenu}>
                          <div className={styles.megaHeader}>
                            <span className={styles.megaTitle}>{data.title}</span>
                            <Link
                              href={data.viewAllHref}
                              className={styles.megaViewAll}
                              onClick={() => categoryDropdownRef.current?.removeAttribute("open")}
                            >
                              Xem tất cả ›
                            </Link>
                          </div>

                          <div className={styles.megaGrid}>
                            {data.columns.map((col, cIdx) => (
                              <div key={cIdx} className={styles.megaCol}>
                                <h3 className={styles.megaColHeading}>{col.title}</h3>
                                <ul className={styles.megaList}>
                                  {col.items.map((it, iIdx) => (
                                    <li key={iIdx}>
                                      <Link
                                        href={it.href}
                                        onClick={() => categoryDropdownRef.current?.removeAttribute("open")}
                                      >
                                        {it.label}
                                      </Link>
                                    </li>
                                  ))}
                                </ul>
                              </div>
                            ))}
                          </div>
                        </div>
                      );
                    })()
                  ) : activeCategory ? (
                    <div className={styles.laptopMegaMenu}>
                      <div className={styles.megaHeader}>
                        <span className={styles.megaTitle}>{activeCategory}</span>
                        {(() => {
                          const item = navCategories.find(c => c.label === activeCategory);
                          return (
                            <Link
                              href={`/categories/${item ? item.slug : "laptop"}`}
                              className={styles.megaViewAll}
                              onClick={() => categoryDropdownRef.current?.removeAttribute("open")}
                            >
                              Xem tất cả sản phẩm ›
                            </Link>
                          );
                        })()}
                      </div>
                      <p style={{ color: "#64748b", fontSize: "14px", marginTop: "16px" }}>
                        Khám phá bộ sưu tập <strong>{activeCategory}</strong> chính hãng với bảo hành uy tín và giá ưu đãi tại ConGears.
                      </p>
                    </div>
                  ) : (
                    <p>Chọn một danh mục bên trái để xem chi tiết.</p>
                  )}
                </div>
              </div>
            </div>
          </details>

          {/* Thanh danh mục ngang (Top 6 mục phổ biến nhất để căn phẳng hoàn hảo không bị cuộn) */}
          <div className={styles.categoryLinks}>
            {topBarCategories.map(cat => (
              <Link
                key={cat.slug}
                className={cat.slug === "laptop" ? styles.laptopCategory : styles.categoryItemLink}
                href={`/categories/${cat.slug}`}
              >
                {cat.label}
              </Link>
            ))}
          </div>
        </div>
      </nav>
    </header>
  );
}
