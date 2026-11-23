"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";

import { getTableConfig, tableHref, type Field } from "@/lib/admin/config";
import {
  clearSessionCookie,
  createAuthClient,
  isAdminAccount,
  requireAdmin,
  writeSessionCookie,
} from "@/lib/admin/auth";
import { getAdminDb } from "@/lib/admin/supabaseAdmin";

export type LoginState = { error?: string };

export async function loginAction(_previous: LoginState, formData: FormData): Promise<LoginState> {
  const email = String(formData.get("email") ?? "").trim();
  const password = String(formData.get("password") ?? "");

  if (!email || !password) {
    return { error: "Vui lòng nhập email và mật khẩu." };
  }

  const supabase = createAuthClient();
  const { data, error } = await supabase.auth.signInWithPassword({ email, password });

  if (error || !data.session || !data.user) {
    return {
      error:
        error?.message === "Invalid login credentials"
          ? "Email hoặc mật khẩu không đúng."
          : error?.message || "Không thể đăng nhập. Vui lòng thử lại.",
    };
  }

  const allowed = await isAdminAccount(
    data.user.id,
    data.user.email || email,
    data.user.app_metadata as Record<string, unknown> | undefined,
  );

  if (!allowed) {
    await supabase.auth.signOut();
    return {
      error:
        "Tài khoản này chưa được cấp quyền quản trị. Thêm email vào ADMIN_EMAILS hoặc đặt profiles.account_type = ADMIN.",
    };
  }

  await writeSessionCookie({
    access_token: data.session.access_token,
    refresh_token: data.session.refresh_token,
    expires_at: data.session.expires_at ?? Math.floor(Date.now() / 1000) + 3600,
    email: data.user.email || email,
  });

  redirect("/admin");
}

export async function logoutAction() {
  await clearSessionCookie();
  redirect("/admin/login");
}

function coerceValue(field: Field, raw: FormDataEntryValue | null): unknown {
  const text = typeof raw === "string" ? raw : "";

  if (field.type === "boolean") {
    return raw === "on" || raw === "true";
  }
  if (field.type === "number") {
    if (text.trim() === "") return null;
    const number = Number(text);
    return Number.isFinite(number) ? number : null;
  }
  if (field.type === "datetime") {
    if (!text) return null;
    const date = new Date(text);
    return Number.isNaN(date.getTime()) ? null : date.toISOString();
  }
  if (field.type === "date") {
    return text || null;
  }
  if (field.type === "relation" || field.type === "select") {
    return text || null;
  }
  const trimmed = text.trim();
  return trimmed === "" ? null : trimmed;
}

function redirectWithError(backHref: string, message: string) {
  redirect(`${backHref}?error=${encodeURIComponent(message)}`);
}

export async function saveRecord(tableKey: string, id: string | null, formData: FormData) {
  await requireAdmin();

  const config = getTableConfig(tableKey);
  if (!config) redirect("/admin");
  if (config.readOnly) redirectWithError(tableHref(config.key), "Bảng này chỉ dùng để theo dõi.");

  if (!id && config.allowCreate === false) {
    redirectWithError(tableHref(config.key), "Bảng này không cho phép tạo mới từ admin.");
  }

  const payload: Record<string, unknown> = {};

  for (const field of config.fields) {
    if (field.hideInForm || field.readOnly) continue;
    if (!formData.has(`f_${field.name}`)) {
      if (field.type === "boolean") payload[field.name] = false;
      continue;
    }
    payload[field.name] = coerceValue(field, formData.get(`f_${field.name}`));
  }

  const now = new Date().toISOString();
  const tablesWithCreatedAt = new Set([
    "brands",
    "product_variants",
    "profiles",
    "notifications",
    "wishlists",
    "wishlist_items",
    "shopping_carts",
    "cart_items",
    "customer_addresses",
    "orders",
    "payments",
    "shipments",
    "shipment_tracking_events",
    "refunds",
    "returns",
    "product_reviews",
    "order_items",
    "order_addresses",
  ]);
  const tablesWithUpdatedAt = new Set(["products", "profiles", "orders", "shopping_carts"]);

  if (!id) {
    if (tablesWithCreatedAt.has(config.table)) payload.created_at = now;
    if (tablesWithUpdatedAt.has(config.table)) payload.updated_at = now;
    if (!(config.primaryKey in payload)) {
      payload[config.primaryKey] = crypto.randomUUID();
    }
  } else if (tablesWithUpdatedAt.has(config.table)) {
    payload.updated_at = now;
  }

  const db = getAdminDb();
  const query = id
    ? db.from(config.table).update(payload).eq(config.primaryKey, id)
    : db.from(config.table).insert(payload);

  const { error } = await query;

  if (error) {
    redirectWithError(
      id ? `${tableHref(config.key)}/${id}` : `${tableHref(config.key)}/new`,
      error.message,
    );
  }

  revalidatePath("/admin", "layout");
  revalidatePath(tableHref(config.key));

  redirect(`${tableHref(config.key)}?ok=${encodeURIComponent(id ? "Đã cập nhật." : "Đã tạo mới.")}`);
}

export async function deleteRecord(tableKey: string, id: string) {
  await requireAdmin();

  const config = getTableConfig(tableKey);
  if (!config) redirect("/admin");
  if (config.readOnly || config.allowDelete === false) {
    redirectWithError(tableHref(config.key), "Bảng này không cho phép xóa.");
  }

  const { error } = await getAdminDb()
    .from(config.table)
    .delete()
    .eq(config.primaryKey, id);

  if (error) {
    redirectWithError(tableHref(config.key), error.message);
  }

  revalidatePath("/admin", "layout");
  revalidatePath(tableHref(config.key));
  redirect(`${tableHref(config.key)}?ok=${encodeURIComponent("Đã xóa.")}`);
}
