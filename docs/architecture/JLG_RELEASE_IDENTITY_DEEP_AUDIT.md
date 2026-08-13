# JLG Release Identity Deep Audit

**Audit date:** 2026-08-12  
**Scope:** complete Juan Luis Guerra / Juan Luis Guerra 4.40 Release universe in production  
**Mode:** read only; every database query ran in an explicit read-only transaction and rolled back  
**Deciding rule:** MusicBrainz identifiers explain import provenance but do not determine Mangulina Release identity

## Executive summary

| Measure | Production-derived result |
|---|---:|
| JLG Releases reviewed | **146** |
| JLG Release Groups reviewed | **75** |
| Independently supported real-world editions | **138** |
| Unique canonical Release rows (A) | **56** |
| Legitimate distinct-edition rows (B) | **82** |
| Probable duplicate Release families | **4** |
| Probable redundant Release rows (C) | **4** |
| Uncertain Release families | **3** |
| Uncertain Release rows (E) | **4** |
| Release Group modeling issues (D) | **0** |
| Worldwide Releases reviewed | **53** |
| Worldwide legitimate | **51** |
| Worldwide probable duplicates | **2** |
| Worldwide uncertain | **0** |
| Suspicious worldwide duplicate families | **2** |
| `recordings.release_id` pointers on probable redundant rows | **0** |

The full per-Release inventory, classification, fingerprints, evidence summary and duplicate-family dependency ledger are in [`manifests/jlg-release-identity-deep-audit.json`](../../manifests/jlg-release-identity-deep-audit.json). Every one of the 146 Release UUIDs is explicitly represented there.

The catalog is **systematically vulnerable but not broadly corrupt**. Most multiplicity is legitimate physical/digital, territory, reissue, packaging or program history. Four source-level observations became duplicate canonical Releases. Three families remain unresolved because their product metadata is missing; they were not forced into cleanup.

## Method and edition standard

The production universe was discovered through all relevant relationships: direct Release artist, `release_artists`, and Tracks whose canonical Recording belongs to either current or merged JLG artist UUID. `recordings.release_id` was audited only as a legacy dependency, never as the scope authority.

For each Release the audit compared normalized product metadata, imported payload, Release artist, cover relationship, complete ordered Track program, Track UUID, canonical Recording UUID, title override, disc/position, Track length, ISRC context, timestamps and provider provenance. Program fingerprints used:

`disc | position/track number | canonical Recording UUID | title override | length`

Separate Release rows are justified by independently supported physical format, pressing, territory, catalog number, barcode, packaging, label/distributor, remaster/reissue status or materially different program. Different MBIDs, storefront IDs, source records, null versus worldwide territory, minor timing variance, spelling, crop/resolution or repeated platform observation are insufficient alone.

## Ranked Release Group review

### Groups with four or more rows

| Release Group | UUID | Rows | Supported editions | Redundant | Uncertain | Result |
|---|---|---:|---:|---:|---:|---|
| Grandes éxitos | `7e51f3b7-871a-4cc8-957b-a68bc0299496` | 11 | 8 | 1 | 2 | one exact Spanish-product duplicate; two metadata-poor programs unresolved |
| Bachata rosa | `cb846547-8fd7-4945-88e3-1ca1a2db3804` | 9 | 9 | 0 | 0 | documented Dominican, Mexican, US, European, Japanese, Spanish, worldwide digital and 1995 reissue distinctions |
| Ojalá que llueva café | `a21d3e4f-71a4-4ed4-9c7a-2839a20a7aeb` | 7 | 6 | 0 | 1 | original/digital/territorial/reissue products supported; one undated seven-track US row unresolved |
| Colección romántica | `6b30104c-0b09-4efd-a668-76661d79f735` | 6 | 5 | 0 | 1 | 20-track physical/digital and volumes 1/2 supported; one unidentified ten-track excerpt unresolved |
| La llave de mi corazón | `d4ca4dc3-2eb4-4483-912c-d0ac4dfb0a5d` | 5 | 5 | 0 | 0 | 13-, 14-, 17- and 22-track physical/digital/deluxe programs are materially distinct |
| Mudanza y acarreo | `2895407b-912c-4820-b04a-5130538d8256` | 5 | 5 | 0 | 0 | 1985 Venezuelan physical, worldwide digital and later US/Spanish reissues remain distinct |
| Todo tiene su hora | `35cd952d-ff98-4bdc-b629-5999db3b4af4` | 5 | 4 | 1 | 0 | Spanish and US CD rows duplicate normalized EAN/product; digital and Colombian sleeve products remain |
| A son de Guerra tour | `41e9eb8b-ad30-4df3-96a6-c7fc9b972067` | 4 | 4 | 0 | 0 | standard 14-track audio, 32/33-item deluxe audiovisual and territorial products are materially distinct |
| Colección cristiana | `ef0c8d4e-9bcf-4bca-bade-c2277e670ba2` | 4 | 4 | 0 | 0 | digital, European and Colombia/US physical publication contexts retained; shared UPC alone was not treated as proof of duplication |
| Mientras más lo pienso… tú | `7ad09674-02e6-47d7-b12f-8a257cdd0f83` | 4 | 4 | 0 | 0 | original, worldwide digital and later seven/eight-track reissues are distinguishable |
| Ni es lo mismo ni es igual | `db9135d0-0dc7-4a79-9fa5-b9dfe90bd9e7` | 4 | 4 | 0 | 0 | Spanish/US/worldwide and ten-track program distinctions retained |

### Other multi-Release groups

| Release Group | Rows | Supported | Redundant | Uncertain | Principal distinction/finding |
|---|---:|---:|---:|---:|---|
| A son de Guerra | 3 | 3 | 0 | 0 | 11-track physical/digital and 16-track deluxe |
| Areíto | 3 | 3 | 0 | 0 | Canada, Spain and worldwide digital products |
| Burbujas de amor (single family) | 3 | 3 | 0 | 0 | German/NL two- and three-track physical programs |
| La llave de mi corazón (single family) | 3 | 3 | 0 | 0 | one- and two-track regular/special single programs |
| Literal | 3 | 2 | 1 | 0 | US CD plus one digital product; duplicate worldwide digital observation |
| Soplando / El Original 4.40 | 3 | 3 | 0 | 0 | original and independently dated reissues |
| Archivo digital 4.4 | 2 | 2 | 0 | 0 | US physical versus worldwide digital |
| Entre mar y palmeras | 2 | 2 | 0 | 0 | separately identified worldwide and Puerto Rico products |
| Fogaraté! | 2 | 2 | 0 | 0 | worldwide digital versus physical CD |
| Frío, frío | 2 | 1 | 1 | 0 | one commercial single duplicated by full-audio and shortened provider manifestation |
| Para ti | 2 | 2 | 0 | 0 | physical versus digital |
| Romance rosa | 2 | 2 | 0 | 0 | 11-track worldwide and 12-track US program |

The remaining **52 Release Groups contain exactly one Release each** and are classified A after relationship, program and product-context review: 18 éxitos; 32 serie; Antología; Aquí estoy yo; Así bonito; Bachata en Fukuoka; Bonus Tracks; Burbujas de amor (30-track compilation); Buscando el mar; Cantando bachata; Canto a la patria; Capitán Avispa; Cecilia; Como abeja al panal (two distinct single groups); Como abeja al panal / De tu boca; Concierto aniversario; Corazón enamorado; Dance with Me; Dios así lo quiso; Duets: Greatest Hits; El Niágara en bicicleta; Encuentro; Esto es vida; Esto es vida (bachata remix); Estrellitas y duendes; Gracias; Gracias a la vida; Grandes Éxitos (2025 remaster); I Love You More; Kitipun; Las de Juan Luis; Live in Love; Los grandes éxitos de Juan Luis Guerra y 440; MAMBO 23; Medicine for My Soul; Mi amor (from *Capitán Avispa*); Mi guitarra; Não tenho lágrimas; Privé; Quisiera; Quisiera ser un pez…; Radio Güira; Rosalía; Si no te hubieras ido; Si tú me quieres; Siempre queda el amor; The Collection; Toma mi vida; Tus besos; Universo latino 1; and Woman del Callao.

## Fogaraté! deep review

Both rows contain the exact same twelve canonical Recording UUIDs in the documented order. That sameness is normal cross-edition reuse.

| Field | Worldwide digital | Physical CD |
|---|---|---|
| Release UUID | `e8f8b2ba-8856-42c4-9280-184f529f951f` | `d2d6198d-f801-4d07-a415-3852ea4128e0` |
| Date | 1994-01-01 placeholder | 1994-02-25 |
| Territory | XW | US |
| Packaging/format | None / digital context | Jewel Case / CD |
| Barcode | `886296759231` | `743212111026` |
| Track count/program | 12 / canonical album order | 12 / same canonical order |
| Program fingerprint | `b12bfdc479035df70b065f079767627a` | same |
| Legacy `recordings.release_id` | 5 | 0 |
| Classification | B — legitimate digital edition | B — legitimate physical edition |

Independent physical evidence identifies UPC `743212111026`, catalog `74321-21110-2`, CD format and the complete twelve-track program ([Massive Music Store](https://massivemusicstore.com/en-es/products/fogarate), [O Sebo Cultural](https://lojasebocultural.com.br/produto/juan-luis-guerra-4-40-fogarate/), [Bull Moose](https://www.bullmoose.com/p/9449617/guerra-juan-luis-fogarate-)). The [official Apple album](https://music.apple.com/us/album/fogarat%C3%A9/1526554412) independently presents the twelve-song digital product, and [Amoeba’s physical record](https://www.amoeba.com/fogarat-cd-juan-luis-guerra/albums/236012/) documents the BMG Canada CD context. The two Mangulina rows therefore represent **two real-world editions and zero redundant rows**. The UI should show `Digital · Worldwide · UPC 886296759231` versus `CD · Jewel Case · UPC 743212111026`.

## Largest Release Group: Grandes éxitos (11 rows)

The family represents multiple genuine programs and reissues, not eleven copies of one product. The official artist history confirms the compilation’s 1995 publication and worldwide commercial role ([Juan Luis Guerra official history](https://juanluisguerra.com/historia/)). Physical/catalog evidence independently supports a 17-track Karen CD under UPC `710793017726` ([La Música](https://www.lamusica.com.co/products/cd-juan-luis-guerra-4-40-grandes-exitos), [eBay product record](https://www.ebay.com/itm/277677295377)); a 15-track 1995 product under EAN `743212941821` is held by [Vaski libraries](https://vaski.finna.fi/Record/vaski.333202); and separate 18-track, 16-track/digipak, club and digital product identifiers exist in production.

| Release UUID | Date/country | Format | UPC | Tracks | Finding |
|---|---|---|---|---:|---|
| `77bb8012-308b-4c94-8937-df022a431b05` | 1995 ES | Jewel Case | `743213012827` | 18 | **survivor** of exact Spanish-product pair |
| `6a571c33-ab65-469d-b7df-76fdadbb674b` | 1995 ES | Jewel Case | `743213012827` | 18 | **C redundant**: same 18 Recording UUIDs/order; only punctuation and 800 ms terminal timing noise |
| `502264af-3841-4b82-8a5d-a511b152e29f` | 1995 MX | Jewel Case | `710793017726` | 17 | legitimate Mexican product |
| `b483896d-cf09-46d4-ae1c-bc7ac8bbf980` | 1995 XW | Digital | `198391976674` | 17 | legitimate later digital product observation |
| `c19d7a5f-1cc5-429c-bdf6-a497da15a684` | 1995 unknown | unknown | `743212941821` | 15 | supported distinct 15-track physical product |
| `1eb18bee-1f7d-41fb-9ba2-6614b62103d7` | 1996 ES | Jewel Case | `710793017726` | 17 | dated Spanish reissue |
| `6e9a90f0-b789-4640-9c3c-4569522a8d9f` | 1996 US | Jewel Case | `248526070000` | 17 | US club/distribution product |
| `c3411cf6-b563-4601-bffd-8af42aa3f2d5` | 2004 AR | Digipak | `724386409720` | 16 | Argentine digipak/reissue |
| `6f8d7fc9-c1e6-4f72-a139-159215c2ddbe` | unknown | unknown | `0886296761371` | 17 | distinct product identifier/program; retained B |
| `089ca320-b5cf-48b8-8c97-148b6bc92875` | unknown | unknown | none | 15 | E uncertain; program ends “La señorita” and lacks edition evidence |
| `0f3b7ada-04b3-479c-8491-4edeb79f9c2f` | unknown | unknown | none | 16 | E uncertain; materially different ordering/program, but product identity missing |

**Answer:** production holds 11 rows. It contains **8 independently supported real-world editions**, **1 probable redundant row**, and **2 unresolved rows** that could add zero, one or two editions once scans/identifiers are found.

## Probable duplicate ledger

| Family | Survivor | Redundant | Product/program evidence | Cleanup complexity |
|---|---|---|---|---|
| Grandes éxitos, Spain 1995 | `77bb8012-...` | `6a571c33-...` | same date, ES, Jewel Case, UPC `743213012827`, 18 identical Recording UUIDs/order; metadata-only noise | medium: 18 Tracks |
| Frío, frío 2013 digital single | `2489f428-...` | `bd2e1cd2-...` | Universal and Apple tie full/short manifestations to UPC `05099993462358`; no second product evidence | medium: preserve distinct video/edit Recording |
| Todo tiene su hora CD | `d3dea072-...` | `acf06f18-...` | EANs normalize to `602547037565`; exact same ten Recordings, titles, lengths and ISRCs | low |
| Literal 2019 digital | `baf380be-...` | `0b1683cc-...` | same date and exact eleven canonical Recordings/order; survivor retains digital UPC `602577649394`, duplicate differs only by XW/null metadata and delivery timing | low |

For *Frío, frío*, the deep audit **reproduced the previous conclusion without conflict**: survivor `2489f428-4ce1-46c7-90cd-70775fe85a4c`, redundant candidate `bd2e1cd2-6ce5-4758-a3d6-cabc5a5ab054`. The [Universal/EMI Latin catalog](https://www.universalmusic.it/popular-music/album/frio-frio_30781801149/) documents the single, UPC and 3:55 audio; [Apple](https://music.apple.com/es/album/fr%C3%ADo-fr%C3%ADo-feat-romeo-santos-live-single/715572858) exposes the shorter store manifestation under the same product artwork identity. Both Recording UUIDs remain valid and must not be merged.

For *Todo tiene su hora*, independent retailers identify `0602547037565` as the CD EAN and 10 November 2014 release ([Fnac Spain](https://www.fnac.es/a1072812/Juan-Luis-Guerra-Todo-tiene-su-hora-Disco), [Fnac Switzerland](https://www.fr.fnac.ch/a7878898/Juan-Luis-Guerra-Todo-tiene-su-hora-CD-album), [IBS](https://www.ibs.it/todo-tiene-su-ahora-cd-juan-luis-guerra/e/0602547037565)). The two Mangulina rows differ only by a leading-zero representation, territory/source precision and MBID.

## Uncertain ledger

| Family / rows | What looks duplicated | Why unresolved | Exact evidence required |
|---|---|---|---|
| Grandes éxitos: `089ca320-...`, `0f3b7ada-...` | 15/16-track programs overlap known products | no country, date precision, packaging, UPC or catalog number; programs differ from each other and supported editions | front/back/disc scans, matrix/catalog/UPC, or label catalog matching each exact order |
| Colección romántica: `6b7aa257-...` | ten tracks overlap volume 2 | it omits volume 2’s opener, adds “Lacrimosa,” and has no date/country/format/UPC; not an exact volume duplicate | artwork or provider product ID tied to the exact ten-track sequence |
| Ojalá que llueva café: `2b3f7491-...` | title matches album, but only seven tracks | seven-track order omits an album track and has no date, packaging, barcode or catalog number | physical scan/catalog record or digital product page proving this exact seven-track US edition |

No uncertain row is authorized for cleanup.

## Worldwide analysis

All 53 `XW` Releases were reviewed. `XW` is a stored imported territory/event value, not an automatic default inferred by the audit. It is often a legitimate digital-publication scope, but it is too coarse to distinguish repeated provider observations.

- **51 legitimate:** independently distinct digital product, format/reissue, UPC or program.
- **2 probable duplicates:** `bd2e1cd2-...` (*Frío, frío*) and `0b1683cc-...` (*Literal*).
- **0 uncertain:** metadata-poor unresolved rows are not XW.

Worldwide duplication therefore exists, but it is localized rather than proof that every XW row is suspect.

## Track, Recording, artist and cover safety

The four redundant candidates contain **40 Track rows**, **4 release-artist rows** and **4 cover-ingest-log rows**. They have **0** direct `recordings.release_id` pointers, **0** artist-credit rows, **0** medium rows and **0** release-view events. Their release-artist relationships are identical primary JLG credits and do not distinguish editions.

The *Frío, frío* redundant Release points to shortened/video Recording `8b866647-4640-49c2-b711-14a6103b18ed`, while the survivor points to full live audio `334ae297-d150-4a81-9427-a416ecb0aa1d`. A future Release cleanup must preserve both Recordings and must not append the redundant Track to the survivor’s one-track program. The other three families reuse the same canonical Recording program as their survivors, apart from insignificant title/timing metadata.

Cover URLs/ingest rows were treated as provenance, not identity. The stored public cover responses tested during the audit did not provide reliable distinct image assets; a different MBID-derived URL was never used to keep a Release. No Release-level platform-link table exists: current platform links attach to Recordings and are unaffected by Release deletion unless separately reviewed.

## Root cause

The pattern is **systematic in ingestion behavior, limited in observed damage**.

Evidence:

- all audited Releases were created in the same 2026-05-16 import window;
- Tracks followed in the 2026-05-18 processing window;
- duplicate candidates have different MBIDs and nearly identical MusicBrainz-shaped JSON payloads;
- normalized edition fields such as label/catalog/barcode are often null even when present in imported JSON;
- no current repository ingestion code performs canonical Release matching; current code exposes admin CRUD and reads existing Release rows;
- provider links are Recording-scoped, so Apple/Spotify IDs do not explain legitimate Release separation.

The most likely historical path treated each imported MusicBrainz Release observation as a canonical Mangulina Release, then grouped it by source Release Group. This is an inference from timestamps, payload shape and absence of a canonical matcher; the historical importer itself is not present in the current repository.

Future ingestion should implement:

`provider observation → normalized candidate set → MATCH EXISTING RELEASE / CREATE DISTINCT EDITION / NEEDS EDITORIAL REVIEW`

Matching must compare product metadata and complete program fingerprints, record provider IDs as observations, and block blind creation when only source IDs differ. No workflow was implemented in this read-only task.

## Estimated cleanup impact

| Item | Estimated impact |
|---|---:|
| Releases potentially removable | 4 |
| Track rows requiring reconciliation/removal | 40 |
| `release_artists` rows affected | 4 |
| Cover-ingest associations affected | 4 |
| Embedded provider/import Release payloads retired | 4 |
| Release-level platform rows affected | 0 (no such table) |
| Recording platform links to preserve | all; none should move automatically |
| `recordings.release_id` pointers needing repointing | 0 |
| Release Groups changed | 0 |
| Recording identities changed | 0 |

This is a cleanup estimate, not authorization. A future deterministic cleanup must take a fresh snapshot, reconcile the 40 Tracks family by family, preserve both *Frío* Recording versions, manage public slugs/cover logs, and validate exact before/after counts in one guarded transaction.

## Production safety and stop

No Release, Release Group, Track, Recording, `recordings.release_id`, platform link, cover, release artist, Recording Version profile, relationship, disambiguation, UI, or Alex Bueno data was changed. The retained changes are this report, the audit manifest, and the reusable procedure update. Cleanup was not prepared as executable SQL and was not executed. The task stops here.
