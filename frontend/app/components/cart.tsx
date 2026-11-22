"use client";
import { useRef, useState, useSyncExternalStore, type ReactNode } from "react";
import LaptopIllustration from "./LaptopIllustration";
import styles from "./CartDrawer.module.css";
import { gamingDealsEndAt, gamingLaptopDeals, gamingLaptopSlug } from "../../data/gamingLaptopDeals";
import { officeLaptopDeals, officeLaptopSlug } from "../../data/officeLaptopDeals";
import supabaseProductsRaw from "../../data/supabaseProducts.json";

const key = "congears.cart.v1";
const empty = () => "{}";
const snapshot = () => localStorage.getItem(key) || "{}";
const emptySubscribe = () => () => {};
const clientSnapshot = () => true;
const serverSnapshot = () => false;
function useIsHydrated() {
  return useSyncExternalStore(emptySubscribe, clientSnapshot, serverSnapshot);
}

export interface CartProduct {
  name: string;
  price: number;
  oldPrice: number;
  slug: string;
  artIndex: number;
  imageUrl?: string;
  link: string;
}

export function getAllProducts(): CartProduct[] {
  const gaming: CartProduct[] = gamingLaptopDeals.map((item, index) => ({
    name: item.name,
    price: item.price,
    oldPrice: item.oldPrice,
    slug: gamingLaptopSlug(item.name),
    artIndex: index,
    link: `/gaming-laptops/${gamingLaptopSlug(item.name)}`,
  }));

  const office: CartProduct[] = officeLaptopDeals.map((item, index) => ({
    name: item.name,
    price: item.price,
    oldPrice: item.oldPrice,
    slug: officeLaptopSlug(item.name),
    artIndex: index + 20,
    link: `/laptop-van-phong/${officeLaptopSlug(item.name)}`,
  }));

  const existingSlugs = new Set([...gaming, ...office].map(p => p.slug));

  const catalogProducts: CartProduct[] = [];
  for (let i = 0; i < (supabaseProductsRaw as any[]).length; i++) {
    const p = (supabaseProductsRaw as any[])[i];
    const slug = p.slug || p.product_id;
    if (existingSlugs.has(slug)) continue;

    const variant = p.product_variants?.[0];
    const price = variant?.price ?? 1000000;
    const oldPrice = variant?.compare_at_price && variant.compare_at_price > price ? variant.compare_at_price : price;
    const image = p.product_images?.find((img: any) => img.is_primary)?.image_url ?? p.product_images?.[0]?.image_url;

    catalogProducts.push({
      name: p.product_name,
      price,
      oldPrice,
      slug,
      artIndex: -1,
      imageUrl: image,
      link: `/Product/${p.product_id}`,
    });
  }

  return [...gaming, ...office, ...catalogProducts];
}

const allProductsList = getAllProducts();
const catalog = new Set(allProductsList.map(d => d.slug));

function parse(raw: string): Record<string, number> {
  try {
    const items: Record<string, number> = {};
    for (const [id, n] of Object.entries(JSON.parse(raw))) {
      if (catalog.has(id) && typeof n === "number" && Number.isSafeInteger(n) && n > 0) items[id] = n;
    }
    return items;
  } catch {
    return {};
  }
}

function subscribe(update: () => void) {
  window.addEventListener("storage", update);
  window.addEventListener(key, update);
  return () => {
    window.removeEventListener("storage", update);
    window.removeEventListener(key, update);
  };
}

export function useCart() {
  return parse(useSyncExternalStore(subscribe, snapshot, empty));
}

export function changeCart(id: string, delta: number | "remove") {
  const items = parse(snapshot());
  const next = delta === "remove" ? 0 : (items[id] || 0) + delta;
  if (next > 0) items[id] = next;
  else delete items[id];
  localStorage.setItem(key, JSON.stringify(items));
  window.dispatchEvent(new Event(key));
}

export function BuyNowButton({ slug, className, children }: { slug: string; className?: string; children?: ReactNode }) {
  return (
    <button
      type="button"
      className={className}
      style={{ cursor: "pointer" }}
      onClick={() => {
        try {
          changeCart(slug, 1);
        } catch {
          // ignore error if storage fails
        }
        window.location.assign(`/gio-hang?select=${encodeURIComponent(slug)}`);
      }}
    >
      {children || "Mua ngay"}
    </button>
  );
}

export function AddToCart({ slug, children }: { slug: string; children: ReactNode }) {
  const dialog = useRef<HTMLElement>(null);
  const ready = useIsHydrated();
  const [error, setError] = useState("");
  const panelId = `cart-quantity-${slug}`;
  const [quantity, setQuantity] = useState("1");
  const [sale, setSale] = useState(false);

  const product = allProductsList.find(item => item.slug === slug);
  if (!product) return null;

  const unit = sale ? product.price : product.oldPrice;
  const n = Number(quantity);
  const valid = Number.isSafeInteger(n) && n >= 1 && Number.isSafeInteger(n * unit);
  const money = (value: number) => value.toLocaleString("vi-VN") + "đ";

  return (
    <>
      <button
        className={styles.trigger}
        type="button"
        popoverTarget={panelId}
        popoverTargetAction="show"
        aria-label="Thêm vào giỏ hàng"
        aria-haspopup="dialog"
      >
        {children}
      </button>
      <aside
        id={panelId}
        ref={dialog}
        popover="auto"
        role="dialog"
        className={styles.drawer}
        aria-label="Giỏ hàng của bạn"
        onToggle={event => {
          if (event.newState !== "open") return;
          setQuantity("1");
          setError("");
          setSale(Date.now() < Date.parse(gamingDealsEndAt));
        }}
      >
        <form
          onSubmit={event => {
            event.preventDefault();
            if (!ready || !valid || !dialog.current?.matches(":popover-open")) return;
            try {
              changeCart(slug, n);
            } catch {
              setError("Chưa lưu được giỏ hàng. Hãy cho phép trình duyệt lưu dữ liệu rồi thử lại.");
              return;
            }
            dialog.current.hidePopover();
            window.location.assign("/gio-hang");
          }}
        >
          <header>
            <h2>Giỏ hàng của bạn</h2>
            <button type="button" aria-label="Đóng" popoverTarget={panelId} popoverTargetAction="hide">
              ×
            </button>
          </header>
          <section>
            <div className={styles.card}>
              <div className={styles.image}>
                {product.imageUrl ? (
                  <img
                    src={product.imageUrl}
                    alt={product.name}
                    style={{ width: "100%", height: "100%", objectFit: "contain", borderRadius: "8px" }}
                  />
                ) : (
                  <LaptopIllustration index={product.artIndex >= 0 ? product.artIndex : 0} />
                )}
              </div>
              <div>
                <h3>{product.name}</h3>
                <strong>{money(unit)}</strong>
                {sale && <del>{money(product.oldPrice)}</del>}
                <label htmlFor={`add-quantity-${slug}`}>Số lượng muốn thêm</label>
                <div className={styles.stepper}>
                  <button
                    type="button"
                    disabled={n <= 1}
                    aria-label="Giảm số lượng"
                    onClick={() => setQuantity(String(Math.max(1, n - 1)))}
                  >
                    −
                  </button>
                  <input
                    id={`add-quantity-${slug}`}
                    type="number"
                    min="1"
                    step="1"
                    required
                    value={quantity}
                    onChange={e => setQuantity(e.target.value)}
                  />
                  <button
                    type="button"
                    aria-label="Tăng số lượng"
                    onClick={() => setQuantity(String(Math.max(1, n + 1)))}
                  >
                    +
                  </button>
                </div>
              </div>
            </div>
          </section>
          <footer>
            {error && <p role="alert">{error}</p>}
            <button type="submit" disabled={!ready || !valid}>
              Xác nhận thêm vào giỏ{valid && " — " + money(unit * n)}
            </button>
          </footer>
        </form>
      </aside>
    </>
  );
}
