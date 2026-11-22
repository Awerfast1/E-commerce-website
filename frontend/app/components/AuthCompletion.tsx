"use client";

import { FormEvent, useEffect, useRef, useState } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import styles from "./AuthCompletion.module.css";

export default function AuthCompletion({ mode }: { mode: "callback" | "reset" }) {
  const router = useRouter();
  const started = useRef(false);
  const [status, setStatus] = useState<"loading" | "ready" | "done" | "error">("loading");
  const [message, setMessage] = useState("Đang xác nhận tài khoản...");
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [busy, setBusy] = useState(false);

  useEffect(() => {
    if (started.current) return;
    started.current = true;

    async function completeAuth() {
      const fragment = new URLSearchParams(window.location.hash.replace(/^#/, ""));
      const accessToken = fragment.get("access_token");
      const refreshToken = fragment.get("refresh_token");
      const errorDescription = fragment.get("error_description");
      window.history.replaceState(null, "", window.location.pathname);

      if (!accessToken || !refreshToken) {
        setStatus("error");
        setMessage(errorDescription || "Liên kết không hợp lệ hoặc đã hết hạn. Vui lòng yêu cầu gửi liên kết mới.");
        return;
      }

      try {
        const response = await fetch("/api/auth/callback", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ accessToken, refreshToken }),
        });
        const result = await response.json();
        if (!response.ok) throw new Error(result.error || "Không xác nhận được tài khoản.");

        if (mode === "reset") {
          setStatus("ready");
          setMessage("Xác nhận thành công. Hãy đặt mật khẩu mới cho tài khoản.");
        } else {
          setStatus("done");
          setMessage("Tài khoản đã được xác nhận. Đang chuyển về trang chủ...");
          window.setTimeout(() => router.replace("/"), 1400);
        }
      } catch (error) {
        setStatus("error");
        setMessage(error instanceof Error ? error.message : "Không xác nhận được tài khoản.");
      }
    }

    void completeAuth();
  }, [mode, router]);

  async function handleReset(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    if (password !== confirmPassword) {
      setMessage("Mật khẩu nhập lại chưa khớp.");
      return;
    }
    setBusy(true);
    try {
      const response = await fetch("/api/auth/update-password", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ password }),
      });
      const result = await response.json();
      if (!response.ok) throw new Error(result.error || "Không thể cập nhật mật khẩu.");
      setStatus("done");
      setMessage("Mật khẩu đã được cập nhật. Bạn có thể tiếp tục mua sắm.");
    } catch (error) {
      setStatus("error");
      setMessage(error instanceof Error ? error.message : "Không thể cập nhật mật khẩu.");
    } finally {
      setBusy(false);
    }
  }

  return (
    <main className={styles.page}>
      <section className={styles.card}>
        <Link className={styles.brand} href="/">C <span>CONGEARS</span></Link>
        <h1>{mode === "reset" ? "Đặt lại mật khẩu" : "Xác nhận tài khoản"}</h1>
        <p role={status === "error" ? "alert" : "status"}>{message}</p>
        {mode === "reset" && status === "ready" && (
          <form onSubmit={handleReset}>
            <label>Mật khẩu mới<input type="password" minLength={6} autoComplete="new-password" required value={password} onChange={event => setPassword(event.target.value)} /></label>
            <label>Nhập lại mật khẩu<input type="password" minLength={6} autoComplete="new-password" required value={confirmPassword} onChange={event => setConfirmPassword(event.target.value)} /></label>
            <button disabled={busy}>{busy ? "Đang cập nhật..." : "Cập nhật mật khẩu"}</button>
          </form>
        )}
        {(status === "done" || status === "error") && <Link className={styles.back} href={status === "error" ? "/dang-nhap" : "/"}>{status === "error" ? "Quay lại đăng nhập" : "Về trang chủ"}</Link>}
      </section>
    </main>
  );
}
