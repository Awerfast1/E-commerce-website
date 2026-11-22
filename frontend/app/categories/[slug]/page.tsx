import Link from "next/link";
import LaptopCollection from "../../components/LaptopCollection";
import GenericCategoryCollection, { CatalogProduct } from "../../components/GenericCategoryCollection";
import { Suspense } from "react";
import { notFound } from "next/navigation";
import { quickCategories } from "../../../data/quickCategories";
import supabaseProductsRaw from "../../../data/supabaseProducts.json";

const supabaseProducts = supabaseProductsRaw as CatalogProduct[];

export function generateStaticParams() {
  return quickCategories.map(category => ({ slug: category.slug }));
}

async function CategoryContent({
  params,
}: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = await params;
  const category = quickCategories.find(item => item.slug === slug);
  if (!category) notFound();

  // Nếu là Laptop -> dùng LaptopCollection đã có đầy đủ 32 máy (Gaming + Văn Phòng)
  if (slug === "laptop") return <LaptopCollection />;

  // Đối với các danh mục phụ kiện khác (Bàn phím, Chuột, Tai nghe, Củ sạc,...)
  const categoryProducts = supabaseProducts.filter(
    product => product.categories?.slug === slug
  );

  return <GenericCategoryCollection category={category} products={categoryProducts} />;
}

export default function CategoryPage(props: { params: Promise<{ slug: string }> }) {
  return (
    <Suspense fallback={<div className="min-h-96 w-full flex items-center justify-center text-gray-500">Đang tải danh mục...</div>}>
      <CategoryContent params={props.params} />
    </Suspense>
  );
}
