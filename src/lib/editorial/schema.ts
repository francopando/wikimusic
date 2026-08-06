import {
  EDITORIAL_SCHEMA_VERSION,
  type EditorialDocumentV1,
  type SupportedEditorialSchemaVersion,
} from "@/types/editorialDocument";

export const CANONICAL_EMPTY_EDITORIAL_DOCUMENT: Readonly<EditorialDocumentV1> =
  Object.freeze({ type: "doc", content: [Object.freeze({ type: "paragraph" })] });

export function createEmptyEditorialDocument(): EditorialDocumentV1 {
  return { type: "doc", content: [{ type: "paragraph" }] };
}

export function assertSupportedEditorialSchemaVersion(
  version: unknown,
): asserts version is SupportedEditorialSchemaVersion {
  if (version !== EDITORIAL_SCHEMA_VERSION) {
    throw new Error(`Unsupported editorial schema version: ${String(version)}.`);
  }
}
