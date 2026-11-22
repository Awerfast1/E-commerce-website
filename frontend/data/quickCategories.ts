export interface QuickCategory {
  id: number;
  label: string;
  slug: string;
  icon: string;
  desc?: string;
}

export const quickCategories: QuickCategory[] = [
  { id: 1, label: "Laptop", slug: "laptop", icon: "laptop", desc: "Gaming & Văn phòng" },
  { id: 2, label: "Bàn phím", slug: "keyboards", icon: "keyboards", desc: "Cơ quang học & văn phòng" },
  { id: 3, label: "Chuột", slug: "mice", icon: "mice", desc: "Gaming & không dây" },
  { id: 4, label: "Tai nghe", slug: "headphones", icon: "headphones", desc: "Chụp tai & nhét tai" },
  { id: 5, label: "Loa", slug: "speakers", icon: "speakers", desc: "Bluetooth & vi tính" },
  { id: 6, label: "Ổ cứng", slug: "storage", icon: "storage", desc: "SSD, USB & thẻ nhớ" },
  { id: 7, label: "Củ sạc", slug: "chargers", icon: "chargers", desc: "Sạc nhanh GaN đa cổng" },
  { id: 8, label: "Dây cáp", slug: "cables", icon: "cables", desc: "Type-C, Lightning, HDMI" },
  { id: 9, label: "Pin dự phòng", slug: "power-banks", icon: "power-banks", desc: "Dung lượng cao, sạc nhanh" },
  { id: 10, label: "Hub & Adapter", slug: "hubs-adapters", icon: "hubs-adapters", desc: "Bộ chuyển đổi đa năng" },
  { id: 11, label: "Giá đỡ", slug: "stands-mounts", icon: "stands-mounts", desc: "Đế đỡ laptop & điện thoại" },
  { id: 12, label: "Ốp & Cường lực", slug: "phone-cases", icon: "phone-cases", desc: "Bảo vệ toàn diện" },
];
