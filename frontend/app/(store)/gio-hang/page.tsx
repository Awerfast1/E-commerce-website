"use client";
import Link from "next/link";
import { useSearchParams } from "next/navigation";
import { useState, useEffect, useMemo, Suspense, useRef } from "react";
import { buildCartProducts, changeCart, clearCartItems, useCart, useStoreCatalog } from "@/app/components/cart";
import LaptopIllustration from "@/app/components/LaptopIllustration";
import { gamingDealsEndAt } from "@/data/gamingLaptopDeals";
import { getCurrentUser } from "@/lib/auth";
import { useRouter } from "next/navigation";
import styles from "./page.module.css";

const money = (n: number) => n.toLocaleString("vi-VN") + "đ";

function createOrderRequestId() {
  if (typeof globalThis.crypto?.randomUUID === "function") return globalThis.crypto.randomUUID();
  if (typeof globalThis.crypto?.getRandomValues === "function") {
    const bytes = globalThis.crypto.getRandomValues(new Uint8Array(16));
    bytes[6] = (bytes[6] & 0x0f) | 0x40;
    bytes[8] = (bytes[8] & 0x3f) | 0x80;
    const hex = [...bytes].map(value => value.toString(16).padStart(2, "0")).join("");
    return `${hex.slice(0, 8)}-${hex.slice(8, 12)}-${hex.slice(12, 16)}-${hex.slice(16, 20)}-${hex.slice(20)}`;
  }
  return "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g, char => {
    const value = Math.floor(Math.random() * 16);
    return (char === "x" ? value : (value & 0x3) | 0x8).toString(16);
  });
}

function CartContent() {
  const searchParams = useSearchParams();
  const router = useRouter();
  const selectParam = searchParams.get("select");
  const items = useCart();
  const [userExcluded, setUserExcluded] = useState<string[] | null>(null);
  const [step, setStep] = useState(searchParams.get("step") === "1" ? 1 : 0);
  const [recipient, setRecipient] = useState({ name: "", phone: "", address: "", ward: "", district: "", city: "" });
  const [sale, setSale] = useState(false);
  const [placingOrder, setPlacingOrder] = useState(false);
  const [quotingOrder, setQuotingOrder] = useState(false);
  const [orderError, setOrderError] = useState("");
  const [quote, setQuote] = useState<{
    subtotal: number;
    listSubtotal: number;
    discountAmount: number;
    items: { slug: string; name: string; quantity: number; unit_price: number; compare_at_price: number; line_total: number }[];
  } | null>(null);
  const [placedOrder, setPlacedOrder] = useState<{
    order_code: string;
    subtotal: number;
    discount_amount: number;
    total_amount: number;
    items: { name: string; quantity: number }[];
  } | null>(null);
  const requestId = useRef("");
  const catalogProducts = useStoreCatalog();
  const allProducts = useMemo(() => buildCartProducts(catalogProducts), [catalogProducts]);
  const [checkingAuth, setCheckingAuth] = useState(false);
  const [authCheckError, setAuthCheckError] = useState("");
  const removeIntentHandled = useRef(false);
  const removeIntent = searchParams.get("remove");

  async function continueToShipping() {
    setCheckingAuth(true);
    setAuthCheckError("");
    try {
      const user = await getCurrentUser();
      if (!user) {
        router.push(`/dang-nhap?redirect=${encodeURIComponent("/gio-hang?step=1")}`);
        return;
      }
      setStep(1);
    } catch {
      setAuthCheckError("Chưa thể xác minh đăng nhập do lỗi kết nối. Giỏ hàng và phiên đăng nhập của bạn vẫn được giữ; vui lòng thử lại.");
    } finally {
      setCheckingAuth(false);
    }
  }

  useEffect(() => {
    if (!removeIntent || removeIntentHandled.current) return;
    removeIntentHandled.current = true;
    const validSlugs = new Set(allProducts.map(product => product.slug));
    removeIntent.split(",").filter(id => validSlugs.has(id)).forEach(id => changeCart(id, "remove"));
    router.replace("/gio-hang");
  }, [allProducts, removeIntent, router]);

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

  const rows = allProducts
    .filter(p => items[p.slug])
    .map(p => ({
      p,
      id: p.slug,
      index: p.artIndex,
    }));

  const excluded = userExcluded ?? (selectParam ? rows.filter(r => r.id !== selectParam).map(r => r.id) : []);
  const selected = rows.filter(r => !excluded.includes(r.id));
  const count = Object.values(items).reduce((sum, n) => sum + n, 0);
  const original = selected.reduce((sum, { p, id }) => sum + p.oldPrice * items[id], 0);
  const total = sale ? selected.reduce((sum, { p, id }) => sum + p.price * items[id], 0) : original;
  const stage = placedOrder ? 2 : selected.length ? step : 0;

  async function prepareOrderReview() {
    setQuotingOrder(true);
    setOrderError("");
    try {
      const response = await fetch("/api/orders/quote", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ items: selected.map(({ p, id }) => ({ slug: p.slug, quantity: items[id] })) }),
      });
      const result = await response.json().catch(() => ({}));
      if (!response.ok) throw new Error(result.error || "Ch\u01b0a l\u1ea5y \u0111\u01b0\u1ee3c gi\u00e1 hi\u1ec7n t\u1ea1i.");
      setQuote(result.quote);
      setStep(2);
    } catch (error) {
      setOrderError(error instanceof Error ? error.message : "Ch\u01b0a l\u1ea5y \u0111\u01b0\u1ee3c gi\u00e1 hi\u1ec7n t\u1ea1i.");
    } finally {
      setQuotingOrder(false);
    }
  }

  async function placeOrder() {
    if (placingOrder || !selected.length || !quote) return;
    setPlacingOrder(true);
    setOrderError("");
    const controller = new AbortController();
    const timeoutId = window.setTimeout(() => controller.abort(), 30_000);
    try {
      // Reuse the key after a timeout so retrying cannot create a duplicate order.
      const idempotencyKey = requestId.current || createOrderRequestId();
      requestId.current = idempotencyKey;
      const response = await fetch("/api/orders", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        signal: controller.signal,
        body: JSON.stringify({
          requestId: idempotencyKey,
          expectedTotal: quote.subtotal,
          items: selected.map(({ p, id }) => ({ slug: p.slug, quantity: items[id] })),
          recipient,
        }),
      });
      const result = await response.json().catch(() => ({}));
      if (!response.ok) throw new Error(result.error || "Chưa thể tiếp nhận đơn hàng.");
      setPlacedOrder({
        ...result.order,
        items: quote.items.map(({ name, quantity }) => ({ name, quantity })),
      });
      clearCartItems(selected.map(({ id }) => id));
      requestId.current = "";
      setStep(0);
    } catch (error) {
      if (error instanceof Error && error.name === "AbortError") {
        setOrderError("Máy chủ phản hồi quá lâu. Bạn có thể thử gửi lại an toàn.");
        return;
      }
      setOrderError(error instanceof Error ? error.message : "Chưa thể tiếp nhận đơn hàng.");
    } finally {
      window.clearTimeout(timeoutId);
      setPlacingOrder(false);
    }
  }

  return (
    <main className={styles.page}>
      <nav>
        <Link href="/">Trang chủ</Link>　/　Giỏ hàng
      </nav>
      <h1 className="sr-only">Giỏ hàng</h1>
      <div className={styles.layout}>
        <section>
          <ol className={styles.steps}>
            {["Giỏ hàng", "Thông tin giao hàng", "Xác nhận đơn hàng"].map((title, i) => (
              <li key={title} aria-current={stage === i ? "step" : undefined}>
                <button disabled={i >= stage} onClick={() => setStep(i)}>
                  <b>{i + 1}</b>
                  {title}
                </button>
              </li>
            ))}
          </ol>
          {!rows.length && !placedOrder ? (
            <section className={styles.empty}>
              <svg width="66" height="66" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
                <path d="M1 2h4l1 3h16l-3 9H8L4 4H1z" />
                <circle cx="9" cy="19" r="2" />
                <circle cx="18" cy="19" r="2" />
              </svg>
              <h2>Chưa có sản phẩm trong đơn</h2>
              <p>Hãy thêm sản phẩm vào giỏ hàng trước khi nhập thông tin giao hàng.</p>
              <Link href="/categories/laptop">Tiếp tục mua sắm</Link>
            </section>
          ) : stage === 0 ? (
            <>
              <div className={styles.bar}>
                <label>
                  <input
                    type="checkbox"
                    checked={selected.length === rows.length}
                    onChange={e => setUserExcluded(e.target.checked ? [] : rows.map(r => r.id))}
                  />{" "}
                  Tất cả sản phẩm ({count})
                </label>
                <button
                  disabled={!selected.length}
                  onClick={() => {
                    selected.forEach(r => changeCart(r.id, "remove"));
                    setUserExcluded([]);
                  }}
                >
                  Xóa đã chọn
                </button>
              </div>
              {rows.map(({ p, index, id }) => (
                <article className={styles.row} key={id}>
                  <input
                    aria-label={`Chọn ${p.name}`}
                    type="checkbox"
                    checked={!excluded.includes(id)}
                    onChange={e => setUserExcluded(e.target.checked ? excluded.filter(v => v !== id) : [...excluded, id])}
                  />
                  <div className={styles.art}>
                    {p.imageUrl ? (
                      <img
                        src={p.imageUrl}
                        alt={p.name}
                        style={{ width: "100%", height: "100%", objectFit: "contain", borderRadius: "6px" }}
                      />
                    ) : (
                      <LaptopIllustration index={index >= 0 ? index : 0} />
                    )}
                  </div>
                  <Link href={p.link}>{p.name}</Link>
                  <div>
                    <strong>{money(sale ? p.price : p.oldPrice)}</strong>
                    {sale && <del>{money(p.oldPrice)}</del>}
                  </div>
                  <div className={styles.qty}>
                    <button
                      aria-label={`Giảm số lượng ${p.name}`}
                      disabled={items[id] <= 1}
                      onClick={() => changeCart(id, -1)}
                    >
                      −
                    </button>
                    {items[id]}
                    <button aria-label={`Tăng số lượng ${p.name}`} onClick={() => changeCart(id, 1)}>
                      +
                    </button>
                  </div>
                  <button
                    className={styles.remove}
                    aria-label={`Xóa ${p.name}`}
                    title={`Xóa ${p.name}`}
                    onClick={() => {
                      changeCart(id, "remove");
                      setUserExcluded(excluded.filter(v => v !== id));
                    }}
                  >
                    <svg viewBox="0 0 24 24" aria-hidden="true">
                      <path d="M4 7h16M10 11v6m4-6v6M5 7l1 14h12l1-14M9 7V4h6v3" />
                    </svg>
                  </button>
                </article>
              ))}
              <button className={styles.next} disabled={!selected.length || checkingAuth} onClick={() => void continueToShipping()}>
                {checkingAuth ? "Đang kiểm tra..." : "Tiếp theo　›"}
              </button>
              {authCheckError && <p className={styles.authError} role="alert">{authCheckError}</p>}
            </>
          ) : stage === 1 ? (
            <form
              className={styles.panel}
              onSubmit={e => {
                e.preventDefault();
                void prepareOrderReview();
              }}
            >
              <h2>Thông tin giao hàng</h2>
              {(["name", "phone", "address", "ward", "district", "city"] as const).map((key, i) => (
                <label key={key}>
                  {["T\u00ean ng\u01b0\u1eddi nh\u1eadn", "S\u1ed1 \u0111i\u1ec7n tho\u1ea1i", "\u0110\u1ecba ch\u1ec9 nh\u1eadn h\u00e0ng", "Ph\u01b0\u1eddng/X\u00e3", "Qu\u1eadn/Huy\u1ec7n", "T\u1ec9nh/Th\u00e0nh ph\u1ed1"][i]}
                  <input
                    required={key === "name" || key === "phone" || key === "address" || key === "city"}
                    type={key === "phone" ? "tel" : "text"}
                    value={recipient[key]}
                    onChange={e => setRecipient({ ...recipient, [key]: e.target.value })}
                  />
                </label>
              ))}
              {orderError && <p className={styles.authError} role="alert">{orderError}</p>}
              <button className={styles.next} disabled={quotingOrder}>
                {quotingOrder ? "\u0110ang ki\u1ec3m tra gi\u00e1..." : "Ki\u1ec3m tra đơn hàng　›"}
              </button>
            </form>
          ) : (
            <section className={styles.panel}>
              <h2>{placedOrder ? "\u0110\u00e3 ti\u1ebfp nh\u1eadn \u0111\u01a1n h\u00e0ng" : "Ki\u1ec3m tra \u0111\u01a1n h\u00e0ng"}</h2>
              <p>
                {recipient.name} · {recipient.phone}
              </p>
              <p>{recipient.address}</p>
              {(placedOrder?.items ?? quote?.items ?? selected.map(({ p, id }) => ({ name: p.name, quantity: items[id] }))).map((item, index) => (
                <p key={`${item.name}-${index}`}>
                  {item.name} &times; {item.quantity}
                </p>
              ))}
              {placedOrder ? (
                <p>{"\u0110\u01a1n h\u00e0ng \u0111ang ch\u1edd c\u1eeda h\u00e0ng x\u00e1c nh\u1eadn. T\u1ed5ng ti\u1ec1n theo gi\u00e1 trong c\u01a1 s\u1edf d\u1eef li\u1ec7u: "}<strong>{money(placedOrder.total_amount)}</strong>.</p>
              ) : (
                <>
                  <small>{"\u0110\u01a1n s\u1ebd \u0111\u01b0\u1ee3c ghi nh\u1eadn v\u1edbi tr\u1ea1ng th\u00e1i ch\u1edd x\u00e1c nh\u1eadn. Gi\u00e1 hi\u1ec7n t\u1ea1i \u0111\u00e3 \u0111\u01b0\u1ee3c x\u00e1c nh\u1eadn t\u1eeb catalog trong c\u01a1 s\u1edf d\u1eef li\u1ec7u."}</small>
                  {orderError && <p className={styles.authError} role="alert">{orderError}</p>}
                  <button className={styles.next} type="button" disabled={placingOrder} onClick={() => void placeOrder()}>
                    {placingOrder ? "\u0110ang g\u1eedi \u0111\u01a1n..." : "X\u00e1c nh\u1eadn \u0111\u1eb7t h\u00e0ng"}
                  </button>
                </>
              )}
            </section>
          )}
        </section>
        <aside className={styles.panel}>
          <h2>Chi tiết thanh toán</h2>
          <dl>
            <div>
              <dt>Tổng giá niêm yết</dt>
              <dd>{money(placedOrder?.subtotal ?? quote?.listSubtotal ?? original)}</dd>
            </div>
            <div>
              <dt>Giảm giá sản phẩm</dt>
              <dd>{money(placedOrder?.discount_amount ?? quote?.discountAmount ?? original - total)}</dd>
            </div>
            <div>
              <dt>Ưu đãi HSSV</dt>
              <dd>0đ</dd>
            </div>
            <div>
              <dt>Tạm tính</dt>
              <dd>
                <strong>{money(placedOrder?.total_amount ?? quote?.subtotal ?? total)}</strong>
              </dd>
            </div>
          </dl>
          {!rows.length && !placedOrder && <button className={styles.orderDisabled} disabled>Đặt mua hàng</button>}
          <small>Ưu đãi học sinh, sinh viên áp dụng sau khi xác minh.</small>
        </aside>
      </div>
    </main>
  );
}

export default function CartPage() {
  return (
    <Suspense fallback={<main className={styles.page}><p>Đang tải giỏ hàng...</p></main>}>
      <CartContent />
    </Suspense>
  );
}
