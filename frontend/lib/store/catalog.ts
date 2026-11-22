import "server-only";

import { cache } from "react";
import { createClient, type SupabaseClient } from "@supabase/supabase-js";

export interface VariantRow {
  sku: string;
  price: number;
  compare_at_price: number | null;
  is_active: boolean | null;
}

export interface ProductRow {
  product_id: string;
  category_id: string;
  brand_id: string | null;
  product_name: string;
  slug: string;
  short_description: string | null;
  description: string | null;
  is_active: boolean;
  is_featured: boolean;
  categories: { slug: string; category_name: string } | null;
  brands: { brand_name: string } | null;
  product_variants: VariantRow[] | null;
  product_specifications:
    | { specification_name: string; specification_value: string; display_order: number | null }[]
    | null;
  product_images: { image_url: string; is_primary: boolean | null; display_order: number | null }[] | null;
}

interface LegacyProductRow {
  id: string;
  name: string;
  price: number | string;
  category: string | null;
}

/** Flattened product used by navigation, search, cart and the home page sections. */
export interface StoreProduct {
  product_id: string;
  slug: string;
  product_name: string;
  short_description?: string;
  categorySlug: string;
  categoryName: string;
  brandName: string;
  price: number;
  compareAtPrice: number;
  imageUrl?: string;
}

const PRODUCT_COLUMNS = [
  "product_id",
  "category_id",
  "brand_id",
  "product_name",
  "slug",
  "short_description",
  "description",
  "is_active",
  "is_featured",
  "categories(slug, category_name)",
  "brands(brand_name)",
  "product_variants(sku, price, compare_at_price, is_active)",
  "product_specifications(specification_name, specification_value, display_order)",
  "product_images(image_url, is_primary, display_order)",
].join(", ");

let cachedClient: SupabaseClient | null = null;

function getDb(): SupabaseClient {
  if (cachedClient) return cachedClient;

  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const key =
    process.env.NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY ||
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

  if (!url || !key) {
    throw new Error(
      "Missing NEXT_PUBLIC_SUPABASE_URL or a public Supabase key (NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY / NEXT_PUBLIC_SUPABASE_ANON_KEY). Add them to frontend/.env.local",
    );
  }

  cachedClient = createClient(url, key, {
    auth: { persistSession: false, autoRefreshToken: false, detectSessionInUrl: false },
  });

  return cachedClient;
}

function primaryImage(row: ProductRow): string | undefined {
  const images = [...(row.product_images ?? [])].sort(
    (a, b) => (a.display_order ?? 0) - (b.display_order ?? 0),
  );
  return images.find((image) => image.is_primary)?.image_url ?? images[0]?.image_url;
}

function activeVariants(row: ProductRow): VariantRow[] {
  const variants = (row.product_variants ?? []).filter(
    (variant) => variant.is_active !== false,
  );
  return variants.length ? variants : (row.product_variants ?? []);
}

function slugify(value: string): string {
  return value
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLowerCase()
    .replace(/đ/g, "d")
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-|-$/g, "");
}

function legacyCategorySlug(categoryName: string): string {
  const normalized = slugify(categoryName);
  const aliases: [RegExp, string][] = [
    [/gaming/, "gaming-laptops"],
    [/laptop/, "laptop"],
    [/keyboard|ban-phim/, "keyboards"],
    [/mouse|mice|chuot/, "mice"],
    [/headphone|tai-nghe/, "headphones"],
    [/speaker|loa/, "speakers"],
    [/storage|ssd|o-cung/, "storage"],
    [/charger|sac/, "chargers"],
    [/power-bank|pin-du-phong/, "power-banks"],
    [/cable|cap/, "cables"],
  ];
  return aliases.find(([pattern]) => pattern.test(normalized))?.[1] || normalized;
}

function fromLegacyProduct(row: LegacyProductRow): ProductRow {
  const categoryName = row.category?.trim() || "Sản phẩm";
  const price = Number(row.price) || 0;
  return {
    product_id: row.id,
    category_id: categoryName,
    brand_id: null,
    product_name: row.name,
    slug: slugify(row.name) || row.id,
    short_description: null,
    description: null,
    is_active: true,
    is_featured: false,
    categories: { slug: legacyCategorySlug(categoryName), category_name: categoryName },
    brands: null,
    product_variants: [{ sku: row.id, price, compare_at_price: null, is_active: true }],
    product_specifications: [],
    product_images: [],
  };
}

async function getLegacyProductRows(): Promise<ProductRow[]> {
  const { data, error } = await getDb()
    .from("products")
    .select("id, name, price, category")
    .range(0, 999);

  if (error) throw new Error(`Could not load the product catalog: ${error.message}`);
  return ((data ?? []) as unknown as LegacyProductRow[]).map(fromLegacyProduct);
}

/**
 * Every active product with its category, brand, cheapest variant and image.
 * Cached per request so the storefront layout and page share a single query.
 */
export const getProductRows = cache(async (): Promise<ProductRow[]> => {
  const { data, error } = await getDb()
    .from("products")
    .select(PRODUCT_COLUMNS)
    .eq("is_active", true)
    .order("product_name", { ascending: true })
    .range(0, 999);

  if (error) return getLegacyProductRows();

  return (data ?? []) as unknown as ProductRow[];
});

export function toStoreProduct(row: ProductRow): StoreProduct {
  const variants = [...activeVariants(row)].sort((a, b) => Number(a.price) - Number(b.price));
  const variant = variants[0];
  const price = Number(variant?.price ?? 0);
  const compareAtPrice = Number(variant?.compare_at_price ?? 0);

  return {
    product_id: row.product_id,
    slug: row.slug,
    product_name: row.product_name,
    short_description: row.short_description ?? undefined,
    categorySlug: row.categories?.slug ?? "laptop",
    categoryName: row.categories?.category_name ?? "Sản phẩm",
    brandName: row.brands?.brand_name ?? "",
    price,
    compareAtPrice: compareAtPrice > price ? compareAtPrice : price,
    imageUrl: primaryImage(row),
  };
}

/** Shape expected by the category collection and product detail views. */
export interface CatalogProductView {
  product_id: string;
  category_id: string;
  brand_id?: string;
  product_name: string;
  slug: string;
  short_description?: string;
  description?: string;
  categories?: { slug: string; category_name: string };
  brands?: { brand_name: string };
  product_variants: { sku: string; price: number; compare_at_price: number }[];
  product_specifications: { specification_name: string; specification_value: string }[];
  product_images: { image_url: string; is_primary: boolean }[];
}

export function toCatalogProduct(row: ProductRow): CatalogProductView {
  const variants = [...(row.product_variants ?? [])].sort(
    (a, b) => Number(a.price) - Number(b.price),
  );

  return {
    product_id: row.product_id,
    category_id: row.category_id,
    brand_id: row.brand_id ?? undefined,
    product_name: row.product_name,
    slug: row.slug,
    short_description: row.short_description ?? undefined,
    description: row.description ?? undefined,
    categories: row.categories ?? undefined,
    brands: row.brands ?? undefined,
    product_variants: variants.map((variant) => ({
      sku: variant.sku,
      price: Number(variant.price),
      compare_at_price: Number(variant.compare_at_price ?? 0),
    })),
    product_specifications: [...(row.product_specifications ?? [])]
      .sort((a, b) => (a.display_order ?? 0) - (b.display_order ?? 0))
      .map((spec) => ({
        specification_name: spec.specification_name,
        specification_value: spec.specification_value,
      })),
    product_images: [...(row.product_images ?? [])]
      .sort((a, b) => (a.display_order ?? 0) - (b.display_order ?? 0))
      .map((image) => ({ image_url: image.image_url, is_primary: Boolean(image.is_primary) })),
  };
}

export const getStoreProducts = cache(async (): Promise<StoreProduct[]> => {
  return (await getProductRows()).map(toStoreProduct);
});

export const getCategoryProducts = cache(async (slug: string): Promise<ProductRow[]> => {
  const rows = await getProductRows();
  return rows.filter((row) => row.categories?.slug === slug);
});

export const getProductById = cache(async (id: string): Promise<ProductRow | null> => {
  const { data, error } = await getDb()
    .from("products")
    .select(PRODUCT_COLUMNS)
    .eq("product_id", id)
    .maybeSingle();

  if (error) {
    // An id that is not a UUID (legacy demo product) is simply not in the database.
    if (error.code === "22P02") return null;
    const { data: legacyData, error: legacyError } = await getDb()
      .from("products")
      .select("id, name, price, category")
      .eq("id", id)
      .maybeSingle();
    if (legacyError) throw new Error(`Could not load product ${id}: ${legacyError.message}`);
    return legacyData ? fromLegacyProduct(legacyData as unknown as LegacyProductRow) : null;
  }

  return (data as unknown as ProductRow) ?? null;
});
