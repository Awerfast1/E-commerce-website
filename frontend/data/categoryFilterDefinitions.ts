export interface FilterCriterion {
  key: string;
  options: string[];
}

export const categoryFilterDefinitions: Record<string, FilterCriterion[]> = {
  // 1. BÀN PHÍM (Chuẩn GearVN)
  keyboards: [
    {
      key: "Khoảng giá",
      options: [
        "Từ 100.000đ - 1.1 triệu",
        "Từ 1.1 triệu - 1.7 triệu",
        "Từ 1.7 triệu - 2.6 triệu",
        "Từ 2.6 triệu - 3.7 triệu",
        "Từ 3.7 triệu - 20 triệu",
      ],
    },
    {
      key: "Thương hiệu",
      options: ["Razer", "Logitech", "ASUS", "AKKO", "AULA", "E-DRA", "Corsair"],
    },
    {
      key: "Dòng sản phẩm",
      options: ["BlackWidow", "Huntsman", "DeathStalker", "G PRO", "G913", "G512", "One 3", "F75"],
    },
    {
      key: "Loại bàn phím",
      options: ["Bàn phím cơ", "Bàn phím văn phòng", "Bàn phím cơ Rapid Trigger", "Bàn phím cao su"],
    },
    {
      key: "Kích thước / Layout",
      options: ["Full-size (100%)", "TKL / Tenkeyless (80%)", "75%", "65%", "60%"],
    },
    {
      key: "Phương thức kết nối",
      options: ["Wireless 2.4GHz", "Bluetooth", "Có dây USB-C", "Đa kết nối (3 Mode)"],
    },
    {
      key: "Kiểu Switch",
      options: ["Linear", "Tactile", "Clicky", "Switch quang học", "Từ tính (Magnetic)"],
    },
    {
      key: "Chất liệu Keycap",
      options: ["PBT Double-Shot", "PBT", "ABS Double-Shot", "ABS"],
    },
    {
      key: "Đèn LED",
      options: ["LED RGB 16.8 triệu màu", "Đơn sắc trắng", "Rainbow", "Không có đèn"],
    },
    {
      key: "Tính năng đặc biệt",
      options: ["Hot-swap", "Gasket Mount", "Rapid Trigger", "RGB Sync", "Núm xoay đa năng"],
    },
  ],

  // 2. CHUỘT (Chuẩn GearVN)
  mice: [
    {
      key: "Khoảng giá",
      options: [
        "Từ 100.000đ - 500.000đ",
        "Từ 500.000đ - 1 triệu",
        "Từ 1 triệu - 1.9 triệu",
        "Từ 1.9 triệu - 2.7 triệu",
        "Từ 2.7 triệu - 5.1 triệu",
      ],
    },
    {
      key: "Thương hiệu",
      options: ["Logitech", "Razer", "Samsung", "ASUS", "AKKO", "HyperWork", "Pulsar", "Zowie"],
    },
    {
      key: "Dòng sản phẩm",
      options: ["G PRO X SUPERLIGHT", "G502 HERO", "G304", "DeathAdder", "Viper", "Basilisk", "MX Master"],
    },
    {
      key: "Mục đích sử dụng",
      options: ["Gaming Esports", "Văn phòng / Đồ họa", "Công thái học (Ergonomic)", "Đa năng"],
    },
    {
      key: "Phương thức kết nối",
      options: ["Wireless 2.4GHz", "Bluetooth", "Có dây USB", "Đa kết nối"],
    },
    {
      key: "Cảm biến (Sensor)",
      options: ["HERO 2", "PixArt PAW3395", "Focus Pro 30K", "AimPoint Pro", "Quang học"],
    },
    {
      key: "Polling Rate",
      options: ["8000 Hz", "4000 Hz", "2000 Hz", "1000 Hz"],
    },
    {
      key: "Trọng lượng",
      options: ["Siêu nhẹ dưới 60g", "Từ 60g - 80g", "Trên 80g"],
    },
    {
      key: "Đèn LED",
      options: ["RGB 16.8 triệu màu", "LED đơn sắc", "Không có đèn"],
    },
    {
      key: "Loại pin",
      options: ["Pin sạc Li-ion (Type-C)", "Pin AA", "Pin AAA"],
    },
  ],

  // 3. TAI NGHE (Chuẩn GearVN)
  headphones: [
    {
      key: "Khoảng giá",
      options: [
        "Dưới 500.000đ",
        "Từ 500.000đ - 1.5 triệu",
        "Từ 1.5 triệu - 3 triệu",
        "Từ 3 triệu - 5 triệu",
        "Trên 5 triệu",
      ],
    },
    {
      key: "Thương hiệu",
      options: ["Kingston HyperX", "Sony", "Logitech", "JBL", "Razer", "Corsair", "Audio-Technica"],
    },
    {
      key: "Dòng sản phẩm",
      options: ["Cloud III", "Cloud II", "Cloud Alpha", "WH-1000XM5", "INZONE", "Quantum"],
    },
    {
      key: "Kiểu tai nghe",
      options: ["Over-ear (Chụp tai)", "In-ear (Nhét tai)", "True Wireless (TWS)", "On-ear"],
    },
    {
      key: "Phương thức kết nối",
      options: ["Wireless 2.4GHz", "Bluetooth 5.3", "Jack 3.5mm", "USB / Type-C"],
    },
    {
      key: "Tính năng nổi bật",
      options: ["Chống ồn chủ động (ANC)", "Âm thanh vòm 7.1", "Microphone lọc ồn AI", "Hi-Res Audio"],
    },
  ],

  // 4. LOA (Chuẩn GearVN)
  speakers: [
    {
      key: "Khoảng giá",
      options: [
        "Dưới 600.000đ",
        "Từ 600.000đ - 1.5 triệu",
        "Từ 1.5 triệu - 3 triệu",
        "Từ 3 triệu - 6 triệu",
        "Trên 6 triệu",
      ],
    },
    {
      key: "Thương hiệu",
      options: ["Logitech", "JBL", "Marshall", "Edifier", "Harman Kardon", "Sony"],
    },
    {
      key: "Loại loa",
      options: ["Loa vi tính 2.1 (Có Sub)", "Loa vi tính 2.0 để bàn", "Loa Bluetooth di động", "Loa Soundbar TV/PC"],
    },
    {
      key: "Công suất",
      options: ["Dưới 20W", "Từ 20W - 60W", "Từ 60W - 120W", "Trên 120W (Công suất lớn)"],
    },
    {
      key: "Kết nối",
      options: ["Bluetooth", "AUX 3.5mm", "Optical (Quang học)", "USB Audio", "RCA"],
    },
    {
      key: "Tính năng",
      options: ["Kháng nước chuẩn IPX7", "Đèn LED RGB theo nhạc", "Ghép đôi PartyBoost", "Pin sạc 12h+"],
    },
  ],

  // 5. Ổ CỨNG (Storage - Chuẩn GearVN)
  storage: [
    {
      key: "Khoảng giá",
      options: [
        "Dưới 500.000đ",
        "Từ 500.000đ - 1 triệu",
        "Từ 1 triệu - 2.5 triệu",
        "Từ 2.5 triệu - 5 triệu",
        "Trên 5 triệu",
      ],
    },
    {
      key: "Thương hiệu",
      options: ["Samsung", "Kingston", "Western Digital (WD)", "Sony", "Kioxia", "Crucial", "Seagate"],
    },
    {
      key: "Loại thiết bị",
      options: ["SSD M.2 NVMe PCIe 4.0", "SSD M.2 NVMe PCIe 5.0", "SSD di động gắn ngoài", "USB Flash Drive", "Thẻ nhớ MicroSD"],
    },
    {
      key: "Dung lượng",
      options: ["250 GB - 256 GB", "500 GB - 512 GB", "1 TB (1000 GB)", "2 TB (2000 GB)", "4 TB trở lên"],
    },
    {
      key: "Tốc độ đọc (Read Speed)",
      options: ["Lên đến 3500 MB/s", "Lên đến 5000 MB/s", "Lên đến 7450 MB/s (Gen 4x4)", "Trên 10.000 MB/s (Gen 5)"],
    },
  ],

  // 6. CỦ SẠC (Chargers)
  chargers: [
    {
      key: "Khoảng giá",
      options: ["Dưới 300.000đ", "Từ 300.000đ - 600.000đ", "Từ 600.000đ - 1.2 triệu", "Trên 1.2 triệu"],
    },
    {
      key: "Thương hiệu",
      options: ["Anker", "Ugreen", "Baseus", "Apple", "Belkin"],
    },
    {
      key: "Công suất sạc",
      options: ["20W - 30W (Sạc nhanh Phone)", "45W - 65W (Sạc Laptop Ultrabook)", "100W - 140W (Sạc Laptop Gaming/MacBook)", "160W - 240W (Trạm sạc bàn)"],
    },
    {
      key: "Số cổng sạc",
      options: ["1 Cổng Type-C", "2 Cổng (C + A)", "3 Cổng GaN (2C + 1A)", "4 Cổng trở lên"],
    },
    {
      key: "Công nghệ sạc",
      options: ["GaN (Gallium Nitride)", "Power Delivery (PD 3.1)", "Quick Charge (QC 4.0+)", "PPS bảo vệ pin"],
    },
  ],

  // 7. DÂY CÁP (Cables)
  cables: [
    {
      key: "Khoảng giá",
      options: ["Dưới 150.000đ", "Từ 150.000đ - 300.000đ", "Từ 300.000đ - 600.000đ", "Trên 600.000đ"],
    },
    {
      key: "Thương hiệu",
      options: ["Apple", "Anker", "Ugreen", "Baseus", "Belkin"],
    },
    {
      key: "Chuẩn đầu cắm",
      options: ["Type-C to Type-C", "Type-C to Lightning", "USB-A to Type-C", "HDMI 2.1 8K / DP 1.4", "Thunderbolt 4"],
    },
    {
      key: "Chiều dài cáp",
      options: ["0.5 mét - 0.9 mét", "1.0 mét - 1.2 mét", "1.8 mét - 2.0 mét", "3.0 mét"],
    },
    {
      key: "Chất liệu & Độ bền",
      options: ["Bọc dù siêu bền chống đứt", "Vỏ bọc Silicone dẻo", "Đầu cắm kim loại bọc nhôm"],
    },
  ],

  // 8. PIN DỰ PHÒNG (Power Banks)
  "power-banks": [
    {
      key: "Khoảng giá",
      options: ["Dưới 400.000đ", "Từ 400.000đ - 800.000đ", "Từ 800.000đ - 1.5 triệu", "Trên 1.5 triệu"],
    },
    {
      key: "Thương hiệu",
      options: ["Baseus", "Anker", "Ugreen", "Xiaomi", "Belkin"],
    },
    {
      key: "Dung lượng pin",
      options: ["10.000 mAh (Nhỏ gọn)", "20.000 mAh (Phổ biến)", "24.000 - 30.000 mAh (Dung lượng khủng)"],
    },
    {
      key: "Công suất đầu ra",
      options: ["20W - 22.5W", "30W - 45W", "65W - 100W (Sạc được Laptop)", "140W (Chuẩn PD 3.1)"],
    },
    {
      key: "Tính năng tiện ích",
      options: ["Sạc không dây từ tính MagSafe", "Tích hợp sẵn dây sạc", "Màn hình số hiển thị % pin"],
    },
  ],

  // 9. HUB & ADAPTER
  "hubs-adapters": [
    {
      key: "Khoảng giá",
      options: ["Dưới 350.000đ", "Từ 350.000đ - 700.000đ", "Từ 700.000đ - 1.5 triệu", "Trên 1.5 triệu"],
    },
    {
      key: "Thương hiệu",
      options: ["Ugreen", "Baseus", "Anker", "HyperDrive", "Belkin"],
    },
    {
      key: "Số lượng cổng mở rộng",
      options: ["Hub 4 trong 1", "Hub 6 trong 1", "Hub 8 trong 1 & 10 trong 1", "Docking Station 12+ cổng"],
    },
    {
      key: "Cổng xuất hình ảnh",
      options: ["HDMI 4K@60Hz", "HDMI 8K / DisplayPort", "Xuất 2 - 3 màn hình độc lập"],
    },
    {
      key: "Cổng mạng & nguồn",
      options: ["Có cổng LAN RJ45 Gigabit", "Có cổng sạc Type-C PD 100W", "Có khe thẻ nhớ SD / TF"],
    },
  ],

  // 10. GIÁ ĐỠ (Stands & Mounts)
  "stands-mounts": [
    {
      key: "Khoảng giá",
      options: ["Dưới 200.000đ", "Từ 200.000đ - 500.000đ", "Từ 500.000đ - 1 triệu", "Trên 1 triệu"],
    },
    {
      key: "Thương hiệu",
      options: ["North Bayou (NB)", "Xiaomi", "Ugreen", "Baseus", "HyperWork"],
    },
    {
      key: "Phân loại giá đỡ",
      options: ["Tay nâng màn hình Arm Monitor (1 màn)", "Tay nâng màn hình Arm đôi (2 màn)", "Giá đỡ Laptop hợp kim nhôm", "Giá đỡ điện thoại / Máy tính bảng"],
    },
    {
      key: "Chất liệu & Tính năng",
      options: ["Hợp kim nhôm nguyên khối", "Trợ lực Piston khí nén Gas Spring", "Gấp gọn di động", "Xoay 360 độ linh hoạt"],
    },
  ],

  // 11. ỐP & CƯỜNG LỰC (Phone Cases & Screen Protectors)
  "phone-cases": [
    {
      key: "Khoảng giá",
      options: ["Dưới 150.000đ", "Từ 150.000đ - 300.000đ", "Từ 300.000đ - 600.000đ", "Trên 600.000đ"],
    },
    {
      key: "Thương hiệu",
      options: ["Belkin", "Spigen", "Nillkin", "JBL", "UAG"],
    },
    {
      key: "Loại phụ kiện",
      options: ["Ốp lưng chống sốc", "Ốp lưng trong suốt chống ố", "Kính cường lực 9H màn hình", "Cường lực chống nhìn trộm", "Kính bảo vệ cụm Camera"],
    },
    {
      key: "Tính năng",
      options: ["Hỗ trợ vòng từ tính MagSafe", "Chuẩn chống sốc quân đội MIL-STD", "Phủ Nano kháng vân tay"],
    },
  ],
};
