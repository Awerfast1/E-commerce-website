import { Suspense } from "react";
import { connection } from "next/server";

import QuickCategories from "@/app/components/QuickCategories";
import GamingDeals from "@/app/components/GamingDeals";
import GamingCatalog from "@/app/components/GamingCatalog";
import OfficeDeals from "@/app/components/OfficeDeals";
import OfficeCatalog from "@/app/components/OfficeCatalog";
import AccessoryShowcase from "@/app/components/AccessoryShowcase";
import { getStoreProducts, type StoreProduct } from "@/lib/store/catalog";

const accessorySections = [
  { title: "Bàn phím bán chạy", badge: "🚀 Giao hỏa tốc 2H", categorySlug: "keyboards" },
  { title: "Chuột Gaming & Văn phòng", badge: "🎁 Tặng kèm Lót chuột", categorySlug: "mice" },
  { title: "Tai nghe & Âm thanh", badge: "🔥 Giảm đến 40%", categorySlug: "headphones" },
  { title: "Ổ cứng, SSD & Lưu trữ", badge: "⚡ Đọc ghi siêu tốc", categorySlug: "storage" },
  { title: "Loa Bluetooth & Soundbar", badge: "🔊 Âm thanh sống động", categorySlug: "speakers" },
  { title: "Củ sạc nhanh GaN chính hãng", badge: "⚡ Chuẩn sạc PD / QC", categorySlug: "chargers" },
  { title: "Pin sạc dự phòng dung lượng cao", badge: "🔋 An toàn chuẩn bay", categorySlug: "power-banks" },
  { title: "Hub chuyển đổi & Adapter", badge: "🔌 Đa cổng kết nối", categorySlug: "hubs-adapters" },
];

async function AccessorySections() {
  await connection();

  const products = await getStoreProducts();
  const byCategory = new Map<string, StoreProduct[]>();
  for (const product of products) {
    const list = byCategory.get(product.categorySlug);
    if (list) list.push(product);
    else byCategory.set(product.categorySlug, [product]);
  }

  return (
    <>
      {accessorySections.map((section) => (
        <AccessoryShowcase
          key={section.categorySlug}
          title={section.title}
          badge={section.badge}
          categorySlug={section.categorySlug}
          products={byCategory.get(section.categorySlug) ?? []}
        />
      ))}
    </>
  );
}

export default function Home() {
  return (
    <main className="w-full flex-1 bg-gray-50 pb-16">
      {/* 1/ Thanh danh mục nhanh 12 icon */}
      <QuickCategories />

      {/* 2/ Container Laptop Gaming Deal Sốc */}
      <GamingDeals />

      {/* 3/ Container Laptop Gaming Bán Chạy (Chuẩn GearVN: Top 5 + Lọc Hãng góc phải) */}
      <GamingCatalog />

      {/* 4/ Container Laptop Văn Phòng Deal Nổi Bật */}
      <OfficeDeals />

      {/* 5/ Container Laptop Văn Phòng Bán Chạy (Chuẩn GearVN: Top 5 + Lọc Hãng góc phải) */}
      <OfficeCatalog />

      {/* 6-13/ Các danh mục phụ kiện, đọc trực tiếp từ Supabase */}
      <Suspense
        fallback={
          <div className="mx-auto max-w-7xl px-4 py-10 text-center text-gray-500">
            Đang tải sản phẩm...
          </div>
        }
      >
        <AccessorySections />
      </Suspense>
    </main>
  );
}
