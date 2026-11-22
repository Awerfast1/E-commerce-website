"use client";
import Link from "next/link";
import { useSearchParams } from "next/navigation";
import { useState, useEffect, Suspense } from "react";
import { changeCart, useCart, getAllProducts } from "../components/cart";
import LaptopIllustration from "../components/LaptopIllustration";
import { gamingDealsEndAt } from "../../data/gamingLaptopDeals";
import styles from "./page.module.css";

const money = (n: number) => n.toLocaleString("vi-VN") + "đ";

function CartContent() {
  const searchParams = useSearchParams();
  const selectParam = searchParams.get("select");
  const items = useCart();
  const [userExcluded, setUserExcluded] = useState<string[] | null>(null);
  const [step, setStep] = useState(0);
  const [recipient, setRecipient] = useState({ name: "", phone: "", address: "" });
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

  const allProducts = getAllProducts();
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
  const stage = selected.length ? step : 0;

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
          {!rows.length ? (
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
              <button className={styles.next} disabled={!selected.length} onClick={() => setStep(1)}>
                Tiếp theo　›
              </button>
            </>
          ) : stage === 1 ? (
            <form
              className={styles.panel}
              onSubmit={e => {
                e.preventDefault();
                setStep(2);
              }}
            >
              <h2>Thông tin giao hàng</h2>
              {(["name", "phone", "address"] as const).map((key, i) => (
                <label key={key}>
                  {["Tên người nhận", "Số điện thoại", "Địa chỉ nhận hàng"][i]}
                  <input
                    required
                    type={key === "phone" ? "tel" : "text"}
                    value={recipient[key]}
                    onChange={e => setRecipient({ ...recipient, [key]: e.target.value })}
                  />
                </label>
              ))}
              <button className={styles.next}>Kiểm tra đơn hàng　›</button>
            </form>
          ) : (
            <section className={styles.panel}>
              <h2>Kiểm tra đơn hàng</h2>
              <p>
                {recipient.name} · {recipient.phone}
              </p>
              <p>{recipient.address}</p>
              {selected.map(({ p, id }) => (
                <p key={id}>
                  {p.name} × {items[id]}
                </p>
              ))}
              <small>Website chưa tiếp nhận đơn hàng trực tuyến.</small>
            </section>
          )}
        </section>
        <aside className={styles.panel}>
          <h2>Chi tiết thanh toán</h2>
          <dl>
            <div>
              <dt>Tổng giá niêm yết</dt>
              <dd>{money(original)}</dd>
            </div>
            <div>
              <dt>Giảm giá sản phẩm</dt>
              <dd>{money(original - total)}</dd>
            </div>
            <div>
              <dt>Ưu đãi HSSV</dt>
              <dd>0đ</dd>
            </div>
            <div>
              <dt>Tạm tính</dt>
              <dd>
                <strong>{money(total)}</strong>
              </dd>
            </div>
          </dl>
          {!rows.length && <button className={styles.orderDisabled} disabled>Đặt mua hàng</button>}
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
