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
  return <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true"><path d={paths[name]} /></svg>;
}

export default function NavBar() {
  const count = Object.values(useCart()).reduce((sum, n) => sum + n, 0);
  const [query, setQuery] = useState("");
  const [open, setOpen] = useState(false);
  const [activeCategory, setActiveCategory] = useState<string | null>(null);
  const categoryDropdownRef = useRef<HTMLDetailsElement>(null);
  const categories = ["Laptop", "Phụ kiện máy tính", "Màn hình", "Tai nghe", "Chuột"];
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
        <form role="search" className={styles.search}
          onSubmit={event => { event.preventDefault(); setOpen(true); }}
          onBlur={event => { if (!event.currentTarget.contains(event.relatedTarget)) setOpen(false); }}
          onKeyDown={event => { if (event.key === "Escape") setOpen(false); }}>
          <input type="search" aria-label="Tìm sản phẩm" placeholder="Bạn cần tìm gì?" value={query}
            onChange={event => { setQuery(event.target.value); setOpen(true); }} onFocus={() => setOpen(true)} />
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
          <Link className={styles.cartLink} href="/gio-hang" aria-label={`Giỏ hàng, ${count} sản phẩm`}><Icon name="cart" />{count > 0 && <b>{count}</b>}</Link>
          <button disabled title="Đăng nhập đang được phát triển"><Icon name="user" />Đăng nhập</button>
        </div>
      </div>
      <nav className={styles.categoryNav} aria-label="Danh mục sản phẩm"
        onKeyDown={event => { if (event.key === "Escape") { categoryDropdownRef.current?.removeAttribute("open"); setActiveCategory(null); } }}>
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
                {categories.map(category => (
                  <button key={category} type="button"
                    className={activeCategory === category ? styles.menuItemActive : styles.menuItem}
                    onMouseEnter={() => setActiveCategory(category)}
                    onPointerMove={() => setActiveCategory(category)}
                    onFocus={() => setActiveCategory(category)}
                    onClick={() => setActiveCategory(category)}>
                    <span>{category}</span><span aria-hidden="true">›</span>
                  </button>
                ))}
              </div>
              <div className={styles.submenu} data-active={activeCategory ?? ""} aria-live="polite">
                <h2>
                  {categories.map(category => <span key={category}>{category}</span>)}
                </h2>
                <p>Các danh mục nhỏ sẽ được cập nhật tại đây.</p>
              </div>
            </div>
        </div>
          </details>
          <div className={styles.categoryLinks}>
            {categories.map(category => (
              <button key={category} type="button" onClick={() => {
                categoryDropdownRef.current?.setAttribute("open", "");
                setActiveCategory(category);
              }}>
                {category}
              </button>
            ))}
          </div>
        </div>
      </nav>
    </header>
  );
}
