import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";

const shell = readFileSync("src/components/layout/DocumentShell.tsx", "utf8");
const globals = readFileSync("src/app/globals.css", "utf8");
const applicationSource = `${shell}\n${globals}`;

test("the document loads the original Finlandica family once at the root", () => {
  for (const weight of [400, 500, 600, 700]) {
    assert.match(globals, new RegExp(`@fontsource/finlandica/${weight}\\.css`));
  }
  assert.match(shell, /<body className="min-h-screen font-sans antialiased">/);
  assert.doesNotMatch(shell, /next\/font/);
  assert.doesNotMatch(shell, /fonts\.googleapis|fonts\.gstatic/);
  assert.doesNotMatch(shell, /Finlandica_Text|Instrument_Serif|\bInter\b/);
});

test("normal application typography resolves only to Finlandica", () => {
  assert.match(globals, /--font-sans: 'Finlandica', system-ui, sans-serif;/);
  assert.doesNotMatch(applicationSource, /Instrument Serif|--font-inter|--font-serif|--font-outfit/);
  assert.doesNotMatch(globals, /font-family:\s*(?:-apple-system|Arial|Georgia|Times)/);
});

test("technical monospace remains a generic technical stack", () => {
  assert.match(globals, /--font-mono: ui-monospace,[^;]+monospace;/);
});
