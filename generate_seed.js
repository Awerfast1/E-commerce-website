const fs = require('fs');
const path = require('path');
const ts = require('./frontend/node_modules/typescript');

function loadTs(filePath) {
  const code = fs.readFileSync(filePath, 'utf8');
  const res = ts.transpileModule(code, { compilerOptions: { module: ts.ModuleKind.CommonJS } });
  const m = { exports: {} };
  const fn = new Function('module', 'exports', 'require', res.outputText);
  fn(m, m.exports, (mod) => {
    if (mod.startsWith('.')) {
      const p = path.resolve(path.dirname(filePath), mod);
      return loadTs(p.endsWith('.ts') ? p : p + '.ts');
    }
    return require(mod);
  });
  return m.exports;
}

const gamingDeals = loadTs('frontend/data/gamingLaptopDeals.ts');
const gamingSpecs = loadTs('frontend/data/gamingLaptopSpecifications.ts');
const officeDeals = loadTs('frontend/data/officeLaptopDeals.ts');
const officeSpecs = loadTs('frontend/data/officeLaptopSpecifications.ts');

function escapeSql(str) {
  if (!str) return '';
  return String(str).split("'").join("''");
}

function getBrandVar(brand) {
  const b = (brand || '').toUpperCase();
  if (b.includes('ASUS')) return 'b_asus_id';
  if (b.includes('ACER')) return 'b_acer_id';
  if (b.includes('LENOVO')) return 'b_lenovo_id';
  if (b.includes('ALIENWARE')) return 'b_alienware_id';
  if (b.includes('DELL')) return 'b_dell_id';
  if (b.includes('HP')) return 'b_hp_id';
  if (b.includes('LG')) return 'b_lg_id';
  return 'b_asus_id';
}

const lines = [];
lines.push('-- ==============================================================================');
lines.push('-- SUPABASE / POSTGRESQL SEED DATA: 32 LAPTOPS (GAMING & VĂN PHÒNG)');
lines.push('-- Chuẩn hóa 100% khớp với cấu trúc Database tables:');
lines.push('-- - public.brands');
lines.push('-- - public.categories (Root: Laptop -> Con: Laptop Gaming, Laptop Văn Phòng)');
lines.push('-- - public.products');
lines.push('-- - public.product_variants (Lưu giá price, compare_at_price, sku)');
lines.push('-- - public.product_specifications (Lưu thông số kỹ thuật chi tiết)');
lines.push('-- ==============================================================================');
lines.push('');
lines.push('DO $$');
lines.push('DECLARE');
lines.push('  cat_laptop_id UUID;');
lines.push('  cat_gaming_id UUID;');
lines.push('  cat_office_id UUID;');
lines.push('  b_asus_id UUID;');
lines.push('  b_acer_id UUID;');
lines.push('  b_lenovo_id UUID;');
lines.push('  b_alienware_id UUID;');
lines.push('  b_dell_id UUID;');
lines.push('  b_hp_id UUID;');
lines.push('  b_lg_id UUID;');
lines.push('  curr_prod_id UUID;');
lines.push('BEGIN');
lines.push('');
lines.push('  -- 1. SEED / UPDATE THƯƠNG HIỆU (BRANDS)');
lines.push(`  INSERT INTO public.brands (brand_name, description, is_active)
  VALUES 
    ('ASUS', 'ASUS Global - In Search of Incredible', true),
    ('ACER', 'Acer Inc. - Explore Beyond Limits', true),
    ('LENOVO', 'Lenovo - Smarter Technology for All', true),
    ('ALIENWARE', 'Alienware - High-performance PC Gaming', true),
    ('DELL', 'Dell Technologies', true),
    ('HP', 'HP Inc.', true),
    ('LG', 'LG Electronics - Life''s Good', true)
  ON CONFLICT (brand_name) DO UPDATE SET is_active = true;`);
lines.push('');
lines.push("  SELECT brand_id INTO b_asus_id FROM public.brands WHERE brand_name = 'ASUS';");
lines.push("  SELECT brand_id INTO b_acer_id FROM public.brands WHERE brand_name = 'ACER';");
lines.push("  SELECT brand_id INTO b_lenovo_id FROM public.brands WHERE brand_name = 'LENOVO';");
lines.push("  SELECT brand_id INTO b_alienware_id FROM public.brands WHERE brand_name = 'ALIENWARE';");
lines.push("  SELECT brand_id INTO b_dell_id FROM public.brands WHERE brand_name = 'DELL';");
lines.push("  SELECT brand_id INTO b_hp_id FROM public.brands WHERE brand_name = 'HP';");
lines.push("  SELECT brand_id INTO b_lg_id FROM public.brands WHERE brand_name = 'LG';");
lines.push('');
lines.push('  -- 2. SEED / UPDATE DANH MỤC (CATEGORIES)');
lines.push(`  INSERT INTO public.categories (category_name, slug, description, is_active, display_order)
  VALUES ('Laptop', 'laptop', 'Máy tính xách tay chính hãng', true, 1)
  ON CONFLICT (slug) DO UPDATE SET category_name = EXCLUDED.category_name
  RETURNING category_id INTO cat_laptop_id;
  
  IF cat_laptop_id IS NULL THEN
    SELECT category_id INTO cat_laptop_id FROM public.categories WHERE slug = 'laptop';
  END IF;`);
lines.push('');
lines.push(`  INSERT INTO public.categories (parent_category_id, category_name, slug, description, is_active, display_order)
  VALUES (cat_laptop_id, 'Laptop Gaming', 'laptop-gaming', 'Laptop gaming hiệu năng cao đồ họa đỉnh', true, 1)
  ON CONFLICT (slug) DO UPDATE SET parent_category_id = cat_laptop_id
  RETURNING category_id INTO cat_gaming_id;

  IF cat_gaming_id IS NULL THEN
    SELECT category_id INTO cat_gaming_id FROM public.categories WHERE slug = 'laptop-gaming';
  END IF;`);
lines.push('');
lines.push(`  INSERT INTO public.categories (parent_category_id, category_name, slug, description, is_active, display_order)
  VALUES (cat_laptop_id, 'Laptop Văn Phòng', 'laptop-van-phong', 'Laptop văn phòng mỏng nhẹ sang trọng học tập làm việc', true, 2)
  ON CONFLICT (slug) DO UPDATE SET parent_category_id = cat_laptop_id
  RETURNING category_id INTO cat_office_id;

  IF cat_office_id IS NULL THEN
    SELECT category_id INTO cat_office_id FROM public.categories WHERE slug = 'laptop-van-phong';
  END IF;`);
lines.push('');
lines.push('  -- ==========================================');
lines.push('  -- 3. GAMING LAPTOPS (12 SẢN PHẨM)');
lines.push('  -- ==========================================\n');

gamingDeals.gamingLaptopDeals.forEach((p, idx) => {
  const slug = gamingDeals.gamingLaptopSlug(p.name);
  const brandVar = getBrandVar(p.brand);
  const sku = 'GM-' + String(idx + 1).padStart(3, '0') + '-' + slug.slice(0, 15).toUpperCase().replace(/[^A-Z0-9]/g, '');
  const shortDesc = p.cpu + ' / ' + p.gpu + ' / ' + p.ram + ' / ' + p.storage + ' / ' + p.screen;
  
  lines.push('  -- Gaming Product ' + (idx + 1) + ': ' + escapeSql(p.name));
  lines.push('  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)');
  lines.push(`  VALUES (${brandVar}, cat_gaming_id, '${escapeSql(p.name)}', '${slug}', '${escapeSql(shortDesc)}', 'Sản phẩm Laptop Gaming chính hãng hiệu năng vượt trội.', true, true)`);
  lines.push('  ON CONFLICT (slug) DO UPDATE SET ');
  lines.push('    brand_id = EXCLUDED.brand_id,');
  lines.push('    category_id = EXCLUDED.category_id,');
  lines.push('    product_name = EXCLUDED.product_name,');
  lines.push('    short_description = EXCLUDED.short_description');
  lines.push('  RETURNING product_id INTO curr_prod_id;');
  lines.push('');
  lines.push('  IF curr_prod_id IS NULL THEN');
  lines.push(`    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = '${slug}';`);
  lines.push('  END IF;');
  lines.push('');
  lines.push('  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)');
  lines.push(`  VALUES (curr_prod_id, '${sku}', 'Tiêu chuẩn', ${p.price}, ${p.oldPrice}, true)`);
  lines.push('  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;');
  lines.push('');
  // No delete needed

  let specs = [
    ['CPU', p.cpu],
    ['Card đồ họa (GPU)', p.gpu],
    ['Dung lượng RAM', p.ram],
    ['Ổ cứng lưu trữ', p.storage],
    ['Màn hình', p.screen]
  ];

  if (gamingSpecs.getGamingLaptopSpecifications) {
    try {
      const fullSpecs = gamingSpecs.getGamingLaptopSpecifications(idx);
      if (Array.isArray(fullSpecs)) {
        fullSpecs.forEach(g => {
          if (g.rows) {
            g.rows.forEach(([k, v]) => {
              if (!specs.some(s => s[0] === k)) {
                specs.push([k, v]);
              }
            });
          }
        });
      }
    } catch(err) {}
  }

  specs.forEach(([name, val], sIdx) => {
    lines.push(`  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, '${escapeSql(name)}', '${escapeSql(val)}', ${sIdx + 1});`);
  });
  lines.push('');
});

lines.push('  -- ==========================================');
lines.push('  -- 4. OFFICE LAPTOPS (20 SẢN PHẨM VĂN PHÒNG)');
lines.push('  -- ==========================================\n');

officeDeals.officeLaptopDeals.forEach((p, idx) => {
  const slug = officeDeals.officeLaptopSlug(p.name);
  const brandVar = getBrandVar(p.brand);
  const sku = 'VP-' + String(idx + 1).padStart(3, '0') + '-' + slug.slice(0, 15).toUpperCase().replace(/[^A-Z0-9]/g, '');
  const shortDesc = p.cpu + ' / ' + p.gpu + ' / ' + p.ram + ' / ' + p.storage + ' / ' + p.screen + ' / ' + p.weight;
  
  lines.push('  -- Office Product ' + (idx + 1) + ': ' + escapeSql(p.name));
  lines.push('  INSERT INTO public.products (brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured)');
  lines.push(`  VALUES (${brandVar}, cat_office_id, '${escapeSql(p.name)}', '${slug}', '${escapeSql(shortDesc)}', '${escapeSql(p.highlight)}', true, false)`);
  lines.push('  ON CONFLICT (slug) DO UPDATE SET ');
  lines.push('    brand_id = EXCLUDED.brand_id,');
  lines.push('    category_id = EXCLUDED.category_id,');
  lines.push('    product_name = EXCLUDED.product_name,');
  lines.push('    short_description = EXCLUDED.short_description,');
  lines.push('    description = EXCLUDED.description');
  lines.push('  RETURNING product_id INTO curr_prod_id;');
  lines.push('');
  lines.push('  IF curr_prod_id IS NULL THEN');
  lines.push(`    SELECT product_id INTO curr_prod_id FROM public.products WHERE slug = '${slug}';`);
  lines.push('  END IF;');
  lines.push('');
  lines.push('  INSERT INTO public.product_variants (product_id, sku, variant_name, price, compare_at_price, is_active)');
  lines.push(`  VALUES (curr_prod_id, '${sku}', 'Tiêu chuẩn', ${p.price}, ${p.oldPrice}, true)`);
  lines.push('  ON CONFLICT (sku) DO UPDATE SET price = EXCLUDED.price, compare_at_price = EXCLUDED.compare_at_price;');
  lines.push('');
  // No delete needed

  let specs = [
    ['Dòng sản phẩm', p.series],
    ['CPU', p.cpu],
    ['Card đồ họa (GPU)', p.gpu],
    ['Dung lượng RAM', p.ram],
    ['Ổ cứng lưu trữ', p.storage],
    ['Màn hình', p.screen],
    ['Trọng lượng', p.weight],
    ['Đặc điểm nổi bật', p.highlight]
  ];

  if (officeSpecs.getOfficeLaptopSpecifications) {
    try {
      const fullSpecs = officeSpecs.getOfficeLaptopSpecifications(idx);
      if (Array.isArray(fullSpecs)) {
        fullSpecs.forEach(g => {
          if (g.rows) {
            g.rows.forEach(([k, v]) => {
              if (!specs.some(s => s[0] === k)) {
                specs.push([k, v]);
              }
            });
          }
        });
      }
    } catch(err) {}
  }

  specs.forEach(([name, val], sIdx) => {
    lines.push(`  INSERT INTO public.product_specifications (product_id, specification_name, specification_value, display_order)
  VALUES (curr_prod_id, '${escapeSql(name)}', '${escapeSql(val)}', ${sIdx + 1});`);
  });
  lines.push('');
});

lines.push('END $$;');
lines.push('');
lines.push('-- ==============================================================================');
lines.push('-- TRUY VẤN KIỂM TRA SAU KHI CHẠY (VERIFICATION QUERY)');
lines.push('-- ==============================================================================');
lines.push(`SELECT 
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
ORDER BY c.category_name DESC, b.brand_name ASC, pv.price DESC;`);

const finalSql = lines.join('\n');
fs.writeFileSync('supabase-seed-laptops.sql', finalSql, 'utf8');
console.log('SUCCESS: Written to supabase-seed-laptops.sql. Lines:', lines.length);
