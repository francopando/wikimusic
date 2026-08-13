# Artist Recording Catalog Verification and Cleanup

## Purpose and governing rules

This is the reusable procedure for artists whose imported catalogs show repeated-title groups, compilation fragmentation, multiple source identifiers, unclear versions, or suspected duplicate Recording identities. It preserves musical truth while removing proven redundant entities.

- MusicBrainz identifiers are provenance, not canonical Recording identity.
- MusicBrainz and provider Release identifiers are provenance, not canonical Release identity.
- A repeated title is not proof of duplication.
- One Recording may legitimately appear on many Releases through Tracks.
- Live performances, rerecordings, language versions, edits, remixes, collaborations and alternate arrangements remain separate when evidence supports them.
- Work identity, Recording identity, Track appearance identity and Release/edition identity must each be verified independently. A correct Recording cleanup does not prove that its Release rows are correct.
- Missing version information can make valid Recordings look duplicated.
- Unresolved cases remain untouched.
- Cleanup identity decisions must be fixed in a reviewed manifest; execution must never decide identity heuristically.

## Required sequence

1. Create and checksum a full production backup; prove it can be restored into a compatible isolated environment.
2. Fix the artist scope by immutable artist UUIDs and perform a complete read-only Work, Recording, Track, Release, Release Group and dependency inventory. Discover Releases through `tracks.release_id`, `release_artists`, artist-linked Recordings and direct Release artist fields; do not rely on `recordings.release_id`.
3. Establish the main album sequence independently, distinguishing studio albums from live, compilation, soundtrack, EP, rerecording and special projects.
4. Verify album by album and track by track using physical, official, label, archival, commercial-catalog and audio evidence. Do not use MusicBrainz as identity evidence.
5. Verify correct many-Release reuse through Tracks before looking for duplication. Separately review every Release Group and every edition row using barcode/catalog number, format, packaging, territory, date, label/distributor, cover and full ordered Track-program evidence.
6. Classify original sessions, legitimate versions, arrangement findings, supported duplicates and unresolved relationships.
7. Reconcile non-album rows so every artist-performed Recording is accounted for.
8. Freeze Recording and Release survivor/redundant decisions in a machine-readable manifest containing exact UUIDs, evidence, confidence and every dependency action. Cleanup execution must not infer Release identity from an external identifier.
9. Restore the backup to an isolated compatible database; record before counts.
10. Repoint legitimate Tracks and unique valid dependencies, remove redundant/wrong child clutter, then delete only manifest-listed redundant Recordings in one guarded transaction.
11. Validate foreign keys, Recording/Track counts, every Release tracklist, ISRCs, credits, Work links, platform destinations, search, song pages and artist discography. Confirm unrelated artists did not change.
12. Review rehearsal evidence and exact production script. Obtain explicit destructive approval.
13. Take a fresh pre-execution backup if the database has changed, verify checksum, execute once, and run identical postconditions.
14. Preserve the manifest, result, source reports and rollback record as the audit package.

## Dependency policy

Tracks representing legitimate Release appearances are repointed, never deleted merely because their Recording is redundant. Valid unique ISRC provenance, credits, Work relationships and sources move to the survivor; exact duplicates collapse. Platform links survive only when they are valid canonical destinations; wrong-version, search-result and redundant release-context links are deleted. Pre-launch counters do not block cleanup. Conflicting musical evidence aborts that pair rather than forcing certainty.

For a probable duplicate Release, inventory Tracks, `release_artists`, cover-art associations, media, artist credits, analytics/public URLs and every legacy `recordings.release_id` pointer before approval. A duplicate Release can contain a valid distinct Recording version; Release cleanup must preserve that Recording and reconcile its Track intentionally. Provider links attached to Recordings do not justify duplicate Release rows and must not be moved merely to simplify Release deletion.

## Mandatory Release-identity audit

Before any artist cleanup—including Alex Bueno—the audit must:

1. rank every Release Group by edition count and manually account for every Release;
2. deep-review all groups with four or more editions and every smaller family flagged by a strong signal;
3. fingerprint each complete ordered program using disc, position/track number, canonical Recording UUID, title override and Track length;
4. compare normalized barcode/UPC, catalog number, date, territory, physical/digital format, packaging, label/distributor, phonogram line and artwork identity;
5. detect cross-provider and worldwide digital duplication without treating provider IDs as Release identity;
6. treat null/missing metadata as missing evidence, not a legitimate edition distinction;
7. verify suspicious families against independent physical, label, artist, archival and commercial-store evidence, with MusicBrainz used only to explain provenance;
8. classify every Release as unique canonical, legitimate distinct edition, probable duplicate, Release Group modeling issue or uncertain;
9. report every `recordings.release_id` pointer and all edition-level dependencies for probable duplicates;
10. trace the ingestion path and require future imports to choose explicitly among **match existing Release**, **create distinct edition**, and **needs editorial review**.

Differences that commonly justify separate Releases include independently documented physical format, pressing, territory, catalog number, barcode, packaging, label/distributor, remaster/reissue status or materially different program. Different MBIDs, storefront IDs, source systems, null-versus-worldwide territory, minor duration variance, spelling, provider copyright prose, image resolution or repeated platform observation do not establish distinct Release identity by themselves.

## Rollback

Before commit, any failure rolls back the transaction. After commit, rollback is restoration of the verified pre-execution backup into a compatible environment followed by controlled cutover; destructive cleanup must never depend on reconstructing deleted rows manually.

## Prioritization

After JLG cleanup is approved, executed and validated, apply this complete process to **Alex Bueno** as the next high-priority artist. Begin from his existing catalog audit rather than starting blindly, but independently validate all identity conclusions. Do not mutate Alex Bueno data during the JLG task.

Later artists should be prioritized by duplication evidence and catalog risk. This procedure must not become blind global deduplication.

Pre-launch view/event analytics attached solely to a proven redundant canonical entity may be deleted with that entity after explicit dependency review. They should not force preservation of false catalog identities. Do not generalize this to meaningful post-launch analytics without a separate policy and approval.
