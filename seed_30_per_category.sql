-- =====================================================================
-- SCRIPT SEED TOÀN DIỆN: ĐỦ 30 SẢN PHẨM CHO TỪNG DANH MỤC TRÊN WEBSITE
-- Dành cho PostgreSQL / Supabase SQL Editor
-- =====================================================================

-- ---------------------------------------------------------------------
-- DANH MỤC: LAPTOP GAMING (laptop-gaming) - Bổ sung 18 sản phẩm -> Đủ 30 sản phẩm
-- ---------------------------------------------------------------------

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd9e0f08b-b06a-4fc7-a913-89395c331903',
    '95935020-183f-44cc-a477-2a559734bdad',
    'ASUS ROG Strix SCAR 18 (2025) G835JY',
    'laptop-gaming-asus-rog-strix-scar-18-2025-g835jy-1000',
    'Intel Core Ultra 9 285HX, RTX 5090 16GB, 64GB DDR5, 2TB SSD, 18 inch 2.5K 240Hz Nebula HDR',
    'ASUS ROG Strix SCAR 18 (2025) G835JY chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1000',
    95990000,
    105000000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'ASUS', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('ASUS%20ROG%20Strix%20SCAR%2018%20(2025)%20G835JY', '%20', '+'),
    'ASUS ROG Strix SCAR 18 (2025) G835JY',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd9e0f08b-b06a-4fc7-a913-89395c331903',
    '95935020-183f-44cc-a477-2a559734bdad',
    'ASUS ROG Strix SCAR 16 (2025) G635JZ',
    'laptop-gaming-asus-rog-strix-scar-16-2025-g635jz-1001',
    'Intel Core Ultra 9 285HX, RTX 5080 16GB, 32GB DDR5, 1TB SSD, 16 inch Mini LED 240Hz',
    'ASUS ROG Strix SCAR 16 (2025) G635JZ chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1001',
    79990000,
    86990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'ASUS', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('ASUS%20ROG%20Strix%20SCAR%2016%20(2025)%20G635JZ', '%20', '+'),
    'ASUS ROG Strix SCAR 16 (2025) G635JZ',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd9e0f08b-b06a-4fc7-a913-89395c331903',
    '95935020-183f-44cc-a477-2a559734bdad',
    'ASUS TUF Gaming F16 (2025) FX607JU',
    'laptop-gaming-asus-tuf-gaming-f16-2025-fx607ju-1002',
    'Intel Core i7-14650HX, RTX 4050 6GB, 16GB RAM, 512GB SSD, 16 inch FHD+ 165Hz',
    'ASUS TUF Gaming F16 (2025) FX607JU chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1002',
    27990000,
    31990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'ASUS', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('ASUS%20TUF%20Gaming%20F16%20(2025)%20FX607JU', '%20', '+'),
    'ASUS TUF Gaming F16 (2025) FX607JU',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd9e0f08b-b06a-4fc7-a913-89395c331903',
    '95935020-183f-44cc-a477-2a559734bdad',
    'ASUS TUF Gaming A15 FA507UV',
    'laptop-gaming-asus-tuf-gaming-a15-fa507uv-1003',
    'AMD Ryzen 7 8845HS, RTX 4060 8GB, 16GB RAM, 512GB SSD, 15.6 inch FHD 144Hz',
    'ASUS TUF Gaming A15 FA507UV chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1003',
    29490000,
    33990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'ASUS', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('ASUS%20TUF%20Gaming%20A15%20FA507UV', '%20', '+'),
    'ASUS TUF Gaming A15 FA507UV',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd9e0f08b-b06a-4fc7-a913-89395c331903',
    'eea3503a-05e7-4471-839c-ec14d82e8bf9',
    'Acer Predator Helios 18 PH18-72',
    'laptop-gaming-acer-predator-helios-18-ph18-72-1004',
    'Intel Core i9-14900HX, RTX 4090 16GB, 32GB RAM, 2TB SSD, 18 inch WQXGA 250Hz Mini LED',
    'Acer Predator Helios 18 PH18-72 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1004',
    89990000,
    98990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'ACER', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Acer%20Predator%20Helios%2018%20PH18-72', '%20', '+'),
    'Acer Predator Helios 18 PH18-72',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd9e0f08b-b06a-4fc7-a913-89395c331903',
    'eea3503a-05e7-4471-839c-ec14d82e8bf9',
    'Acer Predator Helios 16 PH16-72',
    'laptop-gaming-acer-predator-helios-16-ph16-72-1005',
    'Intel Core i9-14900HX, RTX 4080 12GB, 32GB RAM, 1TB SSD, 16 inch WQXGA 240Hz',
    'Acer Predator Helios 16 PH16-72 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1005',
    54990000,
    61990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'ACER', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Acer%20Predator%20Helios%2016%20PH16-72', '%20', '+'),
    'Acer Predator Helios 16 PH16-72',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd9e0f08b-b06a-4fc7-a913-89395c331903',
    'eea3503a-05e7-4471-839c-ec14d82e8bf9',
    'Acer Nitro 16 Phoenix AN16-41',
    'laptop-gaming-acer-nitro-16-phoenix-an16-41-1006',
    'AMD Ryzen 7 7840HS, RTX 4060 8GB, 16GB RAM, 512GB SSD, 16 inch WQXGA 165Hz',
    'Acer Nitro 16 Phoenix AN16-41 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1006',
    28990000,
    32990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'ACER', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Acer%20Nitro%2016%20Phoenix%20AN16-41', '%20', '+'),
    'Acer Nitro 16 Phoenix AN16-41',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd9e0f08b-b06a-4fc7-a913-89395c331903',
    'eea3503a-05e7-4471-839c-ec14d82e8bf9',
    'Acer Nitro 5 Tiger AN515-58',
    'laptop-gaming-acer-nitro-5-tiger-an515-58-1007',
    'Intel Core i5-12500H, RTX 4050 6GB, 16GB RAM, 512GB SSD, 15.6 inch FHD 144Hz',
    'Acer Nitro 5 Tiger AN515-58 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1007',
    20490000,
    24990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'ACER', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Acer%20Nitro%205%20Tiger%20AN515-58', '%20', '+'),
    'Acer Nitro 5 Tiger AN515-58',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd9e0f08b-b06a-4fc7-a913-89395c331903',
    '7ba28e54-bf81-4a00-a287-a81281ed1134',
    'Lenovo Legion 9i Gen 9 (16 inch Intel)',
    'laptop-gaming-lenovo-legion-9i-gen-9-16-inch-intel-1008',
    'Intel Core i9-14900HX, RTX 4090 16GB, 64GB RAM, 2TB SSD, Tản nhiệt nước tích hợp',
    'Lenovo Legion 9i Gen 9 (16 inch Intel) chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1008',
    119990000,
    129990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'LENOVO', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Lenovo%20Legion%209i%20Gen%209%20(16%20inch%20Intel)', '%20', '+'),
    'Lenovo Legion 9i Gen 9 (16 inch Intel)',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd9e0f08b-b06a-4fc7-a913-89395c331903',
    '7ba28e54-bf81-4a00-a287-a81281ed1134',
    'Lenovo Legion Slim 5 16AHP9',
    'laptop-gaming-lenovo-legion-slim-5-16ahp9-1009',
    'AMD Ryzen 7 8845HS, RTX 4060 8GB, 16GB RAM, 512GB SSD, 16 inch WQXGA 165Hz',
    'Lenovo Legion Slim 5 16AHP9 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1009',
    34990000,
    38990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'LENOVO', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Lenovo%20Legion%20Slim%205%2016AHP9', '%20', '+'),
    'Lenovo Legion Slim 5 16AHP9',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd9e0f08b-b06a-4fc7-a913-89395c331903',
    '7ba28e54-bf81-4a00-a287-a81281ed1134',
    'Lenovo LOQ 15ARP9',
    'laptop-gaming-lenovo-loq-15arp9-1010',
    'AMD Ryzen 7 7435HS, RTX 4050 6GB, 16GB RAM, 512GB SSD, 15.6 inch FHD 144Hz 100% sRGB',
    'Lenovo LOQ 15ARP9 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1010',
    21990000,
    24990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'LENOVO', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Lenovo%20LOQ%2015ARP9', '%20', '+'),
    'Lenovo LOQ 15ARP9',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd9e0f08b-b06a-4fc7-a913-89395c331903',
    '7ba28e54-bf81-4a00-a287-a81281ed1134',
    'Lenovo LOQ 15IAX9I',
    'laptop-gaming-lenovo-loq-15iax9i-1011',
    'Intel Core i5-12450HX, Intel Arc A530M 4GB, 16GB RAM, 512GB SSD, 15.6 inch 144Hz',
    'Lenovo LOQ 15IAX9I chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1011',
    17490000,
    20990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'LENOVO', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Lenovo%20LOQ%2015IAX9I', '%20', '+'),
    'Lenovo LOQ 15IAX9I',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd9e0f08b-b06a-4fc7-a913-89395c331903',
    '59c7d85d-38e9-445e-b6ef-ead5f816b0ca',
    'Dell Gaming G15 5530',
    'laptop-gaming-dell-gaming-g15-5530-1012',
    'Intel Core i7-13650HX, RTX 4050 6GB, 16GB DDR5, 512GB SSD, 15.6 inch FHD 165Hz',
    'Dell Gaming G15 5530 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1012',
    24990000,
    28990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'DELL', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Dell%20Gaming%20G15%205530', '%20', '+'),
    'Dell Gaming G15 5530',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd9e0f08b-b06a-4fc7-a913-89395c331903',
    '59c7d85d-38e9-445e-b6ef-ead5f816b0ca',
    'Dell Gaming G16 7630',
    'laptop-gaming-dell-gaming-g16-7630-1013',
    'Intel Core i9-13900HX, RTX 4070 8GB, 32GB RAM, 1TB SSD, 16 inch QHD+ 240Hz',
    'Dell Gaming G16 7630 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1013',
    42990000,
    48990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'DELL', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Dell%20Gaming%20G16%207630', '%20', '+'),
    'Dell Gaming G16 7630',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd9e0f08b-b06a-4fc7-a913-89395c331903',
    '2ab38f62-f5bd-477f-b4b7-8e6ecc5b57bf',
    'Alienware m18 R2 Gaming Laptop',
    'laptop-gaming-alienware-m18-r2-gaming-laptop-1014',
    'Intel Core i9-14900HX, RTX 4090 16GB, 32GB DDR5, 2TB SSD, 18 inch QHD+ 165Hz',
    'Alienware m18 R2 Gaming Laptop chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1014',
    92990000,
    99990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'ALIENWARE', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Alienware%20m18%20R2%20Gaming%20Laptop', '%20', '+'),
    'Alienware m18 R2 Gaming Laptop',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd9e0f08b-b06a-4fc7-a913-89395c331903',
    '2ab38f62-f5bd-477f-b4b7-8e6ecc5b57bf',
    'Alienware x16 R2 Ultra-thin Gaming',
    'laptop-gaming-alienware-x16-r2-ultra-thin-gaming-1015',
    'Intel Core Ultra 9 185H, RTX 4080 12GB, 32GB LPDDR5X, 1TB SSD, 16 inch 240Hz',
    'Alienware x16 R2 Ultra-thin Gaming chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1015',
    78990000,
    85990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'ALIENWARE', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Alienware%20x16%20R2%20Ultra-thin%20Gaming', '%20', '+'),
    'Alienware x16 R2 Ultra-thin Gaming',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd9e0f08b-b06a-4fc7-a913-89395c331903',
    'df4cc519-b2f4-43e4-a09b-20280a7a532c',
    'HP Omen 16 (2024) wf1026TX',
    'laptop-gaming-hp-omen-16-2024-wf1026tx-1016',
    'Intel Core i7-14700HX, RTX 4070 8GB, 16GB DDR5, 1TB SSD, 16.1 inch QHD 240Hz',
    'HP Omen 16 (2024) wf1026TX chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1016',
    46990000,
    52990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'HP', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('HP%20Omen%2016%20(2024)%20wf1026TX', '%20', '+'),
    'HP Omen 16 (2024) wf1026TX',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd9e0f08b-b06a-4fc7-a913-89395c331903',
    'df4cc519-b2f4-43e4-a09b-20280a7a532c',
    'HP Victus 16-r0129TX',
    'laptop-gaming-hp-victus-16-r0129tx-1017',
    'Intel Core i7-13700H, RTX 4050 6GB, 16GB DDR5, 512GB SSD, 16.1 inch FHD 144Hz',
    'HP Victus 16-r0129TX chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1017',
    26490000,
    30990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'HP', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('HP%20Victus%2016-r0129TX', '%20', '+'),
    'HP Victus 16-r0129TX',
    1,
    true
  );
END $$;

-- ---------------------------------------------------------------------
-- DANH MỤC: LAPTOP VĂN PHÒNG (laptop-van-phong) - Bổ sung 10 sản phẩm -> Đủ 30 sản phẩm
-- ---------------------------------------------------------------------

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '2c8405b0-8197-4315-9152-675318862e00',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Apple MacBook Pro 16 M3 Max 36GB/1TB',
    'laptop-van-phong-apple-macbook-pro-16-m3-max-36gb-1tb-1018',
    'Chip Apple M3 Max 14-core CPU, 30-core GPU, 36GB Unified Memory, 1TB SSD, Liquid Retina XDR',
    'Apple MacBook Pro 16 M3 Max 36GB/1TB chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1018',
    89990000,
    94990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Apple%20MacBook%20Pro%2016%20M3%20Max%2036GB%2F1TB', '%20', '+'),
    'Apple MacBook Pro 16 M3 Max 36GB/1TB',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '2c8405b0-8197-4315-9152-675318862e00',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Apple MacBook Pro 14 M3 Pro 18GB/512GB',
    'laptop-van-phong-apple-macbook-pro-14-m3-pro-18gb-512gb-1019',
    'Chip Apple M3 Pro 11-core CPU, 14-core GPU, 18GB Unified Memory, 512GB SSD Space Black',
    'Apple MacBook Pro 14 M3 Pro 18GB/512GB chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1019',
    49990000,
    54990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Apple%20MacBook%20Pro%2014%20M3%20Pro%2018GB%2F512GB', '%20', '+'),
    'Apple MacBook Pro 14 M3 Pro 18GB/512GB',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '2c8405b0-8197-4315-9152-675318862e00',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Apple MacBook Air 15 M3 16GB/512GB',
    'laptop-van-phong-apple-macbook-air-15-m3-16gb-512gb-1020',
    'Chip M3 8-core CPU, 10-core GPU, 16GB RAM, 512GB SSD, Siêu mỏng nhẹ 1.51kg Starlight',
    'Apple MacBook Air 15 M3 16GB/512GB chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1020',
    37990000,
    41990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Apple%20MacBook%20Air%2015%20M3%2016GB%2F512GB', '%20', '+'),
    'Apple MacBook Air 15 M3 16GB/512GB',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '2c8405b0-8197-4315-9152-675318862e00',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Apple MacBook Air 13 M3 8GB/256GB',
    'laptop-van-phong-apple-macbook-air-13-m3-8gb-256gb-1021',
    'Chip Apple M3, 8GB RAM, 256GB SSD, Màn hình Liquid Retina 13.6 inch Midnight',
    'Apple MacBook Air 13 M3 8GB/256GB chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1021',
    26990000,
    29990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Apple%20MacBook%20Air%2013%20M3%208GB%2F256GB', '%20', '+'),
    'Apple MacBook Air 13 M3 8GB/256GB',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '2c8405b0-8197-4315-9152-675318862e00',
    '59c7d85d-38e9-445e-b6ef-ead5f816b0ca',
    'Dell XPS 14 9440 Intel Core Ultra 7',
    'laptop-van-phong-dell-xps-14-9440-intel-core-ultra-7-1022',
    'Intel Core Ultra 7 155H, 16GB LPDDR5X, 1TB SSD, 14.5 inch 3.2K OLED Touch 120Hz',
    'Dell XPS 14 9440 Intel Core Ultra 7 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1022',
    58990000,
    64990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'DELL', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Dell%20XPS%2014%209440%20Intel%20Core%20Ultra%207', '%20', '+'),
    'Dell XPS 14 9440 Intel Core Ultra 7',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '2c8405b0-8197-4315-9152-675318862e00',
    '59c7d85d-38e9-445e-b6ef-ead5f816b0ca',
    'Dell Inspiron 14 Plus 7440',
    'laptop-van-phong-dell-inspiron-14-plus-7440-1023',
    'Intel Core Ultra 7 155H, 16GB LPDDR5X, 1TB SSD, 14 inch 2.8K 90Hz Ice Blue',
    'Dell Inspiron 14 Plus 7440 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1023',
    27990000,
    30990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'DELL', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Dell%20Inspiron%2014%20Plus%207440', '%20', '+'),
    'Dell Inspiron 14 Plus 7440',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '2c8405b0-8197-4315-9152-675318862e00',
    'df4cc519-b2f4-43e4-a09b-20280a7a532c',
    'HP Spectre x360 14-eu0026TU 2-in-1',
    'laptop-van-phong-hp-spectre-x360-14-eu0026tu-2-in-1-1024',
    'Intel Core Ultra 7 155H, 32GB LPDDR5X, 1TB SSD, 14 inch 2.8K OLED Cảm ứng xoay gập',
    'HP Spectre x360 14-eu0026TU 2-in-1 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1024',
    43990000,
    47990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'HP', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('HP%20Spectre%20x360%2014-eu0026TU%202-in-1', '%20', '+'),
    'HP Spectre x360 14-eu0026TU 2-in-1',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '2c8405b0-8197-4315-9152-675318862e00',
    'df4cc519-b2f4-43e4-a09b-20280a7a532c',
    'HP Pavilion 14-dv2073TU',
    'laptop-van-phong-hp-pavilion-14-dv2073tu-1025',
    'Intel Core i5-1235U, 16GB DDR4, 512GB SSD, 14 inch FHD IPS Vàng Gold',
    'HP Pavilion 14-dv2073TU chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1025',
    15490000,
    17990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'HP', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('HP%20Pavilion%2014-dv2073TU', '%20', '+'),
    'HP Pavilion 14-dv2073TU',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '2c8405b0-8197-4315-9152-675318862e00',
    '7ba28e54-bf81-4a00-a287-a81281ed1134',
    'Lenovo ThinkPad X1 Carbon Gen 12',
    'laptop-van-phong-lenovo-thinkpad-x1-carbon-gen-12-1026',
    'Intel Core Ultra 7 155H, 32GB RAM, 1TB SSD, 14 inch 2.8K OLED Siêu nhẹ 1.09kg',
    'Lenovo ThinkPad X1 Carbon Gen 12 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1026',
    54990000,
    59990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'LENOVO', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Lenovo%20ThinkPad%20X1%20Carbon%20Gen%2012', '%20', '+'),
    'Lenovo ThinkPad X1 Carbon Gen 12',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '2c8405b0-8197-4315-9152-675318862e00',
    '060ca633-32c5-4788-9968-a9ead8e9b423',
    'LG gram Pro 16 2024 16Z90SP-G.AH76A5',
    'laptop-van-phong-lg-gram-pro-16-2024-16z90sp-g-ah76a5-1027',
    'Intel Core Ultra 7 155H, RTX 3050 4GB, 16GB RAM, 512GB SSD, Trọng lượng siêu thực 1.27kg',
    'LG gram Pro 16 2024 16Z90SP-G.AH76A5 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-LAPT-1027',
    42990000,
    48990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'LG', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('LG%20gram%20Pro%2016%202024%2016Z90SP-G.AH76A5', '%20', '+'),
    'LG gram Pro 16 2024 16Z90SP-G.AH76A5',
    1,
    true
  );
END $$;

-- ---------------------------------------------------------------------
-- DANH MỤC: KEYBOARDS (keyboards) - Bổ sung 22 sản phẩm -> Đủ 30 sản phẩm
-- ---------------------------------------------------------------------

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f15c6e06-8a54-4cba-878a-cfdcc8c026ae',
    'b76be2d6-fce2-4972-8745-af20a37d206f',
    'Bàn phím không dây Logitech MX Keys S',
    'keyboards-b-n-ph-m-kh-ng-d-y-logitech-mx-keys-s-1028',
    'Phím cơ cấu cắt kéo mượt mà, gõ thông minh, đèn nền tự động, Bluetooth & Logi Bolt',
    'Bàn phím không dây Logitech MX Keys S chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-KEYB-1028',
    2690000,
    3290000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Logitech', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('B%C3%A0n%20ph%C3%ADm%20kh%C3%B4ng%20d%C3%A2y%20Logitech%20MX%20Keys%20S', '%20', '+'),
    'Bàn phím không dây Logitech MX Keys S',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f15c6e06-8a54-4cba-878a-cfdcc8c026ae',
    'b76be2d6-fce2-4972-8745-af20a37d206f',
    'Bàn phím cơ Logitech MX Mechanical Mini',
    'keyboards-b-n-ph-m-c-logitech-mx-mechanical-mini-1029',
    'Switch cơ học Low Profile Tactile Quiet, kết nối 3 thiết bị, layout 75%',
    'Bàn phím cơ Logitech MX Mechanical Mini chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-KEYB-1029',
    3190000,
    3890000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Logitech', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('B%C3%A0n%20ph%C3%ADm%20c%C6%A1%20Logitech%20MX%20Mechanical%20Mini', '%20', '+'),
    'Bàn phím cơ Logitech MX Mechanical Mini',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f15c6e06-8a54-4cba-878a-cfdcc8c026ae',
    'b76be2d6-fce2-4972-8745-af20a37d206f',
    'Bàn phím không dây Logitech K380s Pebble 2',
    'keyboards-b-n-ph-m-kh-ng-d-y-logitech-k380s-pebble-2-1030',
    'Nhỏ gọn thời trang, kết nối đa thiết bị Easy-Switch, pin dùng đến 36 tháng',
    'Bàn phím không dây Logitech K380s Pebble 2 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-KEYB-1030',
    690000,
    890000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Logitech', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('B%C3%A0n%20ph%C3%ADm%20kh%C3%B4ng%20d%C3%A2y%20Logitech%20K380s%20Pebble%202', '%20', '+'),
    'Bàn phím không dây Logitech K380s Pebble 2',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f15c6e06-8a54-4cba-878a-cfdcc8c026ae',
    'b76be2d6-fce2-4972-8745-af20a37d206f',
    'Bàn phím cơ Logitech G512 RGB Carbon',
    'keyboards-b-n-ph-m-c-logitech-g512-rgb-carbon-1031',
    'Khung nhôm máy bay 5052, GX Brown switch, Lightsync RGB 16.8 triệu màu',
    'Bàn phím cơ Logitech G512 RGB Carbon chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-KEYB-1031',
    1890000,
    2490000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Logitech', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('B%C3%A0n%20ph%C3%ADm%20c%C6%A1%20Logitech%20G512%20RGB%20Carbon', '%20', '+'),
    'Bàn phím cơ Logitech G512 RGB Carbon',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f15c6e06-8a54-4cba-878a-cfdcc8c026ae',
    '17f517e8-9194-4e4f-bdb3-c86b85812e73',
    'Bàn phím cơ Razer BlackWidow V4 Pro',
    'keyboards-b-n-ph-m-c-razer-blackwidow-v4-pro-1032',
    'Green Mechanical Switch, núm xoay đa năng Razer Command Dial, led gầm rực rỡ',
    'Bàn phím cơ Razer BlackWidow V4 Pro chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-KEYB-1032',
    5890000,
    6790000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Razer', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('B%C3%A0n%20ph%C3%ADm%20c%C6%A1%20Razer%20BlackWidow%20V4%20Pro', '%20', '+'),
    'Bàn phím cơ Razer BlackWidow V4 Pro',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f15c6e06-8a54-4cba-878a-cfdcc8c026ae',
    '17f517e8-9194-4e4f-bdb3-c86b85812e73',
    'Bàn phím quang cơ Razer Huntsman Mini 60%',
    'keyboards-b-n-ph-m-quang-c-razer-huntsman-mini-60-1033',
    'Linear Optical Switch thế hệ 2, PBT Doubleshot keycap, thiết kế mini 60%',
    'Bàn phím quang cơ Razer Huntsman Mini 60% chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-KEYB-1033',
    2490000,
    3190000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Razer', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('B%C3%A0n%20ph%C3%ADm%20quang%20c%C6%A1%20Razer%20Huntsman%20Mini%2060%25', '%20', '+'),
    'Bàn phím quang cơ Razer Huntsman Mini 60%',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f15c6e06-8a54-4cba-878a-cfdcc8c026ae',
    '17f517e8-9194-4e4f-bdb3-c86b85812e73',
    'Bàn phím cơ không dây Razer DeathStalker V2 Pro',
    'keyboards-b-n-ph-m-c-kh-ng-d-y-razer-deathstalker-v2-pro-1034',
    'Switch quang học Low Profile siêu nhạy, HyperSpeed Wireless 2.4GHz & Bluetooth',
    'Bàn phím cơ không dây Razer DeathStalker V2 Pro chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-KEYB-1034',
    4990000,
    5990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Razer', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('B%C3%A0n%20ph%C3%ADm%20c%C6%A1%20kh%C3%B4ng%20d%C3%A2y%20Razer%20DeathStalker%20V2%20Pro', '%20', '+'),
    'Bàn phím cơ không dây Razer DeathStalker V2 Pro',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f15c6e06-8a54-4cba-878a-cfdcc8c026ae',
    '17f517e8-9194-4e4f-bdb3-c86b85812e73',
    'Bàn phím giả cơ Razer Ornata V3 X',
    'keyboards-b-n-ph-m-gi-c-razer-ornata-v3-x-1035',
    'Phím bấm đệm êm, chống tràn nước bền bỉ, Razer Chroma RGB đơn vùng',
    'Bàn phím giả cơ Razer Ornata V3 X chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-KEYB-1035',
    990000,
    1390000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Razer', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('B%C3%A0n%20ph%C3%ADm%20gi%E1%BA%A3%20c%C6%A1%20Razer%20Ornata%20V3%20X', '%20', '+'),
    'Bàn phím giả cơ Razer Ornata V3 X',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f15c6e06-8a54-4cba-878a-cfdcc8c026ae',
    '95935020-183f-44cc-a477-2a559734bdad',
    'Bàn phím cơ ASUS ROG Azoth 75% OLED',
    'keyboards-b-n-ph-m-c-asus-rog-azoth-75-oled-1036',
    'Màn hình OLED hiển thị, Gasket Mount 3 lớp đệm, switch ROG NX Snow lube sẵn',
    'Bàn phím cơ ASUS ROG Azoth 75% OLED chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-KEYB-1036',
    5790000,
    6590000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'ASUS', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('B%C3%A0n%20ph%C3%ADm%20c%C6%A1%20ASUS%20ROG%20Azoth%2075%25%20OLED', '%20', '+'),
    'Bàn phím cơ ASUS ROG Azoth 75% OLED',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f15c6e06-8a54-4cba-878a-cfdcc8c026ae',
    '95935020-183f-44cc-a477-2a559734bdad',
    'Bàn phím cơ ASUS ROG Strix Scope II 96 Wireless',
    'keyboards-b-n-ph-m-c-asus-rog-strix-scope-ii-96-wireless-1037',
    'Layout 96% đầy đủ phím số, đệm tiêu âm tích hợp, hot-swap 5-pin',
    'Bàn phím cơ ASUS ROG Strix Scope II 96 Wireless chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-KEYB-1037',
    3890000,
    4490000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'ASUS', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('B%C3%A0n%20ph%C3%ADm%20c%C6%A1%20ASUS%20ROG%20Strix%20Scope%20II%2096%20Wireless', '%20', '+'),
    'Bàn phím cơ ASUS ROG Strix Scope II 96 Wireless',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f15c6e06-8a54-4cba-878a-cfdcc8c026ae',
    '95935020-183f-44cc-a477-2a559734bdad',
    'Bàn phím cơ ASUS TUF Gaming K3 Gen II',
    'keyboards-b-n-ph-m-c-asus-tuf-gaming-k3-gen-ii-1038',
    'Chuẩn chống nước bụi IP57, switch cơ học quang học, đèn nền RGB từng phím',
    'Bàn phím cơ ASUS TUF Gaming K3 Gen II chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-KEYB-1038',
    1390000,
    1790000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'ASUS', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('B%C3%A0n%20ph%C3%ADm%20c%C6%A1%20ASUS%20TUF%20Gaming%20K3%20Gen%20II', '%20', '+'),
    'Bàn phím cơ ASUS TUF Gaming K3 Gen II',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f15c6e06-8a54-4cba-878a-cfdcc8c026ae',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Bàn phím Apple Magic Keyboard Touch ID Numeric',
    'keyboards-b-n-ph-m-apple-magic-keyboard-touch-id-numeric-1039',
    'Bàn phím Apple chính hãng tích hợp Touch ID mở khóa nhanh, hàng phím số đầy đủ',
    'Bàn phím Apple Magic Keyboard Touch ID Numeric chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-KEYB-1039',
    4490000,
    4990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('B%C3%A0n%20ph%C3%ADm%20Apple%20Magic%20Keyboard%20Touch%20ID%20Numeric', '%20', '+'),
    'Bàn phím Apple Magic Keyboard Touch ID Numeric',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f15c6e06-8a54-4cba-878a-cfdcc8c026ae',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Bàn phím Apple Magic Keyboard 2 White',
    'keyboards-b-n-ph-m-apple-magic-keyboard-2-white-1040',
    'Phím cắt kéo cực êm, kết nối tự động với máy Mac, sạc Type-C thế hệ mới',
    'Bàn phím Apple Magic Keyboard 2 White chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-KEYB-1040',
    2490000,
    2990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('B%C3%A0n%20ph%C3%ADm%20Apple%20Magic%20Keyboard%202%20White', '%20', '+'),
    'Bàn phím Apple Magic Keyboard 2 White',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f15c6e06-8a54-4cba-878a-cfdcc8c026ae',
    '9608b564-cbe0-4ad5-adda-72a37cb87bd6',
    'Bàn phím không dây Xiaomi MIIIW Dual Mode',
    'keyboards-b-n-ph-m-kh-ng-d-y-xiaomi-miiiw-dual-mode-1041',
    'Hỗ trợ Bluetooth và USB 2.4Ghz, thiết kế phím tròn cổ điển thanh lịch',
    'Bàn phím không dây Xiaomi MIIIW Dual Mode chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-KEYB-1041',
    550000,
    750000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Xiaomi', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('B%C3%A0n%20ph%C3%ADm%20kh%C3%B4ng%20d%C3%A2y%20Xiaomi%20MIIIW%20Dual%20Mode', '%20', '+'),
    'Bàn phím không dây Xiaomi MIIIW Dual Mode',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f15c6e06-8a54-4cba-878a-cfdcc8c026ae',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Bàn phím Bluetooth Baseus K01B Tri-Mode',
    'keyboards-b-n-ph-m-bluetooth-baseus-k01b-tri-mode-1042',
    'Kết nối cùng lúc 3 thiết bị Laptop, Tablet, Điện thoại, phím bấm êm ái silent',
    'Bàn phím Bluetooth Baseus K01B Tri-Mode chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-KEYB-1042',
    450000,
    650000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('B%C3%A0n%20ph%C3%ADm%20Bluetooth%20Baseus%20K01B%20Tri-Mode', '%20', '+'),
    'Bàn phím Bluetooth Baseus K01B Tri-Mode',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f15c6e06-8a54-4cba-878a-cfdcc8c026ae',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Bàn phím cơ không dây Ugreen KU102 89 phím',
    'keyboards-b-n-ph-m-c-kh-ng-d-y-ugreen-ku102-89-ph-m-1043',
    'Switch Brown gõ đầm tay, kết nối có dây Type-C & Bluetooth 5.0, pin 180 giờ',
    'Bàn phím cơ không dây Ugreen KU102 89 phím chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-KEYB-1043',
    1190000,
    1590000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('B%C3%A0n%20ph%C3%ADm%20c%C6%A1%20kh%C3%B4ng%20d%C3%A2y%20Ugreen%20KU102%2089%20ph%C3%ADm', '%20', '+'),
    'Bàn phím cơ không dây Ugreen KU102 89 phím',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f15c6e06-8a54-4cba-878a-cfdcc8c026ae',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Bàn phím văn phòng siêu mỏng Ugreen KU004',
    'keyboards-b-n-ph-m-v-n-ph-ng-si-u-m-ng-ugreen-ku004-1044',
    'Layout Fullsize 104 phím, phím bấm dạng chiclet êm tay không gây ồn',
    'Bàn phím văn phòng siêu mỏng Ugreen KU004 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-KEYB-1044',
    320000,
    450000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('B%C3%A0n%20ph%C3%ADm%20v%C4%83n%20ph%C3%B2ng%20si%C3%AAu%20m%E1%BB%8Fng%20Ugreen%20KU004', '%20', '+'),
    'Bàn phím văn phòng siêu mỏng Ugreen KU004',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f15c6e06-8a54-4cba-878a-cfdcc8c026ae',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Bàn phím Bluetooth siêu mỏng Anker Ultra-Compact',
    'keyboards-b-n-ph-m-bluetooth-si-u-m-ng-anker-ultra-compact-1045',
    'Thời lượng pin 6 tháng, tương thích hoàn hảo iOS, Android, Windows, Mac',
    'Bàn phím Bluetooth siêu mỏng Anker Ultra-Compact chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-KEYB-1045',
    490000,
    690000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('B%C3%A0n%20ph%C3%ADm%20Bluetooth%20si%C3%AAu%20m%E1%BB%8Fng%20Anker%20Ultra-Compact', '%20', '+'),
    'Bàn phím Bluetooth siêu mỏng Anker Ultra-Compact',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f15c6e06-8a54-4cba-878a-cfdcc8c026ae',
    'd00bd89f-fa7e-4732-ba0b-6623f6f779d0',
    'Bàn phím cơ HyperX Alloy Origins Core RGB',
    'keyboards-b-n-ph-m-c-hyperx-alloy-origins-core-rgb-1046',
    'Khung nhôm nguyên khối chuẩn máy bay, HyperX Red Linear switch, TKL 80%',
    'Bàn phím cơ HyperX Alloy Origins Core RGB chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-KEYB-1046',
    1990000,
    2490000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Kingston', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('B%C3%A0n%20ph%C3%ADm%20c%C6%A1%20HyperX%20Alloy%20Origins%20Core%20RGB', '%20', '+'),
    'Bàn phím cơ HyperX Alloy Origins Core RGB',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f15c6e06-8a54-4cba-878a-cfdcc8c026ae',
    'd00bd89f-fa7e-4732-ba0b-6623f6f779d0',
    'Bàn phím cơ HyperX Alloy Rise 75 Gaming',
    'keyboards-b-n-ph-m-c-hyperx-alloy-rise-75-gaming-1047',
    'Gasket mount cao cấp, Hot-swap switch thay nóng nhanh chóng, cảm biến ánh sáng',
    'Bàn phím cơ HyperX Alloy Rise 75 Gaming chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-KEYB-1047',
    4290000,
    4990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Kingston', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('B%C3%A0n%20ph%C3%ADm%20c%C6%A1%20HyperX%20Alloy%20Rise%2075%20Gaming', '%20', '+'),
    'Bàn phím cơ HyperX Alloy Rise 75 Gaming',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f15c6e06-8a54-4cba-878a-cfdcc8c026ae',
    'eea3503a-05e7-4471-839c-ec14d82e8bf9',
    'Bàn phím cơ Acer Predator Aethon 301 TKL',
    'keyboards-b-n-ph-m-c-acer-predator-aethon-301-tkl-1048',
    'Outemu Blue switch gõ nảy tanh tách, 6 vùng đèn nền sinh động',
    'Bàn phím cơ Acer Predator Aethon 301 TKL chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-KEYB-1048',
    1290000,
    1690000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'ACER', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('B%C3%A0n%20ph%C3%ADm%20c%C6%A1%20Acer%20Predator%20Aethon%20301%20TKL', '%20', '+'),
    'Bàn phím cơ Acer Predator Aethon 301 TKL',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f15c6e06-8a54-4cba-878a-cfdcc8c026ae',
    '7ba28e54-bf81-4a00-a287-a81281ed1134',
    'Bàn phím cơ Lenovo Legion K500 RGB Gaming',
    'keyboards-b-n-ph-m-c-lenovo-legion-k500-rgb-gaming-1049',
    'Phím cơ Red switch êm ái, kê tay tháo rời thoải mái khi chơi game kéo dài',
    'Bàn phím cơ Lenovo Legion K500 RGB Gaming chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-KEYB-1049',
    1490000,
    1990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'LENOVO', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('B%C3%A0n%20ph%C3%ADm%20c%C6%A1%20Lenovo%20Legion%20K500%20RGB%20Gaming', '%20', '+'),
    'Bàn phím cơ Lenovo Legion K500 RGB Gaming',
    1,
    true
  );
END $$;

-- ---------------------------------------------------------------------
-- DANH MỤC: MICE (mice) - Bổ sung 22 sản phẩm -> Đủ 30 sản phẩm
-- ---------------------------------------------------------------------

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'ad83184f-1ea2-4a4e-a0fa-ea5e69f2123a',
    'b76be2d6-fce2-4972-8745-af20a37d206f',
    'Chuột không dây Logitech MX Master 3S',
    'mice-chu-t-kh-ng-d-y-logitech-mx-master-3s-1050',
    'Cảm biến 8000 DPI Darkfield lướt trên kính, con lăn từ tính MagSpeed, click êm Silent',
    'Chuột không dây Logitech MX Master 3S chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-MICE-1050',
    2390000,
    2990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Logitech', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Chu%E1%BB%99t%20kh%C3%B4ng%20d%C3%A2y%20Logitech%20MX%20Master%203S', '%20', '+'),
    'Chuột không dây Logitech MX Master 3S',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'ad83184f-1ea2-4a4e-a0fa-ea5e69f2123a',
    'b76be2d6-fce2-4972-8745-af20a37d206f',
    'Chuột Logitech G PRO X Superlight 2 DEX',
    'mice-chu-t-logitech-g-pro-x-superlight-2-dex-1051',
    'Thiết kế công thái học bất đối xứng, siêu nhẹ 60g, cảm biến HERO 2 32.000 DPI',
    'Chuột Logitech G PRO X Superlight 2 DEX chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-MICE-1051',
    3890000,
    4390000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Logitech', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Chu%E1%BB%99t%20Logitech%20G%20PRO%20X%20Superlight%202%20DEX', '%20', '+'),
    'Chuột Logitech G PRO X Superlight 2 DEX',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'ad83184f-1ea2-4a4e-a0fa-ea5e69f2123a',
    'b76be2d6-fce2-4972-8745-af20a37d206f',
    'Chuột không dây Logitech Lift Vertical Công thái học',
    'mice-chu-t-kh-ng-d-y-logitech-lift-vertical-c-ng-th-i-h-c-1052',
    'Góc nghiêng 57 độ giảm áp lực cổ tay, nút bấm êm dịu, phù hợp tay vừa và nhỏ',
    'Chuột không dây Logitech Lift Vertical Công thái học chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-MICE-1052',
    1490000,
    1790000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Logitech', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Chu%E1%BB%99t%20kh%C3%B4ng%20d%C3%A2y%20Logitech%20Lift%20Vertical%20C%C3%B4ng%20th%C3%A1i%20h%E1%BB%8Dc', '%20', '+'),
    'Chuột không dây Logitech Lift Vertical Công thái học',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'ad83184f-1ea2-4a4e-a0fa-ea5e69f2123a',
    'b76be2d6-fce2-4972-8745-af20a37d206f',
    'Chuột không dây Logitech Pebble M350s 2',
    'mice-chu-t-kh-ng-d-y-logitech-pebble-m350s-2-1053',
    'Thiết kế dẹt bo tròn trẻ trung, siêu yên tĩnh Silent Touch, kết nối Bluetooth',
    'Chuột không dây Logitech Pebble M350s 2 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-MICE-1053',
    450000,
    590000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Logitech', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Chu%E1%BB%99t%20kh%C3%B4ng%20d%C3%A2y%20Logitech%20Pebble%20M350s%202', '%20', '+'),
    'Chuột không dây Logitech Pebble M350s 2',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'ad83184f-1ea2-4a4e-a0fa-ea5e69f2123a',
    '17f517e8-9194-4e4f-bdb3-c86b85812e73',
    'Chuột không dây Razer Viper V3 Pro Ultra-lightweight',
    'mice-chu-t-kh-ng-d-y-razer-viper-v3-pro-ultra-lightweight-1054',
    'Trọng lượng siêu nhẹ chỉ 54g, cảm biến Focus Pro 35K Gen-2, tần số quét 8000Hz',
    'Chuột không dây Razer Viper V3 Pro Ultra-lightweight chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-MICE-1054',
    3990000,
    4590000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Razer', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Chu%E1%BB%99t%20kh%C3%B4ng%20d%C3%A2y%20Razer%20Viper%20V3%20Pro%20Ultra-lightweight', '%20', '+'),
    'Chuột không dây Razer Viper V3 Pro Ultra-lightweight',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'ad83184f-1ea2-4a4e-a0fa-ea5e69f2123a',
    '17f517e8-9194-4e4f-bdb3-c86b85812e73',
    'Chuột chơi game Razer Basilisk V3 Pro 35K',
    'mice-chu-t-ch-i-game-razer-basilisk-v3-pro-35k-1055',
    '13 nút bấm tùy chỉnh, con lăn Razer HyperScroll Tilt Wheel, sạc không dây Qi',
    'Chuột chơi game Razer Basilisk V3 Pro 35K chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-MICE-1055',
    3690000,
    4290000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Razer', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Chu%E1%BB%99t%20ch%C6%A1i%20game%20Razer%20Basilisk%20V3%20Pro%2035K', '%20', '+'),
    'Chuột chơi game Razer Basilisk V3 Pro 35K',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'ad83184f-1ea2-4a4e-a0fa-ea5e69f2123a',
    '17f517e8-9194-4e4f-bdb3-c86b85812e73',
    'Chuột Razer Cobra Pro RGB Wireless',
    'mice-chu-t-razer-cobra-pro-rgb-wireless-1056',
    '11 vùng Chroma RGB phát sáng, Switch quang học Gen 3 không lo double-click',
    'Chuột Razer Cobra Pro RGB Wireless chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-MICE-1056',
    2790000,
    3390000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Razer', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Chu%E1%BB%99t%20Razer%20Cobra%20Pro%20RGB%20Wireless', '%20', '+'),
    'Chuột Razer Cobra Pro RGB Wireless',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'ad83184f-1ea2-4a4e-a0fa-ea5e69f2123a',
    '17f517e8-9194-4e4f-bdb3-c86b85812e73',
    'Chuột không dây công thái học Razer Pro Click Mini',
    'mice-chu-t-kh-ng-d-y-c-ng-th-i-h-c-razer-pro-click-mini-1057',
    'Con lăn 4 chiều tự do, độ ồn switch cực thấp chuyên dùng phòng họp văn phòng',
    'Chuột không dây công thái học Razer Pro Click Mini chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-MICE-1057',
    1890000,
    2290000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Razer', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Chu%E1%BB%99t%20kh%C3%B4ng%20d%C3%A2y%20c%C3%B4ng%20th%C3%A1i%20h%E1%BB%8Dc%20Razer%20Pro%20Click%20Mini', '%20', '+'),
    'Chuột không dây công thái học Razer Pro Click Mini',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'ad83184f-1ea2-4a4e-a0fa-ea5e69f2123a',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Chuột Apple Magic Mouse 2 Black USB-C',
    'mice-chu-t-apple-magic-mouse-2-black-usb-c-1058',
    'Mặt kính cảm ứng Multi-Touch vuốt cuộn mượt mà, cổng sạc Type-C màu đen bóng bẩy',
    'Chuột Apple Magic Mouse 2 Black USB-C chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-MICE-1058',
    2390000,
    2690000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Chu%E1%BB%99t%20Apple%20Magic%20Mouse%202%20Black%20USB-C', '%20', '+'),
    'Chuột Apple Magic Mouse 2 Black USB-C',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'ad83184f-1ea2-4a4e-a0fa-ea5e69f2123a',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Chuột Apple Magic Mouse 2 White USB-C',
    'mice-chu-t-apple-magic-mouse-2-white-usb-c-1059',
    'Chính hãng Apple, bề mặt cảm ứng liền mạch di chuyển mượt mọi bề mặt',
    'Chuột Apple Magic Mouse 2 White USB-C chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-MICE-1059',
    1990000,
    2390000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Chu%E1%BB%99t%20Apple%20Magic%20Mouse%202%20White%20USB-C', '%20', '+'),
    'Chuột Apple Magic Mouse 2 White USB-C',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'ad83184f-1ea2-4a4e-a0fa-ea5e69f2123a',
    '95935020-183f-44cc-a477-2a559734bdad',
    'Chuột ASUS ROG Harpe Ace Aim Lab Edition',
    'mice-chu-t-asus-rog-harpe-ace-aim-lab-edition-1060',
    'Trọng lượng lông vũ 54g, tối ưu hóa bởi các tuyển thủ esports Aim Lab',
    'Chuột ASUS ROG Harpe Ace Aim Lab Edition chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-MICE-1060',
    3190000,
    3690000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'ASUS', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Chu%E1%BB%99t%20ASUS%20ROG%20Harpe%20Ace%20Aim%20Lab%20Edition', '%20', '+'),
    'Chuột ASUS ROG Harpe Ace Aim Lab Edition',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'ad83184f-1ea2-4a4e-a0fa-ea5e69f2123a',
    '95935020-183f-44cc-a477-2a559734bdad',
    'Chuột ASUS ROG Gladius III Wireless AimPoint',
    'mice-chu-t-asus-rog-gladius-iii-wireless-aimpoint-1061',
    'Cảm biến ROG AimPoint 36.000 DPI, Push-Fit Switch Socket II thay switch dễ dàng',
    'Chuột ASUS ROG Gladius III Wireless AimPoint chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-MICE-1061',
    2190000,
    2690000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'ASUS', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Chu%E1%BB%99t%20ASUS%20ROG%20Gladius%20III%20Wireless%20AimPoint', '%20', '+'),
    'Chuột ASUS ROG Gladius III Wireless AimPoint',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'ad83184f-1ea2-4a4e-a0fa-ea5e69f2123a',
    '95935020-183f-44cc-a477-2a559734bdad',
    'Chuột không dây ASUS SmartO Mouse MD200',
    'mice-chu-t-kh-ng-d-y-asus-smarto-mouse-md200-1062',
    'Độ bền switch 10 triệu lần nhấn, có quai xách tiện lợi cho nhân viên văn phòng',
    'Chuột không dây ASUS SmartO Mouse MD200 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-MICE-1062',
    950000,
    1250000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'ASUS', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Chu%E1%BB%99t%20kh%C3%B4ng%20d%C3%A2y%20ASUS%20SmartO%20Mouse%20MD200', '%20', '+'),
    'Chuột không dây ASUS SmartO Mouse MD200',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'ad83184f-1ea2-4a4e-a0fa-ea5e69f2123a',
    '9608b564-cbe0-4ad5-adda-72a37cb87bd6',
    'Chuột không dây Xiaomi Dual Mode Wireless Mouse Silent',
    'mice-chu-t-kh-ng-d-y-xiaomi-dual-mode-wireless-mouse-silent-1063',
    '2 chế độ Bluetooth & USB receiver 2.4GHz, nút bấm chống ồn ban đêm',
    'Chuột không dây Xiaomi Dual Mode Wireless Mouse Silent chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-MICE-1063',
    290000,
    390000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Xiaomi', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Chu%E1%BB%99t%20kh%C3%B4ng%20d%C3%A2y%20Xiaomi%20Dual%20Mode%20Wireless%20Mouse%20Silent', '%20', '+'),
    'Chuột không dây Xiaomi Dual Mode Wireless Mouse Silent',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'ad83184f-1ea2-4a4e-a0fa-ea5e69f2123a',
    '9608b564-cbe0-4ad5-adda-72a37cb87bd6',
    'Chuột công thái học Xiaomi Wireless Mouse 3',
    'mice-chu-t-c-ng-th-i-h-c-xiaomi-wireless-mouse-3-1064',
    'Thiết kế ôm sát lòng bàn tay, phím cạnh hông tiện lợi chuyển trang nhanh',
    'Chuột công thái học Xiaomi Wireless Mouse 3 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-MICE-1064',
    350000,
    480000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Xiaomi', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Chu%E1%BB%99t%20c%C3%B4ng%20th%C3%A1i%20h%E1%BB%8Dc%20Xiaomi%20Wireless%20Mouse%203', '%20', '+'),
    'Chuột công thái học Xiaomi Wireless Mouse 3',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'ad83184f-1ea2-4a4e-a0fa-ea5e69f2123a',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Chuột không dây Baseus F01B Tri-Mode Silent',
    'mice-chu-t-kh-ng-d-y-baseus-f01b-tri-mode-silent-1065',
    'Điều chỉnh 3 mức DPI 800/1200/1600, thiết kế thanh lịch sang trọng',
    'Chuột không dây Baseus F01B Tri-Mode Silent chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-MICE-1065',
    280000,
    390000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Chu%E1%BB%99t%20kh%C3%B4ng%20d%C3%A2y%20Baseus%20F01B%20Tri-Mode%20Silent', '%20', '+'),
    'Chuột không dây Baseus F01B Tri-Mode Silent',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'ad83184f-1ea2-4a4e-a0fa-ea5e69f2123a',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Chuột công thái học không dây Ugreen Ergonomic 4000 DPI',
    'mice-chu-t-c-ng-th-i-h-c-kh-ng-d-y-ugreen-ergonomic-4000-dpi-1066',
    'Thiết kế uốn lượn nâng đỡ ngón tay cái, 5 mức DPI tùy chỉnh linh hoạt',
    'Chuột công thái học không dây Ugreen Ergonomic 4000 DPI chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-MICE-1066',
    390000,
    520000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Chu%E1%BB%99t%20c%C3%B4ng%20th%C3%A1i%20h%E1%BB%8Dc%20kh%C3%B4ng%20d%C3%A2y%20Ugreen%20Ergonomic%204000%20DPI', '%20', '+'),
    'Chuột công thái học không dây Ugreen Ergonomic 4000 DPI',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'ad83184f-1ea2-4a4e-a0fa-ea5e69f2123a',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Chuột không dây mỏng nhẹ Ugreen MU006 2.4G/Bluetooth',
    'mice-chu-t-kh-ng-d-y-m-ng-nh-ugreen-mu006-2-4g-bluetooth-1067',
    'Thiết kế thời trang, dễ dàng cất vào túi chống sốc laptop khi đi cà phê làm việc',
    'Chuột không dây mỏng nhẹ Ugreen MU006 2.4G/Bluetooth chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-MICE-1067',
    290000,
    400000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Chu%E1%BB%99t%20kh%C3%B4ng%20d%C3%A2y%20m%E1%BB%8Fng%20nh%E1%BA%B9%20Ugreen%20MU006%202.4G%2FBluetooth', '%20', '+'),
    'Chuột không dây mỏng nhẹ Ugreen MU006 2.4G/Bluetooth',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'ad83184f-1ea2-4a4e-a0fa-ea5e69f2123a',
    'd00bd89f-fa7e-4732-ba0b-6623f6f779d0',
    'Chuột gaming HyperX Pulsefire Haste 2 Wireless',
    'mice-chu-t-gaming-hyperx-pulsefire-haste-2-wireless-1068',
    'Vỏ liền siêu nhẹ 61g, pin lên tới 100 giờ, cảm biến HyperX 26K độc quyền',
    'Chuột gaming HyperX Pulsefire Haste 2 Wireless chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-MICE-1068',
    1890000,
    2290000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Kingston', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Chu%E1%BB%99t%20gaming%20HyperX%20Pulsefire%20Haste%202%20Wireless', '%20', '+'),
    'Chuột gaming HyperX Pulsefire Haste 2 Wireless',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'ad83184f-1ea2-4a4e-a0fa-ea5e69f2123a',
    'd00bd89f-fa7e-4732-ba0b-6623f6f779d0',
    'Chuột gaming HyperX Pulsefire Core RGB',
    'mice-chu-t-gaming-hyperx-pulsefire-core-rgb-1069',
    'Cảm biến quang học Pixart 3327, 7 nút lập trình marco, đèn RGB rực rỡ',
    'Chuột gaming HyperX Pulsefire Core RGB chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-MICE-1069',
    590000,
    790000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Kingston', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Chu%E1%BB%99t%20gaming%20HyperX%20Pulsefire%20Core%20RGB', '%20', '+'),
    'Chuột gaming HyperX Pulsefire Core RGB',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'ad83184f-1ea2-4a4e-a0fa-ea5e69f2123a',
    '59c7d85d-38e9-445e-b6ef-ead5f816b0ca',
    'Chuột không dây Dell Premier Rechargeable WM527',
    'mice-chu-t-kh-ng-d-y-dell-premier-rechargeable-wm527-1070',
    'Thiết kế vòm cao cấp, kết nối Bluetooth 4.0 và 2.4GHz pin sạc tiện lợi',
    'Chuột không dây Dell Premier Rechargeable WM527 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-MICE-1070',
    1190000,
    1490000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'DELL', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Chu%E1%BB%99t%20kh%C3%B4ng%20d%C3%A2y%20Dell%20Premier%20Rechargeable%20WM527', '%20', '+'),
    'Chuột không dây Dell Premier Rechargeable WM527',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'ad83184f-1ea2-4a4e-a0fa-ea5e69f2123a',
    '7ba28e54-bf81-4a00-a287-a81281ed1134',
    'Chuột không dây Lenovo Legion M600s Qi Wireless',
    'mice-chu-t-kh-ng-d-y-lenovo-legion-m600s-qi-wireless-1071',
    'Hỗ trợ sạc không dây chuẩn Qi, chân chuột 100% PTFE di siêu mượt',
    'Chuột không dây Lenovo Legion M600s Qi Wireless chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-MICE-1071',
    1790000,
    2190000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'LENOVO', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Chu%E1%BB%99t%20kh%C3%B4ng%20d%C3%A2y%20Lenovo%20Legion%20M600s%20Qi%20Wireless', '%20', '+'),
    'Chuột không dây Lenovo Legion M600s Qi Wireless',
    1,
    true
  );
END $$;

-- ---------------------------------------------------------------------
-- DANH MỤC: HEADPHONES (headphones) - Bổ sung 22 sản phẩm -> Đủ 30 sản phẩm
-- ---------------------------------------------------------------------

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '8a691ed1-c008-4a7a-843f-39c34247c648',
    '1eb3e63f-975a-4847-a930-4480d7cfee63',
    'Tai nghe chống ồn không dây Sony WH-1000XM5',
    'headphones-tai-nghe-ch-ng-n-kh-ng-d-y-sony-wh-1000xm5-1072',
    'Chống ồn đỉnh cao Auto NC Optimizer, 8 micro thoại rõ nét, pin 30 giờ sạc nhanh',
    'Tai nghe chống ồn không dây Sony WH-1000XM5 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HEAD-1072',
    7990000,
    8990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Sony', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Tai%20nghe%20ch%E1%BB%91ng%20%E1%BB%93n%20kh%C3%B4ng%20d%C3%A2y%20Sony%20WH-1000XM5', '%20', '+'),
    'Tai nghe chống ồn không dây Sony WH-1000XM5',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '8a691ed1-c008-4a7a-843f-39c34247c648',
    '1eb3e63f-975a-4847-a930-4480d7cfee63',
    'Tai nghe True Wireless Sony WF-1000XM5',
    'headphones-tai-nghe-true-wireless-sony-wf-1000xm5-1073',
    'Driver Dynamic X mang lại âm thanh Hi-Res Audio, 2 chip xử lý chống ồn V2 & QN2e',
    'Tai nghe True Wireless Sony WF-1000XM5 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HEAD-1073',
    5490000,
    6490000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Sony', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Tai%20nghe%20True%20Wireless%20Sony%20WF-1000XM5', '%20', '+'),
    'Tai nghe True Wireless Sony WF-1000XM5',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '8a691ed1-c008-4a7a-843f-39c34247c648',
    '1eb3e63f-975a-4847-a930-4480d7cfee63',
    'Tai nghe chụp tai Sony WH-CH720N Noise Canceling',
    'headphones-tai-nghe-ch-p-tai-sony-wh-ch720n-noise-canceling-1074',
    'Trọng lượng siêu nhẹ 192g, chip chống ồn V1 tương tự dòng flagship XM5',
    'Tai nghe chụp tai Sony WH-CH720N Noise Canceling chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HEAD-1074',
    2390000,
    2890000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Sony', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Tai%20nghe%20ch%E1%BB%A5p%20tai%20Sony%20WH-CH720N%20Noise%20Canceling', '%20', '+'),
    'Tai nghe chụp tai Sony WH-CH720N Noise Canceling',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '8a691ed1-c008-4a7a-843f-39c34247c648',
    '1eb3e63f-975a-4847-a930-4480d7cfee63',
    'Tai nghe nhét tai Sony MDR-XB55AP Extra Bass',
    'headphones-tai-nghe-nh-t-tai-sony-mdr-xb55ap-extra-bass-1075',
    'Công nghệ Powered Bass Duct++ cho âm trầm cực sâu, có mic đàm thoại',
    'Tai nghe nhét tai Sony MDR-XB55AP Extra Bass chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HEAD-1075',
    690000,
    890000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Sony', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Tai%20nghe%20nh%C3%A9t%20tai%20Sony%20MDR-XB55AP%20Extra%20Bass', '%20', '+'),
    'Tai nghe nhét tai Sony MDR-XB55AP Extra Bass',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '8a691ed1-c008-4a7a-843f-39c34247c648',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Tai nghe Apple AirPods Max USB-C 2024',
    'headphones-tai-nghe-apple-airpods-max-usb-c-2024-1076',
    'Âm thanh không gian cá nhân hóa, chống ồn chủ động chuyên nghiệp, vỏ nhôm nguyên khối',
    'Tai nghe Apple AirPods Max USB-C 2024 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HEAD-1076',
    13490000,
    14490000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Tai%20nghe%20Apple%20AirPods%20Max%20USB-C%202024', '%20', '+'),
    'Tai nghe Apple AirPods Max USB-C 2024',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '8a691ed1-c008-4a7a-843f-39c34247c648',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Tai nghe Apple AirPods Pro 2 MagSafe USB-C',
    'headphones-tai-nghe-apple-airpods-pro-2-magsafe-usb-c-1077',
    'Chip H2, chống ồn gấp 2 lần thế hệ cũ, âm thanh thích ứng Adaptive Audio',
    'Tai nghe Apple AirPods Pro 2 MagSafe USB-C chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HEAD-1077',
    5490000,
    6190000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Tai%20nghe%20Apple%20AirPods%20Pro%202%20MagSafe%20USB-C', '%20', '+'),
    'Tai nghe Apple AirPods Pro 2 MagSafe USB-C',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '8a691ed1-c008-4a7a-843f-39c34247c648',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Tai nghe Apple AirPods 4 Chống ồn chủ động ANC',
    'headphones-tai-nghe-apple-airpods-4-ch-ng-n-ch-ng-anc-1078',
    'AirPods 4 thế hệ mới nhất với tính năng khử ồn chủ động lần đầu xuất hiện trên bản open-ear',
    'Tai nghe Apple AirPods 4 Chống ồn chủ động ANC chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HEAD-1078',
    4490000,
    4890000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Tai%20nghe%20Apple%20AirPods%204%20Ch%E1%BB%91ng%20%E1%BB%93n%20ch%E1%BB%A7%20%C4%91%E1%BB%99ng%20ANC', '%20', '+'),
    'Tai nghe Apple AirPods 4 Chống ồn chủ động ANC',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '8a691ed1-c008-4a7a-843f-39c34247c648',
    'b8c76d96-4ff5-4599-bf0f-ae4c64113a94',
    'Tai nghe chụp tai JBL Tune 770NC Chống ồn',
    'headphones-tai-nghe-ch-p-tai-jbl-tune-770nc-ch-ng-n-1079',
    'Âm bass thuần khiết JBL Pure Bass Sound, pin khủng tới 70 giờ, Bluetooth 5.3',
    'Tai nghe chụp tai JBL Tune 770NC Chống ồn chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HEAD-1079',
    2490000,
    2990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'JBL', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Tai%20nghe%20ch%E1%BB%A5p%20tai%20JBL%20Tune%20770NC%20Ch%E1%BB%91ng%20%E1%BB%93n', '%20', '+'),
    'Tai nghe chụp tai JBL Tune 770NC Chống ồn',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '8a691ed1-c008-4a7a-843f-39c34247c648',
    'b8c76d96-4ff5-4599-bf0f-ae4c64113a94',
    'Tai nghe Bluetooth True Wireless JBL Wave Beam',
    'headphones-tai-nghe-bluetooth-true-wireless-jbl-wave-beam-1080',
    'Kháng nước kháng bụi IP54, nhận biết môi trường xung quanh Smart Ambient',
    'Tai nghe Bluetooth True Wireless JBL Wave Beam chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HEAD-1080',
    1190000,
    1490000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'JBL', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Tai%20nghe%20Bluetooth%20True%20Wireless%20JBL%20Wave%20Beam', '%20', '+'),
    'Tai nghe Bluetooth True Wireless JBL Wave Beam',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '8a691ed1-c008-4a7a-843f-39c34247c648',
    'b8c76d96-4ff5-4599-bf0f-ae4c64113a94',
    'Tai nghe gaming JBL Quantum 100X Console',
    'headphones-tai-nghe-gaming-jbl-quantum-100x-console-1081',
    'Âm thanh không gian chân thực JBL QuantumSOUND Signature, mic thoại tháo rời',
    'Tai nghe gaming JBL Quantum 100X Console chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HEAD-1081',
    790000,
    990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'JBL', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Tai%20nghe%20gaming%20JBL%20Quantum%20100X%20Console', '%20', '+'),
    'Tai nghe gaming JBL Quantum 100X Console',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '8a691ed1-c008-4a7a-843f-39c34247c648',
    '17f517e8-9194-4e4f-bdb3-c86b85812e73',
    'Tai nghe gaming Razer BlackShark V2 Pro (2023)',
    'headphones-tai-nghe-gaming-razer-blackshark-v2-pro-2023-1082',
    'Mic Razer HyperClear Super Wideband thu âm như podcast, đệm tai mút hoạt tính FlowKnit',
    'Tai nghe gaming Razer BlackShark V2 Pro (2023) chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HEAD-1082',
    4690000,
    5390000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Razer', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Tai%20nghe%20gaming%20Razer%20BlackShark%20V2%20Pro%20(2023)', '%20', '+'),
    'Tai nghe gaming Razer BlackShark V2 Pro (2023)',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '8a691ed1-c008-4a7a-843f-39c34247c648',
    '17f517e8-9194-4e4f-bdb3-c86b85812e73',
    'Tai nghe chụp tai Razer Kraken V3 X USB',
    'headphones-tai-nghe-ch-p-tai-razer-kraken-v3-x-usb-1083',
    'Driver Razer TriForce 40mm, giả lập âm thanh vòm 7.1 Surround Sound, led Chroma RGB',
    'Tai nghe chụp tai Razer Kraken V3 X USB chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HEAD-1083',
    1290000,
    1690000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Razer', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Tai%20nghe%20ch%E1%BB%A5p%20tai%20Razer%20Kraken%20V3%20X%20USB', '%20', '+'),
    'Tai nghe chụp tai Razer Kraken V3 X USB',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '8a691ed1-c008-4a7a-843f-39c34247c648',
    '17f517e8-9194-4e4f-bdb3-c86b85812e73',
    'Tai nghe nhét tai Razer Hammerhead Pro HyperSpeed',
    'headphones-tai-nghe-nh-t-tai-razer-hammerhead-pro-hyperspeed-1084',
    'Độ trễ siêu thấp qua dongle Type-C 2.4GHz, chống ồn chủ động kép kết hợp sạc Qi',
    'Tai nghe nhét tai Razer Hammerhead Pro HyperSpeed chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HEAD-1084',
    4290000,
    4990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Razer', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Tai%20nghe%20nh%C3%A9t%20tai%20Razer%20Hammerhead%20Pro%20HyperSpeed', '%20', '+'),
    'Tai nghe nhét tai Razer Hammerhead Pro HyperSpeed',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '8a691ed1-c008-4a7a-843f-39c34247c648',
    'b76be2d6-fce2-4972-8745-af20a37d206f',
    'Tai nghe gaming không dây Logitech G733 Lightspeed RGB',
    'headphones-tai-nghe-gaming-kh-ng-d-y-logitech-g733-lightspeed-rgb-1085',
    'Trọng lượng nhẹ 278g, dải băng đô co giãn thoáng khí, màng loa Pro-G 40mm',
    'Tai nghe gaming không dây Logitech G733 Lightspeed RGB chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HEAD-1085',
    2890000,
    3490000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Logitech', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Tai%20nghe%20gaming%20kh%C3%B4ng%20d%C3%A2y%20Logitech%20G733%20Lightspeed%20RGB', '%20', '+'),
    'Tai nghe gaming không dây Logitech G733 Lightspeed RGB',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '8a691ed1-c008-4a7a-843f-39c34247c648',
    'b76be2d6-fce2-4972-8745-af20a37d206f',
    'Tai nghe gaming Logitech G PRO X 2 Lightspeed',
    'headphones-tai-nghe-gaming-logitech-g-pro-x-2-lightspeed-1086',
    'Màng loa Graphene 50mm cách mạng, xoay gập linh hoạt, kết nối 3 chế độ đa nền tảng',
    'Tai nghe gaming Logitech G PRO X 2 Lightspeed chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HEAD-1086',
    5490000,
    6190000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Logitech', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Tai%20nghe%20gaming%20Logitech%20G%20PRO%20X%202%20Lightspeed', '%20', '+'),
    'Tai nghe gaming Logitech G PRO X 2 Lightspeed',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '8a691ed1-c008-4a7a-843f-39c34247c648',
    'b76be2d6-fce2-4972-8745-af20a37d206f',
    'Tai nghe chụp tai Logitech Zone Vibe 100',
    'headphones-tai-nghe-ch-p-tai-logitech-zone-vibe-100-1087',
    'Thiết kế hiện đại tối giản cho dân văn phòng, mic gập tự ngắt tiếng tiện dụng',
    'Tai nghe chụp tai Logitech Zone Vibe 100 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HEAD-1087',
    1990000,
    2390000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Logitech', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Tai%20nghe%20ch%E1%BB%A5p%20tai%20Logitech%20Zone%20Vibe%20100', '%20', '+'),
    'Tai nghe chụp tai Logitech Zone Vibe 100',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '8a691ed1-c008-4a7a-843f-39c34247c648',
    '95935020-183f-44cc-a477-2a559734bdad',
    'Tai nghe ASUS ROG Cetra True Wireless SpeedNova',
    'headphones-tai-nghe-asus-rog-cetra-true-wireless-speednova-1088',
    'Công nghệ ROG SpeedNova 2.4Ghz độ trễ siêu thấp, âm thanh 24-bit 96 kHz Hi-Res',
    'Tai nghe ASUS ROG Cetra True Wireless SpeedNova chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HEAD-1088',
    4290000,
    4890000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'ASUS', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Tai%20nghe%20ASUS%20ROG%20Cetra%20True%20Wireless%20SpeedNova', '%20', '+'),
    'Tai nghe ASUS ROG Cetra True Wireless SpeedNova',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '8a691ed1-c008-4a7a-843f-39c34247c648',
    '95935020-183f-44cc-a477-2a559734bdad',
    'Tai nghe chơi game ASUS ROG Delta S Animate',
    'headphones-tai-nghe-ch-i-game-asus-rog-delta-s-animate-1089',
    'Màn hình led AniMe Matrix trên củ tai, DAC giải mã ESS 9281 Quad DAC chất lượng cao',
    'Tai nghe chơi game ASUS ROG Delta S Animate chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HEAD-1089',
    5190000,
    5890000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'ASUS', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Tai%20nghe%20ch%C6%A1i%20game%20ASUS%20ROG%20Delta%20S%20Animate', '%20', '+'),
    'Tai nghe chơi game ASUS ROG Delta S Animate',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '8a691ed1-c008-4a7a-843f-39c34247c648',
    'd00bd89f-fa7e-4732-ba0b-6623f6f779d0',
    'Tai nghe HyperX Cloud III Wireless Black Red',
    'headphones-tai-nghe-hyperx-cloud-iii-wireless-black-red-1090',
    'Thời lượng pin kỷ lục 120 giờ không cần sạc lại, đệm tai bọc da êm ái huyền thoại',
    'Tai nghe HyperX Cloud III Wireless Black Red chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HEAD-1090',
    3490000,
    3990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Kingston', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Tai%20nghe%20HyperX%20Cloud%20III%20Wireless%20Black%20Red', '%20', '+'),
    'Tai nghe HyperX Cloud III Wireless Black Red',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '8a691ed1-c008-4a7a-843f-39c34247c648',
    'd00bd89f-fa7e-4732-ba0b-6623f6f779d0',
    'Tai nghe chơi game HyperX Cloud Stinger 2 Core',
    'headphones-tai-nghe-ch-i-game-hyperx-cloud-stinger-2-core-1091',
    'Âm thanh không gian DTS Headphone:X Spatial Audio, trọng lượng nhẹ ôm khít tai',
    'Tai nghe chơi game HyperX Cloud Stinger 2 Core chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HEAD-1091',
    890000,
    1190000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Kingston', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Tai%20nghe%20ch%C6%A1i%20game%20HyperX%20Cloud%20Stinger%202%20Core', '%20', '+'),
    'Tai nghe chơi game HyperX Cloud Stinger 2 Core',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '8a691ed1-c008-4a7a-843f-39c34247c648',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Tai nghe chụp tai chống ồn Baseus Bowie H1 Pro',
    'headphones-tai-nghe-ch-p-tai-ch-ng-n-baseus-bowie-h1-pro-1092',
    'Công nghệ chống ồn chủ động 48dB, màng loa kép sinh học, âm thanh vòm 360 độ',
    'Tai nghe chụp tai chống ồn Baseus Bowie H1 Pro chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HEAD-1092',
    890000,
    1290000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Tai%20nghe%20ch%E1%BB%A5p%20tai%20ch%E1%BB%91ng%20%E1%BB%93n%20Baseus%20Bowie%20H1%20Pro', '%20', '+'),
    'Tai nghe chụp tai chống ồn Baseus Bowie H1 Pro',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '8a691ed1-c008-4a7a-843f-39c34247c648',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Tai nghe chống ồn Soundcore by Anker Space One',
    'headphones-tai-nghe-ch-ng-n-soundcore-by-anker-space-one-1093',
    'Khử 98% tiếng ồn xung quanh, chứng nhận âm thanh Hi-Res Wireless qua codec LDAC',
    'Tai nghe chống ồn Soundcore by Anker Space One chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HEAD-1093',
    1890000,
    2390000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Tai%20nghe%20ch%E1%BB%91ng%20%E1%BB%93n%20Soundcore%20by%20Anker%20Space%20One', '%20', '+'),
    'Tai nghe chống ồn Soundcore by Anker Space One',
    1,
    true
  );
END $$;

-- ---------------------------------------------------------------------
-- DANH MỤC: SPEAKERS (speakers) - Bổ sung 22 sản phẩm -> Đủ 30 sản phẩm
-- ---------------------------------------------------------------------

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '3a8458d6-4e01-49f5-80e1-80d93e58c9e9',
    'b8c76d96-4ff5-4599-bf0f-ae4c64113a94',
    'Loa Bluetooth di động JBL Charge 5',
    'speakers-loa-bluetooth-di-ng-jbl-charge-5-1094',
    'Kháng nước chống bụi IP67, pin trâu 20 giờ, tích hợp sạc dự phòng cho điện thoại',
    'Loa Bluetooth di động JBL Charge 5 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SPEA-1094',
    3490000,
    3990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'JBL', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Loa%20Bluetooth%20di%20%C4%91%E1%BB%99ng%20JBL%20Charge%205', '%20', '+'),
    'Loa Bluetooth di động JBL Charge 5',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '3a8458d6-4e01-49f5-80e1-80d93e58c9e9',
    'b8c76d96-4ff5-4599-bf0f-ae4c64113a94',
    'Loa Bluetooth di động JBL Flip 6',
    'speakers-loa-bluetooth-di-ng-jbl-flip-6-1095',
    'Hệ thống loa 2 đường tiếng cho âm thanh to bùng nổ, thiết kế nhỏ gọn cầm tay',
    'Loa Bluetooth di động JBL Flip 6 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SPEA-1095',
    2590000,
    2990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'JBL', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Loa%20Bluetooth%20di%20%C4%91%E1%BB%99ng%20JBL%20Flip%206', '%20', '+'),
    'Loa Bluetooth di động JBL Flip 6',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '3a8458d6-4e01-49f5-80e1-80d93e58c9e9',
    'b8c76d96-4ff5-4599-bf0f-ae4c64113a94',
    'Loa di động mini JBL Go 4',
    'speakers-loa-di-ng-mini-jbl-go-4-1096',
    'Thiết kế bỏ túi siêu nhỏ gọn, quai xách tiện dụng, âm thanh JBL Pro Sound uy lực',
    'Loa di động mini JBL Go 4 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SPEA-1096',
    990000,
    1290000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'JBL', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Loa%20di%20%C4%91%E1%BB%99ng%20mini%20JBL%20Go%204', '%20', '+'),
    'Loa di động mini JBL Go 4',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '3a8458d6-4e01-49f5-80e1-80d93e58c9e9',
    'b8c76d96-4ff5-4599-bf0f-ae4c64113a94',
    'Loa tiệc tùng JBL PartyBox Club 120',
    'speakers-loa-ti-c-t-ng-jbl-partybox-club-120-1097',
    'Công suất khủng 160W, đèn led cảm ứng theo nhạc sống động, cắm micro và guitar hát karaoke',
    'Loa tiệc tùng JBL PartyBox Club 120 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SPEA-1097',
    9490000,
    10500000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'JBL', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Loa%20ti%E1%BB%87c%20t%C3%B9ng%20JBL%20PartyBox%20Club%20120', '%20', '+'),
    'Loa tiệc tùng JBL PartyBox Club 120',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '3a8458d6-4e01-49f5-80e1-80d93e58c9e9',
    '1eb3e63f-975a-4847-a930-4480d7cfee63',
    'Loa không dây di động Sony SRS-XB100',
    'speakers-loa-kh-ng-d-y-di-ng-sony-srs-xb100-1098',
    'Bộ khuếch tán âm thanh Sound Diffusion Processor, chuẩn IP67 chịu mưa gió dã ngoại',
    'Loa không dây di động Sony SRS-XB100 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SPEA-1098',
    1190000,
    1490000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Sony', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Loa%20kh%C3%B4ng%20d%C3%A2y%20di%20%C4%91%E1%BB%99ng%20Sony%20SRS-XB100', '%20', '+'),
    'Loa không dây di động Sony SRS-XB100',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '3a8458d6-4e01-49f5-80e1-80d93e58c9e9',
    '1eb3e63f-975a-4847-a930-4480d7cfee63',
    'Loa tiệc không dây Sony SRS-XV500',
    'speakers-loa-ti-c-kh-ng-d-y-sony-srs-xv500-1099',
    'Màng loa X-Balanced Speaker Unit cho âm trầm rền vang, pin dùng liên tục 25 giờ',
    'Loa tiệc không dây Sony SRS-XV500 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SPEA-1099',
    7990000,
    8990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Sony', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Loa%20ti%E1%BB%87c%20kh%C3%B4ng%20d%C3%A2y%20Sony%20SRS-XV500', '%20', '+'),
    'Loa tiệc không dây Sony SRS-XV500',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '3a8458d6-4e01-49f5-80e1-80d93e58c9e9',
    '1eb3e63f-975a-4847-a930-4480d7cfee63',
    'Loa thanh Soundbar Sony HT-S20R 5.1 Kênh',
    'speakers-loa-thanh-soundbar-sony-ht-s20r-5-1-k-nh-1100',
    'Công suất 400W với 2 loa vòm phía sau và loa siêu trầm riêng, trải nghiệm rạp phim tại nhà',
    'Loa thanh Soundbar Sony HT-S20R 5.1 Kênh chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SPEA-1100',
    4490000,
    5490000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Sony', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Loa%20thanh%20Soundbar%20Sony%20HT-S20R%205.1%20K%C3%AAnh', '%20', '+'),
    'Loa thanh Soundbar Sony HT-S20R 5.1 Kênh',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '3a8458d6-4e01-49f5-80e1-80d93e58c9e9',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Loa thông minh Apple HomePod 2 Midnight',
    'speakers-loa-th-ng-minh-apple-homepod-2-midnight-1101',
    'Âm thanh chất lượng phòng thu Studio Sound, tích hợp trợ lý Siri thông minh và nhà thông minh HomeKit',
    'Loa thông minh Apple HomePod 2 Midnight chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SPEA-1101',
    7490000,
    7990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Loa%20th%C3%B4ng%20minh%20Apple%20HomePod%202%20Midnight', '%20', '+'),
    'Loa thông minh Apple HomePod 2 Midnight',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '3a8458d6-4e01-49f5-80e1-80d93e58c9e9',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Loa thông minh Apple HomePod mini Yellow',
    'speakers-loa-th-ng-minh-apple-homepod-mini-yellow-1102',
    'Thiết kế quả cầu tí hon, âm thanh 360 độ ngập tràn phòng ngủ và bàn làm việc',
    'Loa thông minh Apple HomePod mini Yellow chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SPEA-1102',
    2590000,
    2890000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Loa%20th%C3%B4ng%20minh%20Apple%20HomePod%20mini%20Yellow', '%20', '+'),
    'Loa thông minh Apple HomePod mini Yellow',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '3a8458d6-4e01-49f5-80e1-80d93e58c9e9',
    '17f517e8-9194-4e4f-bdb3-c86b85812e73',
    'Loa thanh chơi game Razer Leviathan V2 X PC Soundbar',
    'speakers-loa-thanh-ch-i-game-razer-leviathan-v2-x-pc-soundbar-1103',
    'Cung cấp năng lượng qua cổng USB Type-C duy nhất, hiệu ứng Chroma RGB 14 vùng rực sáng',
    'Loa thanh chơi game Razer Leviathan V2 X PC Soundbar chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SPEA-1103',
    2690000,
    3190000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Razer', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Loa%20thanh%20ch%C6%A1i%20game%20Razer%20Leviathan%20V2%20X%20PC%20Soundbar', '%20', '+'),
    'Loa thanh chơi game Razer Leviathan V2 X PC Soundbar',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '3a8458d6-4e01-49f5-80e1-80d93e58c9e9',
    '17f517e8-9194-4e4f-bdb3-c86b85812e73',
    'Hệ thống loa 2.1 Razer Nommo V2 kèm Subwoofer không dây',
    'speakers-h-th-ng-loa-2-1-razer-nommo-v2-k-m-subwoofer-kh-ng-d-y-1104',
    'Âm thanh không gian THX Spatial Audio, màng loa toàn dải 3.2 inch mạ nhôm tinh tế',
    'Hệ thống loa 2.1 Razer Nommo V2 kèm Subwoofer không dây chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SPEA-1104',
    6890000,
    7890000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Razer', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('H%E1%BB%87%20th%E1%BB%91ng%20loa%202.1%20Razer%20Nommo%20V2%20k%C3%A8m%20Subwoofer%20kh%C3%B4ng%20d%C3%A2y', '%20', '+'),
    'Hệ thống loa 2.1 Razer Nommo V2 kèm Subwoofer không dây',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '3a8458d6-4e01-49f5-80e1-80d93e58c9e9',
    'b76be2d6-fce2-4972-8745-af20a37d206f',
    'Hệ thống loa máy tính 2.1 Logitech Z407 kèm núm xoay',
    'speakers-h-th-ng-loa-m-y-t-nh-2-1-logitech-z407-k-m-n-m-xoay-1105',
    'Công suất đỉnh 80W, kết nối không dây Bluetooth hoặc USB, núm điều khiển từ xa không dây',
    'Hệ thống loa máy tính 2.1 Logitech Z407 kèm núm xoay chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SPEA-1105',
    2190000,
    2590000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Logitech', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('H%E1%BB%87%20th%E1%BB%91ng%20loa%20m%C3%A1y%20t%C3%ADnh%202.1%20Logitech%20Z407%20k%C3%A8m%20n%C3%BAm%20xoay', '%20', '+'),
    'Hệ thống loa máy tính 2.1 Logitech Z407 kèm núm xoay',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '3a8458d6-4e01-49f5-80e1-80d93e58c9e9',
    'b76be2d6-fce2-4972-8745-af20a37d206f',
    'Hệ thống loa xem phim Logitech Z906 5.1 vòm THX',
    'speakers-h-th-ng-loa-xem-phim-logitech-z906-5-1-v-m-thx-1106',
    'Công suất đỉnh 1000W (500W RMS), chứng nhận âm thanh rạp chiếu phim THX chuẩn 5.1',
    'Hệ thống loa xem phim Logitech Z906 5.1 vòm THX chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SPEA-1106',
    7990000,
    8990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Logitech', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('H%E1%BB%87%20th%E1%BB%91ng%20loa%20xem%20phim%20Logitech%20Z906%205.1%20v%C3%B2m%20THX', '%20', '+'),
    'Hệ thống loa xem phim Logitech Z906 5.1 vòm THX',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '3a8458d6-4e01-49f5-80e1-80d93e58c9e9',
    'b76be2d6-fce2-4972-8745-af20a37d206f',
    'Loa để bàn Logitech Z120 cổng USB',
    'speakers-loa-b-n-logitech-z120-c-ng-usb-1107',
    'Thiết kế gọn gàng cấp nguồn trực tiếp qua USB máy tính, có giắc 3.5mm tiện dụng',
    'Loa để bàn Logitech Z120 cổng USB chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SPEA-1107',
    280000,
    380000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Logitech', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Loa%20%C4%91%E1%BB%83%20b%C3%A0n%20Logitech%20Z120%20c%E1%BB%95ng%20USB', '%20', '+'),
    'Loa để bàn Logitech Z120 cổng USB',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '3a8458d6-4e01-49f5-80e1-80d93e58c9e9',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Loa Bluetooth Anker Soundcore Motion Boom Plus 80W',
    'speakers-loa-bluetooth-anker-soundcore-motion-boom-plus-80w-1108',
    'Công suất khủng 80W chống nước IP67 nổi trên mặt nước, pin 20 giờ kiêm sạc dự phòng',
    'Loa Bluetooth Anker Soundcore Motion Boom Plus 80W chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SPEA-1108',
    3490000,
    4190000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Loa%20Bluetooth%20Anker%20Soundcore%20Motion%20Boom%20Plus%2080W', '%20', '+'),
    'Loa Bluetooth Anker Soundcore Motion Boom Plus 80W',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '3a8458d6-4e01-49f5-80e1-80d93e58c9e9',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Loa Bluetooth mini Anker Soundcore 2 12W BassUp',
    'speakers-loa-bluetooth-mini-anker-soundcore-2-12w-bassup-1109',
    'Thời lượng pin huyền thoại 24 giờ liên tục, công nghệ đẩy dải trầm BassUp độc quyền',
    'Loa Bluetooth mini Anker Soundcore 2 12W BassUp chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SPEA-1109',
    890000,
    1190000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Loa%20Bluetooth%20mini%20Anker%20Soundcore%202%2012W%20BassUp', '%20', '+'),
    'Loa Bluetooth mini Anker Soundcore 2 12W BassUp',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '3a8458d6-4e01-49f5-80e1-80d93e58c9e9',
    '9608b564-cbe0-4ad5-adda-72a37cb87bd6',
    'Loa Bluetooth di động Xiaomi Sound Pocket 5W',
    'speakers-loa-bluetooth-di-ng-xiaomi-sound-pocket-5w-1110',
    'Kích thước siêu nhỏ nhẹ 200g bỏ túi du lịch, kháng nước IP67 thời trang',
    'Loa Bluetooth di động Xiaomi Sound Pocket 5W chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SPEA-1110',
    390000,
    490000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Xiaomi', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Loa%20Bluetooth%20di%20%C4%91%E1%BB%99ng%20Xiaomi%20Sound%20Pocket%205W', '%20', '+'),
    'Loa Bluetooth di động Xiaomi Sound Pocket 5W',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '3a8458d6-4e01-49f5-80e1-80d93e58c9e9',
    '9608b564-cbe0-4ad5-adda-72a37cb87bd6',
    'Loa thông minh Xiaomi Smart Speaker IR Control',
    'speakers-loa-th-ng-minh-xiaomi-smart-speaker-ir-control-1111',
    'Tích hợp điều khiển hồng ngoại tắt bật TV, máy lạnh, hiển thị đồng hồ LED số',
    'Loa thông minh Xiaomi Smart Speaker IR Control chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SPEA-1111',
    690000,
    890000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Xiaomi', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Loa%20th%C3%B4ng%20minh%20Xiaomi%20Smart%20Speaker%20IR%20Control', '%20', '+'),
    'Loa thông minh Xiaomi Smart Speaker IR Control',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '3a8458d6-4e01-49f5-80e1-80d93e58c9e9',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Loa vi tính Baseus AeQur DS10 Soundbar RGB',
    'speakers-loa-vi-t-nh-baseus-aequr-ds10-soundbar-rgb-1112',
    'Thiết kế thanh dài đặt gọn gàng dưới màn hình máy tính, hiệu ứng led chuyển màu cuốn hút',
    'Loa vi tính Baseus AeQur DS10 Soundbar RGB chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SPEA-1112',
    690000,
    890000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Loa%20vi%20t%C3%ADnh%20Baseus%20AeQur%20DS10%20Soundbar%20RGB', '%20', '+'),
    'Loa vi tính Baseus AeQur DS10 Soundbar RGB',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '3a8458d6-4e01-49f5-80e1-80d93e58c9e9',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Loa Bluetooth mini Baseus AeQur V2 360 Sound',
    'speakers-loa-bluetooth-mini-baseus-aequr-v2-360-sound-1113',
    'Âm thanh đa hướng 360 độ, kết nối Bluetooth 5.0 ổn định khoảng cách xa',
    'Loa Bluetooth mini Baseus AeQur V2 360 Sound chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SPEA-1113',
    550000,
    750000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Loa%20Bluetooth%20mini%20Baseus%20AeQur%20V2%20360%20Sound', '%20', '+'),
    'Loa Bluetooth mini Baseus AeQur V2 360 Sound',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '3a8458d6-4e01-49f5-80e1-80d93e58c9e9',
    '95935020-183f-44cc-a477-2a559734bdad',
    'Loa gaming mini ASUS ROG Cetra RGB Desktop',
    'speakers-loa-gaming-mini-asus-rog-cetra-rgb-desktop-1114',
    'Đồng bộ đèn Aura Sync với bo mạch chủ và card màn hình gaming',
    'Loa gaming mini ASUS ROG Cetra RGB Desktop chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SPEA-1114',
    1690000,
    2090000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'ASUS', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Loa%20gaming%20mini%20ASUS%20ROG%20Cetra%20RGB%20Desktop', '%20', '+'),
    'Loa gaming mini ASUS ROG Cetra RGB Desktop',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '3a8458d6-4e01-49f5-80e1-80d93e58c9e9',
    'd00bd89f-fa7e-4732-ba0b-6623f6f779d0',
    'Loa gaming HyperX Cloud Soundbar Mini',
    'speakers-loa-gaming-hyperx-cloud-soundbar-mini-1115',
    'Củ loa kép hỗ trợ mic đàm thoại rõ tiếng trong discord chơi game đồng đội',
    'Loa gaming HyperX Cloud Soundbar Mini chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SPEA-1115',
    1490000,
    1890000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Kingston', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Loa%20gaming%20HyperX%20Cloud%20Soundbar%20Mini', '%20', '+'),
    'Loa gaming HyperX Cloud Soundbar Mini',
    1,
    true
  );
END $$;

-- ---------------------------------------------------------------------
-- DANH MỤC: STORAGE (storage) - Bổ sung 22 sản phẩm -> Đủ 30 sản phẩm
-- ---------------------------------------------------------------------

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '104d2b42-33b0-40f7-a3ad-0416b5c6278d',
    '0cfe3523-e8b2-445a-a689-45b24810d338',
    'Ổ cứng SSD Samsung 990 PRO 2TB PCIe Gen 4x4 NVMe',
    'storage-c-ng-ssd-samsung-990-pro-2tb-pcie-gen-4x4-nvme-1116',
    'Tốc độ đọc tuần tự lên tới 7.450 MB/s, tản nhiệt nhôm kiểm soát nhiệt độ thông minh',
    'Ổ cứng SSD Samsung 990 PRO 2TB PCIe Gen 4x4 NVMe chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STOR-1116',
    4790000,
    5490000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Samsung', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%94%20c%E1%BB%A9ng%20SSD%20Samsung%20990%20PRO%202TB%20PCIe%20Gen%204x4%20NVMe', '%20', '+'),
    'Ổ cứng SSD Samsung 990 PRO 2TB PCIe Gen 4x4 NVMe',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '104d2b42-33b0-40f7-a3ad-0416b5c6278d',
    '0cfe3523-e8b2-445a-a689-45b24810d338',
    'Ổ cứng SSD Samsung 990 EVO 1TB PCIe 4.0 x4 / 5.0 x2',
    'storage-c-ng-ssd-samsung-990-evo-1tb-pcie-4-0-x4-5-0-x2-1117',
    'Tiết kiệm điện năng tới 70% so với thế hệ trước, tốc độ đọc 5.000 MB/s',
    'Ổ cứng SSD Samsung 990 EVO 1TB PCIe 4.0 x4 / 5.0 x2 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STOR-1117',
    2190000,
    2590000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Samsung', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%94%20c%E1%BB%A9ng%20SSD%20Samsung%20990%20EVO%201TB%20PCIe%204.0%20x4%20%2F%205.0%20x2', '%20', '+'),
    'Ổ cứng SSD Samsung 990 EVO 1TB PCIe 4.0 x4 / 5.0 x2',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '104d2b42-33b0-40f7-a3ad-0416b5c6278d',
    '0cfe3523-e8b2-445a-a689-45b24810d338',
    'Ổ cứng SSD Di động Samsung T7 Shield 1TB USB 3.2',
    'storage-c-ng-ssd-di-ng-samsung-t7-shield-1tb-usb-3-2-1118',
    'Vỏ cao su bọc ngoài siêu bền chịu rơi 3m, kháng nước IP65, tốc độ 1.050 MB/s',
    'Ổ cứng SSD Di động Samsung T7 Shield 1TB USB 3.2 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STOR-1118',
    2790000,
    3290000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Samsung', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%94%20c%E1%BB%A9ng%20SSD%20Di%20%C4%91%E1%BB%99ng%20Samsung%20T7%20Shield%201TB%20USB%203.2', '%20', '+'),
    'Ổ cứng SSD Di động Samsung T7 Shield 1TB USB 3.2',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '104d2b42-33b0-40f7-a3ad-0416b5c6278d',
    '0cfe3523-e8b2-445a-a689-45b24810d338',
    'Thẻ nhớ MicroSD Samsung PRO Plus 256GB kèm Adapter',
    'storage-th-nh-microsd-samsung-pro-plus-256gb-k-m-adapter-1119',
    'Tốc độ đọc 180MB/s, quay video mượt mà chuẩn 4K UHD cho camera hành trình Flycam',
    'Thẻ nhớ MicroSD Samsung PRO Plus 256GB kèm Adapter chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STOR-1119',
    650000,
    790000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Samsung', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Th%E1%BA%BB%20nh%E1%BB%9B%20MicroSD%20Samsung%20PRO%20Plus%20256GB%20k%C3%A8m%20Adapter', '%20', '+'),
    'Thẻ nhớ MicroSD Samsung PRO Plus 256GB kèm Adapter',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '104d2b42-33b0-40f7-a3ad-0416b5c6278d',
    'd00bd89f-fa7e-4732-ba0b-6623f6f779d0',
    'Ổ cứng SSD Kingston KC3000 1TB PCIe 4.0 NVMe M.2',
    'storage-c-ng-ssd-kingston-kc3000-1tb-pcie-4-0-nvme-m-2-1120',
    'Bộ điều khiển Gen 4x4 Phison E18 mới nhất, tốc độ đọc ghi khủng 7.000 MB/s',
    'Ổ cứng SSD Kingston KC3000 1TB PCIe 4.0 NVMe M.2 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STOR-1120',
    2450000,
    2890000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Kingston', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%94%20c%E1%BB%A9ng%20SSD%20Kingston%20KC3000%201TB%20PCIe%204.0%20NVMe%20M.2', '%20', '+'),
    'Ổ cứng SSD Kingston KC3000 1TB PCIe 4.0 NVMe M.2',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '104d2b42-33b0-40f7-a3ad-0416b5c6278d',
    'd00bd89f-fa7e-4732-ba0b-6623f6f779d0',
    'Ổ cứng SSD Di động Kingston XS1000 1TB USB 3.2 Gen 2',
    'storage-c-ng-ssd-di-ng-kingston-xs1000-1tb-usb-3-2-gen-2-1121',
    'Kích thước siêu nhỏ chỉ bằng chiếc hộp quẹt, trọng lượng 29g dễ dàng bỏ túi quần',
    'Ổ cứng SSD Di động Kingston XS1000 1TB USB 3.2 Gen 2 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STOR-1121',
    1890000,
    2290000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Kingston', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%94%20c%E1%BB%A9ng%20SSD%20Di%20%C4%91%E1%BB%99ng%20Kingston%20XS1000%201TB%20USB%203.2%20Gen%202', '%20', '+'),
    'Ổ cứng SSD Di động Kingston XS1000 1TB USB 3.2 Gen 2',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '104d2b42-33b0-40f7-a3ad-0416b5c6278d',
    'd00bd89f-fa7e-4732-ba0b-6623f6f779d0',
    'USB Kingston DataTraveler Exodia M 64GB USB 3.2 Gen 1',
    'storage-usb-kingston-datatraveler-exodia-m-64gb-usb-3-2-gen-1-1122',
    'Thiết kế nắp trượt thông minh bảo vệ chân cắm, vòng móc khóa tiện mang theo',
    'USB Kingston DataTraveler Exodia M 64GB USB 3.2 Gen 1 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STOR-1122',
    120000,
    160000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Kingston', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('USB%20Kingston%20DataTraveler%20Exodia%20M%2064GB%20USB%203.2%20Gen%201', '%20', '+'),
    'USB Kingston DataTraveler Exodia M 64GB USB 3.2 Gen 1',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '104d2b42-33b0-40f7-a3ad-0416b5c6278d',
    'd00bd89f-fa7e-4732-ba0b-6623f6f779d0',
    'Thẻ nhớ MicroSD Kingston Canvas Go! Plus 128GB',
    'storage-th-nh-microsd-kingston-canvas-go-plus-128gb-1123',
    'Chuẩn U3, V30 hỗ trợ quay video hành động chuyên nghiệp, độ bền cực cao',
    'Thẻ nhớ MicroSD Kingston Canvas Go! Plus 128GB chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STOR-1123',
    350000,
    450000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Kingston', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Th%E1%BA%BB%20nh%E1%BB%9B%20MicroSD%20Kingston%20Canvas%20Go!%20Plus%20128GB', '%20', '+'),
    'Thẻ nhớ MicroSD Kingston Canvas Go! Plus 128GB',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '104d2b42-33b0-40f7-a3ad-0416b5c6278d',
    'd00bd89f-fa7e-4732-ba0b-6623f6f779d0',
    'Ổ cứng SSD Kingston A400 480GB 2.5 inch SATA III',
    'storage-c-ng-ssd-kingston-a400-480gb-2-5-inch-sata-iii-1124',
    'Giải pháp nâng cấp tốc độ giá rẻ hồi sinh laptop văn phòng và PC đời cũ',
    'Ổ cứng SSD Kingston A400 480GB 2.5 inch SATA III chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STOR-1124',
    790000,
    990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Kingston', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%94%20c%E1%BB%A9ng%20SSD%20Kingston%20A400%20480GB%202.5%20inch%20SATA%20III', '%20', '+'),
    'Ổ cứng SSD Kingston A400 480GB 2.5 inch SATA III',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '104d2b42-33b0-40f7-a3ad-0416b5c6278d',
    'd00bd89f-fa7e-4732-ba0b-6623f6f779d0',
    'Ổ cứng SSD Kingston Fury Renegade 2TB Heatsink',
    'storage-c-ng-ssd-kingston-fury-renegade-2tb-heatsink-1125',
    'Trang bị sẵn tản nhiệt nhôm dày dặn tương thích hoàn hảo máy chơi game PlayStation 5',
    'Ổ cứng SSD Kingston Fury Renegade 2TB Heatsink chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STOR-1125',
    5190000,
    5890000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Kingston', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%94%20c%E1%BB%A9ng%20SSD%20Kingston%20Fury%20Renegade%202TB%20Heatsink', '%20', '+'),
    'Ổ cứng SSD Kingston Fury Renegade 2TB Heatsink',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '104d2b42-33b0-40f7-a3ad-0416b5c6278d',
    '95935020-183f-44cc-a477-2a559734bdad',
    'Ổ cứng SSD Di động SanDisk Extreme Portable V2 1TB',
    'storage-c-ng-ssd-di-ng-sandisk-extreme-portable-v2-1tb-1126',
    'Tốc độ đọc ghi lên đến 1050MB/s, móc treo tiện lợi, bảo mật bằng mã hóa AES 256-bit',
    'Ổ cứng SSD Di động SanDisk Extreme Portable V2 1TB chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STOR-1126',
    2890000,
    3490000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'SanDisk', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%94%20c%E1%BB%A9ng%20SSD%20Di%20%C4%91%E1%BB%99ng%20SanDisk%20Extreme%20Portable%20V2%201TB', '%20', '+'),
    'Ổ cứng SSD Di động SanDisk Extreme Portable V2 1TB',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '104d2b42-33b0-40f7-a3ad-0416b5c6278d',
    '95935020-183f-44cc-a477-2a559734bdad',
    'Thẻ nhớ SanDisk Extreme PRO MicroSDXC 256GB 200MB/s',
    'storage-th-nh-sandisk-extreme-pro-microsdxc-256gb-200mb-s-1127',
    'Tốc độ đọc thẻ thần tốc 200MB/s với công nghệ SanDisk QuickFlow độc quyền',
    'Thẻ nhớ SanDisk Extreme PRO MicroSDXC 256GB 200MB/s chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STOR-1127',
    790000,
    950000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'SanDisk', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Th%E1%BA%BB%20nh%E1%BB%9B%20SanDisk%20Extreme%20PRO%20MicroSDXC%20256GB%20200MB%2Fs', '%20', '+'),
    'Thẻ nhớ SanDisk Extreme PRO MicroSDXC 256GB 200MB/s',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '104d2b42-33b0-40f7-a3ad-0416b5c6278d',
    '95935020-183f-44cc-a477-2a559734bdad',
    'USB 3.1 Type-C SanDisk Ultra Dual Drive Luxe 128GB',
    'storage-usb-3-1-type-c-sandisk-ultra-dual-drive-luxe-128gb-1128',
    'Thiết kế xoay vỏ kim loại nguyên khối, có cả 2 đầu cắm Type-C và Type-A',
    'USB 3.1 Type-C SanDisk Ultra Dual Drive Luxe 128GB chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STOR-1128',
    420000,
    550000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'SanDisk', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('USB%203.1%20Type-C%20SanDisk%20Ultra%20Dual%20Drive%20Luxe%20128GB', '%20', '+'),
    'USB 3.1 Type-C SanDisk Ultra Dual Drive Luxe 128GB',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '104d2b42-33b0-40f7-a3ad-0416b5c6278d',
    '95935020-183f-44cc-a477-2a559734bdad',
    'Ổ cứng HDD Di động Seagate One Touch 2TB USB 3.0',
    'storage-c-ng-hdd-di-ng-seagate-one-touch-2tb-usb-3-0-1129',
    'Vỏ nhôm xước sang trọng, tặng kèm phần mềm sao lưu tự động và bản quyền cứu hộ dữ liệu Rescue',
    'Ổ cứng HDD Di động Seagate One Touch 2TB USB 3.0 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STOR-1129',
    1990000,
    2390000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Seagate', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%94%20c%E1%BB%A9ng%20HDD%20Di%20%C4%91%E1%BB%99ng%20Seagate%20One%20Touch%202TB%20USB%203.0', '%20', '+'),
    'Ổ cứng HDD Di động Seagate One Touch 2TB USB 3.0',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '104d2b42-33b0-40f7-a3ad-0416b5c6278d',
    '95935020-183f-44cc-a477-2a559734bdad',
    'Ổ cứng HDD Di động Seagate One Touch 4TB Black',
    'storage-c-ng-hdd-di-ng-seagate-one-touch-4tb-black-1130',
    'Dung lượng khổng lồ 4TB lưu trữ hàng nghìn bộ phim tài liệu, ảnh gia đình và game',
    'Ổ cứng HDD Di động Seagate One Touch 4TB Black chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STOR-1130',
    3390000,
    3990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Seagate', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%94%20c%E1%BB%A9ng%20HDD%20Di%20%C4%91%E1%BB%99ng%20Seagate%20One%20Touch%204TB%20Black', '%20', '+'),
    'Ổ cứng HDD Di động Seagate One Touch 4TB Black',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '104d2b42-33b0-40f7-a3ad-0416b5c6278d',
    '95935020-183f-44cc-a477-2a559734bdad',
    'Ổ cứng HDD chuyên Camera Seagate SkyHawk 4TB',
    'storage-c-ng-hdd-chuy-n-camera-seagate-skyhawk-4tb-1131',
    'Chuyên dụng hoạt động 24/7 ghi hình liên tục không giật khung hình cho hệ thống NVR/DVR',
    'Ổ cứng HDD chuyên Camera Seagate SkyHawk 4TB chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STOR-1131',
    2390000,
    2790000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Seagate', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%94%20c%E1%BB%A9ng%20HDD%20chuy%C3%AAn%20Camera%20Seagate%20SkyHawk%204TB', '%20', '+'),
    'Ổ cứng HDD chuyên Camera Seagate SkyHawk 4TB',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '104d2b42-33b0-40f7-a3ad-0416b5c6278d',
    '95935020-183f-44cc-a477-2a559734bdad',
    'Ổ cứng SSD WD Black SN850X 1TB PCIe Gen4 NVMe',
    'storage-c-ng-ssd-wd-black-sn850x-1tb-pcie-gen4-nvme-1132',
    'Chuyên game đỉnh cao với Game Mode 2.0, tốc độ đọc chóng mặt 7.300 MB/s',
    'Ổ cứng SSD WD Black SN850X 1TB PCIe Gen4 NVMe chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STOR-1132',
    2690000,
    3190000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Western Digital', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%94%20c%E1%BB%A9ng%20SSD%20WD%20Black%20SN850X%201TB%20PCIe%20Gen4%20NVMe', '%20', '+'),
    'Ổ cứng SSD WD Black SN850X 1TB PCIe Gen4 NVMe',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '104d2b42-33b0-40f7-a3ad-0416b5c6278d',
    '95935020-183f-44cc-a477-2a559734bdad',
    'Ổ cứng SSD WD Blue SN580 1TB PCIe Gen4 x4',
    'storage-c-ng-ssd-wd-blue-sn580-1tb-pcie-gen4-x4-1133',
    'Lựa chọn quốc dân cho nhà sáng tạo nội dung, hỗ trợ công nghệ nCache 4.0',
    'Ổ cứng SSD WD Blue SN580 1TB PCIe Gen4 x4 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STOR-1133',
    1790000,
    2190000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Western Digital', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%94%20c%E1%BB%A9ng%20SSD%20WD%20Blue%20SN580%201TB%20PCIe%20Gen4%20x4', '%20', '+'),
    'Ổ cứng SSD WD Blue SN580 1TB PCIe Gen4 x4',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '104d2b42-33b0-40f7-a3ad-0416b5c6278d',
    '95935020-183f-44cc-a477-2a559734bdad',
    'Ổ cứng Di động WD My Passport 2TB 2.5 inch USB 3.2',
    'storage-c-ng-di-ng-wd-my-passport-2tb-2-5-inch-usb-3-2-1134',
    'Thiết kế nhỏ gọn, hỗ trợ đặt mật khẩu khóa ổ cứng chống mất cắp dữ liệu mật',
    'Ổ cứng Di động WD My Passport 2TB 2.5 inch USB 3.2 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STOR-1134',
    1950000,
    2290000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Western Digital', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%94%20c%E1%BB%A9ng%20Di%20%C4%91%E1%BB%99ng%20WD%20My%20Passport%202TB%202.5%20inch%20USB%203.2', '%20', '+'),
    'Ổ cứng Di động WD My Passport 2TB 2.5 inch USB 3.2',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '104d2b42-33b0-40f7-a3ad-0416b5c6278d',
    '95935020-183f-44cc-a477-2a559734bdad',
    'Box di động đựng SSD M.2 NVMe ASUS ROG Strix Arion',
    'storage-box-di-ng-ng-ssd-m-2-nvme-asus-rog-strix-arion-1135',
    'Vỏ hợp kim nhôm tản nhiệt cực mát, đèn led Aura Sync RGB, tốc độ USB-C 10Gbps',
    'Box di động đựng SSD M.2 NVMe ASUS ROG Strix Arion chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STOR-1135',
    1190000,
    1490000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'ASUS', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Box%20di%20%C4%91%E1%BB%99ng%20%C4%91%E1%BB%B1ng%20SSD%20M.2%20NVMe%20ASUS%20ROG%20Strix%20Arion', '%20', '+'),
    'Box di động đựng SSD M.2 NVMe ASUS ROG Strix Arion',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '104d2b42-33b0-40f7-a3ad-0416b5c6278d',
    '95935020-183f-44cc-a477-2a559734bdad',
    'Box di động đựng SSD ASUS TUF Gaming A1 chuẩn quân đội',
    'storage-box-di-ng-ng-ssd-asus-tuf-gaming-a1-chu-n-qu-n-i-1136',
    'Chuẩn chống nước chống va đập IP68 và độ bền quân sự MIL-STD-810H',
    'Box di động đựng SSD ASUS TUF Gaming A1 chuẩn quân đội chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STOR-1136',
    890000,
    1150000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'ASUS', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Box%20di%20%C4%91%E1%BB%99ng%20%C4%91%E1%BB%B1ng%20SSD%20ASUS%20TUF%20Gaming%20A1%20chu%E1%BA%A9n%20qu%C3%A2n%20%C4%91%E1%BB%99i', '%20', '+'),
    'Box di động đựng SSD ASUS TUF Gaming A1 chuẩn quân đội',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '104d2b42-33b0-40f7-a3ad-0416b5c6278d',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Vỏ bọc Box SSD M.2 NVMe/SATA Ugreen 10Gbps nhôm tản nhiệt',
    'storage-v-b-c-box-ssd-m-2-nvme-sata-ugreen-10gbps-nh-m-t-n-nhi-t-1137',
    'Tương thích cả 2 chuẩn PCIe NVMe và SATA NGFF, hỗ trợ dung lượng ổ cứng đến 4TB',
    'Vỏ bọc Box SSD M.2 NVMe/SATA Ugreen 10Gbps nhôm tản nhiệt chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STOR-1137',
    420000,
    550000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('V%E1%BB%8F%20b%E1%BB%8Dc%20Box%20SSD%20M.2%20NVMe%2FSATA%20Ugreen%2010Gbps%20nh%C3%B4m%20t%E1%BA%A3n%20nhi%E1%BB%87t', '%20', '+'),
    'Vỏ bọc Box SSD M.2 NVMe/SATA Ugreen 10Gbps nhôm tản nhiệt',
    1,
    true
  );
END $$;

-- ---------------------------------------------------------------------
-- DANH MỤC: CHARGERS (chargers) - Bổ sung 21 sản phẩm -> Đủ 30 sản phẩm
-- ---------------------------------------------------------------------

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'bb852652-1bc0-4afe-8827-9289269826a9',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Củ sạc nhanh Anker 737 GaNPrime 120W (A2148)',
    'chargers-c-s-c-nhanh-anker-737-ganprime-120w-a2148-1138',
    '3 cổng sạc nhanh sạc cùng lúc 2 laptop và 1 điện thoại, công nghệ tản nhiệt ActiveShield 2.0',
    'Củ sạc nhanh Anker 737 GaNPrime 120W (A2148) chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CHAR-1138',
    1590000,
    1990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%E1%BB%A7%20s%E1%BA%A1c%20nhanh%20Anker%20737%20GaNPrime%20120W%20(A2148)', '%20', '+'),
    'Củ sạc nhanh Anker 737 GaNPrime 120W (A2148)',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'bb852652-1bc0-4afe-8827-9289269826a9',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Củ sạc nhanh Anker Nano II 65W GaN II (A2663)',
    'chargers-c-s-c-nhanh-anker-nano-ii-65w-gan-ii-a2663-1139',
    'Kích thước nhỏ hơn 58% củ sạc laptop tiêu chuẩn, chuẩn sạc PD sạc đầy MacBook Pro',
    'Củ sạc nhanh Anker Nano II 65W GaN II (A2663) chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CHAR-1139',
    790000,
    990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%E1%BB%A7%20s%E1%BA%A1c%20nhanh%20Anker%20Nano%20II%2065W%20GaN%20II%20(A2663)', '%20', '+'),
    'Củ sạc nhanh Anker Nano II 65W GaN II (A2663)',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'bb852652-1bc0-4afe-8827-9289269826a9',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Củ sạc nhanh Anker Nano 3 30W Type-C (A2146)',
    'chargers-c-s-c-nhanh-anker-nano-3-30w-type-c-a2146-1140',
    'Chuyên sạc nhanh tối đa công suất cho iPhone 15/16 Series và iPad Pro, chân gập nhỏ gọn',
    'Củ sạc nhanh Anker Nano 3 30W Type-C (A2146) chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CHAR-1140',
    390000,
    490000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%E1%BB%A7%20s%E1%BA%A1c%20nhanh%20Anker%20Nano%203%2030W%20Type-C%20(A2146)', '%20', '+'),
    'Củ sạc nhanh Anker Nano 3 30W Type-C (A2146)',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'bb852652-1bc0-4afe-8827-9289269826a9',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Củ sạc để bàn Anker Prime 240W 4 cổng (A2643)',
    'chargers-c-s-c-b-n-anker-prime-240w-4-c-ng-a2643-1141',
    'Trạm sạc bàn cao cấp, 1 cổng Type-C đạt công suất tối đa 140W chuẩn PD 3.1',
    'Củ sạc để bàn Anker Prime 240W 4 cổng (A2643) chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CHAR-1141',
    2890000,
    3490000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%E1%BB%A7%20s%E1%BA%A1c%20%C4%91%E1%BB%83%20b%C3%A0n%20Anker%20Prime%20240W%204%20c%E1%BB%95ng%20(A2643)', '%20', '+'),
    'Củ sạc để bàn Anker Prime 240W 4 cổng (A2643)',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'bb852652-1bc0-4afe-8827-9289269826a9',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Củ sạc nhanh Baseus GaN5 Pro 100W kèm cáp 100W',
    'chargers-c-s-c-nhanh-baseus-gan5-pro-100w-k-m-c-p-100w-1142',
    '2 Type-C + 2 USB-A sạc đồng thời 4 thiết bị, công nghệ làm mát tự phát triển BCT',
    'Củ sạc nhanh Baseus GaN5 Pro 100W kèm cáp 100W chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CHAR-1142',
    850000,
    1190000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%E1%BB%A7%20s%E1%BA%A1c%20nhanh%20Baseus%20GaN5%20Pro%20100W%20k%C3%A8m%20c%C3%A1p%20100W', '%20', '+'),
    'Củ sạc nhanh Baseus GaN5 Pro 100W kèm cáp 100W',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'bb852652-1bc0-4afe-8827-9289269826a9',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Củ sạc nhanh Baseus GaN5 Pro 65W 2C1A',
    'chargers-c-s-c-nhanh-baseus-gan5-pro-65w-2c1a-1143',
    'Công suất 65W ổn định cho laptop học tập làm việc, kích thước bỏ túi tiện lợi',
    'Củ sạc nhanh Baseus GaN5 Pro 65W 2C1A chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CHAR-1143',
    550000,
    750000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%E1%BB%A7%20s%E1%BA%A1c%20nhanh%20Baseus%20GaN5%20Pro%2065W%202C1A', '%20', '+'),
    'Củ sạc nhanh Baseus GaN5 Pro 65W 2C1A',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'bb852652-1bc0-4afe-8827-9289269826a9',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Củ sạc nhanh Baseus Super Si 20W Quick Charger',
    'chargers-c-s-c-nhanh-baseus-super-si-20w-quick-charger-1144',
    'Giá thành cực mềm, sạc pin 50% cho iPhone chỉ trong 30 phút',
    'Củ sạc nhanh Baseus Super Si 20W Quick Charger chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CHAR-1144',
    160000,
    230000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%E1%BB%A7%20s%E1%BA%A1c%20nhanh%20Baseus%20Super%20Si%2020W%20Quick%20Charger', '%20', '+'),
    'Củ sạc nhanh Baseus Super Si 20W Quick Charger',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'bb852652-1bc0-4afe-8827-9289269826a9',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Củ sạc nhanh Ugreen Nexode 100W 4 cổng GaN',
    'chargers-c-s-c-nhanh-ugreen-nexode-100w-4-c-ng-gan-1145',
    'Cung cấp năng lượng mạnh mẽ cho toàn bộ hệ sinh thái đồ công nghệ trên bàn làm việc',
    'Củ sạc nhanh Ugreen Nexode 100W 4 cổng GaN chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CHAR-1145',
    990000,
    1390000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%E1%BB%A7%20s%E1%BA%A1c%20nhanh%20Ugreen%20Nexode%20100W%204%20c%E1%BB%95ng%20GaN', '%20', '+'),
    'Củ sạc nhanh Ugreen Nexode 100W 4 cổng GaN',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'bb852652-1bc0-4afe-8827-9289269826a9',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Củ sạc nhanh Ugreen Nexode Robot 65W GaN hình Robot ngộ nghĩnh',
    'chargers-c-s-c-nhanh-ugreen-nexode-robot-65w-gan-h-nh-robot-ng-ngh-nh-1146',
    'Mặt hiển thị biểu cảm LED thể hiện trạng thái pin sạc, thiết kế độc đáo cá tính',
    'Củ sạc nhanh Ugreen Nexode Robot 65W GaN hình Robot ngộ nghĩnh chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CHAR-1146',
    690000,
    890000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%E1%BB%A7%20s%E1%BA%A1c%20nhanh%20Ugreen%20Nexode%20Robot%2065W%20GaN%20h%C3%ACnh%20Robot%20ng%E1%BB%99%20ngh%C4%A9nh', '%20', '+'),
    'Củ sạc nhanh Ugreen Nexode Robot 65W GaN hình Robot ngộ nghĩnh',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'bb852652-1bc0-4afe-8827-9289269826a9',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Củ sạc nhanh Ugreen Nexode 30W Robot Mini GaN',
    'chargers-c-s-c-nhanh-ugreen-nexode-30w-robot-mini-gan-1147',
    'Chân cắm dạng đôi giày tháo rời kiêm bảo vệ chân sạc, công suất 30W chuẩn PD',
    'Củ sạc nhanh Ugreen Nexode 30W Robot Mini GaN chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CHAR-1147',
    350000,
    490000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%E1%BB%A7%20s%E1%BA%A1c%20nhanh%20Ugreen%20Nexode%2030W%20Robot%20Mini%20GaN', '%20', '+'),
    'Củ sạc nhanh Ugreen Nexode 30W Robot Mini GaN',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'bb852652-1bc0-4afe-8827-9289269826a9',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Củ sạc Apple 20W USB-C Power Adapter chính hãng',
    'chargers-c-s-c-apple-20w-usb-c-power-adapter-ch-nh-h-ng-1148',
    'Sạc chính hãng Apple tối ưu an toàn tuyệt đối cho pin của iPhone và iPad',
    'Củ sạc Apple 20W USB-C Power Adapter chính hãng chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CHAR-1148',
    520000,
    590000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%E1%BB%A7%20s%E1%BA%A1c%20Apple%2020W%20USB-C%20Power%20Adapter%20ch%C3%ADnh%20h%C3%A3ng', '%20', '+'),
    'Củ sạc Apple 20W USB-C Power Adapter chính hãng',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'bb852652-1bc0-4afe-8827-9289269826a9',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Củ sạc Apple 35W Dual USB-C Port Compact Power Adapter',
    'chargers-c-s-c-apple-35w-dual-usb-c-port-compact-power-adapter-1149',
    'Hai cổng USB-C chân gập cao cấp, sạc cùng lúc MacBook Air và iPhone',
    'Củ sạc Apple 35W Dual USB-C Port Compact Power Adapter chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CHAR-1149',
    1490000,
    1690000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%E1%BB%A7%20s%E1%BA%A1c%20Apple%2035W%20Dual%20USB-C%20Port%20Compact%20Power%20Adapter', '%20', '+'),
    'Củ sạc Apple 35W Dual USB-C Port Compact Power Adapter',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'bb852652-1bc0-4afe-8827-9289269826a9',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Củ sạc Apple 140W USB-C Power Adapter',
    'chargers-c-s-c-apple-140w-usb-c-power-adapter-1150',
    'Sạc công suất cao nhất cho MacBook Pro 16 inch sạc 50% chỉ sau 30 phút',
    'Củ sạc Apple 140W USB-C Power Adapter chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CHAR-1150',
    2790000,
    2990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%E1%BB%A7%20s%E1%BA%A1c%20Apple%20140W%20USB-C%20Power%20Adapter', '%20', '+'),
    'Củ sạc Apple 140W USB-C Power Adapter',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'bb852652-1bc0-4afe-8827-9289269826a9',
    '0cfe3523-e8b2-445a-a689-45b24810d338',
    'Củ sạc siêu nhanh Samsung 45W Type-C kèm cáp 5A',
    'chargers-c-s-c-si-u-nhanh-samsung-45w-type-c-k-m-c-p-5a-1151',
    'Chuẩn Super Fast Charging 2.0 tối đa công suất cho dòng Galaxy S24 Ultra và Z Fold',
    'Củ sạc siêu nhanh Samsung 45W Type-C kèm cáp 5A chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CHAR-1151',
    790000,
    990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Samsung', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%E1%BB%A7%20s%E1%BA%A1c%20si%C3%AAu%20nhanh%20Samsung%2045W%20Type-C%20k%C3%A8m%20c%C3%A1p%205A', '%20', '+'),
    'Củ sạc siêu nhanh Samsung 45W Type-C kèm cáp 5A',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'bb852652-1bc0-4afe-8827-9289269826a9',
    '0cfe3523-e8b2-445a-a689-45b24810d338',
    'Củ sạc nhanh Samsung 25W Type-C không cáp',
    'chargers-c-s-c-nhanh-samsung-25w-type-c-kh-ng-c-p-1152',
    'Chuẩn PD 3.0 PPS tương thích các máy Android và máy tính bảng',
    'Củ sạc nhanh Samsung 25W Type-C không cáp chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CHAR-1152',
    320000,
    450000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Samsung', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%E1%BB%A7%20s%E1%BA%A1c%20nhanh%20Samsung%2025W%20Type-C%20kh%C3%B4ng%20c%C3%A1p', '%20', '+'),
    'Củ sạc nhanh Samsung 25W Type-C không cáp',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'bb852652-1bc0-4afe-8827-9289269826a9',
    '9aef84d5-0d93-47f5-929b-51148c656f8d',
    'Củ sạc nhanh Belkin BoostCharge Pro 65W Dual USB-C GaN',
    'chargers-c-s-c-nhanh-belkin-boostcharge-pro-65w-dual-usb-c-gan-1153',
    'Chứng nhận an toàn tiêu chuẩn quốc tế, bảo vệ chống quá dòng và quá nhiệt',
    'Củ sạc nhanh Belkin BoostCharge Pro 65W Dual USB-C GaN chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CHAR-1153',
    990000,
    1290000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Belkin', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%E1%BB%A7%20s%E1%BA%A1c%20nhanh%20Belkin%20BoostCharge%20Pro%2065W%20Dual%20USB-C%20GaN', '%20', '+'),
    'Củ sạc nhanh Belkin BoostCharge Pro 65W Dual USB-C GaN',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'bb852652-1bc0-4afe-8827-9289269826a9',
    '9aef84d5-0d93-47f5-929b-51148c656f8d',
    'Đế sạc không dây 3 in 1 Belkin MagSafe 15W',
    'chargers-s-c-kh-ng-d-y-3-in-1-belkin-magsafe-15w-1154',
    'Sạc đồng thời iPhone, Apple Watch và AirPods, chứng nhận Made for MagSafe',
    'Đế sạc không dây 3 in 1 Belkin MagSafe 15W chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CHAR-1154',
    3490000,
    3990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Belkin', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%C4%90%E1%BA%BF%20s%E1%BA%A1c%20kh%C3%B4ng%20d%C3%A2y%203%20in%201%20Belkin%20MagSafe%2015W', '%20', '+'),
    'Đế sạc không dây 3 in 1 Belkin MagSafe 15W',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'bb852652-1bc0-4afe-8827-9289269826a9',
    '9608b564-cbe0-4ad5-adda-72a37cb87bd6',
    'Củ sạc nhanh Xiaomi 67W Type-A sạc Turbo',
    'chargers-c-s-c-nhanh-xiaomi-67w-type-a-s-c-turbo-1155',
    'Hỗ trợ sạc siêu tốc Mi Turbo Charge 67W cho các dòng máy Xiaomi và Redmi',
    'Củ sạc nhanh Xiaomi 67W Type-A sạc Turbo chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CHAR-1155',
    420000,
    550000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Xiaomi', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%E1%BB%A7%20s%E1%BA%A1c%20nhanh%20Xiaomi%2067W%20Type-A%20s%E1%BA%A1c%20Turbo', '%20', '+'),
    'Củ sạc nhanh Xiaomi 67W Type-A sạc Turbo',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'bb852652-1bc0-4afe-8827-9289269826a9',
    '9608b564-cbe0-4ad5-adda-72a37cb87bd6',
    'Củ sạc nhanh Xiaomi GaN 33W Type-C',
    'chargers-c-s-c-nhanh-xiaomi-gan-33w-type-c-1156',
    'Kích thước siêu nhỏ bằng ngón tay cái, công nghệ bán dẫn GaN mát mẻ',
    'Củ sạc nhanh Xiaomi GaN 33W Type-C chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CHAR-1156',
    290000,
    390000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Xiaomi', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%E1%BB%A7%20s%E1%BA%A1c%20nhanh%20Xiaomi%20GaN%2033W%20Type-C', '%20', '+'),
    'Củ sạc nhanh Xiaomi GaN 33W Type-C',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'bb852652-1bc0-4afe-8827-9289269826a9',
    '95935020-183f-44cc-a477-2a559734bdad',
    'Củ sạc ROG 65W GaN Gaming Charger cho ROG Ally',
    'chargers-c-s-c-rog-65w-gan-gaming-charger-cho-rog-ally-1157',
    'Tối ưu sạc công suất cao cho máy chơi game cầm tay ROG Ally và laptop gaming nhẹ',
    'Củ sạc ROG 65W GaN Gaming Charger cho ROG Ally chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CHAR-1157',
    1290000,
    1590000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'ASUS', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%E1%BB%A7%20s%E1%BA%A1c%20ROG%2065W%20GaN%20Gaming%20Charger%20cho%20ROG%20Ally', '%20', '+'),
    'Củ sạc ROG 65W GaN Gaming Charger cho ROG Ally',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'bb852652-1bc0-4afe-8827-9289269826a9',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Đế sạc không dây nam châm từ tính Baseus MagPro 2 in 1',
    'chargers-s-c-kh-ng-d-y-nam-ch-m-t-t-nh-baseus-magpro-2-in-1-1158',
    'Gắn hút nam châm hít chặt lưng điện thoại gập mở góc 60 độ tiện xem phim',
    'Đế sạc không dây nam châm từ tính Baseus MagPro 2 in 1 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CHAR-1158',
    650000,
    850000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%C4%90%E1%BA%BF%20s%E1%BA%A1c%20kh%C3%B4ng%20d%C3%A2y%20nam%20ch%C3%A2m%20t%E1%BB%AB%20t%C3%ADnh%20Baseus%20MagPro%202%20in%201', '%20', '+'),
    'Đế sạc không dây nam châm từ tính Baseus MagPro 2 in 1',
    1,
    true
  );
END $$;

-- ---------------------------------------------------------------------
-- DANH MỤC: CABLES (cables) - Bổ sung 21 sản phẩm -> Đủ 30 sản phẩm
-- ---------------------------------------------------------------------

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '5d1112ce-88fb-4675-b200-6ead1132d133',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Cáp sạc Anker PowerLine III Flow C to C 100W 0.9m',
    'cables-c-p-s-c-anker-powerline-iii-flow-c-to-c-100w-0-9m-1159',
    'Chất liệu silicone siêu mềm mịn chống rối, chịu uốn gập 25.000 lần',
    'Cáp sạc Anker PowerLine III Flow C to C 100W 0.9m chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CABL-1159',
    290000,
    390000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%C3%A1p%20s%E1%BA%A1c%20Anker%20PowerLine%20III%20Flow%20C%20to%20C%20100W%200.9m', '%20', '+'),
    'Cáp sạc Anker PowerLine III Flow C to C 100W 0.9m',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '5d1112ce-88fb-4675-b200-6ead1132d133',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Cáp sạc Anker 765 Type-C to Type-C 140W 1.8m chuẩn PD 3.1',
    'cables-c-p-s-c-anker-765-type-c-to-type-c-140w-1-8m-chu-n-pd-3-1-1160',
    'Hỗ trợ công suất đỉnh 140W sạc được cả máy tính trạm và laptop công suất lớn',
    'Cáp sạc Anker 765 Type-C to Type-C 140W 1.8m chuẩn PD 3.1 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CABL-1160',
    450000,
    590000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%C3%A1p%20s%E1%BA%A1c%20Anker%20765%20Type-C%20to%20Type-C%20140W%201.8m%20chu%E1%BA%A9n%20PD%203.1', '%20', '+'),
    'Cáp sạc Anker 765 Type-C to Type-C 140W 1.8m chuẩn PD 3.1',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '5d1112ce-88fb-4675-b200-6ead1132d133',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Cáp sạc Anker PowerLine+ II Lightning 0.9m bọc dù MFi',
    'cables-c-p-s-c-anker-powerline-ii-lightning-0-9m-b-c-d-mfi-1161',
    'Chứng nhận MFi của Apple, chịu kéo tải lên đến 80kg vô cùng bền bỉ',
    'Cáp sạc Anker PowerLine+ II Lightning 0.9m bọc dù MFi chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CABL-1161',
    270000,
    350000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%C3%A1p%20s%E1%BA%A1c%20Anker%20PowerLine%2B%20II%20Lightning%200.9m%20b%E1%BB%8Dc%20d%C3%B9%20MFi', '%20', '+'),
    'Cáp sạc Anker PowerLine+ II Lightning 0.9m bọc dù MFi',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '5d1112ce-88fb-4675-b200-6ead1132d133',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Cáp sạc nhanh Baseus Tungsten Gold Type-C to Type-C 100W 1m',
    'cables-c-p-s-c-nhanh-baseus-tungsten-gold-type-c-to-type-c-100w-1m-1162',
    'Đầu cắm phủ hợp kim kẽm sáng bóng chống trầy xước, chip E-Marker nhận diện công suất',
    'Cáp sạc nhanh Baseus Tungsten Gold Type-C to Type-C 100W 1m chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CABL-1162',
    120000,
    180000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%C3%A1p%20s%E1%BA%A1c%20nhanh%20Baseus%20Tungsten%20Gold%20Type-C%20to%20Type-C%20100W%201m', '%20', '+'),
    'Cáp sạc nhanh Baseus Tungsten Gold Type-C to Type-C 100W 1m',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '5d1112ce-88fb-4675-b200-6ead1132d133',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Cáp sạc Baseus Crystal Shine Type-C to Lightning 20W 1.2m',
    'cables-c-p-s-c-baseus-crystal-shine-type-c-to-lightning-20w-1-2m-1163',
    'Dây bọc vải bện mật độ cao, đầu cắm trong suốt hiện đèn báo sạc sang trọng',
    'Cáp sạc Baseus Crystal Shine Type-C to Lightning 20W 1.2m chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CABL-1163',
    110000,
    160000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%C3%A1p%20s%E1%BA%A1c%20Baseus%20Crystal%20Shine%20Type-C%20to%20Lightning%2020W%201.2m', '%20', '+'),
    'Cáp sạc Baseus Crystal Shine Type-C to Lightning 20W 1.2m',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '5d1112ce-88fb-4675-b200-6ead1132d133',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Cáp sạc 3 trong 1 Baseus Bright Mirror 2 rút gọn 66W',
    'cables-c-p-s-c-3-trong-1-baseus-bright-mirror-2-r-t-g-n-66w-1164',
    'Gồm 3 đầu Lightning, Type-C, Micro-USB, cơ chế kéo rút thu gọn chống rối gọn gàng',
    'Cáp sạc 3 trong 1 Baseus Bright Mirror 2 rút gọn 66W chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CABL-1164',
    160000,
    230000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%C3%A1p%20s%E1%BA%A1c%203%20trong%201%20Baseus%20Bright%20Mirror%202%20r%C3%BAt%20g%E1%BB%8Dn%2066W', '%20', '+'),
    'Cáp sạc 3 trong 1 Baseus Bright Mirror 2 rút gọn 66W',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '5d1112ce-88fb-4675-b200-6ead1132d133',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Cáp sạc Ugreen bọc dù Type-C to Type-C 100W 1m',
    'cables-c-p-s-c-ugreen-b-c-d-type-c-to-type-c-100w-1m-1165',
    'Lõi đồng nguyên chất dày dặn hỗ trợ sạc nhanh Quick Charge 4.0 và Power Delivery',
    'Cáp sạc Ugreen bọc dù Type-C to Type-C 100W 1m chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CABL-1165',
    130000,
    190000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%C3%A1p%20s%E1%BA%A1c%20Ugreen%20b%E1%BB%8Dc%20d%C3%B9%20Type-C%20to%20Type-C%20100W%201m', '%20', '+'),
    'Cáp sạc Ugreen bọc dù Type-C to Type-C 100W 1m',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '5d1112ce-88fb-4675-b200-6ead1132d133',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Cáp Thunderbolt 4 Ugreen 40Gbps hỗ trợ xuất 8K 100W 0.8m',
    'cables-c-p-thunderbolt-4-ugreen-40gbps-h-tr-xu-t-8k-100w-0-8m-1166',
    'Băng thông siêu tốc 40Gbps, truyền phim 4K chỉ vài giây, xuất màn hình 8K@60Hz',
    'Cáp Thunderbolt 4 Ugreen 40Gbps hỗ trợ xuất 8K 100W 0.8m chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CABL-1166',
    890000,
    1190000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%C3%A1p%20Thunderbolt%204%20Ugreen%2040Gbps%20h%E1%BB%97%20tr%E1%BB%A3%20xu%E1%BA%A5t%208K%20100W%200.8m', '%20', '+'),
    'Cáp Thunderbolt 4 Ugreen 40Gbps hỗ trợ xuất 8K 100W 0.8m',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '5d1112ce-88fb-4675-b200-6ead1132d133',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Cáp chuyển đổi HDMI sang HDMI 2.1 Ugreen 8K 2m',
    'cables-c-p-chuy-n-i-hdmi-sang-hdmi-2-1-ugreen-8k-2m-1167',
    'Băng thông 48Gbps, hỗ trợ Dynamic HDR và tần số quét 4K@120Hz chuyên game',
    'Cáp chuyển đổi HDMI sang HDMI 2.1 Ugreen 8K 2m chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CABL-1167',
    250000,
    350000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%C3%A1p%20chuy%E1%BB%83n%20%C4%91%E1%BB%95i%20HDMI%20sang%20HDMI%202.1%20Ugreen%208K%202m', '%20', '+'),
    'Cáp chuyển đổi HDMI sang HDMI 2.1 Ugreen 8K 2m',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '5d1112ce-88fb-4675-b200-6ead1132d133',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Cáp sạc Apple bọc dù Type-C to Type-C 60W 1m',
    'cables-c-p-s-c-apple-b-c-d-type-c-to-type-c-60w-1m-1168',
    'Dây dệt màu trắng trang nhã chính hãng phân phối đi kèm trong hộp MacBook',
    'Cáp sạc Apple bọc dù Type-C to Type-C 60W 1m chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CABL-1168',
    520000,
    590000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%C3%A1p%20s%E1%BA%A1c%20Apple%20b%E1%BB%8Dc%20d%C3%B9%20Type-C%20to%20Type-C%2060W%201m', '%20', '+'),
    'Cáp sạc Apple bọc dù Type-C to Type-C 60W 1m',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '5d1112ce-88fb-4675-b200-6ead1132d133',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Cáp sạc Apple USB-C sang MagSafe 3 2m chính hãng',
    'cables-c-p-s-c-apple-usb-c-sang-magsafe-3-2m-ch-nh-h-ng-1169',
    'Cổng sạc nam châm hít MagSafe 3 chống vấp ngã giật đứt dây cho MacBook',
    'Cáp sạc Apple USB-C sang MagSafe 3 2m chính hãng chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CABL-1169',
    1490000,
    1690000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%C3%A1p%20s%E1%BA%A1c%20Apple%20USB-C%20sang%20MagSafe%203%202m%20ch%C3%ADnh%20h%C3%A3ng', '%20', '+'),
    'Cáp sạc Apple USB-C sang MagSafe 3 2m chính hãng',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '5d1112ce-88fb-4675-b200-6ead1132d133',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Cáp Apple Thunderbolt 4 Pro 1m màu đen bọc dù',
    'cables-c-p-apple-thunderbolt-4-pro-1m-m-u-en-b-c-d-1170',
    'Chuẩn kết nối cao cấp nhất của Apple hỗ trợ kết nối eGPU, màn hình Studio Display',
    'Cáp Apple Thunderbolt 4 Pro 1m màu đen bọc dù chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CABL-1170',
    1890000,
    2090000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%C3%A1p%20Apple%20Thunderbolt%204%20Pro%201m%20m%C3%A0u%20%C4%91en%20b%E1%BB%8Dc%20d%C3%B9', '%20', '+'),
    'Cáp Apple Thunderbolt 4 Pro 1m màu đen bọc dù',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '5d1112ce-88fb-4675-b200-6ead1132d133',
    '9aef84d5-0d93-47f5-929b-51148c656f8d',
    'Cáp sạc bọc dù Belkin BoostCharge Pro Flex C to C 100W 2m',
    'cables-c-p-s-c-b-c-d-belkin-boostcharge-pro-flex-c-to-c-100w-2m-1171',
    'Silicone bọc sợi dù kép bền gấp 30 lần cáp thông thường, kèm nút nam châm dán bàn',
    'Cáp sạc bọc dù Belkin BoostCharge Pro Flex C to C 100W 2m chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CABL-1171',
    490000,
    650000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Belkin', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%C3%A1p%20s%E1%BA%A1c%20b%E1%BB%8Dc%20d%C3%B9%20Belkin%20BoostCharge%20Pro%20Flex%20C%20to%20C%20100W%202m', '%20', '+'),
    'Cáp sạc bọc dù Belkin BoostCharge Pro Flex C to C 100W 2m',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '5d1112ce-88fb-4675-b200-6ead1132d133',
    '9aef84d5-0d93-47f5-929b-51148c656f8d',
    'Cáp sạc Belkin Type-C sang Lightning chuẩn MFi 1m',
    'cables-c-p-s-c-belkin-type-c-sang-lightning-chu-n-mfi-1m-1172',
    'Đảm bảo tương thích 100% với các đời iPhone, an toàn không báo phụ kiện không hỗ trợ',
    'Cáp sạc Belkin Type-C sang Lightning chuẩn MFi 1m chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CABL-1172',
    320000,
    420000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Belkin', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%C3%A1p%20s%E1%BA%A1c%20Belkin%20Type-C%20sang%20Lightning%20chu%E1%BA%A9n%20MFi%201m', '%20', '+'),
    'Cáp sạc Belkin Type-C sang Lightning chuẩn MFi 1m',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '5d1112ce-88fb-4675-b200-6ead1132d133',
    '0cfe3523-e8b2-445a-a689-45b24810d338',
    'Cáp sạc Samsung Type-C to Type-C 5A 1.8m chính hãng',
    'cables-c-p-s-c-samsung-type-c-to-type-c-5a-1-8m-ch-nh-h-ng-1173',
    'Chịu dòng điện lên đến 5A kích hoạt sạc siêu nhanh 45W cho flagship Samsung',
    'Cáp sạc Samsung Type-C to Type-C 5A 1.8m chính hãng chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CABL-1173',
    190000,
    250000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Samsung', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%C3%A1p%20s%E1%BA%A1c%20Samsung%20Type-C%20to%20Type-C%205A%201.8m%20ch%C3%ADnh%20h%C3%A3ng', '%20', '+'),
    'Cáp sạc Samsung Type-C to Type-C 5A 1.8m chính hãng',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '5d1112ce-88fb-4675-b200-6ead1132d133',
    '9608b564-cbe0-4ad5-adda-72a37cb87bd6',
    'Cáp sạc nhanh Xiaomi Type-C 6A 1m dây bện',
    'cables-c-p-s-c-nhanh-xiaomi-type-c-6a-1m-d-y-b-n-1174',
    'Kích hoạt chuẩn sạc 67W và 120W HyperCharge cho điện thoại Xiaomi',
    'Cáp sạc nhanh Xiaomi Type-C 6A 1m dây bện chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CABL-1174',
    150000,
    220000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Xiaomi', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%C3%A1p%20s%E1%BA%A1c%20nhanh%20Xiaomi%20Type-C%206A%201m%20d%C3%A2y%20b%E1%BB%87n', '%20', '+'),
    'Cáp sạc nhanh Xiaomi Type-C 6A 1m dây bện',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '5d1112ce-88fb-4675-b200-6ead1132d133',
    '17f517e8-9194-4e4f-bdb3-c86b85812e73',
    'Cáp sạc gaming Razer Speedflex Type-C 1.8m',
    'cables-c-p-s-c-gaming-razer-speedflex-type-c-1-8m-1175',
    'Dây vải mềm nhẹ không tạo lực cản khi cắm vừa sạc vừa di chuột chơi game',
    'Cáp sạc gaming Razer Speedflex Type-C 1.8m chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CABL-1175',
    490000,
    650000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Razer', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%C3%A1p%20s%E1%BA%A1c%20gaming%20Razer%20Speedflex%20Type-C%201.8m', '%20', '+'),
    'Cáp sạc gaming Razer Speedflex Type-C 1.8m',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '5d1112ce-88fb-4675-b200-6ead1132d133',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Cáp chuyển đổi âm thanh Type-C sang 3.5mm Baseus L54',
    'cables-c-p-chuy-n-i-m-thanh-type-c-sang-3-5mm-baseus-l54-1176',
    'Tích hợp chip DAC giải mã âm thanh chất lượng cao cho điện thoại bỏ jack 3.5',
    'Cáp chuyển đổi âm thanh Type-C sang 3.5mm Baseus L54 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CABL-1176',
    95000,
    140000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%C3%A1p%20chuy%E1%BB%83n%20%C4%91%E1%BB%95i%20%C3%A2m%20thanh%20Type-C%20sang%203.5mm%20Baseus%20L54', '%20', '+'),
    'Cáp chuyển đổi âm thanh Type-C sang 3.5mm Baseus L54',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '5d1112ce-88fb-4675-b200-6ead1132d133',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Cáp nối dài USB 3.0 Ugreen 2m chống nhiễu',
    'cables-c-p-n-i-d-i-usb-3-0-ugreen-2m-ch-ng-nhi-u-1177',
    'Đầu mạ vàng 24K, tốc độ 5Gbps kéo dài cổng kết nối từ sau case máy tính ra bàn',
    'Cáp nối dài USB 3.0 Ugreen 2m chống nhiễu chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CABL-1177',
    110000,
    160000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%C3%A1p%20n%E1%BB%91i%20d%C3%A0i%20USB%203.0%20Ugreen%202m%20ch%E1%BB%91ng%20nhi%E1%BB%85u', '%20', '+'),
    'Cáp nối dài USB 3.0 Ugreen 2m chống nhiễu',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '5d1112ce-88fb-4675-b200-6ead1132d133',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Cáp sạc Anker 322 Type-C to Lightning bọc dù 1.8m',
    'cables-c-p-s-c-anker-322-type-c-to-lightning-b-c-d-1-8m-1178',
    'Độ dài 1.8m thoải mái cắm sạc trên giường ngủ hoặc ghế sofa',
    'Cáp sạc Anker 322 Type-C to Lightning bọc dù 1.8m chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CABL-1178',
    290000,
    390000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%C3%A1p%20s%E1%BA%A1c%20Anker%20322%20Type-C%20to%20Lightning%20b%E1%BB%8Dc%20d%C3%B9%201.8m', '%20', '+'),
    'Cáp sạc Anker 322 Type-C to Lightning bọc dù 1.8m',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '5d1112ce-88fb-4675-b200-6ead1132d133',
    '9aef84d5-0d93-47f5-929b-51148c656f8d',
    'Cáp mạng LAN CAT6 Belkin 3m đầu đúc',
    'cables-c-p-m-ng-lan-cat6-belkin-3m-u-c-1179',
    'Băng thông gigabit 1000Mbps, chống nhiễu suy hao tín hiệu khi chơi game online',
    'Cáp mạng LAN CAT6 Belkin 3m đầu đúc chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-CABL-1179',
    150000,
    210000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Belkin', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%C3%A1p%20m%E1%BA%A1ng%20LAN%20CAT6%20Belkin%203m%20%C4%91%E1%BA%A7u%20%C4%91%C3%BAc', '%20', '+'),
    'Cáp mạng LAN CAT6 Belkin 3m đầu đúc',
    1,
    true
  );
END $$;

-- ---------------------------------------------------------------------
-- DANH MỤC: POWER BANKS (power-banks) - Bổ sung 21 sản phẩm -> Đủ 30 sản phẩm
-- ---------------------------------------------------------------------

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd605176d-160d-4cee-8a5d-bc9afa791a6d',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Pin dự phòng Anker 737 PowerCore 24.000mAh 140W (A1289)',
    'power-banks-pin-d-ph-ng-anker-737-powercore-24-000mah-140w-a1289-1180',
    'Màn hình màu thông minh thể hiện công suất sạc từng cổng, sạc nhanh 140W 2 chiều cho cả laptop',
    'Pin dự phòng Anker 737 PowerCore 24.000mAh 140W (A1289) chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-POWE-1180',
    2490000,
    2990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Pin%20d%E1%BB%B1%20ph%C3%B2ng%20Anker%20737%20PowerCore%2024.000mAh%20140W%20(A1289)', '%20', '+'),
    'Pin dự phòng Anker 737 PowerCore 24.000mAh 140W (A1289)',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd605176d-160d-4cee-8a5d-bc9afa791a6d',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Pin sạc dự phòng Anker MagGo 10.000mAh chuẩn Qi2 15W (A1654)',
    'power-banks-pin-s-c-d-ph-ng-anker-maggo-10-000mah-chu-n-qi2-15w-a1654-1181',
    'Chứng nhận sạc không dây Qi2 15W hít nam châm lưng máy, chân chống dựng xem video',
    'Pin sạc dự phòng Anker MagGo 10.000mAh chuẩn Qi2 15W (A1654) chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-POWE-1181',
    1490000,
    1890000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Pin%20s%E1%BA%A1c%20d%E1%BB%B1%20ph%C3%B2ng%20Anker%20MagGo%2010.000mAh%20chu%E1%BA%A9n%20Qi2%2015W%20(A1654)', '%20', '+'),
    'Pin sạc dự phòng Anker MagGo 10.000mAh chuẩn Qi2 15W (A1654)',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd605176d-160d-4cee-8a5d-bc9afa791a6d',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Pin sạc dự phòng Anker Nano 5.000mAh chân gập Type-C (A1653)',
    'power-banks-pin-s-c-d-ph-ng-anker-nano-5-000mah-ch-n-g-p-type-c-a1653-1182',
    'Cắm trực tiếp đuôi điện thoại không cần dây, kích thước siêu nhỏ như thỏi son',
    'Pin sạc dự phòng Anker Nano 5.000mAh chân gập Type-C (A1653) chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-POWE-1182',
    590000,
    790000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Pin%20s%E1%BA%A1c%20d%E1%BB%B1%20ph%C3%B2ng%20Anker%20Nano%205.000mAh%20ch%C3%A2n%20g%E1%BA%ADp%20Type-C%20(A1653)', '%20', '+'),
    'Pin sạc dự phòng Anker Nano 5.000mAh chân gập Type-C (A1653)',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd605176d-160d-4cee-8a5d-bc9afa791a6d',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Pin dự phòng Anker Prime 20.000mAh 200W (A1336)',
    'power-banks-pin-d-ph-ng-anker-prime-20-000mah-200w-a1336-1183',
    'Công suất đồng thời 200W, sạc đầy pin dự phòng chỉ trong 1 giờ 15 phút',
    'Pin dự phòng Anker Prime 20.000mAh 200W (A1336) chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-POWE-1183',
    2190000,
    2690000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Pin%20d%E1%BB%B1%20ph%C3%B2ng%20Anker%20Prime%2020.000mAh%20200W%20(A1336)', '%20', '+'),
    'Pin dự phòng Anker Prime 20.000mAh 200W (A1336)',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd605176d-160d-4cee-8a5d-bc9afa791a6d',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Pin dự phòng Baseus Blade 100W 20.000mAh siêu mỏng',
    'power-banks-pin-d-ph-ng-baseus-blade-100w-20-000mah-si-u-m-ng-1184',
    'Độ dày chỉ 18mm như một quyển sổ tay, chuyên dùng sạc laptop trên các chuyến bay',
    'Pin dự phòng Baseus Blade 100W 20.000mAh siêu mỏng chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-POWE-1184',
    1390000,
    1790000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Pin%20d%E1%BB%B1%20ph%C3%B2ng%20Baseus%20Blade%20100W%2020.000mAh%20si%C3%AAu%20m%E1%BB%8Fng', '%20', '+'),
    'Pin dự phòng Baseus Blade 100W 20.000mAh siêu mỏng',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd605176d-160d-4cee-8a5d-bc9afa791a6d',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Pin sạc dự phòng không dây từ tính Baseus Magnetic 10.000mAh 20W',
    'power-banks-pin-s-c-d-ph-ng-kh-ng-d-y-t-t-nh-baseus-magnetic-10-000mah-20w-1185',
    'Lực hút nam châm mạnh 3500Gs, sạc có dây 20W và không dây MagSafe 7.5W',
    'Pin sạc dự phòng không dây từ tính Baseus Magnetic 10.000mAh 20W chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-POWE-1185',
    620000,
    850000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Pin%20s%E1%BA%A1c%20d%E1%BB%B1%20ph%C3%B2ng%20kh%C3%B4ng%20d%C3%A2y%20t%E1%BB%AB%20t%C3%ADnh%20Baseus%20Magnetic%2010.000mAh%2020W', '%20', '+'),
    'Pin sạc dự phòng không dây từ tính Baseus Magnetic 10.000mAh 20W',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd605176d-160d-4cee-8a5d-bc9afa791a6d',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Pin sạc dự phòng Baseus Adaman 20.000mAh 65W vỏ kim loại',
    'power-banks-pin-s-c-d-ph-ng-baseus-adaman-20-000mah-65w-v-kim-lo-i-1186',
    'Vỏ kim loại sang trọng giọt nước hiển thị số % pin kỹ thuật số',
    'Pin sạc dự phòng Baseus Adaman 20.000mAh 65W vỏ kim loại chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-POWE-1186',
    890000,
    1190000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Pin%20s%E1%BA%A1c%20d%E1%BB%B1%20ph%C3%B2ng%20Baseus%20Adaman%2020.000mAh%2065W%20v%E1%BB%8F%20kim%20lo%E1%BA%A1i', '%20', '+'),
    'Pin sạc dự phòng Baseus Adaman 20.000mAh 65W vỏ kim loại',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd605176d-160d-4cee-8a5d-bc9afa791a6d',
    '9608b564-cbe0-4ad5-adda-72a37cb87bd6',
    'Pin sạc dự phòng Xiaomi Power Bank 3 20.000mAh 50W',
    'power-banks-pin-s-c-d-ph-ng-xiaomi-power-bank-3-20-000mah-50w-1187',
    'Sạc nhanh 50W cho điện thoại và laptop văn phòng, dung lượng chuẩn bay quốc tế',
    'Pin sạc dự phòng Xiaomi Power Bank 3 20.000mAh 50W chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-POWE-1187',
    790000,
    990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Xiaomi', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Pin%20s%E1%BA%A1c%20d%E1%BB%B1%20ph%C3%B2ng%20Xiaomi%20Power%20Bank%203%2020.000mAh%2050W', '%20', '+'),
    'Pin sạc dự phòng Xiaomi Power Bank 3 20.000mAh 50W',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd605176d-160d-4cee-8a5d-bc9afa791a6d',
    '9608b564-cbe0-4ad5-adda-72a37cb87bd6',
    'Pin sạc dự phòng tích hợp cáp Xiaomi 10.000mAh 22.5W',
    'power-banks-pin-s-c-d-ph-ng-t-ch-h-p-c-p-xiaomi-10-000mah-22-5w-1188',
    'Có sẵn dây cáp Type-C gắn liền trên thân pin tiện dụng không sợ để quên dây ở nhà',
    'Pin sạc dự phòng tích hợp cáp Xiaomi 10.000mAh 22.5W chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-POWE-1188',
    390000,
    490000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Xiaomi', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Pin%20s%E1%BA%A1c%20d%E1%BB%B1%20ph%C3%B2ng%20t%C3%ADch%20h%E1%BB%A3p%20c%C3%A1p%20Xiaomi%2010.000mAh%2022.5W', '%20', '+'),
    'Pin sạc dự phòng tích hợp cáp Xiaomi 10.000mAh 22.5W',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd605176d-160d-4cee-8a5d-bc9afa791a6d',
    '9608b564-cbe0-4ad5-adda-72a37cb87bd6',
    'Pin sạc dự phòng từ tính Xiaomi Magnetic Wireless 5.000mAh',
    'power-banks-pin-s-c-d-ph-ng-t-t-nh-xiaomi-magnetic-wireless-5-000mah-1189',
    'Kích thước siêu mỏng ôm trọn thân iPhone, có đế dựng sạc để bàn thông minh',
    'Pin sạc dự phòng từ tính Xiaomi Magnetic Wireless 5.000mAh chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-POWE-1189',
    550000,
    690000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Xiaomi', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Pin%20s%E1%BA%A1c%20d%E1%BB%B1%20ph%C3%B2ng%20t%E1%BB%AB%20t%C3%ADnh%20Xiaomi%20Magnetic%20Wireless%205.000mAh', '%20', '+'),
    'Pin sạc dự phòng từ tính Xiaomi Magnetic Wireless 5.000mAh',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd605176d-160d-4cee-8a5d-bc9afa791a6d',
    '0cfe3523-e8b2-445a-a689-45b24810d338',
    'Pin sạc dự phòng Samsung 10.000mAh 25W EB-P3400',
    'power-banks-pin-s-c-d-ph-ng-samsung-10-000mah-25w-eb-p3400-1190',
    'Chất liệu thân thiện môi trường tái chế UL, chuẩn sạc siêu nhanh 25W Super Fast Charging',
    'Pin sạc dự phòng Samsung 10.000mAh 25W EB-P3400 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-POWE-1190',
    590000,
    790000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Samsung', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Pin%20s%E1%BA%A1c%20d%E1%BB%B1%20ph%C3%B2ng%20Samsung%2010.000mAh%2025W%20EB-P3400', '%20', '+'),
    'Pin sạc dự phòng Samsung 10.000mAh 25W EB-P3400',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd605176d-160d-4cee-8a5d-bc9afa791a6d',
    '0cfe3523-e8b2-445a-a689-45b24810d338',
    'Pin sạc dự phòng sạc không dây Samsung 10.000mAh 25W EB-U2510',
    'power-banks-pin-s-c-d-ph-ng-s-c-kh-ng-d-y-samsung-10-000mah-25w-eb-u2510-1191',
    'Sạc không dây cho cả đồng hồ Galaxy Watch và tai nghe Galaxy Buds tiện lợi',
    'Pin sạc dự phòng sạc không dây Samsung 10.000mAh 25W EB-U2510 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-POWE-1191',
    990000,
    1290000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Samsung', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Pin%20s%E1%BA%A1c%20d%E1%BB%B1%20ph%C3%B2ng%20s%E1%BA%A1c%20kh%C3%B4ng%20d%C3%A2y%20Samsung%2010.000mAh%2025W%20EB-U2510', '%20', '+'),
    'Pin sạc dự phòng sạc không dây Samsung 10.000mAh 25W EB-U2510',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd605176d-160d-4cee-8a5d-bc9afa791a6d',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Pin dự phòng Ugreen 145W 25.000mAh 3 cổng (PB205)',
    'power-banks-pin-d-ph-ng-ugreen-145w-25-000mah-3-c-ng-pb205-1192',
    'Sạc đầy 1.3 lần MacBook Air M2, hỗ trợ sạc nhanh chuẩn PD 3.0 và QC 3.0',
    'Pin dự phòng Ugreen 145W 25.000mAh 3 cổng (PB205) chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-POWE-1192',
    1690000,
    2190000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Pin%20d%E1%BB%B1%20ph%C3%B2ng%20Ugreen%20145W%2025.000mAh%203%20c%E1%BB%95ng%20(PB205)', '%20', '+'),
    'Pin dự phòng Ugreen 145W 25.000mAh 3 cổng (PB205)',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd605176d-160d-4cee-8a5d-bc9afa791a6d',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Pin sạc dự phòng không dây Ugreen 10.000mAh MagSafe kèm giá đỡ',
    'power-banks-pin-s-c-d-ph-ng-kh-ng-d-y-ugreen-10-000mah-magsafe-k-m-gi-1193',
    'Thiết kế bo cong công thái học, không làm cấn cụm camera lồi của điện thoại',
    'Pin sạc dự phòng không dây Ugreen 10.000mAh MagSafe kèm giá đỡ chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-POWE-1193',
    690000,
    890000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Pin%20s%E1%BA%A1c%20d%E1%BB%B1%20ph%C3%B2ng%20kh%C3%B4ng%20d%C3%A2y%20Ugreen%2010.000mAh%20MagSafe%20k%C3%A8m%20gi%C3%A1%20%C4%91%E1%BB%A1', '%20', '+'),
    'Pin sạc dự phòng không dây Ugreen 10.000mAh MagSafe kèm giá đỡ',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd605176d-160d-4cee-8a5d-bc9afa791a6d',
    '9aef84d5-0d93-47f5-929b-51148c656f8d',
    'Pin sạc dự phòng Belkin BoostCharge Magnetic 5.000mAh',
    'power-banks-pin-s-c-d-ph-ng-belkin-boostcharge-magnetic-5-000mah-1194',
    'Bảo hành đổi mới 2 năm, tiêu chuẩn kiểm định an toàn cháy nổ cao cấp nhất',
    'Pin sạc dự phòng Belkin BoostCharge Magnetic 5.000mAh chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-POWE-1194',
    990000,
    1290000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Belkin', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Pin%20s%E1%BA%A1c%20d%E1%BB%B1%20ph%C3%B2ng%20Belkin%20BoostCharge%20Magnetic%205.000mAh', '%20', '+'),
    'Pin sạc dự phòng Belkin BoostCharge Magnetic 5.000mAh',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd605176d-160d-4cee-8a5d-bc9afa791a6d',
    '9aef84d5-0d93-47f5-929b-51148c656f8d',
    'Pin dự phòng Belkin BoostCharge 20.000mAh 15W 3 cổng',
    'power-banks-pin-d-ph-ng-belkin-boostcharge-20-000mah-15w-3-c-ng-1195',
    'Cung cấp năng lượng dự phòng cho 77 giờ sử dụng điện thoại thông minh',
    'Pin dự phòng Belkin BoostCharge 20.000mAh 15W 3 cổng chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-POWE-1195',
    790000,
    990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Belkin', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Pin%20d%E1%BB%B1%20ph%C3%B2ng%20Belkin%20BoostCharge%2020.000mAh%2015W%203%20c%E1%BB%95ng', '%20', '+'),
    'Pin dự phòng Belkin BoostCharge 20.000mAh 15W 3 cổng',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd605176d-160d-4cee-8a5d-bc9afa791a6d',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Pin sạc dự phòng Apple MagSafe Battery Pack White',
    'power-banks-pin-s-c-d-ph-ng-apple-magsafe-battery-pack-white-1196',
    'Hiển thị dung lượng trực tiếp trên widget màn hình khóa iOS, sạc ngược thông minh',
    'Pin sạc dự phòng Apple MagSafe Battery Pack White chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-POWE-1196',
    2490000,
    2790000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Pin%20s%E1%BA%A1c%20d%E1%BB%B1%20ph%C3%B2ng%20Apple%20MagSafe%20Battery%20Pack%20White', '%20', '+'),
    'Pin sạc dự phòng Apple MagSafe Battery Pack White',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd605176d-160d-4cee-8a5d-bc9afa791a6d',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Pin dự phòng Anker 325 PowerCore 20.000mAh (A1286)',
    'power-banks-pin-d-ph-ng-anker-325-powercore-20-000mah-a1286-1197',
    'Pin dung lượng trâu thiết kế vân nhám chống bám dấu vân tay, 2 cổng sạc USB',
    'Pin dự phòng Anker 325 PowerCore 20.000mAh (A1286) chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-POWE-1197',
    690000,
    890000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Pin%20d%E1%BB%B1%20ph%C3%B2ng%20Anker%20325%20PowerCore%2020.000mAh%20(A1286)', '%20', '+'),
    'Pin dự phòng Anker 325 PowerCore 20.000mAh (A1286)',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd605176d-160d-4cee-8a5d-bc9afa791a6d',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Pin dự phòng mini Baseus Bipow 10.000mAh 20W LED',
    'power-banks-pin-d-ph-ng-mini-baseus-bipow-10-000mah-20w-led-1198',
    'Màn hình LED báo pin sắc nét, bảo vệ 9 lớp mạch điện an toàn chống chập cháy',
    'Pin dự phòng mini Baseus Bipow 10.000mAh 20W LED chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-POWE-1198',
    320000,
    450000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Pin%20d%E1%BB%B1%20ph%C3%B2ng%20mini%20Baseus%20Bipow%2010.000mAh%2020W%20LED', '%20', '+'),
    'Pin dự phòng mini Baseus Bipow 10.000mAh 20W LED',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd605176d-160d-4cee-8a5d-bc9afa791a6d',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Pin dự phòng mini Ugreen 10.000mAh 30W sạc nhanh hai chiều',
    'power-banks-pin-d-ph-ng-mini-ugreen-10-000mah-30w-s-c-nhanh-hai-chi-u-1199',
    'Công suất 30W nạp pin siêu tốc cho cả iPad Air và iPhone 16',
    'Pin dự phòng mini Ugreen 10.000mAh 30W sạc nhanh hai chiều chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-POWE-1199',
    520000,
    690000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Pin%20d%E1%BB%B1%20ph%C3%B2ng%20mini%20Ugreen%2010.000mAh%2030W%20s%E1%BA%A1c%20nhanh%20hai%20chi%E1%BB%81u', '%20', '+'),
    'Pin dự phòng mini Ugreen 10.000mAh 30W sạc nhanh hai chiều',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'd605176d-160d-4cee-8a5d-bc9afa791a6d',
    '9608b564-cbe0-4ad5-adda-72a37cb87bd6',
    'Pin sạc dự phòng Xiaomi Pocket Edition Pro 10.000mAh 33W',
    'power-banks-pin-s-c-d-ph-ng-xiaomi-pocket-edition-pro-10-000mah-33w-1200',
    'Lõi pin chuẩn xe điện độ bền cực cao, sạc nhanh cho máy tính bảng và điện thoại',
    'Pin sạc dự phòng Xiaomi Pocket Edition Pro 10.000mAh 33W chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-POWE-1200',
    590000,
    750000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Xiaomi', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Pin%20s%E1%BA%A1c%20d%E1%BB%B1%20ph%C3%B2ng%20Xiaomi%20Pocket%20Edition%20Pro%2010.000mAh%2033W', '%20', '+'),
    'Pin sạc dự phòng Xiaomi Pocket Edition Pro 10.000mAh 33W',
    1,
    true
  );
END $$;

-- ---------------------------------------------------------------------
-- DANH MỤC: HUBS & ADAPTERS (hubs-adapters) - Bổ sung 22 sản phẩm -> Đủ 30 sản phẩm
-- ---------------------------------------------------------------------

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'da02df1b-2a67-4c89-923c-f5f324d14734',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Hub chuyển đổi Ugreen Revodok Pro 109 9 trong 1 4K@60Hz 100W',
    'hubs-adapters-hub-chuy-n-i-ugreen-revodok-pro-109-9-trong-1-4k-60hz-100w-1201',
    'Gồm HDMI 4K@60Hz, 3 cổng USB 3.0, khe thẻ SD/TF, cổng mạng LAN RJ45 Gigabit và sạc PD 100W',
    'Hub chuyển đổi Ugreen Revodok Pro 109 9 trong 1 4K@60Hz 100W chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HUBS-1201',
    890000,
    1190000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Hub%20chuy%E1%BB%83n%20%C4%91%E1%BB%95i%20Ugreen%20Revodok%20Pro%20109%209%20trong%201%204K%4060Hz%20100W', '%20', '+'),
    'Hub chuyển đổi Ugreen Revodok Pro 109 9 trong 1 4K@60Hz 100W',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'da02df1b-2a67-4c89-923c-f5f324d14734',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Hub Type-C Ugreen Revodok 107 7 trong 1 Dual 4K HDMI',
    'hubs-adapters-hub-type-c-ugreen-revodok-107-7-trong-1-dual-4k-hdmi-1202',
    'Xuất 2 màn hình phụ cùng lúc tiện làm việc lập trình viên và kế toán tài chính',
    'Hub Type-C Ugreen Revodok 107 7 trong 1 Dual 4K HDMI chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HUBS-1202',
    750000,
    990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Hub%20Type-C%20Ugreen%20Revodok%20107%207%20trong%201%20Dual%204K%20HDMI', '%20', '+'),
    'Hub Type-C Ugreen Revodok 107 7 trong 1 Dual 4K HDMI',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'da02df1b-2a67-4c89-923c-f5f324d14734',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Hub chia 4 cổng USB 3.0 Ugreen 1m kèm nguồn phụ',
    'hubs-adapters-hub-chia-4-c-ng-usb-3-0-ugreen-1m-k-m-ngu-n-ph-1203',
    'Mở rộng cắm chuột, bàn phím, USB cho case máy tính và laptop thiếu cổng',
    'Hub chia 4 cổng USB 3.0 Ugreen 1m kèm nguồn phụ chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HUBS-1203',
    250000,
    350000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Hub%20chia%204%20c%E1%BB%95ng%20USB%203.0%20Ugreen%201m%20k%C3%A8m%20ngu%E1%BB%93n%20ph%E1%BB%A5', '%20', '+'),
    'Hub chia 4 cổng USB 3.0 Ugreen 1m kèm nguồn phụ',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'da02df1b-2a67-4c89-923c-f5f324d14734',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Đầu đọc thẻ nhớ SD/TF chuẩn Type-C và USB 3.0 Ugreen',
    'hubs-adapters-u-c-th-nh-sd-tf-chu-n-type-c-v-usb-3-0-ugreen-1204',
    'Đọc đồng thời 2 thẻ nhớ tốc độ cao 5Gbps cho nhiếp ảnh gia copy ảnh vào laptop',
    'Đầu đọc thẻ nhớ SD/TF chuẩn Type-C và USB 3.0 Ugreen chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HUBS-1204',
    210000,
    290000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%C4%90%E1%BA%A7u%20%C4%91%E1%BB%8Dc%20th%E1%BA%BB%20nh%E1%BB%9B%20SD%2FTF%20chu%E1%BA%A9n%20Type-C%20v%C3%A0%20USB%203.0%20Ugreen', '%20', '+'),
    'Đầu đọc thẻ nhớ SD/TF chuẩn Type-C và USB 3.0 Ugreen',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'da02df1b-2a67-4c89-923c-f5f324d14734',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Hub chuyển đổi Baseus Metal Glam Series 8 trong 1 4K@60Hz',
    'hubs-adapters-hub-chuy-n-i-baseus-metal-glam-series-8-trong-1-4k-60hz-1205',
    'Vỏ hợp kim nhôm tản nhiệt băng giá, cổng HDMI hỗ trợ chuẩn hình ảnh 4K sắc nét',
    'Hub chuyển đổi Baseus Metal Glam Series 8 trong 1 4K@60Hz chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HUBS-1205',
    790000,
    1050000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Hub%20chuy%E1%BB%83n%20%C4%91%E1%BB%95i%20Baseus%20Metal%20Glam%20Series%208%20trong%201%204K%4060Hz', '%20', '+'),
    'Hub chuyển đổi Baseus Metal Glam Series 8 trong 1 4K@60Hz',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'da02df1b-2a67-4c89-923c-f5f324d14734',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Hub chuyển đổi Baseus StarJoy 6 trong 1 Type-C sang HDMI 4K',
    'hubs-adapters-hub-chuy-n-i-baseus-starjoy-6-trong-1-type-c-sang-hdmi-4k-1206',
    'Thiết kế cong nhẹ thanh thoát, đáp ứng toàn diện nhu cầu trình chiếu văn phòng',
    'Hub chuyển đổi Baseus StarJoy 6 trong 1 Type-C sang HDMI 4K chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HUBS-1206',
    490000,
    690000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Hub%20chuy%E1%BB%83n%20%C4%91%E1%BB%95i%20Baseus%20StarJoy%206%20trong%201%20Type-C%20sang%20HDMI%204K', '%20', '+'),
    'Hub chuyển đổi Baseus StarJoy 6 trong 1 Type-C sang HDMI 4K',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'da02df1b-2a67-4c89-923c-f5f324d14734',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Đầu chuyển OTG Type-C sang USB 3.0 Baseus Ingenuity kim loại',
    'hubs-adapters-u-chuy-n-otg-type-c-sang-usb-3-0-baseus-ingenuity-kim-lo-i-1207',
    'Kích thước siêu tí hon bằng đầu ngón tay cắm nối USB trực tiếp vào điện thoại, iPad',
    'Đầu chuyển OTG Type-C sang USB 3.0 Baseus Ingenuity kim loại chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HUBS-1207',
    75000,
    110000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%C4%90%E1%BA%A7u%20chuy%E1%BB%83n%20OTG%20Type-C%20sang%20USB%203.0%20Baseus%20Ingenuity%20kim%20lo%E1%BA%A1i', '%20', '+'),
    'Đầu chuyển OTG Type-C sang USB 3.0 Baseus Ingenuity kim loại',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'da02df1b-2a67-4c89-923c-f5f324d14734',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Hub chuyển đổi Anker 555 USB-C Hub 8 in 1 (A8383)',
    'hubs-adapters-hub-chuy-n-i-anker-555-usb-c-hub-8-in-1-a8383-1208',
    'Cổng truyền dữ liệu USB-C 10Gbps, HDMI 4K@60Hz, sạc pass-through 100W an toàn',
    'Hub chuyển đổi Anker 555 USB-C Hub 8 in 1 (A8383) chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HUBS-1208',
    1490000,
    1890000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Hub%20chuy%E1%BB%83n%20%C4%91%E1%BB%95i%20Anker%20555%20USB-C%20Hub%208%20in%201%20(A8383)', '%20', '+'),
    'Hub chuyển đổi Anker 555 USB-C Hub 8 in 1 (A8383)',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'da02df1b-2a67-4c89-923c-f5f324d14734',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Hub chuyển đổi Anker 332 USB-C Hub 5 in 1 (A8355)',
    'hubs-adapters-hub-chuy-n-i-anker-332-usb-c-hub-5-in-1-a8355-1209',
    'Giải pháp mở rộng giá tốt chất lượng chuẩn Anker với 1 cổng HDMI 4K và 3 cổng USB',
    'Hub chuyển đổi Anker 332 USB-C Hub 5 in 1 (A8355) chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HUBS-1209',
    690000,
    890000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Hub%20chuy%E1%BB%83n%20%C4%91%E1%BB%95i%20Anker%20332%20USB-C%20Hub%205%20in%201%20(A8355)', '%20', '+'),
    'Hub chuyển đổi Anker 332 USB-C Hub 5 in 1 (A8355)',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'da02df1b-2a67-4c89-923c-f5f324d14734',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Đầu đọc thẻ nhớ 2 trong 1 Anker USB-C và USB-A',
    'hubs-adapters-u-c-th-nh-2-trong-1-anker-usb-c-v-usb-a-1210',
    'Tương thích cả 2 đầu chuẩn cắm cho điện thoại Type-C và PC truyền thống',
    'Đầu đọc thẻ nhớ 2 trong 1 Anker USB-C và USB-A chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HUBS-1210',
    320000,
    450000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%C4%90%E1%BA%A7u%20%C4%91%E1%BB%8Dc%20th%E1%BA%BB%20nh%E1%BB%9B%202%20trong%201%20Anker%20USB-C%20v%C3%A0%20USB-A', '%20', '+'),
    'Đầu đọc thẻ nhớ 2 trong 1 Anker USB-C và USB-A',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'da02df1b-2a67-4c89-923c-f5f324d14734',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Đầu chuyển Apple USB-C sang USB Adapter chính hãng',
    'hubs-adapters-u-chuy-n-apple-usb-c-sang-usb-adapter-ch-nh-h-ng-1211',
    'Kết nối phụ kiện USB-A tiêu chuẩn vào máy tính MacBook và iPad dùng cổng Type-C',
    'Đầu chuyển Apple USB-C sang USB Adapter chính hãng chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HUBS-1211',
    520000,
    590000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%C4%90%E1%BA%A7u%20chuy%E1%BB%83n%20Apple%20USB-C%20sang%20USB%20Adapter%20ch%C3%ADnh%20h%C3%A3ng', '%20', '+'),
    'Đầu chuyển Apple USB-C sang USB Adapter chính hãng',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'da02df1b-2a67-4c89-923c-f5f324d14734',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Cáp chuyển Apple USB-C sang Cổng Giắc Cắm Tai Nghe 3.5 mm',
    'hubs-adapters-c-p-chuy-n-apple-usb-c-sang-c-ng-gi-c-c-m-tai-nghe-3-5-mm-1212',
    'Chất lượng truyền tải âm thanh trong trẻo không suy hao tín hiệu',
    'Cáp chuyển Apple USB-C sang Cổng Giắc Cắm Tai Nghe 3.5 mm chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HUBS-1212',
    290000,
    350000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('C%C3%A1p%20chuy%E1%BB%83n%20Apple%20USB-C%20sang%20C%E1%BB%95ng%20Gi%E1%BA%AFc%20C%E1%BA%AFm%20Tai%20Nghe%203.5%20mm', '%20', '+'),
    'Cáp chuyển Apple USB-C sang Cổng Giắc Cắm Tai Nghe 3.5 mm',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'da02df1b-2a67-4c89-923c-f5f324d14734',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Bộ Tiếp Hợp Đa Cổng USB-C Digital AV của Apple chính hãng',
    'hubs-adapters-b-ti-p-h-p-a-c-ng-usb-c-digital-av-c-a-apple-ch-nh-h-ng-1213',
    'Chính hãng Apple gồm 1 cổng HDMI, 1 cổng USB-A tiêu chuẩn và 1 cổng sạc Type-C',
    'Bộ Tiếp Hợp Đa Cổng USB-C Digital AV của Apple chính hãng chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HUBS-1213',
    1790000,
    1990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('B%E1%BB%99%20Ti%E1%BA%BFp%20H%E1%BB%A3p%20%C4%90a%20C%E1%BB%95ng%20USB-C%20Digital%20AV%20c%E1%BB%A7a%20Apple%20ch%C3%ADnh%20h%C3%A3ng', '%20', '+'),
    'Bộ Tiếp Hợp Đa Cổng USB-C Digital AV của Apple chính hãng',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'da02df1b-2a67-4c89-923c-f5f324d14734',
    '9aef84d5-0d93-47f5-929b-51148c656f8d',
    'Hub chuyển đổi Belkin Connect USB-C 7 in 1 Multiport Adapter',
    'hubs-adapters-hub-chuy-n-i-belkin-connect-usb-c-7-in-1-multiport-adapter-1214',
    'Bảo hành 2 năm đổi mới, vật liệu cách điện chống đoản mạch an toàn tuyệt đối',
    'Hub chuyển đổi Belkin Connect USB-C 7 in 1 Multiport Adapter chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HUBS-1214',
    1290000,
    1690000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Belkin', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Hub%20chuy%E1%BB%83n%20%C4%91%E1%BB%95i%20Belkin%20Connect%20USB-C%207%20in%201%20Multiport%20Adapter', '%20', '+'),
    'Hub chuyển đổi Belkin Connect USB-C 7 in 1 Multiport Adapter',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'da02df1b-2a67-4c89-923c-f5f324d14734',
    '9aef84d5-0d93-47f5-929b-51148c656f8d',
    'Đầu chuyển Belkin USB-C sang mạng LAN Gigabit Ethernet',
    'hubs-adapters-u-chuy-n-belkin-usb-c-sang-m-ng-lan-gigabit-ethernet-1215',
    'Cung cấp đường truyền internet cáp quang siêu ổn định khi wifi bị chập chờn',
    'Đầu chuyển Belkin USB-C sang mạng LAN Gigabit Ethernet chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HUBS-1215',
    690000,
    890000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Belkin', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%C4%90%E1%BA%A7u%20chuy%E1%BB%83n%20Belkin%20USB-C%20sang%20m%E1%BA%A1ng%20LAN%20Gigabit%20Ethernet', '%20', '+'),
    'Đầu chuyển Belkin USB-C sang mạng LAN Gigabit Ethernet',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'da02df1b-2a67-4c89-923c-f5f324d14734',
    '9608b564-cbe0-4ad5-adda-72a37cb87bd6',
    'Hub chuyển đổi đa năng Xiaomi 5 trong 1 vỏ hợp kim',
    'hubs-adapters-hub-chuy-n-i-a-n-ng-xiaomi-5-trong-1-v-h-p-kim-1216',
    'Có khe gài cất dây cáp gọn gàng bên hông, bảo vệ chân cắm chống cong gãy',
    'Hub chuyển đổi đa năng Xiaomi 5 trong 1 vỏ hợp kim chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HUBS-1216',
    490000,
    650000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Xiaomi', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Hub%20chuy%E1%BB%83n%20%C4%91%E1%BB%95i%20%C4%91a%20n%C4%83ng%20Xiaomi%205%20trong%201%20v%E1%BB%8F%20h%E1%BB%A3p%20kim', '%20', '+'),
    'Hub chuyển đổi đa năng Xiaomi 5 trong 1 vỏ hợp kim',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'da02df1b-2a67-4c89-923c-f5f324d14734',
    'd00bd89f-fa7e-4732-ba0b-6623f6f779d0',
    'Đầu đọc thẻ nhớ Kingston MobileLite Plus SD Reader',
    'hubs-adapters-u-c-th-nh-kingston-mobilelite-plus-sd-reader-1217',
    'Hỗ trợ chuẩn thẻ tốc độ cực cao UHS-II đọc ghi tối đa công suất thẻ nhớ',
    'Đầu đọc thẻ nhớ Kingston MobileLite Plus SD Reader chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HUBS-1217',
    290000,
    390000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Kingston', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%C4%90%E1%BA%A7u%20%C4%91%E1%BB%8Dc%20th%E1%BA%BB%20nh%E1%BB%9B%20Kingston%20MobileLite%20Plus%20SD%20Reader', '%20', '+'),
    'Đầu đọc thẻ nhớ Kingston MobileLite Plus SD Reader',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'da02df1b-2a67-4c89-923c-f5f324d14734',
    '95935020-183f-44cc-a477-2a559734bdad',
    'Trạm chuyển đổi ASUS ROG Ally Gaming Charger Dock 65W',
    'hubs-adapters-tr-m-chuy-n-i-asus-rog-ally-gaming-charger-dock-65w-1218',
    'Kiêm củ sạc 65W vừa sạc vừa xuất hình ảnh HDMI ra màn hình TV 4K khi chơi game',
    'Trạm chuyển đổi ASUS ROG Ally Gaming Charger Dock 65W chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HUBS-1218',
    1490000,
    1790000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'ASUS', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Tr%E1%BA%A1m%20chuy%E1%BB%83n%20%C4%91%E1%BB%95i%20ASUS%20ROG%20Ally%20Gaming%20Charger%20Dock%2065W', '%20', '+'),
    'Trạm chuyển đổi ASUS ROG Ally Gaming Charger Dock 65W',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'da02df1b-2a67-4c89-923c-f5f324d14734',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Đầu chuyển Type-C sang DisplayPort 1.4 Baseus 8K@60Hz',
    'hubs-adapters-u-chuy-n-type-c-sang-displayport-1-4-baseus-8k-60hz-1219',
    'Xuất hình ảnh từ laptop ra màn hình đồ họa chuyên nghiệp tần số quét 144Hz/165Hz',
    'Đầu chuyển Type-C sang DisplayPort 1.4 Baseus 8K@60Hz chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HUBS-1219',
    320000,
    450000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%C4%90%E1%BA%A7u%20chuy%E1%BB%83n%20Type-C%20sang%20DisplayPort%201.4%20Baseus%208K%4060Hz', '%20', '+'),
    'Đầu chuyển Type-C sang DisplayPort 1.4 Baseus 8K@60Hz',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'da02df1b-2a67-4c89-923c-f5f324d14734',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Đầu thu phát Bluetooth 5.3 USB Ugreen kết nối 5 thiết bị',
    'hubs-adapters-u-thu-ph-t-bluetooth-5-3-usb-ugreen-k-t-n-i-5-thi-t-b-1220',
    'Cắm vào PC để kết nối cùng lúc tai nghe không dây, chuột, bàn phím và tay cầm game',
    'Đầu thu phát Bluetooth 5.3 USB Ugreen kết nối 5 thiết bị chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HUBS-1220',
    160000,
    230000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%C4%90%E1%BA%A7u%20thu%20ph%C3%A1t%20Bluetooth%205.3%20USB%20Ugreen%20k%E1%BA%BFt%20n%E1%BB%91i%205%20thi%E1%BA%BFt%20b%E1%BB%8B', '%20', '+'),
    'Đầu thu phát Bluetooth 5.3 USB Ugreen kết nối 5 thiết bị',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'da02df1b-2a67-4c89-923c-f5f324d14734',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Trạm Docking Station Anker 575 USB-C 13 in 1 Triple Display',
    'hubs-adapters-tr-m-docking-station-anker-575-usb-c-13-in-1-triple-display-1221',
    'Mở rộng 13 cổng chuyên nghiệp, hỗ trợ xuất cùng lúc 3 màn hình rời độc lập',
    'Trạm Docking Station Anker 575 USB-C 13 in 1 Triple Display chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HUBS-1221',
    3890000,
    4590000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Tr%E1%BA%A1m%20Docking%20Station%20Anker%20575%20USB-C%2013%20in%201%20Triple%20Display', '%20', '+'),
    'Trạm Docking Station Anker 575 USB-C 13 in 1 Triple Display',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'da02df1b-2a67-4c89-923c-f5f324d14734',
    '9aef84d5-0d93-47f5-929b-51148c656f8d',
    'Đầu chuyển đổi Belkin Type-C sang VGA 1080p',
    'hubs-adapters-u-chuy-n-i-belkin-type-c-sang-vga-1080p-1222',
    'Chuyên dụng kết nối máy tính xách tay với các máy chiếu đời cũ trong giảng đường',
    'Đầu chuyển đổi Belkin Type-C sang VGA 1080p chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-HUBS-1222',
    490000,
    650000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Belkin', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%C4%90%E1%BA%A7u%20chuy%E1%BB%83n%20%C4%91%E1%BB%95i%20Belkin%20Type-C%20sang%20VGA%201080p', '%20', '+'),
    'Đầu chuyển đổi Belkin Type-C sang VGA 1080p',
    1,
    true
  );
END $$;

-- ---------------------------------------------------------------------
-- DANH MỤC: STANDS & MOUNTS (stands-mounts) - Bổ sung 22 sản phẩm -> Đủ 30 sản phẩm
-- ---------------------------------------------------------------------

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '17329ace-6333-4589-9f3f-886732a1c92d',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Giá đỡ laptop công thái học Ugreen nhôm gấp gọn nâng hạ 5 nấc',
    'stands-mounts-gi-laptop-c-ng-th-i-h-c-ugreen-nh-m-g-p-g-n-n-ng-h-5-n-c-1223',
    'Hợp kim nhôm dày dặn đỡ laptop đến 17.3 inch, thông thoáng khe tản nhiệt đáy máy',
    'Giá đỡ laptop công thái học Ugreen nhôm gấp gọn nâng hạ 5 nấc chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STAN-1223',
    390000,
    520000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Gi%C3%A1%20%C4%91%E1%BB%A1%20laptop%20c%C3%B4ng%20th%C3%A1i%20h%E1%BB%8Dc%20Ugreen%20nh%C3%B4m%20g%E1%BA%A5p%20g%E1%BB%8Dn%20n%C3%A2ng%20h%E1%BA%A1%205%20n%E1%BA%A5c', '%20', '+'),
    'Giá đỡ laptop công thái học Ugreen nhôm gấp gọn nâng hạ 5 nấc',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '17329ace-6333-4589-9f3f-886732a1c92d',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Giá đỡ điện thoại và máy tính bảng Ugreen để bàn xoay 360 độ',
    'stands-mounts-gi-i-n-tho-i-v-m-y-t-nh-b-ng-ugreen-b-n-xoay-360-1224',
    'Khớp xoay kêu tách tách tiện lợi, đệm cao su silicon chống trầy viền thiết bị',
    'Giá đỡ điện thoại và máy tính bảng Ugreen để bàn xoay 360 độ chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STAN-1224',
    250000,
    350000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Gi%C3%A1%20%C4%91%E1%BB%A1%20%C4%91i%E1%BB%87n%20tho%E1%BA%A1i%20v%C3%A0%20m%C3%A1y%20t%C3%ADnh%20b%E1%BA%A3ng%20Ugreen%20%C4%91%E1%BB%83%20b%C3%A0n%20xoay%20360%20%C4%91%E1%BB%99', '%20', '+'),
    'Giá đỡ điện thoại và máy tính bảng Ugreen để bàn xoay 360 độ',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '17329ace-6333-4589-9f3f-886732a1c92d',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Giá đỡ kẹp điện thoại đầu giường Ugreen thân kim loại uốn dẻo',
    'stands-mounts-gi-k-p-i-n-tho-i-u-gi-ng-ugreen-th-n-kim-lo-i-u-n-d-o-1225',
    'Kẹp chắc chắn cạnh giường hoặc mép bàn xem phim lướt web rảnh tay',
    'Giá đỡ kẹp điện thoại đầu giường Ugreen thân kim loại uốn dẻo chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STAN-1225',
    290000,
    390000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Gi%C3%A1%20%C4%91%E1%BB%A1%20k%E1%BA%B9p%20%C4%91i%E1%BB%87n%20tho%E1%BA%A1i%20%C4%91%E1%BA%A7u%20gi%C6%B0%E1%BB%9Dng%20Ugreen%20th%C3%A2n%20kim%20lo%E1%BA%A1i%20u%E1%BB%91n%20d%E1%BA%BBo', '%20', '+'),
    'Giá đỡ kẹp điện thoại đầu giường Ugreen thân kim loại uốn dẻo',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '17329ace-6333-4589-9f3f-886732a1c92d',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Giá đỡ laptop tản nhiệt Baseus Ultra Thin dán đáy máy',
    'stands-mounts-gi-laptop-t-n-nhi-t-baseus-ultra-thin-d-n-y-m-y-1226',
    'Siêu mỏng chỉ 3mm dán liền mặt đáy laptop, gập mở góc nghiêng 12 độ chuẩn gõ phím',
    'Giá đỡ laptop tản nhiệt Baseus Ultra Thin dán đáy máy chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STAN-1226',
    150000,
    220000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Gi%C3%A1%20%C4%91%E1%BB%A1%20laptop%20t%E1%BA%A3n%20nhi%E1%BB%87t%20Baseus%20Ultra%20Thin%20d%C3%A1n%20%C4%91%C3%A1y%20m%C3%A1y', '%20', '+'),
    'Giá đỡ laptop tản nhiệt Baseus Ultra Thin dán đáy máy',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '17329ace-6333-4589-9f3f-886732a1c92d',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Giá đỡ điện thoại hít nam châm gắn taplo ô tô Baseus MagPro',
    'stands-mounts-gi-i-n-tho-i-h-t-nam-ch-m-g-n-taplo-t-baseus-magpro-1227',
    'Lực hút nam châm Neodymium cực mạnh chống rung lắc điện thoại khi xe đi qua ổ gà',
    'Giá đỡ điện thoại hít nam châm gắn taplo ô tô Baseus MagPro chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STAN-1227',
    290000,
    390000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Gi%C3%A1%20%C4%91%E1%BB%A1%20%C4%91i%E1%BB%87n%20tho%E1%BA%A1i%20h%C3%ADt%20nam%20ch%C3%A2m%20g%E1%BA%AFn%20taplo%20%C3%B4%20t%C3%B4%20Baseus%20MagPro', '%20', '+'),
    'Giá đỡ điện thoại hít nam châm gắn taplo ô tô Baseus MagPro',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '17329ace-6333-4589-9f3f-886732a1c92d',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Giá đỡ điện thoại kiêm sạc không dây Baseus xoay gập 360',
    'stands-mounts-gi-i-n-tho-i-ki-m-s-c-kh-ng-d-y-baseus-xoay-g-p-360-1228',
    'Vừa làm chân đế xem phim vừa hỗ trợ sạc nhanh không dây tiện lợi',
    'Giá đỡ điện thoại kiêm sạc không dây Baseus xoay gập 360 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STAN-1228',
    490000,
    650000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Gi%C3%A1%20%C4%91%E1%BB%A1%20%C4%91i%E1%BB%87n%20tho%E1%BA%A1i%20ki%C3%AAm%20s%E1%BA%A1c%20kh%C3%B4ng%20d%C3%A2y%20Baseus%20xoay%20g%E1%BA%ADp%20360', '%20', '+'),
    'Giá đỡ điện thoại kiêm sạc không dây Baseus xoay gập 360',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '17329ace-6333-4589-9f3f-886732a1c92d',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Giá đỡ điện thoại từ tính kiêm vòng đeo ngón tay Anker 610 MagGo',
    'stands-mounts-gi-i-n-tho-i-t-t-nh-ki-m-v-ng-eo-ng-n-tay-anker-610-maggo-1229',
    'Hít chắc lưng iPhone dùng làm nhẫn xỏ ngón chống rơi và làm chân chống xem ngang dọc',
    'Giá đỡ điện thoại từ tính kiêm vòng đeo ngón tay Anker 610 MagGo chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STAN-1229',
    290000,
    390000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Gi%C3%A1%20%C4%91%E1%BB%A1%20%C4%91i%E1%BB%87n%20tho%E1%BA%A1i%20t%E1%BB%AB%20t%C3%ADnh%20ki%C3%AAm%20v%C3%B2ng%20%C4%91eo%20ng%C3%B3n%20tay%20Anker%20610%20MagGo', '%20', '+'),
    'Giá đỡ điện thoại từ tính kiêm vòng đeo ngón tay Anker 610 MagGo',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '17329ace-6333-4589-9f3f-886732a1c92d',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Giá đỡ máy tính bảng và iPad Anker hợp kim nhôm nguyên khối',
    'stands-mounts-gi-m-y-t-nh-b-ng-v-ipad-anker-h-p-kim-nh-m-nguy-n-kh-i-1230',
    'Độ ổn định cao chịu lực chạm vuốt Apple Pencil vẽ tranh không rung lắc',
    'Giá đỡ máy tính bảng và iPad Anker hợp kim nhôm nguyên khối chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STAN-1230',
    350000,
    480000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Gi%C3%A1%20%C4%91%E1%BB%A1%20m%C3%A1y%20t%C3%ADnh%20b%E1%BA%A3ng%20v%C3%A0%20iPad%20Anker%20h%E1%BB%A3p%20kim%20nh%C3%B4m%20nguy%C3%AAn%20kh%E1%BB%91i', '%20', '+'),
    'Giá đỡ máy tính bảng và iPad Anker hợp kim nhôm nguyên khối',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '17329ace-6333-4589-9f3f-886732a1c92d',
    '9aef84d5-0d93-47f5-929b-51148c656f8d',
    'Giá đỡ điện thoại Belkin MagSafe gắn màn hình Mac dùng Continuity Camera',
    'stands-mounts-gi-i-n-tho-i-belkin-magsafe-g-n-m-n-h-nh-mac-d-ng-continuity-camera-1231',
    'Biến iPhone thành webcam siêu nét gắn đỉnh màn hình máy Mac họp trực tuyến',
    'Giá đỡ điện thoại Belkin MagSafe gắn màn hình Mac dùng Continuity Camera chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STAN-1231',
    690000,
    890000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Belkin', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Gi%C3%A1%20%C4%91%E1%BB%A1%20%C4%91i%E1%BB%87n%20tho%E1%BA%A1i%20Belkin%20MagSafe%20g%E1%BA%AFn%20m%C3%A0n%20h%C3%ACnh%20Mac%20d%C3%B9ng%20Continuity%20Camera', '%20', '+'),
    'Giá đỡ điện thoại Belkin MagSafe gắn màn hình Mac dùng Continuity Camera',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '17329ace-6333-4589-9f3f-886732a1c92d',
    '9aef84d5-0d93-47f5-929b-51148c656f8d',
    'Giá đỡ gắn lỗ thông gió ô tô Belkin BoostCharge Magnetic',
    'stands-mounts-gi-g-n-l-th-ng-gi-t-belkin-boostcharge-magnetic-1232',
    'Kẹp nan quạt gió xe hơi chắc chắn, xoay lật 360 độ điều hướng bản đồ Google Maps',
    'Giá đỡ gắn lỗ thông gió ô tô Belkin BoostCharge Magnetic chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STAN-1232',
    790000,
    990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Belkin', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Gi%C3%A1%20%C4%91%E1%BB%A1%20g%E1%BA%AFn%20l%E1%BB%97%20th%C3%B4ng%20gi%C3%B3%20%C3%B4%20t%C3%B4%20Belkin%20BoostCharge%20Magnetic', '%20', '+'),
    'Giá đỡ gắn lỗ thông gió ô tô Belkin BoostCharge Magnetic',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '17329ace-6333-4589-9f3f-886732a1c92d',
    '9608b564-cbe0-4ad5-adda-72a37cb87bd6',
    'Giá đỡ kẹp điện thoại trên ô tô Xiaomi kẹp tự động có cảm biến',
    'stands-mounts-gi-k-p-i-n-tho-i-tr-n-t-xiaomi-k-p-t-ng-c-c-m-bi-n-1233',
    'Cảm biến hồng ngoại tự động mở kẹp khi đưa điện thoại lại gần và tự ôm khít',
    'Giá đỡ kẹp điện thoại trên ô tô Xiaomi kẹp tự động có cảm biến chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STAN-1233',
    590000,
    790000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Xiaomi', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Gi%C3%A1%20%C4%91%E1%BB%A1%20k%E1%BA%B9p%20%C4%91i%E1%BB%87n%20tho%E1%BA%A1i%20tr%C3%AAn%20%C3%B4%20t%C3%B4%20Xiaomi%20k%E1%BA%B9p%20t%E1%BB%B1%20%C4%91%E1%BB%99ng%20c%C3%B3%20c%E1%BA%A3m%20bi%E1%BA%BFn', '%20', '+'),
    'Giá đỡ kẹp điện thoại trên ô tô Xiaomi kẹp tự động có cảm biến',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '17329ace-6333-4589-9f3f-886732a1c92d',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Bao da kiêm giá đỡ Apple Smart Folio cho iPad Pro 11 inch',
    'stands-mounts-bao-da-ki-m-gi-apple-smart-folio-cho-ipad-pro-11-inch-1234',
    'Gắn hít nam châm lưng iPad mỏng nhẹ gập lại làm giá đỡ xem phim và gõ phím',
    'Bao da kiêm giá đỡ Apple Smart Folio cho iPad Pro 11 inch chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STAN-1234',
    1890000,
    2190000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Bao%20da%20ki%C3%AAm%20gi%C3%A1%20%C4%91%E1%BB%A1%20Apple%20Smart%20Folio%20cho%20iPad%20Pro%2011%20inch', '%20', '+'),
    'Bao da kiêm giá đỡ Apple Smart Folio cho iPad Pro 11 inch',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '17329ace-6333-4589-9f3f-886732a1c92d',
    '17f517e8-9194-4e4f-bdb3-c86b85812e73',
    'Giá treo tai nghe gaming Razer Base Station V2 Chroma RGB',
    'stands-mounts-gi-treo-tai-nghe-gaming-razer-base-station-v2-chroma-rgb-1235',
    'Tích hợp 2 cổng USB 3.1 và giắc DAC 3.5mm kèm hiệu ứng led gầm RGB đồng bộ phím chuột',
    'Giá treo tai nghe gaming Razer Base Station V2 Chroma RGB chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STAN-1235',
    1690000,
    1990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Razer', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Gi%C3%A1%20treo%20tai%20nghe%20gaming%20Razer%20Base%20Station%20V2%20Chroma%20RGB', '%20', '+'),
    'Giá treo tai nghe gaming Razer Base Station V2 Chroma RGB',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '17329ace-6333-4589-9f3f-886732a1c92d',
    '95935020-183f-44cc-a477-2a559734bdad',
    'Giá treo tai nghe kiêm sạc không dây ASUS ROG Throne Qi',
    'stands-mounts-gi-treo-tai-nghe-ki-m-s-c-kh-ng-d-y-asus-rog-throne-qi-1236',
    'Tích hợp sạc không dây chuẩn Qi dưới chân đế và chip âm thanh vòm 7.1 ESS DAC',
    'Giá treo tai nghe kiêm sạc không dây ASUS ROG Throne Qi chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STAN-1236',
    2890000,
    3390000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'ASUS', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Gi%C3%A1%20treo%20tai%20nghe%20ki%C3%AAm%20s%E1%BA%A1c%20kh%C3%B4ng%20d%C3%A2y%20ASUS%20ROG%20Throne%20Qi', '%20', '+'),
    'Giá treo tai nghe kiêm sạc không dây ASUS ROG Throne Qi',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '17329ace-6333-4589-9f3f-886732a1c92d',
    'b76be2d6-fce2-4972-8745-af20a37d206f',
    'Đế sạc kiêm giá đỡ không dây Logitech Powered Pad 10W',
    'stands-mounts-s-c-ki-m-gi-kh-ng-d-y-logitech-powered-pad-10w-1237',
    'Góc nghiêng thông minh xem thông báo FaceID mở khóa máy tức thì không cần nhấc lên',
    'Đế sạc kiêm giá đỡ không dây Logitech Powered Pad 10W chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STAN-1237',
    690000,
    890000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Logitech', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%C4%90%E1%BA%BF%20s%E1%BA%A1c%20ki%C3%AAm%20gi%C3%A1%20%C4%91%E1%BB%A1%20kh%C3%B4ng%20d%C3%A2y%20Logitech%20Powered%20Pad%2010W', '%20', '+'),
    'Đế sạc kiêm giá đỡ không dây Logitech Powered Pad 10W',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '17329ace-6333-4589-9f3f-886732a1c92d',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Giá đỡ laptop đặt đứng 2 khe Ugreen Vertical Laptop Stand',
    'stands-mounts-gi-laptop-t-ng-2-khe-ugreen-vertical-laptop-stand-1238',
    'Kẹp dựng thẳng đứng 2 máy tính tiết kiệm 80% diện tích mặt bàn khi dùng màn hình ngoài',
    'Giá đỡ laptop đặt đứng 2 khe Ugreen Vertical Laptop Stand chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STAN-1238',
    320000,
    420000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Gi%C3%A1%20%C4%91%E1%BB%A1%20laptop%20%C4%91%E1%BA%B7t%20%C4%91%E1%BB%A9ng%202%20khe%20Ugreen%20Vertical%20Laptop%20Stand', '%20', '+'),
    'Giá đỡ laptop đặt đứng 2 khe Ugreen Vertical Laptop Stand',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '17329ace-6333-4589-9f3f-886732a1c92d',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Kẹp giữ dây cáp sạc chống rối trên bàn Baseus Peas Cable Clip',
    'stands-mounts-k-p-gi-d-y-c-p-s-c-ch-ng-r-i-tr-n-b-n-baseus-peas-cable-clip-1239',
    '3 nút kẹp gắn nam châm hít chặt đế giữ đầu dây cáp luôn ngay ngắn không rơi xuống đất',
    'Kẹp giữ dây cáp sạc chống rối trên bàn Baseus Peas Cable Clip chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STAN-1239',
    65000,
    99000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('K%E1%BA%B9p%20gi%E1%BB%AF%20d%C3%A2y%20c%C3%A1p%20s%E1%BA%A1c%20ch%E1%BB%91ng%20r%E1%BB%91i%20tr%C3%AAn%20b%C3%A0n%20Baseus%20Peas%20Cable%20Clip', '%20', '+'),
    'Kẹp giữ dây cáp sạc chống rối trên bàn Baseus Peas Cable Clip',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '17329ace-6333-4589-9f3f-886732a1c92d',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Tay đỡ màn hình máy tính Human Motion T6 Pro đơn 17-32 inch',
    'stands-mounts-tay-m-n-h-nh-m-y-t-nh-human-motion-t6-pro-n-17-32-inch-1240',
    'Trợ lực lò xo khí nén nâng hạ màn hình 9kg linh hoạt, xoay dọc màn hình đọc tài liệu',
    'Tay đỡ màn hình máy tính Human Motion T6 Pro đơn 17-32 inch chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STAN-1240',
    690000,
    890000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Tay%20%C4%91%E1%BB%A1%20m%C3%A0n%20h%C3%ACnh%20m%C3%A1y%20t%C3%ADnh%20Human%20Motion%20T6%20Pro%20%C4%91%C6%A1n%2017-32%20inch', '%20', '+'),
    'Tay đỡ màn hình máy tính Human Motion T6 Pro đơn 17-32 inch',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '17329ace-6333-4589-9f3f-886732a1c92d',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Giá đỡ điện thoại kèm sạc xe hơi Anker PowerWave Car Mount 10W',
    'stands-mounts-gi-i-n-tho-i-k-m-s-c-xe-h-i-anker-powerwave-car-mount-10w-1241',
    'Vừa dẫn đường bản đồ vừa nạp pin liên tục cho các tài xế công nghệ và phượt thủ',
    'Giá đỡ điện thoại kèm sạc xe hơi Anker PowerWave Car Mount 10W chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STAN-1241',
    790000,
    990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Gi%C3%A1%20%C4%91%E1%BB%A1%20%C4%91i%E1%BB%87n%20tho%E1%BA%A1i%20k%C3%A8m%20s%E1%BA%A1c%20xe%20h%C6%A1i%20Anker%20PowerWave%20Car%20Mount%2010W', '%20', '+'),
    'Giá đỡ điện thoại kèm sạc xe hơi Anker PowerWave Car Mount 10W',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '17329ace-6333-4589-9f3f-886732a1c92d',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Giá đỡ ipad và máy tính bảng gập gọn Baseus Bipow Tablet Holder',
    'stands-mounts-gi-ipad-v-m-y-t-nh-b-ng-g-p-g-n-baseus-bipow-tablet-holder-1242',
    'Thiết kế gập đôi bỏ balo gọn nhẹ, đế có chân cao su bám chặt mặt bàn',
    'Giá đỡ ipad và máy tính bảng gập gọn Baseus Bipow Tablet Holder chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STAN-1242',
    220000,
    320000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Gi%C3%A1%20%C4%91%E1%BB%A1%20ipad%20v%C3%A0%20m%C3%A1y%20t%C3%ADnh%20b%E1%BA%A3ng%20g%E1%BA%ADp%20g%E1%BB%8Dn%20Baseus%20Bipow%20Tablet%20Holder', '%20', '+'),
    'Giá đỡ ipad và máy tính bảng gập gọn Baseus Bipow Tablet Holder',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '17329ace-6333-4589-9f3f-886732a1c92d',
    'd00bd89f-fa7e-4732-ba0b-6623f6f779d0',
    'Đế đỡ tai nghe gaming HyperX Headset Stand nhôm nguyên khối',
    'stands-mounts-tai-nghe-gaming-hyperx-headset-stand-nh-m-nguy-n-kh-i-1243',
    'Trọng lượng đầm chắc giữ tai nghe luôn form dáng bảo quản đệm mút tốt nhất',
    'Đế đỡ tai nghe gaming HyperX Headset Stand nhôm nguyên khối chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STAN-1243',
    590000,
    790000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Kingston', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%C4%90%E1%BA%BF%20%C4%91%E1%BB%A1%20tai%20nghe%20gaming%20HyperX%20Headset%20Stand%20nh%C3%B4m%20nguy%C3%AAn%20kh%E1%BB%91i', '%20', '+'),
    'Đế đỡ tai nghe gaming HyperX Headset Stand nhôm nguyên khối',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '17329ace-6333-4589-9f3f-886732a1c92d',
    '9aef84d5-0d93-47f5-929b-51148c656f8d',
    'Giá đỡ tự động xoay theo khuôn mặt Belkin Auto-Tracking Stand Pro',
    'stands-mounts-gi-t-ng-xoay-theo-khu-n-m-t-belkin-auto-tracking-stand-pro-1244',
    'Tự động bám theo cử động người nói 360 độ qua công nghệ DockKit chính thức của Apple',
    'Giá đỡ tự động xoay theo khuôn mặt Belkin Auto-Tracking Stand Pro chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-STAN-1244',
    3890000,
    4490000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Belkin', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Gi%C3%A1%20%C4%91%E1%BB%A1%20t%E1%BB%B1%20%C4%91%E1%BB%99ng%20xoay%20theo%20khu%C3%B4n%20m%E1%BA%B7t%20Belkin%20Auto-Tracking%20Stand%20Pro', '%20', '+'),
    'Giá đỡ tự động xoay theo khuôn mặt Belkin Auto-Tracking Stand Pro',
    1,
    true
  );
END $$;

-- ---------------------------------------------------------------------
-- DANH MỤC: PHONE CASES (phone-cases) - Bổ sung 21 sản phẩm -> Đủ 30 sản phẩm
-- ---------------------------------------------------------------------

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f14ae2e7-ae8e-400d-a9cf-d76bb0e98d1f',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Ốp lưng iPhone 16 Pro Max Silicone Case kèm MagSafe Desert Titanium',
    'phone-cases-p-l-ng-iphone-16-pro-max-silicone-case-k-m-magsafe-desert-titanium-1245',
    'Bề mặt phủ mịn chống bám bẩn, tích hợp nút Camera Control nhạy bén chuẩn hãng',
    'Ốp lưng iPhone 16 Pro Max Silicone Case kèm MagSafe Desert Titanium chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-PHON-1245',
    1390000,
    1590000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%90p%20l%C6%B0ng%20iPhone%2016%20Pro%20Max%20Silicone%20Case%20k%C3%A8m%20MagSafe%20Desert%20Titanium', '%20', '+'),
    'Ốp lưng iPhone 16 Pro Max Silicone Case kèm MagSafe Desert Titanium',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f14ae2e7-ae8e-400d-a9cf-d76bb0e98d1f',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Ốp lưng iPhone 16 Pro Clear Case kèm MagSafe trong suốt',
    'phone-cases-p-l-ng-iphone-16-pro-clear-case-k-m-magsafe-trong-su-t-1246',
    'Lớp phủ chống ố vàng cao cấp khoe trọn màu sắc khung titan sang trọng',
    'Ốp lưng iPhone 16 Pro Clear Case kèm MagSafe trong suốt chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-PHON-1246',
    1390000,
    1590000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%90p%20l%C6%B0ng%20iPhone%2016%20Pro%20Clear%20Case%20k%C3%A8m%20MagSafe%20trong%20su%E1%BB%91t', '%20', '+'),
    'Ốp lưng iPhone 16 Pro Clear Case kèm MagSafe trong suốt',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f14ae2e7-ae8e-400d-a9cf-d76bb0e98d1f',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Ví da gắn mặt lưng Apple iPhone FineWoven Wallet with MagSafe',
    'phone-cases-v-da-g-n-m-t-l-ng-apple-iphone-finewoven-wallet-with-magsafe-1247',
    'Đựng được 3 thẻ ngân hàng hỗ trợ mạng lưới Tìm kiếm Find My định vị nếu bị rơi',
    'Ví da gắn mặt lưng Apple iPhone FineWoven Wallet with MagSafe chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-PHON-1247',
    1490000,
    1690000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('V%C3%AD%20da%20g%E1%BA%AFn%20m%E1%BA%B7t%20l%C6%B0ng%20Apple%20iPhone%20FineWoven%20Wallet%20with%20MagSafe', '%20', '+'),
    'Ví da gắn mặt lưng Apple iPhone FineWoven Wallet with MagSafe',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f14ae2e7-ae8e-400d-a9cf-d76bb0e98d1f',
    '0cfe3523-e8b2-445a-a689-45b24810d338',
    'Ốp lưng Galaxy S24 Ultra Standing Grip Case chính hãng',
    'phone-cases-p-l-ng-galaxy-s24-ultra-standing-grip-case-ch-nh-h-ng-1248',
    'Dây đeo cầm tay chắc chắn phía sau kiêm chân dựng điện thoại trên bàn',
    'Ốp lưng Galaxy S24 Ultra Standing Grip Case chính hãng chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-PHON-1248',
    890000,
    1090000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Samsung', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%90p%20l%C6%B0ng%20Galaxy%20S24%20Ultra%20Standing%20Grip%20Case%20ch%C3%ADnh%20h%C3%A3ng', '%20', '+'),
    'Ốp lưng Galaxy S24 Ultra Standing Grip Case chính hãng',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f14ae2e7-ae8e-400d-a9cf-d76bb0e98d1f',
    '0cfe3523-e8b2-445a-a689-45b24810d338',
    'Ốp lưng Galaxy Z Fold6 Kindsuit Case da cao cấp',
    'phone-cases-p-l-ng-galaxy-z-fold6-kindsuit-case-da-cao-c-p-1249',
    'Chất liệu da nhân tạo thuần chay siêu êm ái bảo vệ mặt lưng và bản lề gập',
    'Ốp lưng Galaxy Z Fold6 Kindsuit Case da cao cấp chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-PHON-1249',
    1690000,
    1990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Samsung', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%90p%20l%C6%B0ng%20Galaxy%20Z%20Fold6%20Kindsuit%20Case%20da%20cao%20c%E1%BA%A5p', '%20', '+'),
    'Ốp lưng Galaxy Z Fold6 Kindsuit Case da cao cấp',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f14ae2e7-ae8e-400d-a9cf-d76bb0e98d1f',
    '0cfe3523-e8b2-445a-a689-45b24810d338',
    'Ốp lưng Galaxy Z Flip6 Flipsuit Case kèm thẻ tương tác LED',
    'phone-cases-p-l-ng-galaxy-z-flip6-flipsuit-case-k-m-th-t-ng-t-c-led-1250',
    'Tự động đồng bộ hình nền màn hình ngoài theo màu sắc thẻ ốp lưng',
    'Ốp lưng Galaxy Z Flip6 Flipsuit Case kèm thẻ tương tác LED chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-PHON-1250',
    990000,
    1190000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Samsung', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%90p%20l%C6%B0ng%20Galaxy%20Z%20Flip6%20Flipsuit%20Case%20k%C3%A8m%20th%E1%BA%BB%20t%C6%B0%C6%A1ng%20t%C3%A1c%20LED', '%20', '+'),
    'Ốp lưng Galaxy Z Flip6 Flipsuit Case kèm thẻ tương tác LED',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f14ae2e7-ae8e-400d-a9cf-d76bb0e98d1f',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Ốp lưng iPhone 16 Pro Max Baseus Simple trong suốt chống sốc',
    'phone-cases-p-l-ng-iphone-16-pro-max-baseus-simple-trong-su-t-ch-ng-s-c-1251',
    'Đệm khí 4 góc chống sốc bảo vệ rơi rớt 1.5m, viền camera nhô cao chống trầy ống kính',
    'Ốp lưng iPhone 16 Pro Max Baseus Simple trong suốt chống sốc chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-PHON-1251',
    120000,
    180000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%90p%20l%C6%B0ng%20iPhone%2016%20Pro%20Max%20Baseus%20Simple%20trong%20su%E1%BB%91t%20ch%E1%BB%91ng%20s%E1%BB%91c', '%20', '+'),
    'Ốp lưng iPhone 16 Pro Max Baseus Simple trong suốt chống sốc',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f14ae2e7-ae8e-400d-a9cf-d76bb0e98d1f',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Ốp lưng từ tính Baseus MagPro hỗ trợ MagSafe cho iPhone 15 Pro',
    'phone-cases-p-l-ng-t-t-nh-baseus-magpro-h-tr-magsafe-cho-iphone-15-pro-1252',
    'Vòng nam châm lực hút chuẩn 13N hít chặt pin sạc dự phòng không lo tuột rơi',
    'Ốp lưng từ tính Baseus MagPro hỗ trợ MagSafe cho iPhone 15 Pro chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-PHON-1252',
    220000,
    320000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%90p%20l%C6%B0ng%20t%E1%BB%AB%20t%C3%ADnh%20Baseus%20MagPro%20h%E1%BB%97%20tr%E1%BB%A3%20MagSafe%20cho%20iPhone%2015%20Pro', '%20', '+'),
    'Ốp lưng từ tính Baseus MagPro hỗ trợ MagSafe cho iPhone 15 Pro',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f14ae2e7-ae8e-400d-a9cf-d76bb0e98d1f',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Ốp lưng chống ố vàng Ugreen TPU Clear cho iPhone 16',
    'phone-cases-p-l-ng-ch-ng-v-ng-ugreen-tpu-clear-cho-iphone-16-1253',
    'Chất liệu Bayer Đức chống oxy hóa giữ độ trong suốt pha lê bền lâu',
    'Ốp lưng chống ố vàng Ugreen TPU Clear cho iPhone 16 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-PHON-1253',
    130000,
    190000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%90p%20l%C6%B0ng%20ch%E1%BB%91ng%20%E1%BB%91%20v%C3%A0ng%20Ugreen%20TPU%20Clear%20cho%20iPhone%2016', '%20', '+'),
    'Ốp lưng chống ố vàng Ugreen TPU Clear cho iPhone 16',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f14ae2e7-ae8e-400d-a9cf-d76bb0e98d1f',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Ốp lưng nam châm viền đen Ugreen MagSafe Case',
    'phone-cases-p-l-ng-nam-ch-m-vi-n-en-ugreen-magsafe-case-1254',
    'Mặt lưng nhám mờ mờ chống bám vân tay và mồ hôi tay cực sạch sẽ',
    'Ốp lưng nam châm viền đen Ugreen MagSafe Case chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-PHON-1254',
    250000,
    350000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%90p%20l%C6%B0ng%20nam%20ch%C3%A2m%20vi%E1%BB%81n%20%C4%91en%20Ugreen%20MagSafe%20Case', '%20', '+'),
    'Ốp lưng nam châm viền đen Ugreen MagSafe Case',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f14ae2e7-ae8e-400d-a9cf-d76bb0e98d1f',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Ốp lưng bảo vệ Anker Magnetic Case kèm vòng xoay chân đế 360',
    'phone-cases-p-l-ng-b-o-v-anker-magnetic-case-k-m-v-ng-xoay-ch-n-360-1255',
    'Vòng MagSafe kiêm chân đế kim loại xoay linh hoạt mọi góc độ xem video',
    'Ốp lưng bảo vệ Anker Magnetic Case kèm vòng xoay chân đế 360 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-PHON-1255',
    450000,
    590000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%90p%20l%C6%B0ng%20b%E1%BA%A3o%20v%E1%BB%87%20Anker%20Magnetic%20Case%20k%C3%A8m%20v%C3%B2ng%20xoay%20ch%C3%A2n%20%C4%91%E1%BA%BF%20360', '%20', '+'),
    'Ốp lưng bảo vệ Anker Magnetic Case kèm vòng xoay chân đế 360',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f14ae2e7-ae8e-400d-a9cf-d76bb0e98d1f',
    '9aef84d5-0d93-47f5-929b-51148c656f8d',
    'Ốp lưng kháng khuẩn Belkin SheerForce MagSafe cho iPhone 15',
    'phone-cases-p-l-ng-kh-ng-khu-n-belkin-sheerforce-magsafe-cho-iphone-15-1256',
    'Phủ lớp kháng khuẩn giảm 99% vi khuẩn sinh sôi trên bề mặt ốp',
    'Ốp lưng kháng khuẩn Belkin SheerForce MagSafe cho iPhone 15 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-PHON-1256',
    690000,
    890000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Belkin', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%90p%20l%C6%B0ng%20kh%C3%A1ng%20khu%E1%BA%A9n%20Belkin%20SheerForce%20MagSafe%20cho%20iPhone%2015', '%20', '+'),
    'Ốp lưng kháng khuẩn Belkin SheerForce MagSafe cho iPhone 15',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f14ae2e7-ae8e-400d-a9cf-d76bb0e98d1f',
    '9608b564-cbe0-4ad5-adda-72a37cb87bd6',
    'Ốp lưng da nhân tạo Xiaomi 14 Ultra kèm bộ phụ kiện chụp ảnh',
    'phone-cases-p-l-ng-da-nh-n-t-o-xiaomi-14-ultra-k-m-b-ph-ki-n-ch-p-nh-1257',
    'Biến điện thoại thành máy ảnh cơ với báng tay cầm pin phụ và nút chụp hai nấc',
    'Ốp lưng da nhân tạo Xiaomi 14 Ultra kèm bộ phụ kiện chụp ảnh chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-PHON-1257',
    1990000,
    2490000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Xiaomi', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%90p%20l%C6%B0ng%20da%20nh%C3%A2n%20t%E1%BA%A1o%20Xiaomi%2014%20Ultra%20k%C3%A8m%20b%E1%BB%99%20ph%E1%BB%A5%20ki%E1%BB%87n%20ch%E1%BB%A5p%20%E1%BA%A3nh', '%20', '+'),
    'Ốp lưng da nhân tạo Xiaomi 14 Ultra kèm bộ phụ kiện chụp ảnh',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f14ae2e7-ae8e-400d-a9cf-d76bb0e98d1f',
    '17f517e8-9194-4e4f-bdb3-c86b85812e73',
    'Ốp lưng tản nhiệt Razer Arctech Pro cho iPhone 15 Pro Max',
    'phone-cases-p-l-ng-t-n-nhi-t-razer-arctech-pro-cho-iphone-15-pro-max-1258',
    'Lớp lót dẫn nhiệt Thermaprene độc quyền thoát nhiệt giúp máy luôn mát khi leo rank',
    'Ốp lưng tản nhiệt Razer Arctech Pro cho iPhone 15 Pro Max chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-PHON-1258',
    990000,
    1290000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Razer', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%90p%20l%C6%B0ng%20t%E1%BA%A3n%20nhi%E1%BB%87t%20Razer%20Arctech%20Pro%20cho%20iPhone%2015%20Pro%20Max', '%20', '+'),
    'Ốp lưng tản nhiệt Razer Arctech Pro cho iPhone 15 Pro Max',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f14ae2e7-ae8e-400d-a9cf-d76bb0e98d1f',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Bao da gập kèm ngăn đựng thẻ Baseus Vintage Leather Case',
    'phone-cases-bao-da-g-p-k-m-ng-n-ng-th-baseus-vintage-leather-case-1259',
    'Bảo vệ toàn diện 360 độ cả màn hình lẫn mặt lưng, phong cách lịch lãm',
    'Bao da gập kèm ngăn đựng thẻ Baseus Vintage Leather Case chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-PHON-1259',
    250000,
    350000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Bao%20da%20g%E1%BA%ADp%20k%C3%A8m%20ng%C4%83n%20%C4%91%E1%BB%B1ng%20th%E1%BA%BB%20Baseus%20Vintage%20Leather%20Case', '%20', '+'),
    'Bao da gập kèm ngăn đựng thẻ Baseus Vintage Leather Case',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f14ae2e7-ae8e-400d-a9cf-d76bb0e98d1f',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Túi chống nước điện thoại Ugreen IPX8 đi bơi biển',
    'phone-cases-t-i-ch-ng-n-c-i-n-tho-i-ugreen-ipx8-i-b-i-bi-n-1260',
    'Chống nước sâu 30m, cảm ứng mượt mà qua lớp nhựa dẻo chụp ảnh dưới đáy biển',
    'Túi chống nước điện thoại Ugreen IPX8 đi bơi biển chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-PHON-1260',
    95000,
    140000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('T%C3%BAi%20ch%E1%BB%91ng%20n%C6%B0%E1%BB%9Bc%20%C4%91i%E1%BB%87n%20tho%E1%BA%A1i%20Ugreen%20IPX8%20%C4%91i%20b%C6%A1i%20bi%E1%BB%83n', '%20', '+'),
    'Túi chống nước điện thoại Ugreen IPX8 đi bơi biển',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f14ae2e7-ae8e-400d-a9cf-d76bb0e98d1f',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Bao da chống sốc kiêm bàn phím Apple Magic Keyboard iPad Pro 13 M4',
    'phone-cases-bao-da-ch-ng-s-c-ki-m-b-n-ph-m-apple-magic-keyboard-ipad-pro-13-m4-1261',
    'Khung nhôm sang chảnh, bàn di chuột xúc giác cực êm, hàng phím chức năng đầy đủ',
    'Bao da chống sốc kiêm bàn phím Apple Magic Keyboard iPad Pro 13 M4 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-PHON-1261',
    8990000,
    9990000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Bao%20da%20ch%E1%BB%91ng%20s%E1%BB%91c%20ki%C3%AAm%20b%C3%A0n%20ph%C3%ADm%20Apple%20Magic%20Keyboard%20iPad%20Pro%2013%20M4', '%20', '+'),
    'Bao da chống sốc kiêm bàn phím Apple Magic Keyboard iPad Pro 13 M4',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f14ae2e7-ae8e-400d-a9cf-d76bb0e98d1f',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Túi chống sốc laptop 14 inch Baseus Basics có quai xách',
    'phone-cases-t-i-ch-ng-s-c-laptop-14-inch-baseus-basics-c-quai-x-ch-1262',
    'Lớp nhung mềm chống trầy xước bên trong và vải kháng nước bên ngoài',
    'Túi chống sốc laptop 14 inch Baseus Basics có quai xách chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-PHON-1262',
    290000,
    390000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('T%C3%BAi%20ch%E1%BB%91ng%20s%E1%BB%91c%20laptop%2014%20inch%20Baseus%20Basics%20c%C3%B3%20quai%20x%C3%A1ch', '%20', '+'),
    'Túi chống sốc laptop 14 inch Baseus Basics có quai xách',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f14ae2e7-ae8e-400d-a9cf-d76bb0e98d1f',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Túi bảo vệ phụ kiện công nghệ Anker Tech Pouch chống thấm',
    'phone-cases-t-i-b-o-v-ph-ki-n-c-ng-ngh-anker-tech-pouch-ch-ng-th-m-1263',
    'Nhiều ngăn nhỏ phân loại củ sạc, dây cáp, chuột và tai nghe gọn gàng khi du lịch',
    'Túi bảo vệ phụ kiện công nghệ Anker Tech Pouch chống thấm chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-PHON-1263',
    290000,
    390000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('T%C3%BAi%20b%E1%BA%A3o%20v%E1%BB%87%20ph%E1%BB%A5%20ki%E1%BB%87n%20c%C3%B4ng%20ngh%E1%BB%87%20Anker%20Tech%20Pouch%20ch%E1%BB%91ng%20th%E1%BA%A5m', '%20', '+'),
    'Túi bảo vệ phụ kiện công nghệ Anker Tech Pouch chống thấm',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f14ae2e7-ae8e-400d-a9cf-d76bb0e98d1f',
    '0cfe3523-e8b2-445a-a689-45b24810d338',
    'Bao da kèm bút S-Pen Galaxy Z Fold6 S-Pen Case',
    'phone-cases-bao-da-k-m-b-t-s-pen-galaxy-z-fold6-s-pen-case-1264',
    'Gắn gọn cây bút S-Pen mỏng nhẹ sau lưng lấy ra ghi chú nhanh bất cứ lúc nào',
    'Bao da kèm bút S-Pen Galaxy Z Fold6 S-Pen Case chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-PHON-1264',
    1790000,
    2090000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Samsung', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Bao%20da%20k%C3%A8m%20b%C3%BAt%20S-Pen%20Galaxy%20Z%20Fold6%20S-Pen%20Case', '%20', '+'),
    'Bao da kèm bút S-Pen Galaxy Z Fold6 S-Pen Case',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    'f14ae2e7-ae8e-400d-a9cf-d76bb0e98d1f',
    '9aef84d5-0d93-47f5-929b-51148c656f8d',
    'Ốp lưng bảo vệ tai nghe AirPods Pro 2 Belkin bọc silicon kèm móc',
    'phone-cases-p-l-ng-b-o-v-tai-nghe-airpods-pro-2-belkin-b-c-silicon-k-m-m-c-1265',
    'Móc khóa kim loại treo vào đỉa quần hoặc balo tránh rơi mất hộp sạc AirPods',
    'Ốp lưng bảo vệ tai nghe AirPods Pro 2 Belkin bọc silicon kèm móc chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-PHON-1265',
    290000,
    390000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Belkin', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('%E1%BB%90p%20l%C6%B0ng%20b%E1%BA%A3o%20v%E1%BB%87%20tai%20nghe%20AirPods%20Pro%202%20Belkin%20b%E1%BB%8Dc%20silicon%20k%C3%A8m%20m%C3%B3c', '%20', '+'),
    'Ốp lưng bảo vệ tai nghe AirPods Pro 2 Belkin bọc silicon kèm móc',
    1,
    true
  );
END $$;

-- ---------------------------------------------------------------------
-- DANH MỤC: SCREEN PROTECTORS (screen-protectors) - Bổ sung 22 sản phẩm -> Đủ 30 sản phẩm
-- ---------------------------------------------------------------------

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '9c66b851-0431-491b-a607-7d716f8f3a2e',
    '9aef84d5-0d93-47f5-929b-51148c656f8d',
    'Kính cường lực Belkin UltraGlass 2 cho iPhone 16 Pro Max',
    'screen-protectors-k-nh-c-ng-l-c-belkin-ultraglass-2-cho-iphone-16-pro-max-1266',
    'Độ cứng cao hơn kính cường lực thường 2.7 lần, viền mỏng như không dán',
    'Kính cường lực Belkin UltraGlass 2 cho iPhone 16 Pro Max chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SCRE-1266',
    590000,
    790000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Belkin', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('K%C3%ADnh%20c%C6%B0%E1%BB%9Dng%20l%E1%BB%B1c%20Belkin%20UltraGlass%202%20cho%20iPhone%2016%20Pro%20Max', '%20', '+'),
    'Kính cường lực Belkin UltraGlass 2 cho iPhone 16 Pro Max',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '9c66b851-0431-491b-a607-7d716f8f3a2e',
    '9aef84d5-0d93-47f5-929b-51148c656f8d',
    'Kính cường lực chống nhìn trộm Belkin ScreenForce Privacy iPhone 16',
    'screen-protectors-k-nh-c-ng-l-c-ch-ng-nh-n-tr-m-belkin-screenforce-privacy-iphone-16-1267',
    'Bảo vệ bí mật màn hình góc nghiêng trên 30 độ ở nơi công cộng đông người',
    'Kính cường lực chống nhìn trộm Belkin ScreenForce Privacy iPhone 16 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SCRE-1267',
    690000,
    890000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Belkin', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('K%C3%ADnh%20c%C6%B0%E1%BB%9Dng%20l%E1%BB%B1c%20ch%E1%BB%91ng%20nh%C3%ACn%20tr%E1%BB%99m%20Belkin%20ScreenForce%20Privacy%20iPhone%2016', '%20', '+'),
    'Kính cường lực chống nhìn trộm Belkin ScreenForce Privacy iPhone 16',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '9c66b851-0431-491b-a607-7d716f8f3a2e',
    '9aef84d5-0d93-47f5-929b-51148c656f8d',
    'Miếng dán cường lực chống lóa Belkin TruePrivacy cho MacBook 14',
    'screen-protectors-mi-ng-d-n-c-ng-l-c-ch-ng-l-a-belkin-trueprivacy-cho-macbook-14-1268',
    'Dán hít từ tính có thể tháo rời cọ rửa tái sử dụng nhiều lần chống chói mắt',
    'Miếng dán cường lực chống lóa Belkin TruePrivacy cho MacBook 14 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    true,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SCRE-1268',
    990000,
    1290000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Belkin', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Mi%E1%BA%BFng%20d%C3%A1n%20c%C6%B0%E1%BB%9Dng%20l%E1%BB%B1c%20ch%E1%BB%91ng%20l%C3%B3a%20Belkin%20TruePrivacy%20cho%20MacBook%2014', '%20', '+'),
    'Miếng dán cường lực chống lóa Belkin TruePrivacy cho MacBook 14',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '9c66b851-0431-491b-a607-7d716f8f3a2e',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Kính cường lực Baseus 0.3mm Crystal HD cho iPhone 16 Pro',
    'screen-protectors-k-nh-c-ng-l-c-baseus-0-3mm-crystal-hd-cho-iphone-16-pro-1269',
    'Độ trong suốt 99.9% giữ nguyên độ sắc nét màn hình Super Retina XDR',
    'Kính cường lực Baseus 0.3mm Crystal HD cho iPhone 16 Pro chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SCRE-1269',
    120000,
    180000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('K%C3%ADnh%20c%C6%B0%E1%BB%9Dng%20l%E1%BB%B1c%20Baseus%200.3mm%20Crystal%20HD%20cho%20iPhone%2016%20Pro', '%20', '+'),
    'Kính cường lực Baseus 0.3mm Crystal HD cho iPhone 16 Pro',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '9c66b851-0431-491b-a607-7d716f8f3a2e',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Hộp dán kính cường lực tự động Baseus Auto-Alignment chống bụi',
    'screen-protectors-h-p-d-n-k-nh-c-ng-l-c-t-ng-baseus-auto-alignment-ch-ng-b-i-1270',
    'Kèm khuôn canh chỉnh tự động gạt sạch bong bóng khí và bụi chỉ với 1 thao tác kéo',
    'Hộp dán kính cường lực tự động Baseus Auto-Alignment chống bụi chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SCRE-1270',
    180000,
    260000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('H%E1%BB%99p%20d%C3%A1n%20k%C3%ADnh%20c%C6%B0%E1%BB%9Dng%20l%E1%BB%B1c%20t%E1%BB%B1%20%C4%91%E1%BB%99ng%20Baseus%20Auto-Alignment%20ch%E1%BB%91ng%20b%E1%BB%A5i', '%20', '+'),
    'Hộp dán kính cường lực tự động Baseus Auto-Alignment chống bụi',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '9c66b851-0431-491b-a607-7d716f8f3a2e',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Kính cường lực nhám mờ Baseus Frosted chống mồ hôi tay cho Game thủ',
    'screen-protectors-k-nh-c-ng-l-c-nh-m-m-baseus-frosted-ch-ng-m-h-i-tay-cho-game-th-1271',
    'Bề mặt phủ vi hạt mịn vuốt cực trơn tay không để lại dấu vân tay khi combat game',
    'Kính cường lực nhám mờ Baseus Frosted chống mồ hôi tay cho Game thủ chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SCRE-1271',
    150000,
    220000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('K%C3%ADnh%20c%C6%B0%E1%BB%9Dng%20l%E1%BB%B1c%20nh%C3%A1m%20m%E1%BB%9D%20Baseus%20Frosted%20ch%E1%BB%91ng%20m%E1%BB%93%20h%C3%B4i%20tay%20cho%20Game%20th%E1%BB%A7', '%20', '+'),
    'Kính cường lực nhám mờ Baseus Frosted chống mồ hôi tay cho Game thủ',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '9c66b851-0431-491b-a607-7d716f8f3a2e',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Kính cường lực Ugreen 9H Full viền cho iPhone 15 Pro Max',
    'screen-protectors-k-nh-c-ng-l-c-ugreen-9h-full-vi-n-cho-iphone-15-pro-max-1272',
    'Bo cạnh 2.5D vuốt từ mép không bị cấn tay, độ cứng tiêu chuẩn 9H chống chìa khóa cọ quẹt',
    'Kính cường lực Ugreen 9H Full viền cho iPhone 15 Pro Max chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SCRE-1272',
    110000,
    160000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('K%C3%ADnh%20c%C6%B0%E1%BB%9Dng%20l%E1%BB%B1c%20Ugreen%209H%20Full%20vi%E1%BB%81n%20cho%20iPhone%2015%20Pro%20Max', '%20', '+'),
    'Kính cường lực Ugreen 9H Full viền cho iPhone 15 Pro Max',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '9c66b851-0431-491b-a607-7d716f8f3a2e',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Kính cường lực bảo vệ cụm Camera Ugreen (Bộ 3 mắt kính rời)',
    'screen-protectors-k-nh-c-ng-l-c-b-o-v-c-m-camera-ugreen-b-3-m-t-k-nh-r-i-1273',
    'Vòng viền titan ôm trọn từng ống kính, giữ nguyên chất lượng ảnh chụp đêm không lóe sáng',
    'Kính cường lực bảo vệ cụm Camera Ugreen (Bộ 3 mắt kính rời) chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SCRE-1273',
    90000,
    130000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('K%C3%ADnh%20c%C6%B0%E1%BB%9Dng%20l%E1%BB%B1c%20b%E1%BA%A3o%20v%E1%BB%87%20c%E1%BB%A5m%20Camera%20Ugreen%20(B%E1%BB%99%203%20m%E1%BA%AFt%20k%C3%ADnh%20r%E1%BB%9Di)', '%20', '+'),
    'Kính cường lực bảo vệ cụm Camera Ugreen (Bộ 3 mắt kính rời)',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '9c66b851-0431-491b-a607-7d716f8f3a2e',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Miếng dán màn hình Paper-like Ugreen cho iPad Pro 11 inch vẽ viết',
    'screen-protectors-mi-ng-d-n-m-n-h-nh-paper-like-ugreen-cho-ipad-pro-11-inch-v-vi-t-1274',
    'Tạo cảm giác nhám nhẹ như viết bút chì trên giấy thật, chống mỏi mắt cho học sinh ghi chú',
    'Miếng dán màn hình Paper-like Ugreen cho iPad Pro 11 inch vẽ viết chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SCRE-1274',
    190000,
    270000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Mi%E1%BA%BFng%20d%C3%A1n%20m%C3%A0n%20h%C3%ACnh%20Paper-like%20Ugreen%20cho%20iPad%20Pro%2011%20inch%20v%E1%BA%BD%20vi%E1%BA%BFt', '%20', '+'),
    'Miếng dán màn hình Paper-like Ugreen cho iPad Pro 11 inch vẽ viết',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '9c66b851-0431-491b-a607-7d716f8f3a2e',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Kính cường lực Anker GlassGuard iPhone 15 độ cứng 9H',
    'screen-protectors-k-nh-c-ng-l-c-anker-glassguard-iphone-15-c-ng-9h-1275',
    'Kính gia nhiệt cường lực 2 lần tăng khả năng hấp thụ lực va đập khi rơi úp màn hình',
    'Kính cường lực Anker GlassGuard iPhone 15 độ cứng 9H chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SCRE-1275',
    250000,
    350000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('K%C3%ADnh%20c%C6%B0%E1%BB%9Dng%20l%E1%BB%B1c%20Anker%20GlassGuard%20iPhone%2015%20%C4%91%E1%BB%99%20c%E1%BB%A9ng%209H', '%20', '+'),
    'Kính cường lực Anker GlassGuard iPhone 15 độ cứng 9H',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '9c66b851-0431-491b-a607-7d716f8f3a2e',
    '0cfe3523-e8b2-445a-a689-45b24810d338',
    'Miếng dán màn hình chống phản chiếu chính hãng Samsung Galaxy S24 Ultra',
    'screen-protectors-mi-ng-d-n-m-n-h-nh-ch-ng-ph-n-chi-u-ch-nh-h-ng-samsung-galaxy-s24-ultra-1276',
    'Chính hãng Samsung giữ nguyên công nghệ chống chói Corning Gorilla Armor độc quyền',
    'Miếng dán màn hình chống phản chiếu chính hãng Samsung Galaxy S24 Ultra chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SCRE-1276',
    490000,
    650000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Samsung', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Mi%E1%BA%BFng%20d%C3%A1n%20m%C3%A0n%20h%C3%ACnh%20ch%E1%BB%91ng%20ph%E1%BA%A3n%20chi%E1%BA%BFu%20ch%C3%ADnh%20h%C3%A3ng%20Samsung%20Galaxy%20S24%20Ultra', '%20', '+'),
    'Miếng dán màn hình chống phản chiếu chính hãng Samsung Galaxy S24 Ultra',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '9c66b851-0431-491b-a607-7d716f8f3a2e',
    '0cfe3523-e8b2-445a-a689-45b24810d338',
    'Miếng dán bảo vệ màn hình ngoài Galaxy Z Fold6 Anti-Reflecting',
    'screen-protectors-mi-ng-d-n-b-o-v-m-n-h-nh-ngo-i-galaxy-z-fold6-anti-reflecting-1277',
    'Gồm 2 miếng dán trong hộp kèm dụng cụ gạt dán chuẩn xác tại nhà',
    'Miếng dán bảo vệ màn hình ngoài Galaxy Z Fold6 Anti-Reflecting chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SCRE-1277',
    390000,
    490000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Samsung', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Mi%E1%BA%BFng%20d%C3%A1n%20b%E1%BA%A3o%20v%E1%BB%87%20m%C3%A0n%20h%C3%ACnh%20ngo%C3%A0i%20Galaxy%20Z%20Fold6%20Anti-Reflecting', '%20', '+'),
    'Miếng dán bảo vệ màn hình ngoài Galaxy Z Fold6 Anti-Reflecting',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '9c66b851-0431-491b-a607-7d716f8f3a2e',
    'b1a92d5c-9c8b-4b86-a9ac-db92bc7c5a37',
    'Miếng dán bảo vệ màn hình Apple Watch Ultra 49mm Sapphire',
    'screen-protectors-mi-ng-d-n-b-o-v-m-n-h-nh-apple-watch-ultra-49mm-sapphire-1278',
    'Viền titan bảo vệ chống va chạm cộc tay vào tường khi leo núi thể thao',
    'Miếng dán bảo vệ màn hình Apple Watch Ultra 49mm Sapphire chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SCRE-1278',
    390000,
    520000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Apple', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Mi%E1%BA%BFng%20d%C3%A1n%20b%E1%BA%A3o%20v%E1%BB%87%20m%C3%A0n%20h%C3%ACnh%20Apple%20Watch%20Ultra%2049mm%20Sapphire', '%20', '+'),
    'Miếng dán bảo vệ màn hình Apple Watch Ultra 49mm Sapphire',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '9c66b851-0431-491b-a607-7d716f8f3a2e',
    '9608b564-cbe0-4ad5-adda-72a37cb87bd6',
    'Kính cường lực Xiaomi 14 Pro cong 3D theo màn hình',
    'screen-protectors-k-nh-c-ng-l-c-xiaomi-14-pro-cong-3d-theo-m-n-h-nh-1279',
    'Keo quang học UV tràn viền bám dính chắc chắn không bị hở viền bọt khí',
    'Kính cường lực Xiaomi 14 Pro cong 3D theo màn hình chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SCRE-1279',
    160000,
    240000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Xiaomi', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('K%C3%ADnh%20c%C6%B0%E1%BB%9Dng%20l%E1%BB%B1c%20Xiaomi%2014%20Pro%20cong%203D%20theo%20m%C3%A0n%20h%C3%ACnh', '%20', '+'),
    'Kính cường lực Xiaomi 14 Pro cong 3D theo màn hình',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '9c66b851-0431-491b-a607-7d716f8f3a2e',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Kính cường lực chống ánh sáng xanh Baseus Blue Light Filter',
    'screen-protectors-k-nh-c-ng-l-c-ch-ng-nh-s-ng-xanh-baseus-blue-light-filter-1280',
    'Lọc 90% tia sáng xanh có hại giúp chống mỏi mắt nhức mắt khi lướt điện thoại ban đêm',
    'Kính cường lực chống ánh sáng xanh Baseus Blue Light Filter chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SCRE-1280',
    150000,
    220000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('K%C3%ADnh%20c%C6%B0%E1%BB%9Dng%20l%E1%BB%B1c%20ch%E1%BB%91ng%20%C3%A1nh%20s%C3%A1ng%20xanh%20Baseus%20Blue%20Light%20Filter', '%20', '+'),
    'Kính cường lực chống ánh sáng xanh Baseus Blue Light Filter',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '9c66b851-0431-491b-a607-7d716f8f3a2e',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Kính cường lực iPad 10.2 / iPad Air 11 inch Ugreen Full HD',
    'screen-protectors-k-nh-c-ng-l-c-ipad-10-2-ipad-air-11-inch-ugreen-full-hd-1281',
    'Bảo vệ màn hình máy tính bảng kích thước lớn chống nứt vỡ khi trẻ nhỏ làm rơi',
    'Kính cường lực iPad 10.2 / iPad Air 11 inch Ugreen Full HD chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SCRE-1281',
    190000,
    280000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('K%C3%ADnh%20c%C6%B0%E1%BB%9Dng%20l%E1%BB%B1c%20iPad%2010.2%20%2F%20iPad%20Air%2011%20inch%20Ugreen%20Full%20HD', '%20', '+'),
    'Kính cường lực iPad 10.2 / iPad Air 11 inch Ugreen Full HD',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '9c66b851-0431-491b-a607-7d716f8f3a2e',
    '9aef84d5-0d93-47f5-929b-51148c656f8d',
    'Kính cường lực Apple Watch Series 9 45mm cong 3D viền đen',
    'screen-protectors-k-nh-c-ng-l-c-apple-watch-series-9-45mm-cong-3d-vi-n-en-1282',
    'Bao phủ sát mép viền đồng hồ, chống trầy xước các sinh hoạt va quẹt hàng ngày',
    'Kính cường lực Apple Watch Series 9 45mm cong 3D viền đen chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SCRE-1282',
    390000,
    520000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Belkin', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('K%C3%ADnh%20c%C6%B0%E1%BB%9Dng%20l%E1%BB%B1c%20Apple%20Watch%20Series%209%2045mm%20cong%203D%20vi%E1%BB%81n%20%C4%91en', '%20', '+'),
    'Kính cường lực Apple Watch Series 9 45mm cong 3D viền đen',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '9c66b851-0431-491b-a607-7d716f8f3a2e',
    '8b018bea-91de-44f8-8cb0-4b1f46fd9ee0',
    'Miếng dán PPF mặt lưng và viền điện thoại Baseus siêu dẻo tự phục hồi',
    'screen-protectors-mi-ng-d-n-ppf-m-t-l-ng-v-vi-n-i-n-tho-i-baseus-si-u-d-o-t-ph-c-h-i-1283',
    'Tự động lành các vết xước nhỏ sau 24h, giữ máy luôn mới nguyên bản',
    'Miếng dán PPF mặt lưng và viền điện thoại Baseus siêu dẻo tự phục hồi chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SCRE-1283',
    99000,
    150000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Baseus', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Mi%E1%BA%BFng%20d%C3%A1n%20PPF%20m%E1%BA%B7t%20l%C6%B0ng%20v%C3%A0%20vi%E1%BB%81n%20%C4%91i%E1%BB%87n%20tho%E1%BA%A1i%20Baseus%20si%C3%AAu%20d%E1%BA%BBo%20t%E1%BB%B1%20ph%E1%BB%A5c%20h%E1%BB%93i', '%20', '+'),
    'Miếng dán PPF mặt lưng và viền điện thoại Baseus siêu dẻo tự phục hồi',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '9c66b851-0431-491b-a607-7d716f8f3a2e',
    'b4a10c3a-3570-4cd7-afd2-d5d68828b4d5',
    'Kính cường lực bảo vệ camera Anker Lens Protector iPhone 16',
    'screen-protectors-k-nh-c-ng-l-c-b-o-v-camera-anker-lens-protector-iphone-16-1284',
    'Khung định hình dán 1 lần ăn ngay bảo vệ kính camera chống trầy xước',
    'Kính cường lực bảo vệ camera Anker Lens Protector iPhone 16 chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SCRE-1284',
    190000,
    280000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Anker', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('K%C3%ADnh%20c%C6%B0%E1%BB%9Dng%20l%E1%BB%B1c%20b%E1%BA%A3o%20v%E1%BB%87%20camera%20Anker%20Lens%20Protector%20iPhone%2016', '%20', '+'),
    'Kính cường lực bảo vệ camera Anker Lens Protector iPhone 16',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '9c66b851-0431-491b-a607-7d716f8f3a2e',
    'a075aa22-8d4a-49e1-869d-01a5115fd8ea',
    'Miếng dán bảo vệ màn hình máy chơi game cầm tay Steam Deck / ROG Ally',
    'screen-protectors-mi-ng-d-n-b-o-v-m-n-h-nh-m-y-ch-i-game-c-m-tay-steam-deck-rog-ally-1285',
    'Kính cường lực 9H chống chói giữ hình ảnh game luôn tươi sáng và sắc sài',
    'Miếng dán bảo vệ màn hình máy chơi game cầm tay Steam Deck / ROG Ally chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SCRE-1285',
    150000,
    220000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Ugreen', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('Mi%E1%BA%BFng%20d%C3%A1n%20b%E1%BA%A3o%20v%E1%BB%87%20m%C3%A0n%20h%C3%ACnh%20m%C3%A1y%20ch%C6%A1i%20game%20c%E1%BA%A7m%20tay%20Steam%20Deck%20%2F%20ROG%20Ally', '%20', '+'),
    'Miếng dán bảo vệ màn hình máy chơi game cầm tay Steam Deck / ROG Ally',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '9c66b851-0431-491b-a607-7d716f8f3a2e',
    '95935020-183f-44cc-a477-2a559734bdad',
    'Bộ dung dịch và khăn lau màn hình chuyên dụng kháng khuẩn',
    'screen-protectors-b-dung-d-ch-v-kh-n-lau-m-n-h-nh-chuy-n-d-ng-kh-ng-khu-n-1286',
    'Khăn dệt sợi microfiber mềm mịn kết hợp xịt vệ sinh sạch bóng màn hình không vệt mờ',
    'Bộ dung dịch và khăn lau màn hình chuyên dụng kháng khuẩn chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SCRE-1286',
    85000,
    120000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'SanDisk', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('B%E1%BB%99%20dung%20d%E1%BB%8Bch%20v%C3%A0%20kh%C4%83n%20lau%20m%C3%A0n%20h%C3%ACnh%20chuy%C3%AAn%20d%E1%BB%A5ng%20kh%C3%A1ng%20khu%E1%BA%A9n', '%20', '+'),
    'Bộ dung dịch và khăn lau màn hình chuyên dụng kháng khuẩn',
    1,
    true
  );
END $$;

DO $$
DECLARE
  new_pid uuid := gen_random_uuid();
BEGIN
  INSERT INTO products (product_id, category_id, brand_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)
  VALUES (
    new_pid,
    '9c66b851-0431-491b-a607-7d716f8f3a2e',
    '9aef84d5-0d93-47f5-929b-51148c656f8d',
    'Kính cường lực iPhone 16 Plus Belkin ScreenForce kèm khay dán',
    'screen-protectors-k-nh-c-ng-l-c-iphone-16-plus-belkin-screenforce-k-m-khay-d-n-1287',
    'Thiết kế chuẩn xác từng micromet khay Easy Align ai cũng có thể tự dán tại nhà',
    'Kính cường lực iPhone 16 Plus Belkin ScreenForce kèm khay dán chính hãng phân phối tại ConGears. Bảo hành 12-24 tháng 1 đổi 1.',
    true,
    false,
    now(),
    now()
  );

  INSERT INTO product_variants (variant_id, product_id, variant_name, sku, price, compare_at_price, is_active, created_at)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'Tiêu chuẩn',
    'CG-SCRE-1287',
    490000,
    650000,
    true,
    now()
  );

  INSERT INTO product_specifications (specification_id, product_id, specification_name, specification_value, display_order)
  VALUES
    (gen_random_uuid(), new_pid, 'Thương hiệu', 'Belkin', 1),
    (gen_random_uuid(), new_pid, 'Bảo hành', '12 - 24 tháng chính hãng', 2),
    (gen_random_uuid(), new_pid, 'Tình trạng', 'Mới 100% nguyên seal', 3);

  INSERT INTO product_images (image_id, product_id, image_url, alt_text, display_order, is_primary)
  VALUES (
    gen_random_uuid(),
    new_pid,
    'https://placehold.co/800x800?text=' || replace('K%C3%ADnh%20c%C6%B0%E1%BB%9Dng%20l%E1%BB%B1c%20iPhone%2016%20Plus%20Belkin%20ScreenForce%20k%C3%A8m%20khay%20d%C3%A1n', '%20', '+'),
    'Kính cường lực iPhone 16 Plus Belkin ScreenForce kèm khay dán',
    1,
    true
  );
END $$;

