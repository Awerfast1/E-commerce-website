import { officeLaptopDeals } from "./officeLaptopDeals";

type SpecRow = [label: string, value: string];
type SpecGroup = { title: string; rows: SpecRow[] };

export function getOfficeLaptopSpecifications(index: number): SpecGroup[] {
  const laptop = officeLaptopDeals[index] || officeLaptopDeals[0];
  return [
    {
      title: "Thông tin chung",
      rows: [
        ["Hãng sản xuất", laptop.brand],
        ["Dòng sản phẩm", laptop.series],
        ["Nhu cầu sử dụng", "Laptop Văn Phòng, Học tập & Doanh nhân mỏng nhẹ"],
        ["Trọng lượng", laptop.weight],
        ["Đặc điểm nổi bật", laptop.highlight],
      ],
    },
    {
      title: "Bộ xử lý",
      rows: [
        ["CPU", laptop.cpu],
        ["GPU đồ họa", laptop.gpu],
      ],
    },
    {
      title: "Bộ nhớ & Lưu trữ",
      rows: [
        ["Dung lượng RAM", laptop.ram],
        ["Ổ cứng", laptop.storage],
      ],
    },
    {
      title: "Màn hình",
      rows: [
        ["Kích thước & Tấm nền", laptop.screen],
        ["Màu sắc & hiển thị", "Chuẩn màu cao, chống chói bảo vệ mắt"],
      ],
    },
    {
      title: "Phần mềm & Kết nối",
      rows: [
        ["Hệ điều hành", "Windows 11 Home bản quyền"],
        ["Kết nối không dây", "Wi-Fi 6E / Wi-Fi 7, Bluetooth 5.3+"],
      ],
    },
  ];
}
