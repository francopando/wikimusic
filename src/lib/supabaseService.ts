import { createClient } from "@supabase/supabase-js";
import { getSupabasePublicConfig } from "@/lib/supabaseConfig";

/**
 * Creates a server-only Supabase client that bypasses RLS.
 * Callers must authenticate and authorize the request before constructing it.
 */
export function createServiceRoleClient() {
  if (typeof window !== "undefined") {
    throw new Error("Service-role Supabase clients are server-only.");
  }

  const { supabaseUrl } = getSupabasePublicConfig();
  const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

  if (!serviceRoleKey) {
    throw new Error("Missing SUPABASE_SERVICE_ROLE_KEY for privileged server operations.");
  }

  return createClient(supabaseUrl, serviceRoleKey, {
    auth: {
      autoRefreshToken: false,
      persistSession: false,
    },
  });
}
