import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { Editor } from "@tiptap/core";
import { editorialTiptapExtensions } from "../../src/lib/editorial/tiptap/extensions.ts";
import { normalizeEditorialLink } from "../../src/lib/editorial/links.ts";
import { validateEditorialDocument } from "../../src/lib/editorial/validate.ts";

describe("curated editorial toolbar behavior", () => {
  it("normalizes HTTP(S) links and rejects dangerous schemes", () => {
    assert.equal(normalizeEditorialLink("example.com/source"), "https://example.com/source");
    assert.equal(normalizeEditorialLink("http://example.com"), "http://example.com/");
    assert.equal(normalizeEditorialLink("javascript:alert(1)"), null);
    assert.equal(normalizeEditorialLink("data:text/html,x"), null);
    assert.equal(normalizeEditorialLink("vbscript:msgbox(1)"), null);
  });

  it("clear formatting preserves text and normalizes headings, quotes, lists, and marks", () => {
    const editor = new Editor({ extensions: editorialTiptapExtensions, content: { type: "doc", content: [
      { type: "heading", attrs: { level: 2 }, content: [{ type: "text", text: "Head", marks: [{ type: "bold" }] }] },
      { type: "blockquote", content: [{ type: "paragraph", content: [{ type: "text", text: "Quote", marks: [{ type: "italic" }] }] }] },
      { type: "bulletList", content: [{ type: "listItem", content: [{ type: "paragraph", content: [{ type: "text", text: "Item", marks: [{ type: "link", attrs: { href: "https://example.com" } }] }] }] }] },
    ] } });
    editor.commands.selectAll();
    assert.equal(editor.chain().unsetAllMarks().clearNodes().run(), true);
    const json = editor.getJSON();
    assert.deepEqual(json, { type: "doc", content: [
      { type: "paragraph", content: [{ type: "text", text: "Head" }] },
      { type: "paragraph", content: [{ type: "text", text: "Quote" }] },
      { type: "paragraph", content: [{ type: "text", text: "Item" }] },
    ] });
    assert.equal(validateEditorialDocument(1, json).ok, true);
    editor.destroy();
  });

  it("supports list nesting through sink and lift commands", () => {
    const editor = new Editor({ extensions: editorialTiptapExtensions, content: { type: "doc", content: [{ type: "bulletList", content: [
      { type: "listItem", content: [{ type: "paragraph", content: [{ type: "text", text: "First" }] }] },
      { type: "listItem", content: [{ type: "paragraph", content: [{ type: "text", text: "Second" }] }] },
    ] }] } });
    editor.commands.setTextSelection(12);
    assert.equal(editor.can().sinkListItem("listItem"), true);
    assert.equal(editor.commands.sinkListItem("listItem"), true);
    assert.equal(editor.isActive("bulletList"), true);
    assert.equal(editor.can().liftListItem("listItem"), true);
    assert.equal(editor.commands.liftListItem("listItem"), true);
    assert.equal(validateEditorialDocument(1, editor.getJSON()).ok, true);
    editor.destroy();
  });
});
