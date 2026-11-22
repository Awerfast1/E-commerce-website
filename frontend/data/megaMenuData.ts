export interface SubmenuColumn {
  title: string;
  items: { label: string; href: string }[];
}

export interface MegaCategoryConfig {
  slug: string;
  title: string;
  viewAllHref: string;
  columns: SubmenuColumn[];
}

export const megaMenuData: Record<string, MegaCategoryConfig> = {
  // 1. Ổ CỨNG, RAM, THẺ NHỚ (Chuẩn 100% hình ảnh GearVN)
  "Ổ cứng": {
    slug: "storage",
    title: "Ổ cứng, RAM, Thẻ nhớ",
    viewAllHref: "/categories/storage",
    columns: [
      {
        title: "Dung lượng SSD ›",
        items: [
          { label: "120GB - 128GB", href: "/categories/storage?max=300000" },
          { label: "250GB - 256GB", href: "/categories/storage" },
          { label: "480GB - 512GB", href: "/categories/storage" },
          { label: "960GB - 1TB", href: "/categories/storage" },
          { label: "2TB", href: "/categories/storage" },
          { label: "Trên 2TB", href: "/categories/storage" },
          { label: "Xem tất cả ›", href: "/categories/storage" },
        ],
      },
      {
        title: "Hãng SSD ›",
        items: [
          { label: "Samsung", href: "/categories/storage?brand=Samsung" },
          { label: "Kingston", href: "/categories/storage?brand=Kingston" },
          { label: "Western Digital", href: "/categories/storage?brand=WD" },
          { label: "Sony", href: "/categories/storage?brand=Sony" },
          { label: "Kioxia", href: "/categories/storage" },
          { label: "Crucial", href: "/categories/storage" },
          { label: "Xem tất cả ›", href: "/categories/storage" },
        ],
      },
      {
        title: "Dung lượng RAM ›",
        items: [
          { label: "8 GB", href: "/categories/storage" },
          { label: "16 GB", href: "/categories/storage" },
          { label: "32 GB", href: "/categories/storage" },
          { label: "64 GB", href: "/categories/storage" },
          { label: "Loại DDR4 / DDR5", href: "/categories/storage" },
          { label: "Xem tất cả ›", href: "/categories/storage" },
        ],
      },
      {
        title: "Thẻ nhớ / USB ›",
        items: [
          { label: "Sandisk", href: "/categories/storage" },
          { label: "Samsung EVO", href: "/categories/storage" },
          { label: "Kingston Canvas", href: "/categories/storage" },
          { label: "USB Type-C tốc độ cao", href: "/categories/storage" },
          { label: "Ổ cứng di động gắn ngoài", href: "/categories/storage" },
          { label: "Xem tất cả ›", href: "/categories/storage" },
        ],
      },
    ],
  },

  // 2. BÀN PHÍM (Chuẩn GearVN)
  "Bàn phím": {
    slug: "keyboards",
    title: "Bàn phím Gaming & Văn phòng",
    viewAllHref: "/categories/keyboards",
    columns: [
      {
        title: "Thương hiệu ›",
        items: [
          { label: "Razer", href: "/categories/keyboards?brand=Razer" },
          { label: "Logitech", href: "/categories/keyboards?brand=Logitech" },
          { label: "ASUS", href: "/categories/keyboards?brand=ASUS" },
          { label: "AKKO", href: "/categories/keyboards?brand=Akko" },
          { label: "AULA", href: "/categories/keyboards" },
          { label: "E-DRA", href: "/categories/keyboards" },
          { label: "Xem tất cả ›", href: "/categories/keyboards" },
        ],
      },
      {
        title: "Dòng sản phẩm ›",
        items: [
          { label: "BlackWidow Series", href: "/categories/keyboards" },
          { label: "Huntsman Series", href: "/categories/keyboards" },
          { label: "G PRO Series", href: "/categories/keyboards" },
          { label: "G913 / G915 TKL", href: "/categories/keyboards" },
          { label: "One 3 Series", href: "/categories/keyboards" },
          { label: "F75 Series", href: "/categories/keyboards" },
          { label: "Xem tất cả ›", href: "/categories/keyboards" },
        ],
      },
      {
        title: "Loại bàn phím ›",
        items: [
          { label: "Bàn phím cơ", href: "/categories/keyboards" },
          { label: "Bàn phím cơ Rapid Trigger", href: "/categories/keyboards" },
          { label: "Bàn phím văn phòng không dây", href: "/categories/keyboards" },
          { label: "Bàn phím Silent êm ái", href: "/categories/keyboards" },
          { label: "Bàn phím công thái học", href: "/categories/keyboards" },
          { label: "Xem tất cả ›", href: "/categories/keyboards" },
        ],
      },
      {
        title: "Kích thước / Layout ›",
        items: [
          { label: "Full-size (100%)", href: "/categories/keyboards" },
          { label: "TKL / Tenkeyless (80%)", href: "/categories/keyboards" },
          { label: "Layout 75%", href: "/categories/keyboards" },
          { label: "Layout 65%", href: "/categories/keyboards" },
          { label: "Layout 60% Mini", href: "/categories/keyboards" },
          { label: "Xem tất cả ›", href: "/categories/keyboards" },
        ],
      },
    ],
  },

  // 3. CHUỘT + LÓT CHUỘT (Chuẩn GearVN)
  "Chuột": {
    slug: "mice",
    title: "Chuột + Lót chuột",
    viewAllHref: "/categories/mice",
    columns: [
      {
        title: "Thương hiệu ›",
        items: [
          { label: "Logitech", href: "/categories/mice?brand=Logitech" },
          { label: "Razer", href: "/categories/mice?brand=Razer" },
          { label: "Samsung", href: "/categories/mice?brand=Samsung" },
          { label: "ASUS", href: "/categories/mice?brand=ASUS" },
          { label: "HyperWork", href: "/categories/mice" },
          { label: "Pulsar", href: "/categories/mice" },
          { label: "Xem tất cả ›", href: "/categories/mice" },
        ],
      },
      {
        title: "Dòng sản phẩm ›",
        items: [
          { label: "G PRO X SUPERLIGHT 2", href: "/categories/mice" },
          { label: "G502 HERO Series", href: "/categories/mice" },
          { label: "G304 Lightspeed", href: "/categories/mice" },
          { label: "DeathAdder V3 Pro", href: "/categories/mice" },
          { label: "Viper V3 Pro", href: "/categories/mice" },
          { label: "MX Master 3S", href: "/categories/mice" },
          { label: "Xem tất cả ›", href: "/categories/mice" },
        ],
      },
      {
        title: "Mục đích sử dụng ›",
        items: [
          { label: "Gaming Esports siêu nhẹ", href: "/categories/mice" },
          { label: "Văn phòng không dây", href: "/categories/mice" },
          { label: "Công thái học (Ergonomic)", href: "/categories/mice" },
          { label: "Đa năng Bluetooth + 2.4G", href: "/categories/mice" },
          { label: "Xem tất cả ›", href: "/categories/mice" },
        ],
      },
      {
        title: "Lót chuột (Mousepad) ›",
        items: [
          { label: "Lót chuột Gaming Speed", href: "/categories/mice" },
          { label: "Lót chuột Control dệt mịn", href: "/categories/mice" },
          { label: "Lót chuột cỡ lớn Extended (90x40)", href: "/categories/mice" },
          { label: "Lót chuột LED RGB", href: "/categories/mice" },
          { label: "Xem tất cả ›", href: "/categories/mice" },
        ],
      },
    ],
  },

  // 4. TAI NGHE (Chuẩn GearVN)
  "Tai nghe": {
    slug: "headphones",
    title: "Tai Nghe Gaming & Hi-Res",
    viewAllHref: "/categories/headphones",
    columns: [
      {
        title: "Thương hiệu ›",
        items: [
          { label: "Kingston HyperX", href: "/categories/headphones?brand=Kingston" },
          { label: "Sony", href: "/categories/headphones?brand=Sony" },
          { label: "Logitech", href: "/categories/headphones?brand=Logitech" },
          { label: "JBL", href: "/categories/headphones?brand=JBL" },
          { label: "Razer", href: "/categories/headphones" },
          { label: "Corsair", href: "/categories/headphones" },
          { label: "Xem tất cả ›", href: "/categories/headphones" },
        ],
      },
      {
        title: "Dòng sản phẩm ›",
        items: [
          { label: "Cloud III Wireless", href: "/categories/headphones" },
          { label: "Cloud II Series", href: "/categories/headphones" },
          { label: "Cloud Alpha Series", href: "/categories/headphones" },
          { label: "WH-1000XM5 Chống ồn", href: "/categories/headphones" },
          { label: "INZONE Gaming Series", href: "/categories/headphones" },
          { label: "JBL Quantum Series", href: "/categories/headphones" },
          { label: "Xem tất cả ›", href: "/categories/headphones" },
        ],
      },
      {
        title: "Kiểu dáng tai nghe ›",
        items: [
          { label: "Over-ear (Chụp tai)", href: "/categories/headphones" },
          { label: "In-ear (Nhét tai)", href: "/categories/headphones" },
          { label: "True Wireless (TWS)", href: "/categories/headphones" },
          { label: "Tai nghe có mic lọc ồn AI", href: "/categories/headphones" },
          { label: "Xem tất cả ›", href: "/categories/headphones" },
        ],
      },
      {
        title: "Khoảng giá ›",
        items: [
          { label: "Dưới 500.000đ", href: "/categories/headphones?max=500000" },
          { label: "Từ 500k – 1.5 triệu", href: "/categories/headphones?min=500000&max=1500000" },
          { label: "Từ 1.5 triệu – 3 triệu", href: "/categories/headphones?min=1500000&max=3000000" },
          { label: "Trên 3 triệu", href: "/categories/headphones?min=3000000" },
          { label: "Xem tất cả ›", href: "/categories/headphones" },
        ],
      },
    ],
  },

  // 5. LOA, MICRO, WEBCAM (Chuẩn GearVN)
  "Loa": {
    slug: "speakers",
    title: "Loa, Micro, Webcam",
    viewAllHref: "/categories/speakers",
    columns: [
      {
        title: "Thương hiệu ›",
        items: [
          { label: "Logitech", href: "/categories/speakers?brand=Logitech" },
          { label: "JBL", href: "/categories/speakers?brand=JBL" },
          { label: "Marshall", href: "/categories/speakers?brand=Marshall" },
          { label: "Edifier", href: "/categories/speakers?brand=Edifier" },
          { label: "Razer Audio", href: "/categories/speakers" },
          { label: "Xem tất cả ›", href: "/categories/speakers" },
        ],
      },
      {
        title: "Loa vi tính & Bluetooth ›",
        items: [
          { label: "Loa vi tính 2.1 có Sub", href: "/categories/speakers" },
          { label: "Loa vi tính 2.0 để bàn", href: "/categories/speakers" },
          { label: "Loa Bluetooth di động", href: "/categories/speakers" },
          { label: "Loa Soundbar TV/PC", href: "/categories/speakers" },
          { label: "Loa Gaming LED RGB", href: "/categories/speakers" },
          { label: "Xem tất cả ›", href: "/categories/speakers" },
        ],
      },
      {
        title: "Microphone Thu âm ›",
        items: [
          { label: "HyperX QuadCast S", href: "/categories/speakers" },
          { label: "Razer Seiren Series", href: "/categories/speakers" },
          { label: "Blue Yeti Series", href: "/categories/speakers" },
          { label: "Micro cài áo không dây", href: "/categories/speakers" },
          { label: "Xem tất cả ›", href: "/categories/speakers" },
        ],
      },
      {
        title: "Webcam Livestream ›",
        items: [
          { label: "Webcam Full HD 1080p", href: "/categories/speakers" },
          { label: "Webcam 4K 60fps Ultra HD", href: "/categories/speakers" },
          { label: "Logitech C920 / C922 Pro", href: "/categories/speakers" },
          { label: "Razer Kiyo Pro HDR", href: "/categories/speakers" },
          { label: "Xem tất cả ›", href: "/categories/speakers" },
        ],
      },
    ],
  },

  // 6. CỦ SẠC & NGUỒN (Chuẩn GearVN)
  "Củ sạc": {
    slug: "chargers",
    title: "Củ sạc & Bộ cấp nguồn GaN",
    viewAllHref: "/categories/chargers",
    columns: [
      {
        title: "Thương hiệu ›",
        items: [
          { label: "Anker", href: "/categories/chargers?brand=Anker" },
          { label: "Ugreen", href: "/categories/chargers?brand=Ugreen" },
          { label: "Baseus", href: "/categories/chargers?brand=Baseus" },
          { label: "Apple", href: "/categories/chargers?brand=Apple" },
          { label: "Belkin", href: "/categories/chargers" },
          { label: "Xem tất cả ›", href: "/categories/chargers" },
        ],
      },
      {
        title: "Công suất sạc ›",
        items: [
          { label: "Sạc 20W - 30W (Điện thoại)", href: "/categories/chargers" },
          { label: "Sạc 45W - 65W (Laptop Ultrabook)", href: "/categories/chargers" },
          { label: "Sạc 100W - 140W (Laptop Gaming)", href: "/categories/chargers" },
          { label: "Trạm sạc bàn 200W+ GaN", href: "/categories/chargers" },
          { label: "Xem tất cả ›", href: "/categories/chargers" },
        ],
      },
      {
        title: "Số cổng cắm ›",
        items: [
          { label: "1 Cổng Type-C siêu gọn", href: "/categories/chargers" },
          { label: "2 Cổng (C + A)", href: "/categories/chargers" },
          { label: "3 Cổng (2C + 1A GaN)", href: "/categories/chargers" },
          { label: "4 Cổng đa thiết bị", href: "/categories/chargers" },
          { label: "Xem tất cả ›", href: "/categories/chargers" },
        ],
      },
      {
        title: "Khoảng giá ›",
        items: [
          { label: "Dưới 300.000đ", href: "/categories/chargers?max=300000" },
          { label: "Từ 300k – 600.000đ", href: "/categories/chargers?min=300000&max=600000" },
          { label: "Từ 600k – 1.2 triệu", href: "/categories/chargers?min=600000&max=1200000" },
          { label: "Trên 1.2 triệu", href: "/categories/chargers?min=1200000" },
          { label: "Xem tất cả ›", href: "/categories/chargers" },
        ],
      },
    ],
  },

  // 7. DÂY CÁP KẾT NỐI
  "Dây cáp": {
    slug: "cables",
    title: "Dây cáp & Đầu chuyển",
    viewAllHref: "/categories/cables",
    columns: [
      {
        title: "Thương hiệu ›",
        items: [
          { label: "Apple", href: "/categories/cables?brand=Apple" },
          { label: "Anker", href: "/categories/cables?brand=Anker" },
          { label: "Ugreen", href: "/categories/cables?brand=Ugreen" },
          { label: "Baseus", href: "/categories/cables?brand=Baseus" },
          { label: "Belkin", href: "/categories/cables" },
          { label: "Xem tất cả ›", href: "/categories/cables" },
        ],
      },
      {
        title: "Chuẩn đầu cắm ›",
        items: [
          { label: "Cáp Type-C to Type-C 100W/240W", href: "/categories/cables" },
          { label: "Cáp Type-C to Lightning", href: "/categories/cables" },
          { label: "Cáp HDMI 2.1 8K / DP 1.4", href: "/categories/cables" },
          { label: "Cáp Thunderbolt 4 tốc độ 40Gbps", href: "/categories/cables" },
          { label: "Xem tất cả ›", href: "/categories/cables" },
        ],
      },
      {
        title: "Chiều dài cáp ›",
        items: [
          { label: "0.5 mét - 0.9 mét (Ngắn gọn)", href: "/categories/cables" },
          { label: "1.0 mét - 1.2 mét (Chuẩn)", href: "/categories/cables" },
          { label: "1.8 mét - 2.0 mét (Dài thoải mái)", href: "/categories/cables" },
          { label: "3.0 mét trở lên", href: "/categories/cables" },
          { label: "Xem tất cả ›", href: "/categories/cables" },
        ],
      },
      {
        title: "Khoảng giá ›",
        items: [
          { label: "Dưới 150.000đ", href: "/categories/cables?max=150000" },
          { label: "Từ 150k – 300.000đ", href: "/categories/cables?min=150000&max=300000" },
          { label: "Từ 300k – 600.000đ", href: "/categories/cables?min=300000&max=600000" },
          { label: "Trên 600.000đ", href: "/categories/cables?min=600000" },
          { label: "Xem tất cả ›", href: "/categories/cables" },
        ],
      },
    ],
  },

  // 8. PIN DỰ PHÒNG
  "Pin dự phòng": {
    slug: "power-banks",
    title: "Pin sạc dự phòng di động",
    viewAllHref: "/categories/power-banks",
    columns: [
      {
        title: "Thương hiệu ›",
        items: [
          { label: "Baseus", href: "/categories/power-banks?brand=Baseus" },
          { label: "Anker", href: "/categories/power-banks?brand=Anker" },
          { label: "Ugreen", href: "/categories/power-banks?brand=Ugreen" },
          { label: "Xiaomi", href: "/categories/power-banks?brand=Xiaomi" },
          { label: "Belkin", href: "/categories/power-banks" },
          { label: "Xem tất cả ›", href: "/categories/power-banks" },
        ],
      },
      {
        title: "Dung lượng pin ›",
        items: [
          { label: "10.000 mAh (Bỏ túi nhẹ nhàng)", href: "/categories/power-banks" },
          { label: "20.000 mAh (Phổ biến)", href: "/categories/power-banks" },
          { label: "25.000 - 30.000 mAh (Dung lượng khủng)", href: "/categories/power-banks" },
          { label: "Trạm sạc điện năng ngoài trời", href: "/categories/power-banks" },
          { label: "Xem tất cả ›", href: "/categories/power-banks" },
        ],
      },
      {
        title: "Tính năng tiện ích ›",
        items: [
          { label: "Sạc nhanh Laptop PD 65W - 140W", href: "/categories/power-banks" },
          { label: "Sạc không dây từ tính MagSafe", href: "/categories/power-banks" },
          { label: "Tích hợp sẵn dây cáp tiện lợi", href: "/categories/power-banks" },
          { label: "Màn hình số báo % pin thông minh", href: "/categories/power-banks" },
          { label: "Xem tất cả ›", href: "/categories/power-banks" },
        ],
      },
      {
        title: "Khoảng giá ›",
        items: [
          { label: "Dưới 400.000đ", href: "/categories/power-banks?max=400000" },
          { label: "Từ 400k – 800.000đ", href: "/categories/power-banks?min=400000&max=800000" },
          { label: "Từ 800k – 1.5 triệu", href: "/categories/power-banks?min=800000&max=1500000" },
          { label: "Trên 1.5 triệu (Pro)", href: "/categories/power-banks?min=1500000" },
          { label: "Xem tất cả ›", href: "/categories/power-banks" },
        ],
      },
    ],
  },

  // 9. HUB & ADAPTER
  "Hub & Adapter": {
    slug: "hubs-adapters",
    title: "Hub chuyển đổi & Docking Station",
    viewAllHref: "/categories/hubs-adapters",
    columns: [
      {
        title: "Thương hiệu ›",
        items: [
          { label: "Ugreen", href: "/categories/hubs-adapters?brand=Ugreen" },
          { label: "Baseus", href: "/categories/hubs-adapters?brand=Baseus" },
          { label: "Anker", href: "/categories/hubs-adapters?brand=Anker" },
          { label: "HyperDrive", href: "/categories/hubs-adapters" },
          { label: "Belkin", href: "/categories/hubs-adapters" },
          { label: "Xem tất cả ›", href: "/categories/hubs-adapters" },
        ],
      },
      {
        title: "Số cổng mở rộng ›",
        items: [
          { label: "Hub 4 trong 1 (Gọn nhẹ)", href: "/categories/hubs-adapters" },
          { label: "Hub 6 trong 1 (Đầy đủ cổng)", href: "/categories/hubs-adapters" },
          { label: "Hub 8 trong 1 & 10 trong 1", href: "/categories/hubs-adapters" },
          { label: "Docking Station 12+ cổng chuyên nghiệp", href: "/categories/hubs-adapters" },
          { label: "Xem tất cả ›", href: "/categories/hubs-adapters" },
        ],
      },
      {
        title: "Cổng kết nối đặc biệt ›",
        items: [
          { label: "Cổng xuất hình HDMI 4K / 8K", href: "/categories/hubs-adapters" },
          { label: "Cổng mạng LAN RJ45 Gigabit", href: "/categories/hubs-adapters" },
          { label: "Cổng sạc xuyên Type-C PD 100W", href: "/categories/hubs-adapters" },
          { label: "Khe đọc thẻ nhớ SD / TF", href: "/categories/hubs-adapters" },
          { label: "Xem tất cả ›", href: "/categories/hubs-adapters" },
        ],
      },
      {
        title: "Khoảng giá ›",
        items: [
          { label: "Dưới 350.000đ", href: "/categories/hubs-adapters?max=350000" },
          { label: "Từ 350k – 700.000đ", href: "/categories/hubs-adapters?min=350000&max=700000" },
          { label: "Từ 700k – 1.5 triệu", href: "/categories/hubs-adapters?min=700000&max=1500000" },
          { label: "Trên 1.5 triệu", href: "/categories/hubs-adapters?min=1500000" },
          { label: "Xem tất cả ›", href: "/categories/hubs-adapters" },
        ],
      },
    ],
  },

  // 10. GIÁ ĐỠ & ARM MÀN HÌNH
  "Giá đỡ": {
    slug: "stands-mounts",
    title: "Giá đỡ Laptop & Arm màn hình",
    viewAllHref: "/categories/stands-mounts",
    columns: [
      {
        title: "Thương hiệu ›",
        items: [
          { label: "North Bayou (NB)", href: "/categories/stands-mounts?brand=NorthBayou" },
          { label: "Xiaomi", href: "/categories/stands-mounts?brand=Xiaomi" },
          { label: "Ugreen", href: "/categories/stands-mounts?brand=Ugreen" },
          { label: "Baseus", href: "/categories/stands-mounts?brand=Baseus" },
          { label: "HyperWork", href: "/categories/stands-mounts" },
          { label: "Xem tất cả ›", href: "/categories/stands-mounts" },
        ],
      },
      {
        title: "Tay nâng Arm màn hình ›",
        items: [
          { label: "NB F80 (1 Màn hình 17 - 30 inch)", href: "/categories/stands-mounts" },
          { label: "NB F160 (2 Màn hình song song)", href: "/categories/stands-mounts" },
          { label: "NB G40 Hợp kim cao cấp", href: "/categories/stands-mounts" },
          { label: "NB H100 Tải nặng màn hình cong", href: "/categories/stands-mounts" },
          { label: "Xem tất cả ›", href: "/categories/stands-mounts" },
        ],
      },
      {
        title: "Giá đỡ Laptop & Tablet ›",
        items: [
          { label: "Giá đỡ Laptop nhôm tản nhiệt", href: "/categories/stands-mounts" },
          { label: "Giá đỡ nâng hạ độ cao linh hoạt", href: "/categories/stands-mounts" },
          { label: "Giá đỡ xoay 360 độ cao cấp", href: "/categories/stands-mounts" },
          { label: "Đế dựng điện thoại để bàn", href: "/categories/stands-mounts" },
          { label: "Xem tất cả ›", href: "/categories/stands-mounts" },
        ],
      },
      {
        title: "Khoảng giá ›",
        items: [
          { label: "Dưới 200.000đ", href: "/categories/stands-mounts?max=200000" },
          { label: "Từ 200k – 500.000đ", href: "/categories/stands-mounts?min=200000&max=500000" },
          { label: "Từ 500k – 1 triệu", href: "/categories/stands-mounts?min=500000&max=1000000" },
          { label: "Trên 1 triệu (Arm cao cấp)", href: "/categories/stands-mounts?min=1000000" },
          { label: "Xem tất cả ›", href: "/categories/stands-mounts" },
        ],
      },
    ],
  },

  // 11. ỐP LƯNG & CƯỜNG LỰC
  "Ốp & Cường lực": {
    slug: "phone-cases",
    title: "Ốp lưng & Kính cường lực",
    viewAllHref: "/categories/phone-cases",
    columns: [
      {
        title: "Thương hiệu ›",
        items: [
          { label: "Belkin", href: "/categories/phone-cases?brand=Belkin" },
          { label: "Spigen", href: "/categories/phone-cases?brand=Spigen" },
          { label: "Nillkin", href: "/categories/phone-cases?brand=Nillkin" },
          { label: "JBL", href: "/categories/phone-cases?brand=JBL" },
          { label: "UAG Quân đội", href: "/categories/phone-cases" },
          { label: "Xem tất cả ›", href: "/categories/phone-cases" },
        ],
      },
      {
        title: "Dòng ốp lưng ›",
        items: [
          { label: "Ốp lưng chống sốc quân đội", href: "/categories/phone-cases" },
          { label: "Ốp lưng trong suốt chống ố vàng", href: "/categories/phone-cases" },
          { label: "Ốp lưng hỗ trợ sạc MagSafe", href: "/categories/phone-cases" },
          { label: "Bao da nắp gập sang trọng", href: "/categories/phone-cases" },
          { label: "Xem tất cả ›", href: "/categories/phone-cases" },
        ],
      },
      {
        title: "Kính cường lực ›",
        items: [
          { label: "Kính cường lực 9H chống trầy", href: "/categories/phone-cases" },
          { label: "Kính chống nhìn trộm Privacy", href: "/categories/phone-cases" },
          { label: "Kính cường lực viền mỏng", href: "/categories/phone-cases" },
          { label: "Bảo vệ viền cụm Camera", href: "/categories/phone-cases" },
          { label: "Xem tất cả ›", href: "/categories/phone-cases" },
        ],
      },
      {
        title: "Khoảng giá ›",
        items: [
          { label: "Dưới 100.000đ", href: "/categories/phone-cases?max=100000" },
          { label: "Từ 100k – 250.000đ", href: "/categories/phone-cases?min=100000&max=250000" },
          { label: "Từ 250k – 500.000đ", href: "/categories/phone-cases?min=250000&max=500000" },
          { label: "Trên 500.000đ", href: "/categories/phone-cases?min=500000" },
          { label: "Xem tất cả ›", href: "/categories/phone-cases" },
        ],
      },
    ],
  },
};
