export interface AuthUser {
  id: string;
  email: string | null;
  phone: string | null;
  user_metadata: { display_name: string };
}

export type AuthMode = "login" | "register" | "forgot" | "verify";

interface AuthResult {
  user?: AuthUser | null;
  requiresConfirmation?: boolean;
  message?: string;
  error?: string;
}

async function postAuth(action: string, payload: Record<string, string | boolean>): Promise<AuthResult> {
  const response = await fetch(`/api/auth/${action}`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(payload),
  });
  const result = await response.json().catch(() => ({}));
  if (!response.ok) throw new Error(result.error || "Không thể xử lý yêu cầu.");
  return result as AuthResult;
}

export function signIn(identifier: string, password: string, rememberMe: boolean) {
  return postAuth("login", { identifier, password, rememberMe });
}

export function signUp(displayName: string, identifier: string, password: string) {
  return postAuth("register", { displayName, identifier, password });
}

export function verifyOtp(identifier: string, token: string) {
  return postAuth("verify-otp", { identifier, token });
}

export function requestPasswordReset(identifier: string) {
  return postAuth("forgot-password", { identifier });
}

export async function getCurrentUser(): Promise<AuthUser | null> {
  const response = await fetch("/api/auth/session", { cache: "no-store" });
  if (!response.ok) return null;
  const result = await response.json();
  return (result.user as AuthUser | null) || null;
}

export async function signOut() {
  await fetch("/api/auth/logout", { method: "POST" });
}
