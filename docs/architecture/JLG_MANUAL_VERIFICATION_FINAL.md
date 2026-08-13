# JLG Manual Discography Verification — Final Cumulative Report

**Research completed:** 2026-08-11 · **Production:** read-only throughout · **Identity rule:** MusicBrainz was not used to decide Recording sameness or difference.

## Scope and catalog boundary

Independent artist chronology and contemporary/label catalogs establish thirteen main studio albums: *Soplando*; *Mudanza y acarreo*; *Mientras más lo pienso... tú*; *Ojalá que llueva café*; *Bachata Rosa*; *Areíto*; *Fogaraté!*; *Ni Es Lo Mismo Ni Es Igual*; *Para Ti*; *La Llave de Mi Corazón*; *A Son de Guerra*; *Todo Tiene Su Hora*; and *Literal*. The [official history](https://juanluisguerra.com/historia/) supports the sequence; independent release evidence is recorded in the thirteen album reports.

The following are deliberately outside that studio-album sequence but included in the Recording reconciliation: *Colección cristiana* (compilation), *Asondeguerra Tour* and *Entre Mar y Palmeras* (live projects), *Privé* (new intimate rerecordings), *Radio Güira* (EP), *Capitán Avispa* (soundtrack), *Encuentro* and other concert/special programs, collections/anthologies, language versions, collaborations, standalone singles, remixes and video/edit assets.

## Catalog totals

| Measure | Final result |
|---|---:|
| Studio albums verified | **13** |
| JLG Recording rows accounted for | **370 / 370** |
| JLG Track rows reconciled to those Recordings | **1,452** |
| Orphan JLG Recording rows | **0** |
| Unique original/session Recording identities | **133** |
| Later same-Recording appearances verified | **937** additive album-review appearances |
| Legitimate distinct-version findings | **81** |
| Arrangement differences identified | **40** documented original/later treatments |
| Unique merge candidates | **43** |
| Unresolved identity relationships | **13** |
| Version/disambiguation findings | **67** |

“Accounted for” means every current row belongs to an identified studio, live, compilation/collection, rerecording, EP, soundtrack, collaboration, single/remix, language, enhanced-media, or explicitly unresolved family. It does not convert the thirteen unresolved relationships into guesses. The appearance total preserves the established additive album-report methodology and is not represented as a de-duplicated global Track count.

## Non-album reconciliation

The post-album inventory found no orphan rows. The largest non-album/display contexts are *Capitán Avispa* (41 rows), *Asondeguerra Tour* families (33), *Encuentro* (17), *Entre Mar y Palmeras* (15), *The Collection* (15), *Bonus Tracks* (13), *Concierto aniversario* (12), *Colección romántica* (11), *Colección cristiana* (8), *Radio Güira* (6), and *Privé* (5). Remaining one-row contexts are traceable singles/collaborations/remixes such as “Dance with Me,” “Cantando bachata” rock, “El Niágara en bicicleta” remix, “Como abeja al panal” remix, “Estrellitas y duendes,” “MAMBO 23,” “Dios así lo quiso,” “Cecilia,” “Si tú me quieres,” and language releases. These rows are either already classified in the album-led version families or are self-identifying distinct non-album releases; no additional merge candidate was inferred merely from title, duration, ISRC, or release context.

## Complete merge ledger

All actions below mean **MERGE CANDIDATE — DO NOT EXECUTE**. Dependencies always include Track/Release presentation, platform links, raw/normalized ISRCs, credits, sources, analytics and `release_id`; these must be inventoried again immediately before any eventual governed migration.

| Song/version | Canonical survivor | Redundant UUID | Duplicate type and independent evidence | Confidence |
|---|---|---|---|---|
| Por eso ahora | `805979cc-2add-4919-8b64-1615b2328dbf` | `8075a099-6ee3-4508-a800-5f835311de82` | Spanish-reissue import; same five official objects and album performance context | HIGH |
| Ella dice | `ac93f31e-6376-4777-9c4e-50b2950a4f8c` | `e18e01ed-01c0-4d8a-82b7-f5d2c8ffdeda` | Spanish-reissue import; same Apple/Spotify/YouTube objects | HIGH |
| Yo vivo enamorao | `9fb197bd-5d96-408f-a978-86e6fabc3f7b` | `006d391c-9947-4283-b31d-7034ea704857` | Spanish reissue; exact Apple/Spotify delivery and timing | HIGH |
| Requiem sobre el Jaragua | `d9545d58-5dae-408a-b2e6-10320d810453` | `85cace99-7bb7-4964-ab1e-5fe738598da3` | same reissue sequence/guest-performance context; no version claim | MEDIUM |
| Elena | `1df2c683-442d-479b-936c-0f5d68bd1bb4` | `4bd236be-5cfd-481e-9143-c8fb6c021a20` | same Spotify/YouTube objects and compatible reissue timing | HIGH |
| Santiago en coche | `9867f816-d969-4e66-b856-4be6bb26a0cf` | `4767d0fa-281d-4d59-b7e8-75f9714bcb60` | same five official objects and reissue sequence | HIGH |
| Amigos | `2a15ddda-8ae3-4fdb-b034-13dccfb7da56` | `3aa9caf0-f8d2-4631-82f5-e668519b6a74` | cross-album/reissue duplicate; same commercial master objects | HIGH |
| Amor de conuco | `aa802e13-5b41-41bc-a30d-4d810b8b0358` | `f09046f5-37b9-4ea6-9cb0-49c7ab67157b` | original-edition import; same album objects/program position | MEDIUM-HIGH |
| Ojalá que llueva café — 2013 live | `9c660568-2be6-40a0-85f0-0d01dad2d45b` | `046d05d8-136c-4340-ab58-eccd2e50c507` | same official tour performance object/event | HIGH |
| A pedir su mano | `a6527c5d-dad3-4ba8-9cf4-db1f6f828982` | `786e27b0-8327-4d33-a9be-343f0bce776a` | compilation import; five shared studio objects | HIGH; verify stored long duration |
| Estrellitas y duendes — collection live | `f47427e7-4549-4c7d-8b20-72612cb41ccf` | `780af43b-f133-443e-ad6b-76dcfdbc3156` | same explicitly-live Apple object/collection lineage | HIGH |
| La bilirrubina — 2013 live | `9f56bad5-2bba-4f7e-958a-90a91f57a39b` | `8c6b7d7f-721c-47ac-80d8-c0837ddae342` | same Spotify object, event and compatible timing | HIGH |
| Burbujas de amor | `f518f60e-a1b8-449c-80a0-ab51973308dc` | `f3dfc294-4e8d-44f4-b4d9-2f197ea92017` | collection import; same six official studio objects | HIGH |
| El costo de la vida | `d32d2277-6d90-4ff7-b614-a252e98d11e8` | `2e998583-0f13-40ce-8a3a-a8c4b90ac2f9` | one-Track collection import; same six objects/performance | HIGH |
| Coronita de flores | `525a92c8-bae7-4c89-8e84-532e7ed5be2f` | `135262dd-aa53-40be-a048-cd9b44cafdd0` | one-Track collection import; same six objects/audio | HIGH |
| Frío, frío — 2013 video edit | `8b866647-4640-49c2-b711-14a6103b18ed` | `eaaf538f-556c-4663-9a25-8b2a7277cb3c` | exact Apple/Spotify/YouTube video-edit objects | HIGH |
| Viviré | `e0f73996-a0ef-4566-a34a-9d8e1ca4350f` | `0cc04257-7a86-4984-9968-16223af246b6` | one-Track collection import; same five/six commercial objects | HIGH |
| La cosquillita | `24e8cbfc-cb66-4481-a2db-fe653e7b79fc` | `c22f0093-d574-410a-9979-69c1345efd15` | one-Track collection import; exact same six objects | HIGH |
| Amapola | `1ba17dad-ae76-429f-9ef9-6c28583e2613` | `5867dce2-199e-4aea-8e15-065346f370a6` | collection import; five identical objects, erroneous live label | HIGH |
| La hormiguita | `94e6b280-a522-4fd7-82e5-e920583b8668` | `253eb278-8822-4ae2-bf84-ea93f3789786` | one-Track collection import; five shared studio objects | HIGH |
| Palomita blanca | `fd8be647-bc76-495c-b4f4-5b6d2d608b31` | `e7a3dc3b-ec33-440a-841c-9984947b6818` | one-Track collection import; five shared studio objects | HIGH |
| El Niágara en bicicleta | `2dd6a6a7-81f2-48d1-bd57-bbd75cc36805` | `9ab2e548-69e0-4454-8f5e-e8b1e76676be` | one-Track collection import; exact six destinations | HIGH |
| Quisiera — pop | `32b87f30-8aad-42c8-ab5e-f973e2421a8d` | `7527fde0-5360-4ffd-b9a9-450a26038cf9` | same six pop-version objects | HIGH |
| El Niágara — 2013 live | `1fb2a355-75eb-4b56-b1c8-e531a99c1e45` | `952aeb58-6ece-4c40-9ffe-abbfa87a876e` | same official 4:31 tour performance and standard/deluxe context | HIGH |
| Medicine for My Soul | `5bd5a921-7b33-40ca-b7ff-c92c4c085432` | `3e8ec754-...` | same official studio object | HIGH |
| Medicine for My Soul | `5bd5a921-7b33-40ca-b7ff-c92c4c085432` | `dec3b8c6-...` | null-duration enhanced import exposing same object | HIGH |
| La travesía | `f1a4a262-fd61-4af0-8910-652b203b6655` | `e61255b3-...` | same complete official studio-object set | HIGH |
| Que me des tu cariño | `683502f6-1cdd-40cd-90ae-3c262314255d` | `3be8cc69-...` | null-duration enhanced import, same six objects | HIGH |
| La llave — Portuguese version | `bfe72788-...` | `7be71bbd-...` | same Portuguese ISRC and delivery object | HIGH |
| La guagua — full 2013 live | `a266c059-...` | `74bdda84-...` | enhanced row exposes same official full-live object | HIGH |
| La calle — full 2013 live | `8ae9a544-...` | `59260747-...` | enhanced row shares official Apple/Spotify live object | HIGH |
| Bachata en Fukuoka — full live | `0672bd04-...` | `c431a1cd-...` | enhanced row shares official full-live objects | HIGH |
| Kitipun | `3bccc59f-1abf-43ce-8370-18989a8635fd` | `0ca87f5e-...` | US edition row shares six commercial master objects | HIGH |
| Lámpara pa’ mis pies | `8a6801fd-04b8-48d3-843b-2cfcbbdc3529` | `5fc83e9c-...` | US edition row shares five commercial objects | HIGH |
| Cantando bachata | `b2a70d7c-1405-4a6c-8f7e-f0a5e828f9ee` | `10f7b0dc-...` | US edition row shares album objects | HIGH |
| Má pa’lante vive gente | `e0fba189-...` | `c963c383-...` | US edition row shares six objects | HIGH |
| I Love You More | `10f90a51-...` | `ddc15f58-...` | US edition row shares six objects | HIGH |
| Corazón enamorado | `68f0a8b2-...` | `321d32c8-...` | US edition row shares six objects | HIGH |
| Son a mamá | `1f921fe1-...` | `0c938c4c-...` | US edition row shares four objects | HIGH |
| No tiene madre | `1cb6b529-...` | `334cb949-...` | US edition row shares seven objects | HIGH |
| Me preguntas | `e9b118be-...` | `3f742ff6-...` | US edition row shares seven objects | HIGH |
| El primer baile | `920ec664-...` | `01c21d55-...` | US edition row shares six objects | HIGH |
| Merengue de cuna | `f8b0c915-...` | `e17aec1a-...` | US edition row shares four objects | HIGH |

## Complete unresolved ledger

| Song/family | Recording UUIDs / contexts | Exact unresolved point | Evidence required |
|---|---|---|---|
| Si tú te vas | `36b13fcd-...` vs `55d59e8d-...`; original/compilations vs ES-1991 | divergent objects and 226–239s reports; take/edit relationship unproved | aligned full audio: vocal, intro, ending, fade |
| Tú | `f0491fa4-...` vs `55425b53-...`; original vs shortened *Antología* | secondary links expose full original, not claimed 213.6s Track | actual *Antología* audio/physical master |
| Visa para un sueño — Collection | original/verified lives vs `7fd9aade-...` | links mix studio and another Spotify object | release-specific *The Collection* audio |
| Visa para un sueño — tour rows | `a72f9729-...` vs `a6f92754-...` | 204/222s relationship not established; links contaminated | aligned official tour-edition audio |
| Ojalá — Collection | original/verified lives vs `5a5857a1-...` | mixed original/other-live links; claimed audio unavailable | release-specific collection audio |
| Ojalá — Encuentro/bonus | `de56973b-...` vs `62c7b849-...` | both later/live and near four minutes; performance reuse unproved | aligned full audio/master documentation |
| De tu boca | `9b1e0adb-...` vs `198cbb35-...` | claimed 404s single row links to ordinary album master | physical single or actual 6:44 audio |
| Bachata rosa | `fd627df2-...` vs `17838aca-...` | four-second difference may be fade/edit/mastering | full-track ending/fade alignment |
| La bilirrubina — bonus/Encuentro | `597be780-...` vs `9f24bf27-...` | similar lengths; Encuentro links point elsewhere | release-specific Encuentro audio |
| La bilirrubina — Collection | verified lives vs `6eeb7e87-...` | useful links resolve to studio/other object | physical collection audio |
| Frío, frío — collection | original vs collection family | distinct audio supported; rerecording/arrangement/session mechanism not narrow enough | collection liners and aligned master |
| La llave — enhanced video | `4ac7943f-...` vs audio/version family | music-video encoding versus distinct edit unproved | actual CD/DVD stream comparison |
| Mi bendición — enhanced media | `43195ebd-...` vs studio/full-live rows | mixed studio/live links prevent assignment | actual deluxe media stream |

Separately, `c8b6b240-d2be-4c36-bcff-30cbed0701a5` is a Track-assignment defect spanning a bonus “Visa” performance and a 2005-stadium Track; future work must split/reassign Tracks, not merge Recording identities.

## Legitimate-version taxonomy

The verified catalog contains: separately dated concert performances; full concert audio and shorter video/edition edits of one performance; *Privé* intimate/acoustic rerecordings; Portuguese and English-language versions; named ballad, pop, salsa, rock and “Version Nueva” treatments; remixes; collaborations/duets; medleys/composite performances; soundtrack rerecordings; romantic-collection sessions; enhanced-media/video assets; and regional substitute-track context. A remaster, territory, package, compilation, reissue or ordinary single reuse is not a new Recording.

## Arrangement/Expression findings

The evidence requires three layers: Work (composition/adapted lyric), Arrangement/Expression (musical treatment), and Recording (actual performance/fixation). Distinct concert events normally create distinct Recordings without proving distinct Arrangements. Conversely, *Privé*, ballad/pop/salsa/rock, language treatments, explicit remixes and medleys can support distinct Arrangement identity. The 40 total includes documented original treatments where the reports explicitly counted them; it must not be interpreted as 40 later alternate arrangements.

## `recordings.release_id`

The field cannot safely mean “original release.” Across the catalog it points variously to original albums, later digital editions, compilations, collections, live releases, version releases, enhanced imports and representative display contexts. *Soplando* originals point to 2016; numerous early originals point to 1995/2010 compilations; “Son al rey” points to *Colección cristiana*; later albums more often point to an original worldwide context. Future architecture should separate first-known release evidence, representative display context and the authoritative many-Track Release graph.

## Platform-link findings

Recurring defects include studio links on live/language/duet rows, live-event cross-contamination, ordinary album objects attached to claimed edits, duplicate URLs across redundant rows, provider search links mistaken for exact objects, and multiple delivery IDs/ISRCs for one performance. Exact shared platform objects are valuable corroboration only with independent performance/release evidence; platform IDs must not become canonical Recording identity.

## Credit and provenance findings

The catalog lacks reliable structured coverage for composer/lyric adapter (Work), arranger/musical director (Arrangement), and vocalist, guest performer, musicians, producer, engineer, venue/event/date (Recording). Examples recovered in the album reports include Rafael Colón, Maridalia Hernández, Johnny Ventura, Juanes, Sting and *Privé*/concert personnel. Original physical side/order, catalog number, source citation and confidence also need governed provenance rather than free-text inference.

## Data-quality conclusions

- Historical physical programs can differ from streaming programs: notably “Amapola” on the original *Ni Es Lo Mismo Ni Es Igual*.
- Territory, reissue and whole-edition imports created duplicate Recording identities, especially *Mudanza* ES-1991 and *Literal* US physical.
- Collections and enhanced/live edition boundaries are the dominant isolated-duplicate source.
- Diacritics, punctuation and translated titles fragment search but do not establish identity.
- Null or conflicting durations and ISRCs require source/audio review; neither is decisive alone.
- Legitimate versions usually lack structured event, language, edit, mix, collaboration or arrangement disambiguation.
- The many-Track reuse model is broadly correct and must be preserved; high appearance counts are not defects.

## Stop / production safety

No Recording, Track, Release, link, ISRC, credit, Work, Arrangement, schema, RPC, search behavior or UX was modified. No merge or cleanup migration was executed. This report is the required stopping point pending review and explicit cleanup authorization.
