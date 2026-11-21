"use client";

import { useRef } from "react";
import Link from "next/link";
import { officeLaptopDeals, officeLaptopSlug } from "../../data/officeLaptopDeals";
import LaptopIllustration from "./LaptopIllustration";
import styles from "./GamingDeals.module.css";

const currency = new Intl.NumberFormat("vi-VN", { style: "currency", currency: "VND" });

export default function OfficeDeals() {
  const trackRef = useRef<HTMLDivElement>(null);

  const handleSlide = (direction: number) => {
    const track = trackRef.current;
    if (!track) return;
    const viewport = track.getBoundingClientRect();
    const cards = Array.from(track.querySelectorAll("article"));
    const target = direction > 0
      ? cards.find(card => card.getBoundingClientRect().right > viewport.right + 1)
      : cards.filter(card => card.getBoundingClientRect().left < viewport.left - 1).at(-1);

    if (target) {
      const cardPosition = target.getBoundingClientRect().left - viewport.left;
      track.scrollTo({ left: track.scrollLeft + cardPosition, behavior: "smooth" });
    }
  };

  return (
    <section className={styles.section} style={{ background: "#0e7490" }} aria-label="Laptop văn phòng ưu đãi">
      <div className={styles.header}>
        <h2>LAPTOP VĂN PHÒNG & HỌC TẬP GIÁ TỐT</h2>
        <div className={styles.timer} role="status" aria-label="Khuyến mãi tốt nhất">
          <span style={{ background: "#155e75", fontSize: "14px", textTransform: "uppercase" }}>Mỏng nhẹ - Bền bỉ</span>
        </div>
      </div>
      <p className={styles.note}>Tuyển chọn 20 mẫu laptop văn phòng mỏng nhẹ, pin trâu, màn hình sắc nét được ưa chuộng tại GearVN.</p>
      <div className={styles.carousel}>
        <button
          className={styles.arrow}
          type="button"
          aria-label="Xem sản phẩm trước"
          onClick={() => handleSlide(-1)}
        >
          ‹
        </button>
        <div className={styles.track} ref={trackRef}>
          {officeLaptopDeals.map((deal, index) => (
            <article className={styles.card} key={deal.name}>
              <span className={styles.discount} style={{ background: "#0891b2" }}>
                -{Math.round((1 - deal.price / deal.oldPrice) * 100)}%
              </span>
              <Link
                href={`/laptop-van-phong/${officeLaptopSlug(deal.name)}`}
                className={styles.productLink}
                aria-label={`Xem chi tiết ${deal.name}`}
              >
                <div className={styles.art}>
                  <LaptopIllustration index={index + 30} />
                </div>
                <h3>{deal.name}</h3>
              </Link>
              <strong>{currency.format(deal.price)}</strong>
              <del>{currency.format(deal.oldPrice)}</del>
            </article>
          ))}
        </div>
        <button
          className={styles.arrow}
          type="button"
          aria-label="Xem sản phẩm tiếp theo"
          onClick={() => handleSlide(1)}
        >
          ›
        </button>
      </div>
    </section>
  );
}
