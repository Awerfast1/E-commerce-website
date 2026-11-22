const { createClient } = require("@supabase/supabase-js");
require("dotenv").config();

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseAnonKey = process.env.SUPABASE_ANON_KEY;

const hasSupabaseConfig = Boolean(supabaseUrl && supabaseAnonKey);

if (!hasSupabaseConfig) {
  console.warn("WARNING: SUPABASE_URL or SUPABASE_ANON_KEY is missing; database access is disabled.");
}

// Avoid constructing a client with empty credentials: createClient can throw
// during module loading when required environment values are absent.
const supabase = hasSupabaseConfig ? createClient(supabaseUrl, supabaseAnonKey) : null;

module.exports = { supabase };
