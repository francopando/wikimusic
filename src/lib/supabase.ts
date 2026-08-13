// src/lib/supabase.ts
import { createBrowserClient } from "@supabase/auth-helpers-nextjs";
import { createClient, type SupabaseClient } from "@supabase/supabase-js";
import { getSupabasePublicConfig } from "@/lib/supabaseConfig";

let cachedClient: SupabaseClient | null = null;

function resolveSupabaseConfig() {
  const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
  const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || process.env.SUPABASE_ANON_KEY;

  return { supabaseUrl, supabaseAnonKey };
}

function createSupabaseClient() {
  if (cachedClient) return cachedClient;

  if (typeof window !== "undefined") {
    const { supabaseUrl, supabaseAnonKey } = getSupabasePublicConfig();
    cachedClient = createBrowserClient(supabaseUrl, supabaseAnonKey);
    return cachedClient;
  }

  const { supabaseUrl, supabaseAnonKey } = resolveSupabaseConfig();

  if (!supabaseUrl || !supabaseAnonKey) {
    throw new Error(
      "Missing Supabase configuration. Set NEXT_PUBLIC_SUPABASE_URL and NEXT_PUBLIC_SUPABASE_ANON_KEY in the deployment environment.",
    );
  }

  cachedClient = createClient(supabaseUrl, supabaseAnonKey);
  return cachedClient;
}

export const supabase = new Proxy({} as SupabaseClient, {
  get(_target, property, receiver) {
    return Reflect.get(createSupabaseClient(), property, receiver);
  },
});

export function getSupabaseClient() {
  return supabase;
}
