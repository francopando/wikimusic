# Mangulina Music Ontology

This ontology is the entity layer of the broader Mangulina Music Knowledge Model. [Editorial Governance](EDITORIAL_GOVERNANCE.md) defines how claims about these entities are evidenced, reviewed, accepted, corrected, and published.

> Mangulina stores editorial assertions supported by evidence, not merely imported metadata.

> Mangulina's authority comes from transparent evidence, careful editorial review, and accountable correction—not from pretending uncertainty does not exist.

## Authority and identity

Mangulina owns its entity identities. External databases and industry identifiers are sources of evidence, not authorities over Mangulina identity.

- A MusicBrainz MBID does not define a Mangulina Recording.
- An ISRC does not define a Mangulina Recording.
- A UPC does not define a Mangulina Release.
- Identical titles do not establish that two rows are the same Work.
- Different ISRCs do not automatically imply different Recordings.
- Different Releases do not automatically imply different Recordings.
- Unknown or disputed facts must remain representable without forced resolution.

## Foundational entities

### Musical Work

A Work is the underlying composition, independent of performers, recordings, releases, ISRCs, and providers. `works.id` is a stable Mangulina UUID. `preferred_title` is presentation data, not an identity key. A future `work_titles` relation may store translations, aliases, historical spellings, and alternate titles without changing Work identity.

One Work may have zero or many Recordings. A Recording may have zero or one identified Work while research remains incomplete. Equivalence is an explicit editorial decision supported by evidence; Phase 1 performs no automatic matching.

### Recording

A Recording is a distinct recorded performance or version recognized editorially by Mangulina. It is not synonymous with a provider recording, ISRC, streaming track, Track Appearance, or Release. Existing `recordings.id` values remain the Mangulina identities in Phase 1. `recordings.work_id` now optionally references `works.id`.

Future version relationships such as `remix_of`, `live_version_of`, `rerecording_of`, `alternate_version_of`, `edit_of`, and `derived_from` relate Recordings to Recordings. Work identity must not encode these relationships.

### Track Appearance

`tracks` represents the occurrence of a Recording on a particular Release edition. One Recording may appear on an original album, compilation, reissue, anthology, or box set without creating a new Recording. Phase 1 does not rewrite tracks.

### Release

A Release is a published product or edition. It contains Track Appearances and remains separate from Works and Recordings. Release identity does not imply Recording identity.

### ISRC Assignment

`recording_isrcs` stores canonical-format ISRC assignments to a Recording. The uniqueness boundary is `(recording_id, isrc)`, deliberately not global. This permits conflicting historical assertions that the same ISRC belongs to different Recordings without silently merging them.

`recording_isrc_sources` stores source assertions around an assignment, including the raw value, source, reference, territory, verification state, and whether the source supports, disputes, or supersedes the assertion. Multiple sources may support or dispute the same assignment.

Legacy `recordings.isrcs` remains a compatibility field. Phase 1 normalizes valid legacy values additively and preserves malformed values in place for review.

### Work Credit

`work_credits` stores contributions attributable to a composition, such as composer, songwriter, or lyricist. Role and scope are independent: an arranger credit can belong to a Work or a Recording according to evidence. `(work_id, artist_id, role)` identifies one canonical semantic credit; evidence is one-to-many through `work_credit_sources`.

### Recording Credit

`recording_credits` continues to store contributions attributable to a specific Recording. Phase 1 does not move, delete, or reinterpret existing credits.

### Release Credit

`release_artists` remains the current release-scoped artist-credit relation. Future release-credit expansion should preserve exact historical billing and evidence at Release scope.

### External Identifier

An external identifier is a provider assertion around a Mangulina entity. Current storage uses provider-specific columns, arrays, and platform-link tables. Phase 1 does not add a generic polymorphic identifier table: polymorphic `entity_type/entity_id` rows cannot enforce ordinary foreign keys. The preferred future direction is entity-specific identifier tables sharing consistent provider, identifier, verification, and evidence conventions.

### Provenance

Canonical entities and assertions are separate from evidence. Phase 1 introduces evidence relations for Work Credits and ISRC assignments. They preserve source type, source name/reference, assertion direction, verification state, observations, notes, and supplementary metadata. Conflicting claims may coexist while editorial resolution remains explicit.

## Credit scopes

| Scope | Examples | Current relation |
| --- | --- | --- |
| Work | composer, songwriter, lyricist; arranger when composition-level | `work_credits` |
| Recording | performer, vocalist, session musician, producer; arranger when version-specific | `recording_credits` |
| Track Appearance | edition-specific printed track credit | Reserved for a later phase |
| Release | primary/featured release artist and future release production credits | `release_artists` |

The role name never determines scope by itself. Editors must choose the entity described by the evidence.

## Colegiala validation

The Work `Colegiala` can eventually reference the unresolved early Alex & Orquesta Liberación and Alex Bueno Recording identities, plus the bachata, merengue, Gabriel Pagán collaboration, and symphonic Recordings. Phase 1 creates no Work automatically and does not merge the unresolved early Recordings. Composition credits can later be asserted once at Work scope; each Recording retains version-specific credits, ISRC assignments, and existing Release appearances.

## Editorial workflow

A future editor should first select or create the intended Work, then link independently researched Recordings. When entering a credit, the editor deliberately chooses Work, Recording, Track Appearance, or Release scope and may add source evidence and verification state. Unknown facts remain null or unresolved; titles, duration, ISRC, and provider IDs are search evidence only.

## Compatibility and deferred work

Phase 1 is additive. It retains `recordings.isrcs`, `recordings.release_id`, `recordings.artist_id`, `recording_credits`, `credited_works`, `credited_work_credits`, all Recording IDs, and all Track/Release relationships. `credited_works` remains an editorial portfolio subsystem and is not the authoritative Work catalog.

Deferred items include Work administration, public portfolio redesign, track-appearance credits, recording relationship types, identity merge/split tooling, aliases in `work_titles`, a broader date-assertion model, and entity-specific external identifier tables.

## Phase 1.5 validated editorial rules

Production-data validation established three mandatory outcomes when evaluating a Recording against the Work catalog: link to a proven existing Work, create a researched new Work and link it, or leave the Recording unresolved. Candidate search may use titles, contributors, dates, identifiers, and linked recordings as evidence, but it must never select or save an identity automatically.

Credit entry is scope-first. The editor chooses Work, Recording, Track Appearance, or Release before choosing the contributor and role. Roles may recommend a usual scope but never determine scope without regard to evidence. The saved assertion and its source evidence should be atomic.

Unknown means that no accepted assertion exists; it is not equivalent to false. Future workflows should distinguish proposed, unverified, verified, disputed, rejected, and superseded states. Canonical editorial resolution must remain separate from individual source assertions.

The Phase 1 provenance relations support multiple supporting or disputing sources, but authoritative editorial use additionally requires reviewer identity, review assignment, canonical resolution state, source authority/citation structure, publication sensitivity for notes, and immutable audit events.

At scale, public portfolios should be derived as scoped unions keyed by authoritative entity IDs. Work Credits render once per Work, Recording Credits once per meaningful Recording, and Track Appearances as nested release facts. Derived projections and caches may improve performance but must not become independent sources of truth.

The complete production validation, ISRC conflict triage, role audit, workflows, and Phase 2 gates are documented in [Phase 1.5 Ontology Validation](../reports/MUSIC_ONTOLOGY_PHASE_1_5_VALIDATION.md).

## Phase 1.75 canonical projection foundation

The governance foundation now represents evidence-backed claims without changing canonical catalog data. A future Recording-to-Work conclusion is represented by an `editorial_assertion_recording_work_targets` row, one or more evidence links, and an editorial decision; only an approved transactional operation may then project the accepted Work into `recordings.work_id`. The foreign key remains the efficient application projection and is not itself the historical evidence.

Work-credit and Recording-credit assertions use typed links to the existing canonical credit rows, allowing multiple sources and disagreement without duplicating a canonical credit. Historical `credited_as` remains on the scoped canonical credit/source record and must never be replaced by a normalized Artist name.

Existing `work_credit_sources` and `recording_isrc_sources` rows remain intact. Their optional shared `source_id` supports gradual citation reconciliation; future cleanup must be explicit, reversible, and must preserve original source wording and observation metadata.

## Phase 1.8 canonical workflows

[Canonical Credit-Role Vocabulary](CREDIT_ROLE_VOCABULARY.md) defines stable role identities, aliases, localized labels, families, and permitted scopes. New authoritative Work credits require the controlled role ID; legacy text remains unchanged.

The transactional workflow is now: create a draft Work; create a typed Recording-to-Work assertion with evidence; select it through a capability-checked decision; project it into `recordings.work_id`; and retain assertion, decision, and audit history. Work credits are created unverified and verified through a separate operation. Repeated requests use actor/operation/idempotency keys.

Direct changes to `recordings.work_id` and direct Work-credit writes are database-guarded. A Work-link replacement creates an independent-approval request rather than silently replacing the accepted relationship. The current Phase 1.8 UI supports ordinary first-link selection; approval execution for replacements remains a later high-impact workflow.

Phase 1.9 completes that high-impact lifecycle: an independent approver can approve or reject a replacement, and an existing link can be returned to unresolved/null through the same approval model. Assertions, evidence, decisions, supersession, canonical projection, and audit history change atomically.

## Phase 2A external contributor identity

Mangulina now has two explicit contributor identity domains. A Mangulina Artist is a canonical Dominican artist/contributor identity and may participate in the public Dominican Artist catalog. An External Contributor is a real canonical internal identity for a non-Dominican person, group, or organization whose participation is needed to document Dominican music accurately. External Contributors are not Artist rows and are never members of the public Dominican Artist catalog.

Work and Recording Credits target exactly one domain: `artist_id` or `external_contributor_id`, never both and never neither. `credited_as` remains independent source wording. Future Release Credits must use the same exclusive identity rule, but Release Credits are not introduced in this phase.

External identities may accumulate private biographical fields, images, evidence, notes, verification state, credits, and history. Public Song Credits receive only a constrained projection of identity type, display name, country, and an Artist slug when the identity is an Artist. External names open a small informational dialog and never link to `/artists`. A future governed promotion from External Contributor to Artist must preserve the old identity, credit relationships, assertions, evidence, and audit history; that conversion workflow is intentionally deferred.

## Recording Workspace

The Recording Workspace treats one `recordings` row as one recorded-performance identity. Search results are deduplicated by Recording UUID, while Release appearances are derived separately from `tracks`. `recordings.release_id` remains a legacy hint and is not the complete appearance relationship. Recording year remains nullable performance metadata and is never inferred from a Release date.

Recording Credit entry uses only active roles explicitly allowed by `credit_role_scopes` at Recording scope. Composer, songwriter, and lyricist remain Work-scoped and are directed to the governed Work workflow. Existing Recording Credits with legacy composition strings remain visible and flagged; they are not automatically moved or normalized.

Instruments are controlled identities separate from roles. A new instrumental contribution uses one `instrumentalist` Recording Credit with zero or more `recording_credit_instruments` relationships, allowing one contributor to play multiple instruments without proliferating role codes. The controlled table begins narrowly with piano. Existing `piano`/`pianist` and metadata-based piano facts remain unchanged; new pianist entries use `instrumentalist` plus `piano`.

## Recording Workspace Philosophy

The Recording Workspace is Mangulina's primary editorial entry point. Editors return whenever new reliable information becomes available. Catalog completeness is incremental, and unknown facts may remain unknown.

Facts remain stored at their proper semantic level even though editors do not need database knowledge:

- Composition authorship → Work
- Recording personnel → Recording
- ISRC assignments → Recording
- Publication → Track / Release

The workspace presents linked Composition Credits read-only and sends authorship editing to the Work. Recording Credits stay focused on the recorded performance, release appearances derive from Tracks, and multiple ISRC assignments or edition appearances remain legitimate evidence-bearing facts rather than automatic identity conclusions.
