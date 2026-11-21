"use client";

import { useState } from "react";
import Link from "next/link";
import { officeLaptopDeals, officeLaptopSlug } from "../../data/officeLaptopDeals";
import LaptopIllustration from "./LaptopIllustration";
import styles from "./GamingCatalog.module.css";

const currency = new Intl.NumberFormat("vi-VN", { style: "currency", currency: "VND" });
const brands = ["TẤT CẢ", "ASUS", "ACER", "LENOVO", "DELL", "HP", "LG"];

const specPaths = {
  cpu: "M7 7h10v10H7z M9 9h6v6H9z M9 2v5m6-5v5M9 17v5m6-5v5M2 9h5m-5 6h5m10-6h5m-5 6h5",
  ram: "M3 7h18v10H3z M7 7V4m5 3V4m5 3V4M7 17v3m5-3v3m5-3v3M7 11h3m4 0h3",
  storage: "M4 5h16v14H4z M7 9h10M7 13h6m4 2h1",
  gpu: "M2 7h20v10H2z M12 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0z M18 10h2m-2 4h2",
  screen: "M3 4h18v13H3z M12 17v3m-5 0h10",
};

function SpecIcon({ type }: { type: keyof typeof specPaths }) {
  return (
    <svg
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
      aria-hidden="true"
    >
      <path d={specPaths[type]} />
    </svg>
  );
}

export default function OfficeCatalog() {
  const [selectedBrand, setSelectedBrand] = useState("TẤT CẢ");

  return (
    <section id="laptop-van-phong" className={styles.section} aria-label="Laptop văn phòng">
      <div className={styles.heading}>
        <h2>Laptop văn phòng & Học tập mỏng nhẹ</h2>
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
        </div>
      </div>
      <div className={styles.grid}>
        {officeLaptopDeals.map((deal, index) => (
          <article
            className={styles.card}
            key={deal.name}
            hidden={selectedBrand !== "TẤT CẢ" && deal.brand !== selectedBrand}
          >
            <Link
              href={`/laptop-van-phong/${officeLaptopSlug(deal.name)}`}
              className={styles.productLink}
              aria-label={`Xem chi tiết ${deal.name}`}
            >
              <div className={styles.image}>
                <LaptopIllustration index={index + 20} />
              </div>
              <h3>{deal.name}</h3>
            </Link>
            <div className={styles.specs}>
              <span><SpecIcon type="cpu" />{deal.cpu}</span>
              <span><SpecIcon type="ram" />{deal.ram}</span>
              <span><SpecIcon type="storage" />{deal.storage}</span>
              <span><SpecIcon type="gpu" />{deal.gpu}</span>
              <span><SpecIcon type="screen" />{deal.screen}</span>
            </div>
            <div className={styles.prices}>
              <del>{currency.format(deal.oldPrice)}</del>
              <span className={styles.discount}>-{Math.round((1 - deal.price / deal.oldPrice) * 100)}%</span>
              <strong>{currency.format(deal.price)}</strong>
            </div>
          </article>
        ))}
      </div>
    </section>
  );
}
