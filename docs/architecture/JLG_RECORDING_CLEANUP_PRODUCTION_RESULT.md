# JLG Recording Cleanup — Production Result

**Result:** completed successfully · **Production commit:** 2026-08-12 20:18:20 EDT (2026-08-13 00:18:20 UTC) · **Scope:** exact approved 43-pair manifest only.

## Fresh rollback backup

| Field | Value |
|---|---|
| Created | 2026-08-12 20:15:31–20:16:09 EDT |
| Path | `C:\Mangulina\backups\jlg-production-cleanup\mangulina-production-pre-jlg-cleanup-20260812T201531-0400.dump` |
| Size | 21,275,130 bytes |
| SHA-256 | `014C3A23DFB64D3611A73289B1B9D13314CE23D96AA524C77E3BC2526761E232` |
| Source PostgreSQL | 17.6 |
| Validation | `pg_restore --list` passed; TOC saved beside archive |

## Preflight

Manifest SHA-256: `1F85C6C32A33500115718360B12BB9A28C159CDA3C2DDBF41F08B5BFDBD0A64D`.

Production matched the approved assumptions: 370 JLG Recordings, 1,452 Tracks, 146 represented Releases, 43 redundant UUIDs, 42 distinct survivors, and 46 Tracks to repoint. Every row remained in the two authorized JLG artist scopes. No Work conflict, mapping drift, unexpected FK dependency, or manifest-count change was found. The preflight used a read-only transaction and passed with zero failures.

## Transaction result

| Measure | Before | After / action |
|---|---:|---:|
| JLG Recording rows | 370 | 327 |
| JLG Track rows | 1,452 | 1,452 |
| JLG Releases represented | 146 | 146 |
| All Recording rows | 17,094 | 17,051 |
| All Track rows | 22,756 | 22,756 |
| Redundant Recordings deleted | — | 43 |
| Legitimate Tracks repointed | — | 46 |
| Redundant/misleading platform rows deleted | — | 241 |
| Apple importer-candidate rows deleted | — | 4 |
| Unique ISRC associations migrated | — | 2 |
| Duplicate ISRC associations removed | — | 1 |
| ISRC source/provenance rows repointed | — | 1 |

All actions occurred in one transaction. The executor locked and scope-checked every pair, reconciled Track and ISRC dependencies, removed approved child clutter, deleted only the 43 manifest rows, verified postconditions, and committed. A first launch attempt stopped before connecting because `.env` was not loaded; adding `dotenv/config` was the only correction, and no production mutation occurred in that failed attempt.

## Database post-validation

- all 43 redundant UUIDs absent;
- all 42 distinct canonical survivors present;
- all 1,452 legitimate JLG Tracks still resolve;
- all 146 represented Releases remain;
- Track IDs, Release IDs, disc numbers, positions, and track numbers are identical to the pre-transaction snapshot;
- all 15 Recording rows participating in the 13 documented unresolved relationships remain;
- eight representative legitimate live/language/remix/collaboration version rows remain;
- zero unvalidated foreign keys;
- zero orphan `recording_isrc_sources`;
- zero orphan Recording credits;
- zero invalid Recording→Work links;
- global Track count unchanged and global Recording delta exactly −43, supporting that no unrelated artist Recording changed.

Machine-readable records:

- `docs/architecture/JLG_RECORDING_CLEANUP_PRODUCTION_PREFLIGHT.json`
- `docs/architecture/JLG_RECORDING_CLEANUP_PRODUCTION_RESULT.json`
- `docs/architecture/JLG_RECORDING_CLEANUP_PRODUCTION_POSTVALIDATION.json`

## Deployed application validation

The deployed application at `https://mangulina.vercel.app` was tested after commit.

- JLG artist profile loaded normally with biography, awards, release-type tabs, and discography.
- Main album pages retained their exact programs, including *Mudanza y acarreo* (8), *Literal* (11), and *Asondeguerra Tour* (14).
- Search for “Kitipun” returned exactly the legitimate 2019 studio Recording and distinct 2021 live Recording, plus the release; the redundant physical-edition song result is gone.
- The 2019 studio page retained its *Literal* context, ISRC `QM8961900048`, duration and seven commercial platform destinations.
- The distinct 2021 live page retained *Entre mar y palmeras* context, ISRC `QM8962100073`, different duration and live-specific platform destinations.
- Representative compilation/reissue and tour Track listings remained intact.
- No browser console errors were observed during validation.

The application naturally reflects canonical entities without UI grouping or search workarounds.

## Warnings and remaining work

Local backup storage is the immediate rollback artifact; retain it until sign-off. The thirteen unresolved relationships remain untouched. No version/disambiguation enrichment, arrangement implementation, platform cleanup outside redundant rows, `recordings.release_id` redesign, schema change, Alex Bueno work, or other-artist mutation was performed.

## Stop

The authorized JLG destructive cleanup is complete and validated. Work stops here pending review.
