import { validateEditorialDocument } from "@/lib/editorial/validate";
import { allEditorialInlineNodes } from "@/lib/editorial/documentTree";
import type {
  EditorialDocumentV1,
  EditorialIntegrityIssue,
  EditorialLocale,
  PublicEditorialDocumentResult,
  ResolvedArtistReference,
  SupportedEditorialDocumentType,
} from "@/types/editorialDocument";

export type PublicEditorialDocumentRow = {
  id: string;
  document_type: string;
  owner_artist_id: string | null;
  locale: string;
  schema_version: number;
  document: unknown;
  revision: number;
};

export type PublicEditorialRelationRow = {
  occurrence_id: string;
  entity_type: string;
  target_artist_id: string | null;
};

export type PublicEditorialArtistRow = {
  id: string;
  slug: string | null;
  status: string | null;
};

function validSlug(slug: string | null): slug is string {
  return Boolean(slug && /^[a-z0-9]+(?:-[a-z0-9]+)*$/i.test(slug));
}

function referenceNodes(document: EditorialDocumentV1) {
  return allEditorialInlineNodes(document).filter((node) => node.type === "artistReference");
}

export function resolvePublicEditorialDocument(input: {
  row: PublicEditorialDocumentRow;
  relations: PublicEditorialRelationRow[];
  artists: PublicEditorialArtistRow[];
}): PublicEditorialDocumentResult {
  const validation = validateEditorialDocument(input.row.schema_version, input.row.document);
  if (!validation.ok) {
    const unsupported = input.row.schema_version !== 1;
    return {
      ok: false,
      issues: [{
        code: unsupported ? "unsupported_schema_version" :
          validation.issues.some((issue) => issue.message.includes("unique within"))
            ? "duplicate_occurrence"
            : "invalid_document_schema",
        severity: "blocking",
      }],
    };
  }

  if (
    input.row.document_type !== "artist_biography" ||
    input.row.owner_artist_id === null ||
    (input.row.locale !== "en" && input.row.locale !== "es")
  ) {
    return { ok: false, issues: [{ code: "invalid_document_schema", severity: "blocking" }] };
  }

  const relations = new Map(input.relations.map((relation) => [relation.occurrence_id, relation]));
  const artists = new Map(input.artists.map((artist) => [artist.id, artist]));
  const seenNodes = new Set<string>();
  const issues: EditorialIntegrityIssue[] = [];
  const references: Record<string, ResolvedArtistReference> = {};

  for (const node of referenceNodes(validation.document)) {
    const { occurrenceId, artistId, displayText } = node.attrs;
    seenNodes.add(occurrenceId);
    const relation = relations.get(occurrenceId);
    const base = { occurrenceId, artistId, displayText, slug: null, isPubliclyLinkable: false };
    if (!relation) {
      issues.push({ code: "missing_relation", severity: "warning", occurrenceId });
      references[occurrenceId] = base;
      continue;
    }
    if (relation.entity_type !== "artist" || relation.target_artist_id !== artistId) {
      issues.push({ code: "target_mismatch", severity: "blocking", occurrenceId });
      references[occurrenceId] = base;
      continue;
    }
    const artist = artists.get(artistId);
    if (!artist) {
      issues.push({ code: "missing_target", severity: "warning", occurrenceId });
      references[occurrenceId] = base;
      continue;
    }
    if (artist.status !== "published") {
      issues.push({ code: "non_public_target", severity: "warning", occurrenceId });
      references[occurrenceId] = base;
      continue;
    }
    if (!validSlug(artist.slug)) {
      issues.push({ code: "missing_target_slug", severity: "warning", occurrenceId });
      references[occurrenceId] = base;
      continue;
    }
    references[occurrenceId] = { ...base, slug: artist.slug, isPubliclyLinkable: true };
  }

  for (const relation of input.relations) {
    if (!seenNodes.has(relation.occurrence_id)) {
      issues.push({ code: "orphan_relation", severity: "warning", occurrenceId: relation.occurrence_id });
    }
  }

  return {
    ok: true,
    value: {
      id: input.row.id,
      documentType: input.row.document_type as SupportedEditorialDocumentType,
      ownerArtistId: input.row.owner_artist_id,
      locale: input.row.locale as EditorialLocale,
      schemaVersion: 1,
      revision: input.row.revision,
      document: validation.document,
      references,
      integrityIssues: issues,
    },
  };
}
