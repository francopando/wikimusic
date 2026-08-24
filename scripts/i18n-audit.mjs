#!/usr/bin/env node
/**
 * i18n hardcoded-string audit.
 *
 * Scans the public (localized) component tree for user-facing English that is
 * NOT wired to a translation key. Catches the patterns that slipped through
 * eyeballing:
 *   1. JSX text nodes, including multi-line ones:        >  Some text  <
 *   2. Text adjacent to an interpolation:                {count} views
 *   3. Literal user-facing props:                        heading="Some Text"
 *
 * Exit code 1 when findings exist, so it can gate CI / a pre-commit hook.
 *
 * Usage:
 *   node scripts/i18n-audit.mjs            # interactive tree (default)
 *   node scripts/i18n-audit.mjs --all      # also include static prose pages
 *
 * Suppress a known-safe line with a trailing  // i18n-ignore  comment.
 */
import { readFileSync } from "node:fs";
import { join, relative } from "node:path";
import { glob } from "node:fs/promises";

const ROOT = process.cwd();
const INCLUDE_STATIC = process.argv.includes("--all");

// Directories whose .tsx render localized UI.
const SCAN_GLOBS = ["src/app/**/*.tsx", "src/components/**/*.tsx"];

// Never localized: admin UI, the analytics dashboard, the /debug page, and
// (unless --all) the long-form prose/legal pages that need translated copy.
const STATIC_PAGES = /[\\/](dmca|privacy-policy|terms-of-use|about|contact|contributors|discover)[\\/]/;
const NON_LOCALIZED = /[\\/](admin|debug)[\\/]|[\\/]analytics[\\/]|[\\/]Admin[A-Z]/;
const EXCLUDED = (file) =>
  NON_LOCALIZED.test(file) || (!INCLUDE_STATIC && STATIC_PAGES.test(file));

// Reject captures that are actually TS/JS code the loose `>...<` match swallowed
// (generics, comparisons, expressions), not real JSX text.
const looksLikeCode = (text) =>
  /[;=()[\]`]|=>|\b(const|let|var|return|function|import|export|interface|type|useState|useMemo|useRef|ReturnType|Record|NonNullable|Promise|getSupabaseClient|getGenreDefinition|relatedGenre|setArtists)\b/.test(
    text,
  );

// Brand / proper nouns / acronyms that must stay verbatim.
const ALLOW = new Set([
  "Mangulina", "YouTube", "Facebook", "Instagram", "TikTok",
  "EP", "EPs", "DMCA", "ISRC", "DJs",
]);

const isSuspect = (raw, trusted = false) => {
  const text = raw.trim();
  if (!text || ALLOW.has(text)) return false;
  if (!/[A-Za-z]/.test(text)) return false;          // numbers / symbols only
  // `trusted` = value came from a quoted prop literal, so it is genuine text.
  // The loose `>...<` / `}...<` matchers can swallow code, so guard those.
  if (!trusted) {
    if (text.length > 90) return false;              // long spans => code, not UI
    if (/[{}<>]/.test(text)) return false;            // contains markup/expr
    if (looksLikeCode(text)) return false;           // swallowed TS/JS code
  }
  if (/^[a-z][a-zA-Z]*$/.test(text) && !/ /.test(text)) {
    // a bare camelCase / single lowercase token: only flag known UI words
    return /^(views|songs|tracks|release|releases|artists?|albums?)$/.test(text);
  }
  // natural-language: multiple words, or a capitalized word/phrase
  return / /.test(text) || /^[A-Z][a-z]/.test(text);
};

const DETECTORS = [
  // JSX text between tags (multi-line aware)
  { name: "jsx-text", trusted: false, re: />\s*([A-Za-z][^<>{}]*?[A-Za-z.!?])\s*</gs },
  // text immediately after a } interpolation, e.g. {count} views<
  { name: "after-expr", trusted: false, re: /\}\s+([A-Za-z][A-Za-z ]{1,40}?)\s*</gs },
  // literal user-facing props (quoted => genuine text)
  {
    name: "prop-literal",
    trusted: true,
    re: /(?:heading|intro|title|subtitle|label|roleLabel|placeholder|emptyMessage|aria-label|alt|ctaLabel|mobileTitlePrefix|mobileTitleHighlight)\s*=\s*"([^"{}]+)"/g,
  },
];

const lineOf = (src, index) => src.slice(0, index).split("\n").length;

const findings = [];
for await (const entry of glob(SCAN_GLOBS)) {
  const file = join(ROOT, entry);
  if (EXCLUDED(file)) continue;
  const src = readFileSync(file, "utf8");
  const lines = src.split("\n");
  const seen = new Set();
  for (const { name, re, trusted } of DETECTORS) {
    re.lastIndex = 0;
    let m;
    while ((m = re.exec(src))) {
      const value = m[1];
      if (!isSuspect(value, trusted)) continue;
      const line = lineOf(src, m.index);
      if (lines[line - 1]?.includes("i18n-ignore")) continue;
      const key = `${line}:${value.trim()}`;
      if (seen.has(key)) continue;
      seen.add(key);
      findings.push({ file: relative(ROOT, file), line, value: value.trim(), name });
    }
  }
}

findings.sort((a, b) => a.file.localeCompare(b.file) || a.line - b.line);

// --- Data-content parity: every genre definition must have Spanish copy. ---
// (Genre title/subtitle/description/history come from data, not components, so
// the string scan above can't see them — this enforces translation coverage.)
const dataGaps = [];
try {
  const genresSrc = readFileSync(join(ROOT, "src/lib/genres.ts"), "utf8");
  const esSrc = readFileSync(join(ROOT, "src/lib/genreContent.es.ts"), "utf8");
  const slugs = [...genresSrc.matchAll(/\bslug:\s*"([a-z0-9-]+)"/g)].map((m) => m[1]);
  for (const slug of [...new Set(slugs)]) {
    if (!new RegExp(`\\n\\s*${slug}\\s*:\\s*\\{`).test(esSrc)) {
      dataGaps.push(`genre "${slug}" has no Spanish content in src/lib/genreContent.es.ts`);
    }
  }
} catch {
  dataGaps.push("could not read genre data files for parity check");
}

const ok = findings.length === 0 && dataGaps.length === 0;
if (ok) {
  console.log("✓ i18n audit: no hardcoded strings; genre content fully translated.");
  process.exit(0);
}
if (findings.length) {
  console.error(`✗ i18n audit: ${findings.length} hardcoded string(s) found:\n`);
  for (const f of findings) {
    console.error(`  ${f.file}:${f.line}  [${f.name}]  "${f.value}"`);
  }
  console.error(
    "\nWire each to a translation key, or add a trailing `// i18n-ignore` for intentional literals (brand/data).",
  );
}
if (dataGaps.length) {
  console.error(`\n✗ i18n audit: ${dataGaps.length} data-content gap(s):\n`);
  for (const g of dataGaps) console.error(`  ${g}`);
}
process.exit(1);
process.exit(1);
