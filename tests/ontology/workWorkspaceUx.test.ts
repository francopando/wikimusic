import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";

const ui = readFileSync("src/app/admin/authoritative-works/page.tsx", "utf8");
const api = readFileSync("src/app/api/admin/editorial-workflows/route.ts", "utf8");
const portal = readFileSync("src/app/admin/page.tsx", "utf8");
const portalContent = readFileSync("src/app/admin/AdminPortalContent.tsx", "utf8");
const en = JSON.parse(readFileSync("messages/en.json", "utf8"));
const es = JSON.parse(readFileSync("messages/es.json", "utf8"));

test("Works is a permanent translated Admin Portal destination", () => {
  assert.match(portal, /href: "\/admin\/authoritative-works"/);
  assert.match(portalContent, /"authoritative-works": "works"/);
  assert.equal(en.admin.tools.works.title, "Works");
  assert.equal(es.admin.tools.works.title, "Obras");
});

test("Work Workspace uses the standard translated admin hero and return navigation", () => {
  assert.match(ui, /useTranslations\("admin\.workWorkspace"\)/);
  assert.match(ui, /href="\/admin"/);
  assert.match(ui, /<ArrowLeft/);
  assert.equal(en.admin.workWorkspace.backToPortal, "Back to Admin Portal");
  assert.equal(es.admin.workWorkspace.backToPortal, "Volver al Portal Administrativo");
});

test("empty state exposes only Work discovery and creation", () => {
  assert.match(ui, /No Work selected/);
  assert.match(ui, /Search before creating a new Work/);
  assert.match(ui, /Create Work/);
  assert.match(ui, /\{work && <>/);
});

test("selected Work follows the natural editorial sequence", () => {
  const labels = [">Song identity<", ">Composition credits<", ">Evidence<", ">Recorded versions<", ">Advanced editorial tools<"];
  let last = -1;
  for (const label of labels) { const index = ui.indexOf(label); assert.ok(index > last, `${label} should follow the prior stage`); last = index; }
});

test("database terminology is hidden from ordinary action labels", () => {
  assert.doesNotMatch(ui, />Create assertion</);
  assert.doesNotMatch(ui, />Select canonical link</);
  assert.doesNotMatch(ui, />Request governed unlink</);
  assert.match(ui, />Link Recording</);
  assert.match(ui, />Request unlink</);
});

test("existing governance operations remain wired internally", () => {
  for (const action of ["work.create", "credit.create", "credit.create.external", "credit.verify", "work.assert", "work.select", "work.unlink", "decision.resolve"]) assert.match(ui, new RegExp(action.replace(".", "\\.")));
  assert.match(api, /create_recording_work_assertion/);
  assert.match(api, /select_recording_work_assertion/);
  assert.match(api, /resolve_recording_work_decision/);
});

test("source creation relies on the authoritative workflow reload without duplicating local state", () => {
  assert.match(ui, /const result = await act\("source\.create"/);
  assert.match(ui, /if \(result\?\.source_id\) setSourceTitle\(""\)/);
  assert.doesNotMatch(ui, /setSources\(\(items\) => \[\{ id: result\.source_id/);
});
