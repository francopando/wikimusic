import assert from "node:assert/strict";
import test from "node:test";
import { readFileSync } from "node:fs";
import { formatDurationMilliseconds, groupPortfolioRecordings, type GroupablePortfolioRecording } from "../../src/lib/artistPortfolioPresentation";

const recording = (overrides: Partial<GroupablePortfolioRecording>): GroupablePortfolioRecording => ({ id: "recording-a", workId: "work-a", workTitle: "Colegiala", title: "Colegiala", roles: ["arranger"], recordingYear: null, identityLabel: null, releaseYear: null, ...overrides });

test("one Work with one Recording displays as one Work", () => {
  const result = groupPortfolioRecordings([recording({})]);
  assert.equal(result.length, 1); assert.equal(result[0].recordings.length, 1);
});

test("one governed Work groups multiple distinct Recordings as children", () => {
  const result = groupPortfolioRecordings([recording({ id: "bachata", identityLabel: "Bachata" }), recording({ id: "merengue", identityLabel: "Merengue" })]);
  assert.equal(result.length, 1); assert.deepEqual(result[0].recordings.map((item) => item.id), ["bachata", "merengue"]);
});

test("different Work UUIDs remain separate even when titles match", () => {
  const result = groupPortfolioRecordings([recording({ id: "a", workId: "work-a" }), recording({ id: "b", workId: "work-b" })]);
  assert.equal(result.length, 2);
});

test("unlinked Recordings are never grouped by normalized title", () => {
  const result = groupPortfolioRecordings([recording({ id: "a", workId: null }), recording({ id: "b", workId: null })]);
  assert.equal(result.length, 2);
});

test("duration formatter handles catalog milliseconds consistently", () => {
  assert.equal(formatDurationMilliseconds(null), null);
  assert.equal(formatDurationMilliseconds(45_000), "0:45");
  assert.equal(formatDurationMilliseconds(260_360), "4:20");
  assert.equal(formatDurationMilliseconds(305_847), "5:06");
  assert.equal(formatDurationMilliseconds(3_735_000), "1:02:15");
});

test("public portfolio uses neutral recording language and a compact hierarchy", () => {
  const component = readFileSync("src/components/organisms/ArtistWorksPortfolio.tsx", "utf8");
  assert.match(component, /t\("recording"\)/);
  assert.match(component, /t\("otherRecordingCredits"\)/);
  assert.doesNotMatch(component, /unlinkedRecordingCreditsDescription/);
  assert.doesNotMatch(component, /sm:grid-cols-2/);
  assert.doesNotMatch(component, /return recording\.releaseTitle/);
});
