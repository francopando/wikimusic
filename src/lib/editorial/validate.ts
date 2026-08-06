import { normalizeEditorialLink } from "@/lib/editorial/links";
import { assertSupportedEditorialSchemaVersion } from "@/lib/editorial/schema";
import type {
  ArtistReferenceNode,
  EditorialBlockNode,
  EditorialDocumentV1,
  EditorialInlineNode,
  EditorialListItemNode,
  EditorialTextMark,
  SupportedEditorialSchemaVersion,
} from "@/types/editorialDocument";

export type EditorialValidationIssue = { path: string; message: string };
export type EditorialValidationResult =
  | { ok: true; document: EditorialDocumentV1 }
  | { ok: false; issues: EditorialValidationIssue[] };

const UUID_PATTERN = /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i;
const MAX_NESTING_DEPTH = 12;

function isRecord(value: unknown): value is Record<string, unknown> {
  return typeof value === "object" && value !== null && !Array.isArray(value);
}

function exactKeys(value: Record<string, unknown>, allowed: readonly string[], path: string, issues: EditorialValidationIssue[]) {
  for (const key of Object.keys(value)) if (!allowed.includes(key)) issues.push({ path: `${path}.${key}`, message: "Unexpected attribute." });
}

function parseMarks(value: unknown, path: string, issues: EditorialValidationIssue[]): EditorialTextMark[] | undefined {
  if (value === undefined) return undefined;
  if (!Array.isArray(value)) { issues.push({ path, message: "Marks must be an array." }); return undefined; }
  const marks: EditorialTextMark[] = [];
  const seen = new Set<string>();
  value.forEach((mark, index) => {
    const markPath = `${path}[${index}]`;
    if (!isRecord(mark)) { issues.push({ path: markPath, message: "Mark must be an object." }); return; }
    if (mark.type !== "bold" && mark.type !== "italic" && mark.type !== "link") {
      issues.push({ path: `${markPath}.type`, message: "Unsupported mark type." }); return;
    }
    if (seen.has(mark.type)) { issues.push({ path: markPath, message: "Duplicate mark." }); return; }
    seen.add(mark.type);
    if (mark.type === "link") {
      exactKeys(mark, ["type", "attrs"], markPath, issues);
      if (!isRecord(mark.attrs)) { issues.push({ path: `${markPath}.attrs`, message: "Link attributes are required." }); return; }
      exactKeys(mark.attrs, ["href", "target", "rel", "class"], `${markPath}.attrs`, issues);
      const href = typeof mark.attrs.href === "string" ? normalizeEditorialLink(mark.attrs.href) : null;
      if (!href) { issues.push({ path: `${markPath}.attrs.href`, message: "Link must use a safe HTTP or HTTPS URL." }); return; }
      marks.push({ type: "link", attrs: { href } });
      return;
    }
    exactKeys(mark, ["type"], markPath, issues);
    marks.push({ type: mark.type });
  });
  return marks;
}

function parseInline(value: unknown, path: string, issues: EditorialValidationIssue[], occurrences: Set<string>): EditorialInlineNode | null {
  if (!isRecord(value)) { issues.push({ path, message: "Inline node must be an object." }); return null; }
  if (value.type === "text") {
    exactKeys(value, ["type", "text", "marks"], path, issues);
    if (typeof value.text !== "string" || value.text.length === 0) issues.push({ path: `${path}.text`, message: "Text must be a nonempty string." });
    const marks = parseMarks(value.marks, `${path}.marks`, issues);
    return { type: "text", text: typeof value.text === "string" ? value.text : "", ...(marks ? { marks } : {}) };
  }
  if (value.type === "hardBreak") { exactKeys(value, ["type"], path, issues); return { type: "hardBreak" }; }
  if (value.type === "artistReference") {
    exactKeys(value, ["type", "attrs"], path, issues);
    if (!isRecord(value.attrs)) { issues.push({ path: `${path}.attrs`, message: "Artist reference attributes are required." }); return null; }
    exactKeys(value.attrs, ["occurrenceId", "artistId", "displayText"], `${path}.attrs`, issues);
    const occurrenceId = value.attrs.occurrenceId;
    const artistId = value.attrs.artistId;
    const displayText = value.attrs.displayText;
    if (typeof occurrenceId !== "string" || !UUID_PATTERN.test(occurrenceId)) issues.push({ path: `${path}.attrs.occurrenceId`, message: "Occurrence ID must be a valid UUID." });
    else if (occurrences.has(occurrenceId)) issues.push({ path: `${path}.attrs.occurrenceId`, message: "Occurrence ID must be unique within the document." });
    else occurrences.add(occurrenceId);
    if (typeof artistId !== "string" || !UUID_PATTERN.test(artistId)) issues.push({ path: `${path}.attrs.artistId`, message: "Artist ID must be a valid UUID." });
    if (typeof displayText !== "string" || displayText.trim().length === 0) issues.push({ path: `${path}.attrs.displayText`, message: "Display text must be nonempty after trimming." });
    return { type: "artistReference", attrs: { occurrenceId: typeof occurrenceId === "string" ? occurrenceId : "", artistId: typeof artistId === "string" ? artistId : "", displayText: typeof displayText === "string" ? displayText : "" } } satisfies ArtistReferenceNode;
  }
  issues.push({ path: `${path}.type`, message: "Unsupported inline node type." });
  return null;
}

function parseTextBlock(value: Record<string, unknown>, path: string, issues: EditorialValidationIssue[], occurrences: Set<string>, heading: boolean): EditorialBlockNode {
  exactKeys(value, heading ? ["type", "attrs", "content"] : ["type", "content"], path, issues);
  let level: 2 | 3 | 4 = 2;
  if (heading) {
    if (!isRecord(value.attrs)) issues.push({ path: `${path}.attrs`, message: "Heading attributes are required." });
    else {
      exactKeys(value.attrs, ["level"], `${path}.attrs`, issues);
      if (value.attrs.level !== 2 && value.attrs.level !== 3 && value.attrs.level !== 4) issues.push({ path: `${path}.attrs.level`, message: "Heading level must be 2, 3, or 4." });
      else level = value.attrs.level;
    }
  }
  if (value.content !== undefined && !Array.isArray(value.content)) issues.push({ path: `${path}.content`, message: "Text block content must be an array." });
  const content = Array.isArray(value.content) ? value.content.map((node, index) => parseInline(node, `${path}.content[${index}]`, issues, occurrences)).filter((node): node is EditorialInlineNode => node !== null) : undefined;
  return heading ? { type: "heading", attrs: { level }, ...(content ? { content } : {}) } : { type: "paragraph", ...(content ? { content } : {}) };
}

function parseBlock(value: unknown, path: string, issues: EditorialValidationIssue[], occurrences: Set<string>, depth: number): EditorialBlockNode | null {
  if (depth > MAX_NESTING_DEPTH) { issues.push({ path, message: "Document nesting is too deep." }); return null; }
  if (!isRecord(value)) { issues.push({ path, message: "Block node must be an object." }); return null; }
  if (value.type === "paragraph") return parseTextBlock(value, path, issues, occurrences, false);
  if (value.type === "heading") return parseTextBlock(value, path, issues, occurrences, true);
  if (value.type === "horizontalRule") { exactKeys(value, ["type"], path, issues); return { type: "horizontalRule" }; }
  if (value.type === "blockquote") {
    exactKeys(value, ["type", "content"], path, issues);
    if (!Array.isArray(value.content) || value.content.length === 0) { issues.push({ path: `${path}.content`, message: "Blockquote content must be a nonempty array." }); return { type: "blockquote", content: [{ type: "paragraph" }] }; }
    return { type: "blockquote", content: value.content.map((child, index) => parseBlock(child, `${path}.content[${index}]`, issues, occurrences, depth + 1)).filter((node): node is EditorialBlockNode => node !== null) };
  }
  if (value.type === "bulletList" || value.type === "orderedList") {
    exactKeys(value, value.type === "orderedList" ? ["type", "attrs", "content"] : ["type", "content"], path, issues);
    if (!Array.isArray(value.content) || value.content.length === 0) { issues.push({ path: `${path}.content`, message: "List content must be a nonempty array." }); return value.type === "bulletList" ? { type: "bulletList", content: [] } : { type: "orderedList", content: [] }; }
    let start = 1;
    if (value.type === "orderedList" && value.attrs !== undefined) {
      if (!isRecord(value.attrs)) issues.push({ path: `${path}.attrs`, message: "Ordered-list attributes must be an object." });
      else { exactKeys(value.attrs, ["start"], `${path}.attrs`, issues); if (!Number.isInteger(value.attrs.start) || Number(value.attrs.start) < 1) issues.push({ path: `${path}.attrs.start`, message: "Ordered-list start must be a positive integer." }); else start = Number(value.attrs.start); }
    }
    const content = value.content.map((item, index) => parseListItem(item, `${path}.content[${index}]`, issues, occurrences, depth + 1)).filter((item): item is EditorialListItemNode => item !== null);
    return value.type === "bulletList" ? { type: "bulletList", content } : { type: "orderedList", ...(start !== 1 ? { attrs: { start } } : {}), content };
  }
  issues.push({ path: `${path}.type`, message: "Unsupported block node type." });
  return null;
}

function parseListItem(value: unknown, path: string, issues: EditorialValidationIssue[], occurrences: Set<string>, depth: number): EditorialListItemNode | null {
  if (!isRecord(value)) { issues.push({ path, message: "List item must be an object." }); return null; }
  exactKeys(value, ["type", "content"], path, issues);
  if (value.type !== "listItem") issues.push({ path: `${path}.type`, message: "List content may contain only list items." });
  if (!Array.isArray(value.content) || value.content.length === 0) { issues.push({ path: `${path}.content`, message: "List item content must be a nonempty array." }); return { type: "listItem", content: [{ type: "paragraph" }] }; }
  const content = value.content.map((child, index) => parseBlock(child, `${path}.content[${index}]`, issues, occurrences, depth + 1)).filter((node): node is EditorialBlockNode => node !== null);
  if (content[0]?.type !== "paragraph") issues.push({ path: `${path}.content[0]`, message: "A list item must begin with a paragraph." });
  return { type: "listItem", content };
}

export function validateEditorialDocument(schemaVersion: unknown, value: unknown): EditorialValidationResult {
  try { assertSupportedEditorialSchemaVersion(schemaVersion); } catch (error) { return { ok: false, issues: [{ path: "schemaVersion", message: error instanceof Error ? error.message : "Unsupported schema version." }] }; }
  const issues: EditorialValidationIssue[] = [];
  if (!isRecord(value)) return { ok: false, issues: [{ path: "document", message: "Document must be an object." }] };
  exactKeys(value, ["type", "content"], "document", issues);
  if (value.type !== "doc") issues.push({ path: "document.type", message: "Root node must be doc." });
  if (!Array.isArray(value.content)) return { ok: false, issues: [...issues, { path: "document.content", message: "Document content must be an array." }] };
  if (value.content.length === 0) issues.push({ path: "document.content", message: "Document must contain at least one block; use the canonical empty document for empty content." });
  const occurrences = new Set<string>();
  const content = value.content.map((node, index) => parseBlock(node, `document.content[${index}]`, issues, occurrences, 0)).filter((node): node is EditorialBlockNode => node !== null);
  return issues.length ? { ok: false, issues } : { ok: true, document: { type: "doc", content } };
}

export function parseEditorialDocument(schemaVersion: SupportedEditorialSchemaVersion, value: unknown): EditorialDocumentV1 {
  const result = validateEditorialDocument(schemaVersion, value);
  if (!result.ok) throw new Error(result.issues.map((issue) => `${issue.path}: ${issue.message}`).join("; "));
  return result.document;
}
