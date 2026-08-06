import type { AppLocale } from "@/i18n/routing";

export const EDITORIAL_SCHEMA_VERSION = 1 as const;
export const EDITORIAL_DOCUMENT_TYPE = "artist_biography" as const;

export type SupportedEditorialSchemaVersion = typeof EDITORIAL_SCHEMA_VERSION;
export type SupportedEditorialDocumentType = typeof EDITORIAL_DOCUMENT_TYPE;
export type EditorialLocale = AppLocale;

export type BoldMark = { type: "bold" };
export type ItalicMark = { type: "italic" };
export type LinkMark = { type: "link"; attrs: { href: string } };
export type EditorialTextMark = BoldMark | ItalicMark | LinkMark;

export type EditorialTextNode = {
  type: "text";
  text: string;
  marks?: EditorialTextMark[];
};

export type EditorialHardBreakNode = { type: "hardBreak" };

export type ArtistReferenceNode = {
  type: "artistReference";
  attrs: {
    occurrenceId: string;
    artistId: string;
    displayText: string;
  };
};

export type EditorialInlineNode =
  | EditorialTextNode
  | EditorialHardBreakNode
  | ArtistReferenceNode;

export type EditorialParagraphNode = {
  type: "paragraph";
  content?: EditorialInlineNode[];
};

export type EditorialHeadingNode = {
  type: "heading";
  attrs: { level: 2 | 3 | 4 };
  content?: EditorialInlineNode[];
};

export type EditorialHorizontalRuleNode = { type: "horizontalRule" };

export type EditorialBlockquoteNode = {
  type: "blockquote";
  content: EditorialBlockNode[];
};

export type EditorialListItemNode = {
  type: "listItem";
  content: EditorialBlockNode[];
};

export type EditorialBulletListNode = {
  type: "bulletList";
  content: EditorialListItemNode[];
};

export type EditorialOrderedListNode = {
  type: "orderedList";
  attrs?: { start: number };
  content: EditorialListItemNode[];
};

export type EditorialBlockNode =
  | EditorialParagraphNode
  | EditorialHeadingNode
  | EditorialBlockquoteNode
  | EditorialBulletListNode
  | EditorialOrderedListNode
  | EditorialHorizontalRuleNode;

export type EditorialDocumentV1 = {
  type: "doc";
  content: EditorialBlockNode[];
};

export type VersionedEditorialDocument = {
  schemaVersion: 1;
  document: EditorialDocumentV1;
};

export type EditorialReferenceDescriptor = {
  occurrenceId: string;
  entityType: "artist";
  targetArtistId: string;
};

export type EditorialDocumentRecord = {
  id: string;
  documentType: SupportedEditorialDocumentType;
  ownerArtistId: string;
  locale: EditorialLocale;
  schemaVersion: SupportedEditorialSchemaVersion;
  document: EditorialDocumentV1;
  status: "draft" | "published";
  revision: number;
  createdAt: string;
  updatedAt: string;
};

export type EditorialIntegrityCode =
  | "invalid_document_schema"
  | "unsupported_schema_version"
  | "duplicate_occurrence"
  | "missing_relation"
  | "orphan_relation"
  | "target_mismatch"
  | "missing_target"
  | "non_public_target"
  | "missing_target_slug"
  | "data_access_failure";

export type EditorialIntegrityIssue = {
  code: EditorialIntegrityCode;
  severity: "warning" | "blocking";
  occurrenceId?: string;
};

export type ResolvedArtistReference = {
  occurrenceId: string;
  artistId: string;
  displayText: string;
  slug: string | null;
  isPubliclyLinkable: boolean;
};

export type ResolvedEditorialDocument = {
  id: string;
  documentType: SupportedEditorialDocumentType;
  ownerArtistId: string;
  locale: EditorialLocale;
  schemaVersion: SupportedEditorialSchemaVersion;
  revision: number;
  document: EditorialDocumentV1;
  references: Record<string, ResolvedArtistReference>;
  integrityIssues: EditorialIntegrityIssue[];
};

export type PublicEditorialDocumentResult =
  | { ok: true; value: ResolvedEditorialDocument }
  | { ok: false; issues: EditorialIntegrityIssue[] };
