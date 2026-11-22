"use client";

import Link from "next/link";
import { useRouter } from "next/navigation";
import AuthForm from "./AuthForm";
import { AuthMode } from "../../lib/auth";
import styles from "./AuthPage.module.css";

const benefits = [
  ["✦", "Lưu giỏ hàng", "Tiếp tục mua sắm trên mọi lần ghé thăm"],
  ["✓", "Theo dõi đơn hàng", "Cập nhật trạng thái đơn thuận tiện"],
  ["↗", "Ưu đãi thành viên", "Nhận thông tin ưu đãi dành riêng cho bạn"],
  ["⌁", "Hỗ trợ nhanh", "Thông tin tài khoản được lưu an toàn"],
];

export default function AuthPage({ initialMode }: { initialMode: "login" | "register" }) {
  const router = useRouter();

  function getReturnPath() {
    const target = new URLSearchParams(window.location.search).get("redirect");
    return target?.startsWith("/") && !target.startsWith("//") ? target : "/";
  }

  function handleModeChange(next: AuthMode) {
    if (next === "login" || next === "register") {
      const query = new URLSearchParams(window.location.search);
      const suffix = query.toString() ? `?${query.toString()}` : "";
      router.push(`${next === "login" ? "/dang-nhap" : "/dang-ky"}${suffix}`);
    }
  }

  function handleAuthenticated() {
    router.push(getReturnPath());
    router.refresh();
  }

  return (
    <main className={styles.page}>
      <aside className={styles.brandPanel}>
        <Link className={styles.brand} href="/" aria-label="ConGears - Trang chủ">
          <span>C</span> CONGEARS
        </Link>
        <div className={styles.pitch}>
          <p className={styles.kicker}>THÀNH VIÊN CONGEARS</p>
          <h2>Mua sắm thông minh,<br />ưu đãi tối đa</h2>
          <p className={styles.pitchText}>Tạo tài khoản để quản lý đơn hàng và trải nghiệm mua sắm tiện lợi hơn.</p>
          <ul>
            {benefits.map(([icon, title, description]) => (
              <li key={title}>
                <span aria-hidden="true">{icon}</span>
                <div><strong>{title}</strong><small>{description}</small></div>
              </li>
            ))}
          </ul>
        </div>
        <div className={styles.support}>
          <small>CẦN HỖ TRỢ?</small>
          <strong>Đội ngũ CSKH ConGears luôn sẵn sàng hỗ trợ.</strong>
        </div>
      </aside>
      <section className={styles.formPanel}>
        <div className={styles.formCard}>
          <AuthForm initialMode={initialMode} onModeChange={handleModeChange} onAuthenticated={handleAuthenticated} />
        </div>
      </section>
    </main>
  );
}
