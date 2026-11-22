"use client";

import Link from "next/link";
import { Suspense, use, useEffect, useMemo, useState } from "react";
import { notFound } from "next/navigation";
import { gamingDealsEndAt } from "@/data/gamingLaptopDeals";
import { buildCartProducts, useStoreCatalog } from "@/app/components/cart";
import { studentPricing } from "@/data/studentPricing";

type Props = { params: Promise<{ slug: string }> };
const money = new Intl.NumberFormat("vi-VN", { style: "currency", currency: "VND" });

function Summary({ params }: Props) {
  const { slug } = use(params);
  const catalogProducts = useStoreCatalog();
  const allProducts = useMemo(() => buildCartProducts(catalogProducts), [catalogProducts]);
  const laptop = allProducts.find(item => item.slug === slug);
  if (!laptop) notFound();

  const [sale, setSale] = useState(false);

  useEffect(() => {
    const end = Date.parse(gamingDealsEndAt);
    const delay = end - Date.now();
    if (delay <= 0) return;

    const timer = setTimeout(() => {
      setSale(Date.now() < end);
    }, 0);

    const endTimer = setTimeout(() => {
      setSale(false);
    }, delay);

    return () => {
      clearTimeout(timer);
      clearTimeout(endTimer);
    };
  }, []);

  const price = sale ? laptop.price : laptop.oldPrice;
  // Replace with the signed-in customer's server-verified education status when available.
  const { discount, total } = studentPricing(price, false);

  return (
    <main className="mx-auto my-8 max-w-2xl rounded-xl border border-slate-200 bg-white p-6">
      <Link className="text-blue-700" href={laptop.link}>‹ Quay lại sản phẩm</Link>
      <h1 className="my-5 text-2xl font-bold">Thanh toán</h1>
      <h2 className="font-semibold">{laptop.name}</h2>
      <dl className="mt-4 space-y-4">
        <div className="flex justify-between"><dt>Giá sản phẩm</dt><dd>{money.format(price)}</dd></div>
        <div className="flex justify-between"><dt>Ưu đãi học sinh, sinh viên</dt><dd>{discount ? "−" : ""}{money.format(discount)}</dd></div>
        <div className="flex justify-between border-t pt-4 font-bold"><dt>Tổng thanh toán</dt><dd>{money.format(total)}</dd></div>
      </dl>
      <p className="mt-4 text-sm text-slate-600">{discount ? "Đã áp dụng ưu đãi học sinh, sinh viên." : "Ưu đãi 10%, tối đa 500.000đ, sẽ được trừ khi tư cách học sinh, sinh viên đã được xác minh."}</p>
    </main>
  );
}

export default function Checkout(props: Props) {
  return <Suspense fallback={<p>Đang tính tổng thanh toán…</p>}><Summary {...props} /></Suspense>;
}
