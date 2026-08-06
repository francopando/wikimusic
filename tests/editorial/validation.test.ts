import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { createEmptyEditorialDocument } from "../../src/lib/editorial/schema";
import { validateEditorialDocument } from "../../src/lib/editorial/validate";
import { artistBiographyFixture, TARGET_ARTIST_ID } from "../fixtures/editorialDocument";

const OCCURRENCE = "4df29df6-4b57-45a2-8514-b379c45854e4";
const valid = (document: unknown, version: unknown = 1) => validateEditorialDocument(version, document).ok;
const paragraph = (content: unknown[] = []) => ({ type: "doc", content: [{ type: "paragraph", content }] });

describe("editorial document v1 validation", () => {
  it("accepts the canonical empty document, paragraphs, marks, hard breaks, and references", () => {
    assert.deepEqual(createEmptyEditorialDocument(), { type: "doc", content: [{ type: "paragraph" }] });
    assert.equal(valid(createEmptyEditorialDocument()), true);
    assert.equal(valid(paragraph([{ type: "text", text: "Hola" }])), true);
    assert.equal(valid({ type: "doc", content: [{ type: "paragraph" }, { type: "paragraph", content: [] }] }), true);
    assert.equal(valid(paragraph([{ type: "text", text: "x", marks: [{ type: "bold" }, { type: "italic" }] }, { type: "hardBreak" }])), true);
    assert.equal(valid(artistBiographyFixture), true);
  });

  it("allows repeated targets when occurrence IDs differ", () => {
    assert.equal(valid(artistBiographyFixture), true);
  });

  it("accepts curated semantic blocks, nested lists, and safe links", () => {
    assert.equal(valid({ type: "doc", content: [
      { type: "heading", attrs: { level: 2 }, content: [{ type: "text", text: "Origins", marks: [{ type: "link", attrs: { href: "https://example.com/source" } }] }] },
      { type: "blockquote", content: [{ type: "paragraph", content: [{ type: "text", text: "A quotation" }] }] },
      { type: "bulletList", content: [{ type: "listItem", content: [
        { type: "paragraph", content: [{ type: "text", text: "First" }] },
        { type: "orderedList", attrs: { start: 2 }, content: [{ type: "listItem", content: [{ type: "paragraph", content: [{ type: "text", text: "Nested" }] }] }] },
      ] }] },
      { type: "horizontalRule" },
      { type: "heading", attrs: { level: 4 }, content: [{ type: "text", text: "Legacy" }] },
    ] }), true);
  });

  it("rejects H1, malformed list nesting, unsafe links, raw HTML, and styling attributes", () => {
    assert.equal(valid({ type: "doc", content: [{ type: "heading", attrs: { level: 1 }, content: [{ type: "text", text: "No H1" }] }] }), false);
    assert.equal(valid({ type: "doc", content: [{ type: "bulletList", content: [{ type: "paragraph", content: [{ type: "text", text: "Missing list item" }] }] }] }), false);
    assert.equal(valid(paragraph([{ type: "text", text: "x", marks: [{ type: "link", attrs: { href: "javascript:alert(1)" } }] }])), false);
    assert.equal(valid(paragraph([{ type: "text", text: "x", marks: [{ type: "link", attrs: { href: "data:text/html,x" } }] }])), false);
    assert.equal(valid({ type: "doc", content: [{ type: "paragraph", attrs: { style: "color:red" }, content: [{ type: "text", text: "x" }] }] }), false);
  });

  it("rejects duplicate occurrences", () => {
    const reference = { type: "artistReference", attrs: { occurrenceId: OCCURRENCE, artistId: TARGET_ARTIST_ID, displayText: "Artist" } };
    assert.equal(valid(paragraph([reference, reference])), false);
  });

  it("rejects invalid IDs, missing attrs, empty display text, and unexpected attrs", () => {
    assert.equal(valid(paragraph([{ type: "artistReference", attrs: { occurrenceId: "bad", artistId: TARGET_ARTIST_ID, displayText: "Artist" } }])), false);
    assert.equal(valid(paragraph([{ type: "artistReference", attrs: { occurrenceId: OCCURRENCE, artistId: "bad", displayText: "Artist" } }])), false);
    assert.equal(valid(paragraph([{ type: "artistReference", attrs: { occurrenceId: OCCURRENCE, artistId: TARGET_ARTIST_ID, displayText: "  " } }])), false);
    assert.equal(valid(paragraph([{ type: "artistReference" }])), false);
    assert.equal(valid(paragraph([{ type: "artistReference", attrs: { occurrenceId: OCCURRENCE, artistId: TARGET_ARTIST_ID, displayText: "Artist", slug: "artist" } }])), false);
  });

  it("rejects unknown nodes, raw HTML, links, unknown and duplicate marks", () => {
    assert.equal(valid(paragraph([{ type: "heading", content: [] }])), false);
    assert.equal(valid(paragraph([{ type: "html", html: "<b>x</b>" }])), false);
    assert.equal(valid(paragraph([{ type: "text", text: "x", marks: [{ type: "link", attrs: { href: "https://x.test" } }] }])), true);
    assert.equal(valid(paragraph([{ type: "text", text: "x", marks: [{ type: "underline" }] }])), false);
    assert.equal(valid(paragraph([{ type: "text", text: "x", marks: [{ type: "bold" }, { type: "bold" }] }])), false);
  });

  it("rejects invalid roots, malformed content, nesting, text, hard breaks, and schema versions", () => {
    assert.equal(valid({ type: "paragraph", content: [] }), false);
    assert.equal(valid({ type: "doc" }), false);
    assert.equal(valid({ type: "doc", content: [] }), false);
    assert.equal(valid({ type: "doc", content: [{ type: "text", text: "nested wrong" }] }), false);
    assert.equal(valid(paragraph([{ type: "text", text: 7 }])), false);
    assert.equal(valid(paragraph([{ type: "hardBreak", content: [] }])), false);
    assert.equal(valid(paragraph([{ type: "artistReference", attrs: { occurrenceId: OCCURRENCE, artistId: TARGET_ARTIST_ID, displayText: "A" }, marks: [{ type: "bold" }] }])), false);
    assert.equal(valid(createEmptyEditorialDocument(), 2), false);
  });

  it("returns useful issue paths", () => {
    const result = validateEditorialDocument(1, paragraph([{ type: "text", text: 7 }]));
    assert.equal(result.ok, false);
    if (!result.ok) assert.equal(result.issues[0]?.path, "document.content[0].content[0].text");
  });
});
