import { gamingLaptopDeals } from "./gamingLaptopDeals";

type SpecRow = [label: string, value: string];
type SpecGroup = { title: string; rows: SpecRow[] };

// Model-specific values were checked against manufacturer specifications:
// ASUS: rog.asus.com/vn/laptops/rog-strix/rog-strix-g16-2025/spec/
//       rog.asus.com/vn/laptops/rog-zephyrus/rog-zephyrus-g14-2025/spec/
//       rog.asus.com/vn/laptops/rog-zephyrus/rog-zephyrus-g16-2025-gu605/spec/
//       asus.com/vn/laptops/for-gaming/tuf-gaming/asus-tuf-gaming-a16-2025/techspec/
// Acer: store.acer.com/vi-vn/laptop-gaming-predator-helios-neo-16s-ai-phn16s-i51-98cx
//       acervietnam.com.vn/gaming/nitro-propanel-anv16s
// Lenovo: psref.lenovo.com/Product/Legion_Pro_7_16IAX10H
//         psref.lenovo.com/Product/Legion_Pro_5_16IAX10
//         psref.lenovo.com/Product/Legion_5_15IAX10
// Dell: dell.com/en-us/shop/cty/spd/alienware16area51aa16250
//       dell.com/support/manuals/en-my/alienware-area-51-aa18250-gaming-laptop/alienware-18-area-51-aa18250-owners-manual/gpudiscrete
// Family names without a full SKU deliberately use only the configuration already listed.
const verifiedExtras: Record<number, SpecGroup[]> = {
  0: [
    { title: "Đồ họa", rows: [["Dung lượng VRAM", "8 GB"], ["Loại VRAM", "GDDR7"]] },
    { title: "Màn hình", rows: [["Độ phân giải", "2560 × 1600"], ["Tấm nền", "IPS"], ["Tần số quét", "240 Hz"], ["Độ phủ màu", "100% DCI-P3"]] },
    { title: "Phần mềm", rows: [["Hệ điều hành", "Windows 11 Home Single Language"]] },
  ],
  1: [
    { title: "Đồ họa", rows: [["Dung lượng VRAM", "8 GB"], ["Loại VRAM", "GDDR7"]] },
    { title: "Bộ nhớ và lưu trữ", rows: [["Loại RAM", "LPDDR5X 7500"], ["Giao thức SSD", "PCIe 4.0 NVMe"], ["Khe M.2", "1"]] },
    { title: "Màn hình", rows: [["Độ phân giải", "2880 × 1800"], ["Tấm nền", "OLED"], ["Tần số quét", "120 Hz"]] },
    { title: "Kết nối", rows: [["Wi-Fi", "Wi-Fi 7"], ["Bluetooth", "5.4"], ["Cổng HDMI", "HDMI 2.1"], ["Cổng USB-C", "USB 3.2 Gen 2 và USB4"]] },
    { title: "Phần mềm", rows: [["Hệ điều hành", "Windows 11 Home Single Language"]] },
  ],
  2: [
    { title: "Đồ họa", rows: [["Dung lượng VRAM", "8 GB"], ["Loại VRAM", "GDDR7"]] },
    { title: "Màn hình", rows: [["Độ phân giải", "2560 × 1600"], ["Tấm nền", "OLED"], ["Tần số quét", "240 Hz"], ["Độ phủ màu", "100% DCI-P3"]] },
    { title: "Phần mềm", rows: [["Hệ điều hành", "Windows 11 Home Single Language"]] },
  ],
  3: [
    { title: "Bộ xử lý", rows: [["Cấu hình CPU", "8 nhân, 16 luồng; xung tối đa 5.1 GHz"]] },
    { title: "Bộ nhớ và lưu trữ", rows: [["Loại RAM", "DDR5-5600 SO-DIMM"], ["RAM tối đa", "64 GB"], ["Khe RAM", "2 SO-DIMM"], ["Giao thức SSD", "PCIe 4.0 NVMe"], ["Khe M.2", "2"]] },
    { title: "Đồ họa", rows: [["Dung lượng VRAM", "8 GB"], ["Loại VRAM", "GDDR7"]] },
    { title: "Màn hình", rows: [["Độ phân giải", "1920 × 1200"], ["Tấm nền", "IPS"], ["Tần số quét", "144 Hz"], ["Độ phủ màu", "100% sRGB"]] },
    { title: "Phần mềm", rows: [["Hệ điều hành", "Windows 11 Home"]] },
  ],
  4: [
    { title: "Đồ họa", rows: [["Dung lượng VRAM", "8 GB"]] },
    { title: "Màn hình", rows: [["Độ phân giải", "2560 × 1600"], ["Tấm nền", "OLED"], ["Tần số quét", "165 Hz"], ["Độ phủ màu", "100% DCI-P3"]] },
    { title: "Phần mềm", rows: [["Hệ điều hành", "Windows 11 Home Single Language"]] },
  ],
  5: [
    { title: "Bộ nhớ", rows: [["Loại RAM", "DDR5"], ["RAM tối đa", "32 GB"], ["Giao thức SSD", "PCIe NVMe 4.0"], ["Form factor SSD", "M.2"]] },
    { title: "Màn hình", rows: [["Độ phân giải", "1920 × 1200"], ["Tấm nền", "IPS"], ["Tần số quét", "180 Hz"], ["Màn hình cảm ứng", "Không"]] },
    { title: "Kết nối", rows: [["Wi-Fi", "Wi-Fi 6 (802.11ax)"], ["Bluetooth", "5.3 trở lên"], ["Cổng HDMI", "Có"]] },
  ],
  6: [
    { title: "Bộ nhớ và lưu trữ", rows: [["Loại RAM", "DDR5"]] },
    { title: "Đồ họa", rows: [["Dung lượng VRAM", "8 GB"]] },
    { title: "Màn hình", rows: [["Độ phân giải", "1920 × 1200"], ["Tấm nền", "IPS"], ["Tần số quét", "180 Hz"], ["Độ phủ màu", "100% sRGB"], ["Độ sáng", "400 nit"]] },
    { title: "Phần mềm", rows: [["Hệ điều hành", "Windows 11 Home"]] },
  ],
  7: [
    { title: "Đồ họa", rows: [["Dung lượng VRAM", "16 GB"], ["Loại VRAM", "GDDR7"]] },
  ],
  8: [
    { title: "Bộ nhớ và lưu trữ", rows: [["Loại RAM", "DDR5"], ["Khe RAM", "2"], ["Khe SSD", "2 M.2"]] },
  ],
  9: [
    { title: "Màn hình", rows: [["Độ phân giải", "2560 × 1600"], ["Tấm nền", "OLED"], ["Tần số quét", "165 Hz"], ["Độ phủ màu", "100% DCI-P3"]] },
  ],
  10: [
    { title: "Đồ họa", rows: [["Dung lượng VRAM", "16 GB"], ["Loại VRAM", "GDDR7"]] },
    { title: "Bộ nhớ", rows: [["Loại RAM", "DDR5"]] },
  ],
  11: [
    { title: "Đồ họa", rows: [["Dung lượng VRAM", "12 GB"], ["Loại VRAM", "GDDR7"]] },
  ],
};

export function getGamingLaptopSpecifications(index: number): SpecGroup[] {
  const deal = gamingLaptopDeals[index];
  const cpuBrand = /Ryzen/i.test(deal.cpu) ? "AMD" : "Intel";
  const gpuBrand = /RTX/i.test(deal.gpu) ? "NVIDIA" : "";
  const screenSize = deal.screen.match(/^[\d.]+\s*inch/i)?.[0] ?? deal.screen;

  const groups: SpecGroup[] = [
    { title: "Thông tin chung", rows: [["Hãng sản xuất", deal.brand], ["Dòng sản phẩm", deal.name], ["Nhu cầu sử dụng", "Gaming"]] },
    { title: "Bộ xử lý", rows: [["Hãng CPU", cpuBrand], ["CPU", deal.cpu]] },
    { title: "Bộ nhớ và lưu trữ", rows: [["Dung lượng RAM", deal.ram], ["Dung lượng SSD", deal.storage]] },
    { title: "Đồ họa", rows: [["Hãng GPU", gpuBrand], ["Card đồ họa", deal.gpu]] },
    { title: "Màn hình", rows: [["Kích thước màn hình", screenSize], ["Thông tin màn hình", deal.screen]] },
  ];
  for (const extra of verifiedExtras[index] ?? []) {
    const existing = groups.find((group) => group.title === extra.title);
    if (existing) existing.rows.push(...extra.rows);
    else groups.push(extra);
  }
  return groups;
}
