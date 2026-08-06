import { editorialDocumentToPlainText } from "@/lib/editorial/plainText";
import { collectEditorialReferences } from "@/lib/editorial/references";
import { validateEditorialDocument } from "@/lib/editorial/validate";
import { allEditorialInlineNodes } from "@/lib/editorial/documentTree";

export type IntegritySeverity = "blocking" | "warning" | "informational";
export type EditorialIntegrityFinding = {
  code: string; severity: IntegritySeverity; documentId?: string; ownerArtistId?: string;
  locale?: string; occurrenceId?: string; targetArtistId?: string; detail?: string;
};
export type IntegrityDocumentRow = { id: string; document_type: string; owner_artist_id: string | null; locale: string; schema_version: number; document: unknown; status: string };
export type IntegrityRelationRow = { editorial_document_id: string; occurrence_id: string; entity_type: string; target_artist_id: string | null };
export type IntegrityArtistRow = { id: string; name: string; slug: string | null; status: string | null; bio_en?: string | null; bio_es?: string | null };

function populated(value: string | null | undefined) { return Boolean(value?.trim()); }
function add(findings: EditorialIntegrityFinding[], finding: EditorialIntegrityFinding) { findings.push(finding); }

export function buildEditorialIntegrityReport(input: { documents: IntegrityDocumentRow[]; relations: IntegrityRelationRow[]; artists: IntegrityArtistRow[] }) {
  const findings: EditorialIntegrityFinding[] = [];
  const artists = new Map(input.artists.map((artist) => [artist.id, artist]));
  const documentsByKey = new Map<string, IntegrityDocumentRow[]>();
  const relationsByDocument = new Map<string, IntegrityRelationRow[]>();
  for (const relation of input.relations) relationsByDocument.set(relation.editorial_document_id, [...(relationsByDocument.get(relation.editorial_document_id) ?? []), relation]);
  for (const document of input.documents) {
    const key = `${document.owner_artist_id}:${document.locale}`;
    documentsByKey.set(key, [...(documentsByKey.get(key) ?? []), document]);
  }
  for (const [key, rows] of documentsByKey) if (rows.length > 1) add(findings, { code: "duplicate_document", severity: "blocking", detail: key });
  for (const artist of input.artists) for (const locale of ["en", "es"] as const) {
    const legacy = locale === "en" ? artist.bio_en : artist.bio_es;
    if (populated(legacy) && !documentsByKey.has(`${artist.id}:${locale}`)) add(findings, { code: "missing_document", severity: "blocking", ownerArtistId: artist.id, locale });
  }
  for (const document of input.documents) {
    const base = { documentId: document.id, ownerArtistId: document.owner_artist_id ?? undefined, locale: document.locale };
    if (document.schema_version !== 1) { add(findings, { ...base, code: "unsupported_version", severity: "blocking" }); continue; }
    const validation = validateEditorialDocument(document.schema_version, document.document);
    if (!validation.ok) {
      add(findings, { ...base, code: validation.issues.some((issue) => issue.message.includes("unique within")) ? "duplicate_occurrence_uuid" : "invalid_schema", severity: "blocking" });
      continue;
    }
    if (!document.owner_artist_id || !artists.has(document.owner_artist_id) || !["en", "es"].includes(document.locale)) add(findings, { ...base, code: "invalid_owner_or_locale", severity: "blocking" });
    const owner = document.owner_artist_id ? artists.get(document.owner_artist_id) : undefined;
    const legacy = document.locale === "en" ? owner?.bio_en : owner?.bio_es;
    const plainText = editorialDocumentToPlainText(validation.document);
    if (document.status === "published" && plainText.length === 0) add(findings, { ...base, code: "published_empty_document", severity: populated(legacy) ? "blocking" : "informational" });
    if (document.status === "draft" && populated(legacy)) add(findings, { ...base, code: "draft_shadowing_public_compatibility", severity: "warning" });
    if (populated(legacy) && plainText !== legacy!.replace(/\r\n?/g, "\n").split(/\n{2,}/).join("\n\n")) add(findings, { ...base, code: "legacy_compatibility_mismatch", severity: "informational" });
    const nodes = collectEditorialReferences(1, validation.document);
    const nodeByOccurrence = new Map(nodes.map((node) => [node.occurrenceId, node]));
    const relations = relationsByDocument.get(document.id) ?? [];
    const relationByOccurrence = new Map(relations.map((relation) => [relation.occurrence_id, relation]));
    for (const node of nodes) {
      const relation = relationByOccurrence.get(node.occurrenceId);
      if (!relation) { add(findings, { ...base, code: "reference_node_without_relation", severity: "blocking", occurrenceId: node.occurrenceId, targetArtistId: node.targetArtistId }); continue; }
      if (relation.entity_type !== "artist") add(findings, { ...base, code: "wrong_entity_type", severity: "blocking", occurrenceId: node.occurrenceId });
      if (relation.target_artist_id !== node.targetArtistId) add(findings, { ...base, code: "target_mismatch", severity: "blocking", occurrenceId: node.occurrenceId });
      const target = artists.get(node.targetArtistId);
      if (!target) { add(findings, { ...base, code: "missing_target", severity: "blocking", occurrenceId: node.occurrenceId, targetArtistId: node.targetArtistId }); continue; }
      if (target.status === "archived") add(findings, { ...base, code: "archived_target", severity: "warning", occurrenceId: node.occurrenceId, targetArtistId: target.id });
      else if (target.status !== "published") add(findings, { ...base, code: "unpublished_target", severity: "warning", occurrenceId: node.occurrenceId, targetArtistId: target.id });
      const displayText = allEditorialInlineNodes(validation.document).find((inline) => inline.type === "artistReference" && inline.attrs.occurrenceId === node.occurrenceId);
      if (displayText?.type === "artistReference" && displayText.attrs.displayText !== target.name) add(findings, { ...base, code: "display_wording_differs_from_canonical_name", severity: "informational", occurrenceId: node.occurrenceId, targetArtistId: target.id });
    }
    for (const relation of relations) if (!nodeByOccurrence.has(relation.occurrence_id)) add(findings, { ...base, code: "relation_without_reference_node", severity: "blocking", occurrenceId: relation.occurrence_id });
  }
  return {
    generatedAt: new Date().toISOString(),
    counts: { documents: input.documents.length, relations: input.relations.length, blocking: findings.filter((f) => f.severity === "blocking").length, warning: findings.filter((f) => f.severity === "warning").length, informational: findings.filter((f) => f.severity === "informational").length },
    findings,
  };
}
