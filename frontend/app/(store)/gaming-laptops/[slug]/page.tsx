import { getGamingLaptopSpecifications } from "@/data/gamingLaptopSpecifications";
import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { Suspense } from "react";
import LaptopIllustration from "@/app/components/LaptopIllustration";
import GamingLaptopSpecs from "@/app/components/GamingLaptopSpecs";
import { AddToCart, BuyNowButton } from "@/app/components/cart";
import { gamingDealsEndAt, gamingLaptopDeals, gamingLaptopSlug } from "@/data/gamingLaptopDeals";
import styles from "./page.module.css";

type Props = { params: Promise<{ slug: string }> };
const currency = new Intl.NumberFormat("vi-VN", { style: "currency", currency: "VND" });

export function generateStaticParams() {
  return gamingLaptopDeals.map((deal) => ({ slug: gamingLaptopSlug(deal.name) }));
}

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { slug } = await params;
  const deal = gamingLaptopDeals.find((item) => gamingLaptopSlug(item.name) === slug);
  return { title: deal ? `${deal.name} | ConGears` : "Không tìm thấy sản phẩm | ConGears" };
}

async function GamingLaptopContent({ params }: Props) {
  const { slug } = await params;
  const index = gamingLaptopDeals.findIndex((item) => gamingLaptopSlug(item.name) === slug);
  if (index < 0) notFound();
  const deal = gamingLaptopDeals[index];
  const rows = getGamingLaptopSpecifications(index).flatMap(group => group.rows)
    .filter(([label]) => !["Dòng sản phẩm", "Nhu cầu sử dụng"].includes(label));
  const specs = Object.fromEntries(rows);
  const sections = [
    { id: "cau-hinh", title: "Thông số kỹ thuật", body: "" },
    { id: "hieu-nang", title: "Bộ xử lý và đồ họa", body: `Ở cấu hình này, ${deal.name} kết hợp ${deal.cpu} với GPU rời NVIDIA GeForce ${deal.gpu}. ${specs["Dung lượng VRAM"] ? `GPU có ${specs["Dung lượng VRAM"]} bộ nhớ đồ họa riêng để lưu họa tiết và các khung hình khi chơi game.` : "GPU rời đảm nhận việc dựng hình trong game và các ứng dụng đồ họa có hỗ trợ."}` },
    { id: "man-hinh", title: "Trải nghiệm màn hình", body: `Máy sử dụng màn hình ${deal.screen}.${specs["Tần số quét"] ? ` Tần số quét ${specs["Tần số quét"]} giúp chuyển động dễ theo dõi hơn khi tốc độ khung hình của game đủ cao.` : ""}${specs["Độ phủ màu"] ? ` Màn hình đạt độ phủ màu ${specs["Độ phủ màu"]}.` : ""}` },
    { id: "bo-nho", title: "RAM và dung lượng lưu trữ", body: `Máy có sẵn ${deal.ram} RAM${specs["Loại RAM"] ? ` loại ${specs["Loại RAM"]}` : ""} và ổ SSD dung lượng ${deal.storage.replace(" SSD", "")}.${specs["RAM tối đa"] ? ` Khi cần thêm bộ nhớ để làm việc với nhiều ứng dụng, bạn có thể nâng RAM lên tối đa ${specs["RAM tối đa"]}.` : ""}` },
  ];
  const related = gamingLaptopDeals
    .map((item, itemIndex) => ({ item, itemIndex }))
    .filter(({ item, itemIndex }) => itemIndex !== index && item.brand === deal.brand)
    .slice(0, 4);

  return (
    <main className={styles.page} data-deal-detail data-deals-end-at={gamingDealsEndAt}>
      <nav className={styles.breadcrumb} aria-label="Đường dẫn">
        <Link href="/">Trang chủ</Link><span>›</span><Link href="/#laptop-gaming">Laptop gaming</Link><span>›</span><span aria-current="page">{deal.name}</span>
      </nav>

      <div className={styles.hero}>
        <section className={styles.gallery} aria-label={`Hình minh họa ${deal.name}`}>
          <div className={styles.mainImage}><LaptopIllustration index={index} /></div>
          <div className={styles.galleryCaption}><span>Hình minh họa</span><span>{deal.brand}</span></div>
          <GamingLaptopSpecs index={index} name={deal.name} />
        </section>

        <section className={styles.summary} aria-labelledby="product-title">
          <h1 id="product-title">Laptop gaming {deal.name}</h1>
          <p className={styles.configuration}>{[deal.cpu, deal.gpu, deal.ram + " RAM", deal.storage, deal.screen].join(" / ")}</p>
          <button type="button" className={styles.specLink} popoverTarget={`laptop-specs-${index}`}>Thông số kỹ thuật ›</button>
          <div className={styles.priceRow}>
            <strong data-deal-price data-sale-price={deal.price} data-original-price={deal.oldPrice}>{currency.format(deal.price)}</strong>
            <del data-deal-original>{currency.format(deal.oldPrice)}</del>
            <span className={styles.discount} data-deal-discount>-{Math.round((1 - deal.price / deal.oldPrice) * 100)}%</span>
          </div>
          <section className={styles.offer}>
            <h2><span aria-hidden="true">%</span> Ưu đãi đi kèm</h2>
            <p>Học sinh, sinh viên được giảm <strong>10%, tối đa 500.000đ</strong> khi thanh toán sau khi xác minh.</p>
          </section>
          <div className={styles.actions}>
            <BuyNowButton className={styles.buy} slug={slug}>Mua ngay</BuyNowButton>
            <AddToCart slug={slug}>
              <svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" strokeWidth="1.7" aria-hidden="true"><path d="M2 3h3l3 13h11l3-10H6M10 20h.01M18 20h.01M14 7v6m-3-3h6" strokeLinecap="round" /></svg>
            </AddToCart>
          </div>
        </section>
      </div>

      <div className={styles.lower}>
        <section className={styles.description}>
          <h2>Thông tin sản phẩm</h2>
          <div className={styles.articleLayout}>
            <nav className={styles.contents} aria-label="Mục lục thông tin sản phẩm">
              <strong>Mục lục</strong>
              <ol>{sections.map(section => <li key={section.id}><a href={`#${section.id}`}>{section.title}</a></li>)}</ol>
            </nav>
            <div>{sections.map(section => <section className={styles.chapter} id={section.id} key={section.id}>
              <h3>{section.title}</h3>
              {section.body ? <p>{section.body}</p> : <table aria-label="Thông số kỹ thuật"><tbody>{rows.map(([label, value]) =>
                <tr key={label}><th scope="row">{label}</th><td>{value}</td></tr>
              )}</tbody></table>}
            </section>)}</div>
          </div>
        </section>
      </div>

      {related.length > 0 && <section className={styles.related}>
        <h2>Sản phẩm cùng thương hiệu</h2>
        <div className={styles.relatedGrid}>{related.map(({ item, itemIndex }) => <Link key={item.name} href={`/gaming-laptops/${gamingLaptopSlug(item.name)}`} className={styles.relatedCard}>
          <div><LaptopIllustration index={itemIndex} /></div>
          <h3>{item.name}</h3>
          <strong data-deal-price data-sale-price={item.price} data-original-price={item.oldPrice}>{currency.format(item.price)}</strong>
        </Link>)}</div>
      </section>}
    </main>
  );
}

export default function GamingLaptopDetail(props: Props) {
  return (
    <Suspense fallback={<div className="min-h-96 w-full flex items-center justify-center text-gray-500">Đang tải sản phẩm...</div>}>
      <GamingLaptopContent params={props.params} />
    </Suspense>
  );
}
