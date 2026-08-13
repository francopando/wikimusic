# JLG Pre-Launch Recording Cleanup Plan

**Status:** production execution completed and validated on 2026-08-12 EDT. The exact approved 43-pair manifest was applied; no broader cleanup was performed.

See [JLG_RECORDING_CLEANUP_PRODUCTION_RESULT.md](./JLG_RECORDING_CLEANUP_PRODUCTION_RESULT.md) for the execution record. Metadata enrichment, Arrangement architecture, `recordings.release_id` redesign, unresolved cases, Alex Bueno, and all other artists remain out of scope.

## Scope and authority

The editorial authority is [JLG_MANUAL_VERIFICATION_FINAL.md](./JLG_MANUAL_VERIFICATION_FINAL.md) plus reports 01–13. Cleanup is restricted to the 43 reviewed survivor/redundant mappings in `manifests/jlg-recording-cleanup-manifest.json`. The thirteen unresolved relationships are excluded. MusicBrainz is not an identity decision source.

## Backup and restore status

| Field | Value |
|---|---|
| Backup timestamp | 2026-08-10 23:25:30 EDT (archive header) |
| Path | `backups/jlg-audit/mangulina-production-full-20260810T232529-0400.dump` |
| Size | 20,932,144 bytes |
| SHA-256 verified 2026-08-12 | `D94C5AA618F627B9A5C6045F3236C1C98F2F15FD06357E1CD0ABD7FE7E1AFD42` |
| Source/restore version | PostgreSQL 17.6 / isolated PostgreSQL 17.10 |
| Restore environment | `C:\Mangulina\.tmp\jlg-rehearsal-pg17`, database `jlg_rehearsal`, localhost port 55432 |
| Restore verification | 17,094 Recordings, 22,756 Tracks, 593 artists; JLG 370 Recordings/1,452 Tracks before cleanup |

The archive is usable for the catalog rehearsal. Local PostgreSQL lacks Supabase-only `pg_cron`, `hypopg`, `index_advisor`, and `supabase_vault`; their scheduler/advisory/vault objects were excluded from the restore list. Core public catalog tables, data, constraints and JLG dependencies restored. This limitation does not affect Recording/Track/Release identity rehearsal, but the environment is not a full Supabase service-stack substitute. A fresh full backup is mandatory immediately before any later production execution because this backup predates that execution.

## Deterministic manifest

The machine-readable manifest contains exactly 43 pairs, full UUIDs, evidence-report references, duplicate type, all 46 redundant-row Tracks, Release positions, platform rows and actions, ISRC/source counts, credit/Work status, other dependent-row counts, and final action. Identity is never inferred by the executor.

Observed dependent tables on the 43 redundant rows were:

- `tracks`: 46 legitimate appearances, all repointed;
- `recording_platform_links`: redundant or unverified duplicate-context links, deleted;
- `recording_isrcs`: migrated to the survivor unless already present, with provenance reassigned before duplicate association deletion;
- `apple_recording_candidates`: importer/reconciliation clutter, deleted.

No redundant row had a Recording credit, Work relationship, credited-work link, source relationship, editorial case, redirect, media row, cultural annotation, or meaningful analytics dependency in the restored backup. The production executor rechecks row existence, artist scope and Work conflicts and aborts transactionally on drift.

## Rehearsal result

| Validation | Before | After | Result |
|---|---:|---:|---|
| JLG Recording rows | 370 | 327 | 43 reviewed redundancies removed |
| JLG Track rows | 1,452 | 1,452 | unchanged |
| JLG Releases represented | 146 | 146 | unchanged |
| All Recording rows | 17,094 | 17,051 | exactly −43 |
| All Track rows | 22,756 | 22,756 | unchanged |
| JLG Release-by-Release Track counts | snapshot | identical snapshot | passed |
| Redundant UUIDs remaining | 43 | 0 | passed |
| Distinct survivor UUIDs missing | 0 | 0 | passed |
| Unvalidated foreign keys | 0 | 0 | passed |

Machine-readable result: `docs/architecture/JLG_RECORDING_CLEANUP_REHEARSAL_RESULT.json` (`passed: true`). The duplicate rows naturally cease to be searchable/addressable because they no longer exist; canonical rows retain the repointed Release appearances. Legitimate version rows and all unresolved rows are outside the manifest and remain present. Database-level artist-discography and Release integrity passed. Full browser/service-stack testing must be repeated against a Supabase-compatible staging deployment before production because the local restore intentionally omits Supabase scheduler/vault/advisory extensions and auth services.

## Production executor and safeguards

The exact executor is `scripts/executeJlgRecordingCleanup.mjs`. It:

1. refuses to run without `ALLOW_JLG_PRODUCTION_CLEANUP=APPROVED_43_PAIR_CLEANUP`;
2. requires exactly 43 manifest pairs;
3. verifies the production baseline is still 370 JLG Recordings and 1,452 Tracks;
4. row-locks both sides and verifies both belong to the two JLG artist UUIDs;
5. aborts on conflicting Work links;
6. repoints Tracks and reconciles ISRC provenance;
7. deletes redundant platform/importer clutter and the redundant Recording;
8. requires the final 327/1,452 postcondition; and
9. rolls back the entire transaction on any error.

Do not run it yet. After explicit approval and a fresh verified backup, the controlled command is:

```powershell
$env:ALLOW_JLG_PRODUCTION_CLEANUP='APPROVED_43_PAIR_CLEANUP'
.\node_modules\.bin\tsx.cmd scripts\executeJlgRecordingCleanup.mjs
```

The approval token authorizes only the fixed manifest; it does not authorize any additional pair, unresolved case, Alex Bueno row, schema change or metadata redesign.

## Rollback procedure

Before commit, executor errors issue `ROLLBACK`. After a successful commit, stop writes, restore the fresh pre-execution custom-format backup to a new Supabase-compatible database, validate its checksum and 370/1,452 JLG baseline, then perform controlled project/database cutover. Do not attempt ad-hoc reinsertion of 43 deleted graphs. Keep the pre-execution backup until post-production validation and sign-off are complete.

## Unresolved cases excluded

The thirteen excluded families remain exactly as documented: “Si tú te vas”; shortened “Tú”; two “Visa para un sueño” relationships; three “Ojalá/La bilirrubina” collection/tour relationships; “De tu boca”; “Bachata rosa”; “Frío, frío” collection mechanism; *La llave* enhanced video; and “Mi bendición” enhanced media. The separate “Visa” Track-assignment defect also remains outside this cleanup. Aligned release-specific audio or primary master documentation is required.

## Remaining metadata work

- Add structured descriptors for the 67 live/event, language, *Privé*, remix, medley, collaboration, edit and rerecording findings without corrupting canonical titles.
- Preserve the 40 arrangement findings for later Work/Arrangement/Recording architecture; do not build that architecture in this cleanup.
- Review platform contamination on legitimate version rows independently of duplicate deletion.
- Treat `recordings.release_id` as a display/import pointer until first-known, representative-display and Track/Release semantics are separated.
- Improve Work-, Arrangement- and Recording-scoped credits and source provenance from the album reports.

## Post-approval validation checklist

Re-run manifest drift inventory; verify the fresh backup; execute once; confirm 327 JLG Recordings, 1,452 Tracks and 146 Releases; compare every Release tracklist; validate ISRC/source and credit/Work graphs; verify no unrelated artist changed; exercise search, canonical song pages, legitimate version pages and JLG artist/discography views in the deployed stack; archive output and checksum. Stop and restore on any mismatch.

## Next artist

After JLG production cleanup is explicitly approved, executed and validated, run the reusable process in [ARTIST_RECORDING_CATALOG_VERIFICATION_AND_CLEANUP.md](./ARTIST_RECORDING_CATALOG_VERIFICATION_AND_CLEANUP.md) for **Alex Bueno**, beginning with his existing catalog audit. No Alex Bueno data was touched here.
