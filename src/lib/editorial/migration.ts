import { createHash } from "node:crypto";
import { editorialDocumentToPlainText, plainTextToEditorialDocument } from "@/lib/editorial/plainText";
import { validateEditorialDocument } from "@/lib/editorial/validate";

export function normalizeLegacyBiography(text: string) {
  return text.replace(/\r\n?/g, "\n").split(/\n{2,}/).join("\n\n");
}

export function editorialMigrationSha256(value: string) {
  return createHash("sha256").update(value, "utf8").digest("hex");
}

export function prepareLegacyBiographyMigration(source: string | null | undefined) {
  if (!source?.trim()) return { ok: true as const, result: "skipped_empty" as const };
  const document = plainTextToEditorialDocument(source);
  const validation = validateEditorialDocument(1, document);
  if (!validation.ok) return { ok: false as const, result: "invalid" as const, issues: validation.issues };
  const normalizedSource = normalizeLegacyBiography(source);
  const derivedText = editorialDocumentToPlainText(document);
  if (derivedText !== normalizedSource) return { ok: false as const, result: "mismatch" as const, normalizedSource, derivedText };
  return {
    ok: true as const,
    result: "ready" as const,
    document,
    normalizedSource,
    sourceHash: editorialMigrationSha256(normalizedSource),
    documentHash: editorialMigrationSha256(JSON.stringify(document)),
    derivedHash: editorialMigrationSha256(derivedText),
    normalizationChanged: source !== derivedText,
  };
}

export function hasForbiddenArtistBiographyFields(value: unknown) {
  if (!value || typeof value !== "object") return [];
  return ["bio", "bio_en", "bio_es"].filter((field) => Object.prototype.hasOwnProperty.call(value, field));
}
