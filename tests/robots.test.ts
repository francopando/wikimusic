import assert from "node:assert/strict";
import test from "node:test";

import { createRobotsPolicy } from "../src/app/robots";

const INTERNAL_PATHS = ["/admin", "/admin/", "/api/", "/auth/", "/debug"];
// Phase 3D also keeps crawlers out of site search, whose result pages are
// user-driven and effectively unbounded.
const CRAWLER_DISALLOWED = [...INTERNAL_PATHS, "/search"];

test("robots remains fail-closed when indexing is disabled", () => {
  assert.deepEqual(createRobotsPolicy(false), {
    rules: {
      userAgent: "*",
      disallow: "/",
    },
  });
});

type RobotsRule = {
  userAgent: string;
  allow?: string;
  disallow?: string | string[];
};

function permittedRules(policy: ReturnType<typeof createRobotsPolicy>) {
  return (policy.rules as RobotsRule[]).filter((rule) => rule.allow === "/");
}

test("robots explicitly permits Meta without widening internal access", () => {
  const policy = createRobotsPolicy(true);

  assert.equal(policy.sitemap, "https://mangulina.do/sitemap.xml");
  assert.equal(policy.host, "https://mangulina.do/");
  assert.ok(Array.isArray(policy.rules));

  const rules = permittedRules(policy);

  assert.deepEqual(
    rules.map((rule) => rule.userAgent),
    ["*", "facebookexternalhit", "Facebot", "meta-externalagent"],
  );

  for (const rule of rules) {
    assert.equal(rule.allow, "/");
    assert.deepEqual(rule.disallow, CRAWLER_DISALLOWED);
  }
});

// Amazonbot walked the catalogue at a 2% cache hit rate, forcing a cold origin
// render on nearly every request. It is denied outright; the block must stay
// scoped to that agent so search crawlers keep their existing access.
test("robots denies Amazonbot the whole site", () => {
  const rules = createRobotsPolicy(true).rules as RobotsRule[];
  const amazonbot = rules.find((rule) => rule.userAgent === "Amazonbot");

  assert.ok(amazonbot, "Amazonbot must have its own group");
  assert.equal(amazonbot.disallow, "/");
  assert.equal(amazonbot.allow, undefined, "a denied agent must not be granted an allow");
});

test("blocking Amazonbot leaves search crawlers on the wildcard rule", () => {
  const rules = createRobotsPolicy(true).rules as RobotsRule[];

  const denied = rules.filter((rule) => rule.disallow === "/");
  assert.deepEqual(
    denied.map((rule) => rule.userAgent),
    ["Amazonbot"],
    "only Amazonbot may be denied outright",
  );

  const wildcard = rules.find((rule) => rule.userAgent === "*");
  assert.equal(wildcard?.allow, "/");
  assert.deepEqual(wildcard?.disallow, CRAWLER_DISALLOWED);
});

test("robots stays fail-closed for Amazonbot when indexing is disabled", () => {
  const policy = createRobotsPolicy(false);
  assert.deepEqual(policy.rules, { userAgent: "*", disallow: "/" });
});
