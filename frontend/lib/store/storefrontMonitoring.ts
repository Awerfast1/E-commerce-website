import "server-only";

import { createClient } from "@supabase/supabase-js";
import { createAuthClient } from "@/lib/admin/auth";
import { getAdminDb } from "@/lib/admin/supabaseAdmin";

export function getAuthenticatedStoreDb(accessToken: string) {
  const url = (process.env.NEXT_PUBLIC_SUPABASE_URL || "").trim();
  const key = (process.env.NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || "").trim();
  if (!url || !key) throw new Error("Thiếu cấu hình public Supabase cho storefront.");

  return createClient(url, key, {
    auth: { persistSession: false, autoRefreshToken: false, detectSessionInUrl: false },
    global: { headers: { Authorization: `Bearer ${accessToken}` } },
  });
}

export async function authenticateStoreUser(accessToken: string) {
  const { data, error } = await createAuthClient().auth.getUser(accessToken);
  if (error || !data.user) return null;
  return data.user;
}

export async function recordUserActivity(
  userId: string,
  eventType: string,
  description: string,
  metadata: Record<string, string | number | boolean | null> = {},
) {
  const { error } = await getAdminDb().from("user_activity_logs").insert({
    user_id: userId,
    event_type: eventType,
    description,
    metadata,
  });
  if (error) throw new Error(error.message);
}
