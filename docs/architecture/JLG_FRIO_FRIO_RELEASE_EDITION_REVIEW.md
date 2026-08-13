# JLG “Frío, frío” Release/Edition Review

**Scope:** exactly the two suspicious worldwide `Frío, frío` Release rows  
**Audit date:** 2026-08-12  
**Mode:** read only; no production data, UI, Recording profile, or relationship was changed

## Executive conclusion

**Classification: C — PROBABLE DUPLICATE RELEASE ROWS.**

The two Mangulina rows are not independently evidenced real-world editions. They share the same title, artist, one-track digital-single program, worldwide territory, official status, no physical packaging, Release Group, artwork/product identity, and 2013 phonogram context. Their meaningful difference is which version of the same live performance was attached during import: a 3:55 audio master versus a roughly 3:39 shortened audiovisual/store variant. Independent label and Apple evidence associate those differing durations with the same single product rather than documenting two separately marketed editions.

The stronger canonical Release row is `2489f428-4ce1-46c7-90cd-70775fe85a4c`: it retains the product barcode in imported metadata and its 3:55 track matches Universal/EMI Latin’s official catalog entry. The probable duplicate is `bd2e1cd2-6ce5-4758-a3d6-cabc5a5ab054`. No cleanup was executed.

## 1. Exact rows

- **Release A / proposed survivor:** `2489f428-4ce1-46c7-90cd-70775fe85a4c`
- **Release B / probable duplicate:** `bd2e1cd2-6ce5-4758-a3d6-cabc5a5ab054`
- **Shared Mangulina Release Group:** `89b98244-cf46-47e8-bd82-469a45edd299`

## 2. Side-by-side Release comparison

| Field | Release A | Release B | Same / Different | Significance |
|---|---|---|---|---|
| Release UUID | `2489f428-4ce1-46c7-90cd-70775fe85a4c` | `bd2e1cd2-6ce5-4758-a3d6-cabc5a5ab054` | Different | Internal identity only |
| Title | `Frío, frío` | `Frío, frío` | Same | No distinction |
| Release Group UUID | `89b98244-cf46-47e8-bd82-469a45edd299` | same | Same | Both modeled as editions of one single |
| Group type | Single | Single | Same | No distinction |
| Release `type` column | null | null | Same | Format distinction is missing |
| Date | `2013-01-01` | `2013-03-08` | Different | A is year-only source precision normalized to Jan 1; B is a full imported date. Not sufficient evidence of separate editions |
| `release_year` / `year` | 2013 / 2013 | 2013 / 2013 | Same | No distinction |
| Country | `XW` | `XW` | Same | Imported worldwide area; too coarse to distinguish products |
| Status | Official | Official | Same | No distinction |
| Packaging | None | None | Same | Both are digital/non-physical contexts |
| Label / label ID | null / null | null / null | Same | Mangulina omits the independently documented EMI Latin label |
| Catalog number | null | null | Same | No distinction |
| Barcode column | null | null | Same | Neither normalized column is populated |
| Imported barcode | `5099993462358` | null | Different/incomplete | The official Universal UPC is `05099993462358`; Apple artwork for B embeds the same digits. This supports one product, not two |
| Release MBID | `5f2ebe8e-b12b-449c-afa5-9240b396a3ae` | `1a640cea-6cd4-4fef-8ea0-88b84f92853b` | Different | Explains import duplication; not deciding evidence |
| Disambiguation | null (imported empty string) | null (imported empty string) | Same | UI has no legitimate edition distinction to show |
| Language/script | Spanish / Latin | Spanish / Latin | Same | No distinction |
| Release artist ID | `10034596-47cb-46ba-9e80-9ea319a2c0df` | same | Same | No distinction |
| Release artist credit | Juan Luis Guerra 4.40, primary, order 0 | same | Same | No distinction |
| Track count | 1 | 1 | Same | Same one-track program structure |
| Cover flag | true | true | Same | Both imported as having cover art |
| Cover provenance | one successful ingest-log row, keyed by A’s MBID | one successful ingest-log row, keyed by B’s MBID | Technically different | Source-key duplication, not demonstrated artwork distinction |
| Stored cover response | 88 bytes, SHA-256 `9d2505…e1a9c` | 88 bytes, same SHA-256 | Same response | Current public objects do not establish different covers; both returned the same non-image-sized payload during audit |
| Created | `2026-05-16 01:55:23.599Z` | `2026-05-16 01:55:21.930Z` | Different | Import timing only |
| Updated | `2026-07-09 02:02:00.213Z` | `2026-07-09 02:02:02.462Z` | Different | Processing timing only |
| Slug | `frio-frio-juan-luis-guerra-4-40` | `frio-frio-juan-luis-guerra-4-40-2` | Different | Duplicate-facing public URL symptom, not edition evidence |
| Views / view events | 0 / 0 | 0 / 0 | Same | No retained analytics distinction |

### Imported metadata provenance

Both Release JSON payloads are MusicBrainz-shaped imports with identical status, packaging, text representation, worldwide area, and embedded Release Group identity. A contains year-only date `2013`; B contains `2013-03-08`. A contains barcode `5099993462358`; B omits it. Those source identifiers explain why two rows were ingested but do not establish two canonical editions.

## 3. Release Group analysis

Both rows correctly point to the same Mangulina Release Group, `89b98244-cf46-47e8-bd82-469a45edd299`, titled `Frío, frío` and typed `Single`. Its own normalized `secondary_types` is empty, although imported source metadata says `Live`; its normalized `first_release_date` is null, although imported metadata says `2013-03-08`.

There is no evidence for two Release Groups. The problem is duplicate edition-level rows inside one appropriate single Release Group, plus incomplete normalization of live/date/label/barcode data.

## 4. Complete track-program and Recording comparison

Each Release contains exactly one Track at disc 1, position 1, track number 1, titled `Frío, frío`, with no title override and no medium row.

| Field | Release A track | Release B track | Significance |
|---|---|---|---|
| Track UUID | `1e5d2be9-36f4-4e06-9e63-b63eedc48a71` | `ca148d4e-45c8-4454-92fa-649d4e614bb2` | Different imported Track rows |
| Recording UUID | `334ae297-d150-4a81-9427-a416ecb0aa1d` | `8b866647-4640-49c2-b711-14a6103b18ed` | Distinct canonical version profiles already established; do not merge them |
| Recording role | full 2013 live audio | shortened live/video edit | Actual version difference, but not independently evidenced as a second Release edition |
| Track length | 235,880 ms | 218,000 ms | About 17.9 seconds different |
| Recording duration | 235,453 ms | 216,548 ms | Full audio versus video edit |
| Recording disambiguation | `live` | `live` | B lacks an edit/video qualifier in its visible disambiguation |
| ISRC | `USEL11200150` | none | A has stronger audio-product identity evidence |
| Imported source Recording | full audio, 235,453 ms | production row is the 216,548 ms video; Track JSON also retains a 218,000 ms audio-source object | B contains mixed importer provenance |

The audio is **not identical**. It represents the same 2012 stadium performance in full audio and shortened audiovisual/edit form. That finding preserves the prior Recording cleanup: the two Recording UUIDs should remain distinct even if one Release row is removed.

## 5. Independent external evidence

MusicBrainz was used only to understand importer provenance, never as the deciding authority.

1. [Universal Music Italia’s official catalog entry](https://www.universalmusic.it/popular-music/album/frio-frio_30781801149/) documents one digital “eSingle Audio/Single Track,” released 8 March 2013, label EMI Latin, UPC `05099993462358`, with one track: `Frío, Frío (En Vivo Estadio Olímpico De República Dominicana/2012)`, duration 3:55. This exactly supports A’s barcode and full-audio duration.
2. [Apple Music’s public single page](https://music.apple.com/es/album/fr%C3%ADo-fr%C3%ADo-feat-romeo-santos-live-single/715572858) documents one 2013 one-song single, credited to Juan Luis Guerra, ℗ 2013 Juan Luis Guerra. Apple’s public catalog API for collection `715572858` identifies track `715574224`, duration 218,996 ms, release date 1 January 2013, and artwork path containing `05099993462358`—the same UPC Universal assigns to the 3:55 product.
3. [Juan Luis Guerra’s official history](https://juanluisguerra.com/historia/) describes `Frío Frío` featuring Romeo Santos as the first single from the live *A Son de Guerra Tour* project. It does not document two separately marketed single editions.
4. The [official/label-supplied YouTube audio](https://www.youtube.com/watch?v=JQwqpsuENeQ) identifies the song as the 2012 Estadio Olímpico performance, ℗ 2013 Juan Luis Guerra. The [official artist-channel video](https://www.youtube.com/watch?v=zHhza3EgHe8) separately exposes the audiovisual presentation. This supports distinct Recording/version contexts, not two independently packaged singles.

The decisive point is not merely that Apple and Universal have different external IDs. They associate two duration representations with the **same UPC/artwork product identity**. No independent source found a second catalog number, second UPC, territory-specific edition, format, cover, bonus program, remaster designation, or separate phonogram line.

## 6. Platform/import provenance

### Recording `334ae297…` (full 3:55 audio)

- Apple track `715954107`: this is track 9 of Apple collection `715953873`, *Asondeguerra Tour (Deluxe Edition)*, not a second single product.
- Spotify `2j5dy9SzXdQ71Y2jgtiFAJ`: `Frío, Frío - En Vivo Estadio Olímpico De República Dominicana/2012`.
- YouTube `JQwqpsuENeQ`: official Topic audio, discovered through ISRC search.

### Recording `8b866647…` (shortened/video context)

- Apple track `715574224`: the one-track single collection `715572858`, about 3:39.
- Spotify link `1UzxNNiJhUPngbfANRlQqM` is marked `needs_review`; its fetched search context does not reliably document the Romeo Santos live edit and must not decide Release identity.
- YouTube `EzI-Pcajixg` is marked `needs_review` and is insufficient edition evidence.

Platform links are attached to Recordings, not Releases. They do not require two Release rows and should not be moved merely to make a Release cleanup work.

## 7. Is “Worldwide” meaningful?

`Worldwide` is stored on both normalized Release rows as country code `XW` and duplicated in their imported release-event metadata. It is real stored provenance, but it is **not distinguishing information** here. Both are non-physical digital contexts, and neither row stores a market, storefront, distribution territory set, or format qualifier that would turn `XW` into evidence of separate editions.

The date difference also does not rescue the distinction: A’s `2013-01-01` is the database representation of a year-only imported date, while B has day precision. Apple itself uses 1 January for the same UPC product that Universal dates 8 March, demonstrating provider/date normalization rather than a securely separate edition.

## 8. Final classification

### C — PROBABLE DUPLICATE RELEASE ROWS

Strong evidence indicates that both canonical rows represent the same one-track worldwide digital single. Their split was likely caused by imported source records attaching different manifestations of the same live performance and incomplete barcode/date normalization. The Recording distinction is valid; the Release duplication is not independently supported.

## 9. Proposed cleanup (not executed)

### Survivor

Keep Release `2489f428-4ce1-46c7-90cd-70775fe85a4c` because it has:

- the official product UPC in imported metadata;
- the official-label 3:55 program;
- ISRC `USEL11200150` on its Recording;
- the stronger match to Universal/EMI Latin’s catalog record.

### Probable duplicate

Retire Release `bd2e1cd2-6ce5-4758-a3d6-cabc5a5ab054` only after a separately authorized cleanup.

Its current dependent rows are:

- 1 Track: `ca148d4e-45c8-4454-92fa-649d4e614bb2`;
- 1 Release artist: `6839f5e6-d015-4b11-ab0e-52ea742601e3`;
- 1 cover-art ingest-log row: `adf56ba8-bf7d-4688-ba29-cda401a7fbae`;
- 0 artist-credit rows;
- 0 medium rows;
- 0 Recordings whose `recordings.release_id` points directly to it;
- 0 release-view events.

Minimal authorized cleanup sequence:

1. Preserve Recording `8b866647-4640-49c2-b711-14a6103b18ed` and all of its platform links/version identity; it remains a valid shortened/video Recording used elsewhere.
2. Do **not** append B’s Track to A; that would incorrectly turn the one-track single into a two-track program.
3. Remove B’s edition-only Track and Release-artist rows, retire its cover-log association, then remove B.
4. Preserve the shared Release Group and A’s Track-to-full-audio Recording relationship.
5. Normalize A’s label (`EMI Latin`), barcode/UPC, live format/disambiguation, and precise date only in a separately reviewed metadata task.
6. Redirect or preserve the `-2` public slug before deletion if route aliases are supported; neither row currently has view events.

## 10. UI implication

This is not primarily a case where the UI hides a legitimate edition field. No independently supported edition-level distinction exists to expose. Until cleanup is authorized, the smallest safe display improvement would be to show Track duration and version qualifier (`live audio` versus `live video edit`) so the current rows do not appear audio-identical. That would explain the data anomaly without presenting it as a legitimate CD/digital/territory distinction.

## 11. Recommended next action

Authorize the minimal Release cleanup above as a separate production task. Before execution, take a fresh read-only snapshot of the two Release rows and listed dependencies, then apply the survivor plan transactionally with explicit before/after counts. Do not alter either Recording profile, the shared Release Group, unrelated JLG records, unresolved JLG cases, or Alex Bueno.

## Safety confirmation

All database work for this review ran inside explicit read-only transactions and rolled back. The only repository change made and retained by this review is this report; the temporary read-only audit script was removed. No production data or UI code was modified.
