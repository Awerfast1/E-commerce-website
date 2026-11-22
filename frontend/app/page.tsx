import QuickCategories from "./components/QuickCategories";
import GamingDeals from "./components/GamingDeals";
import GamingCatalog from "./components/GamingCatalog";
import OfficeDeals from "./components/OfficeDeals";
import OfficeCatalog from "./components/OfficeCatalog";
import AccessoryShowcase from "./components/AccessoryShowcase";

export default function Home() {
  return (
    <main className="w-full flex-1 bg-gray-50 pb-16">
      {/* 1. Thanh danh mục nhanh 12 icon */}
      <QuickCategories />

      {/* 2. Container Laptop Gaming Deal Sốc */}
      <GamingDeals />

      {/* 3. Container Laptop Gaming Bán Chạy (Chuẩn GearVN: Top 5 + Lọc Hãng góc phải) */}
      <GamingCatalog />

      {/* 4. Container Laptop Văn Phòng Deal Nổi Bật */}
      <OfficeDeals />

      {/* 5. Container Laptop Văn Phòng Bán Chạy (Chuẩn GearVN: Top 5 + Lọc Hãng góc phải) */}
      <OfficeCatalog />

      {/* 6. Container Bàn Phím Bán Chạy (Chuẩn GearVN: Top 5 + Lọc Hãng góc phải) */}
      <AccessoryShowcase
        title="Bàn phím bán chạy"
        badge="🚀 Giao hỏa tốc 2H"
        categorySlug="keyboards"
      />

      {/* 7. Container Chuột Bán Chạy (Chuẩn GearVN: Top 5 + Lọc Hãng góc phải) */}
      <AccessoryShowcase
        title="Chuột Gaming & Văn phòng"
        badge="🎁 Tặng kèm Lót chuột"
        categorySlug="mice"
      />

      {/* 8. Container Tai Nghe Nổi Bật (Chuẩn GearVN: Top 5 + Lọc Hãng góc phải) */}
      <AccessoryShowcase
        title="Tai nghe & Âm thanh"
        badge="🔥 Giảm đến 40%"
        categorySlug="headphones"
      />

      {/* 9. Container Ổ Cứng & Lưu Trữ (Chuẩn GearVN: Top 5 + Lọc Hãng góc phải) */}
      <AccessoryShowcase
        title="Ổ cứng, SSD & Lưu trữ"
        badge="⚡ Đọc ghi siêu tốc"
        categorySlug="storage"
      />
    </main>
  );
}
