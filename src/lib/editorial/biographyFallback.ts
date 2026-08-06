import type { PublicEditorialDocumentResult } from "@/types/editorialDocument";
import type { EditorialLocale } from "@/types/editorialDocument";
import { allEditorialInlineNodes } from "@/lib/editorial/documentTree";

export type ArtistBiographySelection =
  | { kind: "structured"; document: Extract<PublicEditorialDocumentResult, { ok: true }>["value"] }
  | { kind: "legacy"; text: string }
  | { kind: "none" };

function firstNonEmpty(...values: Array<string | null | undefined>) {
  return values.find((value) => value?.trim()) ?? null;
}

export function getLegacyArtistBiography(
  locale: EditorialLocale,
  bioEn: string | null | undefined,
  bioEs: string | null | undefined,
) {
  return locale === "es" ? firstNonEmpty(bioEs, bioEn) : firstNonEmpty(bioEn);
}

export function selectArtistBiography(
  structured: PublicEditorialDocumentResult | null,
  legacyText: string | null | undefined,
): ArtistBiographySelection {
  if (structured?.ok) return { kind: "structured", document: structured.value };
  if (legacyText?.trim()) return { kind: "legacy", text: legacyText };
  return { kind: "none" };
}

/** Phase 4 cutover: locale document first, then structured English, then exceptional legacy compatibility text. */
export function selectCutoverArtistBiography(
  localizedStructured: PublicEditorialDocumentResult | null,
  englishStructured: PublicEditorialDocumentResult | null,
  legacyText: string | null | undefined,
): ArtistBiographySelection {
  if (localizedStructured?.ok) return { kind: "structured", document: localizedStructured.value };
  if (englishStructured?.ok) return { kind: "structured", document: englishStructured.value };
  return selectArtistBiography(null, legacyText);
}

export function editorialDocumentHasVisibleText(
  selection: ArtistBiographySelection,
): boolean {
  if (selection.kind === "legacy") return Boolean(selection.text.trim());
  if (selection.kind !== "structured") return false;
  return allEditorialInlineNodes(selection.document.document).some((node) =>
      node.type === "text"
        ? node.text.length > 0
        : node.type === "artistReference"
          ? node.attrs.displayText.length > 0
          : false,
  );
}
