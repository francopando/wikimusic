import { parseEditorialDocument } from "@/lib/editorial/validate";
import { createEmptyEditorialDocument } from "@/lib/editorial/schema";
import type { EditorialDocumentV1 } from "@/types/editorialDocument";
import { inlineNodesInBlock } from "@/lib/editorial/documentTree";

/** Paragraphs are separated by two LF characters; hard breaks become one LF. */
export function editorialDocumentToPlainText(value: unknown): string {
  const document = parseEditorialDocument(1, value);
  return document.content
    .map((block) =>
      inlineNodesInBlock(block)
        .map((node) => {
          if (node.type === "hardBreak") return "\n";
          if (node.type === "artistReference") return node.attrs.displayText;
          return node.text;
        })
        .join(""),
    )
    .join("\n\n");
}

/** CRLF is normalized to LF. Two-or-more LFs begin a new paragraph; one LF is a hard break. */
export function plainTextToEditorialDocument(text: string): EditorialDocumentV1 {
  if (typeof text !== "string") throw new TypeError("Plain text must be a string.");
  if (text.length === 0) return createEmptyEditorialDocument();
  const normalized = text.replace(/\r\n?/g, "\n");
  return {
    type: "doc",
    content: normalized.split(/\n{2,}/).map((paragraphText) => {
      const lines = paragraphText.split("\n");
      const content = lines.flatMap((line, index) => [
        ...(index > 0 ? [{ type: "hardBreak" as const }] : []),
        ...(line.length > 0 ? [{ type: "text" as const, text: line }] : []),
      ]);
      return content.length > 0 ? { type: "paragraph" as const, content } : { type: "paragraph" as const };
    }),
  };
}
