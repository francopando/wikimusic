# Recording Version Identity

**Status:** implemented foundation · **Architecture audit:** 2026-08-12 · **Production migration:** 2026-08-12 · **Population:** empty by design.

Implementation details and operational evidence are recorded in
[`RECORDING_VERSION_IDENTITY_IMPLEMENTATION.md`](RECORDING_VERSION_IDENTITY_IMPLEMENTATION.md).

The production implementation is migration
`20260815000000_recording_version_identity_foundation.sql`, followed by the
cascade-guard hardening migration
`20260815001000_recording_version_profile_cascade_guard.sql`. It adds the optional
profile, controlled derivation vocabulary, governed save/clear functions,
`recording.version_manage` capability, guarded direct-write trigger, and the
`recording_identity_summary` read projection. No JLG profile or relationship was
created. Existing disambiguation remains untouched and authoritative profile
facts are never inferred during ingestion.

## 1. Executive summary

Mangulina needs a small schema change. The existing `recordings.disambiguation` text field is useful but cannot be the authoritative version model: it mixes imported prose, performance facts, arrangement/style labels, language, edit type, content labels, and release context. The durable design is:

1. keep the historically accurate canonical title on `recordings.title`;
2. add one optional, one-to-one `recording_version_profiles` row containing only intrinsic, identity-relevant Recording facets;
3. use existing `recording_relationships` only for independently proven Recording-to-Recording derivation such as an edit or remix of a particular source Recording;
4. derive Releases, first-known appearance, performers/collaborators, appearance count and display labels from their authoritative relations;
5. retain `recordings.disambiguation` as optional concise editorial override/legacy fallback, not as structured authority;
6. govern version assertions through the existing source/assertion/evidence/decision/audit system.

The proposed core deliberately does not model Arrangement. It leaves an uncomplicated future `recording_version_profiles.recording_id` → Recording → Arrangement relationship possible without migration of version facts.

## 2. Current architecture

### Canonical entities

- `recordings`: title, artist, optional Work, duration, `recording_year`, `release_id`, free-text `disambiguation`, secular/Christian `recording_context`, provider metadata and identifiers.
- `tracks`: the authoritative many-to-many appearance mechanism from one Recording into many Releases.
- `releases`: edition/publication context; Release-level type and disambiguation.
- `recording_credits`: performer and production participation; collaborations belong here.
- `works` / `work_credits`: composition identity and authorship.
- `recording_relationships`: an existing but currently empty Recording-to-Recording relation with free-text `relationship_type`.
- governance: `editorial_sources`, `editorial_assertions`, typed assertion targets, evidence, decisions, cases and append-only audit events.

`recordings.release_id` is used by `recordings_with_release_info` and public song presentation as a legacy representative/import context. JLG proved it is not a reliable original-release assertion. Version identity must not depend on it.

### Application behavior

- Admin Recording search returns title, artist, `disambiguation`, `recording_year`, duration and a derived first-known Release year. It searches title, slug, YouTube ID, year and ISRC, but not disambiguation.
- Recording Workspace exposes disambiguation, year, Work, ISRCs, credits and grouped Track/Release appearances.
- Platform-link Recording search shows title, artist and a derived year; it does not expose disambiguation.
- Public global search uses `recordings_with_release_info` and distinguishes same-title rows mostly by representative Release/year. It does not receive structured version identity.
- Public song pages render canonical title and representative Release but do not render `recordings.disambiguation`.
- Artist discography Track listings render only `track.title_override` or Recording title.
- imported `metadata.disambiguation` is copied from provider provenance, and some genre classification code reads it as a weak signal.

## 3. Problems demonstrated by JLG

The cleaned JLG catalog still contains 81 legitimate distinct-version findings and 67 rows needing clearer identity. The real categories are:

- independently distinct live performances: *Encuentro* 2002, 2005 stadium, Asondeguerra 2012/2013, *Entre Mar y Palmeras* 2021 and other events;
- full live audio and a shorter music-video/edit presentation of the same concert performance;
- later rerecordings, including *Privé* and romantic-collection sessions;
- Portuguese and English-language performances;
- named remixes and dance/remix deliveries;
- ballad, pop, salsa and rock treatments (these may evidence Arrangement, not merely version type);
- extended and shortened edits whose exact mechanism can require audio review;
- composite medleys;
- collaborations/duets whose participants belong in Recording credits;
- soundtrack performances;
- enhanced-media/video assets;
- original studio Recordings reused unchanged across many editions and compilations.

One text string cannot safely distinguish which of those facts is being asserted. It also cannot answer “all live Recordings from 2013” or reliably generate a bilingual display label.

## 4. Domain definitions

### What is a Recording version?

A **Recording version identity** is the set of verified intrinsic facts needed to distinguish one fixed recorded performance or audio derivation from other Recordings of the same Work/title. It may state performance mode (live/studio), direct derivation (remix/edit/rerecording), performed language, and event/date context. It does not make the Recording subordinate to an “original” Recording and does not imply that another Arrangement exists.

A remaster, encoding, territory, package, compilation appearance or ordinary single reuse is not a new Recording version identity when the underlying recorded performance/audio identity is unchanged.

### Work, Arrangement and Recording

```text
Work: underlying composition
  Arrangement: musical treatment (future model)
    Recording: fixed performance/audio
      Track: appearance of that Recording on a Release
```

- JLG “Tú” merengue and ballad treatments are different Arrangements and different Recordings.
- A studio performance and a later concert performance may be different Recordings using substantially the same Arrangement.
- A music-video edit of the Asondeguerra concert audio is a different Recording/presentation derived from that concert performance; it does not require a different Arrangement.
- A *Privé* rerecording is a new Recording and generally a new treatment, but this task stores only the Recording facts. Future Arrangement identity remains separate.

## 5. Existing `disambiguation` analysis

Production audit after JLG cleanup:

| Measure | Result |
|---|---:|
| Recording rows | 17,051 |
| Nonblank `disambiguation` | 641 (3.76%) |
| Distinct nonblank strings | 102 |
| SQL type | nullable `text` |
| Constraint/index | none |

Frequent values include `live` (200), `instrumental` (35), `bachata` (25), `bachata version` (21), several `live, YEAR` forms, Spanish/English spelling variants, `radio edit`, `remix`, and language labels. It also contains explicit-content flags, long importer/copyright prose, titles, and likely Arrangement labels. JLG values are predominantly MusicBrainz-derived metadata copied verbatim; `recording_year` is commonly null even when disambiguation contains a year.

Conclusion: `disambiguation` is valuable as human-readable legacy/editorial text but is neither normalized nor semantically singular. Option A is rejected. The recommendation is **Option B plus a small normalized profile**: supplement it now, migrate reviewed facts gradually, and retain it as an optional override/fallback.

## 6. Actual JLG taxonomy mapped to durable facets

| JLG fact | Structured facet | Not stored here |
|---|---|---|
| live concert performance | `performance_kind=live` | Release title/appearance |
| Asondeguerra Tour / stadium / venue | `performance_context`; optional date | artist/release duplication |
| studio rerecording / *Privé* | `performance_kind=studio`, `derivation_kind=rerecording`, optional context | Arrangement claim |
| Portuguese/English performance | `language_code` | translated title unless official |
| remix | `derivation_kind=remix`; optional proven `remix_of` relationship | remixer credit |
| radio/full/music-video edit | `derivation_kind=edit`, concise qualifier in context/override; optional `edit_of` relationship | fake title suffix |
| medley | `derivation_kind=medley` | future multi-Work design |
| alternate take | `derivation_kind=alternate_take` | Release appearance |
| collaboration/duet | derived from `recording_credits` | duplicate collaborator text |
| ballad/pop/salsa/rock treatment | future Arrangement relationship; temporary concise override only if needed | version-type taxonomy |
| original studio master | usually no profile required | `version_type=original` |

## 7. Proposed durable data model

### One-to-one version profile

```sql
CREATE TABLE public.recording_version_profiles (
  recording_id uuid PRIMARY KEY
    REFERENCES public.recordings(id) ON DELETE CASCADE,

  performance_kind text NULL
    CHECK (performance_kind IN ('studio','live','demo','rehearsal','other')),

  derivation_kind text NULL
    CHECK (derivation_kind IN
      ('rerecording','remix','edit','alternate_take','medley','other')),

  language_code text NULL
    CHECK (language_code ~ '^[a-z]{2,3}(-[A-Za-z0-9]{2,8})*$'),

  performance_date date NULL,
  performance_date_precision text NULL
    CHECK (performance_date_precision IN ('year','month','day')),

  performance_context text NULL
    CHECK (performance_context IS NULL OR
           length(btrim(performance_context)) BETWEEN 1 AND 200),

  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),

  CHECK ((performance_date IS NULL) =
         (performance_date_precision IS NULL)),
  CHECK (num_nonnulls(performance_kind,derivation_kind,language_code,
                      performance_date,performance_context) > 0)
);

CREATE INDEX recording_version_profiles_kind_idx
  ON public.recording_version_profiles(performance_kind,derivation_kind);
CREATE INDEX recording_version_profiles_language_idx
  ON public.recording_version_profiles(language_code)
  WHERE language_code IS NOT NULL;
CREATE INDEX recording_version_profiles_date_idx
  ON public.recording_version_profiles(performance_date)
  WHERE performance_date IS NOT NULL;
```

This table is optional. Most ordinary original studio Recordings need no row. Multiple orthogonal facts can coexist: a 2013 live music-video edit is `performance_kind=live` plus `derivation_kind=edit`; a Portuguese studio rerecording is `studio` + `rerecording` + `pt`.

`performance_context` is intentionally constrained free text, not an event database. It carries identity-relevant context such as `Asondeguerra Tour — Estadio Olímpico, Santo Domingo` or `Privé`. Venue/city/tour columns are rejected until repeated cross-catalog requirements justify an Event model.

### Recording derivation relationships

Use the existing `recording_relationships` table only when the source Recording is actually established. Add a controlled check or reference vocabulary for:

```text
edit_of
remix_of
rerecording_of
alternate_take_of
derived_from
```

Do not automatically create `live_version_of` links to the oldest studio Recording. A live performance is a performance of a Work/Arrangement, not necessarily a derivative of a particular studio fixation. `medley` can be profiled now; its future multi-Work membership is a separate problem.

### Why columns rather than a generic tag table

The JLG evidence requires only three orthogonal controlled dimensions plus event/date context. A generic many-tag taxonomy would permit contradictory facts, make dates/context opaque and recreate free-text inconsistency. A single `version_type` would fail on combinations such as live + edit. The one-to-one profile is the smallest enforceable model.

## 8. Structured, derived and editorial information

### Persist as structured facts

- performance kind: studio/live/demo/rehearsal/other, only when identity-relevant and verified;
- derivation kind: rerecording/remix/edit/alternate take/medley/other;
- performed language when verified;
- performance date with precision when known;
- concise event/session context needed to distinguish the performance;
- a proven source-Recording relationship, when applicable.

### Derive

- canonical title: `recordings.title`;
- performer/collaborators: artist ownership plus `recording_credits`;
- representative and all Release appearances: Tracks/Releases, not profile text;
- first-known Release/year: minimum defensible Track/Release chronology, not `recordings.release_id`;
- appearance count: Tracks;
- Work: `recordings.work_id`;
- ISRC evidence and platforms: their existing relations;
- public/admin display label: structured facets + derived Release/credits, with optional disambiguation override.

### Keep editorial/free text

- `performance_context`, because real event/session names do not form a stable small vocabulary;
- `recordings.disambiguation`, as concise exceptional display override or legacy fallback;
- evidence reasoning and uncertainty in assertions/cases/internal notes, not canonical profile columns.

Do not store collaborator names, Release titles, “original,” arrangement style, or evidence prose in the profile.

## 9. Display descriptor policy

Default labels should be generated deterministically and localized from structured facts:

```text
live · 2013 · Asondeguerra Tour
Portuguese version
studio rerecording · Privé
live edit · Asondeguerra Tour
remix
```

If `recordings.disambiguation` contains a reviewed editorial override, use it as the displayed concise descriptor. Otherwise generate the label. During transition, if no profile exists, display the legacy disambiguation verbatim but mark it internally as legacy/unstructured.

Never append the generated label to the stored canonical title. Search result presentation may visually render `title` and descriptor on separate lines.

## 10. Historical/event-specific live performances

Store `performance_kind=live`. Store the most precise verified date with its precision. Add `performance_context` only when it helps identify the event/session. Derive Release titles and years from Tracks. Examples:

- `live`, date `2013-01-01`, precision `year`, context `Asondeguerra Tour — Estadio Olímpico, Santo Domingo`;
- `live`, date `2021-01-01`, precision `year`, context `Entre Mar y Palmeras`.

Two different concerts receive two profiles/Recordings. Full audio and a video edit of the same concert use separate Recordings; the edit also has `derivation_kind=edit` and, when proven, `edit_of` to the full performance.

## 11. Language versions

`language_code` records the language performed in this Recording using a BCP-47-compatible code (`pt`, `es`, `en`, or a justified regional tag). It does not create another Work automatically. Translation/adaptation authorship remains Work/Arrangement credit evidence. The public descriptor can localize `pt` as “Portuguese version.” Do not populate language on the entire catalog merely because a title appears Spanish; add verified facts incrementally.

## 12. Remixes, edits and rerecordings

- remix: `derivation_kind=remix`; add `remix_of` only when the source Recording is proven; remixer stays in credits;
- edit: `derivation_kind=edit`; context or override may say radio, extended or music-video edit; add `edit_of` when proven;
- rerecording: `derivation_kind=rerecording`; usually also `performance_kind=studio` or `live`; `rerecording_of` is optional and must not substitute for the Work link;
- alternate take: `alternate_take`, with source relation if known;
- acoustic/unplugged/ballad/salsa/rock: do not automatically encode as version kind. Those usually describe Arrangement; use a temporary editorial descriptor only until Arrangement architecture exists.

## 13. Compatibility with future Arrangement/Expression

The profile describes how and when a Recording was fixed, not its musical treatment. A future nullable `recordings.arrangement_id` or junction can attach multiple Recordings to one Arrangement without changing this table. Arrangement names must not be migrated into `derivation_kind`. Temporary imported strings such as `bachata version` remain legacy disambiguation until evidence and an Arrangement model can place them correctly.

## 14. Governance integration

Do not create a parallel provenance system. Extend the existing system:

- assertion type/predicate: `recording_version_profile` / `recording.version_identity`;
- typed target: existing `editorial_assertion_recordings`;
- asserted value: complete proposed profile JSON, including explicit nulls where relevant;
- evidence: existing `editorial_assertion_evidence` and `editorial_sources`;
- decision: `set_recording_version_profile` or `clear_recording_version_profile`;
- audit: before/after profile state in `editorial_audit_events`;
- capability: a narrowly named `recording.version.manage` capability, editor-level; independent approval may be required when changing an already verified identity or derivation relationship.

Provide an idempotent SECURITY DEFINER save function following the current governed Work/credit patterns. Direct profile writes by ordinary clients should be revoked; a trigger should reject canonical mutations unless the governed function sets an internal transaction flag. Unresolved findings stay in `editorial_cases` and do not create speculative profiles.

Imported provider disambiguation remains provenance in `recordings.metadata`; ingestion must not automatically promote it into the authoritative profile.

## 15. Admin and search consumption

Architecture only; no UI work is authorized here.

Admin Recording results should eventually receive:

```text
title
generated/override version descriptor
performance date/context
derived earliest defensible Release
appearance count
Work
future Arrangement
performer/featured credits
ISRC evidence
```

Admin search should search structured label terms, language, context and performance date in addition to title/year/ISRC. Platform-link and Track pickers should consume the same projection so an editor never chooses among bare same-title rows.

Create one reusable read projection/RPC (for example `recording_identity_summary`) rather than rebuilding labels independently in every endpoint. It should expose raw structured columns and derived facts; localization/formatting belongs in application presentation code. Index controlled facets/date; use a trigram index on `performance_context` only if query plans justify it.

## 16. Public consumption

Public search and song pages should receive the identity summary. Search renders canonical title separately from a descriptor and Release context. Song pages explain the version, event/session, representative Release, all appearances, credits and platforms. Artist discography Track listings normally retain canonical titles; a descriptor appears where repeated same-title Recordings would otherwise be ambiguous. SEO/JSON-LD should retain the official title and may put version context in description/additional properties rather than falsifying `name`.

## 17. Migration design

No migration was run. Recommended staged migration:

1. create `recording_version_profiles`, constraints, indexes, RLS/grants and audit trigger;
2. constrain or normalize `recording_relationships.relationship_type` only after auditing all environments (production currently has zero rows);
3. add the governed save/clear function and assertions/decisions integration;
4. add an identity-summary view/RPC exposing both structured fields and legacy disambiguation fallback;
5. update types and read paths without changing presentation;
6. dry-run the 67 JLG findings into a reviewed manifest, separating Arrangement-only and unresolved items;
7. populate only verified profile facts through governance;
8. update admin consumers, then public consumers;
9. only after parity, review legacy `disambiguation` values for normalization/cleanup.

Backward compatibility:

- `recordings.disambiguation` remains nullable and available;
- existing imports continue storing raw provider metadata, but must not write profiles;
- existing song/search APIs keep working while the new projection is introduced;
- no dependency on `recordings.release_id` is added;
- profiles cascade only when their Recording is deleted;
- no existing Recording requires a profile row.

## 18. Validation against real JLG cases

| Case | Model result |
|---|---|
| A — original studio vs live | original may have no profile; live has `performance_kind=live`, event/date; same title/Work remain |
| B — multiple lives | each Recording has its own date/context; 2002, 2013 and 2021 performances remain independently identifiable |
| C — language | Portuguese row has `language_code=pt`; Work is not split automatically |
| D — rerecording | *Privé* row: `studio` + `rerecording` + context `Privé`; original unchanged |
| E — remix/edit | remix uses `remix`; music-video cut uses `live` + `edit`, with optional proven source relation |
| F — same arrangement, different Recording | studio and concert rows differ by performance profile while future `arrangement_id` may match |
| G — different arrangement | Recording profiles do not encode merengue/ballad distinction; future Arrangement rows do |
| H — collaboration | Recording remains distinct; featured performers come from `recording_credits`; display may derive “with Sting” |

The model handles all cases without artificial title suffixes or duplicated Release/credit facts.

## 19. Alex Bueno and general compatibility

Alex Bueno is not modified. His known repeated titles, live/studio versions, collaborations, rerecordings, compilation reuse and multiple imported identifiers map to the same orthogonal facets. No field names a JLG tour/project. Before Alex Bueno verification starts, approve and implement the core schema/read projection/governance workflow, then use his existing audit as input and classify manually. Do not wait for all 67 JLG rows to be populated before beginning read-only Alex Bueno research, but the durable model should be available before any Alex Bueno enrichment or cleanup manifest is executed.

## 20. Risks and rejected alternatives

- **Unchanged schema / disambiguation only:** rejected; unqueryable, inconsistent, not localizable, semantically mixed.
- **One `version_type` column:** rejected; cannot express live + edit or language + rerecording.
- **Generic version-tag table:** rejected for now; permits contradictions and over-engineers 67 findings.
- **Event/venue/tour schema now:** rejected; constrained context/date meet demonstrated requirements.
- **Store Release/collaborator names in profile:** rejected; duplicates authoritative relations.
- **Mark every original explicitly:** rejected; creates thousands of low-value assertions and depends on unresolved chronology.
- **Treat arrangement labels as version kinds:** rejected; collapses Work/Arrangement/Recording semantics.
- **Promote MusicBrainz disambiguation automatically:** rejected; provider provenance is not Mangulina editorial authority.

Primary risks are incorrect promotion of legacy text, divergent label generation across clients, and treating incomplete dates as exact. Mitigate through governed manifests, one shared identity projection/formatter, date precision, source evidence and leaving uncertain profiles null.

## 21. Recommended implementation sequence

1. Review and approve this model and vocabulary.
2. Implement schema, governance and rollback migration; do not populate JLG yet.
3. Implement and test the shared identity-summary projection and typed API contract.
4. Build a 67-finding JLG dry-run manifest: structured profile facts, Arrangement-only holdbacks, derived credit facts and unresolved exclusions.
5. Review the manifest; populate governed JLG profiles in a later authorized task.
6. Update Recording Workspace/admin pickers and search, then public search/song presentation.
7. Validate JLG same-title families end to end.
8. Begin Alex Bueno from his existing audit using the reusable verification procedure.
9. Design Arrangement/Expression separately from the preserved 40 findings.

## Decision

**Recording version identity requires a schema change.** Add the optional one-to-one profile above and use existing relationships/governance. Keep `recordings.disambiguation` as an editorial override and legacy fallback; do not treat it as structured authority or delete it now. The 67 JLG findings should next become a reviewed, non-mutating migration manifest and only later be populated through governance. The 40 Arrangement findings remain documented and unpopulated until a separate Arrangement architecture is approved. Before Alex Bueno enrichment or cleanup, implement and validate the core version model; do not start Alex Bueno in this task.
