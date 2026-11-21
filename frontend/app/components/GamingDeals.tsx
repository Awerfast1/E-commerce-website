import Link from "next/link";
import { gamingDealsEndAt, gamingLaptopDeals, gamingLaptopSlug } from "../../data/gamingLaptopDeals";
import LaptopIllustration from "./LaptopIllustration";
import styles from "./GamingDeals.module.css";

const currency = new Intl.NumberFormat("vi-VN", { style: "currency", currency: "VND" });

export default function GamingDeals() {
  return (
    <section className={styles.section} aria-label="Laptop gaming ưu đãi" data-gaming-deals data-deals-end-at={gamingDealsEndAt}>
      <div className={styles.header}>
        <h2>LAPTOP GAMING GIÁ TỐT</h2>
        <div className={styles.timer} role="timer" aria-label="Còn 7 ngày" data-deals-timer>
          <span data-days>7 ngày</span><span data-hours>00</span><b>:</b><span data-minutes>00</span><b>:</b><span data-seconds>00</span>
        </div>
      </div>
      <p className={styles.note}>Giá minh họa để duyệt giao diện. Sản phẩm chưa mở bán.</p>
      <div className={styles.carousel}>
        <button className={styles.arrow} type="button" aria-label="Xem sản phẩm trước" data-slide="-1">‹</button>
        <div className={styles.track} data-deals-track>
          {gamingLaptopDeals.map((deal, index) => (
            <article className={styles.card} key={deal.name}>
              <span className={styles.discount} data-deal-discount>-{Math.round((1 - deal.price / deal.oldPrice) * 100)}%</span>
              <Link href={`/gaming-laptops/${gamingLaptopSlug(deal.name)}`} className={styles.productLink} aria-label={`Xem chi tiết ${deal.name}`}>
                <div className={styles.art}><LaptopIllustration index={index} /></div>
                <h3>{deal.name}</h3>
              </Link>
              <strong data-deal-price data-sale-price={deal.price} data-original-price={deal.oldPrice}>{currency.format(deal.price)}</strong>
              <del data-deal-original>{currency.format(deal.oldPrice)}</del>
            </article>
          ))}
        </div>
        <button className={styles.arrow} type="button" aria-label="Xem sản phẩm tiếp theo" data-slide="1">›</button>
      </div>
    </section>
  );
}
