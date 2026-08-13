# JLG Recording Version Production Population

**Status:** completed and validated in production  
**Execution:** 2026-08-12 22:32 EDT  
**Approved scope:** exactly 53 resolved profiles and eight proven `edit_of` relationships

## 1. Approved scope

The fixed population manifest was derived from the reviewed 67-finding manifest by selecting only non-unresolved entries with a nonempty approved profile. No broad execution-time inference was used. The eight relationships are the exact approved shorter-edit → full-performance pairs.

Explicitly excluded: all ten unresolved findings, all eight editorial overrides, every Arrangement-only fact, all three credit follow-ups, speculative remix/rerecording relationships, legacy disambiguation cleanup, Release/platform changes, UI work, other artists, and Alex Bueno.

## 2. Fresh backup

| Item | Result |
| --- | --- |
| Archive | `backups/jlg-recording-version-population/mangulina-production-pre-jlg-version-population-20260812T222525-0400.dump` |
| Timestamp | 2026-08-12 22:25:25 EDT |
| Size | 20,936,018 bytes |
| SHA-256 | `621CC8EC01A7B19C6A7EC9351F65E9786B058242C6E508206FDB7AAC6300F691` |
| PostgreSQL | 17.6 |
| Validation | `pg_restore --list` passed; 1,882 TOC entries |

Machine record: `JLG_RECORDING_VERSION_POPULATION_BACKUP.json`.

## 3. Production manifest

Path: `manifests/jlg-recording-version-production-manifest.json`  
SHA-256: `9D30F1222D94BE09F95AF3842B78D481DECFE543AD87518D5478E0C9854E93B3`  
Contents: 9 deduplicated internal research-report sources, 53 complete profile saves, and eight `edit_of` saves. Every operation has a fixed idempotency UUID.

## 4. Preflight

The final read-only preflight passed at 2026-08-13T02:32:06.422Z: zero profiles, zero relationships, 327 JLG Recordings, 1,452 JLG Tracks, 17,051 global Recordings, 22,756 global Tracks, and 3,169 Releases. All 53 UUIDs existed, were in JLG scope, and had Track context. All eight pairs were absent. Owner capability checks passed. The JLG disambiguation hash was `2b90eeefe5ccf4e8973ba683c52b8ab4c3f579bf16ca72313005b385feb0634e`.

## 5. Relationship governance implementation

Migration `20260816000000_govern_recording_derivation_relationships.sql` adds the smallest required governed path:

- guarded direct-write trigger with FK-cascade exception only;
- SECURITY DEFINER save/clear operations;
- `recording.version_manage` authority check;
- controlled type and both-Recording validation;
- advisory-lock/idempotency handling;
- assertion, Recording target, evidence, executed decision, and audit history;
- ordinary-client execute revocation and service-role-only execution.

No new capability or subsystem was created. The existing capability and governance tables are reused.

## 6. Rehearsal and rollback

The fresh production backup was restored into isolated PostgreSQL 17 on port 55432. The exact migration and manifest changed profiles 0→53 and relationships 0→8, while all catalog counts remained stable. It produced 61 assertions, 61 evidence links, 61 decisions, and 61 audits. Repeating every governed call with the same key returned its cached result without duplicate rows.

The exact governed rollback executor was then exercised: 53 profile clears and eight relationship clears completed atomically and returned the isolated database to zero canonical rows. A new clean restore and complete rehearsal also passed before production execution.

## 7. Exact 53 profiles

| Title | Recording UUID | Complete profile | Evidence report | Confidence |
| --- | --- | --- | --- | --- |
| Bachata en Fukuoka | `0672bd04-bf0f-4848-8a31-ace1723c7657` | performance_kind=live; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_11_A_SON_DE_GUERRA.md | high |
| Mi bendición | `07e2bf64-ddc4-49d4-80d9-94d1d78628cc` | performance_kind=live; derivation_kind=edit; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_11_A_SON_DE_GUERRA.md | high |
| Kitipun | `0ad921c7-4774-4815-be1d-6a061f710620` | performance_kind=live; performance_date=2021-01-01; performance_date_precision=year; performance_context=Entre Mar y Palmeras | JLG_MANUAL_VERIFICATION_13_LITERAL.md | high |
| A bilirrubina | `0c8dbd99-44cd-45cb-9bc9-e2cd0bc118cd` | performance_kind=studio; derivation_kind=rerecording; language_code=pt; performance_date=1992-01-01; performance_date_precision=year; performance_context=Romance Rosa | JLG_MANUAL_VERIFICATION_05_BACHATA_ROSA.md | high |
| Las avispas | `0d812f30-ce76-458a-aeae-981d3b1e5bed` | performance_kind=live; performance_date=2005-01-01; performance_date_precision=year; performance_context=Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_09_PARA_TI.md | high |
| Tan solo he venido | `1a3faed8-48c4-4b33-aeb2-ad1281014c0a` | performance_kind=live; performance_date=2005-01-01; performance_date_precision=year; performance_context=Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_09_PARA_TI.md | high |
| La travesía | `1c223bf0-a645-4956-853b-94e14243e2c4` | performance_kind=live; derivation_kind=edit; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_10_LA_LLAVE_DE_MI_CORAZON.md | high |
| El Niágara en bicicleta | `1fb2a355-75eb-4b56-b1c8-e531a99c1e45` | performance_kind=live; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_08_NI_ES_LO_MISMO_NI_ES_IGUAL.md | high |
| Vale la pena | `2219fdb5-f214-4c90-8b0c-c48bc60d3513` | performance_kind=live; performance_date=2021-01-01; performance_date_precision=year; performance_context=Entre Mar y Palmeras | JLG_MANUAL_VERIFICATION_08_NI_ES_LO_MISMO_NI_ES_IGUAL.md | high |
| La cosquillita | `2303c139-16c1-4d46-9c25-86f91dae4af4` | performance_kind=live; performance_date=2005-01-01; performance_date_precision=year; performance_context=Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_07_FOGARATE.md | high |
| La llave de mi corazón (dance remix) | `2327c774-04f3-44f9-af03-47b843b07602` | derivation_kind=remix | JLG_MANUAL_VERIFICATION_10_LA_LLAVE_DE_MI_CORAZON.md | high |
| A pedir su mano (versión Privé) | `2f1095cb-a45c-4f55-b0d5-c2d55b1a1576` | performance_kind=studio; derivation_kind=rerecording; performance_date=2020-01-01; performance_date_precision=year; performance_context=Privé | JLG_MANUAL_VERIFICATION_05_BACHATA_ROSA.md | high |
| Para ti | `30d3df34-84f1-42a2-8cda-ba674c90b6a9` | performance_kind=live; performance_date=2021-01-01; performance_date_precision=year; performance_context=Entre Mar y Palmeras | JLG_MANUAL_VERIFICATION_09_PARA_TI.md | high |
| Frío, frío | `334ae297-d150-4a81-9427-a416ecb0aa1d` | performance_kind=live; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_06_AREITO.md | high |
| La llave de mi corazón | `3a123fc6-c471-49a8-9dba-5a0a80403a8d` | performance_kind=live; performance_date=2021-01-01; performance_date_precision=year; performance_context=Entre Mar y Palmeras | JLG_MANUAL_VERIFICATION_10_LA_LLAVE_DE_MI_CORAZON.md | high |
| Bachata en Fukuoka | `3e54974b-5287-4060-ac37-2fe03de0f240` | performance_kind=live; derivation_kind=edit; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_11_A_SON_DE_GUERRA.md | high |
| Ojalá que llueva café | `3f51c25b-8ff1-47b8-91d7-63ba1c0232ba` | performance_kind=live; performance_date=2005-01-01; performance_date_precision=year; performance_context=Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_04_OJALA_QUE_LLUEVA_CAFE.md | high |
| Soldado | `44d97abe-f206-4d93-acc9-a7e4d0ed52b5` | performance_kind=live; performance_date=2005-01-01; performance_date_precision=year; performance_context=Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_09_PARA_TI.md | high |
| Las avispas | `4c7bda9f-bb21-4c25-8b25-dbb8eb0d5151` | performance_kind=live; derivation_kind=edit; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_09_PARA_TI.md | high |
| A pedir su mano | `60e4b7e3-ecfd-4919-9ff3-a940d98b9071` | performance_kind=live; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_05_BACHATA_ROSA.md | high |
| La guagua | `62962b7e-984d-4531-a252-b6656c19ee42` | performance_kind=live; derivation_kind=edit; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_11_A_SON_DE_GUERRA.md | high |
| Como yo | `6531c0fc-bd41-4124-9219-bbcef2e6889a` | performance_kind=live; performance_date=2021-01-01; performance_date_precision=year; performance_context=Entre Mar y Palmeras | JLG_MANUAL_VERIFICATION_10_LA_LLAVE_DE_MI_CORAZON.md | high |
| Bachata rosa | `6ac3e43e-782b-4939-bb7f-e292322eeb4d` | performance_kind=live; performance_date=2002-01-01; performance_date_precision=year; performance_context=Encuentro | JLG_MANUAL_VERIFICATION_05_BACHATA_ROSA.md | high |
| Mi bendición | `6ea97e60-edf5-4411-9e60-79a0f6654f1c` | performance_kind=live; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_11_A_SON_DE_GUERRA.md | high |
| El costo de la vida | `73c3e9dd-859c-4009-877a-ca2424dd8541` | performance_kind=live; performance_date=2005-01-01; performance_date_precision=year; performance_context=Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_06_AREITO.md | high |
| El farolito | `749e731b-9f79-4cfd-b203-d01a8d4c2b45` | performance_kind=live; performance_date=2021-01-01; performance_date_precision=year; performance_context=Entre Mar y Palmeras | JLG_MANUAL_VERIFICATION_07_FOGARATE.md | high |
| La calle | `8ae9a544-398b-4351-949a-04905d0f15b8` | performance_kind=live; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_11_A_SON_DE_GUERRA.md | high |
| Frío, frío | `8b866647-4640-49c2-b711-14a6103b18ed` | performance_kind=live; derivation_kind=edit; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_06_AREITO.md | high |
| Como abeja al panal | `8e8a2b7f-dfd0-49eb-9a1e-94a0f4c91091` | performance_kind=live; performance_date=2005-01-01; performance_date_precision=year; performance_context=Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_05_BACHATA_ROSA.md | high |
| Las avispas | `9623b3d3-3555-49cf-aca2-a3465a6b0728` | performance_kind=live; performance_date=2021-01-01; performance_date_precision=year; performance_context=Entre Mar y Palmeras | JLG_MANUAL_VERIFICATION_09_PARA_TI.md | high |
| Las avispas | `99e8f378-bf0b-4b0d-a177-91894a7eae49` | performance_kind=live; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_09_PARA_TI.md | high |
| A pedir su mano | `9d67be0e-19cf-4a2e-8af8-39302e0d61dd` | performance_kind=live; performance_date=2005-01-01; performance_date_precision=year; performance_context=Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_05_BACHATA_ROSA.md | high |
| La llave de mi corazón | `a242db40-d740-4caa-9cda-119d77cdd79b` | performance_kind=live; derivation_kind=edit; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_10_LA_LLAVE_DE_MI_CORAZON.md | high |
| La guagua | `a266c059-fd40-4c0f-a825-b6b70ca30587` | performance_kind=live; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_11_A_SON_DE_GUERRA.md | high |
| El Niágara en bicicleta | `a3b5b0e0-6739-474e-9187-83d2bc4ff5cb` | performance_kind=live; performance_date=2021-01-01; performance_date_precision=year; performance_context=Entre Mar y Palmeras | JLG_MANUAL_VERIFICATION_08_NI_ES_LO_MISMO_NI_ES_IGUAL.md | high |
| Visa para un sueño | `a72f9729-df72-4cbd-ba1e-e2d98336580e` | performance_kind=live; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_04_OJALA_QUE_LLUEVA_CAFE.md | high |
| La calle | `a7afc633-6a0c-414a-80c1-9b7ec04196bf` | performance_kind=live; derivation_kind=edit; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_11_A_SON_DE_GUERRA.md | high |
| La travesía | `afb28585-a810-47c2-bc3f-6548359618e5` | performance_kind=live; performance_date=2021-01-01; performance_date_precision=year; performance_context=Entre Mar y Palmeras | JLG_MANUAL_VERIFICATION_10_LA_LLAVE_DE_MI_CORAZON.md | high |
| Dance with Me (Si tú no bailas conmigo) | `ba5bb58b-f603-4a45-bd88-c20970664b84` | performance_kind=studio; derivation_kind=rerecording; language_code=en; performance_date=2020-01-01; performance_date_precision=year | JLG_MANUAL_VERIFICATION_10_LA_LLAVE_DE_MI_CORAZON.md | high |
| La travesía | `c9049cc0-fc1a-49c3-8ba9-d27ba0820e95` | performance_kind=live; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_10_LA_LLAVE_DE_MI_CORAZON.md | high |
| Amapola | `d0f3b5c2-e38e-489f-a707-5be5f1a47431` | performance_kind=live; performance_date=2005-01-01; performance_date_precision=year; performance_context=Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_08_NI_ES_LO_MISMO_NI_ES_IGUAL.md | high |
| La bilirrubina | `d1c688c3-b76b-4b11-83a2-49426094922f` | performance_kind=live; performance_date=2005-01-01; performance_date_precision=year; performance_context=Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_05_BACHATA_ROSA.md | high |
| La llave de mi corazón | `d5f7aeb2-6f29-4251-97a9-bb2d480a2efe` | performance_kind=live; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_10_LA_LLAVE_DE_MI_CORAZON.md | high |
| Que me des tu cariño (Portuguese) | `d673e2ea-b217-4243-81d7-a1553a22bf71` | performance_kind=studio; derivation_kind=rerecording; language_code=pt | JLG_MANUAL_VERIFICATION_10_LA_LLAVE_DE_MI_CORAZON.md | high |
| Para ti | `dcb1778e-73a2-4753-ab96-afc828116884` | performance_kind=live; performance_date=2005-01-01; performance_date_precision=year; performance_context=Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_09_PARA_TI.md | high |
| Ojalá que llueva café | `de56973b-8847-4117-abbc-1ab25b66da18` | performance_kind=live; performance_date=2002-01-01; performance_date_precision=year; performance_context=Encuentro | JLG_MANUAL_VERIFICATION_04_OJALA_QUE_LLUEVA_CAFE.md | high |
| Bachata rosa | `e1311fcd-e780-4713-9efe-b39590128ef9` | performance_kind=live; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_05_BACHATA_ROSA.md | high |
| El Niágara en bicicleta (remix) | `e382ea92-7519-406e-869c-7e479e00a70c` | derivation_kind=remix | JLG_MANUAL_VERIFICATION_08_NI_ES_LO_MISMO_NI_ES_IGUAL.md | high |
| Medicine for My Soul | `e703a9c5-68a4-4b72-bfca-1c591d74b830` | performance_kind=studio; derivation_kind=rerecording | JLG_MANUAL_VERIFICATION_10_LA_LLAVE_DE_MI_CORAZON.md | high |
| Rosalía | `ee5f3e74-3f8a-462a-8018-c588066d0f33` | performance_kind=live; performance_date=2005-01-01; performance_date_precision=year; performance_context=Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_05_BACHATA_ROSA.md | high |
| Vale la pena | `f178eaee-bb21-4f01-b527-4da27126bbbe` | performance_kind=live; performance_date=2005-01-01; performance_date_precision=year; performance_context=Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_08_NI_ES_LO_MISMO_NI_ES_IGUAL.md | high |
| Amapola | `f4216f25-d151-4dd6-b203-3c8d61e5bdb0` | performance_kind=live; performance_date=2002-01-01; performance_date_precision=year; performance_context=Encuentro | JLG_MANUAL_VERIFICATION_08_NI_ES_LO_MISMO_NI_ES_IGUAL.md | high |
| Romance rosa | `f96218bb-e5c0-4384-9a9d-a948aaa3d6a1` | performance_kind=studio; derivation_kind=rerecording; language_code=pt; performance_date=1992-01-01; performance_date_precision=year; performance_context=Romance Rosa | JLG_MANUAL_VERIFICATION_05_BACHATA_ROSA.md | high |

## 8. Exact eight relationships

| Edit Recording | Type | Full/source fixation | Evidence |
| --- | --- | --- | --- |
| `07e2bf64-ddc4-49d4-80d9-94d1d78628cc` | edit_of | `6ea97e60-edf5-4411-9e60-79a0f6654f1c` | Manual verification aligned official release objects and identified full and shorter presentations of one performance. |
| `1c223bf0-a645-4956-853b-94e14243e2c4` | edit_of | `c9049cc0-fc1a-49c3-8ba9-d27ba0820e95` | Manual verification aligned official release objects and identified full and shorter presentations of one performance. |
| `3e54974b-5287-4060-ac37-2fe03de0f240` | edit_of | `0672bd04-bf0f-4848-8a31-ace1723c7657` | Manual verification aligned official release objects and identified full and shorter presentations of one performance. |
| `4c7bda9f-bb21-4c25-8b25-dbb8eb0d5151` | edit_of | `99e8f378-bf0b-4b0d-a177-91894a7eae49` | Manual verification aligned official release objects and identified full and shorter presentations of one performance. |
| `62962b7e-984d-4531-a252-b6656c19ee42` | edit_of | `a266c059-fd40-4c0f-a825-b6b70ca30587` | Manual verification aligned official release objects and identified full and shorter presentations of one performance. |
| `8b866647-4640-49c2-b711-14a6103b18ed` | edit_of | `334ae297-d150-4a81-9427-a416ecb0aa1d` | Manual verification aligned official release objects and identified full and shorter presentations of one performance. |
| `a242db40-d740-4caa-9cda-119d77cdd79b` | edit_of | `d5f7aeb2-6f29-4251-97a9-bb2d480a2efe` | Manual verification aligned official release objects and identified full and shorter presentations of one performance. |
| `a7afc633-6a0c-414a-80c1-9b7ec04196bf` | edit_of | `8ae9a544-398b-4351-949a-04905d0f15b8` | Manual verification aligned official release objects and identified full and shorter presentations of one performance. |

## 9. Production execution and governance

The guarded executor required `ALLOW_JLG_VERSION_POPULATION=APPROVED_53_JLG_PROFILES_8_EDIT_OF_RELATIONSHIPS` and an explicit `PRODUCTION` target. One database transaction created the nine report sources, invoked all governed saves, compared canonical state to the fixed manifest, validated every governance chain and postcondition, and committed only after all checks passed.

Production result: 0→53 profiles and 0→8 relationships. Governance totals for the authorized canonical writes are 61 assertions, 61 Recording targets, 61 evidence links, 61 executed decisions, 61 decision/assertion links, 61 audit events, and 61 mutation idempotency records.

## 10. Postvalidation and before/after counts

| Measure | Before | After |
| --- | ---: | ---: |
| Recording version profiles | 0 | 53 |
| Recording relationships | 0 | 8 |
| Global Recordings | 17,051 | 17,051 |
| Global Tracks | 22,756 | 22,756 |
| Releases | 3,169 | 3,169 |
| JLG Recordings | 327 | 327 |
| JLG Tracks | 1,452 | 1,452 |
| Recording credits | 58 | 58 |
| Alex Bueno Recordings | 638 | 638 |
| Alex Bueno Tracks | 839 | 839 |

All 53 profiles and all eight pairs equal the manifest exactly. No reverse or extra relationship exists. All ten unresolved Recording UUIDs have zero profiles. No Arrangement table exists and no Arrangement/style wording entered profile context. The legacy disambiguation hash remained byte-for-byte identical. The three credit follow-ups were not changed.

Representative identity-summary checks passed for 2002/2005/multiple live events, full versus edit, Portuguese rerecording, Privé, and both remixes. No `remix_of` or speculative rerecording relationship was created.

## 11. Application regression

Script syntax and TypeScript checks passed. The repository suite passed 204/204 tests. The optimized Next.js build passed and generated/compiled the existing JLG artist, song, search, Release, Recording Workspace, admin Recording search, and platform-selector routes. No UI source was changed.

## 12. Rollback procedure

Preferred canonical rollback is the fixed `scripts/rollbackJlgRecordingVersionPopulation.mjs` executor with token `APPROVED_EXACT_53_PROFILES_8_EDITS_ROLLBACK`. It atomically calls governed clear operations for the exact eight relationships and 53 profiles. It preserves unrelated governance data and intentionally leaves the audit/evidence history of both population and reversal.

After a governed rollback, the original population idempotency keys remain consumed. Reapplication requires a separately reviewed manifest/version with new keys; do not bypass idempotency. If full point-in-time reversal is required, stop writes, validate SHA-256, restore the fresh custom archive into a compatible new database, validate the 0/0 and catalog baseline, and perform controlled cutover. Do not use ad-hoc DELETE statements.

The schema-level rollback plan `supabase/plans/20260816000000_govern_recording_derivation_relationships_rollback.sql` may be used only after canonical relationships have been governed-clear and only if removal of the reusable governance path is separately authorized.

## 13. Remaining work and stop

The ten unresolved cases, 15 Arrangement holds, eight optional overrides, three credit follow-ups, legacy-disambiguation parity, UI presentation, `recordings.release_id`, platform cleanup, and Alex Bueno remain untouched. The next decision is how to expose structured identity in existing admin and public read paths. No such work was started here.
