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

test("robots explicitly permits Meta without widening internal access", () => {
  const policy = createRobotsPolicy(true);

  assert.equal(policy.sitemap, "https://mangulina.do/sitemap.xml");
  assert.equal(policy.host, "https://mangulina.do/");
  assert.ok(Array.isArray(policy.rules));

  const rules = policy.rules as Array<{
    userAgent: string;
    allow?: string;
    disallow?: string[];
  }>;

  assert.deepEqual(
    rules.map((rule) => rule.userAgent),
    ["*", "facebookexternalhit", "Facebot", "meta-externalagent"],
  );

  for (const rule of rules) {
    assert.equal(rule.allow, "/");
    assert.deepEqual(rule.disallow, CRAWLER_DISALLOWED);
  }
});
