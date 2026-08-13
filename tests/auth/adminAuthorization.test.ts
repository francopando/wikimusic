import assert from "node:assert/strict";
import test from "node:test";

import {
  adminRoleMeetsMinimum,
  getAdminAuthorizationFailureStatus,
  resolveAdminAccessProfile,
  type AdminRole,
} from "../../src/lib/adminAuthorization";

const user = { id: "user-1", email: "Editor@Mangulina.do" };

function member(role: AdminRole, status: "active" | "disabled" = "active") {
  return { user_id: user.id, email: "editor@mangulina.do", role, status };
}

test("bootstrap owner and active membership roles resolve through one authority model", () => {
  assert.deepEqual(resolveAdminAccessProfile(user, null, true), {
    email: "editor@mangulina.do",
    role: "owner",
    source: "bootstrap",
  });

  for (const role of ["owner", "admin", "editor"] as const) {
    assert.equal(resolveAdminAccessProfile(user, member(role), false)?.role, role);
  }
});

test("disabled, mismatched, authenticated non-admin, and anonymous identities are denied", () => {
  assert.equal(resolveAdminAccessProfile(user, member("admin", "disabled"), false), null);
  assert.equal(resolveAdminAccessProfile(user, { ...member("admin"), user_id: "other" }, false), null);
  assert.equal(resolveAdminAccessProfile(user, null, false), null);
  assert.equal(resolveAdminAccessProfile(null, null, false), null);
});

test("editor can edit, while destructive operations require admin or owner", () => {
  assert.equal(adminRoleMeetsMinimum("editor", "editor"), true);
  assert.equal(adminRoleMeetsMinimum("editor", "admin"), false);
  assert.equal(adminRoleMeetsMinimum("admin", "admin"), true);
  assert.equal(adminRoleMeetsMinimum("owner", "admin"), true);
});

test("API authorization distinguishes unauthenticated and forbidden identities", () => {
  assert.equal(getAdminAuthorizationFailureStatus(false, null, "editor"), 401);
  assert.equal(getAdminAuthorizationFailureStatus(true, null, "editor"), 403);
  assert.equal(getAdminAuthorizationFailureStatus(true, "editor", "admin"), 403);
  assert.equal(getAdminAuthorizationFailureStatus(true, "editor", "editor"), null);
  assert.equal(getAdminAuthorizationFailureStatus(true, "admin", "admin"), null);
});
