"use client";

import { useEffect, useState } from "react";
import AuthForm from "./AuthForm";
import { AuthUser, signOut } from "../../lib/auth";
import styles from "./AuthModal.module.css";

export default function AuthModal({
  currentUser,
  onClose,
  onAuthenticated,
  onSignedOut,
}: {
  currentUser: AuthUser | null;
  onClose: () => void;
  onAuthenticated: (user: AuthUser) => void;
  onSignedOut: () => void;
}) {
  const [busy, setBusy] = useState(false);

  useEffect(() => {
    function onKeyDown(event: KeyboardEvent) {
      if (event.key === "Escape") onClose();
    }
    document.addEventListener("keydown", onKeyDown);
    return () => document.removeEventListener("keydown", onKeyDown);
  }, [onClose]);

  async function handleSignOut() {
    setBusy(true);
    try {
      await signOut();
      onSignedOut();
      onClose();
    } finally {
      setBusy(false);
    }
  }

  return (
    <div className={styles.backdrop} onMouseDown={event => event.target === event.currentTarget && onClose()}>
      <section className={styles.dialog} role="dialog" aria-modal="true" aria-label={currentUser ? "Tài khoản ConGears" : "Đăng nhập ConGears"}>
        <button className={styles.close} type="button" onClick={onClose} aria-label="Đóng">×</button>
        {currentUser ? (
          <div className={styles.account}>
            <span className={styles.avatar} aria-hidden="true">{(currentUser.user_metadata.display_name || currentUser.email || "C").slice(0, 1).toUpperCase()}</span>
            <h2>Xin chào{currentUser.user_metadata.display_name ? `, ${currentUser.user_metadata.display_name}` : ""}!</h2>
            <p>{currentUser.email || currentUser.phone}</p>
            <button type="button" onClick={handleSignOut} disabled={busy}>{busy ? "Đang đăng xuất..." : "Đăng xuất"}</button>
          </div>
        ) : (
          <AuthForm initialMode="login" onAuthenticated={onAuthenticated} />
        )}
      </section>
    </div>
  );
}
