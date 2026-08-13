# JLG Manual Discography Verification 13 — *Literal*

**Research date:** 2026-08-11 · **Mode:** production read-only; independent identity evidence.

## Album evidence

Independent reporting establishes *Literal* as Juan Luis Guerra 4.40's next and, through the later *Radio Güira* EP period, latest full studio album, released **31 May 2019** with eleven songs. The program is: Kitipun; Lámpara pa’ mis pies; Cantando bachata; Má pa’lante vive gente; I Love You More; Corazón enamorado; Son a mamá; No tiene madre; Me preguntas; El primer baile; Merengue de cuna. The [independent retrospective](https://los40.com/2023/12/14/juan-luis-guerra-estrenara-en-2024-capitan-avispa-su-primera-pelicula/) corroborates the date and studio-album status; the artist's [official history](https://juanluisguerra.com/historia/) supplies the project chronology.

Mangulina contains US jewel case `b5e676d3-...`, worldwide digital `0b1683cc-...`, and country-null `baf380be-...` editions. The US edition was imported as eleven separate Recording rows even though each row resolves to the same commercial master objects as the corresponding worldwide canonical row. This is an edition-wide duplicate import, not eleven rerecordings.

## Recording ledger

| Song | Canonical original UUID / appearances | Related identity decision |
|---|---|---|
| Kitipun | `3bccc59f-1abf-43ce-8370-18989a8635fd` / 3 | US duplicate `0ca87f5e-...` shares Amazon/Apple/Boomplay/Deezer/Pandora/Tidal objects: MERGE CANDIDATE. `0ad921c7-...` is the independently released 2021 live performance: KEEP — DISTINCT VERSION. |
| Lámpara pa’ mis pies | `8a6801fd-04b8-48d3-843b-2cfcbbdc3529` / 2 | US duplicate `5fc83e9c-...` shares five commercial objects: MERGE CANDIDATE. |
| Cantando bachata | `b2a70d7c-1405-4a6c-8f7e-f0a5e828f9ee` / 2 | US duplicate `10f7b0dc-...` shares the album objects: MERGE CANDIDATE. `c446ba5a-...`, ISRC `QM8962100067`, is the separately issued rock arrangement with different official objects: KEEP — DISTINCT ARRANGEMENT. |
| Má pa’lante vive gente | `e0fba189-...` / 2 | US duplicate `c963c383-...` shares six commercial objects: MERGE CANDIDATE. |
| I Love You More | `10f90a51-...` / 3 | US duplicate `ddc15f58-...` shares six commercial objects: MERGE CANDIDATE. |
| Corazón enamorado | `68f0a8b2-...` / 3 | US duplicate `321d32c8-...` shares six commercial objects: MERGE CANDIDATE. |
| Son a mamá | `1f921fe1-...` / 2 | US duplicate `0c938c4c-...` shares four commercial objects: MERGE CANDIDATE. |
| No tiene madre | `1cb6b529-...` / 2 | US duplicate `334cb949-...` shares seven commercial objects: MERGE CANDIDATE. |
| Me preguntas | `e9b118be-...` / 2 | US duplicate `3f742ff6-...` shares seven commercial objects: MERGE CANDIDATE. |
| El primer baile | `920ec664-...` / 2 | US duplicate `01c21d55-...` shares six commercial objects: MERGE CANDIDATE. |
| Merengue de cuna | `f8b0c915-...` / 2 | US duplicate `e17aec1a-...` shares four commercial objects: MERGE CANDIDATE. |

The canonical rows carry normalized ISRCs; the eleven redundant US rows do not. Shared multi-platform recording objects, identical album position/program and absence of any alternate-version credit are independent evidence of duplicate identity. Spotify/YouTube search-link differences on “Kitipun” are provider-link contamination, not evidence of new audio.

### Merge dependencies

- `0ca87f5e-...` → `3bccc59f-...` (Kitipun)
- `5fc83e9c-...` → `8a6801fd-...` (Lámpara pa’ mis pies)
- `10f7b0dc-...` → `b2a70d7c-...` (Cantando bachata)
- `c963c383-...` → `e0fba189-...` (Má pa’lante vive gente)
- `ddc15f58-...` → `10f90a51-...` (I Love You More)
- `321d32c8-...` → `68f0a8b2-...` (Corazón enamorado)
- `0c938c4c-...` → `1f921fe1-...` (Son a mamá)
- `334cb949-...` → `1cb6b529-...` (No tiene madre)
- `3f742ff6-...` → `e9b118be-...` (Me preguntas)
- `01c21d55-...` → `920ec664-...` (El primer baile)
- `e17aec1a-...` → `f8b0c915-...` (Merengue de cuna)

All eleven are **HIGH-confidence** merge candidates, conditional on migrating Track, credit, link, ISRC and canonical-release dependencies before deleting any row.

## Totals and cumulative position

Original tracks/session Recordings **11**; later same-Recording appearances **14**; legitimate distinct versions **2**; arrangements **1 new**; merge candidates **11**; needing disambiguation **2**; uncertain relationships **0**.

**Cumulative after album 13:** albums 13; original/session identities 133; additive appearances 937; distinct-version findings 81; merge candidates 43; unresolved 13; version/disambiguation findings 67.

The worldwide/country-null editions reuse correctly; the US physical edition is a complete duplicate Recording set. Production remained read-only.
