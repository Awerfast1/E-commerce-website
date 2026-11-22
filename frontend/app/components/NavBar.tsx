"use client";

import Link from "next/link";
import { useCart } from "./cart";
import { useEffect, useRef, useState } from "react";
import { products } from "../../data/Products";
import styles from "./NavBar.module.css";

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
  const categoryDropdownRef = useRef<HTMLDetailsElement>(null);

  const term = query.trim().toLowerCase();
  const matches = products.filter(product => product.name.toLowerCase().includes(term));

  useEffect(() => {
    function handleOutsideClick(event: PointerEvent) {
      const target = event.target as Node;
      if (!categoryDropdownRef.current?.contains(target)) {
        categoryDropdownRef.current?.removeAttribute("open");
        setActiveCategory(null);
      }
    }

    document.addEventListener("pointerdown", handleOutsideClick);
    return () => document.removeEventListener("pointerdown", handleOutsideClick);
  }, []);

  return (
    <header className={styles.header} lang="vi">
      <div className={styles.bar}>
        <Link className={styles.brand} href="/" aria-label="ConGears – Trang chủ">
          <span className={styles.brandMark} aria-hidden="true">C</span>
          CONGEARS
        </Link>
        <form
          role="search"
          className={styles.search}
          onSubmit={event => { event.preventDefault(); setOpen(true); }}
          onBlur={event => { if (!event.currentTarget.contains(event.relatedTarget)) setOpen(false); }}
          onKeyDown={event => { if (event.key === "Escape") setOpen(false); }}
        >
          <input
            type="search"
            aria-label="Tìm sản phẩm"
            placeholder="Bạn cần tìm gì?"
            value={query}
            onChange={event => { setQuery(event.target.value); setOpen(true); }}
            onFocus={() => setOpen(true)}
          />
          <button aria-label="Tìm kiếm"><Icon name="search" /></button>
          {open && term && (
            <div className={styles.results}>
              {matches.length ? matches.map(product => (
                <Link key={product.id} href={`/Product/${product.id}`} onClick={() => { setQuery(""); setOpen(false); }}>
                  {product.name}
                </Link>
              )) : <p>Không tìm thấy sản phẩm.</p>}
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
                        {/* Cột 1: Thương hiệu & Nhu cầu */}
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

                        {/* Cột 2: ACER & ASUS */}
                        <div className={styles.megaCol}>
                          <h3 className={styles.megaColHeading}>ACER ›</h3>
                          <ul className={styles.megaList}>
                            {[
                              { label: "PREDATOR HELIOS", series: "Predator Helios" },
                              { label: "NITRO Series", series: "Nitro" },
                              { label: "SWIFT Series (Mỏng nhẹ)", series: "Swift" },
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

                          <h3 className={`${styles.megaColHeading} ${styles.mtSection}`}>ASUS ›</h3>
                          <ul className={styles.megaList}>
                            {[
                              { label: "ROG STRIX / ZEPHYRUS", series: "ROG Strix" },
                              { label: "TUF GAMING", series: "TUF Gaming" },
                              { label: "ZENBOOK OLED (Cao cấp)", series: "Zenbook" },
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
                        </div>

                        {/* Cột 3: LENOVO & DELL */}
                        <div className={styles.megaCol}>
                          <h3 className={styles.megaColHeading}>LENOVO ›</h3>
                          <ul className={styles.megaList}>
                            {[
                              { label: "LEGION Gaming", series: "Legion Pro" },
                              { label: "THINKPAD (Bền bỉ)", series: "ThinkPad" },
                              { label: "THINKBOOK (Doanh nghiệp)", series: "ThinkBook" },
                              { label: "IDEAPAD Slim", series: "IdeaPad" },
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

                          <h3 className={`${styles.megaColHeading} ${styles.mtSection}`}>DELL & ALIENWARE ›</h3>
                          <ul className={styles.megaList}>
                            {[
                              { label: "DELL XPS 13 (Ultrabook)", series: "XPS" },
                              { label: "DELL INSPIRON 14/15", series: "Inspiron" },
                              { label: "ALIENWARE Area-51", series: "Area-51" },
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

                        {/* Cột 4: HP, LG & Mức Giá */}
                        <div className={styles.megaCol}>
                          <h3 className={styles.megaColHeading}>HP & LG GRAM ›</h3>
                          <ul className={styles.megaList}>
                            {[
                              { label: "HP ENVY x360 (Cảm ứng)", series: "Envy" },
                              { label: "HP PAVILION 14", series: "Pavilion" },
                              { label: "LG GRAM 14/16 (Siêu nhẹ)", series: "gram" },
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

                          <h3 className={`${styles.megaColHeading} ${styles.mtSection}`}>Khoảng giá ›</h3>
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
                      </div>
                    </div>
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
