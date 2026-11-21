"use client";

import { useEffect, useState, useRef } from "react";
import Link from "next/link";
import { gamingDealsEndAt, gamingLaptopDeals, gamingLaptopSlug } from "../../data/gamingLaptopDeals";
import LaptopIllustration from "./LaptopIllustration";
import styles from "./GamingDeals.module.css";

const currency = new Intl.NumberFormat("vi-VN", { style: "currency", currency: "VND" });

export default function GamingDeals() {
  const [timeLeft, setTimeLeft] = useState<{
    dayCount: number;
    hourCount: number;
    minuteCount: number;
    secondCount: number;
    isEnded: boolean;
  } | null>(null);

  const trackRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const end = Date.parse(gamingDealsEndAt);

    function update() {
      const remaining = Math.max(0, Math.ceil((end - Date.now()) / 1000));
      setTimeLeft({
        dayCount: Math.floor(remaining / 86400),
        hourCount: Math.floor((remaining % 86400) / 3600),
        minuteCount: Math.floor((remaining % 3600) / 60),
        secondCount: remaining % 60,
        isEnded: remaining === 0,
      });
    }

    update();
    const interval = setInterval(update, 1000);
    return () => clearInterval(interval);
  }, []);

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

  if (timeLeft?.isEnded) {
    return null;
  }

  const ariaLabel = timeLeft
    ? `Còn ${timeLeft.dayCount} ngày ${timeLeft.hourCount} giờ ${timeLeft.minuteCount} phút ${timeLeft.secondCount} giây`
    : "Còn 7 ngày";

  return (
    <section className={styles.section} aria-label="Laptop gaming ưu đãi">
      <div className={styles.header}>
        <h2>LAPTOP GAMING GIÁ TỐT</h2>
        <div className={styles.timer} role="timer" aria-label={ariaLabel}>
          <span>{timeLeft ? `${timeLeft.dayCount} ngày` : "7 ngày"}</span>
          <span>{timeLeft ? String(timeLeft.hourCount).padStart(2, "0") : "00"}</span>
          <b>:</b>
          <span>{timeLeft ? String(timeLeft.minuteCount).padStart(2, "0") : "00"}</span>
          <b>:</b>
          <span>{timeLeft ? String(timeLeft.secondCount).padStart(2, "0") : "00"}</span>
        </div>
      </div>
      <p className={styles.note}>Giá minh họa để duyệt giao diện. Sản phẩm chưa mở bán.</p>
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
          {gamingLaptopDeals.map((deal, index) => (
            <article className={styles.card} key={deal.name}>
              <span className={styles.discount}>
                -{Math.round((1 - deal.price / deal.oldPrice) * 100)}%
              </span>
              <Link
                href={`/gaming-laptops/${gamingLaptopSlug(deal.name)}`}
                className={styles.productLink}
                aria-label={`Xem chi tiết ${deal.name}`}
              >
                <div className={styles.art}>
                  <LaptopIllustration index={index} />
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
