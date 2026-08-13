# Alex Bueno Full Catalog Identity Audit

**Status:** complete read-only audit; no production mutation · **Audit date:** 2026-08-13 · **Canonical artist UUID:** `6c3e0d74-23b7-4d80-969f-9d5319ee5127`

## Executive summary

The immutable Alex Bueno scope contains **638 Recordings**, **839 Track appearances**, **84 Releases**, and **61 Release Groups**. One canonical Artist row exists and no historical/duplicate Artist UUID was found. Every Recording and Release is represented in the machine manifests.

The catalog is structurally asymmetric: Release identity is comparatively healthy, while Recording identity is heavily provider-shaped. The audit identifies **50 high-confidence candidate duplicate Recording families containing 56 probable redundant rows**. It retains **212 original/session or survivor candidates**, recognizes **18 explicitly distinct Recording rows**, and leaves **352 repeated-title rows unresolved** rather than collapsing them from metadata. The version review separately proposes **32 profiles**, **27 rerecording relationships**, **111 Arrangement holds**, and **9 credit follow-ups**; 256 version questions remain unresolved.

All **84 Releases** were classified: **39 unique canonical rows** and **45 legitimate distinct-edition rows**. There are **zero supported duplicate Release families**, **zero Release Group modeling issues**, and no group with four or more editions. The 22 smaller multi-edition groups were all reviewed using canonicalized program fingerprints and product metadata.

## Backup and production safety

| Field | Result |
|---|---|
| Archive | `backups/alex-bueno-full-audit/mangulina-production-pre-alex-bueno-audit-20260813T094805-0400.dump` |
| Timestamp | 2026-08-13 09:48 EDT |
| Size | 20,802,879 bytes |
| SHA-256 | `4EDF160F4D6E67143FF518459B35CD15E1E1B973DC4FF13672FDEC1B312352CA` |
| PostgreSQL | 17.6 |
| Validation | `pg_restore --list` passed; 1,454 TOC entries |

Every database operation was read-only. No Recording, Track, Work, Release, ISRC, credit, platform row, Version profile, relationship, disambiguation, or UI state was changed.

## Artist scope and exact inventory

Only `6c3e0d74-23b7-4d80-969f-9d5319ee5127` matches Alex Bueno by canonical name, sort name, slug or aliases. Stored aliases are “el mayimbito” and “el ruiseñor de la sierra.” No obsolete artist identity owns Alex Recordings or Release credits.

| Entity/dependency | Count |
|---|---:|
| Recordings | 638 |
| Tracks | 839 |
| Releases | 84 |
| Release Groups | 61 |
| ISRC associations | 493 |
| Recording platform links | 3,998 |
| Recording credits | 6 |
| Work-linked Recordings | 4 |
| Recording Version profiles | 0 |
| Recording relationships | 0 |
| Legacy `recordings.release_id` pointers | 638 |

The four Work links are the previously governed Colegiala family. The other **634 Recordings lack Work links**. Only six normalized Recording credits exist, concentrated in Colegiala; this is a catalog-wide credit gap, not permission to manufacture credits.

## Independent discographic sequence

The sequence below reconciles Dominican biography/discography evidence, AllMusic physical/timeline evidence, commercial catalogs, J&N history and current production. Compilation, backing-track, collaboration and later digital contexts are not treated as original studio sessions.

| Period | Verified catalog context |
|---|---|
| 1982 | Feliz Cumbé! / early group-era material |
| 1983 | Como quisiera |
| 1984–85 | Alex & Orquesta Liberación / Alex |
| 1988 | Con fe y sentimiento |
| 1990 | Alex / Alex Bueno |
| 1992 | ¡Como nadie!; Ternuras |
| 1994 | Amores que matan |
| 1996 | Me equivoqué; Regresar al amor |
| 1997 | Más ternura |
| 1998 | Bachata a su tiempo; Merengue y más |
| 2000 | Corazón duro |
| 2001 | Únicamente tú; Grandes éxitos en bachata |
| 2002 | Pídeme; Solo merengue |
| 2004 | 20 años después, vols. 1–2 |
| 2005 | Entre bachata y merengue |
| 2007 | Queda algo |
| 2008 | Mensajes |
| 2009 | Bachatas en ternuras |
| 2015 | Tranquilo y tropical / 1 |
| 2017 | Diferente; Dos x uno |
| 2019 | 4x4 en salsa, vol. 1 |
| 2024 | Colegiala (sinfónico) |
| 2025 | El más completo |

Key sources: [Dominican chronology](https://www.conectate.com.do/articulo/alex-bueno-biografia/), [AllMusic timeline and Karen issue](https://www.allmusic.com/album/alex-y-la-orquesta-liberacion-mw0000919812), [Buena Música separated discography](https://www.buenamusica.com/alex-bueno/discografia), [Apple commercial catalog](https://music.apple.com/us/artist/alex-bueno/303351), and [J&N label history](https://picoteandoelespectaculo.blogspot.com/2016/12/disquero-de-j-records-nelson-estevez.html).

## Recording identity findings

| Classification | Rows |
|---|---:|
| ORIGINAL_OR_SESSION_RECORDING | 162 |
| PROBABLE_REDUNDANT_RECORDING | 56 |
| UNRESOLVED | 352 |
| CANONICAL_SURVIVOR_CANDIDATE | 50 |
| LEGITIMATE_DISTINCT_RECORDING | 18 |

There are **133 repeated normalized-title families covering 476 rows**. Same title was never used as a merge rule. A probable duplicate requires same normalized title, shared normalized ISRC and duration within one second, followed by Release/context review. This is stronger than title or MBID equality but remains a cleanup candidate, not an execution command.

### Largest repeated-title queues

| Normalized title | Recording rows | Known-duration rows | Distinct ISRCs |
|---|---:|---:|---:|
| quien te riza el pelo | 14 | 13 | 6 |
| querida | 13 | 13 | 8 |
| quiereme | 11 | 11 | 5 |
| que cara mas bonita | 10 | 10 | 6 |
| que vuelva | 10 | 10 | 6 |
| ese hombre soy yo | 9 | 9 | 6 |
| gotas de pena | 9 | 9 | 6 |
| me muero por ella | 9 | 8 | 4 |
| me va me va | 9 | 9 | 5 |
| mi pobre corazon | 9 | 7 | 3 |
| quiero abrazarte tanto | 9 | 8 | 5 |
| la prisa | 8 | 8 | 2 |
| la radio | 7 | 7 | 5 |
| un mechon de tu cabello | 7 | 7 | 4 |
| yo me ire | 7 | 7 | 4 |
| pideme | 6 | 6 | 5 |
| una paloma blanca | 6 | 6 | 3 |
| corazon de madera | 5 | 5 | 5 |
| los caminos de la vida | 5 | 5 | 1 |
| perdoname | 5 | 5 | 4 |
| si la ves | 5 | 5 | 3 |
| un poco de ti | 5 | 5 | 2 |
| unicamente tu | 5 | 4 | 1 |
| vuelve | 5 | 4 | 2 |
| a buscar que | 4 | 4 | 4 |
| colegiala | 4 | 4 | 6 |
| en bandolera | 4 | 4 | 3 |
| la distancia | 4 | 4 | 3 |
| la pretendida | 4 | 4 | 2 |
| lo que yo siento por ti | 4 | 4 | 3 |

### Probable duplicate Recording ledger

| Family | Survivor candidate | Redundant candidates | ISRC evidence | Duration range ms |
|---|---|---|---|---|
| quien te riza el pelo | `8c0e30ac-9801-4eec-875a-4c5bf77725a7` | `0160770f-b53e-41e2-b5eb-311f4235368b` | USJ3V1497157 | 284395–284395 |
| quien te riza el pelo | `5decf471-ff9b-4343-86a7-9a178d523ccd` | `2a9c0203-1d14-4c32-abed-c685083f5218`<br>`7439ffb9-18c6-4c20-8e9c-28ca2723f647`<br>`fccbd4a4-74da-47f7-8a3d-fa2d0403314a` | US3Z40407611 | 274769–275240 |
| querida | `2c979e53-1c1a-4d8c-9e96-d6d822ec17c4` | `7b898b0b-43a9-4d0b-839d-ade43293cc5a` | USJ3V1498091 | 218360–218360 |
| querida | `e2d5035c-c7b2-4232-9d7f-eea89dc65d15` | `98422853-88e0-45c5-b3d2-1c57e083a1c0` | US3Z40407005 | 281924–281960 |
| quiereme | `e438f6c3-263a-4ef6-9dfc-b548162c14a9` | `d8685306-f3e2-4eee-8990-d266627ea0a2`<br>`2a6d1a2d-6bca-4125-a14b-7d7fba9a80d3`<br>`85b8d999-3a59-40a8-a1be-6ad9c0b295a2` | US3Z40407213 | 255293–256227 |
| que cara mas bonita | `2259621d-d22e-4154-a4a6-0045766e8f96` | `14ae9bfc-acf4-4481-815b-ce0d2955138f` | US3Z40407003 | 250000–250000 |
| que cara mas bonita | `4d761011-8f8c-487a-82fa-0f84d7c6d072` | `be9ac73f-806a-47ec-bcd1-b9ad07123c42` | USJ3V1497150 | 302472–302472 |
| que vuelva | `d5080d81-fde4-41bf-ba29-2449f3c1b80a` | `5a0c45ef-fed1-47f6-989a-f7d6cf701035` | US3Z40407190 | 286307–286307 |
| gotas de pena | `37f08a08-0116-488d-a84e-b2072c2c3737` | `9753901b-fe82-4e70-86cc-7c6fae850a2a` | US3Z40407207 | 302813–302933 |
| me muero por ella | `aa47fa59-5393-4ade-81c2-b5b67f9af7f2` | `78bdbbf2-8984-4cfb-ba26-a54f98e41e8d` | USJ3V1498114 | 285933–285933 |
| me muero por ella | `960b0156-5553-494e-bfa4-f9fe1acc8efe` | `8564b67d-9359-4a7b-8c6c-97443366cef9`<br>`e82c5180-7c25-4f44-a0f3-665a35dbc932` | US3Z40407004 | 270977–271000 |
| me va me va | `5eb6555f-4175-4230-8b8d-bd3bf6a7fdb9` | `862ddf8d-8791-4a89-b074-b73065c2cf59` | USJ3V1497155 | 327419–327419 |
| mi pobre corazon | `370f4b71-8d93-4631-b323-0f3e756b8439` | `da281971-52e4-4785-bdb0-35f0129ee9b5` | USJ3V1498099 | 238347–238347 |
| quiero abrazarte tanto | `2382f9ae-2d28-41ff-ac09-2ac72b4c6e3f` | `da4ca073-4200-48bc-8cfe-d4cdab69868d` | USJ3V1498097 | 274480–274480 |
| la prisa | `48a9d2e1-341b-468a-89fa-01de31cf1064` | `6775a876-21aa-4108-9d13-e7aeb4bb034f` | US3Z40407164 | 232973–232973 |
| la prisa | `c4e1c52c-f12a-4a64-871d-d914b709e74f` | `83a04565-a1b6-4c2f-8843-637691b8b3bc` | US3Z40407164 | 231187–231600 |
| la radio | `6c519ada-7ab7-41da-a8a7-f914116193cf` | `78cbe934-84fe-44d6-8868-28c1987620fb` | USJ3V1497152 | 251037–251037 |
| un mechon de tu cabello | `27a33e11-9d4e-40d7-b917-9ce995145125` | `60e99b02-8aa5-4171-94dc-19a2330be86e` | USJ3V1498101 | 243427–243427 |
| yo me ire | `86e185ea-22cd-4873-a49e-1cab6a09f34b` | `0d6103bd-13af-4c8c-895a-1ae5fd3e13c7` | US3Z40407191 | 264532–264573 |
| pideme | `5b7ad736-aac2-4ccd-986b-5b7bfde90bc2` | `adf52bb5-d058-44a0-9285-083bafb81eb1` | US3Z40407226 | 254867–255307 |
| una paloma blanca | `80b2929d-6700-4aab-9dd1-d1b45c0baa69` | `79d75b6d-7cb5-42e9-82d7-ddd82a969a1b` | USJ3V1497156 | 258273–258273 |
| los caminos de la vida | `fdf4d4df-4b0a-491d-8196-cebf2ba1ad9f` | `89a8463f-e631-4cf4-9043-d58d73d97a70`<br>`5e65e5a2-4493-4d72-8851-70731efee10d` | US3Z40407777 | 298400–298400 |
| unicamente tu | `27d87103-853a-416d-9b42-c13329e9ef1c` | `2178c997-da60-4ee3-b175-f5223ffacce1` | US3Z40407825 | 201491–201561 |
| vuelve | `df0f7feb-85ba-4c29-9804-6cbdf718236e` | `64aa4ebd-833b-4320-9960-4175a59b0d9d` | US3Z40407828 | 203193–203285 |
| me equivoque | `3668e842-9ccf-40d4-9ac9-62c6668e4eee` | `a17824bc-979b-4c68-b24e-291c7f59ca72` | US3Z40407776 | 268667–269160 |
| otro weekend sin ti | `9fba2fe3-1166-4f87-a963-337bfa192f75` | `4072eef2-734a-46c1-a5b8-ed3aa72fe151` | US3Z40407771 | 284240–284240 |
| quiero conocerte | `0323351c-a11b-4c49-9cad-6691f83cd532` | `2e632c5d-2257-4b8f-afdc-9a496591aeaa` | USJ3V1497158 | 282280–282280 |
| quitame la vida | `47cf5bfc-9a23-4e16-9337-0f7da25a80eb` | `42dadb84-d51e-4bcc-a94a-9f29e42119df` | US3Z40407195 | 245184–245240 |
| soy un hombre callejero | `f22e57e3-ad61-445c-ae98-07534dc79674` | `81ca7f51-228f-45ea-8f5a-b3b4d4cfb2a2` | USJ3V1498121 | 248373–248373 |
| el chofer | `031f00ed-5be3-4ca0-9bc1-868757e7653a` | `b8146b43-c2b4-4779-a8e3-951d70056ce4` | USJ3V1498124 | 323307–323307 |
| esa mujer | `402e5951-beb9-4435-b8d4-b6b28bafefe8` | `67beb69c-1fa7-4b21-b9d0-a5fffd307765` | USJ3V1498129 | 249560–249560 |
| esa pared | `7cba8bb2-3a77-404a-aef0-bf70c2210d0e` | `00d75235-be28-4252-b886-4e71ae3149b1` | USJ3V1841805 | 196960–196960 |
| gigante | `57f67e70-0462-4c9c-8af2-2157e5ec5bf2` | `97c4a06a-3f9c-4742-82ba-dbef39d1f6c8` | USJ3V1498132 | 281267–281267 |
| has tenido mil amores | `dea9a3c2-bdb0-4cff-be64-e5f7a77416b7` | `36674810-bc28-4391-9852-f9cca137e2bb` | USJ3V1841791 | 225360–225360 |
| la mas querida | `3afeba1f-7898-4001-b5e4-9b45afac8291` | `d662e420-b403-46ff-ad37-d6b291fe0815` | USJ3V1497159 | 198635–198635 |
| la quiero a morir | `e53bf5f1-6ce0-49f3-8629-c6fabc35c24f` | `5fbb6af2-ed12-458c-bf2f-8e10baea03cd` | USJ3V1498102 | 292507–292507 |
| lluvia | `b77c2682-897a-46b6-a95d-80fa4d5b8629` | `9a90c4cb-d5d1-4c9d-a2f9-ef4e5ed36b92` | US3Z40407095 | 249539–249600 |
| maria del mar | `cb15c9c8-f60b-4d75-89f2-850a453345d8` | `05b2bbbd-e570-448e-a710-361b967abea9` | USJ3V1498128 | 263400–263400 |
| matame la pena | `358ebdef-bf61-4472-bb2c-8a7a41a95ea9` | `74f7dbf3-ce3e-4abe-b922-fce46e7ef968` | US3Z40407097 | 244715–244773 |
| ninguno de los dos | `b436398d-c135-47fe-8386-1b6aad4a88f6` | `0561f1fb-3e9a-43c4-a0ac-af8623af7409` | USJ3V1498134 | 281107–281107 |
| noche de fantasia | `176f5743-f940-46e1-97d6-7b3209a141c6` | `fb344d72-5685-46ce-bc8a-97526e3ec833` | USJ3V1498130 | 256400–256400 |
| numero cero | `cc1db423-b3a7-455a-9d30-814fbdd6150d` | `2549d7cd-a062-40d1-a62a-1eebab31221a` | US3Z40407182 | 309780–309813 |
| que daria yo | `f0e464ac-993d-49f0-acb7-b84d051ba21d` | `168d19c0-ae87-41c5-818c-95c13ccf7e3c` | US3Z40407099 | 231504–231573 |
| si volvieras | `ffb8ffa7-4e29-4c33-8914-e003a39b81f8` | `343e72da-7e40-4b9e-aa2e-5c6f48f1e11c` | USJ3V1498127 | 254840–254840 |
| tres noches | `ed8c1452-e40d-48a8-b19b-8036f00463e6` | `e6a756c8-5c62-4a8f-ae14-2679fe23c04a` | US3Z40407224 | 284133–284133 |
| las hojas verdes de verano | `1f337f6c-153a-4d8d-866b-969f11793e68` | `f73a7575-b9a8-41cb-ac5e-1f46eafd36ea` | US3Z40407167 | 263440–263573 |
| pasacantando bolero | `9ad97d11-a4ff-4ce3-949b-1b1a88e1ac7f` | `dbe4c3f8-2693-442f-a0b0-cc37cc2a3474` | US3Z40407199 | 255220–255227 |
| sin ti no soy nada | `e0352817-a103-43b2-af46-15ae193e5628` | `f3751fcb-8f05-4d88-b42c-161bf15c99aa` | USJ3V1497173 | 269401–269401 |
| solo en el amor | `10294ef3-a516-4e36-afa0-b677e89c6c16` | `a4f6fa97-82af-4202-9f5a-6704f55a0555` | US3Z40407170 | 263280–263280 |
| una lagrima por tu amor | `f692f2b0-1246-4dd2-b9f3-908d42ba5f13` | `c5672df2-743d-434b-aeda-641541b28228` | US3Z40407187 | 277007–277080 |

These 56 redundant candidates each have one Track appearance. A future cleanup must repoint those Tracks to the reviewed survivor, never delete the legitimate appearance.

## Legitimate versions, rerecordings and Arrangement holds

The 2004 *20 años después* programs revisit earlier repertoire under a new J&N project context; [Spotify documents volume 1’s exact 11-track 2004 J&N program](https://open.spotify.com/intl-es/album/2foqoAmVTn3w2Z22sJJkDp), while [AllMusic documents volume 2, its 2004 physical issue and credits](https://www.allmusic.com/album/20-anos-despues-vol-2-mw0000460416). These support studio-rerecording profiles and the 27 proposed `rerecording_of` relationships where an earlier candidate exists. Explicit remix titles add five profile candidates.

Arrangement distinctions are held outside Recording Version identity. [Qobuz documents *4x4 en salsa* as a 2019 J&N salsa compilation](https://www.qobuz.com/ar-es/album/4x4-en-salsa-vol-1-varios-artistas/rq3bbgb91vfka); [the official YouTube delivery documents *Colegiala (sinfónico)* as a 2024 orchestral production](https://www.youtube.com/watch?v=S8q1-qWnpxs). Bachata, merengue, salsa, sinfónico and “pistas originales” treatments therefore remain **111 Arrangement holds** pending Arrangement/Expression architecture.

| Version-review category | Findings |
|---|---:|
| UNRESOLVED | 256 |
| PROFILE_READY | 32 |
| RELATIONSHIP_READY | 27 |
| ARRANGEMENT_HOLD | 111 |
| CREDIT_FOLLOWUP | 9 |

No Version profile or relationship was populated.

## Platform-link audit

All 3,998 links received a disposition in the Recording manifest. **988 provider destinations are attached to multiple Recording UUIDs**; 907 remain within one normalized-title family, while **81 cross different normalized titles** and are unsafe to move automatically. In total, 2,917 rows participate in cross-Recording destination groups. No search-result URL pattern was found.

For a probable redundant Recording, an identical destination already present on the survivor is `DELETE_AS_REDUNDANT_IMPORT_CLUTTER`; a unique apparently valid destination is `MOVE_REASSOCIATE_LATER`. Shared destinations outside a proven duplicate family remain `UNRESOLVED`. The 56 redundant candidates contain 409 platform rows.

## Release identity audit

| Classification | Rows |
|---|---:|
| UNIQUE_CANONICAL_RELEASE | 39 |
| LEGITIMATE_DISTINCT_EDITION | 45 |

Complete program fingerprints canonicalize the 56 probable redundant Recording UUIDs to their proposed survivors before hashing disc, position, track number, title override and Track length. This prevents Recording fragmentation from hiding identical Release programs. No same-product pair survived the combined barcode/date/territory/packaging/program test.

Production contains 59 Worldwide rows and 59 Worldwide/`None`-packaging digital observations. They were not presumed duplicate. The familiar DO/US/ES/CO physical-versus-XW digital pairs retain distinct edition context; the three-row *Alex & Orquesta Liberación* group retains original/reissue context. MusicBrainz Release IDs remain provenance only.

### Every Release Group ranked

| Release Group | UUID | Releases | Classification result |
|---|---|---:|---|
| Alex & Orquesta Liberación | `4dc82373-62d2-43d5-b6de-c0a7c5003afd` | 3 | LEGITIMATE_DISTINCT_EDITION |
| 1 | `d9814db7-5abd-455a-926a-2f1d5773e6dd` | 2 | LEGITIMATE_DISTINCT_EDITION |
| 20 años después | `8568cd3d-dee7-4b02-9191-2f1b337d0eb8` | 2 | LEGITIMATE_DISTINCT_EDITION |
| 20 años después, vol. 2 | `dc99b5bb-4e28-47b1-a316-662e2be97a4c` | 2 | LEGITIMATE_DISTINCT_EDITION |
| Alex | `a8559a7e-c1bb-4313-ba22-5cedb927a86c` | 2 | LEGITIMATE_DISTINCT_EDITION |
| Alex Bueno | `09f1a2b2-6665-45e7-a987-302c9d1cfbf3` | 2 | LEGITIMATE_DISTINCT_EDITION |
| Amores que matan | `39bdfc07-6f07-4ca2-b713-14ae2b294ccd` | 2 | LEGITIMATE_DISTINCT_EDITION |
| Bachata a su tiempo | `41203856-7f24-42b4-a3cd-207b70f6505b` | 2 | LEGITIMATE_DISTINCT_EDITION |
| Bachatas en ternuras | `a3a345c0-b647-44f3-94f5-52426accc201` | 2 | LEGITIMATE_DISTINCT_EDITION |
| Como quisiera | `ddca8c8a-af8f-4dc4-89e8-768b05651e0a` | 2 | LEGITIMATE_DISTINCT_EDITION |
| Corazón duro | `a5b7f77a-5bbb-4033-bf70-48b28cc28609` | 2 | LEGITIMATE_DISTINCT_EDITION |
| Grandes éxitos de Alex Bueno en bachata | `7416fbe6-301d-4581-b781-0564d020eba9` | 2 | LEGITIMATE_DISTINCT_EDITION |
| Los años dorados | `34d6c8eb-ee69-4d44-94f1-b7efc2ead905` | 2 | LEGITIMATE_DISTINCT_EDITION |
| Los grandes de Alex Bueno | `de9c3891-4b8c-4cd7-89ed-c3f18cebdcf4` | 2 | LEGITIMATE_DISTINCT_EDITION |
| Más ternura | `665b0ce0-a258-405c-a738-816176c74d0d` | 2 | LEGITIMATE_DISTINCT_EDITION |
| Me equivoqué | `86562da5-8b1b-4f10-a357-ba1063fdf2be` | 2 | LEGITIMATE_DISTINCT_EDITION |
| Mensajes | `8c084ef1-d3e4-48d0-a4d6-2fa13cf57730` | 2 | LEGITIMATE_DISTINCT_EDITION |
| Pídeme | `2f2c5a66-f504-4813-86be-43280687592a` | 2 | LEGITIMATE_DISTINCT_EDITION |
| Queda algo | `4387db3e-4d15-4cf3-a96c-ede84f704c8f` | 2 | LEGITIMATE_DISTINCT_EDITION |
| Solo merengue | `3ab88511-d3b4-4a47-ad5c-dae239de4dcb` | 2 | LEGITIMATE_DISTINCT_EDITION |
| Ternuras | `1cc50777-94ba-49b5-82ff-0e7b9624531b` | 2 | LEGITIMATE_DISTINCT_EDITION |
| Únicamente tú | `22eda3c9-3bfc-4faf-a245-99d533a2fb4c` | 2 | LEGITIMATE_DISTINCT_EDITION |
| ¡Como nadie! | `ad734714-794c-4725-9b87-b252ba2254aa` | 1 | UNIQUE_CANONICAL_RELEASE |
| 20 Exitos: Alex Bueno, Vol. 1 & 2 | `02fbbf62-7a94-4f03-ac3d-1d49055d55a3` | 1 | UNIQUE_CANONICAL_RELEASE |
| 40 años de éxitos | `184aa102-2167-44b3-b5c4-ae3dee902b48` | 1 | UNIQUE_CANONICAL_RELEASE |
| 4x4 en salsa, vol. 1 | `806cb9c3-ddc9-4535-a19c-176b20052935` | 1 | UNIQUE_CANONICAL_RELEASE |
| Bachata a su tiempo (Pistas originales) | `d51f3c3f-92ae-4dd8-96ad-12a588a29c6f` | 1 | UNIQUE_CANONICAL_RELEASE |
| Caminito de Guarenas | `a3c4941a-6cad-49b0-9c21-a3d89b1e4de2` | 1 | UNIQUE_CANONICAL_RELEASE |
| Colegiala (sinfónico) | `817746ff-2904-4af8-ae59-64a5ae9776bc` | 1 | UNIQUE_CANONICAL_RELEASE |
| Con el alma desnuda | `8680c3bb-7fe2-4caa-ab23-834e897b6f2b` | 1 | UNIQUE_CANONICAL_RELEASE |
| Con fe y sentimiento | `6fbb64c3-d461-48d0-b541-f39a9ad9b562` | 1 | UNIQUE_CANONICAL_RELEASE |
| Confesión | `489b71b8-b9af-4d83-a30b-2c59b549e6c7` | 1 | UNIQUE_CANONICAL_RELEASE |
| Corazón duro (Pistas originales) | `729d4ba8-c01d-4540-abcd-3b9a0d381ba3` | 1 | UNIQUE_CANONICAL_RELEASE |
| DE NADA VALE | `63822c07-752e-469d-b3cf-7dc976d230b5` | 1 | UNIQUE_CANONICAL_RELEASE |
| Déjame vivir | `01941d5b-36ea-4614-9e10-166ccefced43` | 1 | UNIQUE_CANONICAL_RELEASE |
| Diferente | `752c2040-3be5-422e-9bd4-9fb8ac5c4177` | 1 | UNIQUE_CANONICAL_RELEASE |
| Dos x uno | `9207d1ca-7d5c-4f4e-9fe0-9b0a071b7a16` | 1 | UNIQUE_CANONICAL_RELEASE |
| El más completo | `cb1a80f7-abe0-468a-908b-a25f56770a4c` | 1 | UNIQUE_CANONICAL_RELEASE |
| Elizabeth (remix) | `4edc95bb-207c-44fa-8b8e-ee05ee4687a2` | 1 | UNIQUE_CANONICAL_RELEASE |
| En esta Navidad | `5be1eb4b-1d6c-4a51-90fb-da4d32f5f7b2` | 1 | UNIQUE_CANONICAL_RELEASE |
| Entre bachata y merengue | `67c22dd4-ff9d-43a7-9c05-12e1ae1c01a8` | 1 | UNIQUE_CANONICAL_RELEASE |
| Éxitos de Alex Bueno | `c6f8793c-fc91-43db-aec6-41c273a39b76` | 1 | UNIQUE_CANONICAL_RELEASE |
| Gozar la vida | `a5b957c5-36f9-4e44-968c-fccaed397982` | 1 | UNIQUE_CANONICAL_RELEASE |
| Grandes éxitos | `af01603b-1a15-4850-bef8-1ed8ea717abd` | 1 | UNIQUE_CANONICAL_RELEASE |
| Hipócrita | `e322cb82-d991-48f3-9318-06675231ecd0` | 1 | UNIQUE_CANONICAL_RELEASE |
| Lluvia y samba | `7347574f-0dc8-4ed3-a01a-cdfec867855c` | 1 | UNIQUE_CANONICAL_RELEASE |
| Los rostros de la bachata | `f9bf109e-179b-4ea6-bfb4-e29882067a5e` | 1 | UNIQUE_CANONICAL_RELEASE |
| Los rostros del merengue | `f373d106-5dc8-4060-bbd0-06c39002d8a0` | 1 | UNIQUE_CANONICAL_RELEASE |
| Mega MixHits | `88d6e51d-744b-40f8-9946-504c6dfc5987` | 1 | UNIQUE_CANONICAL_RELEASE |
| Merengue y más | `e43882ac-375c-499f-abac-bbf459a3f663` | 1 | UNIQUE_CANONICAL_RELEASE |
| No te olvidaré | `150a8446-1799-4dde-a828-0f50b293ca8c` | 1 | UNIQUE_CANONICAL_RELEASE |
| Nuestro amor | `069570ec-9366-4a28-a928-01f17b5a1721` | 1 | UNIQUE_CANONICAL_RELEASE |
| Popurrí de bachatas | `9c9319a9-6c42-4364-b318-50a069123979` | 1 | UNIQUE_CANONICAL_RELEASE |
| Que vuelva | `f85a0a91-c78f-41b6-8d78-a2906d92759f` | 1 | UNIQUE_CANONICAL_RELEASE |
| Que vuelva | `dd4d1a2d-b113-40f0-beba-523a335f381b` | 1 | UNIQUE_CANONICAL_RELEASE |
| Regresar al amor | `ba464993-c61d-46de-a55d-5f422e1981ca` | 1 | UNIQUE_CANONICAL_RELEASE |
| Solo merengue (Pistas originales) | `6b3db8b2-5e75-474e-8d27-defb9c30d6d8` | 1 | UNIQUE_CANONICAL_RELEASE |
| Tiemblas | `c04e4994-9c1e-456c-8cac-b3526f9837c0` | 1 | UNIQUE_CANONICAL_RELEASE |
| Toqué fondo | `fd8bf81d-2665-4240-a8e9-d2f5435b1e6f` | 1 | UNIQUE_CANONICAL_RELEASE |
| Tranquilo y tropical | `6d5dd977-87d2-4a6d-8cc7-879232d5b80f` | 1 | UNIQUE_CANONICAL_RELEASE |
| Uniquehits | `45a1aec8-f335-49ab-9d03-6ccb35a25c71` | 1 | UNIQUE_CANONICAL_RELEASE |

## Original Release context and legacy pointers

All 638 Recordings have a legacy `recordings.release_id` pointer, and every pointer is at least a real Track appearance. However, **62 do not point to the earliest verified Release appearance**. The Recording manifest records the legacy pointer, earliest verified appearance and all appearances for every row. No mutation is proposed; representative/original context must be redesigned separately.

## Dependency graph and estimated cleanup impact

| Future action area | Estimated impact |
|---|---:|
| Recordings potentially removable | 56 |
| Tracks to repoint | 56 |
| Platform rows on redundant candidates | 409 |
| ISRC associations to reconcile | 56 |
| Legacy release pointers on redundant rows | 56 |
| Work links on redundant rows | 0 |
| Normalized credits on redundant rows | 0 |
| Release rows potentially removable | 0 |
| Duplicate-Release Tracks | 0 |
| Release-artist / cover / analytics rows affected | 0 |

Dynamic FK discovery was used for both Recordings and Releases. Before execution, each of the 56 candidates requires a fresh exact dependency manifest, source-level ISRC reconciliation, and platform destination validation. The present audit is not executable.

## Root cause

The pattern is a single historical import episode: Alex Releases were created between 2026-05-16T01:55:13.882Z and 2026-05-16T01:55:20.238Z, Recordings between 2026-05-18T11:43:54.368Z and 2026-05-18T16:11:53.215Z, and Tracks shortly afterward. Distinct MBIDs were promoted to canonical entities, compilation observations fragmented Recording identity, normalized Release product fields were incompletely populated, and provider destinations were copied across source Recording observations. Later governance work added only four Work links and six credits; it did not create the clutter.

Quantified causes overlap: 50 strong same-title/shared-ISRC/duration duplicate clusters; 988 cross-Recording platform-destination groups; 62 misleading representative Release pointers; and 111 Arrangement-style findings that the present schema intentionally cannot canonicalize. Future ingestion must choose `MATCH EXISTING RECORDING/RELEASE`, `CREATE DISTINCT VERSION/EDITION`, or `NEEDS EDITORIAL REVIEW`.

## Recommended cleanup sequence

1. Review the 50 candidate families and approve exact survivor/redundant UUID pairs; unresolved rows remain excluded.
2. Build a fixed Recording execution manifest from a fresh dependency snapshot.
3. Populate only approved Version profiles/relationships through the existing governed path; keep Arrangement holds out.
4. Repoint the 56 legitimate Tracks family by family.
5. Reconcile unique/duplicate ISRC provenance and normalized credits/Work dependencies.
6. Validate every platform destination; move unique correct links, delete exact survivor duplicates and wrong-version clutter, leave unresolved destinations untouched.
7. Delete only approved redundant Recording rows in one rehearsed transaction.
8. Re-audit Release fingerprints after Recording cleanup; current evidence authorizes no Release deletion.
9. Validate artist/release/song/search/admin surfaces and unrelated-artist invariants.
10. Design Arrangement/Expression architecture separately before resolving the 111 holds.

## Manifest checksums

| Artifact | SHA-256 |
|---|---|
| `manifests/alex-bueno-recording-identity-audit.json` | `22E953860FFDBC3E1E673FBC474D916CA1988DDE38C8EBAA7E0B707C7B14EA6D` |
| `manifests/alex-bueno-release-identity-audit.json` | `9E501C10B0A2D7F1131BD29630DF006A0ABA37A227F5D7B68727B084D6AAFDFF` |
| `manifests/alex-bueno-recording-version-review-manifest.json` | `283DB12C65C4F1E8CD926C754F20A7B3D9F43D23F1F122F971A892792EC56B2D` |

## Stop

The complete current Alex Bueno scope is accounted for. No destructive cleanup, Version population, Arrangement implementation, credit mutation, platform cleanup, Release cleanup or UI work was performed. The task stops before execution approval.
