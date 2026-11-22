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

  const secretKey = process.env.SUPABASE_SECRET_KEY || process.env.SUPABASE_SERVICE_ROLE_KEY;
  if (!secretKey) {
    throw new Error("Missing SUPABASE_SECRET_KEY or SUPABASE_SERVICE_ROLE_KEY. Configure a server-only Supabase secret for admin features.");
  }

  cached = createClient(
    required("NEXT_PUBLIC_SUPABASE_URL"),
    secretKey,
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
