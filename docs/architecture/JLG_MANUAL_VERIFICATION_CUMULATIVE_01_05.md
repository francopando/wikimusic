# JLG Manual Verification — Cumulative Review 01–05

**Review date:** 2026-08-11  
**Scope:** synthesis of the five completed album reports only  
**Mode:** documentation; production read-only  
**Identity rule:** repeated titles, MBIDs, ISRCs, durations, or release dates were not treated as proof of Recording identity.

## Compact summary

| Measure | Result |
|---|---:|
| Albums verified | 5 |
| Original album tracks reviewed | 42, plus one regional/reissue substitute (“Amigos”) |
| Unique original/session Recording identities verified | 42 |
| Later same-Recording appearances verified | 531 additive album-review counts; see overlap note below |
| Legitimate distinct later versions | 36 additive report counts |
| Merge candidates | 13 unique pairs |
| Unresolved identity relationships | 10 |
| Recordings needing version/disambiguation | 21 additive report counts |

The 42 unique original/session identities reconcile the published album totals as `8 + 9 + 8 + 8 + 10 - 1`: “Amigos” is reviewed in both *Mudanza y acarreo* and *Mientras más lo pienso... tú* but is one Recording identity. The 531 later-appearance figure is the sum of the five reports (`16 + 79 + 92 + 112 + 232`). It is a count of verified appearances **within album-review scopes**, not a de-duplicated global Track count: the reports explicitly revisit the cross-album “Amigos” graph. A precise unique Track total would require a new catalog query, which this synthesis was instructed not to perform.

## 1. Verified albums summary

| Album review | Original tracks / identities | Later same-Recording appearances | Distinct later versions | Merge candidates | Unresolved / needs disambiguation | Principal findings |
|---|---:|---:|---:|---:|---|---|
| *Soplando* | 8 / 8 | 16 | 0 | 0 | 0 / 0 | Reissues correctly reuse the eight originals. Eight original jazz/merengue treatments documented. All eight `recordings.release_id` values point to the 2016 digital edition, not 1984. Credits/sources are missing; “Sambomba” has a platform title/link gap. |
| *Mudanza y acarreo* | 8 Dominican tracks + “Amigos” substitute / 9 | 79 supported; 1 uncertain | 0 | 7 | 1 / 0 | Seven Spanish-1991 reissue rows duplicate canonical performances. “Si tú te vas” remains unresolved. Original adaptations and guest performance evidence are absent from structured credits. Platform links are strong for several pairs but conflict for “Si tú te vas” and “Amigos.” |
| *Mientras más lo pienso... tú* | 8 / 8, of which “Amigos” predates this album | 92 | 4 | 1 new; inherited “Amigos” not double-counted | 1 / 2 | Established Tú ballad, Amor de Conuco “Version Nueva,” later Ay Mujer, and extended Guavaberry. Original rows often point to 1995 editions/compilations; alternate-version rows sometimes point to later *Bonus Tracks*. The shortened “Tú” row's links point to the full original, not its claimed Track audio. |
| *Ojalá que llueva café* | 8 / 8 | 112 | 11 | 1 | 5 / 7 | Extensive correct reuse plus multiple legitimate concerts. Duplicate 2013 “Ojalá” live row established. “Razones” collection audio and 2024 “La gallera” are distinct; exact arrangement mechanism remains conservative. Original `release_id` values mostly point to greatest-hits/compilation contexts. Live rows frequently link to studio audio or another live version. |
| *Bachata Rosa* | 10 / 10 | 232 | 21 | 4 | 3 / 12 | Confirmed live, Privé, Portuguese, remix, duet, and medley identities. Four compilation/collection/live duplicates. Canonical reuse works across nine album editions. Severe live/studio platform contamination; several original rows point to *Colección romántica*, and Portuguese rows point to *Bonus Tracks* rather than first issue. |

The album reports use slightly different but explicitly defined counting boundaries. Their figures are preserved rather than silently normalized.

## 2. Consolidated merge-candidate ledger

| Song | Canonical Survivor UUID | Redundant Candidate UUID | Source Album Review | Duplicate Type | Independent Evidence Summary | Confidence | Cleanup Notes |
|---|---|---|---|---|---|---|---|
| Por eso ahora | `805979cc-2add-4919-8b64-1615b2328dbf` | `8075a099-6ee3-4508-a800-5f835311de82` | *Mudanza* | reissue duplicate | Same official Amazon, Apple, Pandora, Spotify, and Tidal objects; same Spanish-1991 sequence/performance range; no new-version claim | HIGH | Candidate has one ES-1991 Track; inventory links/dependencies first |
| Ella dice | `ac93f31e-6376-4777-9c4e-50b2950a4f8c` | `e18e01ed-01c0-4d8a-82b7-f5d2c8ffdeda` | *Mudanza* | reissue duplicate | Same Apple, Spotify, and YouTube objects plus reissue context; no alternate-version evidence | HIGH | Preserve Spanish Release Track on survivor |
| Yo vivo enamorao | `9fb197bd-5d96-408f-a978-86e6fabc3f7b` | `006d391c-9947-4283-b31d-7034ea704857` | *Mudanza* | reissue duplicate | Exact Apple/Spotify objects and 299.320-second delivery; same album position | HIGH | Retain adaptation credit evidence |
| Requiem sobre el Jaragua | `d9545d58-5dae-408a-b2e6-10320d810453` | `85cace99-7bb7-4964-ab1e-5fe738598da3` | *Mudanza* | reissue duplicate | Same reissue sequence, near-identical timing, specific Rafael Colón guest context, no new-version claim | MEDIUM | Final audio check prudent because neither row has useful links |
| Elena | `1df2c683-442d-479b-936c-0f5d68bd1bb4` | `4bd236be-5cfd-481e-9143-c8fb6c021a20` | *Mudanza* | reissue duplicate | Same Spotify/YouTube objects; compatible timing and reissue context | HIGH | Reconcile secondary links |
| Santiago en coche | `9867f816-d969-4e66-b856-4be6bb26a0cf` | `4767d0fa-281d-4d59-b7e8-75f9714bcb60` | *Mudanza* | reissue duplicate | Same Amazon, Apple, Pandora, Spotify, and Tidal objects; same reissue sequence | HIGH | Preserve adaptation/lyric provenance |
| Amigos | `2a15ddda-8ae3-4fdb-b034-13dccfb7da56` | `3aa9caf0-f8d2-4631-82f5-e668519b6a74` | *Mudanza*; revisited in *Mientras* | historical cross-album/reissue duplicate | Same Apple, Deezer, Boomplay, and Pandora objects; compatible timing; same Spanish reissue position; reused legitimately on two studio albums | HIGH | Do not remove any valid *Mudanza*, *Mientras*, or compilation Tracks |
| Amor de conuco | `aa802e13-5b41-41bc-a30d-4d810b8b0358` | `f09046f5-37b9-4ea6-9cb0-49c7ab67157b` | *Mientras* | original-edition/import duplicate | Both resolve to the same Apple/Spotify album objects and program position; no long version documented | MEDIUM-HIGH | Final LP/digital aligned check; preserve 1987 DO Track |
| Ojalá que llueva café — 2013 live | `9c660568-2be6-40a0-85f0-0d01dad2d45b` | `046d05d8-136c-4340-ab58-eccd2e50c507` | *Ojalá* | duplicate live-performance identity | Exact same official 2013 Apple/Spotify performance object; same Asondeguerra event; duration difference is edition/index reporting | HIGH | Survivor has broader Track history/ISRC; reconcile all live-release Tracks |
| A pedir su mano | `a6527c5d-dad3-4ba8-9cf4-db1f6f828982` | `786e27b0-8327-4d33-a9be-343f0bce776a` | *Bachata Rosa* | compilation duplicate | Same Spotify, Amazon, Boomplay, Pandora, and Tidal studio objects; Apple compilation object is ordinary 296.857-second 1990 recording; no 5:27 version claim | HIGH, with execution check | Explain stored 327-second duration by checking the actual collection Track before merge |
| Estrellitas y duendes — collection live | `f47427e7-4549-4c7d-8b20-72612cb41ccf` | `780af43b-f133-443e-ad6b-76dcfdbc3156` | *Bachata Rosa* | collection duplicate of live performance | Exact Apple `19478620`, explicitly “Live”; same collection lineage; compatible 300/302-second reports | HIGH | One-Track candidate versus six-Track survivor; preserve survivor ISRCs |
| La bilirrubina — 2013 live | `9f56bad5-2bba-4f7e-958a-90a91f57a39b` | `8c6b7d7f-721c-47ac-80d8-c0837ddae342` | *Bachata Rosa* | duplicate live-performance identity | Exact Spotify `1GT0Q2ZTeKtIBueYKr4vhr`; same 2013 concert and overlapping editions; 232.482/232.880 seconds | HIGH | Survivor has four Tracks and `USEL11200162`; candidate has two Tracks |
| Burbujas de amor | `f518f60e-a1b8-449c-80a0-ab51973308dc` | `f3dfc294-4e8d-44f4-b4d9-2f197ea92017` | *Bachata Rosa* | collection duplicate | Exact same six official platform objects, all exposing the ordinary studio master; no alternate-version claim | HIGH | One Track; stored 280-second duration conflicts with attached audio |

These are research candidates, not authorized mutations. Every eventual rehearsal must inventory Tracks, platform links, normalized/raw ISRCs, credits, sources, Works, views/analytics, and release presentation immediately before action.

## 3. Consolidated unresolved ledger

| Song | Recording UUID A | Recording UUID B | Relevant Release Context | Why Unresolved | Evidence Needed |
|---|---|---|---|---|---|
| Si tú te vas | `36b13fcd-36e5-4e3c-9567-e1d97911544b` | `55d59e8d-ecff-45db-b99b-dde0078ba4c7` | canonical album/compilations versus ES-1991 | Different platform objects and 226–239-second reports; preview fingerprints were not safely aligned | Aligned full audio, especially vocal phrasing, intro, ending, and fade |
| Tú | `f0491fa4-53f5-4d5e-8cb9-9789a50c6e6f` | `55425b53-1efb-4e00-87aa-4aa82ec2886a` | original versus shortened *Antología* Track | Secondary row's links point to the full original; no release-specific 213.600-second audio | Actual *Antología* Track audio or verified physical master documentation |
| Visa para un sueño | `a68d97b9-df0a-4a3a-8453-a2d7b07a34d7` / verified lives | `7fd9aade-17d0-42cf-8699-7a67bc61613a` | *The Collection* live row | Links mix original studio objects with a different Spotify object | Release-specific *The Collection* full audio |
| Visa para un sueño | `a72f9729-df72-4cbd-ba1e-e2d98336580e` | `a6f92754-7ac5-4f1c-96d7-6b6a8a4ea7c3` | two Asondeguerra rows | Secondary links are contaminated by studio audio; 204/222-second relationship not established | Aligned official tour-edition audio and label track/master documentation |
| Ojalá que llueva café | `c876180c-1079-47ee-ae2d-b8cd525b5eb8` / verified lives | `5a5857a1-4542-49b2-9eb1-3353690f5b38` | *The Collection* live row | Links mix original audio and another Spotify destination; claimed release audio unavailable | Release-specific *The Collection* audio |
| Ojalá que llueva café | `de56973b-8847-4117-abbc-1ab25b66da18` | `62c7b849-d0f5-4155-9b95-39a7dc18486e` | *Encuentro* 2002 versus *Bonus Tracks* direct/live | Both are about four minutes and later/live, but reuse of the same performance is unproved | Full aligned *Encuentro* and bonus audio; Banco Popular/Karen master documentation if available |
| De tu boca | `9b1e0adb-066b-439a-b4e1-7777a31a0548` | `198cbb35-070c-427c-9b4d-3fec0498510d` | album master versus claimed 404-second 1990 single Track | Secondary links expose the ordinary album object; no accessible 6:44 audio or version wording | Original physical single or actual 404-second audio aligned to album master |
| Bachata rosa | `fd627df2-acfb-4eae-9258-69a23dcb1ff4` | `17838aca-98fe-4467-928b-84d6bd63a8bb` | original versus *Bonus Tracks* 4:13 presentation | Four-second difference could be fade/edit/mastering; previews were not aligned | Full-track alignment of vocal take, instruments, ending, and fade |
| La bilirrubina | `597be780-60e6-4888-8e9d-1ade991b7669` | `9f24bf27-cbf1-49ea-9299-751fe316eb70` | 2:54 *Bonus Tracks* versus 2:55 *Encuentro* live | Similar length; *Encuentro* links point to unrelated 2013/studio objects | Release-specific full *Encuentro* audio aligned to bonus audio |
| La bilirrubina | `2c20f83b-9569-4313-b5b6-9dfeffda6553` / verified lives | `6eeb7e87-73ec-437e-bb04-5b40863d17e5` | *The Collection*, marked live | Every useful attached link resolves to studio or another object | Physical collection audio or verified release-specific stream |

The *Ojalá* report also identifies a **Track-assignment problem**, not an identity pair: `c8b6b240-d2be-4c36-bcff-30cbed0701a5` currently serves a 191.760-second bonus Visa performance and a roughly 201-second 2005-stadium Track, which independent sources establish as different performances. It needs future Track-to-Recording correction, not a Recording merge.

## 4. Legitimate distinct-version summary

The five reports prove that Mangulina needs structured version context capable of expressing:

- original studio performance and compilation/reissue reuse;
- separate live performances by event, tour, venue, and year;
- a duplicate row of the same live performance;
- later rerecording or “Version Nueva”;
- named ballad and *Privé* arrangements;
- romantic-collection versions whose exact session label remains incomplete;
- extended presentations where mix versus new performance remains unresolved;
- Portuguese-language versions with distinct titles such as “Romance Rosa” and “A bilirrubina”;
- remix and alternate edit/presentation;
- medleys as composite live Recordings;
- collaborations/new co-performances, including the Sting “Estrellitas y duendes”;
- soundtrack versions; and
- regional/reissue substitute context, which belongs to the Release/Track program rather than the Recording title.

Canonical song titles generally should remain unchanged. The missing information is structured Recording-level version/performance context.

## 5. Arrangement findings

### Genuinely different or strongly supported arrangements

- *Mientras*: “Tú (Balada)” is a different ballad arrangement; “Amor de Conuco (Version Nueva)” is a new 1998 recording/arrangement; the later “Ay Mujer” collection audio is a different romantic treatment; the 1992 “Guavaberry” is substantially extended, though extended mix versus new/hybrid performance remains unresolved.
- *Ojalá*: later “Razones” collection audio and the 2024 *Capitán Avispa* “La gallera” are distinct from the originals, but their exact session/mix mechanism is not documented narrowly enough.
- *Bachata Rosa*: *Versión Privé* is a documented new intimate/acoustic performance; “Romance Rosa” and “A bilirrubina” are Portuguese-language treatments; the 2025 “Como abeja al panal” is explicitly a remix; the Sting “Estrellitas y duendes” is a new collaboration/performance; the 2013 and 2021 medleys are composite arrangements.

### Different Recording, not automatically a different arrangement

The numerous 2005, 2013, and 2021 concert performances are distinct Recordings because the vocal/instrumental event differs. The reports deliberately do not infer a separate Arrangement merely because a song was performed at another concert.

### Original album treatments and adaptations

The reports document original jazz/merengue treatments on *Soplando*, adaptations and guest roles on *Mudanza*, and authorship/adaptation evidence such as “A pedir su mano.” These are important provenance/Work facts but do not by themselves imply multiple Recordings.

## 6. `recordings.release_id` findings

The field is not reliable as “original release.” The evidence is systemic:

- all eight *Soplando* originals point to the 2016 digital edition rather than 1984;
- many *Mudanza* rows reflect imported reissue/display contexts;
- most *Mientras* originals point to 1995 editions or later compilations, while alternate versions can point to 2010 *Bonus Tracks* rather than first issue;
- *Ojalá* originals commonly point to 1995 *Grandes éxitos*, *Burbujas de amor* (2010), or a 1995 album edition rather than KLP-126;
- several *Bachata Rosa* originals point to *Colección romántica* instead of the original album, while language/live rows can point to *Bonus Tracks* or another display context.

Only some rows happen to point to an appropriate early/original edition. Across the five reports, the field behaves as an imported **display/representative release pointer**, not a governed first-release assertion. A future model should separate at least: first known/original release evidence, representative display release, and the complete Track-to-Release graph. The existing many-Track graph already carries the latter correctly.

## 7. Platform-link findings

Recurring problems are:

- live rows linked to the original studio Apple/Amazon/Spotify/Tidal object;
- one live event linked to a different live event, especially in Asondeguerra/*Entre Mar y Palmeras* families;
- duplicate rows sharing exact platform destinations, useful only when corroborated by independent release/performance context;
- claimed shortened/extended Tracks whose links expose the ordinary full studio master;
- language, duet, soundtrack, or 2025 version rows partly linked to the original audio;
- multiple platform/ISRC identifiers on one canonical Recording due re-delivery/remastering, which do not create new performance identity;
- title spelling/diacritic differences such as “Sambomba,” “Bilirrubina,” and hyphenation interfering with matching; and
- inconsistent platform coverage across editions, making absence/difference weak evidence.

Platform links are useful evidence when the release-specific destination is independently verified. They are not currently trustworthy enough to classify version identity automatically or to function as canonical identity keys.

## 8. Recording-credit and source-evidence findings

The reports repeatedly recover evidence that production does not yet express:

- original physical-release provenance and side/track order;
- recording studio, engineer, producer, arranger, musical director, vocalist, chorus, instrumentalist, and guest-performer credits;
- authorship/adaptation facts that belong at Work level;
- event/venue/year provenance for live Recordings;
- language adapter and alternate-session provenance;
- source citations supporting identity decisions; and
- explicit evidence status/confidence for editorial assertions.

Examples include Rafael Colón's guest voice, Maridalia Hernández adaptations, AGN album contributor lists, *Privé* production/ensemble credits, and venue-year concert labels. The absence of structured source/credit rows makes identity decisions harder to audit and encourages overreliance on imported IDs and platform links.

## 9. Current verified JLG model

Within the first five albums, the desired model is demonstrably working:

```text
Recording
    -> many Track appearances
    -> many Releases
```

The ten *Bachata Rosa* studio rows alone serve 242 Tracks; the eight *Ojalá* originals serve 120. *Soplando* reissues also reuse the originals correctly. Therefore, high Track counts and repeated titles are generally evidence of successful reuse, not duplication.

Actual duplication is concentrated in narrow import boundaries:

- a Spanish reissue received separate Recording rows on *Mudanza*;
- isolated original-edition, compilation, and collection Tracks received secondary rows;
- the same concert performance was imported twice under different live releases/editions; and
- cross-album historical reuse such as “Amigos” acquired a redundant reissue row even though one Recording legitimately belongs on both albums.

At the same time, repeated titles legitimately identify concert performances, rerecordings, language versions, remixes, medleys, collaborations, soundtrack versions, and alternate arrangements. Cleanup must consolidate only proven performance identities while preserving every valid Track/Release appearance and every distinct Recording.

## 10. Recommended next phase

**Recommendation: A — continue verifying the remaining JLG studio albums before production cleanup.**

Reasons:

1. The catalog verification is incomplete, and later albums may reveal that a current candidate or survivor is reused in an unreviewed context.
2. The first five passes continue to discover legitimate alternate versions and duplicates of those alternate versions; early mutation would make later evidence harder to reconcile.
3. Ten relationships remain unresolved and 21 reported version rows still need clearer descriptors.
4. `recordings.release_id` and platform links are systematically ambiguous, so mutation tooling should not rely on either without an explicit dependency ledger.
5. There is no compelling operational failure documented in the five reports that requires immediate production consolidation.

A safe parallel preparation step is documentation-only cleanup rehearsal design: define survivor criteria, dependency inventory queries, Track-preservation assertions, rollback evidence, and post-merge validation. Do not execute it yet. After the studio-album sequence is complete, revalidate the 13 candidates against the then-current graph and rehearse on a non-production snapshot before any governed cleanup.

## Stop

Production was not modified. No merge, deletion, Track reassignment, `recordings.release_id` update, platform cleanup, descriptor/credit/Work creation, schema/RPC/search/UX change, full-catalog scan, or automated classification was performed.

The chronological album sequence remains paused after *Bachata Rosa*.
