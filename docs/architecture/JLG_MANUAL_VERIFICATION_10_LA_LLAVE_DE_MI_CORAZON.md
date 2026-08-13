# JLG Manual Discography Verification 10 — *La Llave de Mi Corazón*

**Research date:** 2026-08-11 · **Production:** read-only · **MB identity rule:** MusicBrainz excluded.

## Album and edition evidence

The [official history](https://juanluisguerra.com/historia/) places this studio album after *Para Ti*. Independent retail evidence gives **20 March 2007**, EMI Televisa/Capitol, CD; AllMusic documents CD/DVD catalog `071052`, and the [official label fan edition](https://www.universalmusic.it/popular-music/album/la-llave-de-mi-corazon-fan-edition_30801162091/) was released 2 October 2007. The original thirteen-audio-track program is: Medicine for My Soul; La travesía; Te contarán; Que me des tu cariño; Como yo; Si tú no bailas conmigo; Solo tengo ojos para ti; Amores; Cancioncita de amor; Sabia manera; La llave de mi corazón; Something Good; A la vera.

Mangulina contains Dominican, US, worldwide, Colombian special, fan, single and enhanced-media contexts. The core thirteen UUIDs are reused correctly. US edition `15771474-...` adds the dance remix; worldwide `77d5e7a6-...` adds alternate/language tracks; special edition `e2f34b09-...` adds fan tracks plus DVD/menu assets. Those video/menu assets are not audio studio-album Recordings.

## Track-by-track Recording ledger

| Original track | UUID | Appearances | Related identities and evidence | Decision |
|---|---|---:|---|---|
| Medicine for My Soul | `5bd5a921-7b33-40ca-b7ff-c92c4c085432` | 6 | Stable official object Apple `714632830`. `3e8ec754-...` and null-duration DVD import `dec3b8c6-...` expose the same object and are duplicates. `e703a9c5-...` is officially the fan-edition **duet version**, distinct performance, despite contaminated links. | original KEEP; two MERGE CANDIDATES; duet KEEP — DISTINCT / NEEDS DISAMBIGUATION |
| La travesía | `f1a4a262-fd61-4af0-8910-652b203b6655` | 5 | `e61255b3-...` shares the original's complete official object set: duplicate import. `c9049cc0-...` is full Asondeguerra Tour performance; `1c223bf0-...` shorter tour edit; `afb28585-...` separate 2021 live. Official live releases distinguish events/edits. | original KEEP; one MERGE; three live KEEP — DISTINCT / NEEDS DISAMBIGUATION |
| Te contarán | `7b97a847-5d31-4917-a000-d9674c6a9272` | 5 | One Apple `714632839` studio performance; no related row. | KEEP — ORIGINAL / UNIQUE |
| Que me des tu cariño | `683502f6-1cdd-40cd-90ae-3c262314255d` | 5 | Null-duration enhanced import `3be8cc69-...` shares all six commercial objects: duplicate. `d673e2ea-...` is independently a Portuguese-language Recording (ISRC `USEL10700235`), although its stored links point to Spanish audio. | original KEEP; one MERGE; Portuguese KEEP — DISTINCT / NEEDS DISAMBIGUATION |
| Como yo | `19e9a1ef-bd96-4463-8bbf-8b2fe261fe03` | 5 | `6531c0fc-...` is official *Entre Mar y Palmeras* 2021 live performance. | original KEEP; live KEEP — DISTINCT / NEEDS DISAMBIGUATION |
| Si tú no bailas conmigo | `52854730-7dfb-43e5-8b32-8629575f00ce` | 5 | `ba5bb58b-...`, officially “Dance with Me (Si tú no bailas conmigo),” is a 2020 English/collaboration rerecording, separate ISRC `CAJ222000019`. | original KEEP; collaboration KEEP — DISTINCT / NEEDS DISAMBIGUATION |
| Solo tengo ojos para ti | `fbbc2187-063e-4b49-8b39-72b06b121cc1` | 5 | One stable studio object; no related row. | KEEP — ORIGINAL / UNIQUE |
| Amores | `72953b36-4dea-403f-8d4d-27005c7c9f3d` | 5 | One stable studio object. | KEEP — ORIGINAL / UNIQUE |
| Cancioncita de amor | `acd92f61-adc2-4470-bc74-2e998c6d973f` | 5 | One official studio object. | KEEP — ORIGINAL / UNIQUE |
| Sabia manera | `f86d022c-7f07-4aa9-9623-84d64df16ff4` | 5 | One official studio object. | KEEP — ORIGINAL / UNIQUE |
| La llave de mi corazón | `7556f332-a821-410c-8df9-c9303f05d289` | 6 | `7be71bbd-...` shares the Portuguese delivery ISRC/object with `bfe72788-...`: duplicate of the Portuguese version. `2327c774-...` is official dance remix. `d5f7aeb2-...` full 2012 tour audio; `a242db40-...` shorter tour edit; `3a123fc6-...` separate 2021 live. Null-duration `4ac7943f-...` is an enhanced-video asset, not safely mergeable with audio. | original KEEP; Portuguese KEEP + one MERGE; remix/live rows KEEP — DISTINCT; enhanced asset KEEP — NEEDS MEDIA-TYPE DISAMBIGUATION |
| Something Good | `344e2db9-8a06-455a-8b9c-6cef0dfc90d2` | 5 | Stable English-language studio object; no related row. | KEEP — ORIGINAL / UNIQUE |
| A la vera | `19cdd2f3-ac06-4ba5-a55e-398837748b12` | 5 | Stable approximately 2:50 studio object. | KEEP — ORIGINAL / UNIQUE |

All canonical `release_id` values point to an original worldwide album context. Live/remix/language rows generally point to their version editions, while several enhanced imports point to the Colombian special edition. Platform contamination is extensive on Portuguese, live and duet rows.

## Merge dependency ledger

| Survivor | Redundant | Type/evidence | Dependencies | Confidence |
|---|---|---|---|---|
| `5bd5a921-...` | `3e8ec754-...` | same Medicine official object | 1 Track; ISRC `USEL10700181`; links | HIGH |
| `5bd5a921-...` | `dec3b8c6-...` | null-duration enhanced import, same object | 1 enhanced Track; no ISRC | HIGH |
| `f1a4a262-...` | `e61255b3-...` | same La travesía studio objects | 1 Track; ISRC `USEL10700236` | HIGH |
| `683502f6-...` | `3be8cc69-...` | null-duration enhanced import, same object | 1 enhanced Track; no ISRC | HIGH |
| `bfe72788-...` | `7be71bbd-...` | same Portuguese-version ISRC/object | 1 Track; ISRC `USEL10700182` | HIGH |

## Totals

Original/session Recordings **13**; later same-Recording appearances **54**; legitimate distinct versions **11** (duet, two language/collaboration, remix, seven live/edit presentations); different arrangements **4** (duet, Portuguese, dance/English collaboration, dance remix); new merge candidates **5**; needing disambiguation **12** including enhanced-media asset; uncertain identity relationships **1** (whether `4ac7943f-...` is merely the music-video encoding or a distinct edit; actual DVD stream comparison required).

**Cumulative after album 10:** albums 10; original/session identities 101; additive appearances 855; distinct-version findings 71; merge candidates 29; unresolved relationships 12; version/disambiguation findings 57.

Production remained read-only. Execution continued chronologically.
