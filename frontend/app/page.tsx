
import Link from "next/link";
import SectionTitle from "./components/SectionTitle";
import MainPageCard from "./components/MainPageCard";

import { categories } from "../data/Categories";
import { hotDeals } from "../data/HotDeals";

function formatPrice(price: number) {
  return new Intl.NumberFormat("en-US", {
    style: "currency",
    currency: "USD",
  }).format(price);
}

export default function Home() {
  return (
    <main className="w-full flex-1 bg-gray-50">

      <section className="py-10">
        <div className="mx-auto max-w-7xl px-8 md:px-16 lg:px-24">
          <h1 className="text-3xl font-bold text-gray-900">
            Welcome to ConGears
          </h1>

          <p className="mt-2 text-gray-600">
            Explore our latest computer hardware and accessories.
          </p>
        </div>
      </section>

      <section className="bg-white py-12">
        <div className="mx-auto max-w-7xl px-8 md:px-16 lg:px-24">

          <SectionTitle
            eyebrow="Shop by category"
            title="Find your next upgrade"
            action="View all products"
            href="/search"
          />

          <div className="grid grid-cols-2 gap-4 sm:grid-cols-4 lg:grid-cols-8">
            {categories.map((category) => (
              <MainPageCard
                key={category.id}
                name={category.name}
                image={category.image}
              />
            ))}
          </div>

        </div>
      </section>

      <section className="bg-[#EAF5FF] py-12">
        <div className="mx-auto max-w-7xl px-8 md:px-16 lg:px-24">

          <SectionTitle
            eyebrow="Limited time offers"
            title="Hot Deals"
            action="View all deals"
            href="/Search?sort=discount"
          />

          <div className="grid grid-cols-1 gap-5 sm:grid-cols-2 lg:grid-cols-4">

            {hotDeals.map((product) => {

              const categoryName = categories.find(
                (category) => category.id === product.categoryId
              )?.name;

              return (
                <div
                  key={product.id}
                  className="group overflow-hidden rounded-xl border border-blue-100 bg-white shadow-sm transition duration-300 hover:-translate-y-1 hover:shadow-xl"
                >

                  <div className="relative flex aspect-square items-center justify-center overflow-hidden bg-white p-5">

                    <span className="absolute left-3 top-3 z-10 rounded-md bg-[#45A0F0] px-3 py-1 text-xs font-bold text-white">
                      {product.discountLabel}
                    </span>

                    <img
                      src={product.images[0]}
                      alt={product.name}
                      className="h-full w-full object-contain transition duration-500 group-hover:scale-110"
                    />

                  </div>

                  <div className="border-t border-gray-100 p-4">

                    <p className="mb-2 text-xs font-semibold uppercase tracking-wide text-[#45A0F0]">
                      {categoryName ?? "Other"}
                    </p>

                    <h3 className="mb-3 min-h-12 text-sm font-semibold text-gray-800">
                      {product.name}
                    </h3>

                    <div className="mb-4">

                      <p className="text-sm text-gray-400 line-through">
                        {formatPrice(product.oldPrice)}
                      </p>

                      <p className="text-xl font-bold text-[#2585D5]">
                        {formatPrice(product.price)}
                      </p>

                    </div>

                    <Link
                      href={`/Product/${product.id}`}
                      className="block w-full rounded-lg bg-[#45A0F0] px-4 py-2.5 text-center text-sm font-semibold text-white transition hover:bg-[#2585D5]"
                    >
                      View Product
                    </Link>

                  </div>
                </div>
              );
            })}

          </div>
        </div>
      </section>

    </main>
  );
}
