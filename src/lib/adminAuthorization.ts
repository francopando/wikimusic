import type { User } from "@supabase/supabase-js";

export type AdminRole = "owner" | "admin" | "editor";

export type AdminAccessProfile = {
  email: string;
  role: AdminRole;
  source: "bootstrap" | "member";
};

type MemberAuthorizationRecord = {
  user_id: string | null;
  email: string;
  role: AdminRole;
  status: "active" | "disabled";
};

export function resolveAdminAccessProfile(
  user: Pick<User, "id" | "email"> | null,
  member: MemberAuthorizationRecord | null,
  bootstrap: boolean,
): AdminAccessProfile | null {
  if (!user?.email) return null;
  const email = user.email.trim().toLowerCase();

  if (bootstrap) return { email, role: "owner", source: "bootstrap" };
  if (!member || member.user_id !== user.id || member.status !== "active") return null;

  return { email: member.email, role: member.role, source: "member" };
}

export function adminRoleMeetsMinimum(role: AdminRole, minimumRole: AdminRole) {
  const rank: Record<AdminRole, number> = { editor: 1, admin: 2, owner: 3 };
  return rank[role] >= rank[minimumRole];
}

export function getAdminAuthorizationFailureStatus(
  hasAuthenticatedUser: boolean,
  role: AdminRole | null,
  minimumRole: AdminRole,
): 401 | 403 | null {
  if (!hasAuthenticatedUser) return 401;
  if (!role || !adminRoleMeetsMinimum(role, minimumRole)) return 403;
  return null;
}
