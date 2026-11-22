-- ==============================================================================
-- SUPABASE / POSTGRESQL SEED DATA: 32 LAPTOPS (GAMING & VĂN PHÒNG)
-- Chuẩn hóa 100% khớp với cấu trúc Database tables:
-- - public.brands
-- - public.categories (Root: Laptop -> Con: Laptop Gaming, Laptop Văn Phòng)
-- - public.products
-- - public.product_variants (Lưu giá price, compare_at_price, sku)
-- - public.product_specifications (Lưu thông số kỹ thuật chi tiết)
-- ==============================================================================

DO $$
DECLARE
  cat_laptop_id UUID;
  cat_gaming_id UUID;
  cat_office_id UUID;
  b_asus_id UUID;
  b_acer_id UUID;
  b_lenovo_id UUID;
  b_alienware_id UUID;
  b_dell_id UUID;
  b_hp_id UUID;
  b_lg_id UUID;
  curr_prod_id UUID;
BEGIN

  -- 1. SEED / UPDATE THƯƠNG HIỆU (BRANDS)
  INSERT INTO public.brands (brand_name, description, is_active)
  VALUES 
    ('ASUS', 'ASUS Global - In Search of Incredible', true),
    ('ACER', 'Acer Inc. - Explore Beyond Limits', true),
    ('LENOVO', 'Lenovo - Smarter Technology for All', true),
    ('ALIENWARE', 'Alienware - High-performance PC Gaming', true),
    ('DELL', 'Dell Technologies', true),
    ('HP', 'HP Inc.', true),
    ('LG', 'LG Electronics - Life''s Good', true)
  ON CONFLICT (brand_name) DO UPDATE SET is_active = true;

  SELECT brand_id INTO b_asus_id FROM public.brands WHERE brand_name = 'ASUS';
  SELECT brand_id INTO b_acer_id FROM public.brands WHERE brand_name = 'ACER';
  SELECT brand_id INTO b_lenovo_id FROM public.brands WHERE brand_name = 'LENOVO';
  SELECT brand_id INTO b_alienware_id FROM public.brands WHERE brand_name = 'ALIENWARE';
  SELECT brand_id INTO b_dell_id FROM public.brands WHERE brand_name = 'DELL';
  SELECT brand_id INTO b_hp_id FROM public.brands WHERE brand_name = 'HP';
  SELECT brand_id INTO b_lg_id FROM public.brands WHERE brand_name = 'LG';

  -- 2. SEED / UPDATE DANH MỤC (CATEGORIES)
  INSERT INTO public.categories (category_name, slug, description, is_active, display_order)
  VALUES ('Laptop', 'laptop', 'Máy tính xách tay chính hãng', true, 1)
  ON CONFLICT (slug) DO UPDATE SET category_name = EXCLUDED.category_name
  RETURNING category_id INTO cat_laptop_id;
  
  IF cat_laptop_id IS NULL THEN
    SELECT category_id INTO cat_laptop_id FROM public.categories WHERE slug = 'laptop';
  END IF;

  INSERT INTO public.categories (parent_category_id, category_name, slug, description, is_active, display_order)
  VALUES (cat_laptop_id, 'Laptop Gaming', 'laptop-gaming', 'Laptop gaming hiệu năng cao đồ họa đỉnh', true, 1)
  ON CONFLICT (slug) DO UPDATE SET parent_category_id = cat_laptop_id
  RETURNING category_id INTO cat_gaming_id;

  IF cat_gaming_id IS NULL THEN
    SELECT category_id INTO cat_gaming_id FROM public.categories WHERE slug = 'laptop-gaming';
  END IF;

  INSERT INTO public.categories (parent_category_id, category_name, slug, description, is_active, display_order)
  VALUES (cat_laptop_id, 'Laptop Văn Phòng', 'laptop-van-phong', 'Laptop văn phòng mỏng nhẹ sang trọng học tập làm việc', true, 2)
  ON CONFLICT (slug) DO UPDATE SET parent_category_id = cat_laptop_id
  RETURNING category_id INTO cat_office_id;

  IF cat_office_id IS NULL THEN
    SELECT category_id INTO cat_office_id FROM public.categories WHERE slug = 'laptop-van-phong';
  END IF;

  -- ==========================================
  -- 3. GAMING LAPTOPS (12 SẢN PHẨM)
  -- ==========================================

  -- Gaming Product 1: ASUS ROG Strix G16 (2025) G615JMR-S5155W
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_asus_id, cat_gaming_id, 'ASUS ROG Strix G16 (2025) G615JMR-S5155W', 'asus-rog-strix-g16-2025-g615jmr-s5155w', 'Core i7-14650HX / RTX 5060 / 32 GB / 1 TB SSD / 16 inch 2.5K', 'Sản phẩm Laptop Gaming chính hãng hiệu năng vượt trội.', true, true)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'asus-rog-strix-g16-2025-g615jmr-s5155w';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'GM-001-ASUSROGSTRIX', 'Tiêu chuẩn', 44990000, 49990000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core i7-14650HX', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'RTX 5060', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '32 GB', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '1 TB SSD', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '16 inch 2.5K', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'ASUS', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'ASUS ROG Strix G16 (2025) G615JMR-S5155W', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Gaming', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng CPU', 'Intel', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng SSD', '1 TB SSD', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng GPU', 'NVIDIA', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa', 'RTX 5060', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng VRAM', '8 GB', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Loại VRAM', 'GDDR7', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước màn hình', '16 inch', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Thông tin màn hình', '16 inch 2.5K', 16);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Độ phân giải', '2560 × 1600', 17);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Tấm nền', 'IPS', 18);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Tần số quét', '240 Hz', 19);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Độ phủ màu', '100% DCI-P3', 20);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hệ điều hành', 'Windows 11 Home Single Language', 21);

  -- Gaming Product 2: ASUS ROG Zephyrus G14 (2025) GA403WM-QS051WS
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_asus_id, cat_gaming_id, 'ASUS ROG Zephyrus G14 (2025) GA403WM-QS051WS', 'asus-rog-zephyrus-g14-2025-ga403wm-qs051ws', 'Ryzen AI 9 HX 370 / RTX 5060 / 32 GB / 1 TB SSD / 14 inch OLED 3K', 'Sản phẩm Laptop Gaming chính hãng hiệu năng vượt trội.', true, true)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'asus-rog-zephyrus-g14-2025-ga403wm-qs051ws';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'GM-002-ASUSROGZEPHYR', 'Tiêu chuẩn', 50990000, 55990000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Ryzen AI 9 HX 370', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'RTX 5060', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '32 GB', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '1 TB SSD', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '14 inch OLED 3K', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'ASUS', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'ASUS ROG Zephyrus G14 (2025) GA403WM-QS051WS', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Gaming', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng CPU', 'AMD', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng SSD', '1 TB SSD', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Loại RAM', 'LPDDR5X 7500', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Giao thức SSD', 'PCIe 4.0 NVMe', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Khe M.2', '1', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng GPU', 'NVIDIA', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa', 'RTX 5060', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng VRAM', '8 GB', 16);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Loại VRAM', 'GDDR7', 17);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước màn hình', '14 inch', 18);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Thông tin màn hình', '14 inch OLED 3K', 19);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Độ phân giải', '2880 × 1800', 20);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Tấm nền', 'OLED', 21);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Tần số quét', '120 Hz', 22);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Wi-Fi', 'Wi-Fi 7', 23);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Bluetooth', '5.4', 24);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Cổng HDMI', 'HDMI 2.1', 25);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Cổng USB-C', 'USB 3.2 Gen 2 và USB4', 26);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hệ điều hành', 'Windows 11 Home Single Language', 27);

  -- Gaming Product 3: ASUS ROG Zephyrus G16 (2025) GU605CP-QR115W
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_asus_id, cat_gaming_id, 'ASUS ROG Zephyrus G16 (2025) GU605CP-QR115W', 'asus-rog-zephyrus-g16-2025-gu605cp-qr115w', 'Core Ultra 7 255H / RTX 5070 / 16 GB / 512 GB SSD / 16 inch OLED 2.5K', 'Sản phẩm Laptop Gaming chính hãng hiệu năng vượt trội.', true, true)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'asus-rog-zephyrus-g16-2025-gu605cp-qr115w';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'GM-003-ASUSROGZEPHYR', 'Tiêu chuẩn', 67990000, 74990000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core Ultra 7 255H', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'RTX 5070', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '16 GB', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '512 GB SSD', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '16 inch OLED 2.5K', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'ASUS', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'ASUS ROG Zephyrus G16 (2025) GU605CP-QR115W', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Gaming', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng CPU', 'Intel', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng SSD', '512 GB SSD', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng GPU', 'NVIDIA', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa', 'RTX 5070', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng VRAM', '8 GB', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Loại VRAM', 'GDDR7', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước màn hình', '16 inch', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Thông tin màn hình', '16 inch OLED 2.5K', 16);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Độ phân giải', '2560 × 1600', 17);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Tấm nền', 'OLED', 18);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Tần số quét', '240 Hz', 19);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Độ phủ màu', '100% DCI-P3', 20);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hệ điều hành', 'Windows 11 Home Single Language', 21);

  -- Gaming Product 4: ASUS TUF Gaming A16 (2025) FA608UM-RV266W
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_asus_id, cat_gaming_id, 'ASUS TUF Gaming A16 (2025) FA608UM-RV266W', 'asus-tuf-gaming-a16-2025-fa608um-rv266w', 'Ryzen 7 260 / RTX 5060 / 16 GB / 512 GB SSD / 16 inch FHD+', 'Sản phẩm Laptop Gaming chính hãng hiệu năng vượt trội.', true, true)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'asus-tuf-gaming-a16-2025-fa608um-rv266w';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'GM-004-ASUSTUFGAMING', 'Tiêu chuẩn', 36990000, 40990000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Ryzen 7 260', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'RTX 5060', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '16 GB', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '512 GB SSD', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '16 inch FHD+', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'ASUS', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'ASUS TUF Gaming A16 (2025) FA608UM-RV266W', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Gaming', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng CPU', 'AMD', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Cấu hình CPU', '8 nhân, 16 luồng; xung tối đa 5.1 GHz', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng SSD', '512 GB SSD', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Loại RAM', 'DDR5-5600 SO-DIMM', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'RAM tối đa', '64 GB', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Khe RAM', '2 SO-DIMM', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Giao thức SSD', 'PCIe 4.0 NVMe', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Khe M.2', '2', 16);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng GPU', 'NVIDIA', 17);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa', 'RTX 5060', 18);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng VRAM', '8 GB', 19);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Loại VRAM', 'GDDR7', 20);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước màn hình', '16 inch', 21);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Thông tin màn hình', '16 inch FHD+', 22);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Độ phân giải', '1920 × 1200', 23);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Tấm nền', 'IPS', 24);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Tần số quét', '144 Hz', 25);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Độ phủ màu', '100% sRGB', 26);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hệ điều hành', 'Windows 11 Home', 27);

  -- Gaming Product 5: Acer Predator Helios Neo 16S AI PHN16S-I51-98CX
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_acer_id, cat_gaming_id, 'Acer Predator Helios Neo 16S AI PHN16S-I51-98CX', 'acer-predator-helios-neo-16s-ai-phn16s-i51-98cx', 'Core Ultra 9 386H / RTX 5060 / 32 GB / 512 GB SSD / 16 inch OLED 2.5K', 'Sản phẩm Laptop Gaming chính hãng hiệu năng vượt trội.', true, true)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'acer-predator-helios-neo-16s-ai-phn16s-i51-98cx';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'GM-005-ACERPREDATORH', 'Tiêu chuẩn', 71990000, 79990000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core Ultra 9 386H', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'RTX 5060', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '32 GB', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '512 GB SSD', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '16 inch OLED 2.5K', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'ACER', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'Acer Predator Helios Neo 16S AI PHN16S-I51-98CX', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Gaming', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng CPU', 'Intel', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng SSD', '512 GB SSD', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng GPU', 'NVIDIA', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa', 'RTX 5060', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng VRAM', '8 GB', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước màn hình', '16 inch', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Thông tin màn hình', '16 inch OLED 2.5K', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Độ phân giải', '2560 × 1600', 16);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Tấm nền', 'OLED', 17);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Tần số quét', '165 Hz', 18);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Độ phủ màu', '100% DCI-P3', 19);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hệ điều hành', 'Windows 11 Home Single Language', 20);

  -- Gaming Product 6: Acer Nitro V 16 AI ANV16-42-R309
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_acer_id, cat_gaming_id, 'Acer Nitro V 16 AI ANV16-42-R309', 'acer-nitro-v-16-ai-anv16-42-r309', 'Ryzen AI 5 240 / RTX 5050 / 16 GB / 512 GB SSD / 16 inch FHD+', 'Sản phẩm Laptop Gaming chính hãng hiệu năng vượt trội.', true, true)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'acer-nitro-v-16-ai-anv16-42-r309';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'GM-006-ACERNITROV16', 'Tiêu chuẩn', 27900000, 31200000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Ryzen AI 5 240', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'RTX 5050', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '16 GB', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '512 GB SSD', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '16 inch FHD+', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'ACER', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'Acer Nitro V 16 AI ANV16-42-R309', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Gaming', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng CPU', 'AMD', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng SSD', '512 GB SSD', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng GPU', 'NVIDIA', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa', 'RTX 5050', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước màn hình', '16 inch', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Thông tin màn hình', '16 inch FHD+', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Độ phân giải', '1920 × 1200', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Tấm nền', 'IPS', 16);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Tần số quét', '180 Hz', 17);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình cảm ứng', 'Không', 18);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Loại RAM', 'DDR5', 19);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'RAM tối đa', '32 GB', 20);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Giao thức SSD', 'PCIe NVMe 4.0', 21);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Form factor SSD', 'M.2', 22);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Wi-Fi', 'Wi-Fi 6 (802.11ax)', 23);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Bluetooth', '5.3 trở lên', 24);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Cổng HDMI', 'Có', 25);

  -- Gaming Product 7: Acer Nitro V 16S AI ANV16S-61-R7KQ
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_acer_id, cat_gaming_id, 'Acer Nitro V 16S AI ANV16S-61-R7KQ', 'acer-nitro-v-16s-ai-anv16s-61-r7kq', 'Ryzen AI 5 340 / RTX 5060 / 16 GB / 1 TB SSD / 16 inch FHD+', 'Sản phẩm Laptop Gaming chính hãng hiệu năng vượt trội.', true, true)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'acer-nitro-v-16s-ai-anv16s-61-r7kq';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'GM-007-ACERNITROV16', 'Tiêu chuẩn', 39999000, 43999000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Ryzen AI 5 340', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'RTX 5060', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '16 GB', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '1 TB SSD', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '16 inch FHD+', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'ACER', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'Acer Nitro V 16S AI ANV16S-61-R7KQ', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Gaming', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng CPU', 'AMD', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng SSD', '1 TB SSD', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Loại RAM', 'DDR5', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng GPU', 'NVIDIA', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa', 'RTX 5060', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng VRAM', '8 GB', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước màn hình', '16 inch', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Thông tin màn hình', '16 inch FHD+', 16);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Độ phân giải', '1920 × 1200', 17);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Tấm nền', 'IPS', 18);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Tần số quét', '180 Hz', 19);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Độ phủ màu', '100% sRGB', 20);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Độ sáng', '400 nit', 21);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hệ điều hành', 'Windows 11 Home', 22);

  -- Gaming Product 8: Lenovo Legion Pro 7i Gen 10
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_lenovo_id, cat_gaming_id, 'Lenovo Legion Pro 7i Gen 10', 'lenovo-legion-pro-7i-gen-10', 'Core Ultra 9 275HX / RTX 5080 / 32 GB / 1 TB SSD / 16 inch OLED 2.5K', 'Sản phẩm Laptop Gaming chính hãng hiệu năng vượt trội.', true, true)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'lenovo-legion-pro-7i-gen-10';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'GM-008-LENOVOLEGIONP', 'Tiêu chuẩn', 75900000, 83900000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core Ultra 9 275HX', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'RTX 5080', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '32 GB', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '1 TB SSD', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '16 inch OLED 2.5K', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'LENOVO', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'Lenovo Legion Pro 7i Gen 10', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Gaming', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng CPU', 'Intel', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng SSD', '1 TB SSD', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng GPU', 'NVIDIA', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa', 'RTX 5080', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng VRAM', '16 GB', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Loại VRAM', 'GDDR7', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước màn hình', '16 inch', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Thông tin màn hình', '16 inch OLED 2.5K', 16);

  -- Gaming Product 9: Lenovo Legion Pro 5i Gen 10
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_lenovo_id, cat_gaming_id, 'Lenovo Legion Pro 5i Gen 10', 'lenovo-legion-pro-5i-gen-10', 'Core Ultra 9 275HX / RTX 5070 / 32 GB / 1 TB SSD / 16 inch 2.5K', 'Sản phẩm Laptop Gaming chính hãng hiệu năng vượt trội.', true, true)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'lenovo-legion-pro-5i-gen-10';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'GM-009-LENOVOLEGIONP', 'Tiêu chuẩn', 57800000, 63800000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core Ultra 9 275HX', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'RTX 5070', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '32 GB', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '1 TB SSD', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '16 inch 2.5K', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'LENOVO', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'Lenovo Legion Pro 5i Gen 10', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Gaming', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng CPU', 'Intel', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng SSD', '1 TB SSD', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Loại RAM', 'DDR5', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Khe RAM', '2', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Khe SSD', '2 M.2', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng GPU', 'NVIDIA', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa', 'RTX 5070', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước màn hình', '16 inch', 16);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Thông tin màn hình', '16 inch 2.5K', 17);

  -- Gaming Product 10: Lenovo Legion 5i Gen 10
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_lenovo_id, cat_gaming_id, 'Lenovo Legion 5i Gen 10', 'lenovo-legion-5i-gen-10', 'Core Ultra 7 255HX / RTX 5060 / 16 GB / 512 GB SSD / 15.1 inch OLED 2.5K', 'Sản phẩm Laptop Gaming chính hãng hiệu năng vượt trội.', true, true)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'lenovo-legion-5i-gen-10';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'GM-010-LENOVOLEGION5', 'Tiêu chuẩn', 51000000, 56000000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core Ultra 7 255HX', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'RTX 5060', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '16 GB', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '512 GB SSD', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '15.1 inch OLED 2.5K', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'LENOVO', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'Lenovo Legion 5i Gen 10', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Gaming', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng CPU', 'Intel', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng SSD', '512 GB SSD', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng GPU', 'NVIDIA', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa', 'RTX 5060', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước màn hình', '15.1 inch', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Thông tin màn hình', '15.1 inch OLED 2.5K', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Độ phân giải', '2560 × 1600', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Tấm nền', 'OLED', 16);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Tần số quét', '165 Hz', 17);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Độ phủ màu', '100% DCI-P3', 18);

  -- Gaming Product 11: Alienware 16 Area-51
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_alienware_id, cat_gaming_id, 'Alienware 16 Area-51', 'alienware-16-area-51', 'Core Ultra 9 275HX / RTX 5080 / 32 GB / 1 TB SSD / 16 inch QHD+', 'Sản phẩm Laptop Gaming chính hãng hiệu năng vượt trội.', true, true)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'alienware-16-area-51';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'GM-011-ALIENWARE16AR', 'Tiêu chuẩn', 80990000, 89990000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core Ultra 9 275HX', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'RTX 5080', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '32 GB', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '1 TB SSD', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '16 inch QHD+', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'ALIENWARE', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'Alienware 16 Area-51', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Gaming', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng CPU', 'Intel', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng SSD', '1 TB SSD', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng GPU', 'NVIDIA', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa', 'RTX 5080', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng VRAM', '16 GB', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Loại VRAM', 'GDDR7', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước màn hình', '16 inch', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Thông tin màn hình', '16 inch QHD+', 16);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Loại RAM', 'DDR5', 17);

  -- Gaming Product 12: Alienware 18 Area-51
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_alienware_id, cat_gaming_id, 'Alienware 18 Area-51', 'alienware-18-area-51', 'Core Ultra 9 275HX / RTX 5070 Ti / 32 GB / 2 TB SSD / 18 inch QHD+', 'Sản phẩm Laptop Gaming chính hãng hiệu năng vượt trội.', true, true)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'alienware-18-area-51';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'GM-012-ALIENWARE18AR', 'Tiêu chuẩn', 71800000, 79800000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core Ultra 9 275HX', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'RTX 5070 Ti', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '32 GB', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '2 TB SSD', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '18 inch QHD+', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'ALIENWARE', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'Alienware 18 Area-51', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Gaming', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng CPU', 'Intel', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng SSD', '2 TB SSD', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng GPU', 'NVIDIA', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa', 'RTX 5070 Ti', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng VRAM', '12 GB', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Loại VRAM', 'GDDR7', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước màn hình', '18 inch', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Thông tin màn hình', '18 inch QHD+', 16);

  -- ==========================================
  -- 4. OFFICE LAPTOPS (20 SẢN PHẨM VĂN PHÒNG)
  -- ==========================================

  -- Office Product 1: ASUS Zenbook 14 OLED UX3405MA-PP151W
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_asus_id, cat_office_id, 'ASUS Zenbook 14 OLED UX3405MA-PP151W', 'asus-zenbook-14-oled-ux3405ma-pp151w', 'Core Ultra 5 125H / Intel Arc Graphics / 16 GB LPDDR5X / 512 GB SSD / 14.0 inch 3K OLED 120Hz / 1.20 kg', 'Chuẩn Intel Evo, màn hình Lumina OLED 3K, pin 75Wh dùng cả ngày', true, false)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description,
    description = EXCLUDED.description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'asus-zenbook-14-oled-ux3405ma-pp151w';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'VP-001-ASUSZENBOOK14', 'Tiêu chuẩn', 24990000, 28990000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'Zenbook', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core Ultra 5 125H', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'Intel Arc Graphics', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '16 GB LPDDR5X', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '512 GB SSD', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '14.0 inch 3K OLED 120Hz', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Trọng lượng', '1.20 kg', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Đặc điểm nổi bật', 'Chuẩn Intel Evo, màn hình Lumina OLED 3K, pin 75Wh dùng cả ngày', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'ASUS', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Laptop Văn Phòng, Học tập & Doanh nhân mỏng nhẹ', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'GPU đồ họa', 'Intel Arc Graphics', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng', '512 GB SSD', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước & Tấm nền', '14.0 inch 3K OLED 120Hz', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màu sắc & hiển thị', 'Chuẩn màu cao, chống chói bảo vệ mắt', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hệ điều hành', 'Windows 11 Home bản quyền', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kết nối không dây', 'Wi-Fi 6E / Wi-Fi 7, Bluetooth 5.3+', 16);

  -- Office Product 2: ASUS Zenbook S 14 OLED UX5406SA-PV140W
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_asus_id, cat_office_id, 'ASUS Zenbook S 14 OLED UX5406SA-PV140W', 'asus-zenbook-s-14-oled-ux5406sa-pv140w', 'Core Ultra 7 258V / Intel Arc Graphics 140V / 32 GB LPDDR5X / 1 TB SSD / 14.0 inch 3K OLED 120Hz / 1.20 kg', 'Chất liệu gốm nhôm Ceraluminum, NPU 47 TOPS chuẩn Copilot+ PC', true, false)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description,
    description = EXCLUDED.description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'asus-zenbook-s-14-oled-ux5406sa-pv140w';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'VP-002-ASUSZENBOOKS', 'Tiêu chuẩn', 44990000, 48990000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'Zenbook', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core Ultra 7 258V', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'Intel Arc Graphics 140V', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '32 GB LPDDR5X', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '1 TB SSD', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '14.0 inch 3K OLED 120Hz', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Trọng lượng', '1.20 kg', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Đặc điểm nổi bật', 'Chất liệu gốm nhôm Ceraluminum, NPU 47 TOPS chuẩn Copilot+ PC', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'ASUS', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Laptop Văn Phòng, Học tập & Doanh nhân mỏng nhẹ', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'GPU đồ họa', 'Intel Arc Graphics 140V', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng', '1 TB SSD', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước & Tấm nền', '14.0 inch 3K OLED 120Hz', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màu sắc & hiển thị', 'Chuẩn màu cao, chống chói bảo vệ mắt', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hệ điều hành', 'Windows 11 Home bản quyền', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kết nối không dây', 'Wi-Fi 6E / Wi-Fi 7, Bluetooth 5.3+', 16);

  -- Office Product 3: ASUS Vivobook 15 X1504ZA-NJ517W
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_asus_id, cat_office_id, 'ASUS Vivobook 15 X1504ZA-NJ517W', 'asus-vivobook-15-x1504za-nj517w', 'Core i3-1215U / Intel UHD Graphics / 8 GB DDR4 / 512 GB SSD / 15.6 inch FHD IPS / 1.70 kg', 'Bản lề 180 độ, bảo vệ kháng khuẩn ASUS Antimicrobial Guard', true, false)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description,
    description = EXCLUDED.description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'asus-vivobook-15-x1504za-nj517w';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'VP-003-ASUSVIVOBOOK1', 'Tiêu chuẩn', 10490000, 12990000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'Vivobook', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core i3-1215U', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'Intel UHD Graphics', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '8 GB DDR4', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '512 GB SSD', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '15.6 inch FHD IPS', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Trọng lượng', '1.70 kg', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Đặc điểm nổi bật', 'Bản lề 180 độ, bảo vệ kháng khuẩn ASUS Antimicrobial Guard', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'ASUS', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Laptop Văn Phòng, Học tập & Doanh nhân mỏng nhẹ', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'GPU đồ họa', 'Intel UHD Graphics', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng', '512 GB SSD', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước & Tấm nền', '15.6 inch FHD IPS', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màu sắc & hiển thị', 'Chuẩn màu cao, chống chói bảo vệ mắt', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hệ điều hành', 'Windows 11 Home bản quyền', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kết nối không dây', 'Wi-Fi 6E / Wi-Fi 7, Bluetooth 5.3+', 16);

  -- Office Product 4: ASUS Vivobook 16 X1605VA-MB105W
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_asus_id, cat_office_id, 'ASUS Vivobook 16 X1605VA-MB105W', 'asus-vivobook-16-x1605va-mb105w', 'Core i5-13500H / Intel Iris Xe / 16 GB DDR4 / 512 GB SSD / 16.0 inch WUXGA (1920x1200) / 1.88 kg', 'Chip dòng H hiệu năng cao, màn hình tỉ lệ 16:10 rộng rãi', true, false)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description,
    description = EXCLUDED.description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'asus-vivobook-16-x1605va-mb105w';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'VP-004-ASUSVIVOBOOK1', 'Tiêu chuẩn', 16490000, 18990000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'Vivobook', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core i5-13500H', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'Intel Iris Xe', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '16 GB DDR4', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '512 GB SSD', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '16.0 inch WUXGA (1920x1200)', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Trọng lượng', '1.88 kg', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Đặc điểm nổi bật', 'Chip dòng H hiệu năng cao, màn hình tỉ lệ 16:10 rộng rãi', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'ASUS', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Laptop Văn Phòng, Học tập & Doanh nhân mỏng nhẹ', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'GPU đồ họa', 'Intel Iris Xe', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng', '512 GB SSD', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước & Tấm nền', '16.0 inch WUXGA (1920x1200)', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màu sắc & hiển thị', 'Chuẩn màu cao, chống chói bảo vệ mắt', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hệ điều hành', 'Windows 11 Home bản quyền', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kết nối không dây', 'Wi-Fi 6E / Wi-Fi 7, Bluetooth 5.3+', 16);

  -- Office Product 5: ASUS Vivobook S 14 OLED S5406MA-PP051W
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_asus_id, cat_office_id, 'ASUS Vivobook S 14 OLED S5406MA-PP051W', 'asus-vivobook-s-14-oled-s5406ma-pp051w', 'Core Ultra 5 125H / Intel Arc Graphics / 16 GB LPDDR5X / 512 GB SSD / 14.0 inch 3K OLED 120Hz / 1.30 kg', 'Thiết kế kim loại siêu mỏng nhẹ, bàn phím RGB 1 vùng cá tính', true, false)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description,
    description = EXCLUDED.description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'asus-vivobook-s-14-oled-s5406ma-pp051w';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'VP-005-ASUSVIVOBOOKS', 'Tiêu chuẩn', 23990000, 26990000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'Vivobook', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core Ultra 5 125H', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'Intel Arc Graphics', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '16 GB LPDDR5X', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '512 GB SSD', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '14.0 inch 3K OLED 120Hz', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Trọng lượng', '1.30 kg', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Đặc điểm nổi bật', 'Thiết kế kim loại siêu mỏng nhẹ, bàn phím RGB 1 vùng cá tính', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'ASUS', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Laptop Văn Phòng, Học tập & Doanh nhân mỏng nhẹ', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'GPU đồ họa', 'Intel Arc Graphics', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng', '512 GB SSD', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước & Tấm nền', '14.0 inch 3K OLED 120Hz', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màu sắc & hiển thị', 'Chuẩn màu cao, chống chói bảo vệ mắt', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hệ điều hành', 'Windows 11 Home bản quyền', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kết nối không dây', 'Wi-Fi 6E / Wi-Fi 7, Bluetooth 5.3+', 16);

  -- Office Product 6: Acer Swift Go 14 AI SFG14-73-7188
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_acer_id, cat_office_id, 'Acer Swift Go 14 AI SFG14-73-7188', 'acer-swift-go-14-ai-sfg14-73-7188', 'Core Ultra 7 155H / Intel Arc Graphics / 16 GB LPDDR5X / 512 GB SSD / 14.0 inch 2.8K OLED 90Hz / 1.32 kg', 'Camera QHD 1440p tích hợp AI PurifiedVoice khử ồn 3 micro', true, false)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description,
    description = EXCLUDED.description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'acer-swift-go-14-ai-sfg14-73-7188';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'VP-006-ACERSWIFTGO1', 'Tiêu chuẩn', 23490000, 26990000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'Swift', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core Ultra 7 155H', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'Intel Arc Graphics', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '16 GB LPDDR5X', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '512 GB SSD', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '14.0 inch 2.8K OLED 90Hz', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Trọng lượng', '1.32 kg', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Đặc điểm nổi bật', 'Camera QHD 1440p tích hợp AI PurifiedVoice khử ồn 3 micro', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'ACER', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Laptop Văn Phòng, Học tập & Doanh nhân mỏng nhẹ', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'GPU đồ họa', 'Intel Arc Graphics', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng', '512 GB SSD', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước & Tấm nền', '14.0 inch 2.8K OLED 90Hz', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màu sắc & hiển thị', 'Chuẩn màu cao, chống chói bảo vệ mắt', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hệ điều hành', 'Windows 11 Home bản quyền', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kết nối không dây', 'Wi-Fi 6E / Wi-Fi 7, Bluetooth 5.3+', 16);

  -- Office Product 7: Acer Swift Go 14 AI SFG14-73-53X7
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_acer_id, cat_office_id, 'Acer Swift Go 14 AI SFG14-73-53X7', 'acer-swift-go-14-ai-sfg14-73-53x7', 'Core Ultra 5 125H / Intel Arc Graphics / 16 GB LPDDR5X / 512 GB SSD / 14.0 inch 2.8K OLED 90Hz / 1.32 kg', 'Màn hình OLED 100% DCI-P3 sắc nét, chuẩn văn phòng doanh nhân', true, false)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description,
    description = EXCLUDED.description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'acer-swift-go-14-ai-sfg14-73-53x7';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'VP-007-ACERSWIFTGO1', 'Tiêu chuẩn', 20990000, 23990000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'Swift', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core Ultra 5 125H', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'Intel Arc Graphics', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '16 GB LPDDR5X', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '512 GB SSD', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '14.0 inch 2.8K OLED 90Hz', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Trọng lượng', '1.32 kg', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Đặc điểm nổi bật', 'Màn hình OLED 100% DCI-P3 sắc nét, chuẩn văn phòng doanh nhân', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'ACER', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Laptop Văn Phòng, Học tập & Doanh nhân mỏng nhẹ', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'GPU đồ họa', 'Intel Arc Graphics', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng', '512 GB SSD', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước & Tấm nền', '14.0 inch 2.8K OLED 90Hz', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màu sắc & hiển thị', 'Chuẩn màu cao, chống chói bảo vệ mắt', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hệ điều hành', 'Windows 11 Home bản quyền', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kết nối không dây', 'Wi-Fi 6E / Wi-Fi 7, Bluetooth 5.3+', 16);

  -- Office Product 8: Acer Aspire 5 A515-58P-56P3
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_acer_id, cat_office_id, 'Acer Aspire 5 A515-58P-56P3', 'acer-aspire-5-a515-58p-56p3', 'Core i5-1335U / Intel Iris Xe / 16 GB LPDDR5 / 512 GB SSD / 15.6 inch FHD IPS / 1.70 kg', 'Tản nhiệt 2 quạt hiệu quả, vỏ nhôm sang trọng phân khúc học sinh', true, false)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description,
    description = EXCLUDED.description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'acer-aspire-5-a515-58p-56p3';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'VP-008-ACERASPIRE5A', 'Tiêu chuẩn', 13990000, 16490000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'Aspire', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core i5-1335U', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'Intel Iris Xe', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '16 GB LPDDR5', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '512 GB SSD', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '15.6 inch FHD IPS', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Trọng lượng', '1.70 kg', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Đặc điểm nổi bật', 'Tản nhiệt 2 quạt hiệu quả, vỏ nhôm sang trọng phân khúc học sinh', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'ACER', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Laptop Văn Phòng, Học tập & Doanh nhân mỏng nhẹ', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'GPU đồ họa', 'Intel Iris Xe', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng', '512 GB SSD', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước & Tấm nền', '15.6 inch FHD IPS', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màu sắc & hiển thị', 'Chuẩn màu cao, chống chói bảo vệ mắt', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hệ điều hành', 'Windows 11 Home bản quyền', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kết nối không dây', 'Wi-Fi 6E / Wi-Fi 7, Bluetooth 5.3+', 16);

  -- Office Product 9: Acer Aspire Lite 14 AL14-51M-59G0
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_acer_id, cat_office_id, 'Acer Aspire Lite 14 AL14-51M-59G0', 'acer-aspire-lite-14-al14-51m-59g0', 'Core i5-1235U / Intel Iris Xe / 16 GB DDR5 / 512 GB SSD / 14.0 inch WUXGA IPS 16:10 / 1.50 kg', 'RAM DDR5 tốc độ cao, kích thước gọn gàng cho học sinh sinh viên', true, false)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description,
    description = EXCLUDED.description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'acer-aspire-lite-14-al14-51m-59g0';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'VP-009-ACERASPIRELIT', 'Tiêu chuẩn', 11990000, 14490000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'Aspire', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core i5-1235U', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'Intel Iris Xe', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '16 GB DDR5', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '512 GB SSD', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '14.0 inch WUXGA IPS 16:10', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Trọng lượng', '1.50 kg', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Đặc điểm nổi bật', 'RAM DDR5 tốc độ cao, kích thước gọn gàng cho học sinh sinh viên', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'ACER', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Laptop Văn Phòng, Học tập & Doanh nhân mỏng nhẹ', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'GPU đồ họa', 'Intel Iris Xe', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng', '512 GB SSD', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước & Tấm nền', '14.0 inch WUXGA IPS 16:10', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màu sắc & hiển thị', 'Chuẩn màu cao, chống chói bảo vệ mắt', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hệ điều hành', 'Windows 11 Home bản quyền', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kết nối không dây', 'Wi-Fi 6E / Wi-Fi 7, Bluetooth 5.3+', 16);

  -- Office Product 10: Lenovo ThinkPad E14 Gen 6 21M3004JVN
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_lenovo_id, cat_office_id, 'Lenovo ThinkPad E14 Gen 6 21M3004JVN', 'lenovo-thinkpad-e14-gen-6-21m3004jvn', 'Core Ultra 5 125U / Intel Graphics / 16 GB DDR5 / 512 GB SSD / 14.0 inch WUXGA IPS 300 nits / 1.44 kg', 'Độ bền chuẩn quân đội MIL-STD-810H, bàn phím gõ êm số 1 thế giới', true, false)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description,
    description = EXCLUDED.description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'lenovo-thinkpad-e14-gen-6-21m3004jvn';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'VP-010-LENOVOTHINKPAD', 'Tiêu chuẩn', 21990000, 24990000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'ThinkPad', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core Ultra 5 125U', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'Intel Graphics', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '16 GB DDR5', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '512 GB SSD', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '14.0 inch WUXGA IPS 300 nits', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Trọng lượng', '1.44 kg', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Đặc điểm nổi bật', 'Độ bền chuẩn quân đội MIL-STD-810H, bàn phím gõ êm số 1 thế giới', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'LENOVO', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Laptop Văn Phòng, Học tập & Doanh nhân mỏng nhẹ', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'GPU đồ họa', 'Intel Graphics', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng', '512 GB SSD', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước & Tấm nền', '14.0 inch WUXGA IPS 300 nits', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màu sắc & hiển thị', 'Chuẩn màu cao, chống chói bảo vệ mắt', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hệ điều hành', 'Windows 11 Home bản quyền', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kết nối không dây', 'Wi-Fi 6E / Wi-Fi 7, Bluetooth 5.3+', 16);

  -- Office Product 11: Lenovo ThinkBook 14 G7 IML 21MR008DVN
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_lenovo_id, cat_office_id, 'Lenovo ThinkBook 14 G7 IML 21MR008DVN', 'lenovo-thinkbook-14-g7-iml-21mr008dvn', 'Core Ultra 7 155H / Intel Arc Graphics / 16 GB DDR5 5600 / 512 GB SSD / 14.0 inch WUXGA IPS / 1.38 kg', 'Thiết kế 2 tông màu thời thượng, vỏ nhôm nguyên khối bền chắc', true, false)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description,
    description = EXCLUDED.description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'lenovo-thinkbook-14-g7-iml-21mr008dvn';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'VP-011-LENOVOTHINKBOO', 'Tiêu chuẩn', 22990000, 25990000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'ThinkBook', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core Ultra 7 155H', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'Intel Arc Graphics', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '16 GB DDR5 5600', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '512 GB SSD', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '14.0 inch WUXGA IPS', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Trọng lượng', '1.38 kg', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Đặc điểm nổi bật', 'Thiết kế 2 tông màu thời thượng, vỏ nhôm nguyên khối bền chắc', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'LENOVO', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Laptop Văn Phòng, Học tập & Doanh nhân mỏng nhẹ', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'GPU đồ họa', 'Intel Arc Graphics', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng', '512 GB SSD', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước & Tấm nền', '14.0 inch WUXGA IPS', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màu sắc & hiển thị', 'Chuẩn màu cao, chống chói bảo vệ mắt', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hệ điều hành', 'Windows 11 Home bản quyền', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kết nối không dây', 'Wi-Fi 6E / Wi-Fi 7, Bluetooth 5.3+', 16);

  -- Office Product 12: Lenovo ThinkBook 16 G6+ IMH 21MS001BVN
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_lenovo_id, cat_office_id, 'Lenovo ThinkBook 16 G6+ IMH 21MS001BVN', 'lenovo-thinkbook-16-g6-imh-21ms001bvn', 'Core Ultra 5 125H / Intel Arc Graphics / 16 GB LPDDR5X / 512 GB SSD / 16.0 inch 2.5K IPS 120Hz / 1.80 kg', 'Màn hình 2.5K tần số quét 120Hz mượt mà, đầy đủ cổng kết nối', true, false)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description,
    description = EXCLUDED.description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'lenovo-thinkbook-16-g6-imh-21ms001bvn';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'VP-012-LENOVOTHINKBOO', 'Tiêu chuẩn', 23990000, 26990000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'ThinkBook', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core Ultra 5 125H', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'Intel Arc Graphics', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '16 GB LPDDR5X', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '512 GB SSD', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '16.0 inch 2.5K IPS 120Hz', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Trọng lượng', '1.80 kg', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Đặc điểm nổi bật', 'Màn hình 2.5K tần số quét 120Hz mượt mà, đầy đủ cổng kết nối', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'LENOVO', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Laptop Văn Phòng, Học tập & Doanh nhân mỏng nhẹ', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'GPU đồ họa', 'Intel Arc Graphics', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng', '512 GB SSD', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước & Tấm nền', '16.0 inch 2.5K IPS 120Hz', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màu sắc & hiển thị', 'Chuẩn màu cao, chống chói bảo vệ mắt', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hệ điều hành', 'Windows 11 Home bản quyền', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kết nối không dây', 'Wi-Fi 6E / Wi-Fi 7, Bluetooth 5.3+', 16);

  -- Office Product 13: Lenovo IdeaPad Slim 3 15IAH8 83ER000EVN
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_lenovo_id, cat_office_id, 'Lenovo IdeaPad Slim 3 15IAH8 83ER000EVN', 'lenovo-ideapad-slim-3-15iah8-83er000evn', 'Core i5-12450H / Intel UHD Graphics / 16 GB LPDDR5 / 512 GB SSD / 15.6 inch FHD IPS / 1.62 kg', 'Chip dòng H mạnh mẽ trong phân khúc phổ thông, cảm biến vân tay', true, false)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description,
    description = EXCLUDED.description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'lenovo-ideapad-slim-3-15iah8-83er000evn';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'VP-013-LENOVOIDEAPAD', 'Tiêu chuẩn', 13490000, 15490000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'IdeaPad', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core i5-12450H', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'Intel UHD Graphics', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '16 GB LPDDR5', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '512 GB SSD', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '15.6 inch FHD IPS', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Trọng lượng', '1.62 kg', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Đặc điểm nổi bật', 'Chip dòng H mạnh mẽ trong phân khúc phổ thông, cảm biến vân tay', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'LENOVO', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Laptop Văn Phòng, Học tập & Doanh nhân mỏng nhẹ', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'GPU đồ họa', 'Intel UHD Graphics', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng', '512 GB SSD', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước & Tấm nền', '15.6 inch FHD IPS', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màu sắc & hiển thị', 'Chuẩn màu cao, chống chói bảo vệ mắt', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hệ điều hành', 'Windows 11 Home bản quyền', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kết nối không dây', 'Wi-Fi 6E / Wi-Fi 7, Bluetooth 5.3+', 16);

  -- Office Product 14: Dell Inspiron 14 5440 N5440-U5125H
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_dell_id, cat_office_id, 'Dell Inspiron 14 5440 N5440-U5125H', 'dell-inspiron-14-5440-n5440-u5125h', 'Core Ultra 5 125H / Intel Arc Graphics / 16 GB LPDDR5X / 512 GB SSD / 14.0 inch FHD+ IPS 16:10 / 1.56 kg', 'Độ bền trứ danh từ Dell, bảo hành tận nơi Dell ProSupport', true, false)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description,
    description = EXCLUDED.description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'dell-inspiron-14-5440-n5440-u5125h';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'VP-014-DELLINSPIRON1', 'Tiêu chuẩn', 21490000, 24490000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'Inspiron', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core Ultra 5 125H', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'Intel Arc Graphics', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '16 GB LPDDR5X', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '512 GB SSD', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '14.0 inch FHD+ IPS 16:10', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Trọng lượng', '1.56 kg', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Đặc điểm nổi bật', 'Độ bền trứ danh từ Dell, bảo hành tận nơi Dell ProSupport', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'DELL', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Laptop Văn Phòng, Học tập & Doanh nhân mỏng nhẹ', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'GPU đồ họa', 'Intel Arc Graphics', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng', '512 GB SSD', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước & Tấm nền', '14.0 inch FHD+ IPS 16:10', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màu sắc & hiển thị', 'Chuẩn màu cao, chống chói bảo vệ mắt', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hệ điều hành', 'Windows 11 Home bản quyền', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kết nối không dây', 'Wi-Fi 6E / Wi-Fi 7, Bluetooth 5.3+', 16);

  -- Office Product 15: Dell Inspiron 15 3520 71027003
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_dell_id, cat_office_id, 'Dell Inspiron 15 3520 71027003', 'dell-inspiron-15-3520-71027003', 'Core i5-1235U / Intel Iris Xe / 16 GB DDR4 / 512 GB SSD / 15.6 inch FHD 120Hz / 1.65 kg', 'Màn hình 120Hz cuộn lướt văn bản mượt, nâng cấp RAM dễ dàng', true, false)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description,
    description = EXCLUDED.description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'dell-inspiron-15-3520-71027003';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'VP-015-DELLINSPIRON1', 'Tiêu chuẩn', 14490000, 16990000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'Inspiron', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core i5-1235U', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'Intel Iris Xe', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '16 GB DDR4', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '512 GB SSD', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '15.6 inch FHD 120Hz', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Trọng lượng', '1.65 kg', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Đặc điểm nổi bật', 'Màn hình 120Hz cuộn lướt văn bản mượt, nâng cấp RAM dễ dàng', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'DELL', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Laptop Văn Phòng, Học tập & Doanh nhân mỏng nhẹ', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'GPU đồ họa', 'Intel Iris Xe', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng', '512 GB SSD', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước & Tấm nền', '15.6 inch FHD 120Hz', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màu sắc & hiển thị', 'Chuẩn màu cao, chống chói bảo vệ mắt', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hệ điều hành', 'Windows 11 Home bản quyền', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kết nối không dây', 'Wi-Fi 6E / Wi-Fi 7, Bluetooth 5.3+', 16);

  -- Office Product 16: Dell XPS 13 9340 71034032
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_dell_id, cat_office_id, 'Dell XPS 13 9340 71034032', 'dell-xps-13-9340-71034032', 'Core Ultra 7 155H / Intel Arc Graphics / 16 GB LPDDR5X / 512 GB SSD / 13.4 inch FHD+ 120Hz / 1.19 kg', 'Kiệt tác thiết kế nhôm phay xước CNC và kính cường lực Gorilla Glass 7', true, false)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description,
    description = EXCLUDED.description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'dell-xps-13-9340-71034032';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'VP-016-DELLXPS13934', 'Tiêu chuẩn', 46990000, 51990000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'XPS', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core Ultra 7 155H', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'Intel Arc Graphics', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '16 GB LPDDR5X', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '512 GB SSD', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '13.4 inch FHD+ 120Hz', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Trọng lượng', '1.19 kg', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Đặc điểm nổi bật', 'Kiệt tác thiết kế nhôm phay xước CNC và kính cường lực Gorilla Glass 7', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'DELL', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Laptop Văn Phòng, Học tập & Doanh nhân mỏng nhẹ', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'GPU đồ họa', 'Intel Arc Graphics', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng', '512 GB SSD', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước & Tấm nền', '13.4 inch FHD+ 120Hz', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màu sắc & hiển thị', 'Chuẩn màu cao, chống chói bảo vệ mắt', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hệ điều hành', 'Windows 11 Home bản quyền', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kết nối không dây', 'Wi-Fi 6E / Wi-Fi 7, Bluetooth 5.3+', 16);

  -- Office Product 17: HP Pavilion 14-dv2073TU 7C0P9PA
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_hp_id, cat_office_id, 'HP Pavilion 14-dv2073TU 7C0P9PA', 'hp-pavilion-14-dv2073tu-7c0p9pa', 'Core i5-1235U / Intel Iris Xe / 16 GB DDR4 / 512 GB SSD / 14.0 inch FHD IPS / 1.41 kg', 'Hệ thống âm thanh Bang & Olufsen cao cấp, màu vàng gold sang trọng', true, false)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description,
    description = EXCLUDED.description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'hp-pavilion-14-dv2073tu-7c0p9pa';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'VP-017-HPPAVILION14', 'Tiêu chuẩn', 15490000, 17990000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'Pavilion', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core i5-1235U', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'Intel Iris Xe', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '16 GB DDR4', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '512 GB SSD', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '14.0 inch FHD IPS', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Trọng lượng', '1.41 kg', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Đặc điểm nổi bật', 'Hệ thống âm thanh Bang & Olufsen cao cấp, màu vàng gold sang trọng', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'HP', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Laptop Văn Phòng, Học tập & Doanh nhân mỏng nhẹ', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'GPU đồ họa', 'Intel Iris Xe', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng', '512 GB SSD', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước & Tấm nền', '14.0 inch FHD IPS', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màu sắc & hiển thị', 'Chuẩn màu cao, chống chói bảo vệ mắt', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hệ điều hành', 'Windows 11 Home bản quyền', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kết nối không dây', 'Wi-Fi 6E / Wi-Fi 7, Bluetooth 5.3+', 16);

  -- Office Product 18: HP Envy x360 14-fc0085TU 9Y351PA
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_hp_id, cat_office_id, 'HP Envy x360 14-fc0085TU 9Y351PA', 'hp-envy-x360-14-fc0085tu-9y351pa', 'Core Ultra 7 155U / Intel Graphics / 16 GB LPDDR5X / 512 GB SSD / 14.0 inch 2.8K OLED Cảm ứng xoay gập 360 / 1.39 kg', 'Xoay gập 2-trong-1 tiện lợi, màn hình cảm ứng OLED kèm bút stylus', true, false)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description,
    description = EXCLUDED.description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'hp-envy-x360-14-fc0085tu-9y351pa';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'VP-018-HPENVYX36014', 'Tiêu chuẩn', 27990000, 30990000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'Envy', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core Ultra 7 155U', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'Intel Graphics', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '16 GB LPDDR5X', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '512 GB SSD', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '14.0 inch 2.8K OLED Cảm ứng xoay gập 360', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Trọng lượng', '1.39 kg', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Đặc điểm nổi bật', 'Xoay gập 2-trong-1 tiện lợi, màn hình cảm ứng OLED kèm bút stylus', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'HP', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Laptop Văn Phòng, Học tập & Doanh nhân mỏng nhẹ', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'GPU đồ họa', 'Intel Graphics', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng', '512 GB SSD', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước & Tấm nền', '14.0 inch 2.8K OLED Cảm ứng xoay gập 360', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màu sắc & hiển thị', 'Chuẩn màu cao, chống chói bảo vệ mắt', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hệ điều hành', 'Windows 11 Home bản quyền', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kết nối không dây', 'Wi-Fi 6E / Wi-Fi 7, Bluetooth 5.3+', 16);

  -- Office Product 19: LG gram 14 2024 14Z90S-G.AH75A5
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_lg_id, cat_office_id, 'LG gram 14 2024 14Z90S-G.AH75A5', 'lg-gram-14-2024-14z90s-g-ah75a5', 'Core Ultra 7 155H / Intel Arc Graphics / 16 GB LPDDR5X / 512 GB SSD / 14.0 inch WUXGA IPS chống chói / 1.12 kg', 'Trọng lượng siêu nhẹ kỷ lục 1.12kg, chuẩn độ bền quân sự Mỹ MIL-STD', true, false)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description,
    description = EXCLUDED.description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'lg-gram-14-2024-14z90s-g-ah75a5';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'VP-019-LGGRAM142024', 'Tiêu chuẩn', 31990000, 35990000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'gram', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core Ultra 7 155H', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'Intel Arc Graphics', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '16 GB LPDDR5X', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '512 GB SSD', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '14.0 inch WUXGA IPS chống chói', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Trọng lượng', '1.12 kg', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Đặc điểm nổi bật', 'Trọng lượng siêu nhẹ kỷ lục 1.12kg, chuẩn độ bền quân sự Mỹ MIL-STD', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'LG', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Laptop Văn Phòng, Học tập & Doanh nhân mỏng nhẹ', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'GPU đồ họa', 'Intel Arc Graphics', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng', '512 GB SSD', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước & Tấm nền', '14.0 inch WUXGA IPS chống chói', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màu sắc & hiển thị', 'Chuẩn màu cao, chống chói bảo vệ mắt', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hệ điều hành', 'Windows 11 Home bản quyền', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kết nối không dây', 'Wi-Fi 6E / Wi-Fi 7, Bluetooth 5.3+', 16);

  -- Office Product 20: LG gram 16 2024 16Z90S-G.AH55A5
  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)
  VALUES (b_lg_id, cat_office_id, 'LG gram 16 2024 16Z90S-G.AH55A5', 'lg-gram-16-2024-16z90s-g-ah55a5', 'Core Ultra 5 125H / Intel Arc Graphics / 16 GB LPDDR5X / 512 GB SSD / 16.0 inch WQXGA (2560x1600) / 1.19 kg', 'Màn hình lớn 16 inch nhưng chỉ nặng 1.19kg, pin khủng 77Wh', true, false)
  ON CONFLICT (slug) DO UPDATE SET 
    brand_id = EXCLUDED.brand_id,
    category_id = EXCLUDED.category_id,
    product_name = EXCLUDED.product_name,
    short_description = EXCLUDED.short_description,
    description = EXCLUDED.description
  RETURNING product_id INTO curr_prod_id;

  IF curr_prod_id IS NULL THEN
    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = 'lg-gram-16-2024-16z90s-g-ah55a5';
  END IF;

  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)
  VALUES (curr_prod_id, 'VP-020-LGGRAM162024', 'Tiêu chuẩn', 33990000, 37990000, true)
  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;

  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dòng sản phẩm', 'gram', 1);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'CPU', 'Core Ultra 5 125H', 2);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Card đồ họa (GPU)', 'Intel Arc Graphics', 3);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Dung lượng RAM', '16 GB LPDDR5X', 4);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng lưu trữ', '512 GB SSD', 5);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màn hình', '16.0 inch WQXGA (2560x1600)', 6);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Trọng lượng', '1.19 kg', 7);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Đặc điểm nổi bật', 'Màn hình lớn 16 inch nhưng chỉ nặng 1.19kg, pin khủng 77Wh', 8);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hãng sản xuất', 'LG', 9);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Nhu cầu sử dụng', 'Laptop Văn Phòng, Học tập & Doanh nhân mỏng nhẹ', 10);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'GPU đồ họa', 'Intel Arc Graphics', 11);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Ổ cứng', '512 GB SSD', 12);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kích thước & Tấm nền', '16.0 inch WQXGA (2560x1600)', 13);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Màu sắc & hiển thị', 'Chuẩn màu cao, chống chói bảo vệ mắt', 14);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Hệ điều hành', 'Windows 11 Home bản quyền', 15);
  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, 'Kết nối không dây', 'Wi-Fi 6E / Wi-Fi 7, Bluetooth 5.3+', 16);

END $$;

-- ==============================================================================
-- TRUY VẤN KIỂM TRA SAU KHI CHẠY (VERIFICATION QUERY)
-- ==============================================================================
SELECT 
  c.category_name AS "Danh mục",
  b.brand_name AS "Thương hiệu",
  p.product_name AS "Tên sản phẩm",
  pv.price AS "Giá bán",
  pv.compare_at_price AS "Giá gốc",
  pv.sku AS "Mã SKU",
  count(ps.specification_id) AS "Số thông số kỹ thuật"
FROM public.products p
JOIN public.categories c ON p.category_id = c.category_id
JOIN public.brands b ON p.brand_id = b.brand_id
LEFT JOIN public.product_variants pv ON p.product_id = pv.product_id
LEFT JOIN public.product_specifications ps ON p.product_id = ps.product_id
GROUP BY c.category_name, b.brand_name, p.product_name, pv.price, pv.compare_at_price, pv.sku
ORDER BY c.category_name DESC, b.brand_name ASC, pv.price DESC;