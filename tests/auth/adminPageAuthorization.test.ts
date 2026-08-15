import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";

function source(path: string) {
  return readFileSync(path, "utf8");
}

test("the protected admin route group authorizes through the shared server helper", () => {
  const layout = source("src/app/admin/(protected)/layout.tsx");

  assert.match(layout, /import \{ requireAdminUser \} from "@\/lib\/auth"/);
  assert.match(layout, /await requireAdminUser\(\)/);
});

test("public admin authentication routes remain outside the protected group", () => {
  assert.doesNotThrow(() => source("src/app/admin/login/page.tsx"));
  assert.doesNotThrow(() => source("src/app/admin/sign-up/page.tsx"));
});

test("analytics authorizes before rendering its service-role-backed health section", () => {
  const page = source("src/app/admin/(protected)/analytics/page.tsx");
  const guardIndex = page.indexOf("await requireAdminUser()");
  const healthIndex = page.indexOf("<AnalyticsHealthSection />");

  assert.ok(guardIndex >= 0);
  assert.ok(healthIndex > guardIndex);
});
