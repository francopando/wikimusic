import { NextResponse } from "next/server";
import { getCurrentUser } from "@/lib/auth";
import {
  canManageAdminAccess,
  getAdminAccessProfile,
  type AdminRole,
} from "@/lib/adminAccess";
import { getAdminAuthorizationFailureStatus } from "@/lib/adminAuthorization";

export async function requireAdminApiRole(minimumRole: AdminRole = "editor") {
  const user = await getCurrentUser();
  const profile = await getAdminAccessProfile(user);

  const failureStatus = getAdminAuthorizationFailureStatus(
    Boolean(user),
    profile?.role ?? null,
    minimumRole,
  );

  if (failureStatus) {
    return {
      user,
      profile,
      response: NextResponse.json(
        { ok: false, error: "Insufficient admin permissions." },
        { status: failureStatus },
      ),
    };
  }

  return { user, profile, response: null };
}

export async function requireAccessManagerApi() {
  const user = await getCurrentUser();

  if (!(await canManageAdminAccess(user))) {
    return {
      user,
      response: NextResponse.json(
        { ok: false, error: "Access management permission required." },
        { status: user ? 403 : 401 },
      ),
    };
  }

  return { user, response: null };
}
