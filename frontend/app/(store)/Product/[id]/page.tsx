import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { Suspense } from "react";
import { connection } from "next/server";
import { products as dummyProducts } from "@/data/Products";
import { getProductById, toCatalogProduct } from "@/lib/store/catalog";
import styles from "../../gaming-laptops/[slug]/page.module.css";
import catalogStyles from "./page.module.css";
import ProductSpecsDrawer from "@/app/components/ProductSpecsDrawer";
import { AddToCart, BuyNowButton } from "@/app/components/cart";
const highlightLabels = ["CPU", "Processor", "RAM", "Storage", "Ổ cứng", "Graphics Card", "Card đồ họa", "Screen Size", "Màn hình", "Refresh Rate", "Độ phân giải"];

const formatVND = (price: number) => new Intl.NumberFormat("vi-VN", { style: "currency", currency: "VND" }).format(price);

export async function generateMetadata({params}:{params:Promise<{id:string}>}):Promise<Metadata>{
  const {id}=await params;
  const remote=await getProductById(id);
  const legacy=dummyProducts.find(p=>String(p.id)===id);
  return {title: remote ? `${remote.product_name} | ConGears` : legacy ? `${legacy.name} | ConGears` : "Sản phẩm | ConGears"};
}

async function ProductContent({params}:{params:Promise<{id:string}>}){
  const {id}=await params;
  await connection();
  const row=await getProductById(id);
  const remote=row ? toCatalogProduct(row) : undefined;
  const legacy=dummyProducts.find(p=>String(p.id)===id);
  if(!remote&&!legacy)notFound();

  const name=remote?.product_name ?? legacy!.name;
  const brand=remote?.brands?.brand_name ?? legacy!.brand.name;
  const category=remote?.categories?.category_name ?? "Sản phẩm";
  const categorySlug=remote?.categories?.slug ?? "laptop";
  const variant=remote?.product_variants?.[0];
  const price=variant?.price ?? legacy!.price*25000;
  const oldPrice=variant?.compare_at_price && variant.compare_at_price>price ? variant.compare_at_price : 0;
  const specs=remote?.product_specifications.map(s=>[s.specification_name,s.specification_value] as const)
    ?? legacy!.specifications.map(s=>[s.name,`${s.value}${s.unit ? ` ${s.unit}` : ""}`] as const);
  const image=remote?.product_images.find(i=>i.is_primary)?.image_url ?? remote?.product_images[0]?.image_url ?? legacy?.images[0];
  const description=remote?.description ?? legacy?.longDescription ?? legacy?.shortDescription ?? "";

  return <main className={styles.page} lang="vi">
    <nav className={styles.breadcrumb} aria-label="Đường dẫn"><Link href="/">Trang chủ</Link><span>›</span><Link href={`/categories/${categorySlug}`}>{category}</Link><span>›</span><span aria-current="page">{name}</span></nav>
    <div className={styles.hero}>
      <section className={styles.gallery} aria-label={`Hình sản phẩm ${name}`}>
        <div className={styles.mainImage}>{image ? <img src={image} alt={name}/> : <div className={catalogStyles.imageFallback}>{name}</div>}</div>
        <div className={styles.galleryCaption}><span>Hình sản phẩm</span><span>{brand}</span></div>
        <ProductSpecsDrawer name={name} specs={specs} image={image}/>
      </section>
      <section className={styles.summary} aria-labelledby="product-title">
        <h1 id="product-title">{name}</h1>
        {variant?.sku && <p className={catalogStyles.sku}>Mã sản phẩm: {variant.sku}</p>}
        <p className={styles.configuration}>{brand} · {category}</p>
        <Link className={styles.specLink} href="#product-specifications">Thông số kỹ thuật ›</Link>
        <div className={styles.priceRow}><strong>{formatVND(price)}</strong>{oldPrice>price&&<><del>{formatVND(oldPrice)}</del><span className={styles.discount}>-{Math.round((1-price/oldPrice)*100)}%</span></>}</div>
        <section className={styles.offer}><h2><span>%</span> Ưu đãi đi kèm</h2><p>Ưu đãi hiện có sẽ được áp dụng theo chương trình của sản phẩm.</p></section>
        <div className={styles.actions}>
          <BuyNowButton className={styles.buy} slug={remote?.slug || id}>Mua ngay</BuyNowButton>
          <AddToCart slug={remote?.slug || id}>
            <svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" strokeWidth="1.8" aria-hidden="true">
              <path d="M2 3h3l3 13h11l3-10H6M10 20h.01M18 20h.01M14 7v6m-3-3h6" strokeLinecap="round" />
            </svg>
          </AddToCart>
        </div>
      </section>
    </div>
    <section className={catalogStyles.productInfo}>
      <h2>Thông tin sản phẩm</h2>
      <div className={catalogStyles.articleLayout}>
        <nav className={catalogStyles.contents} aria-label="Mục lục thông tin sản phẩm"><strong>Mục lục</strong><ol>
          <li><a href="#product-specifications">Thông số kỹ thuật</a></li>
          <li><a href="#product-overview">Tổng quan sản phẩm</a></li>
          <li><a href="#product-performance">Đặc điểm nổi bật</a></li>
          <li><a href="#product-usage">Khả năng sử dụng</a></li>
        </ol></nav>
        <div className={catalogStyles.article}>
          <section id="product-specifications"><h3>Thông số kỹ thuật</h3><table><tbody>{specs.map(([label,value])=><tr key={label}><th>{label}</th><td>{value}</td></tr>)}</tbody></table></section>
          <section id="product-overview"><h3>Tổng quan sản phẩm {name}</h3><p>{description || `${name} là sản phẩm thuộc danh mục ${category} của thương hiệu ${brand}. Các thông tin cấu hình chi tiết được trình bày trong bảng thông số kỹ thuật.`}</p></section>
          <section id="product-performance"><h3>Đặc điểm nổi bật</h3><p>{specs.slice(0,4).map(([label,value])=>`${label}: ${value}`).join(". ")}.</p></section>
          <section id="product-usage"><h3>Khả năng sử dụng</h3><p>Sản phẩm được thiết kế phục vụ nhu cầu sử dụng thuộc nhóm {category.toLowerCase()}. Hãy tham khảo các thông số phía trên để đối chiếu với nhu cầu của bạn.</p></section>
        </div>
      </div>
    </section>
  </main>;
}

export default function ProductDetailPage(props:{params:Promise<{id:string}>}){
  return <Suspense fallback={<div className="min-h-96"/>}><ProductContent params={props.params} /></Suspense>;
}
