# JLG Release Cleanup

**Status:** stopped at production preflight; no production mutation occurred.

## Approved scope

The requested scope was exactly four verified redundant Releases: the Spain 1995 *Grandes éxitos* row, the duplicate 2013 *Frío, frío* product manifestation, the duplicate *Todo tiene su hora* CD row, and the duplicate 2019 digital *Literal* row. The unresolved Release families, both legitimate *Fogaraté!* editions, every Release Group, every Recording, Recording Version data, Recording relationships, other artists, and Alex Bueno remained excluded.

## Fresh backup

The full production backup completed before preflight. The PostgreSQL 17.6 custom archive is `backups/jlg-release-cleanup/mangulina-production-pre-jlg-release-cleanup-20260812T234300-0400.dump`, size 20,809,046 bytes, SHA-256 `E7F741DE64E8D2342FF89FBA8081F95DA26B7118FDED4C6EC81683DA79FFDE04`. `pg_restore --list` passed with 1,454 TOC entries. The machine record is `JLG_RELEASE_CLEANUP_BACKUP.json`.

## Deterministic manifest

The read-only live snapshot produced `manifests/jlg-release-cleanup-manifest.json`, SHA-256 `B1E847B8DF6661283BF43D5966A09C6B87E6299395D7321D0CE4C594BD8D3E1D`. It contains exactly four families, 40 redundant Track rows, four `release_artists` rows, four cover-ingest rows, zero `recordings.release_id` dependencies, and 41 protected Recording UUIDs. Family-specific handling preserves both *Frío, frío* Recording identities and proposes no Recording mutation.

## Failed preflight and stop

The deep audit recorded zero `release_view_events` dependencies on the four redundant Releases. Fresh preflight found a new `release_view_events` row (`75523347-f32a-47a8-bb63-ec6ef6cd6d4e`) pointing to redundant *Literal* Release `0b1683cc-6f6c-4885-8036-e926df045b82`. This is a new foreign-key dependency after the approved audit.

The authorization explicitly requires stopping when a new FK dependency or material drift appears. Consequently, no isolated rehearsal, guarded production transaction, application validation, or post-cleanup count report was performed. Production Releases, Tracks, release artists, cover associations, view events, Recordings, Version profiles, and relationships were not changed.

## Rollback

No rollback is needed because no production transaction ran. If a future separately approved cleanup is executed, verify the archive checksum first and restore only into an isolated compatible PostgreSQL environment using `pg_restore`; never restore over production without a separately authorized incident-recovery procedure.

## Release-ingestion lesson

Historical provider/source Release observations must not automatically become canonical Mangulina Releases. Future import architecture must support `MATCH EXISTING RELEASE`, `CREATE DISTINCT EDITION`, and `NEEDS EDITORIAL REVIEW`. No importer implementation was undertaken here.

## Resumed attempt

The resumed authorization approved deletion of scoped pre-launch `release_view_events`. A new full production backup was created and validated, and refreshed preflight passed with exactly one approved view event and no unexpected attached FK data. The version-2 manifest contains exactly the same four Release families and has SHA-256 `9D6EB5E22EC49399C08C7102A48D1DA8039A0A069D4E102BEB5F225D76D5D13A`.

The mandatory isolated rehearsal could not start because the existing PostgreSQL 17 cluster was denied permission to bind localhost ports 55432 and 55433 in the execution environment. No rehearsal cleanup or production transaction ran. Production remains unchanged; execution is stopped at the rehearsal gate.

## Environment fix and successful rehearsal

Read-only OS diagnostics proved that ports 55432 and 55433 were neither occupied nor reserved and that the rehearsal data-directory ACL was valid. The actual cause was the Codex-launched process token being denied permission to create TCP listeners. PostgreSQL 17 was therefore started with TCP disabled and a workspace-local socket at `C:\Mangulina\.tmp\jlg-pg-socket`. Native PostgreSQL clients supported that transport; the JavaScript `pg` client did not, so the exact manifest-generated transaction was rehearsed through `psql`.

The validated backup was restored twice. Production-only `pg_cron`, `hypopg`, `index_advisor`, and `supabase_vault` extension objects were omitted because they are unavailable locally; five expected cron/vault extension-owned data or sequence warnings did not involve catalog tables. Both exact cleanup runs produced identical results and preserved 17,051 global Recordings, 327 JLG Recordings, 53 Recording Version profiles, eight relationships, both Frío Recordings, both Fogaraté editions, and all four unresolved Releases.

## Production execution

The final dynamic FK drift check found only 40 Tracks, four release artists, and one explicitly approved view event attached through current FKs; cover-ingest dependencies remained the four manifest rows and legacy `recordings.release_id` pointers remained zero. The guarded transaction committed at 2026-08-13 09:15 EDT.

Exact production effects were: Releases 3,169→3,165; JLG represented Releases 146→142; Tracks 22,756→22,716; `release_artists` 3,169→3,165; cover-ingest rows 3,035→3,031; `release_view_events` 22→21. No Recording was changed: JLG remained 327 and global remained 17,051. Exact Recording Version profiles and all eight relationships remained unchanged. Alex Bueno remained 638 Recordings and 839 Tracks.

## Deployed validation

The deployed JLG profile and affected Release pages loaded successfully without browser console errors. Edition badges now show Grandes éxitos 10, Todo tiene su hora 4, Literal 2, and Fogaraté 2. Frío, frío remains a one-track commercial Release, while both legitimate Recording UUIDs remain in the database. No UI workaround was added.

## Final status

The exact four approved redundant Release identities and their 40 duplicate Track appearances, four release-artist rows, four cover-ingest rows, and one approved pre-launch view event are removed. Survivors, unresolved cases, protected Recordings, Release Groups, and legitimate editions remain. The authorized cleanup is complete and work stops here.
