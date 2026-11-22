import QuickCategories from "@/app/components/QuickCategories";
import GamingDeals from "@/app/components/GamingDeals";
import GamingCatalog from "@/app/components/GamingCatalog";
import OfficeDeals from "@/app/components/OfficeDeals";
import OfficeCatalog from "@/app/components/OfficeCatalog";
import AccessoryShowcase from "@/app/components/AccessoryShowcase";

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

      {/* 6/ Container Bàn Phím Bán Chạy (Chuẩn GearVN: Top 5 + Lọc Hãng góc phải) */}
      <AccessoryShowcase
        title="Bàn phím bán chạy"
        badge="🚀 Giao hỏa tốc 2H"
        categorySlug="keyboards"
      />

      {/* 7/ Container Chuột Bán Chạy (Chuẩn GearVN: Top 5 + Lọc Hãng góc phải) */}
      <AccessoryShowcase
        title="Chuột Gaming & Văn phòng"
        badge="🎁 Tặng kèm Lót chuột"
        categorySlug="mice"
      />

      {/* 8/ Container Tai Nghe Nổi Bật (Chuẩn GearVN: Top 5 + Lọc Hãng góc phải) */}
      <AccessoryShowcase
        title="Tai nghe & Âm thanh"
        badge="🔥 Giảm đến 40%"
        categorySlug="headphones"
      />

      {/* 9/ Container Ổ Cứng & Lưu Trữ (Chuẩn GearVN: Top 5 + Lọc Hãng góc phải) */}
      <AccessoryShowcase
        title="Ổ cứng, SSD & Lưu trữ"
        badge="⚡ Đọc ghi siêu tốc"
        categorySlug="storage"
      />

      {/* 10/ Container Loa & Soundbar Bán Chạy */}
      <AccessoryShowcase
        title="Loa Bluetooth & Soundbar"
        badge="🔊 Âm thanh sống động"
        categorySlug="speakers"
      />

      {/* 11/ Container Củ Sạc Nhanh GaN */}
      <AccessoryShowcase
        title="Củ sạc nhanh GaN chính hãng"
        badge="⚡ Chuẩn sạc PD / QC"
        categorySlug="chargers"
      />

      {/* 12/ Container Pin Sạc Dự Phòng */}
      <AccessoryShowcase
        title="Pin sạc dự phòng dung lượng cao"
        badge="🔋 An toàn chuẩn bay"
        categorySlug="power-banks"
      />

      {/* 13/ Container Hub & Cáp Chuyển Đổi */}
      <AccessoryShowcase
        title="Hub chuyển đổi & Adapter"
        badge="🔌 Đa cổng kết nối"
        categorySlug="hubs-adapters"
      />
    </main>
  );
}
