import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { describe, it } from "node:test";
import { getGoogleAnalyticsMeasurementId } from "../src/components/analytics/GoogleAnalytics";

const component = readFileSync("src/components/analytics/GoogleAnalytics.tsx", "utf8");
const documentShell = readFileSync("src/components/layout/DocumentShell.tsx", "utf8");
const environmentTemplate = readFileSync(".env.example", "utf8");

describe("Google Analytics integration", () => {
  it("loads one non-blocking Google tag from the public document root", () => {
    assert.match(component, /googletagmanager\.com\/gtag\/js/);
    assert.match(component, /strategy="afterInteractive"/);
    assert.equal((documentShell.match(/<GoogleAnalytics\s*\/>/g) ?? []).length, 1);
  });

  it("is independently gated to production with a valid public measurement ID", () => {
    assert.match(component, /environment !== "production"/);
    assert.match(component, /process\.env\.NEXT_PUBLIC_GA_MEASUREMENT_ID/);
    assert.match(component, /\^G-/);
    assert.doesNotMatch(component, /NEXT_PUBLIC_ENABLE_ANALYTICS/);
    assert.equal(getGoogleAnalyticsMeasurementId("development", "G-TEST123"), null);
    assert.equal(getGoogleAnalyticsMeasurementId("production", undefined), null);
    assert.equal(getGoogleAnalyticsMeasurementId("production", "invalid"), null);
    assert.equal(getGoogleAnalyticsMeasurementId("production", " G-TEST123 "), "G-TEST123");
  });

  it("configures automatic GA page views without a manual App Router emitter", () => {
    assert.match(component, /gtag\('config'/);
    assert.doesNotMatch(component, /page_view/);
    assert.doesNotMatch(documentShell, /sendGAEvent/);
  });

  it("documents the public Vercel build-time variable without committing a value", () => {
    assert.match(environmentTemplate, /^NEXT_PUBLIC_GA_MEASUREMENT_ID=$/m);
  });
});
