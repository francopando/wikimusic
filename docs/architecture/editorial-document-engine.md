# Editorial Document Engine

## Purpose and boundary

The engine stores localized artist biographies. The production allowlist supports only `artist_biography`; additional entity types require a separately designed schema and lifecycle review.

The JSON document is authoritative for prose, semantic block structure, bold/italic/link marks, localized visible reference wording, and occurrence placement. `editorial_entity_references` is a transactionally derived integrity index: it owns immutable artist UUID identity, foreign keys, reverse lookup, future merge support, and auditing. Slugs are never reference identity.

## Version 1 format

Documents use the Tiptap/ProseMirror JSON shape. Version 1 allows paragraphs, H2–H4 headings, blockquotes, bullet and ordered lists with nested list items, horizontal rules, inline `text`, `hardBreak`, and atomic `artistReference` nodes. Text accepts only `bold`, `italic`, and normalized HTTP(S) `link` marks. Raw HTML, H1, unsafe URL schemes, styling attributes, and unknown nodes, marks, or attributes are rejected at runtime and in the database.

The canonical empty document is:

```json
{"type":"doc","content":[{"type":"paragraph"}]}
```

This follows Tiptap's standard `block+` document-root rule. The former zero-block form (`{"type":"doc","content":[]}`) is rejected by both runtime and database validation rather than normalized during persistence, ensuring one stored empty representation.

The Tiptap editor registers a custom inline atomic `artistReference` node with the stored attributes `occurrenceId`, `artistId`, and `displayText` using the standard inline/atom/selectable configuration.

An `artistReference` has exactly `occurrenceId`, `artistId`, and nonblank `displayText`. Both IDs are UUIDs. Each occurrence UUID is unique within its document; the same artist may be referenced by several distinct occurrences. Renaming an artist does not rewrite visible prose. Slug changes require no document update.

Schema version `1` is stored separately in the row. Runtime types are versioned and the validator rejects unknown versions rather than guessing at future structures.

## Storage and lifecycle

`editorial_documents` has typed `owner_artist_id` ownership. An artist biography requires an owner, and `(document_type, owner_artist_id, locale)` is unique for biographies. Owner deletion cascades to the document. A document deletion cascades to its derived relations.

`editorial_entity_references` supports only entity type `artist` and a real `target_artist_id` foreign key. Target deletion is restricted. Routine removal should archive/hide an artist; future merge tooling should use reverse lookup to retarget rows while preserving occurrence IDs and document wording.

No `owner_recording_id` exists yet because Phase 1 has no recording-owned document type. It should be added as a typed FK when `song_documentary` is designed, together with an extended owner constraint.

## Atomic writes and concurrency

The authenticated admin endpoint validates the caller through Mangulina's `admin_members`/bootstrap allowlist mechanism and validates the entire document in TypeScript. It then calls the service-role-only `upsert_editorial_document` RPC. PostgreSQL repeats critical allowlist-structure, owner, target, occurrence, status, locale, type, and schema checks. The function locks an existing row, compares the revision, writes the document, replaces every derived reference, and returns the saved identity and revision in one transaction.

`expectedRevision = 0` means create-only. An existing row conflicts. Updates require the exact positive current revision and increment it by one. A stale or missing row raises SQLSTATE `40001`; the API maps this to HTTP 409. Any invalid target or structure rolls back both document and relations.

Direct table writes and RPC execution are revoked from `PUBLIC`, `anon`, and `authenticated`. RLS permits only service-role access. There is deliberately no direct public read policy in Phase 1, so neither drafts nor published documents are exposed. Server-only helpers load a document with one query, its complete relation set with one query, reverse references with one joined query, and verify document/relation agreement without per-reference queries.

## Plain text

Conversion emits text content and artist `displayText`; UUIDs and HTML are never emitted. A hard break becomes one LF (`\n`) and paragraph boundaries become two LFs (`\n\n`). Import normalizes CRLF/CR to LF, treats one LF as a hard break, and two or more consecutive LFs as one paragraph boundary. This gives a stable normalized round trip while preserving Unicode, including Spanish accents.

## Completion status

Phase 1 foundation, Phase 2 public rendering, Phase 3 admin editing, and Phase 4 migration/cutover are complete. Structured JSON is authoritative. `artists.bio` is removed; `bio_en` and `bio_es` remain frozen compatibility snapshots. Phase 5 adds lifecycle hardening without introducing new document or entity types.

## Phase 2 public rendering

Artist profiles request published structured biographies. English uses structured English. Spanish uses structured Spanish and then structured English. Frozen compatibility columns are exceptional fallback data only. Invalid structured content is logged server-side. A valid canonical empty structured document intentionally suppresses fallback and renders no biography section.

Public loading is server-only. It performs one document query, one complete relation query, and one batched artist query for all distinct targets. Stored JSON is strictly validated before rendering. Resolution compares every node occurrence and target UUID with its relation, records missing/orphan/mismatched integrity conditions, and never changes saved `displayText`.

An artist reference is linked only when the current target row has `status = 'published'` and a valid nonempty slug. Unpublished, missing, mismatched, or slugless targets render saved wording as plain text. Links use locale-aware navigation and current slugs, with prefetch disabled.

The renderer maps version-1 nodes directly to semantic React elements, including headings, lists, blockquotes, horizontal rules, hardened external anchors, and the dedicated artist-reference component. It never parses HTML or Markdown and never uses `dangerouslySetInnerHTML`.

Public reads use request-level React caching rather than a permanent cross-request document cache. The Phase 1 write endpoint revalidates the owner profile after a successful save. Artist updates additionally revalidate profiles whose editorial documents reference that artist, so slug and publication changes do not leave permanent stale links. Phase 3 must keep invoking the guarded write endpoint (or the same owner revalidation hook) after saves.
# Phase 3 admin biography editor

Phase 3 provides the authenticated structured-biography editing surface. After Phase 4, it is the only biography editor and structured documents are globally authoritative. Compatibility columns are not part of general artist form state or write payloads.

The editor uses Tiptap with StarterKit configured for the curated version-1 schema: paragraphs, H2–H4, lists and list keymaps, blockquotes, horizontal rules, safe HTTP(S) links, bold, italic, history, and the custom inline atomic `artistReference` node. H1, code, strike, underline, arbitrary presentation styling, and other unsupported features remain disabled. Empty content remains the standard document containing one empty paragraph.

`artistReference` stores only `occurrenceId`, immutable target `artistId`, and editor-controlled `displayText`. It never stores a slug or HTML. New occurrences receive browser-generated UUIDs; editing a target or wording preserves the occurrence UUID. Duplicate occurrence UUIDs are repaired immediately before the authoritative runtime validation and atomic save.

The authenticated `GET /api/admin/editorial-documents` path loads draft or published documents for one artist and locale. It requires editor-or-higher access and validates stored JSON before returning it. `POST` continues to use the deployed optimistic-concurrency RPC. Revision conflicts return HTTP 409 and preserve local editor content.

English and Spanish editors maintain independent IDs, revisions, statuses, documents, and dirty state. Locale, artist, navigation, reload, and stale-version replacement paths warn before discarding unsaved work. Publishing the canonical empty document requires explicit confirmation because it intentionally suppresses the public legacy biography.

Preview renders the same supported node and mark semantics directly as React nodes. It does not use Tiptap HTML, raw HTML parsing, or `dangerouslySetInnerHTML`.

# Phase 4 biography authority and cutover

`editorial_documents.document` is the authoritative biography source. The migration converted `bio_en` to English documents and genuine `bio_es` to Spanish documents with the application plain-text converter, schema validation, SHA-256 auditing, and round-trip equivalence checks. It never generated artist references.

Public English reads use published structured English. Public Spanish reads use published structured Spanish, then published structured English, with legacy locale columns retained only as an exceptional compatibility fallback. A published canonical-empty document remains authoritative and suppresses fallback. Song artist previews and featured-artist excerpts derive plain text from published structured English documents.

The general artist API rejects `bio`, `bio_en`, and `bio_es`; structured writes remain isolated and revision-protected. `bio_en` and `bio_es` are frozen compatibility snapshots. The obsolete `artists.bio` column was removed only after complete migration, consumer cutover, tests, TypeScript, build, and integrity verification.

# Phase 5 lifecycle hardening

References use artist UUIDs, never names or slugs. Rename and slug changes therefore preserve document JSON, occurrence UUIDs, target UUIDs, and saved display wording. Current target slug/status is resolved at read time: published targets with valid slugs link; hidden, draft, duplicate, missing, and future archived targets render intact plain text. Wording differences from the canonical name are informational.

Reverse reference lookup uses the indexed `target_artist_id` relation set, a joined document fetch, and one batched owner query. It returns owner identity/slug, locale, occurrence UUID, and saved wording without N+1 queries. Admin deletion checks this lookup before storage or row deletion and returns a safe 409 report instead of exposing a foreign-key error. The database retains `ON DELETE RESTRICT` as the final guard.

The reusable merge helper loads each affected document once, changes only matching target UUIDs, preserves wording and occurrence UUIDs, and saves through optimistic concurrency so derived relations are replaced atomically. It revalidates affected biography owners and both source/target reverse-reference sets. No merge UI is included.

The authenticated `/admin/editorial-integrity` report scans documents, relations, artists, compatibility snapshots, status, target existence, relation parity, schema/version, canonical emptiness, drafts, and wording differences. Blocking target existence is also checked before publication. Lifecycle cache invalidation targets the old/new artist paths, referencing biography owners, and homepage data where artist metadata can appear; archive-count cache is not cleared for ordinary artist edits.
