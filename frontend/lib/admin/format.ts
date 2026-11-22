export function formatCurrency(value: unknown) {
  const number = Number(value);
  if (!Number.isFinite(number)) return "—";
  return new Intl.NumberFormat("vi-VN", {
    style: "currency",
    currency: "VND",
    maximumFractionDigits: 0,
  }).format(number);
}

export function formatNumber(value: unknown) {
  const number = Number(value);
  if (!Number.isFinite(number)) return "—";
  return new Intl.NumberFormat("vi-VN").format(number);
}

export function formatDate(value: unknown, withTime = false) {
  if (!value) return "—";
  const date = new Date(String(value));
  if (Number.isNaN(date.getTime())) return String(value);
  return new Intl.DateTimeFormat("vi-VN", {
    day: "2-digit",
    month: "2-digit",
    year: "numeric",
    ...(withTime ? { hour: "2-digit", minute: "2-digit" } : {}),
  }).format(date);
}

export function formatDateTimeInput(value: unknown) {
  if (!value) return "";
  const date = new Date(String(value));
  if (Number.isNaN(date.getTime())) return "";
  const pad = (n: number) => String(n).padStart(2, "0");
  return `${date.getFullYear()}-${pad(date.getMonth() + 1)}-${pad(date.getDate())}T${pad(date.getHours())}:${pad(date.getMinutes())}`;
}

export function formatDateInput(value: unknown) {
  if (!value) return "";
  const date = new Date(String(value));
  if (Number.isNaN(date.getTime())) return "";
  const pad = (n: number) => String(n).padStart(2, "0");
  return `${date.getFullYear()}-${pad(date.getMonth() + 1)}-${pad(date.getDate())}`;
}

export function formatBoolean(value: unknown) {
  return value ? "Có" : "Không";
}

export function truncate(value: unknown, max = 60) {
  const text = value == null ? "" : String(value);
  return text.length > max ? `${text.slice(0, max)}…` : text;
}

export function statusTone(value: unknown) {
  const status = String(value ?? "").toUpperCase();
  if (["ACTIVE", "PAID", "DELIVERED", "COMPLETED", "APPROVED", "CONFIRMED"].includes(status)) {
    return "bg-emerald-50 text-emerald-700 ring-emerald-200";
  }
  if (["PENDING", "PROCESSING", "PREPARING", "IN_TRANSIT", "REQUESTED", "SHIPPED"].includes(status)) {
    return "bg-amber-50 text-amber-700 ring-amber-200";
  }
  if (["CANCELLED", "FAILED", "REJECTED", "REFUNDED", "RETURNED", "LOCKED", "DISABLED"].includes(status)) {
    return "bg-rose-50 text-rose-700 ring-rose-200";
  }
  return "bg-slate-100 text-slate-600 ring-slate-200";
}
