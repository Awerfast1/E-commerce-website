const fs = require('fs');

const brandMap = {
  'Anker': 'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
  'Baseus': '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
  'Logitech': 'b76be2d6-fce2-4972-8745-af20a37d206f',
  'Ugreen': 'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
  'JBL': 'b8c76d96-4ff5-4599-bf0f-ae4c64113a94',
  'Sony': '1eb3e63f-975a-4847-a930-4480d7cfee63',
  'Apple': 'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
  'Samsung': '0cfe3523-e8b2-445a-a689-45b24810d338',
  'Xiaomi': '9608b564-cbe0-4ad5-adda-72a37cb87bd6',
  'Razer': '17f517e8-9194-4e4f-bdb3-c86b85812e73',
  'Kingston': 'd00bd89f-fa7e-4732-ba0b-6623f6f779d0',
  'Belkin': '9aef84d5-0d93-47f5-929b-51148c656f8d',
  'ASUS': '95935020-183f-44cc-a477-2a559734bdad',
  'ACER': 'eea3503a-05e7-4471-839c-ec14d82e8bf9',
  'LENOVO': '7ba28e54-bf81-4a00-a287-a81281ed1134',
  'ALIENWARE': '2ab38f62-f5bd-477f-b4b7-8e6ecc5b57bf',
  'DELL': '59c7d85d-38e9-445e-b6ef-ead5f816b0ca',
  'HP': 'df4cc519-b2f4-43e4-a09b-20280a7a532c',
  'LG': '060ca633-32c5-4788-9968-a9ead8e9b423',
};

const catMap = {
  'chargers': { id: 'bb852652-1bc0-4afe-8827-9289269826a9', name: 'Chargers' },
  'cables': { id: '5d1112ce-88fb-4675-b200-6ead1132d133', name: 'Cables' },
  'power-banks': { id: 'd605176d-160d-4cee-8a5d-bc9afa791a6d', name: 'Power Banks' },
  'phone-cases': { id: 'f14ae2e7-ae8e-400d-a9cf-d76bb0e98d1f', name: 'Phone Cases' },
  'screen-protectors': { id: '9c66b851-0431-491b-a607-7d716f8f3a2e', name: 'Screen Protectors' },
  'headphones': { id: '8a691ed1-c008-4a7a-843f-39c34247c648', name: 'Headphones' },
  'speakers': { id: '3a8458d6-4e01-49f5-80e1-80d93e58c9e9', name: 'Speakers' },
  'keyboards': { id: 'f15c6e06-8a54-4cba-878a-cfdcc8c026ae', name: 'Keyboards' },
  'mice': { id: 'ad83184f-1ea2-4a4e-a0fa-ea5e69f2123a', name: 'Mice' },
  'storage': { id: '104d2b42-33b0-40f7-a3ad-0416b5c6278d', name: 'Storage' },
  'hubs-adapters': { id: 'da02df1b-2a67-4c89-923c-f5f324d14734', name: 'Hubs & Adapters' },
  'stands-mounts': { id: '17329ace-6333-4589-9f3f-886732a1c92d', name: 'Stands & Mounts' },
  'laptop-gaming': { id: 'd9e0f08b-b06a-4fc7-a913-89395c331903', name: 'Laptop Gaming' },
  'laptop-van-phong': { id: '2c8405b0-8197-4315-9152-675318862e00', name: 'Laptop Văn Phòng' },
};

// Realistic product generators per category
const catalogSeeds = {
  'laptop-gaming': [
    { brand: 'ASUS', name: 'ASUS ROG Strix SCAR 18 (2025) G835JY', price: 95990000, compare: 105000000, desc: 'Intel Core Ultra 9 285HX, RTX 5090 16GB, 64GB DDR5, 2TB SSD, 18 inch 2.5K 240Hz Nebula HDR' },
    { brand: 'ASUS', name: 'ASUS ROG Strix SCAR 16 (2025) G635JZ', price: 79990000, compare: 86990000, desc: 'Intel Core Ultra 9 285HX, RTX 5080 16GB, 32GB DDR5, 1TB SSD, 16 inch Mini LED 240Hz' },
    { brand: 'ASUS', name: 'ASUS TUF Gaming F16 (2025) FX607JU', price: 27990000, compare: 31990000, desc: 'Intel Core i7-14650HX, RTX 4050 6GB, 16GB RAM, 512GB SSD, 16 inch FHD+ 165Hz' },
    { brand: 'ASUS', name: 'ASUS TUF Gaming A15 FA507UV', price: 29490000, compare: 33990000, desc: 'AMD Ryzen 7 8845HS, RTX 4060 8GB, 16GB RAM, 512GB SSD, 15.6 inch FHD 144Hz' },
    { brand: 'ACER', name: 'Acer Predator Helios 18 PH18-72', price: 89990000, compare: 98990000, desc: 'Intel Core i9-14900HX, RTX 4090 16GB, 32GB RAM, 2TB SSD, 18 inch WQXGA 250Hz Mini LED' },
    { brand: 'ACER', name: 'Acer Predator Helios 16 PH16-72', price: 54990000, compare: 61990000, desc: 'Intel Core i9-14900HX, RTX 4080 12GB, 32GB RAM, 1TB SSD, 16 inch WQXGA 240Hz' },
    { brand: 'ACER', name: 'Acer Nitro 16 Phoenix AN16-41', price: 28990000, compare: 32990000, desc: 'AMD Ryzen 7 7840HS, RTX 4060 8GB, 16GB RAM, 512GB SSD, 16 inch WQXGA 165Hz' },
    { brand: 'ACER', name: 'Acer Nitro 5 Tiger AN515-58', price: 20490000, compare: 24990000, desc: 'Intel Core i5-12500H, RTX 4050 6GB, 16GB RAM, 512GB SSD, 15.6 inch FHD 144Hz' },
    { brand: 'LENOVO', name: 'Lenovo Legion 9i Gen 9 (16 inch Intel)', price: 119990000, compare: 129990000, desc: 'Intel Core i9-14900HX, RTX 4090 16GB, 64GB RAM, 2TB SSD, Tản nhiệt nước tích hợp' },
    { brand: 'LENOVO', name: 'Lenovo Legion Slim 5 16AHP9', price: 34990000, compare: 38990000, desc: 'AMD Ryzen 7 8845HS, RTX 4060 8GB, 16GB RAM, 512GB SSD, 16 inch WQXGA 165Hz' },
    { brand: 'LENOVO', name: 'Lenovo LOQ 15ARP9', price: 21990000, compare: 24990000, desc: 'AMD Ryzen 7 7435HS, RTX 4050 6GB, 16GB RAM, 512GB SSD, 15.6 inch FHD 144Hz 100% sRGB' },
    { brand: 'LENOVO', name: 'Lenovo LOQ 15IAX9I', price: 17490000, compare: 20990000, desc: 'Intel Core i5-12450HX, Intel Arc A530M 4GB, 16GB RAM, 512GB SSD, 15.6 inch 144Hz' },
    { brand: 'DELL', name: 'Dell Gaming G15 5530', price: 24990000, compare: 28990000, desc: 'Intel Core i7-13650HX, RTX 4050 6GB, 16GB DDR5, 512GB SSD, 15.6 inch FHD 165Hz' },
    { brand: 'DELL', name: 'Dell Gaming G16 7630', price: 42990000, compare: 48990000, desc: 'Intel Core i9-13900HX, RTX 4070 8GB, 32GB RAM, 1TB SSD, 16 inch QHD+ 240Hz' },
    { brand: 'ALIENWARE', name: 'Alienware m18 R2 Gaming Laptop', price: 92990000, compare: 99990000, desc: 'Intel Core i9-14900HX, RTX 4090 16GB, 32GB DDR5, 2TB SSD, 18 inch QHD+ 165Hz' },
    { brand: 'ALIENWARE', name: 'Alienware x16 R2 Ultra-thin Gaming', price: 78990000, compare: 85990000, desc: 'Intel Core Ultra 9 185H, RTX 4080 12GB, 32GB LPDDR5X, 1TB SSD, 16 inch 240Hz' },
    { brand: 'HP', name: 'HP Omen 16 (2024) wf1026TX', price: 46990000, compare: 52990000, desc: 'Intel Core i7-14700HX, RTX 4070 8GB, 16GB DDR5, 1TB SSD, 16.1 inch QHD 240Hz' },
    { brand: 'HP', name: 'HP Victus 16-r0129TX', price: 26490000, compare: 30990000, desc: 'Intel Core i7-13700H, RTX 4050 6GB, 16GB DDR5, 512GB SSD, 16.1 inch FHD 144Hz' }
  ],
  'laptop-van-phong': [
    { brand: 'Apple', name: 'Apple MacBook Pro 16 M3 Max 36GB/1TB', price: 89990000, compare: 94990000, desc: 'Chip Apple M3 Max 14-core CPU, 30-core GPU, 36GB Unified Memory, 1TB SSD, Liquid Retina XDR' },
    { brand: 'Apple', name: 'Apple MacBook Pro 14 M3 Pro 18GB/512GB', price: 49990000, compare: 54990000, desc: 'Chip Apple M3 Pro 11-core CPU, 14-core GPU, 18GB Unified Memory, 512GB SSD Space Black' },
    { brand: 'Apple', name: 'Apple MacBook Air 15 M3 16GB/512GB', price: 37990000, compare: 41990000, desc: 'Chip M3 8-core CPU, 10-core GPU, 16GB RAM, 512GB SSD, Siêu mỏng nhẹ 1.51kg Starlight' },
    { brand: 'Apple', name: 'Apple MacBook Air 13 M3 8GB/256GB', price: 26990000, compare: 29990000, desc: 'Chip Apple M3, 8GB RAM, 256GB SSD, Màn hình Liquid Retina 13.6 inch Midnight' },
    { brand: 'DELL', name: 'Dell XPS 14 9440 Intel Core Ultra 7', price: 58990000, compare: 64990000, desc: 'Intel Core Ultra 7 155H, 16GB LPDDR5X, 1TB SSD, 14.5 inch 3.2K OLED Touch 120Hz' },
    { brand: 'DELL', name: 'Dell Inspiron 14 Plus 7440', price: 27990000, compare: 30990000, desc: 'Intel Core Ultra 7 155H, 16GB LPDDR5X, 1TB SSD, 14 inch 2.8K 90Hz Ice Blue' },
    { brand: 'HP', name: 'HP Spectre x360 14-eu0026TU 2-in-1', price: 43990000, compare: 47990000, desc: 'Intel Core Ultra 7 155H, 32GB LPDDR5X, 1TB SSD, 14 inch 2.8K OLED Cảm ứng xoay gập' },
    { brand: 'HP', name: 'HP Pavilion 14-dv2073TU', price: 15490000, compare: 17990000, desc: 'Intel Core i5-1235U, 16GB DDR4, 512GB SSD, 14 inch FHD IPS Vàng Gold' },
    { brand: 'LENOVO', name: 'Lenovo ThinkPad X1 Carbon Gen 12', price: 54990000, compare: 59990000, desc: 'Intel Core Ultra 7 155H, 32GB RAM, 1TB SSD, 14 inch 2.8K OLED Siêu nhẹ 1.09kg' },
    { brand: 'LG', name: 'LG gram Pro 16 2024 16Z90SP-G.AH76A5', price: 42990000, compare: 48990000, desc: 'Intel Core Ultra 7 155H, RTX 3050 4GB, 16GB RAM, 512GB SSD, Trọng lượng siêu thực 1.27kg' }
  ],
  'keyboards': [
    { brand: 'Logitech', name: 'Bàn phím không dây Logitech MX Keys S', price: 2690000, compare: 3290000, desc: 'Phím cơ cấu cắt kéo mượt mà, gõ thông minh, đèn nền tự động, Bluetooth & Logi Bolt' },
    { brand: 'Logitech', name: 'Bàn phím cơ Logitech MX Mechanical Mini', price: 3190000, compare: 3890000, desc: 'Switch cơ học Low Profile Tactile Quiet, kết nối 3 thiết bị, layout 75%' },
    { brand: 'Logitech', name: 'Bàn phím không dây Logitech K380s Pebble 2', price: 690000, compare: 890000, desc: 'Nhỏ gọn thời trang, kết nối đa thiết bị Easy-Switch, pin dùng đến 36 tháng' },
    { brand: 'Logitech', name: 'Bàn phím cơ Logitech G512 RGB Carbon', price: 1890000, compare: 2490000, desc: 'Khung nhôm máy bay 5052, GX Brown switch, Lightsync RGB 16.8 triệu màu' },
    { brand: 'Razer', name: 'Bàn phím cơ Razer BlackWidow V4 Pro', price: 5890000, compare: 6790000, desc: 'Green Mechanical Switch, núm xoay đa năng Razer Command Dial, led gầm rực rỡ' },
    { brand: 'Razer', name: 'Bàn phím quang cơ Razer Huntsman Mini 60%', price: 2490000, compare: 3190000, desc: 'Linear Optical Switch thế hệ 2, PBT Doubleshot keycap, thiết kế mini 60%' },
    { brand: 'Razer', name: 'Bàn phím cơ không dây Razer DeathStalker V2 Pro', price: 4990000, compare: 5990000, desc: 'Switch quang học Low Profile siêu nhạy, HyperSpeed Wireless 2.4GHz & Bluetooth' },
    { brand: 'Razer', name: 'Bàn phím giả cơ Razer Ornata V3 X', price: 990000, compare: 1390000, desc: 'Phím bấm đệm êm, chống tràn nước bền bỉ, Razer Chroma RGB đơn vùng' },
    { brand: 'ASUS', name: 'Bàn phím cơ ASUS ROG Azoth 75% OLED', price: 5790000, compare: 6590000, desc: 'Màn hình OLED hiển thị, Gasket Mount 3 lớp đệm, switch ROG NX Snow lube sẵn' },
    { brand: 'ASUS', name: 'Bàn phím cơ ASUS ROG Strix Scope II 96 Wireless', price: 3890000, compare: 4490000, desc: 'Layout 96% đầy đủ phím số, đệm tiêu âm tích hợp, hot-swap 5-pin' },
    { brand: 'ASUS', name: 'Bàn phím cơ ASUS TUF Gaming K3 Gen II', price: 1390000, compare: 1790000, desc: 'Chuẩn chống nước bụi IP57, switch cơ học quang học, đèn nền RGB từng phím' },
    { brand: 'Apple', name: 'Bàn phím Apple Magic Keyboard Touch ID Numeric', price: 4490000, compare: 4990000, desc: 'Bàn phím Apple chính hãng tích hợp Touch ID mở khóa nhanh, hàng phím số đầy đủ' },
    { brand: 'Apple', name: 'Bàn phím Apple Magic Keyboard 2 White', price: 2490000, compare: 2990000, desc: 'Phím cắt kéo cực êm, kết nối tự động với máy Mac, sạc Type-C thế hệ mới' },
    { brand: 'Xiaomi', name: 'Bàn phím không dây Xiaomi MIIIW Dual Mode', price: 550000, compare: 750000, desc: 'Hỗ trợ Bluetooth và USB 2.4Ghz, thiết kế phím tròn cổ điển thanh lịch' },
    { brand: 'Baseus', name: 'Bàn phím Bluetooth Baseus K01B Tri-Mode', price: 450000, compare: 650000, desc: 'Kết nối cùng lúc 3 thiết bị Laptop, Tablet, Điện thoại, phím bấm êm ái silent' },
    { brand: 'Ugreen', name: 'Bàn phím cơ không dây Ugreen KU102 89 phím', price: 1190000, compare: 1590000, desc: 'Switch Brown gõ đầm tay, kết nối có dây Type-C & Bluetooth 5.0, pin 180 giờ' },
    { brand: 'Ugreen', name: 'Bàn phím văn phòng siêu mỏng Ugreen KU004', price: 320000, compare: 450000, desc: 'Layout Fullsize 104 phím, phím bấm dạng chiclet êm tay không gây ồn' },
    { brand: 'Anker', name: 'Bàn phím Bluetooth siêu mỏng Anker Ultra-Compact', price: 490000, compare: 690000, desc: 'Thời lượng pin 6 tháng, tương thích hoàn hảo iOS, Android, Windows, Mac' },
    { brand: 'Kingston', name: 'Bàn phím cơ HyperX Alloy Origins Core RGB', price: 1990000, compare: 2490000, desc: 'Khung nhôm nguyên khối chuẩn máy bay, HyperX Red Linear switch, TKL 80%' },
    { brand: 'Kingston', name: 'Bàn phím cơ HyperX Alloy Rise 75 Gaming', price: 4290000, compare: 4990000, desc: 'Gasket mount cao cấp, Hot-swap switch thay nóng nhanh chóng, cảm biến ánh sáng' },
    { brand: 'ACER', name: 'Bàn phím cơ Acer Predator Aethon 301 TKL', price: 1290000, compare: 1690000, desc: 'Outemu Blue switch gõ nảy tanh tách, 6 vùng đèn nền sinh động' },
    { brand: 'LENOVO', name: 'Bàn phím cơ Lenovo Legion K500 RGB Gaming', price: 1490000, compare: 1990000, desc: 'Phím cơ Red switch êm ái, kê tay tháo rời thoải mái khi chơi game kéo dài' }
  ],
  'mice': [
    { brand: 'Logitech', name: 'Chuột không dây Logitech MX Master 3S', price: 2390000, compare: 2990000, desc: 'Cảm biến 8000 DPI Darkfield lướt trên kính, con lăn từ tính MagSpeed, click êm Silent' },
    { brand: 'Logitech', name: 'Chuột Logitech G PRO X Superlight 2 DEX', price: 3890000, compare: 4390000, desc: 'Thiết kế công thái học bất đối xứng, siêu nhẹ 60g, cảm biến HERO 2 32.000 DPI' },
    { brand: 'Logitech', name: 'Chuột không dây Logitech Lift Vertical Công thái học', price: 1490000, compare: 1790000, desc: 'Góc nghiêng 57 độ giảm áp lực cổ tay, nút bấm êm dịu, phù hợp tay vừa và nhỏ' },
    { brand: 'Logitech', name: 'Chuột không dây Logitech Pebble M350s 2', price: 450000, compare: 590000, desc: 'Thiết kế dẹt bo tròn trẻ trung, siêu yên tĩnh Silent Touch, kết nối Bluetooth' },
    { brand: 'Razer', name: 'Chuột không dây Razer Viper V3 Pro Ultra-lightweight', price: 3990000, compare: 4590000, desc: 'Trọng lượng siêu nhẹ chỉ 54g, cảm biến Focus Pro 35K Gen-2, tần số quét 8000Hz' },
    { brand: 'Razer', name: 'Chuột chơi game Razer Basilisk V3 Pro 35K', price: 3690000, compare: 4290000, desc: '13 nút bấm tùy chỉnh, con lăn Razer HyperScroll Tilt Wheel, sạc không dây Qi' },
    { brand: 'Razer', name: 'Chuột Razer Cobra Pro RGB Wireless', price: 2790000, compare: 3390000, desc: '11 vùng Chroma RGB phát sáng, Switch quang học Gen 3 không lo double-click' },
    { brand: 'Razer', name: 'Chuột không dây công thái học Razer Pro Click Mini', price: 1890000, compare: 2290000, desc: 'Con lăn 4 chiều tự do, độ ồn switch cực thấp chuyên dùng phòng họp văn phòng' },
    { brand: 'Apple', name: 'Chuột Apple Magic Mouse 2 Black USB-C', price: 2390000, compare: 2690000, desc: 'Mặt kính cảm ứng Multi-Touch vuốt cuộn mượt mà, cổng sạc Type-C màu đen bóng bẩy' },
    { brand: 'Apple', name: 'Chuột Apple Magic Mouse 2 White USB-C', price: 1990000, compare: 2390000, desc: 'Chính hãng Apple, bề mặt cảm ứng liền mạch di chuyển mượt mọi bề mặt' },
    { brand: 'ASUS', name: 'Chuột ASUS ROG Harpe Ace Aim Lab Edition', price: 3190000, compare: 3690000, desc: 'Trọng lượng lông vũ 54g, tối ưu hóa bởi các tuyển thủ esports Aim Lab' },
    { brand: 'ASUS', name: 'Chuột ASUS ROG Gladius III Wireless AimPoint', price: 2190000, compare: 2690000, desc: 'Cảm biến ROG AimPoint 36.000 DPI, Push-Fit Switch Socket II thay switch dễ dàng' },
    { brand: 'ASUS', name: 'Chuột không dây ASUS SmartO Mouse MD200', price: 950000, compare: 1250000, desc: 'Độ bền switch 10 triệu lần nhấn, có quai xách tiện lợi cho nhân viên văn phòng' },
    { brand: 'Xiaomi', name: 'Chuột không dây Xiaomi Dual Mode Wireless Mouse Silent', price: 290000, compare: 390000, desc: '2 chế độ Bluetooth & USB receiver 2.4GHz, nút bấm chống ồn ban đêm' },
    { brand: 'Xiaomi', name: 'Chuột công thái học Xiaomi Wireless Mouse 3', price: 350000, compare: 480000, desc: 'Thiết kế ôm sát lòng bàn tay, phím cạnh hông tiện lợi chuyển trang nhanh' },
    { brand: 'Baseus', name: 'Chuột không dây Baseus F01B Tri-Mode Silent', price: 280000, compare: 390000, desc: 'Điều chỉnh 3 mức DPI 800/1200/1600, thiết kế thanh lịch sang trọng' },
    { brand: 'Ugreen', name: 'Chuột công thái học không dây Ugreen Ergonomic 4000 DPI', price: 390000, compare: 520000, desc: 'Thiết kế uốn lượn nâng đỡ ngón tay cái, 5 mức DPI tùy chỉnh linh hoạt' },
    { brand: 'Ugreen', name: 'Chuột không dây mỏng nhẹ Ugreen MU006 2.4G/Bluetooth', price: 290000, compare: 400000, desc: 'Thiết kế thời trang, dễ dàng cất vào túi chống sốc laptop khi đi cà phê làm việc' },
    { brand: 'Kingston', name: 'Chuột gaming HyperX Pulsefire Haste 2 Wireless', price: 1890000, compare: 2290000, desc: 'Vỏ liền siêu nhẹ 61g, pin lên tới 100 giờ, cảm biến HyperX 26K độc quyền' },
    { brand: 'Kingston', name: 'Chuột gaming HyperX Pulsefire Core RGB', price: 590000, compare: 790000, desc: 'Cảm biến quang học Pixart 3327, 7 nút lập trình marco, đèn RGB rực rỡ' },
    { brand: 'DELL', name: 'Chuột không dây Dell Premier Rechargeable WM527', price: 1190000, compare: 1490000, desc: 'Thiết kế vòm cao cấp, kết nối Bluetooth 4.0 và 2.4GHz pin sạc tiện lợi' },
    { brand: 'LENOVO', name: 'Chuột không dây Lenovo Legion M600s Qi Wireless', price: 1790000, compare: 2190000, desc: 'Hỗ trợ sạc không dây chuẩn Qi, chân chuột 100% PTFE di siêu mượt' }
  ],
  'headphones': [
    { brand: 'Sony', name: 'Tai nghe chống ồn không dây Sony WH-1000XM5', price: 7990000, compare: 8990000, desc: 'Chống ồn đỉnh cao Auto NC Optimizer, 8 micro thoại rõ nét, pin 30 giờ sạc nhanh' },
    { brand: 'Sony', name: 'Tai nghe True Wireless Sony WF-1000XM5', price: 5490000, compare: 6490000, desc: 'Driver Dynamic X mang lại âm thanh Hi-Res Audio, 2 chip xử lý chống ồn V2 & QN2e' },
    { brand: 'Sony', name: 'Tai nghe chụp tai Sony WH-CH720N Noise Canceling', price: 2390000, compare: 2890000, desc: 'Trọng lượng siêu nhẹ 192g, chip chống ồn V1 tương tự dòng flagship XM5' },
    { brand: 'Sony', name: 'Tai nghe nhét tai Sony MDR-XB55AP Extra Bass', price: 690000, compare: 890000, desc: 'Công nghệ Powered Bass Duct++ cho âm trầm cực sâu, có mic đàm thoại' },
    { brand: 'Apple', name: 'Tai nghe Apple AirPods Max USB-C 2024', price: 13490000, compare: 14490000, desc: 'Âm thanh không gian cá nhân hóa, chống ồn chủ động chuyên nghiệp, vỏ nhôm nguyên khối' },
    { brand: 'Apple', name: 'Tai nghe Apple AirPods Pro 2 MagSafe USB-C', price: 5490000, compare: 6190000, desc: 'Chip H2, chống ồn gấp 2 lần thế hệ cũ, âm thanh thích ứng Adaptive Audio' },
    { brand: 'Apple', name: 'Tai nghe Apple AirPods 4 Chống ồn chủ động ANC', price: 4490000, compare: 4890000, desc: 'AirPods 4 thế hệ mới nhất với tính năng khử ồn chủ động lần đầu xuất hiện trên bản open-ear' },
    { brand: 'JBL', name: 'Tai nghe chụp tai JBL Tune 770NC Chống ồn', price: 2490000, compare: 2990000, desc: 'Âm bass thuần khiết JBL Pure Bass Sound, pin khủng tới 70 giờ, Bluetooth 5.3' },
    { brand: 'JBL', name: 'Tai nghe Bluetooth True Wireless JBL Wave Beam', price: 1190000, compare: 1490000, desc: 'Kháng nước kháng bụi IP54, nhận biết môi trường xung quanh Smart Ambient' },
    { brand: 'JBL', name: 'Tai nghe gaming JBL Quantum 100X Console', price: 790000, compare: 990000, desc: 'Âm thanh không gian chân thực JBL QuantumSOUND Signature, mic thoại tháo rời' },
    { brand: 'Razer', name: 'Tai nghe gaming Razer BlackShark V2 Pro (2023)', price: 4690000, compare: 5390000, desc: 'Mic Razer HyperClear Super Wideband thu âm như podcast, đệm tai mút hoạt tính FlowKnit' },
    { brand: 'Razer', name: 'Tai nghe chụp tai Razer Kraken V3 X USB', price: 1290000, compare: 1690000, desc: 'Driver Razer TriForce 40mm, giả lập âm thanh vòm 7.1 Surround Sound, led Chroma RGB' },
    { brand: 'Razer', name: 'Tai nghe nhét tai Razer Hammerhead Pro HyperSpeed', price: 4290000, compare: 4990000, desc: 'Độ trễ siêu thấp qua dongle Type-C 2.4GHz, chống ồn chủ động kép kết hợp sạc Qi' },
    { brand: 'Logitech', name: 'Tai nghe gaming không dây Logitech G733 Lightspeed RGB', price: 2890000, compare: 3490000, desc: 'Trọng lượng nhẹ 278g, dải băng đô co giãn thoáng khí, màng loa Pro-G 40mm' },
    { brand: 'Logitech', name: 'Tai nghe gaming Logitech G PRO X 2 Lightspeed', price: 5490000, compare: 6190000, desc: 'Màng loa Graphene 50mm cách mạng, xoay gập linh hoạt, kết nối 3 chế độ đa nền tảng' },
    { brand: 'Logitech', name: 'Tai nghe chụp tai Logitech Zone Vibe 100', price: 1990000, compare: 2390000, desc: 'Thiết kế hiện đại tối giản cho dân văn phòng, mic gập tự ngắt tiếng tiện dụng' },
    { brand: 'ASUS', name: 'Tai nghe ASUS ROG Cetra True Wireless SpeedNova', price: 4290000, compare: 4890000, desc: 'Công nghệ ROG SpeedNova 2.4Ghz độ trễ siêu thấp, âm thanh 24-bit 96 kHz Hi-Res' },
    { brand: 'ASUS', name: 'Tai nghe chơi game ASUS ROG Delta S Animate', price: 5190000, compare: 5890000, desc: 'Màn hình led AniMe Matrix trên củ tai, DAC giải mã ESS 9281 Quad DAC chất lượng cao' },
    { brand: 'Kingston', name: 'Tai nghe HyperX Cloud III Wireless Black Red', price: 3490000, compare: 3990000, desc: 'Thời lượng pin kỷ lục 120 giờ không cần sạc lại, đệm tai bọc da êm ái huyền thoại' },
    { brand: 'Kingston', name: 'Tai nghe chơi game HyperX Cloud Stinger 2 Core', price: 890000, compare: 1190000, desc: 'Âm thanh không gian DTS Headphone:X Spatial Audio, trọng lượng nhẹ ôm khít tai' },
    { brand: 'Baseus', name: 'Tai nghe chụp tai chống ồn Baseus Bowie H1 Pro', price: 890000, compare: 1290000, desc: 'Công nghệ chống ồn chủ động 48dB, màng loa kép sinh học, âm thanh vòm 360 độ' },
    { brand: 'Anker', name: 'Tai nghe chống ồn Soundcore by Anker Space One', price: 1890000, compare: 2390000, desc: 'Khử 98% tiếng ồn xung quanh, chứng nhận âm thanh Hi-Res Wireless qua codec LDAC' }
  ],
  'speakers': [
    { brand: 'JBL', name: 'Loa Bluetooth di động JBL Charge 5', price: 3490000, compare: 3990000, desc: 'Kháng nước chống bụi IP67, pin trâu 20 giờ, tích hợp sạc dự phòng cho điện thoại' },
    { brand: 'JBL', name: 'Loa Bluetooth di động JBL Flip 6', price: 2590000, compare: 2990000, desc: 'Hệ thống loa 2 đường tiếng cho âm thanh to bùng nổ, thiết kế nhỏ gọn cầm tay' },
    { brand: 'JBL', name: 'Loa di động mini JBL Go 4', price: 990000, compare: 1290000, desc: 'Thiết kế bỏ túi siêu nhỏ gọn, quai xách tiện dụng, âm thanh JBL Pro Sound uy lực' },
    { brand: 'JBL', name: 'Loa tiệc tùng JBL PartyBox Club 120', price: 9490000, compare: 10500000, desc: 'Công suất khủng 160W, đèn led cảm ứng theo nhạc sống động, cắm micro và guitar hát karaoke' },
    { brand: 'Sony', name: 'Loa không dây di động Sony SRS-XB100', price: 1190000, compare: 1490000, desc: 'Bộ khuếch tán âm thanh Sound Diffusion Processor, chuẩn IP67 chịu mưa gió dã ngoại' },
    { brand: 'Sony', name: 'Loa tiệc không dây Sony SRS-XV500', price: 7990000, compare: 8990000, desc: 'Màng loa X-Balanced Speaker Unit cho âm trầm rền vang, pin dùng liên tục 25 giờ' },
    { brand: 'Sony', name: 'Loa thanh Soundbar Sony HT-S20R 5.1 Kênh', price: 4490000, compare: 5490000, desc: 'Công suất 400W với 2 loa vòm phía sau và loa siêu trầm riêng, trải nghiệm rạp phim tại nhà' },
    { brand: 'Apple', name: 'Loa thông minh Apple HomePod 2 Midnight', price: 7490000, compare: 7990000, desc: 'Âm thanh chất lượng phòng thu Studio Sound, tích hợp trợ lý Siri thông minh và nhà thông minh HomeKit' },
    { brand: 'Apple', name: 'Loa thông minh Apple HomePod mini Yellow', price: 2590000, compare: 2890000, desc: 'Thiết kế quả cầu tí hon, âm thanh 360 độ ngập tràn phòng ngủ và bàn làm việc' },
    { brand: 'Razer', name: 'Loa thanh chơi game Razer Leviathan V2 X PC Soundbar', price: 2690000, compare: 3190000, desc: 'Cung cấp năng lượng qua cổng USB Type-C duy nhất, hiệu ứng Chroma RGB 14 vùng rực sáng' },
    { brand: 'Razer', name: 'Hệ thống loa 2.1 Razer Nommo V2 kèm Subwoofer không dây', price: 6890000, compare: 7890000, desc: 'Âm thanh không gian THX Spatial Audio, màng loa toàn dải 3.2 inch mạ nhôm tinh tế' },
    { brand: 'Logitech', name: 'Hệ thống loa máy tính 2.1 Logitech Z407 kèm núm xoay', price: 2190000, compare: 2590000, desc: 'Công suất đỉnh 80W, kết nối không dây Bluetooth hoặc USB, núm điều khiển từ xa không dây' },
    { brand: 'Logitech', name: 'Hệ thống loa xem phim Logitech Z906 5.1 vòm THX', price: 7990000, compare: 8990000, desc: 'Công suất đỉnh 1000W (500W RMS), chứng nhận âm thanh rạp chiếu phim THX chuẩn 5.1' },
    { brand: 'Logitech', name: 'Loa để bàn Logitech Z120 cổng USB', price: 280000, compare: 380000, desc: 'Thiết kế gọn gàng cấp nguồn trực tiếp qua USB máy tính, có giắc 3.5mm tiện dụng' },
    { brand: 'Anker', name: 'Loa Bluetooth Anker Soundcore Motion Boom Plus 80W', price: 3490000, compare: 4190000, desc: 'Công suất khủng 80W chống nước IP67 nổi trên mặt nước, pin 20 giờ kiêm sạc dự phòng' },
    { brand: 'Anker', name: 'Loa Bluetooth mini Anker Soundcore 2 12W BassUp', price: 890000, compare: 1190000, desc: 'Thời lượng pin huyền thoại 24 giờ liên tục, công nghệ đẩy dải trầm BassUp độc quyền' },
    { brand: 'Xiaomi', name: 'Loa Bluetooth di động Xiaomi Sound Pocket 5W', price: 390000, compare: 490000, desc: 'Kích thước siêu nhỏ nhẹ 200g bỏ túi du lịch, kháng nước IP67 thời trang' },
    { brand: 'Xiaomi', name: 'Loa thông minh Xiaomi Smart Speaker IR Control', price: 690000, compare: 890000, desc: 'Tích hợp điều khiển hồng ngoại tắt bật TV, máy lạnh, hiển thị đồng hồ LED số' },
    { brand: 'Baseus', name: 'Loa vi tính Baseus AeQur DS10 Soundbar RGB', price: 690000, compare: 890000, desc: 'Thiết kế thanh dài đặt gọn gàng dưới màn hình máy tính, hiệu ứng led chuyển màu cuốn hút' },
    { brand: 'Baseus', name: 'Loa Bluetooth mini Baseus AeQur V2 360 Sound', price: 550000, compare: 750000, desc: 'Âm thanh đa hướng 360 độ, kết nối Bluetooth 5.0 ổn định khoảng cách xa' },
    { brand: 'ASUS', name: 'Loa gaming mini ASUS ROG Cetra RGB Desktop', price: 1690000, compare: 2090000, desc: 'Đồng bộ đèn Aura Sync với bo mạch chủ và card màn hình gaming' },
    { brand: 'Kingston', name: 'Loa gaming HyperX Cloud Soundbar Mini', price: 1490000, compare: 1890000, desc: 'Củ loa kép hỗ trợ mic đàm thoại rõ tiếng trong discord chơi game đồng đội' }
  ],
  'storage': [
    { brand: 'Samsung', name: 'Ổ cứng SSD Samsung 990 PRO 2TB PCIe Gen 4x4 NVMe', price: 4790000, compare: 5490000, desc: 'Tốc độ đọc tuần tự lên tới 7.450 MB/s, tản nhiệt nhôm kiểm soát nhiệt độ thông minh' },
    { brand: 'Samsung', name: 'Ổ cứng SSD Samsung 990 EVO 1TB PCIe 4.0 x4 / 5.0 x2', price: 2190000, compare: 2590000, desc: 'Tiết kiệm điện năng tới 70% so với thế hệ trước, tốc độ đọc 5.000 MB/s' },
    { brand: 'Samsung', name: 'Ổ cứng SSD Di động Samsung T7 Shield 1TB USB 3.2', price: 2790000, compare: 3290000, desc: 'Vỏ cao su bọc ngoài siêu bền chịu rơi 3m, kháng nước IP65, tốc độ 1.050 MB/s' },
    { brand: 'Samsung', name: 'Thẻ nhớ MicroSD Samsung PRO Plus 256GB kèm Adapter', price: 650000, compare: 790000, desc: 'Tốc độ đọc 180MB/s, quay video mượt mà chuẩn 4K UHD cho camera hành trình Flycam' },
    { brand: 'Kingston', name: 'Ổ cứng SSD Kingston KC3000 1TB PCIe 4.0 NVMe M.2', price: 2450000, compare: 2890000, desc: 'Bộ điều khiển Gen 4x4 Phison E18 mới nhất, tốc độ đọc ghi khủng 7.000 MB/s' },
    { brand: 'Kingston', name: 'Ổ cứng SSD Di động Kingston XS1000 1TB USB 3.2 Gen 2', price: 1890000, compare: 2290000, desc: 'Kích thước siêu nhỏ chỉ bằng chiếc hộp quẹt, trọng lượng 29g dễ dàng bỏ túi quần' },
    { brand: 'Kingston', name: 'USB Kingston DataTraveler Exodia M 64GB USB 3.2 Gen 1', price: 120000, compare: 160000, desc: 'Thiết kế nắp trượt thông minh bảo vệ chân cắm, vòng móc khóa tiện mang theo' },
    { brand: 'Kingston', name: 'Thẻ nhớ MicroSD Kingston Canvas Go! Plus 128GB', price: 350000, compare: 450000, desc: 'Chuẩn U3, V30 hỗ trợ quay video hành động chuyên nghiệp, độ bền cực cao' },
    { brand: 'Kingston', name: 'Ổ cứng SSD Kingston A400 480GB 2.5 inch SATA III', price: 790000, compare: 990000, desc: 'Giải pháp nâng cấp tốc độ giá rẻ hồi sinh laptop văn phòng và PC đời cũ' },
    { brand: 'Kingston', name: 'Ổ cứng SSD Kingston Fury Renegade 2TB Heatsink', price: 5190000, compare: 5890000, desc: 'Trang bị sẵn tản nhiệt nhôm dày dặn tương thích hoàn hảo máy chơi game PlayStation 5' },
    { brand: 'SanDisk', name: 'Ổ cứng SSD Di động SanDisk Extreme Portable V2 1TB', price: 2890000, compare: 3490000, desc: 'Tốc độ đọc ghi lên đến 1050MB/s, móc treo tiện lợi, bảo mật bằng mã hóa AES 256-bit' },
    { brand: 'SanDisk', name: 'Thẻ nhớ SanDisk Extreme PRO MicroSDXC 256GB 200MB/s', price: 790000, compare: 950000, desc: 'Tốc độ đọc thẻ thần tốc 200MB/s với công nghệ SanDisk QuickFlow độc quyền' },
    { brand: 'SanDisk', name: 'USB 3.1 Type-C SanDisk Ultra Dual Drive Luxe 128GB', price: 420000, compare: 550000, desc: 'Thiết kế xoay vỏ kim loại nguyên khối, có cả 2 đầu cắm Type-C và Type-A' },
    { brand: 'Seagate', name: 'Ổ cứng HDD Di động Seagate One Touch 2TB USB 3.0', price: 1990000, compare: 2390000, desc: 'Vỏ nhôm xước sang trọng, tặng kèm phần mềm sao lưu tự động và bản quyền cứu hộ dữ liệu Rescue' },
    { brand: 'Seagate', name: 'Ổ cứng HDD Di động Seagate One Touch 4TB Black', price: 3390000, compare: 3990000, desc: 'Dung lượng khổng lồ 4TB lưu trữ hàng nghìn bộ phim tài liệu, ảnh gia đình và game' },
    { brand: 'Seagate', name: 'Ổ cứng HDD chuyên Camera Seagate SkyHawk 4TB', price: 2390000, compare: 2790000, desc: 'Chuyên dụng hoạt động 24/7 ghi hình liên tục không giật khung hình cho hệ thống NVR/DVR' },
    { brand: 'Western Digital', name: 'Ổ cứng SSD WD Black SN850X 1TB PCIe Gen4 NVMe', price: 2690000, compare: 3190000, desc: 'Chuyên game đỉnh cao với Game Mode 2.0, tốc độ đọc chóng mặt 7.300 MB/s' },
    { brand: 'Western Digital', name: 'Ổ cứng SSD WD Blue SN580 1TB PCIe Gen4 x4', price: 1790000, compare: 2190000, desc: 'Lựa chọn quốc dân cho nhà sáng tạo nội dung, hỗ trợ công nghệ nCache 4.0' },
    { brand: 'Western Digital', name: 'Ổ cứng Di động WD My Passport 2TB 2.5 inch USB 3.2', price: 1950000, compare: 2290000, desc: 'Thiết kế nhỏ gọn, hỗ trợ đặt mật khẩu khóa ổ cứng chống mất cắp dữ liệu mật' },
    { brand: 'ASUS', name: 'Box di động đựng SSD M.2 NVMe ASUS ROG Strix Arion', price: 1190000, compare: 1490000, desc: 'Vỏ hợp kim nhôm tản nhiệt cực mát, đèn led Aura Sync RGB, tốc độ USB-C 10Gbps' },
    { brand: 'ASUS', name: 'Box di động đựng SSD ASUS TUF Gaming A1 chuẩn quân đội', price: 890000, compare: 1150000, desc: 'Chuẩn chống nước chống va đập IP68 và độ bền quân sự MIL-STD-810H' },
    { brand: 'Ugreen', name: 'Vỏ bọc Box SSD M.2 NVMe/SATA Ugreen 10Gbps nhôm tản nhiệt', price: 420000, compare: 550000, desc: 'Tương thích cả 2 chuẩn PCIe NVMe và SATA NGFF, hỗ trợ dung lượng ổ cứng đến 4TB' }
  ],
  'chargers': [
    { brand: 'Anker', name: 'Củ sạc nhanh Anker 737 GaNPrime 120W (A2148)', price: 1590000, compare: 1990000, desc: '3 cổng sạc nhanh sạc cùng lúc 2 laptop và 1 điện thoại, công nghệ tản nhiệt ActiveShield 2.0' },
    { brand: 'Anker', name: 'Củ sạc nhanh Anker Nano II 65W GaN II (A2663)', price: 790000, compare: 990000, desc: 'Kích thước nhỏ hơn 58% củ sạc laptop tiêu chuẩn, chuẩn sạc PD sạc đầy MacBook Pro' },
    { brand: 'Anker', name: 'Củ sạc nhanh Anker Nano 3 30W Type-C (A2146)', price: 390000, compare: 490000, desc: 'Chuyên sạc nhanh tối đa công suất cho iPhone 15/16 Series và iPad Pro, chân gập nhỏ gọn' },
    { brand: 'Anker', name: 'Củ sạc để bàn Anker Prime 240W 4 cổng (A2643)', price: 2890000, compare: 3490000, desc: 'Trạm sạc bàn cao cấp, 1 cổng Type-C đạt công suất tối đa 140W chuẩn PD 3.1' },
    { brand: 'Baseus', name: 'Củ sạc nhanh Baseus GaN5 Pro 100W kèm cáp 100W', price: 850000, compare: 1190000, desc: '2 Type-C + 2 USB-A sạc đồng thời 4 thiết bị, công nghệ làm mát tự phát triển BCT' },
    { brand: 'Baseus', name: 'Củ sạc nhanh Baseus GaN5 Pro 65W 2C1A', price: 550000, compare: 750000, desc: 'Công suất 65W ổn định cho laptop học tập làm việc, kích thước bỏ túi tiện lợi' },
    { brand: 'Baseus', name: 'Củ sạc nhanh Baseus Super Si 20W Quick Charger', price: 160000, compare: 230000, desc: 'Giá thành cực mềm, sạc pin 50% cho iPhone chỉ trong 30 phút' },
    { brand: 'Ugreen', name: 'Củ sạc nhanh Ugreen Nexode 100W 4 cổng GaN', price: 990000, compare: 1390000, desc: 'Cung cấp năng lượng mạnh mẽ cho toàn bộ hệ sinh thái đồ công nghệ trên bàn làm việc' },
    { brand: 'Ugreen', name: 'Củ sạc nhanh Ugreen Nexode Robot 65W GaN hình Robot ngộ nghĩnh', price: 690000, compare: 890000, desc: 'Mặt hiển thị biểu cảm LED thể hiện trạng thái pin sạc, thiết kế độc đáo cá tính' },
    { brand: 'Ugreen', name: 'Củ sạc nhanh Ugreen Nexode 30W Robot Mini GaN', price: 350000, compare: 490000, desc: 'Chân cắm dạng đôi giày tháo rời kiêm bảo vệ chân sạc, công suất 30W chuẩn PD' },
    { brand: 'Apple', name: 'Củ sạc Apple 20W USB-C Power Adapter chính hãng', price: 520000, compare: 590000, desc: 'Sạc chính hãng Apple tối ưu an toàn tuyệt đối cho pin của iPhone và iPad' },
    { brand: 'Apple', name: 'Củ sạc Apple 35W Dual USB-C Port Compact Power Adapter', price: 1490000, compare: 1690000, desc: 'Hai cổng USB-C chân gập cao cấp, sạc cùng lúc MacBook Air và iPhone' },
    { brand: 'Apple', name: 'Củ sạc Apple 140W USB-C Power Adapter', price: 2790000, compare: 2990000, desc: 'Sạc công suất cao nhất cho MacBook Pro 16 inch sạc 50% chỉ sau 30 phút' },
    { brand: 'Samsung', name: 'Củ sạc siêu nhanh Samsung 45W Type-C kèm cáp 5A', price: 790000, compare: 990000, desc: 'Chuẩn Super Fast Charging 2.0 tối đa công suất cho dòng Galaxy S24 Ultra và Z Fold' },
    { brand: 'Samsung', name: 'Củ sạc nhanh Samsung 25W Type-C không cáp', price: 320000, compare: 450000, desc: 'Chuẩn PD 3.0 PPS tương thích các máy Android và máy tính bảng' },
    { brand: 'Belkin', name: 'Củ sạc nhanh Belkin BoostCharge Pro 65W Dual USB-C GaN', price: 990000, compare: 1290000, desc: 'Chứng nhận an toàn tiêu chuẩn quốc tế, bảo vệ chống quá dòng và quá nhiệt' },
    { brand: 'Belkin', name: 'Đế sạc không dây 3 in 1 Belkin MagSafe 15W', price: 3490000, compare: 3990000, desc: 'Sạc đồng thời iPhone, Apple Watch và AirPods, chứng nhận Made for MagSafe' },
    { brand: 'Xiaomi', name: 'Củ sạc nhanh Xiaomi 67W Type-A sạc Turbo', price: 420000, compare: 550000, desc: 'Hỗ trợ sạc siêu tốc Mi Turbo Charge 67W cho các dòng máy Xiaomi và Redmi' },
    { brand: 'Xiaomi', name: 'Củ sạc nhanh Xiaomi GaN 33W Type-C', price: 290000, compare: 390000, desc: 'Kích thước siêu nhỏ bằng ngón tay cái, công nghệ bán dẫn GaN mát mẻ' },
    { brand: 'ASUS', name: 'Củ sạc ROG 65W GaN Gaming Charger cho ROG Ally', price: 1290000, compare: 1590000, desc: 'Tối ưu sạc công suất cao cho máy chơi game cầm tay ROG Ally và laptop gaming nhẹ' },
    { brand: 'Baseus', name: 'Đế sạc không dây nam châm từ tính Baseus MagPro 2 in 1', price: 650000, compare: 850000, desc: 'Gắn hút nam châm hít chặt lưng điện thoại gập mở góc 60 độ tiện xem phim' }
  ],
  'cables': [
    { brand: 'Anker', name: 'Cáp sạc Anker PowerLine III Flow C to C 100W 0.9m', price: 290000, compare: 390000, desc: 'Chất liệu silicone siêu mềm mịn chống rối, chịu uốn gập 25.000 lần' },
    { brand: 'Anker', name: 'Cáp sạc Anker 765 Type-C to Type-C 140W 1.8m chuẩn PD 3.1', price: 450000, compare: 590000, desc: 'Hỗ trợ công suất đỉnh 140W sạc được cả máy tính trạm và laptop công suất lớn' },
    { brand: 'Anker', name: 'Cáp sạc Anker PowerLine+ II Lightning 0.9m bọc dù MFi', price: 270000, compare: 350000, desc: 'Chứng nhận MFi của Apple, chịu kéo tải lên đến 80kg vô cùng bền bỉ' },
    { brand: 'Baseus', name: 'Cáp sạc nhanh Baseus Tungsten Gold Type-C to Type-C 100W 1m', price: 120000, compare: 180000, desc: 'Đầu cắm phủ hợp kim kẽm sáng bóng chống trầy xước, chip E-Marker nhận diện công suất' },
    { brand: 'Baseus', name: 'Cáp sạc Baseus Crystal Shine Type-C to Lightning 20W 1.2m', price: 110000, compare: 160000, desc: 'Dây bọc vải bện mật độ cao, đầu cắm trong suốt hiện đèn báo sạc sang trọng' },
    { brand: 'Baseus', name: 'Cáp sạc 3 trong 1 Baseus Bright Mirror 2 rút gọn 66W', price: 160000, compare: 230000, desc: 'Gồm 3 đầu Lightning, Type-C, Micro-USB, cơ chế kéo rút thu gọn chống rối gọn gàng' },
    { brand: 'Ugreen', name: 'Cáp sạc Ugreen bọc dù Type-C to Type-C 100W 1m', price: 130000, compare: 190000, desc: 'Lõi đồng nguyên chất dày dặn hỗ trợ sạc nhanh Quick Charge 4.0 và Power Delivery' },
    { brand: 'Ugreen', name: 'Cáp Thunderbolt 4 Ugreen 40Gbps hỗ trợ xuất 8K 100W 0.8m', price: 890000, compare: 1190000, desc: 'Băng thông siêu tốc 40Gbps, truyền phim 4K chỉ vài giây, xuất màn hình 8K@60Hz' },
    { brand: 'Ugreen', name: 'Cáp chuyển đổi HDMI sang HDMI 2.1 Ugreen 8K 2m', price: 250000, compare: 350000, desc: 'Băng thông 48Gbps, hỗ trợ Dynamic HDR và tần số quét 4K@120Hz chuyên game' },
    { brand: 'Apple', name: 'Cáp sạc Apple bọc dù Type-C to Type-C 60W 1m', price: 520000, compare: 590000, desc: 'Dây dệt màu trắng trang nhã chính hãng phân phối đi kèm trong hộp MacBook' },
    { brand: 'Apple', name: 'Cáp sạc Apple USB-C sang MagSafe 3 2m chính hãng', price: 1490000, compare: 1690000, desc: 'Cổng sạc nam châm hít MagSafe 3 chống vấp ngã giật đứt dây cho MacBook' },
    { brand: 'Apple', name: 'Cáp Apple Thunderbolt 4 Pro 1m màu đen bọc dù', price: 1890000, compare: 2090000, desc: 'Chuẩn kết nối cao cấp nhất của Apple hỗ trợ kết nối eGPU, màn hình Studio Display' },
    { brand: 'Belkin', name: 'Cáp sạc bọc dù Belkin BoostCharge Pro Flex C to C 100W 2m', price: 490000, compare: 650000, desc: 'Silicone bọc sợi dù kép bền gấp 30 lần cáp thông thường, kèm nút nam châm dán bàn' },
    { brand: 'Belkin', name: 'Cáp sạc Belkin Type-C sang Lightning chuẩn MFi 1m', price: 320000, compare: 420000, desc: 'Đảm bảo tương thích 100% với các đời iPhone, an toàn không báo phụ kiện không hỗ trợ' },
    { brand: 'Samsung', name: 'Cáp sạc Samsung Type-C to Type-C 5A 1.8m chính hãng', price: 190000, compare: 250000, desc: 'Chịu dòng điện lên đến 5A kích hoạt sạc siêu nhanh 45W cho flagship Samsung' },
    { brand: 'Xiaomi', name: 'Cáp sạc nhanh Xiaomi Type-C 6A 1m dây bện', price: 150000, compare: 220000, desc: 'Kích hoạt chuẩn sạc 67W và 120W HyperCharge cho điện thoại Xiaomi' },
    { brand: 'Razer', name: 'Cáp sạc gaming Razer Speedflex Type-C 1.8m', price: 490000, compare: 650000, desc: 'Dây vải mềm nhẹ không tạo lực cản khi cắm vừa sạc vừa di chuột chơi game' },
    { brand: 'Baseus', name: 'Cáp chuyển đổi âm thanh Type-C sang 3.5mm Baseus L54', price: 95000, compare: 140000, desc: 'Tích hợp chip DAC giải mã âm thanh chất lượng cao cho điện thoại bỏ jack 3.5' },
    { brand: 'Ugreen', name: 'Cáp nối dài USB 3.0 Ugreen 2m chống nhiễu', price: 110000, compare: 160000, desc: 'Đầu mạ vàng 24K, tốc độ 5Gbps kéo dài cổng kết nối từ sau case máy tính ra bàn' },
    { brand: 'Anker', name: 'Cáp sạc Anker 322 Type-C to Lightning bọc dù 1.8m', price: 290000, compare: 390000, desc: 'Độ dài 1.8m thoải mái cắm sạc trên giường ngủ hoặc ghế sofa' },
    { brand: 'Belkin', name: 'Cáp mạng LAN CAT6 Belkin 3m đầu đúc', price: 150000, compare: 210000, desc: 'Băng thông gigabit 1000Mbps, chống nhiễu suy hao tín hiệu khi chơi game online' }
  ],
  'power-banks': [
    { brand: 'Anker', name: 'Pin dự phòng Anker 737 PowerCore 24.000mAh 140W (A1289)', price: 2490000, compare: 2990000, desc: 'Màn hình màu thông minh thể hiện công suất sạc từng cổng, sạc nhanh 140W 2 chiều cho cả laptop' },
    { brand: 'Anker', name: 'Pin sạc dự phòng Anker MagGo 10.000mAh chuẩn Qi2 15W (A1654)', price: 1490000, compare: 1890000, desc: 'Chứng nhận sạc không dây Qi2 15W hít nam châm lưng máy, chân chống dựng xem video' },
    { brand: 'Anker', name: 'Pin sạc dự phòng Anker Nano 5.000mAh chân gập Type-C (A1653)', price: 590000, compare: 790000, desc: 'Cắm trực tiếp đuôi điện thoại không cần dây, kích thước siêu nhỏ như thỏi son' },
    { brand: 'Anker', name: 'Pin dự phòng Anker Prime 20.000mAh 200W (A1336)', price: 2190000, compare: 2690000, desc: 'Công suất đồng thời 200W, sạc đầy pin dự phòng chỉ trong 1 giờ 15 phút' },
    { brand: 'Baseus', name: 'Pin dự phòng Baseus Blade 100W 20.000mAh siêu mỏng', price: 1390000, compare: 1790000, desc: 'Độ dày chỉ 18mm như một quyển sổ tay, chuyên dùng sạc laptop trên các chuyến bay' },
    { brand: 'Baseus', name: 'Pin sạc dự phòng không dây từ tính Baseus Magnetic 10.000mAh 20W', price: 620000, compare: 850000, desc: 'Lực hút nam châm mạnh 3500Gs, sạc có dây 20W và không dây MagSafe 7.5W' },
    { brand: 'Baseus', name: 'Pin sạc dự phòng Baseus Adaman 20.000mAh 65W vỏ kim loại', price: 890000, compare: 1190000, desc: 'Vỏ kim loại sang trọng giọt nước hiển thị số % pin kỹ thuật số' },
    { brand: 'Xiaomi', name: 'Pin sạc dự phòng Xiaomi Power Bank 3 20.000mAh 50W', price: 790000, compare: 990000, desc: 'Sạc nhanh 50W cho điện thoại và laptop văn phòng, dung lượng chuẩn bay quốc tế' },
    { brand: 'Xiaomi', name: 'Pin sạc dự phòng tích hợp cáp Xiaomi 10.000mAh 22.5W', price: 390000, compare: 490000, desc: 'Có sẵn dây cáp Type-C gắn liền trên thân pin tiện dụng không sợ để quên dây ở nhà' },
    { brand: 'Xiaomi', name: 'Pin sạc dự phòng từ tính Xiaomi Magnetic Wireless 5.000mAh', price: 550000, compare: 690000, desc: 'Kích thước siêu mỏng ôm trọn thân iPhone, có đế dựng sạc để bàn thông minh' },
    { brand: 'Samsung', name: 'Pin sạc dự phòng Samsung 10.000mAh 25W EB-P3400', price: 590000, compare: 790000, desc: 'Chất liệu thân thiện môi trường tái chế UL, chuẩn sạc siêu nhanh 25W Super Fast Charging' },
    { brand: 'Samsung', name: 'Pin sạc dự phòng sạc không dây Samsung 10.000mAh 25W EB-U2510', price: 990000, compare: 1290000, desc: 'Sạc không dây cho cả đồng hồ Galaxy Watch và tai nghe Galaxy Buds tiện lợi' },
    { brand: 'Ugreen', name: 'Pin dự phòng Ugreen 145W 25.000mAh 3 cổng (PB205)', price: 1690000, compare: 2190000, desc: 'Sạc đầy 1.3 lần MacBook Air M2, hỗ trợ sạc nhanh chuẩn PD 3.0 và QC 3.0' },
    { brand: 'Ugreen', name: 'Pin sạc dự phòng không dây Ugreen 10.000mAh MagSafe kèm giá đỡ', price: 690000, compare: 890000, desc: 'Thiết kế bo cong công thái học, không làm cấn cụm camera lồi của điện thoại' },
    { brand: 'Belkin', name: 'Pin sạc dự phòng Belkin BoostCharge Magnetic 5.000mAh', price: 990000, compare: 1290000, desc: 'Bảo hành đổi mới 2 năm, tiêu chuẩn kiểm định an toàn cháy nổ cao cấp nhất' },
    { brand: 'Belkin', name: 'Pin dự phòng Belkin BoostCharge 20.000mAh 15W 3 cổng', price: 790000, compare: 990000, desc: 'Cung cấp năng lượng dự phòng cho 77 giờ sử dụng điện thoại thông minh' },
    { brand: 'Apple', name: 'Pin sạc dự phòng Apple MagSafe Battery Pack White', price: 2490000, compare: 2790000, desc: 'Hiển thị dung lượng trực tiếp trên widget màn hình khóa iOS, sạc ngược thông minh' },
    { brand: 'Anker', name: 'Pin dự phòng Anker 325 PowerCore 20.000mAh (A1286)', price: 690000, compare: 890000, desc: 'Pin dung lượng trâu thiết kế vân nhám chống bám dấu vân tay, 2 cổng sạc USB' },
    { brand: 'Baseus', name: 'Pin dự phòng mini Baseus Bipow 10.000mAh 20W LED', price: 320000, compare: 450000, desc: 'Màn hình LED báo pin sắc nét, bảo vệ 9 lớp mạch điện an toàn chống chập cháy' },
    { brand: 'Ugreen', name: 'Pin dự phòng mini Ugreen 10.000mAh 30W sạc nhanh hai chiều', price: 520000, compare: 690000, desc: 'Công suất 30W nạp pin siêu tốc cho cả iPad Air và iPhone 16' },
    { brand: 'Xiaomi', name: 'Pin sạc dự phòng Xiaomi Pocket Edition Pro 10.000mAh 33W', price: 590000, compare: 750000, desc: 'Lõi pin chuẩn xe điện độ bền cực cao, sạc nhanh cho máy tính bảng và điện thoại' }
  ],
  'hubs-adapters': [
    { brand: 'Ugreen', name: 'Hub chuyển đổi Ugreen Revodok Pro 109 9 trong 1 4K@60Hz 100W', price: 890000, compare: 1190000, desc: 'Gồm HDMI 4K@60Hz, 3 cổng USB 3.0, khe thẻ SD/TF, cổng mạng LAN RJ45 Gigabit và sạc PD 100W' },
    { brand: 'Ugreen', name: 'Hub Type-C Ugreen Revodok 107 7 trong 1 Dual 4K HDMI', price: 750000, compare: 990000, desc: 'Xuất 2 màn hình phụ cùng lúc tiện làm việc lập trình viên và kế toán tài chính' },
    { brand: 'Ugreen', name: 'Hub chia 4 cổng USB 3.0 Ugreen 1m kèm nguồn phụ', price: 250000, compare: 350000, desc: 'Mở rộng cắm chuột, bàn phím, USB cho case máy tính và laptop thiếu cổng' },
    { brand: 'Ugreen', name: 'Đầu đọc thẻ nhớ SD/TF chuẩn Type-C và USB 3.0 Ugreen', price: 210000, compare: 290000, desc: 'Đọc đồng thời 2 thẻ nhớ tốc độ cao 5Gbps cho nhiếp ảnh gia copy ảnh vào laptop' },
    { brand: 'Baseus', name: 'Hub chuyển đổi Baseus Metal Glam Series 8 trong 1 4K@60Hz', price: 790000, compare: 1050000, desc: 'Vỏ hợp kim nhôm tản nhiệt băng giá, cổng HDMI hỗ trợ chuẩn hình ảnh 4K sắc nét' },
    { brand: 'Baseus', name: 'Hub chuyển đổi Baseus StarJoy 6 trong 1 Type-C sang HDMI 4K', price: 490000, compare: 690000, desc: 'Thiết kế cong nhẹ thanh thoát, đáp ứng toàn diện nhu cầu trình chiếu văn phòng' },
    { brand: 'Baseus', name: 'Đầu chuyển OTG Type-C sang USB 3.0 Baseus Ingenuity kim loại', price: 75000, compare: 110000, desc: 'Kích thước siêu tí hon bằng đầu ngón tay cắm nối USB trực tiếp vào điện thoại, iPad' },
    { brand: 'Anker', name: 'Hub chuyển đổi Anker 555 USB-C Hub 8 in 1 (A8383)', price: 1490000, compare: 1890000, desc: 'Cổng truyền dữ liệu USB-C 10Gbps, HDMI 4K@60Hz, sạc pass-through 100W an toàn' },
    { brand: 'Anker', name: 'Hub chuyển đổi Anker 332 USB-C Hub 5 in 1 (A8355)', price: 690000, compare: 890000, desc: 'Giải pháp mở rộng giá tốt chất lượng chuẩn Anker với 1 cổng HDMI 4K và 3 cổng USB' },
    { brand: 'Anker', name: 'Đầu đọc thẻ nhớ 2 trong 1 Anker USB-C và USB-A', price: 320000, compare: 450000, desc: 'Tương thích cả 2 đầu chuẩn cắm cho điện thoại Type-C và PC truyền thống' },
    { brand: 'Apple', name: 'Đầu chuyển Apple USB-C sang USB Adapter chính hãng', price: 520000, compare: 590000, desc: 'Kết nối phụ kiện USB-A tiêu chuẩn vào máy tính MacBook và iPad dùng cổng Type-C' },
    { brand: 'Apple', name: 'Cáp chuyển Apple USB-C sang Cổng Giắc Cắm Tai Nghe 3.5 mm', price: 290000, compare: 350000, desc: 'Chất lượng truyền tải âm thanh trong trẻo không suy hao tín hiệu' },
    { brand: 'Apple', name: 'Bộ Tiếp Hợp Đa Cổng USB-C Digital AV của Apple chính hãng', price: 1790000, compare: 1990000, desc: 'Chính hãng Apple gồm 1 cổng HDMI, 1 cổng USB-A tiêu chuẩn và 1 cổng sạc Type-C' },
    { brand: 'Belkin', name: 'Hub chuyển đổi Belkin Connect USB-C 7 in 1 Multiport Adapter', price: 1290000, compare: 1690000, desc: 'Bảo hành 2 năm đổi mới, vật liệu cách điện chống đoản mạch an toàn tuyệt đối' },
    { brand: 'Belkin', name: 'Đầu chuyển Belkin USB-C sang mạng LAN Gigabit Ethernet', price: 690000, compare: 890000, desc: 'Cung cấp đường truyền internet cáp quang siêu ổn định khi wifi bị chập chờn' },
    { brand: 'Xiaomi', name: 'Hub chuyển đổi đa năng Xiaomi 5 trong 1 vỏ hợp kim', price: 490000, compare: 650000, desc: 'Có khe gài cất dây cáp gọn gàng bên hông, bảo vệ chân cắm chống cong gãy' },
    { brand: 'Kingston', name: 'Đầu đọc thẻ nhớ Kingston MobileLite Plus SD Reader', price: 290000, compare: 390000, desc: 'Hỗ trợ chuẩn thẻ tốc độ cực cao UHS-II đọc ghi tối đa công suất thẻ nhớ' },
    { brand: 'ASUS', name: 'Trạm chuyển đổi ASUS ROG Ally Gaming Charger Dock 65W', price: 1490000, compare: 1790000, desc: 'Kiêm củ sạc 65W vừa sạc vừa xuất hình ảnh HDMI ra màn hình TV 4K khi chơi game' },
    { brand: 'Baseus', name: 'Đầu chuyển Type-C sang DisplayPort 1.4 Baseus 8K@60Hz', price: 320000, compare: 450000, desc: 'Xuất hình ảnh từ laptop ra màn hình đồ họa chuyên nghiệp tần số quét 144Hz/165Hz' },
    { brand: 'Ugreen', name: 'Đầu thu phát Bluetooth 5.3 USB Ugreen kết nối 5 thiết bị', price: 160000, compare: 230000, desc: 'Cắm vào PC để kết nối cùng lúc tai nghe không dây, chuột, bàn phím và tay cầm game' },
    { brand: 'Anker', name: 'Trạm Docking Station Anker 575 USB-C 13 in 1 Triple Display', price: 3890000, compare: 4590000, desc: 'Mở rộng 13 cổng chuyên nghiệp, hỗ trợ xuất cùng lúc 3 màn hình rời độc lập' },
    { brand: 'Belkin', name: 'Đầu chuyển đổi Belkin Type-C sang VGA 1080p', price: 490000, compare: 650000, desc: 'Chuyên dụng kết nối máy tính xách tay với các máy chiếu đời cũ trong giảng đường' }
  ],
  'stands-mounts': [
    { brand: 'Ugreen', name: 'Giá đỡ laptop công thái học Ugreen nhôm gấp gọn nâng hạ 5 nấc', price: 390000, compare: 520000, desc: 'Hợp kim nhôm dày dặn đỡ laptop đến 17.3 inch, thông thoáng khe tản nhiệt đáy máy' },
    { brand: 'Ugreen', name: 'Giá đỡ điện thoại và máy tính bảng Ugreen để bàn xoay 360 độ', price: 250000, compare: 350000, desc: 'Khớp xoay kêu tách tách tiện lợi, đệm cao su silicon chống trầy viền thiết bị' },
    { brand: 'Ugreen', name: 'Giá đỡ kẹp điện thoại đầu giường Ugreen thân kim loại uốn dẻo', price: 290000, compare: 390000, desc: 'Kẹp chắc chắn cạnh giường hoặc mép bàn xem phim lướt web rảnh tay' },
    { brand: 'Baseus', name: 'Giá đỡ laptop tản nhiệt Baseus Ultra Thin dán đáy máy', price: 150000, compare: 220000, desc: 'Siêu mỏng chỉ 3mm dán liền mặt đáy laptop, gập mở góc nghiêng 12 độ chuẩn gõ phím' },
    { brand: 'Baseus', name: 'Giá đỡ điện thoại hít nam châm gắn taplo ô tô Baseus MagPro', price: 290000, compare: 390000, desc: 'Lực hút nam châm Neodymium cực mạnh chống rung lắc điện thoại khi xe đi qua ổ gà' },
    { brand: 'Baseus', name: 'Giá đỡ điện thoại kiêm sạc không dây Baseus xoay gập 360', price: 490000, compare: 650000, desc: 'Vừa làm chân đế xem phim vừa hỗ trợ sạc nhanh không dây tiện lợi' },
    { brand: 'Anker', name: 'Giá đỡ điện thoại từ tính kiêm vòng đeo ngón tay Anker 610 MagGo', price: 290000, compare: 390000, desc: 'Hít chắc lưng iPhone dùng làm nhẫn xỏ ngón chống rơi và làm chân chống xem ngang dọc' },
    { brand: 'Anker', name: 'Giá đỡ máy tính bảng và iPad Anker hợp kim nhôm nguyên khối', price: 350000, compare: 480000, desc: 'Độ ổn định cao chịu lực chạm vuốt Apple Pencil vẽ tranh không rung lắc' },
    { brand: 'Belkin', name: 'Giá đỡ điện thoại Belkin MagSafe gắn màn hình Mac dùng Continuity Camera', price: 690000, compare: 890000, desc: 'Biến iPhone thành webcam siêu nét gắn đỉnh màn hình máy Mac họp trực tuyến' },
    { brand: 'Belkin', name: 'Giá đỡ gắn lỗ thông gió ô tô Belkin BoostCharge Magnetic', price: 790000, compare: 990000, desc: 'Kẹp nan quạt gió xe hơi chắc chắn, xoay lật 360 độ điều hướng bản đồ Google Maps' },
    { brand: 'Xiaomi', name: 'Giá đỡ kẹp điện thoại trên ô tô Xiaomi kẹp tự động có cảm biến', price: 590000, compare: 790000, desc: 'Cảm biến hồng ngoại tự động mở kẹp khi đưa điện thoại lại gần và tự ôm khít' },
    { brand: 'Apple', name: 'Bao da kiêm giá đỡ Apple Smart Folio cho iPad Pro 11 inch', price: 1890000, compare: 2190000, desc: 'Gắn hít nam châm lưng iPad mỏng nhẹ gập lại làm giá đỡ xem phim và gõ phím' },
    { brand: 'Razer', name: 'Giá treo tai nghe gaming Razer Base Station V2 Chroma RGB', price: 1690000, compare: 1990000, desc: 'Tích hợp 2 cổng USB 3.1 và giắc DAC 3.5mm kèm hiệu ứng led gầm RGB đồng bộ phím chuột' },
    { brand: 'ASUS', name: 'Giá treo tai nghe kiêm sạc không dây ASUS ROG Throne Qi', price: 2890000, compare: 3390000, desc: 'Tích hợp sạc không dây chuẩn Qi dưới chân đế và chip âm thanh vòm 7.1 ESS DAC' },
    { brand: 'Logitech', name: 'Đế sạc kiêm giá đỡ không dây Logitech Powered Pad 10W', price: 690000, compare: 890000, desc: 'Góc nghiêng thông minh xem thông báo FaceID mở khóa máy tức thì không cần nhấc lên' },
    { brand: 'Ugreen', name: 'Giá đỡ laptop đặt đứng 2 khe Ugreen Vertical Laptop Stand', price: 320000, compare: 420000, desc: 'Kẹp dựng thẳng đứng 2 máy tính tiết kiệm 80% diện tích mặt bàn khi dùng màn hình ngoài' },
    { brand: 'Baseus', name: 'Kẹp giữ dây cáp sạc chống rối trên bàn Baseus Peas Cable Clip', price: 65000, compare: 99000, desc: '3 nút kẹp gắn nam châm hít chặt đế giữ đầu dây cáp luôn ngay ngắn không rơi xuống đất' },
    { brand: 'Ugreen', name: 'Tay đỡ màn hình máy tính Human Motion T6 Pro đơn 17-32 inch', price: 690000, compare: 890000, desc: 'Trợ lực lò xo khí nén nâng hạ màn hình 9kg linh hoạt, xoay dọc màn hình đọc tài liệu' },
    { brand: 'Anker', name: 'Giá đỡ điện thoại kèm sạc xe hơi Anker PowerWave Car Mount 10W', price: 790000, compare: 990000, desc: 'Vừa dẫn đường bản đồ vừa nạp pin liên tục cho các tài xế công nghệ và phượt thủ' },
    { brand: 'Baseus', name: 'Giá đỡ ipad và máy tính bảng gập gọn Baseus Bipow Tablet Holder', price: 220000, compare: 320000, desc: 'Thiết kế gập đôi bỏ balo gọn nhẹ, đế có chân cao su bám chặt mặt bàn' },
    { brand: 'Kingston', name: 'Đế đỡ tai nghe gaming HyperX Headset Stand nhôm nguyên khối', price: 590000, compare: 790000, desc: 'Trọng lượng đầm chắc giữ tai nghe luôn form dáng bảo quản đệm mút tốt nhất' },
    { brand: 'Belkin', name: 'Giá đỡ tự động xoay theo khuôn mặt Belkin Auto-Tracking Stand Pro', price: 3890000, compare: 4490000, desc: 'Tự động bám theo cử động người nói 360 độ qua công nghệ DockKit chính thức của Apple' }
  ],
  'phone-cases': [
    { brand: 'Apple', name: 'Ốp lưng iPhone 16 Pro Max Silicone Case kèm MagSafe Desert Titanium', price: 1390000, compare: 1590000, desc: 'Bề mặt phủ mịn chống bám bẩn, tích hợp nút Camera Control nhạy bén chuẩn hãng' },
    { brand: 'Apple', name: 'Ốp lưng iPhone 16 Pro Clear Case kèm MagSafe trong suốt', price: 1390000, compare: 1590000, desc: 'Lớp phủ chống ố vàng cao cấp khoe trọn màu sắc khung titan sang trọng' },
    { brand: 'Apple', name: 'Ví da gắn mặt lưng Apple iPhone FineWoven Wallet with MagSafe', price: 1490000, compare: 1690000, desc: 'Đựng được 3 thẻ ngân hàng hỗ trợ mạng lưới Tìm kiếm Find My định vị nếu bị rơi' },
    { brand: 'Samsung', name: 'Ốp lưng Galaxy S24 Ultra Standing Grip Case chính hãng', price: 890000, compare: 1090000, desc: 'Dây đeo cầm tay chắc chắn phía sau kiêm chân dựng điện thoại trên bàn' },
    { brand: 'Samsung', name: 'Ốp lưng Galaxy Z Fold6 Kindsuit Case da cao cấp', price: 1690000, compare: 1990000, desc: 'Chất liệu da nhân tạo thuần chay siêu êm ái bảo vệ mặt lưng và bản lề gập' },
    { brand: 'Samsung', name: 'Ốp lưng Galaxy Z Flip6 Flipsuit Case kèm thẻ tương tác LED', price: 990000, compare: 1190000, desc: 'Tự động đồng bộ hình nền màn hình ngoài theo màu sắc thẻ ốp lưng' },
    { brand: 'Baseus', name: 'Ốp lưng iPhone 16 Pro Max Baseus Simple trong suốt chống sốc', price: 120000, compare: 180000, desc: 'Đệm khí 4 góc chống sốc bảo vệ rơi rớt 1.5m, viền camera nhô cao chống trầy ống kính' },
    { brand: 'Baseus', name: 'Ốp lưng từ tính Baseus MagPro hỗ trợ MagSafe cho iPhone 15 Pro', price: 220000, compare: 320000, desc: 'Vòng nam châm lực hút chuẩn 13N hít chặt pin sạc dự phòng không lo tuột rơi' },
    { brand: 'Ugreen', name: 'Ốp lưng chống ố vàng Ugreen TPU Clear cho iPhone 16', price: 130000, compare: 190000, desc: 'Chất liệu Bayer Đức chống oxy hóa giữ độ trong suốt pha lê bền lâu' },
    { brand: 'Ugreen', name: 'Ốp lưng nam châm viền đen Ugreen MagSafe Case', price: 250000, compare: 350000, desc: 'Mặt lưng nhám mờ mờ chống bám vân tay và mồ hôi tay cực sạch sẽ' },
    { brand: 'Anker', name: 'Ốp lưng bảo vệ Anker Magnetic Case kèm vòng xoay chân đế 360', price: 450000, compare: 590000, desc: 'Vòng MagSafe kiêm chân đế kim loại xoay linh hoạt mọi góc độ xem video' },
    { brand: 'Belkin', name: 'Ốp lưng kháng khuẩn Belkin SheerForce MagSafe cho iPhone 15', price: 690000, compare: 890000, desc: 'Phủ lớp kháng khuẩn giảm 99% vi khuẩn sinh sôi trên bề mặt ốp' },
    { brand: 'Xiaomi', name: 'Ốp lưng da nhân tạo Xiaomi 14 Ultra kèm bộ phụ kiện chụp ảnh', price: 1990000, compare: 2490000, desc: 'Biến điện thoại thành máy ảnh cơ với báng tay cầm pin phụ và nút chụp hai nấc' },
    { brand: 'Razer', name: 'Ốp lưng tản nhiệt Razer Arctech Pro cho iPhone 15 Pro Max', price: 990000, compare: 1290000, desc: 'Lớp lót dẫn nhiệt Thermaprene độc quyền thoát nhiệt giúp máy luôn mát khi leo rank' },
    { brand: 'Baseus', name: 'Bao da gập kèm ngăn đựng thẻ Baseus Vintage Leather Case', price: 250000, compare: 350000, desc: 'Bảo vệ toàn diện 360 độ cả màn hình lẫn mặt lưng, phong cách lịch lãm' },
    { brand: 'Ugreen', name: 'Túi chống nước điện thoại Ugreen IPX8 đi bơi biển', price: 95000, compare: 140000, desc: 'Chống nước sâu 30m, cảm ứng mượt mà qua lớp nhựa dẻo chụp ảnh dưới đáy biển' },
    { brand: 'Apple', name: 'Bao da chống sốc kiêm bàn phím Apple Magic Keyboard iPad Pro 13 M4', price: 8990000, compare: 9990000, desc: 'Khung nhôm sang chảnh, bàn di chuột xúc giác cực êm, hàng phím chức năng đầy đủ' },
    { brand: 'Baseus', name: 'Túi chống sốc laptop 14 inch Baseus Basics có quai xách', price: 290000, compare: 390000, desc: 'Lớp nhung mềm chống trầy xước bên trong và vải kháng nước bên ngoài' },
    { brand: 'Anker', name: 'Túi bảo vệ phụ kiện công nghệ Anker Tech Pouch chống thấm', price: 290000, compare: 390000, desc: 'Nhiều ngăn nhỏ phân loại củ sạc, dây cáp, chuột và tai nghe gọn gàng khi du lịch' },
    { brand: 'Samsung', name: 'Bao da kèm bút S-Pen Galaxy Z Fold6 S-Pen Case', price: 1790000, compare: 2090000, desc: 'Gắn gọn cây bút S-Pen mỏng nhẹ sau lưng lấy ra ghi chú nhanh bất cứ lúc nào' },
    { brand: 'Belkin', name: 'Ốp lưng bảo vệ tai nghe AirPods Pro 2 Belkin bọc silicon kèm móc', price: 290000, compare: 390000, desc: 'Móc khóa kim loại treo vào đỉa quần hoặc balo tránh rơi mất hộp sạc AirPods' }
  ],
  'screen-protectors': [
    { brand: 'Belkin', name: 'Kính cường lực Belkin UltraGlass 2 cho iPhone 16 Pro Max', price: 590000, compare: 790000, desc: 'Độ cứng cao hơn kính cường lực thường 2.7 lần, viền mỏng như không dán' },
    { brand: 'Belkin', name: 'Kính cường lực chống nhìn trộm Belkin ScreenForce Privacy iPhone 16', price: 690000, compare: 890000, desc: 'Bảo vệ bí mật màn hình góc nghiêng trên 30 độ ở nơi công cộng đông người' },
    { brand: 'Belkin', name: 'Miếng dán cường lực chống lóa Belkin TruePrivacy cho MacBook 14', price: 990000, compare: 1290000, desc: 'Dán hít từ tính có thể tháo rời cọ rửa tái sử dụng nhiều lần chống chói mắt' },
    { brand: 'Baseus', name: 'Kính cường lực Baseus 0.3mm Crystal HD cho iPhone 16 Pro', price: 120000, compare: 180000, desc: 'Độ trong suốt 99.9% giữ nguyên độ sắc nét màn hình Super Retina XDR' },
    { brand: 'Baseus', name: 'Hộp dán kính cường lực tự động Baseus Auto-Alignment chống bụi', price: 180000, compare: 260000, desc: 'Kèm khuôn canh chỉnh tự động gạt sạch bong bóng khí và bụi chỉ với 1 thao tác kéo' },
    { brand: 'Baseus', name: 'Kính cường lực nhám mờ Baseus Frosted chống mồ hôi tay cho Game thủ', price: 150000, compare: 220000, desc: 'Bề mặt phủ vi hạt mịn vuốt cực trơn tay không để lại dấu vân tay khi combat game' },
    { brand: 'Ugreen', name: 'Kính cường lực Ugreen 9H Full viền cho iPhone 15 Pro Max', price: 110000, compare: 160000, desc: 'Bo cạnh 2.5D vuốt từ mép không bị cấn tay, độ cứng tiêu chuẩn 9H chống chìa khóa cọ quẹt' },
    { brand: 'Ugreen', name: 'Kính cường lực bảo vệ cụm Camera Ugreen (Bộ 3 mắt kính rời)', price: 90000, compare: 130000, desc: 'Vòng viền titan ôm trọn từng ống kính, giữ nguyên chất lượng ảnh chụp đêm không lóe sáng' },
    { brand: 'Ugreen', name: 'Miếng dán màn hình Paper-like Ugreen cho iPad Pro 11 inch vẽ viết', price: 190000, compare: 270000, desc: 'Tạo cảm giác nhám nhẹ như viết bút chì trên giấy thật, chống mỏi mắt cho học sinh ghi chú' },
    { brand: 'Anker', name: 'Kính cường lực Anker GlassGuard iPhone 15 độ cứng 9H', price: 250000, compare: 350000, desc: 'Kính gia nhiệt cường lực 2 lần tăng khả năng hấp thụ lực va đập khi rơi úp màn hình' },
    { brand: 'Samsung', name: 'Miếng dán màn hình chống phản chiếu chính hãng Samsung Galaxy S24 Ultra', price: 490000, compare: 650000, desc: 'Chính hãng Samsung giữ nguyên công nghệ chống chói Corning Gorilla Armor độc quyền' },
    { brand: 'Samsung', name: 'Miếng dán bảo vệ màn hình ngoài Galaxy Z Fold6 Anti-Reflecting', price: 390000, compare: 490000, desc: 'Gồm 2 miếng dán trong hộp kèm dụng cụ gạt dán chuẩn xác tại nhà' },
    { brand: 'Apple', name: 'Miếng dán bảo vệ màn hình Apple Watch Ultra 49mm Sapphire', price: 390000, compare: 520000, desc: 'Viền titan bảo vệ chống va chạm cộc tay vào tường khi leo núi thể thao' },
    { brand: 'Xiaomi', name: 'Kính cường lực Xiaomi 14 Pro cong 3D theo màn hình', price: 160000, compare: 240000, desc: 'Keo quang học UV tràn viền bám dính chắc chắn không bị hở viền bọt khí' },
    { brand: 'Baseus', name: 'Kính cường lực chống ánh sáng xanh Baseus Blue Light Filter', price: 150000, compare: 220000, desc: 'Lọc 90% tia sáng xanh có hại giúp chống mỏi mắt nhức mắt khi lướt điện thoại ban đêm' },
    { brand: 'Ugreen', name: 'Kính cường lực iPad 10.2 / iPad Air 11 inch Ugreen Full HD', price: 190000, compare: 280000, desc: 'Bảo vệ màn hình máy tính bảng kích thước lớn chống nứt vỡ khi trẻ nhỏ làm rơi' },
    { brand: 'Belkin', name: 'Kính cường lực Apple Watch Series 9 45mm cong 3D viền đen', price: 390000, compare: 520000, desc: 'Bao phủ sát mép viền đồng hồ, chống trầy xước các sinh hoạt va quẹt hàng ngày' },
    { brand: 'Baseus', name: 'Miếng dán PPF mặt lưng và viền điện thoại Baseus siêu dẻo tự phục hồi', price: 99000, compare: 150000, desc: 'Tự động lành các vết xước nhỏ sau 24h, giữ máy luôn mới nguyên bản' },
    { brand: 'Anker', name: 'Kính cường lực bảo vệ camera Anker Lens Protector iPhone 16', price: 190000, compare: 280000, desc: 'Khung định hình dán 1 lần ăn ngay bảo vệ kính camera chống trầy xước' },
    { brand: 'Ugreen', name: 'Miếng dán bảo vệ màn hình máy chơi game cầm tay Steam Deck / ROG Ally', price: 150000, compare: 220000, desc: 'Kính cường lực 9H chống chói giữ hình ảnh game luôn tươi sáng và sắc sài' },
    { brand: 'SanDisk', name: 'Bộ dung dịch và khăn lau màn hình chuyên dụng kháng khuẩn', price: 85000, compare: 120000, desc: 'Khăn dệt sợi microfiber mềm mịn kết hợp xịt vệ sinh sạch bóng màn hình không vệt mờ' },
    { brand: 'Belkin', name: 'Kính cường lực iPhone 16 Plus Belkin ScreenForce kèm khay dán', price: 490000, compare: 650000, desc: 'Thiết kế chuẩn xác từng micromet khay Easy Align ai cũng có thể tự dán tại nhà' }
  ]
};

let sql = '-- =====================================================================\n';
sql += '-- SCRIPT SEED TOÀN DIỆN: ĐỦ 30 SẢN PHẨM CHO TỪNG DANH MỤC TRÊN WEBSITE\n';
sql += '-- Dành cho PostgreSQL / Supabase SQL Editor\n';
sql += '-- =====================================================================\n\n';

let totalProducts = 0;

for (const [catSlug, items] of Object.entries(catalogSeeds)) {
  const cat = catMap[catSlug];
  if (!cat) continue;
  
  sql += `-- ---------------------------------------------------------------------\n`;
  sql += `-- DANH MỤC: ${cat.name.toUpperCase()} (${catSlug}) - Bổ sung ${items.length} sản phẩm -> Đủ 30 sản phẩm\n`;
  sql += `-- ---------------------------------------------------------------------\n\n`;

  for (let i = 0; i < items.length; i++) {
    const item = items[i];
    const brandId = brandMap[item.brand] || brandMap['ASUS'];
    const pSlug = catSlug + '-' + item.name.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '') + '-' + (1000 + totalProducts);
    const sku = 'CG-' + catSlug.toUpperCase().replace(/[^A-Z]/g, '').slice(0, 4) + '-' + (1000 + totalProducts);
    const pNameEscaped = item.name.replace(/'/g, "''");
    const pDescEscaped = (item.desc || item.name).replace(/'/g, "''");
    const brandEscaped = item.brand.replace(/'/g, "''");

    sql += `DO $$\n`;
    sql += `DECLARE\n`;
    sql += `  new_pid uuid := gen_random_uuid();\n`;
    sql += `BEGIN\n`;
    sql += `  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)\n`;
    sql += `  VALUES (\n`;
    sql += `    new_pid,\n`;
    sql += `    '${cat.id}',\n`;
    sql += `    '${brandId}',\n`;
    sql += `    '${pNameEscaped}',\n`;
    sql += `    '${pSlug}',\n`;
    sql += `    '${pDescEscaped}',\n`;
    sql += `    '${pNameEscaped} chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',\n`;
    sql += `    true,\n`;
    sql += `    ${i < 3 ? 'true' : 'false'},\n`;
    sql += `    now(),\n`;
    sql += `    now()\n`;
    sql += `  );\n\n`;

    sql += `  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)\n`;
    sql += `  VALUES (\n`;
    sql += `    gen_random_uuid(),\n`;
    sql += `    new_pid,\n`;
    sql += `    'Tiêu chuẩn',\n`;
    sql += `    '${sku}',\n`;
    sql += `    ${item.price},\n`;
    sql += `    ${item.compare},\n`;
    sql += `    true,\n`;
    sql += `    now()\n`;
    sql += `  );\n\n`;

    sql += `  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)\n`;
    sql += `  VALUES\n`;
    sql += `    (gen_random_uuid(), new_pid, 'Thương hiệu', '${brandEscaped}', 1),\n`;
    sql += `    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),\n`;
    sql += `    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);\n\n`;

    sql += `  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)\n`;
    sql += `  VALUES (\n`;
    sql += `    gen_random_uuid(),\n`;
    sql += `    new_pid,\n`;
    sql += `    'https://placehold.co/800x800?text=' || replace('${encodeURIComponent(item.name)}', '%20', '+'),\n`;
    sql += `    '${pNameEscaped}',\n`;
    sql += `    1,\n`;
    sql += `    true\n`;
    sql += `  );\n`;

    sql += `END $$;\n\n`;
    totalProducts++;
  }
}

fs.writeFileSync('./seed_30_per_category.sql', sql, 'utf-8');
console.log('Successfully generated seed_30_per_category.sql!');
console.log('Total products in SQL:', totalProducts);
