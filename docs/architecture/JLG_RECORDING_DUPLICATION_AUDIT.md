# Juan Luis Guerra Recording Duplication Audit

**Production snapshot:** 2026-08-10 23:25–23:50 America/New_York  
**Mode:** verified backup followed by read-only production queries and repository-history inspection  
**Scope:** Juan Luis Guerra / Juan Luis Guerra 4.40 pilot only  
**Production mutations:** none

## Executive summary

| Measure | Production result |
|---|---:|
| JLG/JLG 4.40 artist entities analyzed | 2 (1 published, 1 retired duplicate) |
| Current JLG performed Recording rows | 370 |
| Normalized title groups | 242 |
| Single-occurrence title groups | 177 |
| Repeated-title review groups | 65 |
| Track appearances | 1,452 |
| Releases reached through Tracks | 146 |
| Recordings already reused across multiple Releases | 208 |
| Confirmed same-Recording clusters | 0 |
| Confirmed redundant Recording rows | 0 |
| Probable same-Recording pair clusters | 12 |
| Probable redundant Recording rows | 12 |
| Confirmed-only estimated canonical count | 370 |
| Confirmed-only canonical-row reduction | 0% |

The database proves that Mangulina does **not** uniformly create one Recording per Release: 208 JLG Recording rows already have Tracks on multiple Releases. The fragmentation mechanism is narrower and well evidenced. Historical MusicBrainz ingestion upserted `recordings` on MusicBrainz Recording MBID and treated that source identifier as identity. When MusicBrainz reused one Recording MBID, Mangulina reused one row; when MusicBrainz supplied different Recording MBIDs for what may be the same master, Mangulina created separate canonical rows. The historical importer also copied one observed Release into `recordings.release_id`, reinforcing a misleading single-release association.

The production evidence does **not** support an authoritative merge today. Every JLG row has a distinct MBID; no JLG row has a Work link; only 5 of 370 have Recording credits; and no audio fingerprints, label master identifiers, session evidence, or editorial identity decisions are present. Twelve pairs are strong editorial candidates because title and duration coincide (or nearly coincide) without an explicit distinguishing descriptor. They remain `PROBABLE SAME RECORDING`, not approved merges.

## 1. Backup and recovery

| Item | Result |
|---|---|
| Method | PostgreSQL 17 `pg_dump`, custom archive, compression level 9 |
| Environment | configured Mangulina production Supabase PostgreSQL project (`srulenjahemkuxtkfmzt`) |
| Timestamp | 2026-08-10T23:26:05-04:00 |
| Location | `backups/jlg-audit/mangulina-production-full-20260810T232529-0400.dump` (gitignored, local workspace) |
| Size | 20,932,144 bytes (19.96 MiB) |
| SHA-256 | `D94C5AA618F627B9A5C6045F3236C1C98F2F15FD06357E1CD0ABD7FE7E1AFD42` |
| Archive validation | `pg_restore --list` succeeded: 1,873 TOC entries; 131 table-data entries; 385 functions; 93 policies; 40 triggers; 159 foreign keys |
| Restore test | Archive opened and restore began successfully in an isolated PostgreSQL 17 cluster. It stopped at `CREATE EXTENSION pg_cron` because local PostgreSQL lacks the Supabase `pg_cron` extension. No archive-corruption error occurred. |

The dump includes schemas, data, functions/RPCs, views, materialized-view definitions if present, triggers, indexes, constraints, foreign keys, sequences, RLS policies, default privileges, and the managed `auth`, `storage`, `realtime`, `cron`, `vault`, and `public` schemas visible to the database role. Storage object **metadata** is included; binary objects stored outside PostgreSQL are not. Supabase infrastructure roles/cluster settings and provider-managed extension binaries are not portable database objects.

Restore procedure: provision a compatible Supabase/local environment with the archive's extensions (at minimum `pg_cron`), verify the checksum, create an empty database, and run `pg_restore --clean --if-exists --no-owner --no-privileges --dbname=<isolated-db> <archive>`. Restore role grants separately where the target role topology differs. Validate row counts, functions, policies, and extension-dependent jobs before use. Never restore over production.

## 2. Artist identity scope

| UUID | Name | Status | Type | MusicBrainz artist MBID | Treatment |
|---|---|---|---|---|---|
| `10034596-47cb-46ba-9e80-9ea319a2c0df` | Juan Luis Guerra 4.40 | published | solo_artist | `c3dcad1b-1380-4a94-98d8-3f8272f19df6` | canonical performed-recording scope |
| `9761143c-4e04-4590-8fa7-fe82674a6cf7` | [MERGED] Juan Luis Guerra & 4.40 | duplicate | group | `1659a41f-27d3-4823-8a15-bf7cd295cf59` | included defensively; no separate active identity |

The published row carries aliases including “Juan Luis Guerra Seijas,” “Juan Luis Guerra & 440,” and “440.” Four `member_of` relationships point to it (Roger Zayas-Bazán, Adalgisa Pantaleón, Janina Rosado, and Maridalia Hernández). Those relationships do not make a member's solo Recording a JLG Recording. The inventory scope is `recordings.artist_id` in the two IDs above, supplemented by performer-credit checks; Work authorship and `work_credits` are explicitly excluded as performer evidence.

## 3. Current architecture and root cause

The intended ontology is correct: Work = composition; Recording = audio/performance identity; Track = its occurrence on a Release. Production partly implements it: the original JLG studio “Ojalá que llueva café” row has 24 Track appearances on 24 Releases.

Historical commit `1f32cd3` contains the decisive ingestion behavior:

- `upsertRecording()` wrote `recordings` with `onConflict: "mbid"`.
- `upsertTrack()` wrote a separate Track keyed by MusicBrainz track MBID and pointed it at that Recording.
- an older importer fetched a Recording's first Release and wrote it to `recordings.release_id`.

Therefore the system equated MusicBrainz Recording identity with Mangulina canonical identity. Different source MBIDs were never routed through an editorial match/create/review decision. This is why all 370 JLG rows have MBIDs, while 65 title groups repeat and 0 rows have Work links.

`recordings.release_id` exists and is populated on all 370 rows. For all 370 it equals one actual Track release, yet 208 rows occur on multiple Releases, proving that the column cannot mean “the Recording's Release.” It currently acts as a canonical-display/import-context release. `recordings_with_release_info`, song-page cover/album metadata, and historical reassignment code depend on it. It must not be dropped before those consumers gain an explicit editorial original/first-known/display-release model.

## 4. Inventory and candidate methodology

All counts use accent-insensitive, punctuation-normalized titles. Candidate signals were title, performer, duration, descriptor, MBID, ISRC overlap, Track/Release chronology, and platform identifiers. No signal was treated as dispositive.

The 65 repeated groups contain 193 Recording rows (370 total minus 177 singletons). The largest are: “Ojalá que llueva café” 8; “La bilirrubina” 7; “La llave de mi corazón” 7; “Visa para un sueño” 6; and nine groups with 4–5 rows. Different durations and explicit live/language/duet descriptors show that many are true versions, not redundant release appearances.

### Probable same-Recording queue

These 12 pairs have matching normalized title, matching or sub-second duration, no explicit distinguishing descriptor on the pair, and distinct MBIDs. They require editorial/audio review.

| Song | Recording A | Recording B | Durations ms | Classification | Proposed action |
|---|---|---|---:|---|---|
| Cantando bachata | `10f7b0dc-929d-4b36-8e97-febe0a64ff24` | `b2a70d7c-1405-4a6c-8f7e-f0a5e828f9ee` | 179000 / 179000 | PROBABLE SAME | compare audio/source masters |
| Corazón enamorado | `321d32c8-7bda-4ce9-b305-276034f795fc` | `68f0a8b2-bfa4-46f7-908e-42e7e919e6fd` | 189000 / 189000 | PROBABLE SAME | editorial review |
| El primer baile | `01c21d55-9369-4e73-988f-8fc98d114ea1` | `920ec664-b777-46ab-b591-d0f81622dd11` | 211000 / 211000 | PROBABLE SAME | editorial review |
| I Love You More | `10f90a51-ba8c-4ca1-a7d0-9ff28f31b368` | `ddc15f58-c12a-4300-9489-87c1be88b61e` | 196000 / 196000 | PROBABLE SAME | editorial review |
| Kitipun | `0ca87f5e-8706-4279-b258-480a3ab0f1a5` | `3bccc59f-1abf-43ce-8370-18989a8635fd` | 215000 / 215000 | PROBABLE SAME | editorial review |
| Lámpara pa' mis pies | `5fc83e9c-f274-4422-b78b-8d9cbe4cee2e` | `8a6801fd-04b8-48d3-843b-2cfcbbdc3529` | 180000 / 180000 | PROBABLE SAME | editorial review |
| Ma' pa'lante vive gente | `c963c383-0859-485d-b6e3-e139b56d6131` | `e0fba189-3cd0-439b-980e-b6f0dc1b07e9` | 199000 / 199000 | PROBABLE SAME | editorial review |
| Me preguntas | `3f742ff6-2ccc-465e-b45e-acc7e8bc7a7d` | `e9b118be-c9e5-425c-ab94-1801f3c5e59e` | 183000 / 183000 | PROBABLE SAME | editorial review |
| Medicine for My Soul | `3e8ec754-1521-4eb8-8a97-205e53fef109` | `5bd5a921-7b33-40ca-b7ff-c92c4c085432` | 196000 / 196000 | PROBABLE SAME | keep separate from explicit duet row |
| Merengue de cuna | `e17aec1a-fe36-4d39-bf97-616b729df323` | `f8b0c915-501d-4f76-a7a9-a976d3a72152` | 123000 / 123000 | PROBABLE SAME | editorial review |
| No tiene madre | `1cb6b529-c0f3-4668-b46d-df4f38679b96` | `334cb949-21d7-4304-a26b-c133a378bc30` | 203000 / 203000 | PROBABLE SAME | editorial review |
| Son a mamá | `0c938c4c-74c3-4fb3-9a5a-d011b5b7af3c` | `1f921fe1-db15-4ce4-8b26-1a619a49b072` | 184000 / 184000 | PROBABLE SAME | editorial review |

No pair is `SAFE / HIGH CONFIDENCE` on database evidence alone. The remaining repeated groups are `KEEP SEPARATE` where descriptors/chronology clearly identify versions, otherwise `DATA QUALITY / UNCERTAIN`. Particularly, shared ISRCs do not authorize merging: “La llave de mi corazón” shares an ISRC with an explicit Portuguese version; “Medicine for My Soul” shares one with an explicit duet; “Mambo 23” shares one across a 19.9-second duration difference.

## 5. Ojalá que llueva café identity family

There are 9 global normalized-title rows: 8 JLG-performed and 1 Maridalia Hernández performance. There are 0 linked Works, so the database cannot yet show a reliable Work family.

| Recording ID | Performer | Duration | ISRC(s) | MBID | Release context | Tracks | Classification / action |
|---|---|---:|---|---|---|---:|---|
| `c876180c-1079-47ee-ae2d-b8cd525b5eb8` | JLG 4.40 | 252973 | `QMDA72594641`, `USJ3V1861930`, `USJ3V1862530` | `23537b75-fbd9-4224-b6f1-c41d37d2a830` | original album plus compilations/reissues | 24 | original studio; strongest survivor for this performance |
| `5a5857a1-4542-49b2-9eb1-3353690f5b38` | JLG 4.40 | 226000 | none | `c668f309-ceaa-4614-a52b-6578fea7a091` | The Collection (2000), title override says en vivo | 1 | KEEP SEPARATE live |
| `de56973b-8847-4117-abbc-1ab25b66da18` | JLG 4.40 | 241000 | none | `553ead6b-9f08-4b81-b3d7-a17e82f49242` | Encuentro (2002) | 1 | KEEP SEPARATE live |
| `62c7b849-d0f5-4155-9b95-39a7dc18486e` | JLG 4.40 | 240653 | `USJ3V1862570` | `037ec370-621e-4cd6-a99e-2f5c520687e0` | Bonus Tracks (2010) | 1 | UNCERTAIN; close to 2002 live row but no proof |
| `9c660568-2be6-40a0-85f0-0d01dad2d45b` | JLG 4.40 | 323546 | `USEL11200160` | `c5c40b6c-bc5a-4706-8abb-5c6600332f1d` | A son de Guerra tour editions | 4 | KEEP SEPARATE live performance |
| `046d05d8-136c-4340-ab58-eccd2e50c507` | JLG 4.40 | 302677 | none | `1686c3a4-56e9-4bed-b62d-add2b0e3989d` | same tour release group, different track position/duration | 2 | UNCERTAIN alternate tour performance/edit |
| `e4328af1-b33d-4c6f-b2c2-165bf383b850` | JLG 4.40 | 232000 | `QM8962100083` | `2d78eb88-2f8a-402d-b021-b08db3760668` | Entre mar y palmeras (2021), two editions | 2 | KEEP SEPARATE 2021 live |
| `3f51c25b-8ff1-47b8-91d7-63ba1c0232ba` | JLG 4.40 | 224122 | `QMDA62311138` | `db127e29-a17f-40d5-81a7-c70476c84b17` | Concierto aniversario (2023) | 1 | KEEP SEPARATE concert performance |
| `ba7130f9-687f-48bc-84c0-3a6c22e300c3` | Maridalia Hernández | 272000 | none | `23707fd8-a8ae-48a9-b49a-f48d636d0f56` | Te ofrezco (1992) | 1 | OTHER PERFORMER; never JLG profile |

The original studio row's 24 Tracks preserve the original album, Antología, multiple Grandes éxitos editions, 32 serie, Universo latino, Quisiera ser un pez, and later collections. Those are correct release appearances, not duplicate Recordings. None of the nine rows has Recording credits or recording-view events; all JLG rows have 3–7 platform links and Maridalia has 5. The family has 52 platform rows, each URL unique within its Recording/platform. There is no `Privé`-identified Ojalá row in production.

## 6. ISRC, MBID, platform, credit, Work, and analytics findings

- ISRC coverage: 91 JLG rows have zero normalized ISRCs, 219 have one, and 60 have multiple. Multiple ISRCs are legitimate evidence collections, not identity violations.
- MBID coverage: all 370 have one MBID and all repeated rows have different MBIDs. This reflects the importer key, not proof of different audio.
- Platform links: 1,934 rows across 8 platforms; 1,445 unique URLs and 489 repeated Recording/platform URL rows. Platform ingestion created operational duplication that must be reconciled per survivor while preserving release/source evidence.
- Recording credits: only 5 credits across 5 Recordings. The JLG catalog is overwhelmingly incomplete, so absence/equality of credits cannot drive identity. Future consolidation must union complementary credits and send conflicts to governance.
- Works: 0 of 370 Recordings has `work_id`. Recording identity review must precede Work linking; Work duplication remains unmeasurable from these rows.
- Analytics: two Recording counter views and two event rows total. Event rows should be repointed; counters should be recomputed from events where possible, not blindly summed.

## 7. Dependency and deletion safety map

Production has 25 direct foreign-key paths from Recording. Cascading references include Tracks, credits, lyrics, translations, cultural notes, expressions, platform links, editorial content, fun facts, sources, relationships, media, locations, view/click events, and Apple candidates. Restricting references include credited works, normalized ISRCs, editorial assertion/case targets, and redirects.

For every future duplicate: repoint Tracks; migrate ISRCs with `recording_isrc_sources`; reconcile credits/platforms; preserve sources/media/editorial data; repoint event-level analytics; create `recording_redirects`; attach the merge decision/assertions/evidence/case; validate both sides of `recording_relationships`; and only then retire/delete. A raw delete would cascade legitimate history and is prohibited.

The existing governance schema is suitable: `editorial_cases` groups review, assertions state identity claims, evidence links sources, decisions authorize the result, `editorial_audit_events` records before/after state, and `recording_redirects` preserves old identifiers. Obsolete rows need not remain active forever: after rehearsal and approval, hard deletion is reasonable **only** after a decision, redirect/tombstone mapping, complete migration manifest, and durable audit history exist.

## 8. Search and song-page implications

Public song pages are Recording-driven. `getSongBySlug()` resolves `recordings.slug`, then `getSongById()` reads `recordings_with_release_info`; the page emits one MusicRecording JSON-LD object, tracks analytics by `recording_id`, and uses `recordings.release_id` for cover/album metadata. The sitemap likewise enumerates Recording slugs. Thus every active Recording row can generate a separate result/page.

Correct consolidation naturally removes duplicate identities; frontend `GROUP BY title` would conflate live/rerecorded/other-performer versions and is forbidden. Before deletion, `getSongBySlug`/UUID resolution must consult `recording_redirects` so historical UUID URLs and slugs issue permanent redirects to the canonical survivor. Canonical SEO and JSON-LD must use the survivor and an explicitly selected display release.

## 9. JLG-only future cleanup sequence (not executed)

1. Install identity-resolution ingestion gates before changing data.
2. Open one governance case per candidate cluster and attach source/audio evidence.
3. Approve a canonical survivor and explicit original/first-known/display release.
4. Rehearse against a compatible restored backup; record before counts.
5. Migrate Work links and Work evidence without collapsing Works implicitly.
6. Repoint Tracks; verify all 1,452 JLG Track positions and 146 Releases remain.
7. Union normalized ISRCs and preserve every source row.
8. Reconcile credits, platforms, sources, media, editorial content, and relationships.
9. Repoint event-level analytics; recompute counters/rollups.
10. Create redirect/history records for every retired UUID/slug.
11. Validate artist profile, release pages, search, song pages, sitemap, SEO/JSON-LD, credits, links, and analytics.
12. Retire/delete only approved redundant rows, then run FK and unrelated-catalog checks.
13. Test rollback from the same backup and migration manifest.

## 10. Prevention architecture

Ingestion must separate source observations from canonical decisions. A new Track/Release/MBID/ISRC/platform URL first becomes evidence. A resolver generates candidates using performer, Work, title, duration, descriptors, chronology, MBIDs, ISRCs, platform IDs, and source relationships, then returns exactly:

- `MATCH EXISTING RECORDING` — only under an approved deterministic/editorial decision;
- `CREATE NEW RECORDING` — affirmative evidence of a distinct performance/version;
- `POSSIBLE MATCH — EDITORIAL REVIEW REQUIRED` — weak or conflicting evidence.

Different MBID, ISRC, URL, or Release must never force `CREATE`; equality of any one must never force `MATCH`. Store source identifiers/provenance many-to-one around the canonical Recording. Make Track the only required Release occurrence. Replace ambiguous `recordings.release_id` usage with governed original/first-known/display-release assertions before eventually making the legacy column non-authoritative.

## 11. Validation, risks, unresolved questions, and global lessons

The rehearsal must compare before/after Recording and Track counts, Track signatures, all 146 JLG Releases, Works, credits, ISRC/source counts, platform destinations, profile/search/page output, redirects, analytics, governance history, FKs, rollback, and a hash/count sample of unrelated artists.

Unresolved evidence needs are audio fingerprints or waveform comparisons, label/master documentation, MusicBrainz edit histories and relationships, primary-release liner notes, and editorial confirmation of the 12 probable pairs and ambiguous live/tour edits. The local restore limitation (`pg_cron` unavailable) must be removed before cleanup rehearsal.

The JLG pilot teaches that source IDs belong to evidence, not canonical ontology; `recordings.release_id` mixes identity with presentation; platform and analytics data multiply the cost of a late merge; and conservative review produces fewer “confirmed” deletions than title matching suggests. No cleanup, merge, schema change, ingestion change, redirect, or UX change was executed in this audit.
