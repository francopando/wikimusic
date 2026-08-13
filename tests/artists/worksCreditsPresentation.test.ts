import assert from "node:assert/strict";
import test from "node:test";
import { comparePortfolioPresentation, formatPortfolioDuration, type PortfolioSortFields } from "../../src/lib/artistPortfolioPresentation";

const item = (overrides: Partial<PortfolioSortFields>): PortfolioSortFields => ({ recordingYear: null, disambiguation: null, releaseYear: null, title: "Colegiala", id: "recording", ...overrides });

test("multiple Recording rows remain distinct and sort by documented identity context", () => {
  const rows = [item({ id: "unknown" }), item({ id: "symphonic", recordingYear: 2018, disambiguation: "sinfónico" }), item({ id: "bachata", recordingYear: 1984, disambiguation: "bachata", releaseYear: 1985 })];
  const sorted = [...rows].sort(comparePortfolioPresentation);
  assert.equal(sorted.length, 3);
  assert.deepEqual(sorted.map((row) => row.id), ["bachata", "symphonic", "unknown"]);
});

test("release year never substitutes for an unknown Recording year", () => {
  const documentedRecording = item({ id: "recorded", recordingYear: 1990, releaseYear: null });
  const releaseOnly = item({ id: "release-only", recordingYear: null, releaseYear: 1980 });
  assert.ok(comparePortfolioPresentation(documentedRecording, releaseOnly) < 0);
});

test("duration is supporting context formatted as minutes and seconds", () => {
  assert.equal(formatPortfolioDuration(279), "4:39");
});
