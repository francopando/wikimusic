# JLG Manual Discography Verification 11 — *A Son de Guerra*

**Research date:** 2026-08-11 · **Mode:** production read-only; independent identity evidence.

## Album evidence

Independent physical/digital catalogs establish *A Son de Guerra* as the next studio album, released **8 June 2010**, Capitol Latin, eleven-track CD; the later deluxe adds multimedia/bonus content. Core order: No aparecen; La guagua; Mi bendición; La calle; Bachata en Fukuoka; Apaga y vámonos; Son al rey; Cayo Arena; Arregla los papeles; Lola's Mambo; Caribbean Blues. Mangulina US jewel case `1227c4c2-...`, worldwide `dc847fdc-...`, and 2012 deluxe `7764c263-...` reuse the same eleven studio UUIDs. The official artist history and [contemporary catalog](https://www.cmtv.com.ar/discos_letras/show.php?DS_DS=6390&banda=Juan_Luis_Guerra&bnid=130&disco=A_SON_DE_GUERRA) corroborate the album; Juan Luis Guerra is producer/arranger, with Juanes featured on “La calle.”

## Recording ledger

| Song | Original UUID / appearances | Related identity decision |
|---|---|---|
| No aparecen | `c5d47229-0c38-4b49-83d9-c409bf1618fb` / 3 | one stable studio object; KEEP — ORIGINAL / UNIQUE |
| La guagua | `c34a2d19-c996-4e82-a2a4-0ecf06f0a45d` / 3 | `62962b7e-...` shorter 2012 tour edit; `a266c059-...` full tour audio; null enhanced row `74bdda84-...` exposes the full live object and is duplicate of `a266c059-...`. Studio KEEP; two edits KEEP — DISTINCT; one MERGE CANDIDATE. |
| Mi bendición | `daf76c6f-8741-4054-92bc-05210555e9a0` / 3 | `07e2bf64-...` shorter tour edit and `6ea97e60-...` full tour audio are different edits of one performance. Null row `43195ebd-...` has mixed studio/full-live links and cannot be assigned safely: UNCERTAIN — actual deluxe media stream required. |
| La calle | `79b0275b-e260-48ef-9fb3-9c831b503bc5` / 3 | Juanes studio collaboration. `a7afc633-...` shorter tour edit; `8ae9a544-...` full tour audio. Null enhanced row `59260747-...` shares the full live object: MERGE into `8ae9a544-...`. |
| Bachata en Fukuoka | `5112e5c3-52e2-42cc-a813-45fb2768fde6` / 4 | `3e54974b-...` shorter tour edit; `0672bd04-...` full tour audio. Null row `c431a1cd-...` shares official full-live objects: MERGE into `0672bd04-...`. |
| Apaga y vámonos | `81d1fa3f-d7fa-48e5-9dee-77a1fc9db04e` / 3 | `8caa98f6-...` shorter tour edit; `4ffc19e1-...` full tour audio. Both KEEP — DISTINCT VERSION. |
| Son al rey | `f421782b-93ea-4e82-93bf-a4b41457c86d` / 7 | studio master correctly reused on *Colección cristiana*; current `release_id` is that compilation, not original. KEEP — ORIGINAL / UNIQUE. |
| Cayo Arena | `ad12fa26-d901-414a-bc85-63c6be6c72d4` / 3 | one stable studio performance. KEEP — ORIGINAL / UNIQUE. |
| Arregla los papeles | `743d532e-87f6-4180-96e3-7bb83d3fc2fc` / 3 | one stable studio performance. KEEP — ORIGINAL / UNIQUE. |
| Lola's Mambo | `544038e8-0f16-4764-a23d-28e3af327759` / 3 | one stable studio performance. KEEP — ORIGINAL / UNIQUE. |
| Caribbean Blues | `1d1c8f94-725d-4bd6-a8ed-3e97d4657f01` / 3 | one stable studio performance; bonus wording in some catalogs does not make another Recording. KEEP — ORIGINAL / UNIQUE. |

All live conclusions use the official 2013 *Asondeguerra Tour* track objects, event audio and ISRCs, not MBIDs. Small live-edit duration differences are not treated as different concert performances. Stored studio links contaminate several live rows.

### Merge dependencies

- `74bdda84-...` → `a266c059-...` (La guagua full live): one enhanced Track, no ISRC, same official live object; HIGH.
- `59260747-...` → `8ae9a544-...` (La calle full live): one enhanced Track, no ISRC, same Apple/Spotify object; HIGH.
- `c431a1cd-...` → `0672bd04-...` (Bachata en Fukuoka full live): one enhanced Track, no ISRC, same objects; HIGH.

## Totals and cumulative position

Original tracks/session Recordings **11**; later same-Recording appearances **27**; legitimate distinct versions **8** (four songs, full/edit live pairs); arrangements **0 new**; merge candidates **3**; needing disambiguation **8**; uncertain relationships **1**.

**Cumulative after album 11:** albums 11; original/session identities 112; additive appearances 882; distinct-version findings 79; merge candidates 32; unresolved 13; version/disambiguation findings 65.

Album editions reuse correctly; duplication occurs only at enhanced-media/live-import boundaries. Production remained read-only.
