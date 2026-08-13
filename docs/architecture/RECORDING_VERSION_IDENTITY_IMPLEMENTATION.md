# Recording Version Identity Foundation — Implementation Report

**Status:** implemented and validated in production  
**Migration date:** 2026-08-12 (America/New_York)  
**Scope:** empty durable foundation only

## 1. Backup information

Before migration, a fresh full production custom-format archive was created and
validated with `pg_restore --list`.

| Item | Result |
| --- | --- |
| Timestamp | 2026-08-12 21:22:33.7144841 -04:00 |
| Archive | `backups/recording-version-foundation/mangulina-production-pre-recording-version-20260812T212158-0400.dump` |
| Size | 21,247,083 bytes |
| SHA-256 | `31736B8418357798162CB8B9F516FC9AB7CBDF3195EC0FBC79DC31DE2F797BAB` |
| Source PostgreSQL | 17.6; dump tool 17.10 |
| Archive validation | Passed; 1,865 TOC entries; TOC saved beside archive |

## 2. Production preflight

The read-only preflight passed. `recordings` matched the reviewed schema;
`recording_relationships` existed with zero rows; no
`recording_version_profiles` table existed; all ten required governance tables
and the three reused governance helpers were present. Baselines were 17,051
Recordings, 22,756 Tracks, 3,169 Releases, 641 populated disambiguations, and
JLG at 327 Recordings / 1,452 Tracks. Machine-readable evidence is in
[`RECORDING_VERSION_IDENTITY_PRODUCTION_PREFLIGHT.json`](RECORDING_VERSION_IDENTITY_PRODUCTION_PREFLIGHT.json).

## 3. Files changed

- `supabase/migrations/20260815000000_recording_version_identity_foundation.sql`
- `supabase/migrations/20260815001000_recording_version_profile_cascade_guard.sql`
- `supabase/plans/20260815000000_recording_version_identity_foundation_rollback.sql`
- `supabase/validation/20260815000000_recording_version_identity_foundation.sql`
- `src/types/recordingVersion.ts`
- `src/lib/recordingIdentity.ts`
- this report, the architecture status/index, and pre/postvalidation JSON evidence

## 4. Migration and final schema

`recording_version_profiles` is optional and one-to-one with `recordings`, using
`recording_id` as its primary key and `ON DELETE CASCADE`. It contains only
performance kind, derivation kind, BCP-47-compatible language code, paired
performance date/precision, and a trimmed nonblank context of at most 200
characters. A nonempty-profile constraint requires at least one identity facet.
The follow-up `20260815001000` migration narrows the delete exception to the
specific FK-cascade condition where the owning Recording is already absent.

The controlled values exactly match the approved architecture. Indexes cover
performance/derivation kind, non-null language, and non-null performance date.
Updates use the existing `music_ontology_set_updated_at()` trigger.
`performance_context` is explicitly documented as identity-relevant event or
session context—not credits, releases, evidence prose, URLs, importer notes,
copyright, genres, or Arrangement/style labels.

## 5. Governance implementation

The `recording.version_manage` capability is assigned to active owner, admin,
and editor roles through the existing role/capability model. The SECURITY
DEFINER functions `save_recording_version_profile` and
`clear_recording_version_profile`:

- require that capability and an existing Recording;
- serialize and deduplicate requests with the existing advisory lock and
  idempotency table;
- persist a complete profile JSON assertion targeted through
  `editorial_assertion_recordings`;
- link supplied sources through `editorial_assertion_evidence`;
- create executed set/clear decisions and before/after audit events;
- perform the canonical mutation under a transaction-local guard flag.

The reviewed conceptual capability name was `recording.version.manage`; the
implemented name uses `recording.version_manage` because Mangulina's existing
capability constraint permits exactly one namespace dot. This is the only
vocabulary-level adaptation.

The row trigger `enforce_governed_recording_version_profile()` rejects direct
insert, update, and delete operations outside that flag. It permits only the
referential cascade caused by deletion of the parent Recording.

## 6. Permission/RLS model

RLS is enabled. Public, anonymous, and authenticated roles have no base-table
mutation rights; `service_role` is the only direct grantee and still encounters
the governed-write trigger. The functions are executable only by
`service_role`, with human authority checked using the supplied actor UUID.

The narrow public/admin read path is the security-barrier view
`recording_identity_summary`. The base profile table remains unexposed to
ordinary clients. This is an implementation-level safety refinement from the
architecture's conceptual SQL, which did not prescribe the view security mode.

## 7. Recording relationships

Because production contained zero rows, the existing table safely received a
CHECK constraint limited to `edit_of`, `remix_of`, `rerecording_of`,
`alternate_take_of`, and `derived_from`, plus a semantic unique index. No
relationship was populated and `live_version_of` was not introduced.

## 8. Identity summary projection

`recording_identity_summary` returns one row per Recording with canonical title,
legacy/editorial disambiguation override, all structured profile inputs, Work,
primary artist, derived performer credits, representative Release, earliest
Track-derived Release/year, Track and distinct Release appearance counts,
Recording year/duration, profile presence, and descriptor-source state. No
generated English label is stored; localization remains an application concern.

`src/lib/recordingIdentity.ts` provides a server-only typed batch reader without
changing visible UI behavior. `src/types/recordingVersion.ts` centralizes all
approved vocabularies and profile/summary contracts.

## 9. Ingestion safeguards and compatibility

The ingestion audit found no writer for the new table or derivation
relationships. The migration adds no import trigger, heuristic, or automatic
promotion. Provider disambiguation may continue as provenance/legacy text, but
cannot create authoritative version facts. All 641 populated disambiguations
remain unchanged. No public/admin presentation was modified.

## 10. Validation cases

The isolated validation uses transactionally rolled-back fixtures and covers:
an original Recording with no required profile; year-specific live Recordings;
two same-title live contexts; Portuguese studio rerecording; live edit; remix;
derived performer/collaboration data; and absence of Arrangement fields. It also
verifies authorized save and clear, idempotency, evidence/assertion/decision/audit
links, direct insert/update/delete rejection, every controlled constraint,
parent-delete cascade, relationship vocabulary, and one summary row per
Recording.

The production backup was restored to PostgreSQL 17 on isolated port 55432. The
upgrade passed, the validation passed, rollback removed all new objects while
preserving counts, and a clean re-upgrade passed.

## 11. Regression tests and production result

- TypeScript `--noEmit`: passed.
- Targeted ESLint: passed.
- Repository tests: 201 passed, 0 failed.
- Next.js production build: passed; public search, song, artist, and admin routes compiled.
- Production postvalidation: passed; evidence is in
  [`RECORDING_VERSION_IDENTITY_PRODUCTION_POSTVALIDATION.json`](RECORDING_VERSION_IDENTITY_PRODUCTION_POSTVALIDATION.json).
- Final production counts: 17,051 Recordings; 22,756 Tracks; 3,169 Releases;
  17,051 identity-summary rows; zero profiles; zero relationships.
- JLG remains 327 Recordings / 1,452 Tracks; no JLG facts were populated.
- No Arrangement table or profile facet was added; Alex Bueno was untouched.

## 12. Rollback procedure

Run `supabase/plans/20260815000000_recording_version_identity_foundation_rollback.sql`.
It drops the summary, governed functions, relationship constraint/index,
capability assignments/capability, guarded profile table, and trigger function in
one transaction. If rollback is required after future profile population,
export that governed data and its evidence first; dropping the table removes the
canonical profile rows. The pre-migration full archive is the disaster-recovery
rollback point.

## 13. Known limitations

- No descriptor formatter or visible UI consumption is implemented yet.
- Language validation is intentionally BCP-47-compatible rather than a complete
  registry lookup.
- `performance_context` policy is governance/documentation plus length/blank
  constraints; semantic misuse requires editorial review.
- Derivation relationships have controlled identity semantics but no new
  governed mutation function in this phase because no relationship population
  was authorized.
- Arrangement/Expression and medley membership remain separate future designs.

## 14. Exact next step

The 67 verified JLG version/disambiguation findings were converted on 2026-08-12
into the deterministic, non-mutating
`manifests/jlg-recording-version-review-manifest.json`; the human review is
`docs/architecture/JLG_RECORDING_VERSION_REVIEW_MANIFEST.md`. Production was not
populated and remains at zero profiles and zero Recording relationships.

The reviewed ready subset was subsequently populated through the governed path:
53 fully resolved profiles and eight independently proven `edit_of`
relationships. See
[`JLG_RECORDING_VERSION_POPULATION.md`](JLG_RECORDING_VERSION_POPULATION.md).
The ten unresolved entries, fifteen Arrangement holds, eight optional overrides,
and three missing-credit follow-ups remain untouched.
