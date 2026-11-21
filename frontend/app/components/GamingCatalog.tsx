import Link from "next/link";
import { gamingDealsEndAt, gamingLaptopDeals, gamingLaptopSlug } from "../../data/gamingLaptopDeals";
import LaptopIllustration from "./LaptopIllustration";
import styles from "./GamingCatalog.module.css";

const currency = new Intl.NumberFormat("vi-VN", { style: "currency", currency: "VND" });
const brands = ["TẤT CẢ", "ACER", "ASUS", "LENOVO", "ALIENWARE"];

const specPaths = {
  cpu: "M7 7h10v10H7z M9 9h6v6H9z M9 2v5m6-5v5M9 17v5m6-5v5M2 9h5m-5 6h5m10-6h5m-5 6h5",
  ram: "M3 7h18v10H3z M7 7V4m5 3V4m5 3V4M7 17v3m5-3v3m5-3v3M7 11h3m4 0h3",
  storage: "M4 5h16v14H4z M7 9h10M7 13h6m4 2h1",
  gpu: "M2 7h20v10H2z M12 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0z M18 10h2m-2 4h2",
  screen: "M3 4h18v13H3z M12 17v3m-5 0h10",
};

function SpecIcon({ type }: { type: keyof typeof specPaths }) {
  return (
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5"
      strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
      <path d={specPaths[type]} />
    </svg>
  );
}

export default function GamingCatalog() {
  return (
    <section id="laptop-gaming" className={styles.section} aria-label="Laptop gaming" data-laptop-catalog data-deals-end-at={gamingDealsEndAt}>
      <div className={styles.heading}>
        <h2>Laptop gaming</h2>
        <div className={styles.filters} aria-label="Lọc theo thương hiệu">
          {brands.map((brand, index) => (
            <button key={brand} type="button" data-brand-filter={brand}
              aria-pressed={index === 0}>
              {brand}
            </button>
          ))}
        </div>
      </div>
      <div className={styles.grid}>
        {gamingLaptopDeals.map((deal, index) => (
          <article className={styles.card} key={deal.name} data-catalog-card data-brand={deal.brand}>
            <Link href={`/gaming-laptops/${gamingLaptopSlug(deal.name)}`} className={styles.productLink} aria-label={`Xem chi tiết ${deal.name}`}>
              <div className={styles.image}>
                <LaptopIllustration index={index} />
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
              <del data-deal-original>{currency.format(deal.oldPrice)}</del>
              <span className={styles.discount} data-deal-discount>-{Math.round((1 - deal.price / deal.oldPrice) * 100)}%</span>
              <strong data-deal-price data-sale-price={deal.price} data-original-price={deal.oldPrice}>{currency.format(deal.price)}</strong>
            </div>
          </article>
        ))}
      </div>
    </section>
  );
}
