"use client";

import { useState } from "react";
import Link from "next/link";
import { gamingLaptopDeals, gamingLaptopSlug } from "../../data/gamingLaptopDeals";
import LaptopIllustration from "./LaptopIllustration";
import styles from "./GearVnShowcase.module.css";

const currency = new Intl.NumberFormat("vi-VN", { style: "currency", currency: "VND" });
const brands = ["TẤT CẢ", "ACER", "ASUS", "LENOVO", "ALIENWARE"];

export default function GamingCatalog() {
  const [selectedBrand, setSelectedBrand] = useState("TẤT CẢ");

  const filteredDeals = gamingLaptopDeals
    .filter(deal => selectedBrand === "TẤT CẢ" || deal.brand === selectedBrand)
    .slice(0, 5); // Chuẩn GearVN: chỉ hiển thị top 5 sản phẩm nổi bật ngang

  return (
    <section id="laptop-gaming" className={styles.section} aria-label="Laptop gaming bán chạy">
      <div className={styles.heading}>
        <div className={styles.titleArea}>
          <h2>Laptop gaming bán chạy</h2>
          <span className={styles.promoBadge}>🎁 Tặng Balo + Chuột Gaming</span>
        </div>

        <div className={styles.filters} aria-label="Lọc theo thương hiệu">
          {brands.map((brand) => (
            <button
              key={brand}
              type="button"
              aria-pressed={selectedBrand === brand}
              onClick={() => setSelectedBrand(brand)}
            >
              {brand}
            </button>
          ))}
          <Link href="/categories/laptop?type=gaming" className={styles.viewAll}>
            Xem tất cả ›
          </Link>
        </div>
      </div>

      <div className={styles.grid}>
        {filteredDeals.map((deal) => {
          const originalIndex = gamingLaptopDeals.findIndex(d => d.name === deal.name);
          const discountPercent = Math.round((1 - deal.price / deal.oldPrice) * 100);

          return (
            <article className={styles.card} key={deal.name}>
              <Link
                href={`/gaming-laptops/${gamingLaptopSlug(deal.name)}`}
                className={styles.productLink}
                aria-label={`Xem chi tiết ${deal.name}`}
              >
                <div className={styles.image}>
                  <LaptopIllustration index={originalIndex >= 0 ? originalIndex : 0} />
                </div>
                <h3>{deal.name}</h3>
              </Link>

              <div className={styles.specs}>
                <span>{deal.cpu}</span>
                <span>{deal.gpu}</span>
                <span>{deal.ram}</span>
                <span>{deal.storage}</span>
                <span>{deal.screen}</span>
              </div>

              <div className={styles.prices}>
                <div className={styles.oldPriceRow}>
                  <del>{currency.format(deal.oldPrice)}</del>
                  <span className={styles.discount}>-{discountPercent}%</span>
                </div>
                <strong>{currency.format(deal.price)}</strong>
              </div>
            </article>
          );
        })}
      </div>
    </section>
  );
}
