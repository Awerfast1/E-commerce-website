import { getOfficeLaptopSpecifications } from "@/data/officeLaptopSpecifications";
import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { Suspense } from "react";
import LaptopIllustration from "@/app/components/LaptopIllustration";
import OfficeLaptopSpecs from "@/app/components/OfficeLaptopSpecs";
import { AddToCart, BuyNowButton } from "@/app/components/cart";
import ProductActivityTracker from "@/app/components/ProductActivityTracker";
import { officeLaptopDeals, officeLaptopSlug } from "@/data/officeLaptopDeals";
import styles from "./page.module.css";

type Props = { params: Promise<{ slug: string }> };
const currency = new Intl.NumberFormat("vi-VN", { style: "currency", currency: "VND" });

export function generateStaticParams() {
  return officeLaptopDeals.map((deal) => ({ slug: officeLaptopSlug(deal.name) }));
}

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { slug } = await params;
  const deal = officeLaptopDeals.find((item) => officeLaptopSlug(item.name) === slug);
  return { title: deal ? `${deal.name} | ConGears` : "Không tìm thấy sản phẩm | ConGears" };
}

async function OfficeLaptopContent({ params }: Props) {
  const { slug } = await params;
  const index = officeLaptopDeals.findIndex((item) => officeLaptopSlug(item.name) === slug);
  if (index < 0) notFound();
  const deal = officeLaptopDeals[index];
  const groups = getOfficeLaptopSpecifications(index);
  const rows = groups.flatMap(group => group.rows);

  const sections = [
    { id: "cau-hinh", title: "Thông số kỹ thuật", body: "" },
    { id: "hieu-nang", title: "Bộ xử lý và tính năng văn phòng", body: `${deal.name} trang bị bộ vi xử lý ${deal.cpu} tối ưu cho công việc hàng ngày, kết hợp đồ họa ${deal.gpu}. ${deal.highlight}.` },
    { id: "man-hinh", title: "Trải nghiệm màn hình & Trọng lượng", body: `Màn hình ${deal.screen} hiển thị sắc nét cho tài liệu, bảng tính và hội họp online. Máy có trọng lượng siêu nhẹ chỉ ${deal.weight}, lý tưởng mang theo đi học, đi làm hoặc công tác.` },
    { id: "bo-nho", title: "RAM và lưu trữ", body: `Máy sở hữu ${deal.ram} giúp đa nhiệm mượt mà nhiều tab trình duyệt, cùng ổ SSD ${deal.storage} khởi động máy và ứng dụng siêu tốc.` },
  ];

  const related = officeLaptopDeals
    .map((item, itemIndex) => ({ item, itemIndex }))
    .filter(({ item, itemIndex }) => itemIndex !== index && item.brand === deal.brand)
    .slice(0, 4);

  return (
    <main className={styles.page}>
      <ProductActivityTracker slug={slug} />
      <nav className={styles.breadcrumb} aria-label="Đường dẫn">
        <Link href="/">Trang chủ</Link><span>›</span><Link href="/#laptop-van-phong">Laptop văn phòng</Link><span>›</span><span aria-current="page">{deal.name}</span>
      </nav>

      <div className={styles.hero}>
        <section className={styles.gallery} aria-label={`Hình minh họa ${deal.name}`}>
          <div className={styles.mainImage}><LaptopIllustration index={index + 20} /></div>
          <div className={styles.galleryCaption}><span>Hình minh họa</span><span>{deal.brand}</span></div>
          <OfficeLaptopSpecs index={index} name={deal.name} />
        </section>

        <section className={styles.summary} aria-labelledby="product-title">
          <h1 id="product-title">Laptop {deal.name}</h1>
          <p className={styles.configuration}>{[deal.cpu, deal.gpu, deal.ram, deal.storage, deal.screen, deal.weight].join(" / ")}</p>
          <button type="button" className={styles.specLink} popoverTarget={`office-laptop-specs-${index}`}>Thông số kỹ thuật ›</button>
          <div className={styles.priceRow}>
            <strong>{currency.format(deal.price)}</strong>
            <del>{currency.format(deal.oldPrice)}</del>
            <span className={styles.discount}>-{Math.round((1 - deal.price / deal.oldPrice) * 100)}%</span>
          </div>
          <section className={styles.offer}>
            <h2><span aria-hidden="true">%</span> Ưu đãi học tập & văn phòng</h2>
            <p>Tặng kèm balo, túi chống sốc chính hãng. Học sinh, sinh viên giảm thêm <strong>10%, tối đa 500.000đ</strong> khi thanh toán.</p>
          </section>
          <div className={styles.actions}>
            <BuyNowButton className={styles.buy} slug={slug}>Mua ngay</BuyNowButton>
            <AddToCart slug={slug}>
              <svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" strokeWidth="1.7" aria-hidden="true">
                <path d="M2 3h3l3 13h11l3-10H6M10 20h.01M18 20h.01M14 7v6m-3-3h6" strokeLinecap="round" />
              </svg>
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
        <div className={styles.relatedGrid}>{related.map(({ item, itemIndex }) => <Link key={item.name} href={`/laptop-van-phong/${officeLaptopSlug(item.name)}`} className={styles.relatedCard}>
          <div><LaptopIllustration index={itemIndex + 20} /></div>
          <h3>{item.name}</h3>
          <strong>{currency.format(item.price)}</strong>
        </Link>)}</div>
      </section>}
    </main>
  );
}

export default function OfficeLaptopDetail(props: Props) {
  return (
    <Suspense fallback={<div className="min-h-96 w-full flex items-center justify-center text-gray-500">Đang tải sản phẩm...</div>}>
      <OfficeLaptopContent params={props.params} />
    </Suspense>
  );
}
