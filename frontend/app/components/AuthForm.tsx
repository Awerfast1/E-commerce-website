"use client";

import { FormEvent, useState } from "react";
import { AuthMode, AuthUser, requestPasswordReset, signIn, signUp, verifyOtp } from "../../lib/auth";
import styles from "./AuthForm.module.css";

export default function AuthForm({
  initialMode = "login",
  onModeChange,
  onAuthenticated,
}: {
  initialMode?: AuthMode;
  onModeChange?: (mode: AuthMode) => void;
  onAuthenticated?: (user: AuthUser) => void;
}) {
  const [mode, setMode] = useState<AuthMode>(initialMode);
  const [displayName, setDisplayName] = useState("");
  const [identifier, setIdentifier] = useState("");
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [verificationCode, setVerificationCode] = useState("");
  const [rememberMe, setRememberMe] = useState(true);
  const [acceptedTerms, setAcceptedTerms] = useState(false);
  const [showPassword, setShowPassword] = useState(false);
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState("");
  const [notice, setNotice] = useState("");

  function switchMode(next: AuthMode) {
    setError("");
    setNotice("");
    setMode(next);
    onModeChange?.(next);
  }

  async function handleSubmit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    setError("");
    setNotice("");

    if (mode === "register" && password !== confirmPassword) {
      setError("Mật khẩu nhập lại chưa khớp.");
      return;
    }
    if (mode === "register" && !acceptedTerms) {
      setError("Vui lòng đồng ý với điều khoản để tiếp tục.");
      return;
    }

    setBusy(true);
    try {
      if (mode === "login") {
        const result = await signIn(identifier, password, rememberMe);
        if (result.user && !result.requiresConfirmation) onAuthenticated?.(result.user);
      } else if (mode === "register") {
        const result = await signUp(displayName, identifier, password);
        if (result.user && !result.requiresConfirmation) onAuthenticated?.(result.user);
        if (result.requiresConfirmation) {
          if (identifier.includes("@")) {
            setNotice("Tài khoản đã được tạo. Hãy mở liên kết xác nhận trong email để tiếp tục.");
          } else {
            setVerificationCode("");
            setNotice("Mã xác nhận đã được gửi qua SMS. Nhập mã để hoàn tất đăng ký.");
            setMode("verify");
            onModeChange?.("verify");
          }
        }
      } else if (mode === "forgot") {
        const result = await requestPasswordReset(identifier);
        setNotice(result.message || "Nếu email đã đăng ký, hướng dẫn đặt lại mật khẩu sẽ được gửi đến hộp thư.");
      } else {
        const result = await verifyOtp(identifier, verificationCode);
        if (result.user) onAuthenticated?.(result.user);
      }
    } catch (submitError) {
      setError(submitError instanceof Error ? submitError.message : "Đã có lỗi xảy ra. Vui lòng thử lại.");
    } finally {
      setBusy(false);
    }
  }

  const isLogin = mode === "login";
  const isRegister = mode === "register";
  const isVerify = mode === "verify";

  return (
    <div className={styles.formWrap}>
      <h1>{isLogin ? "Đăng nhập" : isRegister ? "Đăng ký tài khoản" : isVerify ? "Xác nhận số điện thoại" : "Quên mật khẩu?"}</h1>
      <p className={styles.subtitle}>
        {isLogin
          ? "Đăng nhập để xem đơn hàng, lưu giỏ hàng và nhận ưu đãi thành viên."
          : isRegister
            ? "Tạo tài khoản ConGears để mua sắm nhanh hơn và theo dõi đơn hàng."
            : isVerify
              ? "Nhập mã xác nhận SMS để hoàn tất đăng ký tài khoản."
              : "Nhập email đã đăng ký, chúng tôi sẽ gửi hướng dẫn đặt lại mật khẩu."}
      </p>

      <form className={styles.form} onSubmit={handleSubmit}>
        {isRegister && (
          <label>
            Họ và tên <i>*</i>
            <input
              autoComplete="name"
              required
              maxLength={100}
              value={displayName}
              onChange={event => setDisplayName(event.target.value)}
              placeholder="Ví dụ: Nguyễn Ngọc Vy"
            />
          </label>
        )}

        {!isVerify && <label>
          {isRegister ? "Email hoặc số điện thoại" : mode === "forgot" ? "Email" : "Số điện thoại hoặc Email"} <i>*</i>
          <input
            autoComplete={isLogin ? "username" : "email"}
            required
            type={mode === "forgot" ? "email" : "text"}
            value={identifier}
            onChange={event => setIdentifier(event.target.value)}
            placeholder={mode === "forgot" ? "Nhập email của bạn" : "Ví dụ: ban@email.com hoặc 0901234567"}
          />
        </label>}

        {isVerify && (
          <>
            <p className={styles.verifyDestination}>Mã đã gửi đến <strong>{identifier}</strong></p>
            <label>
              Mã xác nhận <i>*</i>
              <input
                autoComplete="one-time-code"
                required
                inputMode="numeric"
                pattern="[0-9]{6,8}"
                minLength={6}
                maxLength={8}
                value={verificationCode}
                onChange={event => setVerificationCode(event.target.value.replace(/\D/g, ""))}
                placeholder="Nhập mã gồm 6 số"
              />
            </label>
          </>
        )}

        {(isLogin || isRegister) && (
          <label>
            Mật khẩu <i>*</i>
            <span className={styles.passwordField}>
              <input
                autoComplete={isLogin ? "current-password" : "new-password"}
                required
                minLength={6}
                type={showPassword ? "text" : "password"}
                value={password}
                onChange={event => setPassword(event.target.value)}
                placeholder="Nhập mật khẩu"
              />
              <button type="button" onClick={() => setShowPassword(value => !value)} aria-label={showPassword ? "Ẩn mật khẩu" : "Hiện mật khẩu"}>
                {showPassword ? "Ẩn" : "Hiện"}
              </button>
            </span>
          </label>
        )}

        {isRegister && (
          <label>
            Nhập lại mật khẩu <i>*</i>
            <input
              autoComplete="new-password"
              required
              minLength={6}
              type={showPassword ? "text" : "password"}
              value={confirmPassword}
              onChange={event => setConfirmPassword(event.target.value)}
              placeholder="Nhập lại mật khẩu"
            />
          </label>
        )}

        {isLogin && (
          <div className={styles.formOptions}>
            <label className={styles.checkLabel}>
              <input type="checkbox" checked={rememberMe} onChange={event => setRememberMe(event.target.checked)} />
              Ghi nhớ đăng nhập
            </label>
            <button type="button" onClick={() => switchMode("forgot")}>Quên mật khẩu?</button>
          </div>
        )}

        {isRegister && (
          <label className={styles.terms}>
            <input type="checkbox" checked={acceptedTerms} onChange={event => setAcceptedTerms(event.target.checked)} />
            <span>Tôi đồng ý với điều khoản sử dụng và chính sách bảo mật của ConGears.</span>
          </label>
        )}

        {error && <p className={styles.error} role="alert">{error}</p>}
        {notice && <p className={styles.notice} role="status">{notice}</p>}

        <button className={styles.submit} type="submit" disabled={busy}>
          {busy ? "Đang xử lý..." : isLogin ? "Đăng nhập" : isRegister ? "Tạo tài khoản" : "Gửi hướng dẫn"}
        </button>
      </form>

        {isLogin ? (
        <p className={styles.switchText}>Chưa có tài khoản? <button type="button" onClick={() => switchMode("register")}>Đăng ký ngay</button></p>
      ) : isRegister ? (
        <p className={styles.switchText}>Đã có tài khoản? <button type="button" onClick={() => switchMode("login")}>Đăng nhập</button></p>
        ) : isVerify ? (
          <p className={styles.switchText}>Sai số điện thoại? <button type="button" onClick={() => switchMode("register")}>Quay lại đăng ký</button></p>
      ) : (
        <p className={styles.switchText}>Nhớ lại mật khẩu? <button type="button" onClick={() => switchMode("login")}>Quay lại đăng nhập</button></p>
      )}
    </div>
  );
}
