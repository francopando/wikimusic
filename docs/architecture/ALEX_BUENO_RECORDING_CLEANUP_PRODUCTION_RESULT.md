# Alex Bueno Recording Cleanup — Production Result

## Result

The checksum-locked four-family cleanup executed successfully at 2026-08-13T14:43:24.558Z. Production preflight, the guarded transaction, database postvalidation, and deployed application validation all passed. No deferred family, Version data, Arrangement architecture, Release, or unrelated artist was modified.

## Execution authority

- Manifest SHA-256: `67FA41DE1F2EE290EF087BDA22788291AD7721975133DC7FA7CC24C7E18B81DA`
- Authorized scope: 4 families / 4 redundant Recording UUIDs
- Deferred and preserved: 46 families / 52 candidate rows
- Approval token: `APPROVED_EXACT_4_RECORDINGS`

## Immediate production backup

- Archive: `C:\Mangulina\backups\alex-bueno-recording-cleanup\mangulina-production-immediate-pre-alex-bueno-recording-cleanup-20260813T144132Z.dump`
- SHA-256: `F4DB05D39A025D33512091FBA0C3392259F210FAF388CA46123FE697BAEDC88C`
- Size: 21,137,677 bytes
- PostgreSQL: 17.6
- `pg_restore --list`: passed; 1454 entries

## Exact families

| Title | Survivor | Deleted Recording |
|---|---|---|
| querida | `e2d5035c-c7b2-4232-9d7f-eea89dc65d15` | `98422853-88e0-45c5-b3d2-1c57e083a1c0` |
| que cara mas bonita | `2259621d-d22e-4154-a4a6-0045766e8f96` | `14ae9bfc-acf4-4481-815b-ce0d2955138f` |
| la radio | `6c519ada-7ab7-41da-a8a7-f914116193cf` | `78cbe934-84fe-44d6-8868-28c1987620fb` |
| las hojas verdes de verano | `1f337f6c-153a-4d8d-866b-969f11793e68` | `f73a7575-b9a8-41cb-ac5e-1f46eafd36ea` |

## Production effects

| Measure | Before | After |
|---|---:|---:|
| Global Recordings | 17051 | 17047 |
| Global Tracks | 22716 | 22716 |
| Alex Bueno Recordings | 638 | 634 |
| Alex Bueno Tracks | 839 | 839 |
| Alex Bueno Releases | 84 | 84 |
| Alex Bueno Release Groups | 61 | 61 |
| Platform links | 82198 | 82169 |
| ISRC associations | 4917 | 4913 |
| ISRC provenance rows | 4918 | 4918 |

Tracks repointed: 4; Tracks deleted: 0; duplicate ISRC associations collapsed: 4; provenance rows repointed: 4; exact duplicate platform rows deleted: 29; platform rows moved: 0; Recordings deleted: 4.

## Integrity and protected data

- Dynamic FK check: passed.
- Track placement unchanged: true.
- Deferred candidate rows present: 52.
- Legitimate-distinct Recordings present: 18.
- Arrangement holds present: 111.
- Version profiles / relationships: 53 / 8, unchanged.
- JLG Recordings / profiles / relationships: 327 / 53 / 8, unchanged.
- Orphan Track, platform-link, and ISRC-provenance checks: zero.
- Unvalidated foreign keys: zero.

## Application validation

Deployment: https://mangulina.vercel.app. Artist profile, public search, all four survivor song pages, and all affected Release pages returned valid content. Admin Recording search and Recording Workspace reached their expected authenticated boundary. All four deleted Recording slugs returned 404 after locale normalization. Application validation passed: true.

## Rollback

No rollback was required. The immediate pre-execution archive above is the recovery baseline. If an incident is later discovered, verify its SHA-256, restore first into an isolated compatible environment, compare the four affected Track/dependency graphs, and use a separately approved recovery transaction. Never restore over production ad hoc.

## Stop condition

Cleanup is complete and stops here. The 52 deferred candidates remain untouched. Version-profile population, rerecording relationships, Arrangement architecture, and further platform identity work were not started.
