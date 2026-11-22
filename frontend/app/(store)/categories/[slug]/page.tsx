import { Suspense } from "react";
import { connection } from "next/server";
import { notFound } from "next/navigation";

import LaptopCollection from "@/app/components/LaptopCollection";
import GenericCategoryCollection from "@/app/components/GenericCategoryCollection";
import { quickCategories } from "@/data/quickCategories";
import { getCategoryProducts, toCatalogProduct } from "@/lib/store/catalog";

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
  // sản phẩm được đọc trực tiếp từ Supabase nên admin sửa là web cập nhật theo.
  await connection();
  const categoryProducts = (await getCategoryProducts(slug)).map(toCatalogProduct);

  return <GenericCategoryCollection category={category} products={categoryProducts} />;
}

export default function CategoryPage(props: { params: Promise<{ slug: string }> }) {
  return (
    <Suspense fallback={<div className="min-h-96 w-full flex items-center justify-center text-gray-500">Đang tải danh mục...</div>}>
      <CategoryContent params={props.params} />
    </Suspense>
  );
}
