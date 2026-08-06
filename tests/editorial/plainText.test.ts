import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { editorialDocumentToPlainText, plainTextToEditorialDocument } from "../../src/lib/editorial/plainText";
import { artistBiographyFixture } from "../fixtures/editorialDocument";

describe("editorial plain-text conversion", () => {
  it("renders the canonical empty document as an empty string", () =>
    assert.equal(editorialDocumentToPlainText({ type: "doc", content: [{ type: "paragraph" }] }), ""));
  it("converts empty plain text to the canonical empty document", () =>
    assert.deepEqual(plainTextToEditorialDocument(""), { type: "doc", content: [{ type: "paragraph" }] }));
  it("rejects the legacy zero-block representation", () =>
    assert.throws(() => editorialDocumentToPlainText({ type: "doc", content: [] }), /at least one block/));
  it("uses two LFs between paragraphs and one LF for hard breaks", () => {
    const document = { type: "doc", content: [
      { type: "paragraph", content: [{ type: "text", text: "one" }, { type: "hardBreak" }, { type: "text", text: "two" }] },
      { type: "paragraph", content: [{ type: "text", text: "three" }] },
    ] };
    assert.equal(editorialDocumentToPlainText(document), "one\ntwo\n\nthree");
  });
  it("renders formatting as text and references as display text without UUIDs", () => {
    const text = editorialDocumentToPlainText(artistBiographyFixture);
    assert.equal(text, "Una colaboración con Fernando Villalona marcó esta etapa.\n\nDespués volvió a trabajar con Villalona.");
    assert.equal(text.includes("13d63640"), false);
  });
  it("preserves Spanish accents and punctuation", () => {
    const text = "Ángel tocó güira; ¡qué emoción!";
    assert.equal(editorialDocumentToPlainText(plainTextToEditorialDocument(text)), text);
  });
  it("normalizes CRLF and has a stable documented round trip", () => {
    const input = "uno\r\ndos\r\n\r\ntres\n\n\ncuatro";
    const normalized = "uno\ndos\n\ntres\n\ncuatro";
    const once = plainTextToEditorialDocument(input);
    assert.equal(editorialDocumentToPlainText(once), normalized);
    assert.deepEqual(plainTextToEditorialDocument(editorialDocumentToPlainText(once)), once);
  });
  it("preserves blank lines predictably by collapsing paragraph separators", () => {
    assert.equal(editorialDocumentToPlainText(plainTextToEditorialDocument("a\n\n\n\nb")), "a\n\nb");
  });
});
