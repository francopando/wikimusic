import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { describe, it } from "node:test";
import {
  formatGa4Date,
  getGoogleAnalyticsDataConfig,
  toLabeledRows,
} from "../src/lib/googleAnalyticsData";

const route = readFileSync("src/app/api/admin/analytics/google/route.ts", "utf8");
const tab = readFileSync("src/app/admin/(protected)/analytics/GoogleAnalyticsTab.tsx", "utf8");
const lib = readFileSync("src/lib/googleAnalyticsData.ts", "utf8");
const environmentTemplate = readFileSync(".env.example", "utf8");

const VALID_KEY = "-----BEGIN PRIVATE KEY-----\\nabc\\n-----END PRIVATE KEY-----\\n";

describe("Google Analytics Data API integration", () => {
  it("treats missing or malformed configuration as not connected", () => {
    assert.equal(getGoogleAnalyticsDataConfig(undefined, undefined, undefined), null);
    assert.equal(getGoogleAnalyticsDataConfig("", "", ""), null);
    assert.equal(getGoogleAnalyticsDataConfig("not-a-number", "a@b.iam", VALID_KEY), null);
    assert.equal(getGoogleAnalyticsDataConfig("123456789", "no-at-sign", VALID_KEY), null);
    assert.equal(getGoogleAnalyticsDataConfig("123456789", "a@b.iam", "not-a-key"), null);
  });

  it("normalizes valid configuration, including escaped newlines in the key", () => {
    const config = getGoogleAnalyticsDataConfig(" 123456789 ", " a@b.iam ", VALID_KEY);
    assert.ok(config);
    assert.equal(config.propertyId, "123456789");
    assert.equal(config.clientEmail, "a@b.iam");
    assert.match(config.privateKey, /^-----BEGIN PRIVATE KEY-----\nabc\n/);
    assert.doesNotMatch(config.privateKey, /\\n/);
  });

  it("formats GA4 date dimension values as ISO dates", () => {
    assert.equal(formatGa4Date("20260819"), "2026-08-19");
    assert.equal(formatGa4Date("(other)"), "(other)");
  });

  it("flattens report rows defensively", () => {
    assert.deepEqual(toLabeledRows({}), []);
    assert.deepEqual(
      toLabeledRows({
        rows: [
          { dimensionValues: [{ value: "Direct" }], metricValues: [{ value: "42" }] },
          { dimensionValues: [{ value: "" }], metricValues: [{ value: "3" }] },
          { metricValues: [{ value: "oops" }] },
        ],
      }),
      [
        { label: "Direct", value: 42 },
        { label: "(not set)", value: 3 },
        { label: "(not set)", value: 0 },
      ],
    );
  });

  it("gates the admin route behind editor role and keeps credentials server-side", () => {
    assert.match(route, /requireAdminApiRole\("editor"\)/);
    assert.doesNotMatch(lib, /process\.env\.NEXT_PUBLIC_/);
    assert.match(lib, /analytics\.readonly/);
  });

  it("keeps the admin tab wired to the admin API endpoint", () => {
    assert.match(tab, /\/api\/admin\/analytics\/google/);
    // The client component may only import types from the server-side lib.
    assert.match(tab, /import type \{[^}]*\} from "@\/lib\/googleAnalyticsData"/);
  });

  it("documents the service-account variables without committing values", () => {
    assert.match(environmentTemplate, /^GA4_PROPERTY_ID=/m);
    assert.match(environmentTemplate, /^GA4_SERVICE_ACCOUNT_EMAIL=/m);
    assert.match(environmentTemplate, /^GA4_SERVICE_ACCOUNT_PRIVATE_KEY=/m);
  });
});
