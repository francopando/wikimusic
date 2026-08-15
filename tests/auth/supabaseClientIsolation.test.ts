import assert from "node:assert/strict";
import { readFileSync, readdirSync } from "node:fs";
import { fileURLToPath } from "node:url";
import test from "node:test";

function source(path: string) {
  return readFileSync(new URL(path, import.meta.url), "utf8");
}

test("ordinary Supabase client never selects the service-role key", () => {
  const ordinary = source("../../src/lib/supabase.ts");
  const privileged = source("../../src/lib/supabaseService.ts");

  assert.doesNotMatch(ordinary, /SUPABASE_SERVICE_ROLE_KEY/);
  assert.match(privileged, /typeof window !== "undefined"/);
  assert.match(privileged, /SUPABASE_SERVICE_ROLE_KEY/);
  assert.match(privileged, /createServiceRoleClient/);
});

test("client components do not import the privileged client", () => {
  for (const path of [
    "../../src/app/admin/(protected)/awards/page.tsx",
    "../../src/app/admin/(protected)/artists/page.tsx",
    "../../src/app/admin/(protected)/contributors/ContributorsAdminClient.tsx",
  ]) {
    assert.doesNotMatch(source(path), /supabaseService|createServiceRoleClient/);
  }
});

test("Awards mutations cross a guarded API boundary", () => {
  const page = source("../../src/app/admin/(protected)/awards/page.tsx");
  const route = source("../../src/app/api/admin/awards/route.ts");

  assert.doesNotMatch(page, /from\("(?:awards|award_categories|artist_awards)"\)\s*\.(?:insert|update|delete)/);
  assert.match(page, /fetch\("\/api\/admin\/awards"/);
  assert.match(route, /POST[\s\S]*?requireAdminApiRole\("editor"\)[\s\S]*?createServiceRoleClient/);
  assert.match(route, /DELETE[\s\S]*?requireAdminApiRole\("admin"\)[\s\S]*?createServiceRoleClient/);
});

test("every admin API handler has an in-handler authorization boundary", () => {
  const root = fileURLToPath(new URL("../../src/app/api/admin", import.meta.url));
  const routeFiles: string[] = [];
  const visit = (directory: string) => {
    for (const entry of readdirSync(directory, { withFileTypes: true })) {
      const path = `${directory}/${entry.name}`;
      if (entry.isDirectory()) visit(path);
      else if (entry.name === "route.ts") routeFiles.push(path);
    }
  };
  visit(root);

  for (const path of routeFiles) {
    const route = readFileSync(path, "utf8");
    const starts = [...route.matchAll(/export async function (GET|POST|PUT|PATCH|DELETE)\b/g)];
    for (let index = 0; index < starts.length; index += 1) {
      const start = starts[index].index ?? 0;
      const end = starts[index + 1]?.index ?? route.length;
      const handler = route.slice(start, end);
      assert.match(
        handler,
        /requireAdminApiRole|requireAccessManagerApi/,
        `${path} ${starts[index][1]} lacks a handler-level authorization check`,
      );

      const authIndex = handler.search(/requireAdminApiRole|requireAccessManagerApi/);
      const serviceIndex = handler.indexOf("createServiceRoleClient(");
      if (serviceIndex >= 0) {
        assert.ok(authIndex >= 0 && authIndex < serviceIndex, `${path} constructs service client before authorization`);
      }
    }
  }
});

test("proxy preserves 401 for anonymous and 403 for authenticated unauthorized users", () => {
  const proxySource = readFileSync("src/proxy.ts", "utf8");
  assert.match(proxySource, /status: user \? 403 : 401/);
});
