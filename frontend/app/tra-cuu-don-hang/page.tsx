"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { AuthUser, getCurrentUser } from "../../lib/auth";

export default function OrderLookupPage() {
  const router = useRouter();
  const [user, setUser] = useState<AuthUser | null>(null);
  const [checking, setChecking] = useState(true);

  useEffect(() => {
    let active = true;
    getCurrentUser().then(currentUser => {
      if (!active) return;
      if (currentUser) {
        setUser(currentUser);
      } else {
        router.replace(`/dang-nhap?redirect=${encodeURIComponent("/tra-cuu-don-hang")}`);
      }
      setChecking(false);
    }).catch(() => {
      if (active) {
        router.replace(`/dang-nhap?redirect=${encodeURIComponent("/tra-cuu-don-hang")}`);
        setChecking(false);
      }
    });
    return () => { active = false; };
  }, [router]);

  return (
    <main style={{ maxWidth: 1100, minHeight: 420, margin: "40px auto", padding: "28px 20px", color: "#203246" }}>
      {checking ? <p>Đang kiểm tra đăng nhập...</p> : user ? (
        <section style={{ padding: 28, border: "1px solid #e1e9f1", borderRadius: 14, background: "#fff" }}>
          <h1 style={{ margin: "0 0 10px", fontSize: 28 }}>Tra cứu đơn hàng</h1>
          <p>Đã đăng nhập với {user.email || user.phone}. Thông tin đơn hàng sẽ hiển thị tại đây.</p>
        </section>
      ) : <p>Đang chuyển đến trang đăng nhập...</p>}
    </main>
  );
}
