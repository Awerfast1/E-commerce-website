"use client";
import Link from "next/link";
import { useSearchParams } from "next/navigation";
import { useEffect, useState } from "react";
import { gamingDealsEndAt, gamingLaptopDeals, gamingLaptopSlug } from "../../data/gamingLaptopDeals";
import { getGamingLaptopSpecifications } from "../../data/gamingLaptopSpecifications";
import { officeLaptopDeals, officeLaptopSlug } from "../../data/officeLaptopDeals";
import { getOfficeLaptopSpecifications } from "../../data/officeLaptopSpecifications";
import LaptopIllustration from "./LaptopIllustration";
import css from "./LaptopCollection.module.css";

const limits = [10, 20, 30, 45, 60, 100];
const ranges = limits.slice(1).map((upper, i) => `Từ ${limits[i]} triệu – ${upper} triệu`);
const ram = ["8 GB", "16 GB", "32 GB trở lên"];
const seed: Record<string, string[]> = {
  "Khoảng giá": ranges,
  "Nhu cầu": ["Laptop Gaming", "Laptop Văn Phòng"],
  "Hãng sản xuất": ["Acer", "ASUS", "Lenovo", "Dell", "HP", "LG", "Alienware"],
  "Dòng sản phẩm": [
    "ROG Strix", "ROG Zephyrus", "TUF Gaming", "Predator Helios", "Nitro", "Legion Pro", "Legion", "Area-51",
    "Zenbook", "Vivobook", "Swift", "Aspire", "ThinkPad", "ThinkBook", "IdeaPad", "Inspiron", "XPS", "Pavilion", "Envy", "gram"
  ],
  "Dòng CPU": ["Core Ultra 5", "Core Ultra 7", "Core Ultra 9", "Core i3", "Core i5", "Core i7", "Ryzen 7", "Ryzen 9", "Ryzen AI 5", "Ryzen AI 9"],
  "Dòng GPU": ["RTX 5050", "RTX 5060", "RTX 5070", "RTX 5070 Ti", "RTX 5080", "Intel Arc Graphics", "Intel Iris Xe", "Intel Graphics", "Intel UHD Graphics"],
  "RAM": ram,
  "SSD": ["512 GB", "1 TB", "2 TB"],
};

interface CombinedLaptop {
  name: string;
  brand: string;
  series: string;
  type: "Laptop Gaming" | "Laptop Văn Phòng";
  cpu: string;
  gpu: string;
  ram: string;
  storage: string;
  screen: string;
  price: number;
  oldPrice: number;
  slug: string;
  link: string;
  artIndex: number;
  values: Record<string, string>;
}

const gamingItems: CombinedLaptop[] = gamingLaptopDeals.map((product, index) => {
  const specs = Object.fromEntries(getGamingLaptopSpecifications(index).flatMap(g => g.rows));
  const brandName = ({ ACER: "Acer", LENOVO: "Lenovo", ALIENWARE: "Alienware", ASUS: "ASUS" } as Record<string, string>)[product.brand] || product.brand;
  const seriesName = product.name.includes("ANV16S") ? "Nitro" : product.name.match(/ROG Strix|ROG Zephyrus|TUF Gaming|Predator Helios|Nitro|Legion Pro|Legion|Area-51/)?.[0] || product.name;
  const ramCategory = parseInt(product.ram) >= 32 ? "32 GB trở lên" : parseInt(product.ram) >= 16 ? "16 GB" : "8 GB";
  const cpuFamily = product.cpu.match(/^(Core Ultra \d|Core i\d|Ryzen AI \d|Ryzen \d)/)?.[0] || product.cpu;

  return {
    name: product.name,
    brand: brandName,
    series: seriesName,
    type: "Laptop Gaming",
    cpu: product.cpu,
    gpu: product.gpu,
    ram: product.ram,
    storage: product.storage,
    screen: product.screen,
    price: product.price,
    oldPrice: product.oldPrice,
    slug: gamingLaptopSlug(product.name),
    link: `/gaming-laptops/${gamingLaptopSlug(product.name)}`,
    artIndex: index,
    values: {
      "Nhu cầu": "Laptop Gaming",
      "Hãng sản xuất": brandName,
      "Dòng sản phẩm": seriesName,
      "Dòng CPU": cpuFamily,
      "Dòng GPU": product.gpu,
      RAM: ramCategory,
      SSD: product.storage.replace(" SSD", ""),
      ...specs,
    },
  };
});

const officeItems: CombinedLaptop[] = officeLaptopDeals.map((product, index) => {
  const specs = Object.fromEntries(getOfficeLaptopSpecifications(index).flatMap(g => g.rows));
  const brandName = ({ ACER: "Acer", LENOVO: "Lenovo", DELL: "Dell", ASUS: "ASUS", HP: "HP", LG: "LG" } as Record<string, string>)[product.brand] || product.brand;
  const ramCategory = product.ram.includes("32") ? "32 GB trở lên" : product.ram.includes("16") ? "16 GB" : "8 GB";
  const cpuFamily = product.cpu.match(/^(Core Ultra \d|Core i\d|Ryzen AI \d|Ryzen \d)/)?.[0] || product.cpu;
  const storageClean = product.storage.replace(" SSD", "");

  return {
    name: product.name,
    brand: brandName,
    series: product.series,
    type: "Laptop Văn Phòng",
    cpu: product.cpu,
    gpu: product.gpu,
    ram: product.ram,
    storage: product.storage,
    screen: product.screen,
    price: product.price,
    oldPrice: product.oldPrice,
    slug: officeLaptopSlug(product.name),
    link: `/laptop-van-phong/${officeLaptopSlug(product.name)}`,
    artIndex: index + 20,
    values: {
      "Nhu cầu": "Laptop Văn Phòng",
      "Hãng sản xuất": brandName,
      "Dòng sản phẩm": product.series,
      "Dòng CPU": cpuFamily,
      "Dòng GPU": product.gpu,
      RAM: ramCategory,
      SSD: storageClean,
      ...specs,
    },
  };
});

const allLaptops: CombinedLaptop[] = [...gamingItems, ...officeItems];
const options = Object.fromEntries(
  Object.entries(seed).map(([key, defaults]) => [
    key,
    [...new Set([...defaults, ...allLaptops.map(l => l.values[key]).filter(Boolean)])],
  ])
);

const money = (n: number) => n.toLocaleString("vi-VN") + "đ";

export default function LaptopCollection() {
  const searchParams = useSearchParams();

  const brandParam = searchParams.get("brand");
  const seriesParam = searchParams.get("series");
  const gpuParam = searchParams.get("gpu");
  const cpuParam = searchParams.get("cpu");
  const typeParam = searchParams.get("type");
  const minParam = searchParams.get("min") ?? "";
  const maxParam = searchParams.get("max") ?? "";

  const initialFilters: Record<string, string> = {};
  if (brandParam) {
    const match = ["Acer", "ASUS", "Lenovo", "Dell", "HP", "LG", "Alienware"].find(
      b => b.toLowerCase() === brandParam.toLowerCase()
    );
    if (match) initialFilters["Hãng sản xuất"] = match;
  }
  if (seriesParam) initialFilters["Dòng sản phẩm"] = seriesParam;
  if (gpuParam) initialFilters["Dòng GPU"] = gpuParam;
  if (cpuParam) initialFilters["Dòng CPU"] = cpuParam;
  if (typeParam) {
    if (typeParam === "gaming") initialFilters["Nhu cầu"] = "Laptop Gaming";
    if (typeParam === "office") initialFilters["Nhu cầu"] = "Laptop Văn Phòng";
  }

  const [userFilters, setUserFilters] = useState<Record<string, string> | null>(null);
  const [userMin, setUserMin] = useState<string | null>(null);
  const [userMax, setUserMax] = useState<string | null>(null);
  const [expanded, setExpanded] = useState<Record<string, boolean>>({});
  const [sort, setSort] = useState("Mặc định");
  const [sale, setSale] = useState(false);

  const activeFilters = userFilters ?? initialFilters;
  const activeMin = userMin ?? minParam;
  const activeMax = userMax ?? maxParam;

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

  function reset() {
    setUserFilters({});
    setUserMin("");
    setUserMax("");
  }

  function toggle(key: string, value?: string) {
    if (key === "Khoảng giá") {
      setUserMin("");
      setUserMax("");
    }
    setUserFilters(old => ({ ...(old ?? activeFilters), [key]: value ?? "" }));
  }

  const rows = allLaptops
    .map(l => ({ ...l, currentPrice: sale ? l.price : l.oldPrice }))
    .filter(({ values, currentPrice }) =>
      (!activeMin || currentPrice >= Number(activeMin)) &&
      (!activeMax || currentPrice <= Number(activeMax)) &&
      Object.entries(activeFilters).every(([key, value]) => {
        if (!value) return true;
        if (key !== "Khoảng giá") return values[key] === value;
        const i = ranges.indexOf(value);
        return currentPrice >= limits[i] * 1e6 && (currentPrice < limits[i + 1] * 1e6 || (i === ranges.length - 1 && currentPrice === limits[i + 1] * 1e6));
      })
    );

  if (sort === "Giá tăng dần") rows.sort((a, b) => a.currentPrice - b.currentPrice);
  if (sort === "Giá giảm dần") rows.sort((a, b) => b.currentPrice - a.currentPrice);
  if (sort === "Tên A-Z") rows.sort((a, b) => a.name.localeCompare(b.name, "vi"));

  return (
    <main className={css.page}>
      <nav className={css.breadcrumb} aria-label="Đường dẫn">
        <Link href="/">Trang chủ</Link>
        <span aria-hidden="true">/</span>
        <span aria-current="page">Tất cả Laptop ({allLaptops.length} sản phẩm)</span>
      </nav>
      <h1>Danh mục Laptop</h1>
      <div className={css.layout}>
        <aside>
          <header>
            <strong>Bộ lọc tìm kiếm</strong>
            <button onClick={reset}>Xóa lọc</button>
          </header>
          <div className={css.scroll}>
            {Object.entries(options).map(([key, choices]) => (
              <details open key={key}>
                <summary>{key}</summary>
                <label>
                  <input
                    type="radio"
                    name={key}
                    checked={!activeFilters[key]?.length && !(key === "Khoảng giá" && (activeMin || activeMax))}
                    onChange={() => toggle(key)}
                  />{" "}
                  Tất cả
                </label>
                {(expanded[key] ? choices : choices.slice(0, 6)).map(v => (
                  <label key={v}>
                    <input
                      type="radio"
                      name={key}
                      checked={activeFilters[key] === v}
                      onChange={() => toggle(key, v)}
                    />{" "}
                    {v}
                  </label>
                ))}
                {choices.length > 6 && (
                  <button onClick={() => setExpanded({ ...expanded, [key]: !expanded[key] })}>
                    {expanded[key] ? "Thu gọn" : "Xem thêm"}
                  </button>
                )}
                {key === "Khoảng giá" && (
                  <>
                    <small>Hoặc nhập khoảng giá (đồng)</small>
                    <div className={css.range}>
                      {[activeMin, activeMax].map((v, i) => (
                        <input
                          key={i}
                          aria-label={i ? "Giá tối đa" : "Giá tối thiểu"}
                          type="number"
                          min="0"
                          placeholder={i ? "Đến" : "Từ"}
                          value={v}
                          onChange={e => {
                            setUserFilters(old => ({ ...(old ?? activeFilters), [key]: "" }));
                            (i ? setUserMax : setUserMin)(e.target.value);
                          }}
                        />
                      ))}
                    </div>
                  </>
                )}
              </details>
            ))}
          </div>
        </aside>
        <section>
          <header className={css.toolbar}>
            <span aria-live="polite">
              Tìm thấy <b>{rows.length}</b> kết quả
            </span>
            <div className={css.sortOptions} role="group" aria-label="Sắp xếp laptop">
              {["Mặc định", "Giá tăng dần", "Giá giảm dần", "Tên A-Z"].map((option, i) => (
                <span key={option}>
                  {i > 0 && <i aria-hidden="true">•</i>}
                  <button
                    type="button"
                    aria-pressed={sort === option}
                    onClick={() => setSort(option)}
                  >
                    {option}
                  </button>
                </span>
              ))}
            </div>
          </header>
          <div className={css.grid}>
            {rows.map((laptop) => (
              <Link className={css.card} key={laptop.name} href={laptop.link}>
                <div className={css.art}>
                  <LaptopIllustration index={laptop.artIndex} />
                </div>
                <h2>{laptop.name}</h2>
                <p>{[laptop.cpu, laptop.gpu, laptop.ram, laptop.storage, laptop.screen].join(" · ")}</p>
                <footer>
                  {sale && (
                    <small>
                      <del>{money(laptop.oldPrice)}</del> −{Math.round((1 - laptop.price / laptop.oldPrice) * 100)}%
                    </small>
                  )}
                  <strong>{money(laptop.currentPrice)}</strong>
                </footer>
              </Link>
            ))}
          </div>
          {!rows.length && (
            <div className={css.empty}>
              <h2>Không tìm thấy laptop phù hợp</h2>
              <button onClick={reset}>Xóa bộ lọc</button>
            </div>
          )}
        </section>
      </div>
    </main>
  );
}
