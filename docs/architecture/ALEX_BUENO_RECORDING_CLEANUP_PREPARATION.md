# Alex Bueno Recording Cleanup Preparation

> **Executed subset:** The separately authorized four-family subset was executed successfully in production on 2026-08-13. See [ALEX_BUENO_RECORDING_CLEANUP_PRODUCTION_RESULT.md](./ALEX_BUENO_RECORDING_CLEANUP_PRODUCTION_RESULT.md). The other 46 families / 52 candidate rows remain deferred and untouched.

## Outcome

Preparation is complete and production remains unchanged. The frozen audit contained 50 families / 56 probable redundant Recording rows. Conservative revalidation approved **4 families / 4 Recording deletions** and deferred **46 families / 52 rows**. Accuracy gates deliberately reduced the executable scope.

Final manifest SHA-256: `67FA41DE1F2EE290EF087BDA22788291AD7721975133DC7FA7CC24C7E18B81DA`. Two independent builds were byte-identical. Both clean-restore rehearsals passed with identical database state.

## Safety boundary

- No production cleanup transaction was executed.
- The 352 unresolved audit rows and 18 legitimate-distinct Recordings remain outside cleanup.
- All 84 Releases, 61 Release Groups, and 111 Arrangement holds are protected.
- No Version profile or Recording relationship was populated or changed.
- Release Track graphs, not legacy `recordings.release_id`, govern appearance preservation.

## Fresh backup

| Field | Value |
|---|---|
| Timestamp | 2026-08-13T14:18:07.536Z |
| Archive | `C:\Mangulina\backups\alex-bueno-recording-cleanup\mangulina-production-pre-alex-bueno-recording-cleanup-20260813T141807Z.dump` |
| Size | 21,137,563 bytes |
| SHA-256 | `3D4BE7C320BB8BA9EEB1358B88F674593F1072DAD3C00C19C715556B68D3D56B` |
| PostgreSQL | 17.6 |
| Validation | passed; 1454 TOC entries |

## Exact proposed production effects

| Effect | Count |
|---|---:|
| Survivors | 4 |
| Redundant Recordings deleted | 4 |
| Existing Tracks repointed | 4 |
| Tracks deleted | 0 |
| ISRC duplicate associations collapsed | 4 |
| ISRC associations moved | 0 |
| Platform links moved | 0 |
| Exact duplicate platform rows deleted | 29 |
| Work / credit / Version / relationship dependencies | 0 |
| Importer candidate rows deleted | 0 |

Expected post-authorization counts: Alex Bueno Recordings **634**, Tracks **839**, Releases **84**, Release Groups **61**; global Recordings **17047**, global Tracks **22716**.

## Approved families

| Family | Title | Survivor | Redundant | Tracks |
|---|---|---|---|---:|
| alex-recording-duplicate-004 | querida | `e2d5035c-c7b2-4232-9d7f-eea89dc65d15` | `98422853-88e0-45c5-b3d2-1c57e083a1c0` | 1 |
| alex-recording-duplicate-006 | que cara mas bonita | `2259621d-d22e-4154-a4a6-0045766e8f96` | `14ae9bfc-acf4-4481-815b-ce0d2955138f` | 1 |
| alex-recording-duplicate-017 | la radio | `6c519ada-7ab7-41da-a8a7-f914116193cf` | `78cbe934-84fe-44d6-8868-28c1987620fb` | 1 |
| alex-recording-duplicate-046 | las hojas verdes de verano | `1f337f6c-153a-4d8d-866b-969f11793e68` | `f73a7575-b9a8-41cb-ac5e-1f46eafd36ea` | 1 |

## Deferred families

Reason totals: UNRESOLVED_PLATFORM_ACTION: 46; REDUNDANT_ROW_HAS_PROTECTED_VERSION_OR_ARRANGEMENT_FINDING: 13; UNRESOLVED_PLATFORM_DESTINATION: 14. A family may have multiple stop reasons.

| Family | Title | Rows | Stop reasons |
|---|---|---:|---|
| alex-recording-duplicate-001 | quien te riza el pelo | 1 | UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-002 | quien te riza el pelo | 3 | REDUNDANT_ROW_HAS_PROTECTED_VERSION_OR_ARRANGEMENT_FINDING; UNRESOLVED_PLATFORM_ACTION; UNRESOLVED_PLATFORM_DESTINATION |
| alex-recording-duplicate-003 | querida | 1 | UNRESOLVED_PLATFORM_ACTION; UNRESOLVED_PLATFORM_DESTINATION |
| alex-recording-duplicate-005 | quiereme | 3 | REDUNDANT_ROW_HAS_PROTECTED_VERSION_OR_ARRANGEMENT_FINDING; UNRESOLVED_PLATFORM_ACTION; UNRESOLVED_PLATFORM_DESTINATION |
| alex-recording-duplicate-007 | que cara mas bonita | 1 | UNRESOLVED_PLATFORM_ACTION; UNRESOLVED_PLATFORM_DESTINATION |
| alex-recording-duplicate-008 | que vuelva | 1 | UNRESOLVED_PLATFORM_ACTION; UNRESOLVED_PLATFORM_DESTINATION |
| alex-recording-duplicate-009 | gotas de pena | 1 | UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-010 | me muero por ella | 1 | UNRESOLVED_PLATFORM_ACTION; UNRESOLVED_PLATFORM_DESTINATION |
| alex-recording-duplicate-011 | me muero por ella | 2 | REDUNDANT_ROW_HAS_PROTECTED_VERSION_OR_ARRANGEMENT_FINDING; UNRESOLVED_PLATFORM_ACTION; UNRESOLVED_PLATFORM_DESTINATION |
| alex-recording-duplicate-012 | me va me va | 1 | UNRESOLVED_PLATFORM_ACTION; UNRESOLVED_PLATFORM_DESTINATION |
| alex-recording-duplicate-013 | mi pobre corazon | 1 | UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-014 | quiero abrazarte tanto | 1 | UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-015 | la prisa | 1 | UNRESOLVED_PLATFORM_ACTION; UNRESOLVED_PLATFORM_DESTINATION |
| alex-recording-duplicate-016 | la prisa | 1 | REDUNDANT_ROW_HAS_PROTECTED_VERSION_OR_ARRANGEMENT_FINDING; UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-018 | un mechon de tu cabello | 1 | UNRESOLVED_PLATFORM_ACTION; UNRESOLVED_PLATFORM_DESTINATION |
| alex-recording-duplicate-019 | yo me ire | 1 | UNRESOLVED_PLATFORM_ACTION; UNRESOLVED_PLATFORM_DESTINATION |
| alex-recording-duplicate-020 | pideme | 1 | UNRESOLVED_PLATFORM_ACTION; UNRESOLVED_PLATFORM_DESTINATION |
| alex-recording-duplicate-021 | una paloma blanca | 1 | UNRESOLVED_PLATFORM_ACTION; UNRESOLVED_PLATFORM_DESTINATION |
| alex-recording-duplicate-022 | los caminos de la vida | 2 | REDUNDANT_ROW_HAS_PROTECTED_VERSION_OR_ARRANGEMENT_FINDING; UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-023 | unicamente tu | 1 | UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-024 | vuelve | 1 | UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-025 | me equivoque | 1 | REDUNDANT_ROW_HAS_PROTECTED_VERSION_OR_ARRANGEMENT_FINDING; UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-026 | otro weekend sin ti | 1 | REDUNDANT_ROW_HAS_PROTECTED_VERSION_OR_ARRANGEMENT_FINDING; UNRESOLVED_PLATFORM_ACTION; UNRESOLVED_PLATFORM_DESTINATION |
| alex-recording-duplicate-027 | quiero conocerte | 1 | UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-028 | quitame la vida | 1 | UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-029 | soy un hombre callejero | 1 | UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-030 | el chofer | 1 | UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-031 | esa mujer | 1 | UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-032 | esa pared | 1 | UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-033 | gigante | 1 | UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-034 | has tenido mil amores | 1 | UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-035 | la mas querida | 1 | UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-036 | la quiero a morir | 1 | UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-037 | lluvia | 1 | REDUNDANT_ROW_HAS_PROTECTED_VERSION_OR_ARRANGEMENT_FINDING; UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-038 | maria del mar | 1 | UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-039 | matame la pena | 1 | REDUNDANT_ROW_HAS_PROTECTED_VERSION_OR_ARRANGEMENT_FINDING; UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-040 | ninguno de los dos | 1 | UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-041 | noche de fantasia | 1 | UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-042 | numero cero | 1 | REDUNDANT_ROW_HAS_PROTECTED_VERSION_OR_ARRANGEMENT_FINDING; UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-043 | que daria yo | 1 | REDUNDANT_ROW_HAS_PROTECTED_VERSION_OR_ARRANGEMENT_FINDING; UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-044 | si volvieras | 1 | UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-045 | tres noches | 1 | UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-047 | pasacantando bolero | 1 | UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-048 | sin ti no soy nada | 1 | UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-049 | solo en el amor | 1 | REDUNDANT_ROW_HAS_PROTECTED_VERSION_OR_ARRANGEMENT_FINDING; UNRESOLVED_PLATFORM_ACTION |
| alex-recording-duplicate-050 | una lagrima por tu amor | 1 | REDUNDANT_ROW_HAS_PROTECTED_VERSION_OR_ARRANGEMENT_FINDING; UNRESOLVED_PLATFORM_ACTION |

Unresolved/protected platform links remain on their undeleted Recordings. No URL was moved merely because its Recording was a duplicate candidate.

## Dependency snapshot and production preflight

The generator dynamically enumerated every current foreign key to `recordings`. Approved-row dependencies are: recording_isrcs.recording_id=4, recording_platform_links.recording_id=29, tracks.recording_id=4. Governance, analytics, Work, credit, Version-profile, and Recording-relationship dependencies are zero. Production preflight passed at 2026-08-13T14:27:06.236Z; UUIDs, Track and Release mappings, ISRCs, platform actions, and dependency counts matched the checksum-locked manifest.

## Rehearsals

Both runs restored the fresh backup into PostgreSQL 17.10 with TCP disabled and a workspace-local Unix-domain socket. The only restore warnings were six known production-only `cron`/`vault` objects.

| Check | Run 1 | Run 2 |
|---|---:|---:|
| Passed | true | true |
| Alex Recordings | 638 → 634 | 638 → 634 |
| Alex Tracks | 839 → 839 | 839 → 839 |
| Releases / Groups | 84 / 61 | 84 / 61 |
| Track placement hash stable | true | true |
| Arrangement holds present | 111 | 111 |
| Deferred redundant rows present | 52 | 52 |

## Application-level validation preparation

After separate production authorization, test all approved survivor pages and affected Release appearances; the largest repeated-title family (`quien te riza el pelo`) as a deferred control; compilation/original-album reuse; Profile-ready/rerecording controls; an Arrangement-held family such as `lluvia`; provider-heavy deferred conflicts; same-ISRC cases; and multi-Release survivors. Exact UUIDs, Track IDs, Release IDs, and expected mappings are in the manifest. No UI modification is required.

## Rollback procedure

No rollback is required now. For a future authorized transaction, execute in one transaction with fail-closed row-count checks and `ROLLBACK` on mismatch. For a committed incident, first verify the backup checksum and restore only into an isolated compatible environment; compare the affected Track/dependency graph, then follow a separately approved recovery procedure. Never restore over production ad hoc.

## Stop condition

Preparation stops here. The proposed 32 Version profiles and 27 rerecording relationships remain unpopulated. Arrangement/Expression architecture remains separate. Production execution requires separate authorization.
