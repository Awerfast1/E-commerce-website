import "server-only";

import { createClient, type SupabaseClient } from "@supabase/supabase-js";

let cached: SupabaseClient | null = null;

function required(name: string) {
  const value = process.env[name];
  if (!value) {
    throw new Error(`Missing ${name}. Add it to frontend/.env.local`);
  }
  return value;
}

/**
 * Service-role client used by server components and server actions only.
 * It bypasses RLS, therefore it must never be imported from a Client Component.
 */
export function getAdminDb(): SupabaseClient {
  if (cached) return cached;

  cached = createClient(
    required("NEXT_PUBLIC_SUPABASE_URL"),
    required("SUPABASE_SECRET_KEY"),
    {
      auth: {
        persistSession: false,
        autoRefreshToken: false,
        detectSessionInUrl: false,
      },
    },
  );

  return cached;
}
