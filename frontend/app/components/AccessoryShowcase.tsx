"use client";

import { useState } from "react";
import Link from "next/link";
import styles from "./GearVnShowcase.module.css";
import supabaseProductsRaw from "../../data/supabaseProducts.json";
import type { CatalogProduct } from "./GenericCategoryCollection";

const supabaseProducts = supabaseProductsRaw as CatalogProduct[];
const currency = new Intl.NumberFormat("vi-VN", { style: "currency", currency: "VND" });

function AccessoryIllustration({ slug, index }: { slug: string; index: number }) {
  const colors = ["#eff6ff", "#f0fdf4", "#faf5ff", "#fff7ed", "#fdf2f8"];
  const strokes = ["#2563eb", "#16a34a", "#9333ea", "#ea580c", "#db2777"];
  const bg = colors[index % colors.length];
  const stroke = strokes[index % strokes.length];

  return (
    <svg viewBox="0 0 160 120" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
      <rect width="160" height="120" rx="8" fill={bg} />
      {slug === "keyboards" && (
        <g stroke={stroke} strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round">
          <rect x="25" y="35" width="110" height="50" rx="6" />
          <path d="M40 48h8m12 0h8m12 0h8m12 0h8M40 60h8m12 0h8m12 0h8m12 0h8M50 72h60" />
        </g>
      )}
      {slug === "mice" && (
        <g stroke={stroke} strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round">
          <rect x="55" y="25" width="50" height="70" rx="25" />
          <line x1="80" y1="25" x2="80" y2="55" />
          <line x1="55" y1="50" x2="105" y2="50" />
        </g>
      )}
      {slug === "headphones" && (
        <g stroke={stroke} strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round">
          <path d="M45 65v-15a35 35 0 0 1 70 0v15" />
          <rect x="38" y="60" width="14" height="28" rx="7" />
          <rect x="108" y="60" width="14" height="28" rx="7" />
        </g>
      )}
      {slug === "storage" && (
        <g stroke={stroke} strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round">
          <rect x="35" y="30" width="90" height="60" rx="8" />
          <path d="M50 45h60M50 60h40m15 15h5" />
          <circle cx="108" cy="75" r="3" fill={stroke} />
        </g>
      )}
    </svg>
  );
}

export default function AccessoryShowcase({
  title,
  badge,
  categorySlug,
}: {
  title: string;
  badge: string;
  categorySlug: "mice" | "keyboards" | "headphones" | "storage";
}) {
  const categoryProducts = supabaseProducts.filter(p => p.categories?.slug === categorySlug);
  const brands = [
    "TẤT CẢ",
    ...Array.from(new Set(categoryProducts.map(p => p.brands?.brand_name).filter(Boolean) as string[])),
  ];

  const [selectedBrand, setSelectedBrand] = useState("TẤT CẢ");

  const filtered = categoryProducts
    .filter(p => selectedBrand === "TẤT CẢ" || p.brands?.brand_name === selectedBrand)
    .slice(0, 5); // Chuẩn GearVN: top 5 sản phẩm ngang

  return (
    <section className={styles.section} aria-label={title}>
      <div className={styles.heading}>
        <div className={styles.titleArea}>
          <h2>{title}</h2>
          <span className={styles.promoBadge}>{badge}</span>
        </div>

        <div className={styles.filters} aria-label={`Lọc ${title}`}>
          {brands.map((b) => (
            <button
              key={b}
              type="button"
              aria-pressed={selectedBrand === b}
              onClick={() => setSelectedBrand(b)}
            >
              {b}
            </button>
          ))}
          <Link href={`/categories/${categorySlug}`} className={styles.viewAll}>
            Xem tất cả ›
          </Link>
        </div>
      </div>

      <div className={styles.grid}>
        {filtered.map((product, idx) => {
          const variant = product.product_variants?.[0];
          const price = variant?.price || 0;
          const compareAtPrice = variant?.compare_at_price;
          const discount = compareAtPrice && compareAtPrice > price
            ? Math.round((1 - price / compareAtPrice) * 100)
            : 0;

          return (
            <article className={styles.card} key={product.product_id}>
              <Link href={`/categories/${categorySlug}`} className={styles.productLink}>
                <div className={styles.image}>
                  <AccessoryIllustration slug={categorySlug} index={idx} />
                </div>
                <h3>{product.product_name}</h3>
              </Link>

              <div className={styles.specs}>
                <span>{product.brands?.brand_name || "Chính hãng"}</span>
                <span>{product.short_description || "Bảo hành 24T"}</span>
              </div>

              <div className={styles.prices}>
                {compareAtPrice && compareAtPrice > price && (
                  <div className={styles.oldPriceRow}>
                    <del>{currency.format(compareAtPrice)}</del>
                    <span className={styles.discount}>-{discount}%</span>
                  </div>
                )}
                <strong>{currency.format(price)}</strong>
              </div>
            </article>
          );
        })}
      </div>
    </section>
  );
}
