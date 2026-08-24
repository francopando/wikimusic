# Artist Link Verification — 2026-08-22

## Scope

- Verify only links already stored on published artist records.
- Do not search for or add missing social accounts.
- Accept artist-owned Linktree and comparable link-hub pages as website entries.
- Do not update the database during the audit.

## Status definitions

- **Confirmed:** the destination is available and identifies the database artist.
- **Incorrect:** the destination is unavailable or identifies another person/entity.
- **Inconclusive:** available evidence is insufficient to establish ownership.

## Results

| Artist | Field | Stored value | Status | Evidence |
|---|---|---|---|---|
| 23Thierno | Instagram | `23thierno_` | **Removed** | Instagram returns “Profile isn't available.” No reliable replacement was identified; the invalid value was cleared with user approval. |
| 23Thierno | YouTube | `@23Thierno` | **Confirmed** | Live channel title is “23Thierno - YouTube.” |
| Adalgisa Pantaleón | Instagram | `adalgisap` | **Confirmed** | Live verified profile identifies “Adalgisa Pantaleon” and describes her as a Dominican singer, actor, poet, writer, and member of 440. |
| Adonis Produciendo | Instagram | `adonisproduciendo` | **Confirmed** | Live verified profile is named “Ado Feliz”; independent artist sources identify Adonis Produciendo as Ángel Adonis Feliz and cite this handle. |
| Adonis Produciendo | YouTube | `@adonisproduciendo` | **Replaced** | The old handle returned 404. The artist-owned Feature.fm page links to `@Elmagicoprod`, whose live channel title is “Adonis Produciendo - YouTube.” Database updated to `@Elmagicoprod`. |
| Adriana Green | Facebook | `salmistaAdrianaGreenO` | **Confirmed** | Live page title is “Adriana Green Ministerio.” |
| Adriana Green | Instagram | `adrianagreenoficialrd` | **Confirmed** | Live profile identifies “Adriana Green-Ortiz,” states she won The Voice Dominicana 2022, and links to the stored YouTube channel. |
| Adriana Green | YouTube | `@AdrianaGreen` | **Confirmed** | Live channel title is “Adriana Green - YouTube”; the confirmed Instagram profile links directly to it. |

## Running totals

- Links checked: **8**
- Confirmed: **6**
- Replaced: **1**
- Removed: **1**
- Unresolved incorrect: **0**
- Inconclusive: **0**
- Database changes: **2** (only the target social fields; biography fields verified unchanged)

## Corrections pending approval

No replacement is proposed until a correct artist-owned destination is independently verified.

None in the completed batch.

## Applied corrections

| Artist | Field | Old value | New value | Applied |
|---|---|---|---|---|
| Adonis Produciendo | YouTube | `@adonisproduciendo` | `@Elmagicoprod` | 2026-08-22 |
| 23Thierno | Instagram | `23thierno_` | Removed (`NULL`) | 2026-08-22 |

## First 25 published artists (alphabetical)

Completed 2026-08-22. This batch covers the first 25 published artist rows ordered by `name`.

- Artists audited: **25**
- Artists with stored links: **20**
- Current links checked: **55**
- Artists with no stored links (nothing to check): **5**
- Social fields corrected in this batch: **4**
- Invalid or inconclusive fields left unchanged and listed for review: **0**

| Artist | Result |
|---|---|
| 23Thierno | YouTube confirmed. Previously invalid Instagram removed with approval. |
| Adalgisa Pantaleón | Instagram confirmed. |
| Adonis Produciendo | Instagram confirmed; YouTube previously corrected to `@Elmagicoprod`. |
| Adriana Green | Facebook, Instagram, and YouTube confirmed; Instagram links directly to the stored YouTube channel. |
| Adriano Ventura | No stored links. |
| Adriel Music | Instagram and official YouTube channel confirmed. Unavailable Facebook username replaced with verified numeric profile ID `100000503818468`. |
| Aguakate | No stored links. |
| Aisha Syed Castro | Website, Facebook, and Instagram confirmed. Dead YouTube handle replaced with the channel linked by her official website. |
| AKINOhayLEY | Linktree, Facebook, Instagram, and official YouTube channel confirmed; the profiles cross-link. |
| Ala Jaza | Facebook and verified Instagram confirmed. Dead YouTube handle replaced with `@AlaJaza`. |
| Albert Mendez | YouTube topic channel confirmed by artist name. |
| Alberto "Ringo" Martínez | No stored links. |
| Alberto Beltrán | No stored links. |
| Alberto Plata | Instagram confirmed by profile identity. |
| Alex Bueno | Facebook, verified Instagram, and YouTube confirmed. |
| Alex Díaz | Facebook confirmed. Unproven Instagram removed with user approval. |
| Alex Ferreira | Website, Facebook, verified Instagram, and YouTube confirmed; official website cross-links Instagram and YouTube. |
| Alex Linares | Website, Facebook, and verified Instagram confirmed. Dead YouTube handle replaced with verified channel ID `UCvcR5ummaxhVpH_vcfAzgBg`. |
| Alex Mansilla | Facebook and Instagram confirmed by profile identity. |
| Alex Matos | Facebook, verified Instagram, and YouTube confirmed. |
| Alexandra Queen | Facebook, verified Instagram, and YouTube confirmed. |
| Alfareros | Website, Facebook, Instagram, and YouTube confirmed. |
| Alfredo Polonia | No stored links. |
| Alih Jey | Website and Instagram confirmed. Dead Facebook and YouTube identifiers replaced from artist-owned/authoritative sources. |
| Alinna Vargas | Facebook, verified Instagram, and YouTube confirmed (Facebook uses her personal-name spelling, Alina Vargas). |

### Corrections applied in the 25-artist audit

| Artist | Field | Old value | New value | Evidence |
|---|---|---|---|---|
| Aisha Syed Castro | YouTube | `AishaSyedCastro` | `channel/UCBZ-EqZYJ91dHPzw1CWleBw` | Her official website links this live “Aisha Syed Castro” channel. |
| Ala Jaza | YouTube | `@alajazaofficial` | `@AlaJaza` | Old handle returned 404; live channel identifies itself as Ala Jaza's official channel. |
| Alih Jey | Facebook | `alihjeymusic` | `alihjey` | Old page unavailable; replacement is a live Alih Jey musician page and matches authoritative identity data. |
| Alih Jey | YouTube | `@alihjey` | `@AlihJeyMusic` | Old handle returned 404; her official website's featured video is published by this Official Artist Channel. |
| Adriel Music | Facebook | `oscardavid.beatonpalin` | `100000503818468` | Live profile identifies Óscar Castanos Palin, matching the confirmed Instagram identity. |
| Alex Díaz | Instagram | `alexdiazjazz` | Removed (`NULL`) | Ownership could not be established; removed with user approval. |
| Alex Linares | YouTube | `@ALEXLINARESRD` | `channel/UCvcR5ummaxhVpH_vcfAzgBg` | Supplied channel resolves to “ALEX LINARES - YouTube.” The `channel/` prefix prevents the application from incorrectly treating the channel ID as an `@handle`. |

Biography columns were compared before and after every update and remained unchanged.

### Unresolved list from the 25-artist audit

| Artist | Field | Current value | Finding | Action |
|---|---|---|---|---|
None. All three previously unresolved fields were resolved with user-provided evidence or removal approval.

## Published artists 26–50 (alphabetical)

Completed 2026-08-22. This batch covers published artist rows 26–50 ordered by `name`.

- Artists audited: **25**
- Artists with stored links: **17**
- Current links checked: **47**
- Artists with no stored links: **8**
- Fields corrected: **24**
- Biography fields changed: **0**

### Corrections applied

| Artist | Field | Old value | New value | Evidence |
|---|---|---|---|---|
| Angel Dior | YouTube | `@angeldior` | `@angeldiorreal` | Old handle belongs to “Ali Zayyad”; current channel is identified as Angel Dior's official Dominican artist channel by current channel-index evidence. |
| Asdrubar | Instagram | `asdrubarsalsa` | `asdrubaroficial` | Current indexed profile identifies `@asdrubaroficial` as the salsa artist and has established activity/following. |
| Averly Morillo | Facebook | `averlymorilloficial` | `averlymorilloofc` | Artist's official website links directly to this Facebook page. |
| Averly Morillo | Instagram | `averlymorillo` | `averlymorilloficial` | Artist's official website links directly to this Instagram account. |
| Averly Morillo | YouTube | `@averlymorillo` | `@averlymorilloficial` | Old handle returns 404; artist's official website links the replacement. |
| Banda Real | Facebook | `BandaRealRD` | `bandarealoficial` | Old page is unavailable; Dominican music directories and current profile indexing identify `bandarealoficial` as Banda Real's page. |
| Amarfis y La Banda de Atakke | Facebook | `amarfisandbandadeatakke` | `amarfis.atakke` | User-supplied profile; verified Instagram bio independently identifies the Facebook name as Amarfisatakke. Facebook does not expose the page to logged-out inspection. |
| Amarfis y La Banda de Atakke | Instagram | `amarfismusic` | `amarfisatakke1` | Live verified profile identifies “Amarfis Atakke” and cross-references the YouTube and Facebook identifiers. |
| Amarfis y La Banda de Atakke | YouTube | `@amarfisybandadeatakke` | `@bandaatakke` | Old handle returned 404; replacement is a live “AMARFIS” channel and is cross-referenced by the verified Instagram profile. |
| Amenazzy | Facebook | `AmenazzyOfficial` | `amenazzy4` | Old page unavailable. Current page identifies Amenazzy, has approximately 1M followers, links to his official YouTube channel, and is referenced in current official-video metadata. |
| Angel Dior | Instagram | `angeldior` | `angeldiorreal` | Old profile is unavailable. Current identity data lists `angeldiorreal` as the artist's verified Instagram username; current music coverage also attributes that handle to the Dominican rapper. |
| Ángela Carrasco | Instagram | `angelacarrascooficial` | `angelacarrasco_oficial` | Current profile indexing identifies the underscored handle as Ángela Carrasco, and Dominican press plus current performance coverage attribute it to the singer. |
| Ángela Carrasco | Facebook | `AngelaCarrascoOficial` | `angelacarrascoofi` | Signed-in inspection confirms this is Ángela Carrasco's verified official artist page, with 157K followers and links to her official website and music profiles. |
| Apofis Imn | Facebook | `apofis.imn` | `100063661656225` | User-supplied page identifies Apofis Imn as a musician/band from Santo Domingo, describes the extreme-metal project, and links its established `@apofisimnoficial` YouTube channel. |
| Apofis Imn | Instagram | `apofis.imn` | `apofisimn` | User-supplied active profile identifies Apofis Imn, describes the same dark-metal band formed in 2003 and based in Buenos Aires, and cross-links its Facebook identity. |
| Aposento Alto | Instagram | `aposentoaltooficial` | `aposentoaltohd` | Signed-in profile identifies Aposento Alto as a musician/band, has 33.5K followers, highlights the group members, is followed by Natán el Profeta and El Philippe, and contains current group music posts. |
| Aposento Alto | YouTube | `@aposentoaltooficial` | `@aposentoalto` | YouTube search identifies this 291K-subscriber profile as Aposento Alto's Official Artist Channel; its catalog includes the group's established releases and videos. |
| Aposento Alto | Facebook | `AposentoAltoOfficial` | `ElPhilippeReal` | User-supplied page is displayed by Facebook as the verified “Aposento Alto (officia site)” musician/band page with 140K followers; its current URL uses member El Philippe's handle. |
| Aramis Villalona | Instagram | `aramisvillalonaoficial` | `aramisvillalona` | Signed-in profile identifies Aramis Villalona as an artist, has 21.5K followers, links his music, and posts current Los Villalona performances; Fernando Villalona also publicly identifies this handle as his brother Aramis. |
| Banda Real | Instagram | `bandarealrd` | `bandarealofficial` | Signed-in verified profile identifies Banda Real (“Los Líderes”), has 179K followers, and directly links the official YouTube channel. |
| Banda Real | YouTube | `@bandareal5894` | `@bandarealoficial` | Live 175K-subscriber channel identifies itself as Banda Real's official channel and links back to the corrected Instagram and confirmed Facebook profiles. |
| André Velóz | Facebook | `andrevelozmusic` | `EsAndreVeloz` | Her official website links this live verified Andre Veloz musician page; the page links back to `andreveloz.com`. |
| André Velóz | YouTube | `@andreveloz` | `@andrevelozmusic` | Her official website links a video published by this 9.37K-subscriber Andre Veloz channel; the publisher resolves to channel ID `UCGY3Dt73_tpv78CspjkcINg`. |
| André Velóz | Instagram | `andreveloz` | `andrevelozny` | User-supplied profile identifies Andre Veloz, lists `AndreVeloz.com`, links her YouTube music, and contains her established “Eta Que Ta Aquí” campaign content. |

### Confirmed entries

- Amaury Sánchez: Facebook and verified Instagram.
- Amenazzy: verified Instagram and YouTube.
- Anaís: artist-owned Linktree, verified Instagram, and YouTube.
- André Velóz: official website.
- Ángela Carrasco: no currently confirmed stored social link in this audit.
- Anon Müller: Facebook, Instagram, and YouTube.
- Antidoto Casero: Facebook, Instagram, and YouTube.
- AntiHippie: Facebook, Instagram, and YouTube.
- Antony Santos: Facebook, verified Instagram, and YouTube.
- Apofis Imn: corrected Facebook and Instagram profiles, plus YouTube.
- Averly Morillo: official website plus the three corrected social profiles.

### No stored links

Altamira Banda Show; Angel Fernández; Angel Viloria y su Conjunto Típico Cibaeño; Aníbal Bravo; Anthony Cariño; Anthony Ríos; Archaios; Aridia Ventura.

### Unresolved list

| Artist | Field | Current value | Finding |
|---|---|---|---|
| Anaís | Facebook | `THEREALANAIS` | User reports the profile appears compromised/hacked. Kept unchanged at the user's request; no safe replacement is established. |

## Published artists 51–75 (alphabetical)

Completed 2026-08-22. This batch covers published artist rows 51–75 ordered by `name`.

- Artists audited: **25**
- Artists with stored links at the start of the audit: **15**
- Stored links checked: **44**
- Artists with no stored links: **10**
- Fields corrected or removed: **9**
- Biography fields changed: **0**

### Corrections applied

| Artist | Field | Old value | New value | Evidence |
|---|---|---|---|---|
| BS El Ideologo | Instagram | `bs_elideologo` | `bselideologo` | Signed-in profile is verified, identifies BS El Ideólogo as a mixing/mastering engineer and music producer, and matches his confirmed Facebook identity and professional biography. |
| Beethoven Villaman | Instagram | `beethovenvillaman` | Removed (`NULL`) | Profile had the correct display name but only one post and no visible artist evidence; removed with user approval. |
| Benny Sadel | Website | `http://bennysadel.com` | Removed (`NULL`) | Domain did not resolve; removed with user approval. |
| BS El Ideologo | Website | `http://www.bselideologo.com` | Removed (`NULL`) | Domain did not resolve; removed with user approval. |
| Candelario | Instagram | `@Candelariooficial` | `candelariooficial` | Signed-in profile identifies artist Greilyn Candelario; normalized the stored identifier by removing the invalid leading `@`. |
| Candelario | YouTube | `@Candelariooficial` | `GreilynCandelario` | Stored handle was unavailable. Candelario's confirmed Facebook page links its YouTube vanity URL, which resolves to the live Greilyn Candelario music channel. |
| Carlos Alfredo Fatule | Facebook | `CarlosAlfredoFatuleOficial` | `carlosalfredo.fatuleii` | Old page was unavailable. Carlos Alfredo Fatule's official website links this active page, which identifies him as a Dominican artist, writer, and communicator. |
| Carlos Alfredo Fatule | Instagram | `carlosalfredofatule` | `carlosfatule` | Old profile was an empty, low-follower account. His official website links the replacement, and the live replacement is verified and identifies Carlos Alfredo Fatule. |
| Carlos Alfredo Fatule | YouTube | `@CarlosAlfredoFatule` | `carlosfatuleofficial` | Old handle was unavailable. His official website links the replacement; the live channel identifies itself as his official Dominican artist channel. |

### Confirmed so far

- Barak: Facebook, Instagram, and YouTube; all three cross-link. Stored website resolves but exposes no usable content.
- Belkis Concepción: Facebook and Instagram.
- Bladimir Vásquez: Facebook, Instagram, and YouTube; Facebook identifies the Instagram handle and YouTube identifies the artist.
- Bocatabú: website, Facebook, Instagram, and YouTube; website and Facebook cross-link.
- Bonny Cepeda: Facebook, Instagram, and YouTube. Stored domain is a generic “Launching Soon” placeholder.
- Bryan Dotel: Facebook and Instagram identify Bryan Dotel, but the low-information profiles remain weakly corroborated.
- BS El Ideologo: Facebook, corrected verified Instagram, and YouTube.
- Bulin 47: Facebook, Instagram, and YouTube; Facebook and Instagram share the same booking identity and link hub.
- Calacote: Facebook, Instagram, and YouTube.
- Candelario: Facebook, normalized Instagram, and corrected YouTube; the Facebook page connects the artist to the replacement YouTube channel.
- CANOTO: Facebook, Instagram, and YouTube.
- Carlos Alfredo Fatule: corrected Facebook, verified Instagram, and official YouTube; all three are linked from his official website.
- Carlos Manuel Vargas: website, Facebook, Instagram, and YouTube.

### No stored links

Bartolito; Bertico Sosa; Bienvenido Brens; Bienvenido Fabián; Blas Durán; Bullumba Landestoy; Calor Urbano; Carlos David; Carlos Manuel El Zafiro; Carlos Piantini.

### Unresolved list

| Artist | Field | Current value | Finding |
|---|---|---|---|
None. The three fields that could not be verified were removed with user approval, and the remaining incorrect identifiers were replaced with verified profiles.
