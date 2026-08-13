# JLG Recording Version Review Manifest

**Status:** generated, validated, and not populated  
**Authority:** completed independent-source JLG manual verification corpus  
**Manifest:** `manifests/jlg-recording-version-review-manifest.json`

## Scope and safety result

The exact 67 cumulative version/disambiguation findings were converted into one consolidated entry per surviving Recording UUID. The accounting follows the authoritative album increments: verification 03 = 2, 04 = 7, 05 = 12, 06 = 5, 07 = 2, 08 = 9, 09 = 8, 10 = 12, 11 = 8, 12 = 0, and 13 = 2.

MusicBrainz identity wording was not used as authority. Production remained at zero profile rows and zero Recording relationships. No disambiguation, Recording, Track, Release, governance, Arrangement, UI, Alex Bueno, or other musical data was changed.

## Exact manifest counts

| Measure | Count |
| --- | ---: |
| Verified findings reviewed | 67 |
| Unique surviving Recording UUIDs | 67 |
| Profiles proposed | 55 |
| Profiles with performance kind | 53 |
| — studio / live / demo / rehearsal / other | 6 / 47 / 0 / 0 / 0 |
| Profiles with derivation kind | 16 |
| — rerecording / remix / edit / alternate take / medley / other | 6 / 2 / 8 / 0 / 0 / 0 |
| Profiles with language code | 4 |
| Profiles with performance date | 30 |
| Profiles with performance context | 49 |
| Proven Recording relationships proposed | 8 |
| Arrangement holds (including mixed cases) | 15 |
| Derived-only findings | 0 |
| Derived/credit follow-ups | 3 |
| Editorial overrides proposed | 8 |
| Unresolved/no-write findings | 10 |
| — unresolved with no profile at all | 8 |
| Findings remapped from deleted UUIDs | 0 |

## Profiles Ready for Population

These 53 profiles have no unresolved flag. Population remains unauthorized in this task.

| Title | Recording UUID | Proposed profile | Conceptual descriptor | Evidence | Confidence |
| --- | --- | --- | --- | --- | --- |
| A bilirrubina | `0c8dbd99-44cd-45cb-9bc9-e2cd0bc118cd` | performance_kind=studio; derivation_kind=rerecording; language_code=pt; performance_date=1992-01-01; performance_date_precision=year; performance_context=Romance Rosa | studio · rerecording · pt language · 1992 · Romance Rosa | JLG_MANUAL_VERIFICATION_05_BACHATA_ROSA.md — Song: La bilirrubina: Independent Romance Rosa repertoire and official language-title evidence establish a Portuguese studio performance. | high |
| A pedir su mano | `60e4b7e3-ecfd-4919-9ff3-a940d98b9071` | performance_kind=live; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | live · Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_05_BACHATA_ROSA.md — Song: A pedir su mano: Official Asondeguerra Tour release identifies the full stadium-tour performance; release wording leaves 2012/2013 performance-year precision ambiguous. | high |
| A pedir su mano | `9d67be0e-19cf-4a2e-8af8-39302e0d61dd` | performance_kind=live; performance_date=2005-01-01; performance_date_precision=year; performance_context=Estadio Olímpico, Santo Domingo | live · 2005 · Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_05_BACHATA_ROSA.md — Song: A pedir su mano: Official Concierto Aniversario release, concert ISRC, and event-specific official audio establish a distinct 2005 stadium performance. | high |
| A pedir su mano (versión Privé) | `2f1095cb-a45c-4f55-b0d5-c2d55b1a1576` | performance_kind=studio; derivation_kind=rerecording; performance_date=2020-01-01; performance_date_precision=year; performance_context=Privé | studio · rerecording · 2020 · Privé | JLG_MANUAL_VERIFICATION_05_BACHATA_ROSA.md — Song: A pedir su mano: Official Privé audio and separately credited intimate ensemble establish a new 2020 studio rerecording. | high |
| Amapola | `d0f3b5c2-e38e-489f-a707-5be5f1a47431` | performance_kind=live; performance_date=2005-01-01; performance_date_precision=year; performance_context=Estadio Olímpico, Santo Domingo | live · 2005 · Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_08_NI_ES_LO_MISMO_NI_ES_IGUAL.md — Song: Amapola: Official Concierto Aniversario release, concert ISRC, and event-specific official audio establish a distinct 2005 stadium performance. | high |
| Amapola | `f4216f25-d151-4dd6-b203-3c8d61e5bdb0` | performance_kind=live; performance_date=2002-01-01; performance_date_precision=year; performance_context=Encuentro | live · 2002 · Encuentro | JLG_MANUAL_VERIFICATION_08_NI_ES_LO_MISMO_NI_ES_IGUAL.md — Song: Amapola: Independent Encuentro documentation establishes a 2002 staged live performance. | high |
| Bachata en Fukuoka | `0672bd04-bf0f-4848-8a31-ace1723c7657` | performance_kind=live; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | live · Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_11_A_SON_DE_GUERRA.md — Song: Bachata en Fukuoka: Official Asondeguerra Tour release identifies the full stadium-tour performance; release wording leaves 2012/2013 performance-year precision ambiguous. | high |
| Bachata en Fukuoka | `3e54974b-5287-4060-ac37-2fe03de0f240` | performance_kind=live; derivation_kind=edit; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | live · edit · Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_11_A_SON_DE_GUERRA.md — Song: Bachata en Fukuoka: Official release objects establish a shorter edit of the same Asondeguerra Tour performance represented by the full-audio Recording. | high |
| Bachata rosa | `6ac3e43e-782b-4939-bb7f-e292322eeb4d` | performance_kind=live; performance_date=2002-01-01; performance_date_precision=year; performance_context=Encuentro | live · 2002 · Encuentro | JLG_MANUAL_VERIFICATION_05_BACHATA_ROSA.md — Song: Bachata rosa: Independent Encuentro catalogs establish a distinct 2002 live performance. | high |
| Bachata rosa | `e1311fcd-e780-4713-9efe-b39590128ef9` | performance_kind=live; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | live · Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_05_BACHATA_ROSA.md — Song: Bachata rosa: Official Asondeguerra Tour release identifies the full stadium-tour performance; release wording leaves 2012/2013 performance-year precision ambiguous. | high |
| Como abeja al panal | `8e8a2b7f-dfd0-49eb-9a1e-94a0f4c91091` | performance_kind=live; performance_date=2005-01-01; performance_date_precision=year; performance_context=Estadio Olímpico, Santo Domingo | live · 2005 · Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_05_BACHATA_ROSA.md — Song: Como abeja al panal: Official Concierto Aniversario release, concert ISRC, and event-specific official audio establish a distinct 2005 stadium performance. | high |
| Como yo | `6531c0fc-bd41-4124-9219-bbcef2e6889a` | performance_kind=live; performance_date=2021-01-01; performance_date_precision=year; performance_context=Entre Mar y Palmeras | live · 2021 · Entre Mar y Palmeras | JLG_MANUAL_VERIFICATION_10_LA_LLAVE_DE_MI_CORAZON.md — Song: Como yo: Official Entre Mar y Palmeras release and official performance video establish a separate 2021 live performance. | high |
| Dance with Me (Si tú no bailas conmigo) | `ba5bb58b-f603-4a45-bd88-c20970664b84` | performance_kind=studio; derivation_kind=rerecording; language_code=en; performance_date=2020-01-01; performance_date_precision=year | studio · rerecording · en language · 2020 | JLG_MANUAL_VERIFICATION_10_LA_LLAVE_DE_MI_CORAZON.md — Si tú no bailas conmigo ledger: Official 2020 English collaboration has a separate ISRC and newly recorded studio performance. | high |
| El costo de la vida | `73c3e9dd-859c-4009-877a-ca2424dd8541` | performance_kind=live; performance_date=2005-01-01; performance_date_precision=year; performance_context=Estadio Olímpico, Santo Domingo | live · 2005 · Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_06_AREITO.md — Song: El costo de la vida: Official Concierto Aniversario release, concert ISRC, and event-specific official audio establish a distinct 2005 stadium performance. | high |
| El farolito | `749e731b-9f79-4cfd-b203-d01a8d4c2b45` | performance_kind=live; performance_date=2021-01-01; performance_date_precision=year; performance_context=Entre Mar y Palmeras | live · 2021 · Entre Mar y Palmeras | JLG_MANUAL_VERIFICATION_07_FOGARATE.md — Song: El farolito: Official Entre Mar y Palmeras release and official performance video establish a separate 2021 live performance. | high |
| El Niágara en bicicleta | `1fb2a355-75eb-4b56-b1c8-e531a99c1e45` | performance_kind=live; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | live · Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_08_NI_ES_LO_MISMO_NI_ES_IGUAL.md — Song: El Niágara en bicicleta: Official Asondeguerra Tour release identifies the full stadium-tour performance; release wording leaves 2012/2013 performance-year precision ambiguous. | high |
| El Niágara en bicicleta | `a3b5b0e0-6739-474e-9187-83d2bc4ff5cb` | performance_kind=live; performance_date=2021-01-01; performance_date_precision=year; performance_context=Entre Mar y Palmeras | live · 2021 · Entre Mar y Palmeras | JLG_MANUAL_VERIFICATION_08_NI_ES_LO_MISMO_NI_ES_IGUAL.md — Song: El Niágara en bicicleta: Official Entre Mar y Palmeras release and official performance video establish a separate 2021 live performance. | high |
| El Niágara en bicicleta (remix) | `e382ea92-7519-406e-869c-7e479e00a70c` | derivation_kind=remix | remix | JLG_MANUAL_VERIFICATION_08_NI_ES_LO_MISMO_NI_ES_IGUAL.md — Song: El Niágara en bicicleta: Official 2025 remix single establishes remixed audio, but the exact source Recording was not independently proven. | high |
| Frío, frío | `334ae297-d150-4a81-9427-a416ecb0aa1d` | performance_kind=live; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | live · Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_06_AREITO.md — Song: Frío, frío: Official Asondeguerra Tour release identifies the full stadium-tour performance; release wording leaves 2012/2013 performance-year precision ambiguous. | high |
| Frío, frío | `8b866647-4640-49c2-b711-14a6103b18ed` | performance_kind=live; derivation_kind=edit; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | live · edit · Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_06_AREITO.md — Song: Frío, frío: Official release objects establish a shorter edit of the same Asondeguerra Tour performance represented by the full-audio Recording. | high |
| Kitipun | `0ad921c7-4774-4815-be1d-6a061f710620` | performance_kind=live; performance_date=2021-01-01; performance_date_precision=year; performance_context=Entre Mar y Palmeras | live · 2021 · Entre Mar y Palmeras | JLG_MANUAL_VERIFICATION_13_LITERAL.md — Song: Kitipun: Official Entre Mar y Palmeras release and official performance video establish a separate 2021 live performance. | high |
| La bilirrubina | `d1c688c3-b76b-4b11-83a2-49426094922f` | performance_kind=live; performance_date=2005-01-01; performance_date_precision=year; performance_context=Estadio Olímpico, Santo Domingo | live · 2005 · Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_05_BACHATA_ROSA.md — Song: La bilirrubina: Official Concierto Aniversario release, concert ISRC, and event-specific official audio establish a distinct 2005 stadium performance. | high |
| La calle | `8ae9a544-398b-4351-949a-04905d0f15b8` | performance_kind=live; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | live · Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_11_A_SON_DE_GUERRA.md — Song: La calle: Official Asondeguerra Tour release identifies the full stadium-tour performance; release wording leaves 2012/2013 performance-year precision ambiguous. | high |
| La calle | `a7afc633-6a0c-414a-80c1-9b7ec04196bf` | performance_kind=live; derivation_kind=edit; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | live · edit · Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_11_A_SON_DE_GUERRA.md — Song: La calle: Official release objects establish a shorter edit of the same Asondeguerra Tour performance represented by the full-audio Recording. | high |
| La cosquillita | `2303c139-16c1-4d46-9c25-86f91dae4af4` | performance_kind=live; performance_date=2005-01-01; performance_date_precision=year; performance_context=Estadio Olímpico, Santo Domingo | live · 2005 · Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_07_FOGARATE.md — Song: La cosquillita: Official Concierto Aniversario release, concert ISRC, and event-specific official audio establish a distinct 2005 stadium performance. | high |
| La guagua | `62962b7e-984d-4531-a252-b6656c19ee42` | performance_kind=live; derivation_kind=edit; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | live · edit · Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_11_A_SON_DE_GUERRA.md — Song: La guagua: Official release objects establish a shorter edit of the same Asondeguerra Tour performance represented by the full-audio Recording. | high |
| La guagua | `a266c059-fd40-4c0f-a825-b6b70ca30587` | performance_kind=live; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | live · Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_11_A_SON_DE_GUERRA.md — Song: La guagua: Official Asondeguerra Tour release identifies the full stadium-tour performance; release wording leaves 2012/2013 performance-year precision ambiguous. | high |
| La llave de mi corazón | `3a123fc6-c471-49a8-9dba-5a0a80403a8d` | performance_kind=live; performance_date=2021-01-01; performance_date_precision=year; performance_context=Entre Mar y Palmeras | live · 2021 · Entre Mar y Palmeras | JLG_MANUAL_VERIFICATION_10_LA_LLAVE_DE_MI_CORAZON.md — Song: La llave de mi corazón: Official Entre Mar y Palmeras release and official performance video establish a separate 2021 live performance. | high |
| La llave de mi corazón | `a242db40-d740-4caa-9cda-119d77cdd79b` | performance_kind=live; derivation_kind=edit; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | live · edit · Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_10_LA_LLAVE_DE_MI_CORAZON.md — Song: La llave de mi corazón: Official release objects establish a shorter edit of the same Asondeguerra Tour performance represented by the full-audio Recording. | high |
| La llave de mi corazón | `d5f7aeb2-6f29-4251-97a9-bb2d480a2efe` | performance_kind=live; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | live · Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_10_LA_LLAVE_DE_MI_CORAZON.md — Song: La llave de mi corazón: Official Asondeguerra Tour release identifies the full stadium-tour performance; release wording leaves 2012/2013 performance-year precision ambiguous. | high |
| La llave de mi corazón (dance remix) | `2327c774-04f3-44f9-af03-47b843b07602` | derivation_kind=remix | remix | JLG_MANUAL_VERIFICATION_10_LA_LLAVE_DE_MI_CORAZON.md — La llave de mi corazón ledger: Official dance remix object establishes remixed audio; exact source fixation is not independently proven. | high |
| La travesía | `1c223bf0-a645-4956-853b-94e14243e2c4` | performance_kind=live; derivation_kind=edit; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | live · edit · Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_10_LA_LLAVE_DE_MI_CORAZON.md — Song: La travesía: Official release objects establish a shorter edit of the same Asondeguerra Tour performance represented by the full-audio Recording. | high |
| La travesía | `afb28585-a810-47c2-bc3f-6548359618e5` | performance_kind=live; performance_date=2021-01-01; performance_date_precision=year; performance_context=Entre Mar y Palmeras | live · 2021 · Entre Mar y Palmeras | JLG_MANUAL_VERIFICATION_10_LA_LLAVE_DE_MI_CORAZON.md — Song: La travesía: Official Entre Mar y Palmeras release and official performance video establish a separate 2021 live performance. | high |
| La travesía | `c9049cc0-fc1a-49c3-8ba9-d27ba0820e95` | performance_kind=live; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | live · Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_10_LA_LLAVE_DE_MI_CORAZON.md — Song: La travesía: Official Asondeguerra Tour release identifies the full stadium-tour performance; release wording leaves 2012/2013 performance-year precision ambiguous. | high |
| Las avispas | `0d812f30-ce76-458a-aeae-981d3b1e5bed` | performance_kind=live; performance_date=2005-01-01; performance_date_precision=year; performance_context=Estadio Olímpico, Santo Domingo | live · 2005 · Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_09_PARA_TI.md — Song: Las avispas: Official Concierto Aniversario release, concert ISRC, and event-specific official audio establish a distinct 2005 stadium performance. | high |
| Las avispas | `4c7bda9f-bb21-4c25-8b25-dbb8eb0d5151` | performance_kind=live; derivation_kind=edit; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | live · edit · Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_09_PARA_TI.md — Song: Las avispas: Official release objects establish a shorter edit of the same Asondeguerra Tour performance represented by the full-audio Recording. | high |
| Las avispas | `9623b3d3-3555-49cf-aca2-a3465a6b0728` | performance_kind=live; performance_date=2021-01-01; performance_date_precision=year; performance_context=Entre Mar y Palmeras | live · 2021 · Entre Mar y Palmeras | JLG_MANUAL_VERIFICATION_09_PARA_TI.md — Song: Las avispas: Official Entre Mar y Palmeras release and official performance video establish a separate 2021 live performance. | high |
| Las avispas | `99e8f378-bf0b-4b0d-a177-91894a7eae49` | performance_kind=live; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | live · Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_09_PARA_TI.md — Song: Las avispas: Official Asondeguerra Tour release identifies the full stadium-tour performance; release wording leaves 2012/2013 performance-year precision ambiguous. | high |
| Medicine for My Soul | `e703a9c5-68a4-4b72-bfca-1c591d74b830` | performance_kind=studio; derivation_kind=rerecording | studio · rerecording | JLG_MANUAL_VERIFICATION_10_LA_LLAVE_DE_MI_CORAZON.md — Medicine for My Soul ledger: Official fan-edition duet is a newly recorded studio performance; collaborator identity derives from credits. | high |
| Mi bendición | `07e2bf64-ddc4-49d4-80d9-94d1d78628cc` | performance_kind=live; derivation_kind=edit; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | live · edit · Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_11_A_SON_DE_GUERRA.md — Song: Mi bendición: Official release objects establish a shorter edit of the same Asondeguerra Tour performance represented by the full-audio Recording. | high |
| Mi bendición | `6ea97e60-edf5-4411-9e60-79a0f6654f1c` | performance_kind=live; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | live · Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_11_A_SON_DE_GUERRA.md — Song: Mi bendición: Official Asondeguerra Tour release identifies the full stadium-tour performance; release wording leaves 2012/2013 performance-year precision ambiguous. | high |
| Ojalá que llueva café | `3f51c25b-8ff1-47b8-91d7-63ba1c0232ba` | performance_kind=live; performance_date=2005-01-01; performance_date_precision=year; performance_context=Estadio Olímpico, Santo Domingo | live · 2005 · Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_04_OJALA_QUE_LLUEVA_CAFE.md — Song: Ojalá que llueva café: Official Concierto Aniversario release, concert ISRC, and event-specific official audio establish a distinct 2005 stadium performance. | high |
| Ojalá que llueva café | `de56973b-8847-4117-abbc-1ab25b66da18` | performance_kind=live; performance_date=2002-01-01; performance_date_precision=year; performance_context=Encuentro | live · 2002 · Encuentro | JLG_MANUAL_VERIFICATION_04_OJALA_QUE_LLUEVA_CAFE.md — Dedicated Ojalá identity family: Independent physical and album catalogs establish the 2002 Encuentro live project and this distinct event performance. | high |
| Para ti | `30d3df34-84f1-42a2-8cda-ba674c90b6a9` | performance_kind=live; performance_date=2021-01-01; performance_date_precision=year; performance_context=Entre Mar y Palmeras | live · 2021 · Entre Mar y Palmeras | JLG_MANUAL_VERIFICATION_09_PARA_TI.md — Song: Para ti: Official Entre Mar y Palmeras release and official performance video establish a separate 2021 live performance. | high |
| Para ti | `dcb1778e-73a2-4753-ab96-afc828116884` | performance_kind=live; performance_date=2005-01-01; performance_date_precision=year; performance_context=Estadio Olímpico, Santo Domingo | live · 2005 · Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_09_PARA_TI.md — Song: Para ti: Official Concierto Aniversario release, concert ISRC, and event-specific official audio establish a distinct 2005 stadium performance. | high |
| Que me des tu cariño (Portuguese) | `d673e2ea-b217-4243-81d7-a1553a22bf71` | performance_kind=studio; derivation_kind=rerecording; language_code=pt | studio · rerecording · pt language | JLG_MANUAL_VERIFICATION_10_LA_LLAVE_DE_MI_CORAZON.md — Que me des tu cariño ledger: Independent ISRC and official language-specific delivery establish a Portuguese studio performance. | high |
| Romance rosa | `f96218bb-e5c0-4384-9a9d-a948aaa3d6a1` | performance_kind=studio; derivation_kind=rerecording; language_code=pt; performance_date=1992-01-01; performance_date_precision=year; performance_context=Romance Rosa | studio · rerecording · pt language · 1992 · Romance Rosa | JLG_MANUAL_VERIFICATION_05_BACHATA_ROSA.md — Song: Bachata rosa: Official Romance Rosa title and release evidence establish the 1992 Portuguese-language studio performance. | high |
| Rosalía | `ee5f3e74-3f8a-462a-8018-c588066d0f33` | performance_kind=live; performance_date=2005-01-01; performance_date_precision=year; performance_context=Estadio Olímpico, Santo Domingo | live · 2005 · Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_05_BACHATA_ROSA.md — Song: Rosalía: Official Concierto Aniversario release, concert ISRC, and event-specific official audio establish a distinct 2005 stadium performance. | high |
| Soldado | `44d97abe-f206-4d93-acc9-a7e4d0ed52b5` | performance_kind=live; performance_date=2005-01-01; performance_date_precision=year; performance_context=Estadio Olímpico, Santo Domingo | live · 2005 · Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_09_PARA_TI.md — Song: Soldado: Official Concierto Aniversario release, concert ISRC, and event-specific official audio establish a distinct 2005 stadium performance. | high |
| Tan solo he venido | `1a3faed8-48c4-4b33-aeb2-ad1281014c0a` | performance_kind=live; performance_date=2005-01-01; performance_date_precision=year; performance_context=Estadio Olímpico, Santo Domingo | live · 2005 · Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_09_PARA_TI.md — Song: Tan solo he venido: Official Concierto Aniversario release, concert ISRC, and event-specific official audio establish a distinct 2005 stadium performance. | high |
| Vale la pena | `2219fdb5-f214-4c90-8b0c-c48bc60d3513` | performance_kind=live; performance_date=2021-01-01; performance_date_precision=year; performance_context=Entre Mar y Palmeras | live · 2021 · Entre Mar y Palmeras | JLG_MANUAL_VERIFICATION_08_NI_ES_LO_MISMO_NI_ES_IGUAL.md — Song: Vale la pena: Official Entre Mar y Palmeras release and official performance video establish a separate 2021 live performance. | high |
| Vale la pena | `f178eaee-bb21-4f01-b527-4da27126bbbe` | performance_kind=live; performance_date=2005-01-01; performance_date_precision=year; performance_context=Estadio Olímpico, Santo Domingo | live · 2005 · Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_08_NI_ES_LO_MISMO_NI_ES_IGUAL.md — Song: Vale la pena: Official Concierto Aniversario release, concert ISRC, and event-specific official audio establish a distinct 2005 stadium performance. | high |
| Visa para un sueño | `a72f9729-df72-4cbd-ba1e-e2d98336580e` | performance_kind=live; performance_context=Asondeguerra Tour — Estadio Olímpico, Santo Domingo | live · Asondeguerra Tour — Estadio Olímpico, Santo Domingo | JLG_MANUAL_VERIFICATION_04_OJALA_QUE_LLUEVA_CAFE.md — Song: Visa para un sueño: Official Asondeguerra Tour release identifies the full stadium-tour performance; release wording leaves 2012/2013 performance-year precision ambiguous. | high |

## Proven Recording Relationships

Only source-fixation relationships established by the reports are proposed. No live-to-studio relationship is inferred.

| Recording | Relationship | Source Recording | Evidence |
| --- | --- | --- | --- |
| Bachata en Fukuoka `3e54974b-5287-4060-ac37-2fe03de0f240` | edit_of | `0672bd04-bf0f-4848-8a31-ace1723c7657` | Manual verification aligned official release objects and identified full and shorter presentations of one performance. |
| Frío, frío `8b866647-4640-49c2-b711-14a6103b18ed` | edit_of | `334ae297-d150-4a81-9427-a416ecb0aa1d` | Manual verification aligned official release objects and identified full and shorter presentations of one performance. |
| La calle `a7afc633-6a0c-414a-80c1-9b7ec04196bf` | edit_of | `8ae9a544-398b-4351-949a-04905d0f15b8` | Manual verification aligned official release objects and identified full and shorter presentations of one performance. |
| La guagua `62962b7e-984d-4531-a252-b6656c19ee42` | edit_of | `a266c059-fd40-4c0f-a825-b6b70ca30587` | Manual verification aligned official release objects and identified full and shorter presentations of one performance. |
| La llave de mi corazón `a242db40-d740-4caa-9cda-119d77cdd79b` | edit_of | `d5f7aeb2-6f29-4251-97a9-bb2d480a2efe` | Manual verification aligned official release objects and identified full and shorter presentations of one performance. |
| La travesía `1c223bf0-a645-4956-853b-94e14243e2c4` | edit_of | `c9049cc0-fc1a-49c3-8ba9-d27ba0820e95` | Manual verification aligned official release objects and identified full and shorter presentations of one performance. |
| Las avispas `4c7bda9f-bb21-4c25-8b25-dbb8eb0d5151` | edit_of | `99e8f378-bf0b-4b0d-a177-91894a7eae49` | Manual verification aligned official release objects and identified full and shorter presentations of one performance. |
| Mi bendición `07e2bf64-ddc4-49d4-80d9-94d1d78628cc` | edit_of | `6ea97e60-edf5-4411-9e60-79a0f6654f1c` | Manual verification aligned official release objects and identified full and shorter presentations of one performance. |

## Arrangement-Only Holds

These facts are deliberately excluded from the profile vocabulary. Mixed rows may also have a valid live, language, rerecording, or remix profile.

| Title | Recording UUID | Arrangement finding | Profile action | Evidence |
| --- | --- | --- | --- | --- |
| A bilirrubina | `0c8dbd99-44cd-45cb-9bc9-e2cd0bc118cd` | Portuguese-language treatment for future Arrangement review. | MIXED | Independent Romance Rosa repertoire and official language-title evidence establish a Portuguese studio performance. |
| A pedir su mano (versión Privé) | `2f1095cb-a45c-4f55-b0d5-c2d55b1a1576` | Privé intimate/acoustic treatment for future Arrangement review. | MIXED | Official Privé audio and separately credited intimate ensemble establish a new 2020 studio rerecording. |
| Ay mujer | `eae8692e-0aa6-4dc3-90a0-76feb32e4a87` | Colección romántica treatment; exact arrangement/session mechanism remains unverified. | MIXED | Independent collection audio establishes a distinct later romantic treatment, but the research does not establish rerecording, exact session, or narrower mechanism. |
| Cantando bachata | `c446ba5a-5c33-41a9-ac35-8809fca6fb63` | Rock arrangement. | ARRANGEMENT_ONLY_HOLD | Separate official objects and ISRC establish the rock Recording; rock is an Arrangement fact and does not fit a version derivation enum. |
| Cuando te beso II | `d9426939-3487-4a76-b5c9-4a63e0f4a8a9` | Bonus-track orchestral reprise arranged/directed by José Antonio Molina. | ARRANGEMENT_ONLY_HOLD | Official album program and different previews establish a bonus/orchestral reprise, which is an Arrangement fact rather than a core version facet. |
| Dance with Me (Si tú no bailas conmigo) | `ba5bb58b-f603-4a45-bd88-c20970664b84` | English collaboration/dance treatment for future Arrangement review. | MIXED | Official 2020 English collaboration has a separate ISRC and newly recorded studio performance. |
| El Niágara en bicicleta (remix) | `e382ea92-7519-406e-869c-7e479e00a70c` | 2025 remix production for future Arrangement review. | MIXED | Official 2025 remix single establishes remixed audio, but the exact source Recording was not independently proven. |
| Frío, frío | `99f2bcb6-da07-4143-8649-90229c5a4d2b` | Colección romántica treatment; exact mechanism unresolved. | MIXED | Separate official Colección Romántica audio is verified, but rerecording versus edit cannot be narrowed. |
| La llave de mi corazón (dance remix) | `2327c774-04f3-44f9-af03-47b843b07602` | Dance remix production for future Arrangement review. | MIXED | Official dance remix object establishes remixed audio; exact source fixation is not independently proven. |
| Medicine for My Soul | `e703a9c5-68a4-4b72-bfca-1c591d74b830` | Duet treatment for future Arrangement review. | MIXED | Official fan-edition duet is a newly recorded studio performance; collaborator identity derives from credits. |
| Que me des tu cariño (Portuguese) | `d673e2ea-b217-4243-81d7-a1553a22bf71` | Portuguese-language treatment for future Arrangement review. | MIXED | Independent ISRC and official language-specific delivery establish a Portuguese studio performance. |
| Quisiera | `32b87f30-8aad-42c8-ab5e-f973e2421a8d` | Pop arrangement distinct from the 1998 salsa treatment. | ARRANGEMENT_ONLY_HOLD | Separate official objects establish the later pop Recording; pop is an Arrangement fact, not a derivation kind. |
| Quisiera | `e99f137a-344e-46f2-b0b8-24e56265611b` | 1998 salsa arrangement. | ARRANGEMENT_ONLY_HOLD | Physical and official album evidence identifies the canonical 1998 salsa treatment; style belongs only to future Arrangement identity. |
| Razones | `970812f9-01db-4424-901c-a9834f6d05b9` | Colección romántica treatment; exact mechanism unverified. | MIXED | Separate official collection audio and fingerprint establish a distinct romantic-collection presentation; exact rerecording/arrangement mechanism is not proven. |
| Romance rosa | `f96218bb-e5c0-4384-9a9d-a948aaa3d6a1` | Portuguese-language treatment for future Arrangement review. | MIXED | Official Romance Rosa title and release evidence establish the 1992 Portuguese-language studio performance. |

## Derived-Only Findings and Credit Follow-up

Release, Work, appearance, and performer facts remain derived. Empty current performer arrays are explicitly follow-up work, never copied into `performance_context`.

| Title | Recording UUID | Derived facts | Credit follow-up |
| --- | --- | --- | --- |
| Amapola | `f4216f25-d151-4dd6-b203-3c8d61e5bdb0` | Guest performers derive from authoritative credits when present | Yes — authoritative Recording credits are currently incomplete |
| Dance with Me (Si tú no bailas conmigo) | `ba5bb58b-f603-4a45-bd88-c20970664b84` | Collaborating performer derives from recording credits | Yes — authoritative Recording credits are currently incomplete |
| La gallera | `81cb5d7e-6f6e-4453-9514-b97358b5277f` | Soundtrack Release and year derive from Tracks/Releases | No |
| La llave de mi corazón | `4ac7943f-62ba-41f2-8c9b-c7f3198699ac` | Enhanced-media Release/Track context | No |
| Medicine for My Soul | `e703a9c5-68a4-4b72-bfca-1c591d74b830` | Collaborating performer derives from recording credits | Yes — authoritative Recording credits are currently incomplete |

## Proposed Editorial Overrides

Overrides are limited to cases where the structured model cannot safely express the verified presentation or where the precise derivation remains unresolved.

| Title | Recording UUID | Override | Why structured fields are insufficient |
| --- | --- | --- | --- |
| Ay mujer | `eae8692e-0aa6-4dc3-90a0-76feb32e4a87` | Colección romántica version | Independent collection audio establishes a distinct later romantic treatment, but the research does not establish rerecording, exact session, or narrower mechanism. |
| Cuando te beso II | `d9426939-3487-4a76-b5c9-4a63e0f4a8a9` | Bonus Track / orchestral reprise | Official album program and different previews establish a bonus/orchestral reprise, which is an Arrangement fact rather than a core version facet. |
| Frío, frío | `99f2bcb6-da07-4143-8649-90229c5a4d2b` | Colección romántica version | Separate official Colección Romántica audio is verified, but rerecording versus edit cannot be narrowed. |
| Guavaberry | `a6ff5439-c736-4499-83ca-c1989c217607` | 1992 Romance Rosa extended version | The 1992 Romance Rosa audio is substantially extended and distinct, but preview evidence cannot distinguish new performance, extended mix, or hybrid. |
| La bilirrubina | `597be780-60e6-4888-8e9d-1ade991b7669` | Short Bonus Tracks version | Official Bonus Tracks exposes a short non-original presentation, but edit versus distinct performance is unresolved. |
| La gallera | `81cb5d7e-6f6e-4453-9514-b97358b5277f` | Capitán Avispa soundtrack version | The official Capitán Avispa soundtrack object is distinct from the 1989 audio, but public evidence does not distinguish rerecording from soundtrack reconstruction/mix. |
| Ojalá que llueva café | `62c7b849-d0f5-4155-9b95-39a7dc18486e` | Directo version | Official Bonus Tracks objects establish non-studio Directo audio, but its relationship to the Encuentro performance is unresolved. |
| Razones | `970812f9-01db-4424-901c-a9834f6d05b9` | Colección romántica version | Separate official collection audio and fingerprint establish a distinct romantic-collection presentation; exact rerecording/arrangement mechanism is not proven. |

## Unresolved / No Write

An unresolved flag blocks deterministic population of uncertain facts. Some rows still have a conservative independently established facet, such as `performance_kind=live`; the unresolved field itself remains null.

| Title | Recording UUID | Safe profile portion | Proposed action | Conflict or missing evidence | Confidence |
| --- | --- | --- | --- | --- | --- |
| Ay mujer | `eae8692e-0aa6-4dc3-90a0-76feb32e4a87` | none | MIXED | Independent collection audio establishes a distinct later romantic treatment, but the research does not establish rerecording, exact session, or narrower mechanism. | medium |
| Bilirrubina | `9f24bf27-cbf1-49ea-9299-751fe316eb70` | performance_kind=live; performance_date=2002-01-01; performance_date_precision=year; performance_context=Encuentro | PROFILE | Independent Encuentro catalogs establish a live performance, while its relationship to the short Bonus Tracks presentation remains unresolved. | medium |
| Frío, frío | `99f2bcb6-da07-4143-8649-90229c5a4d2b` | none | MIXED | Separate official Colección Romántica audio is verified, but rerecording versus edit cannot be narrowed. | medium |
| Guavaberry | `a6ff5439-c736-4499-83ca-c1989c217607` | none | DISAMBIGUATION_OVERRIDE_ONLY | The 1992 Romance Rosa audio is substantially extended and distinct, but preview evidence cannot distinguish new performance, extended mix, or hybrid. | medium |
| La bilirrubina | `597be780-60e6-4888-8e9d-1ade991b7669` | none | DISAMBIGUATION_OVERRIDE_ONLY | Official Bonus Tracks exposes a short non-original presentation, but edit versus distinct performance is unresolved. | low |
| La gallera | `81cb5d7e-6f6e-4453-9514-b97358b5277f` | none | DISAMBIGUATION_OVERRIDE_ONLY | The official Capitán Avispa soundtrack object is distinct from the 1989 audio, but public evidence does not distinguish rerecording from soundtrack reconstruction/mix. | medium |
| La llave de mi corazón | `4ac7943f-62ba-41f2-8c9b-c7f3198699ac` | none | UNRESOLVED_NO_WRITE | Null-duration enhanced-video asset could be an encoding of existing audio or a distinct edit; the DVD stream was not compared. | low |
| Ojalá que llueva café | `62c7b849-d0f5-4155-9b95-39a7dc18486e` | performance_kind=live | MIXED | Official Bonus Tracks objects establish non-studio Directo audio, but its relationship to the Encuentro performance is unresolved. | medium |
| Razones | `970812f9-01db-4424-901c-a9834f6d05b9` | none | MIXED | Separate official collection audio and fingerprint establish a distinct romantic-collection presentation; exact rerecording/arrangement mechanism is not proven. | medium |
| Visa para un sueño | `c8b6b240-d2be-4c36-bcff-30cbed0701a5` | none | UNRESOLVED_NO_WRITE | This row still conflates a 2010 Directo/Bonus Tracks presentation and a 2005 concert Track; the report requires Track-level correction and full alignment before a canonical profile. | low |

## Legacy Disambiguation Review

| Classification | Entries |
| --- | ---: |
| ARRANGEMENT_TEXT | 3 |
| EMPTY | 30 |
| PARTIALLY_MATCHES | 33 |
| WRONG_OR_MISLEADING | 1 |

Legacy text was comparison material only. Generic live labels usually partially match but omit event/date/edit context; style labels are Arrangement text; blank values are common among independently verified findings. No legacy value was promoted solely because it existed.

## Deleted-duplicate survivor handling

All 67 researched findings already resolve to surviving post-cleanup UUIDs. Therefore the remap count is zero. The generator checks every UUID against the current two-artist JLG/JLG 4.40 scope and fails if a deleted UUID is supplied. Cleanup duplicate pairs remain available in `jlg-recording-cleanup-manifest.json`; duplicate rows such as the second 2013 delivery were not emitted as separate canonical entries.

## Isolated identity-summary test

The transaction-rolled-back validation `supabase/validation/20260815002000_jlg_recording_version_manifest_projection.sql` passed for:

- original Recording with no profile;
- two same-title live performances with distinct date/context;
- Portuguese studio rerecording;
- remix;
- live edit and proven `edit_of` relation;
- Privé rerecording;
- collaboration derived from a Recording credit;
- Arrangement-only Recording with no inappropriate profile.

The test returned nine identity-summary rows and then verified zero residual fixtures.

## Model-fit conclusion

No enum or schema defect was found. The approved profile represents all independently established intrinsic version facts. Arrangement/style facts remain held back, incomplete credits remain derived follow-ups, and uncertain extended/collection/soundtrack/enhanced-media mechanisms remain overrides or no-write cases. The manifest is ready for human review, not population.
