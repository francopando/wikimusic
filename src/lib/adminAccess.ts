import { createHash, randomBytes } from "crypto";
import type { User } from "@supabase/supabase-js";
import { createServiceRoleClient } from "@/lib/supabaseService";
import {
  resolveAdminAccessProfile,
  type AdminAccessProfile,
  type AdminRole,
} from "@/lib/adminAuthorization";

export { resolveAdminAccessProfile } from "@/lib/adminAuthorization";
export type { AdminAccessProfile, AdminRole } from "@/lib/adminAuthorization";

export type AdminMember = {
  id: string;
  user_id: string | null;
  email: string;
  role: AdminRole;
  status: "active" | "disabled";
  created_at: string;
};

export type AdminInvite = {
  id: string;
  email: string;
  role: AdminRole;
  expires_at: string;
  accepted_at: string | null;
  created_at: string;
};

export function getAdminEmailAllowlist() {
  return (
    process.env.MANGULINA_ADMIN_EMAILS ||
    process.env.ADMIN_EMAILS ||
    process.env.NEXT_PUBLIC_ADMIN_EMAILS ||
    ""
  )
    .split(",")
    .map((item) => item.trim().toLowerCase())
    .filter(Boolean);
}

export function normalizeAdminEmail(email: unknown) {
  return typeof email === "string" ? email.trim().toLowerCase() : "";
}

export function normalizeAdminRole(role: unknown): AdminRole {
  return role === "owner" || role === "admin" || role === "editor"
    ? role
    : "editor";
}

export function createInviteToken() {
  return randomBytes(32).toString("base64url");
}

export function hashInviteToken(token: string) {
  return createHash("sha256").update(token).digest("hex");
}

export function isBootstrapAdminEmail(email: string | undefined) {
  const normalizedEmail = normalizeAdminEmail(email);
  const allowlist = getAdminEmailAllowlist();

  return Boolean(
    normalizedEmail &&
      allowlist.length > 0 &&
      allowlist.includes(normalizedEmail),
  );
}

export async function getAdminMemberByUserId(userId: string) {
  if (!userId) return null;

  const supabase = createServiceRoleClient();
  const { data, error } = await supabase
    .from("admin_members")
    .select("id,user_id,email,role,status,created_at")
    .eq("user_id", userId)
    .eq("status", "active")
    .maybeSingle();

  if (error) return null;
  return data as AdminMember | null;
}

export async function hasAdminAccess(user: User | null) {
  return Boolean(await getAdminAccessProfile(user));
}

export async function canManageAdminAccess(user: User | null) {
  const profile = await getAdminAccessProfile(user);
  return profile?.role === "owner" || profile?.role === "admin";
}

export async function getAdminAccessProfile(
  user: User | null,
): Promise<AdminAccessProfile | null> {
  if (!user?.email) return null;

  const email = normalizeAdminEmail(user.email);
  const bootstrap = isBootstrapAdminEmail(email);

  if (bootstrap) return resolveAdminAccessProfile(user, null, true);

  const member = await getAdminMemberByUserId(user.id);
  return resolveAdminAccessProfile(user, member, false);
}


export async function ensureAdminMemberForBootstrapUser(user: User) {
  if (!isBootstrapAdminEmail(user.email)) return null;

  const email = normalizeAdminEmail(user.email);
  const supabase = createServiceRoleClient();
  const { data, error } = await supabase
    .from("admin_members")
    .upsert(
      {
        user_id: user.id,
        email,
        role: "owner",
        status: "active",
        updated_at: new Date().toISOString(),
      },
      { onConflict: "user_id" },
    )
    .select("id,user_id,email,role,status,created_at")
    .maybeSingle();

  if (error) return null;
  return data as AdminMember | null;
}
