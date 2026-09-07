BEGIN;

-- Rewrite the catalogue entry for Kiko Rodríguez.
--
-- Kiko Rodríguez. Filler in English, nothing in Spanish, no aliases, no genres,
-- no instruments, no disambiguation -- on a bachatero with thirty years of
-- records behind him and a Soberano on the shelf.
--
-- THE LEGAL NAME WAS A HYBRID AND IS CORRECTED. The row held first_name "Kiko",
-- last_name "Rodríguez", second_last_name "Peña" -- the stage surname wedged
-- into the legal name, the same error already fixed on Karlos Rosé. His legal
-- name is José Francisco Henríquez Peña, and the second surname the row already
-- carried is the half that was right. Four independent sources say so and two
-- of them are rights metadata rather than journalism: the "Provided to YouTube
-- by The Orchard" credit lines on his own catalogue, Apple Music's performer
-- credit on Perdoname, Songstats, BuenaMusica's Datos block, Bachata Republic,
-- and Listín Diario twice -- in 2018 and in 2021 -- quoting him under the legal
-- name in its own copy. "Kiko" is the ordinary Dominican nickname for
-- Francisco; where "Rodríguez" comes from no source says, and this entry does
-- not guess.
--
-- sort_name is left as "Rodríguez, Kiko". That follows how the catalogue
-- already handles the identical case -- Frank Reyes and Raulín Rodríguez both
-- sort under the stage surname and carry the legal name in the name fields.
--
-- LEFT ALONE, ALREADY CORRECT AND CHECKED BEFORE WRITING: date_of_birth
-- 1978-03-11, birth_year 1978, province Santiago, birth_place Tamboril, gender
-- male, primary_role singer, primary_genre bachata. The row had the birth date
-- already; BuenaMusica and Bachata Republic both give 11 March 1978 and agree
-- with it.
--
-- ADDED: occupations musician beside the composer already stored; instruments
-- guitar and percussion; genres; the legend tag; disambiguation. aliases stays
-- empty on purpose -- "Los Claveles Míos" is the name of his band, not another
-- name for him, and the only epithet found ("la leyenda", "El Romántico de la
-- Bachata") turns up in promotional posts and nowhere else.
--
-- THE LEGEND TAG, AND WHY IT IS DEFENSIBLE HERE. Every bachatero of his exact
-- cohort already carries it -- Zacarías Ferreira, Frank Reyes, Raulín
-- Rodríguez, Joe Veras, El Chaval de la Bachata. He debuted in the same years,
-- has kept releasing without a gap since, and holds a Soberano. Adding it makes
-- the cohort consistent rather than singling him out.
--
-- AN AWARD DATE THAT THREE SOURCES GOT THREE DIFFERENT WAYS. Bachata Republic
-- says "Premios Soberano 2020". AlDedillo says "Premios Soberano 2021". Listín
-- Diario says "Soberano a Mejor Bachata del Año 2019". All three are describing
-- one statuette, and the full winners' list published by N Digital on the day
-- resolves it: the ceremony of 15 June 2021 awarded two years at once, because
-- no ceremony was held in 2020, and under RENGLÓN POPULAR 2019 the Bachata del
-- Año is "El beso que no le di", Romeo Santos ft. Kiko Rodríguez, composer
-- Romeo Santos. So: renglón 2019, ceremony 2021. The awards row is filed under
-- the ceremony year, which is the convention the rest of the table uses, and
-- the source field records the renglón.
--
-- A COMPOSER CREDIT ESTABLISHED FROM TWO INDEPENDENT SOURCES. Bachata Republic
-- says Zacarías Ferreira wrote "Ya Te Olvidé" on the 1994 debut. The Orchard's
-- distribution metadata on Kiko Rodríguez’s own channel bills the track "Ya Te
-- Olvide · Kiko Rodriguez · Zacarias Ferreira", which is the composer field.
-- Same for "El Verde de Tus Ojos", where the composer reads "Jose Francisco
-- Henriquez" -- his own. Authorship is what this record keeps, so both are in.
--
-- AN ALBUM TITLE WITH THREE FORMS. Qobuz has "Kiko Rodriguez y los Claveles
-- Mios", The Orchard and Shazam have "Y Los Claveles Mios", a rip and Fandom
-- have "Los Claveles Míos". The lyric of El Verde de Tus Ojos opens by
-- announcing "Kiko Rodríguez y los claveles míos", which says what is going on:
-- Los Claveles Míos is the band, and the album is named after the billing. The
-- prose says that instead of picking one of the three.
--
-- A COUNT NOT PICKED. Bachata Republic lists eleven albums. Listín Diario, in
-- August 2018, reports Diferente as the eighteenth of his career, and
-- BuenaMusica says a dozen and a half studio albums plus compilations. The
-- Bachata Republic list is short, not wrong -- it simply stops. The entry uses
-- the newspaper's figure, attributed to the moment it was reported, and does
-- not offer a current total.
--
-- NOT WRITTEN: no view counts, no follower counts. BuenaMusica leads with a
-- YouTube figure and it is left out. A long interview published on El Show de
-- Silvio yesterday is titled "se desahoga" and could not be established from
-- text as being about anything within scope, so nothing from it is used.
--
-- NOT LINKED: Romeo Santos has no entry, which is the largest gap this entry
-- touches and is now on the missing list. Robinson Hernández, Webster Batista,
-- Elvin T. Jiménez, Aníbal Brave, Elibi Báez, Henry Ovalle and Junior Ulerio
-- have no entries either.
--
-- SOURCES: his own YouTube channel, for the official-channel description and
-- the release titles, and for The Orchard credit lines on the back catalogue.
-- His own Instagram and Facebook page. Listín Diario, 9 August 2018, on
-- Diferente, the eighteenth album, twenty-three years in music and the United
-- States tour, quoting him by legal name. Listín Diario, 5 July 2021, on
-- Corazón Lastimado, on Robinson Hernández’s arrangements and on the Soberano.
-- N Digital's complete winners' list, 16 June 2021. BuenaMusica's biography and
-- Datos block. Bachata Republic, 21 July 2021. Qobuz, Shazam and Apple Music
-- for release and credit metadata.
--
-- Applied directly over DATABASE_URL as part of an editorial pass. No Vercel
-- function ran and nothing was revalidated; the profile reaches the public site
-- on its own within the seven-day ISR fallback, or sooner if a batch sweep is
-- run at the end of the pass.
--
-- This file reproduces the change from the pre-pass state. Both it and its
-- rollback were generated from state captured live either side of the write,
-- not reconstructed afterwards.

UPDATE artists SET
       name = 'Kiko Rodríguez',
       sort_name = 'Rodríguez, Kiko',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'bachata',
       date_of_birth = '1978-03-11',
       birth_year = 1978,
       date_of_death = NULL,
       birth_place = 'Tamboril',
       province = 'Santiago',
       first_name = 'José',
       middle_name = 'Francisco',
       last_name = 'Henríquez',
       second_last_name = 'Peña',
       stage_name = 'Kiko Rodríguez',
       aliases = ARRAY[]::text[],
       occupations = '["composer","musician"]'::jsonb,
       instruments = ARRAY['guitar', 'percussion']::text[],
       genres = ARRAY['bachata-romantica', 'bachata-moderna']::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = '@KikoRodriguezrd',
       facebook = 'KikoRodriguezRD',
       instagram = 'kikorodriguezrd',
       disambiguation = 'Bachata singer-songwriter from Tamboril; El Verde de Tus Ojos, El Beso Que No Le Di',
       bio_en = 'Kiko Rodríguez, born José Francisco Henríquez Peña, is a Dominican bachata singer and songwriter. He has been making records for three decades without a break in them, and the song most people know him by is one he sings on somebody else’s album.

**Tamboril**

He is from Tamboril, the cigar town north of Santiago, and more precisely from Canca Arriba, the same small place that produced Zacarías Ferreira. For a town of its size that is an improbable return, and it is part of why bachateros talk about the Cibao the way they do.

The family had no money. He was on percussion young, moved to the guitar and had it under control quickly, and was writing songs and singing before he was old enough to be paid properly for either. Music in that house was not a hobby that might become a career; it was a way of bringing something in.

**The parish rondalla**

At twelve he joined the rondalla of the Canca Arriba parish and stayed six years, playing the drum. A church rondalla is an unglamorous apprenticeship and an unusually thorough one: you learn to hold a tempo for other people, to sing in a group, and to turn up on time every week for years.

What he wanted was bachata, which the parish was not going to give him. With friends and family behind him he put together a group called Los Modernos del Amargue and worked it as both percussionist and singer.

**Los Claveles Míos**

Elvin Productions, working as Discomanía, was watching the new groups and signed him. His debut arrived in 1994, and the sleeve, the label copy and the records themselves disagree slightly about its title because the title is really the billing: Los Claveles Míos was the name of his band, and the first thing you hear on the opening track is him announcing Kiko Rodríguez y los claveles míos over the intro.

Two songs off it settled his career. El Verde de Tus Ojos, which he wrote, is still the one a Dominican crowd waits for. Ya Te Olvidé was written by Zacarías Ferreira — the neighbour from Canca Arriba, at that point not yet the star he became — and the distribution credits carry his name on it to this day.

**A record most years**

Then the albums simply keep coming: Directo al Corazón, Epidemia de Amor and Sentimientos y Más through the rest of that decade, then Dulce Mujer de mi Vida, Sombras de un Pasado, Vete y Vuelve Otra Vez, Otra Vez con Amor, Nací de Nuevo and No lo Esperaba de Ti. Most of them came out through Elvin Productions.

By the time he released Diferente he had been at it twenty-three years and a national newspaper counted the album as his eighteenth. That is the useful number about him. Elvis Martínez, Frank Reyes and Raulín Rodríguez all built the same kind of career in the same years, and what the four of them share is not a hit but a rate of work.

**The kiss he did not give**

El Beso Que No Le Di is a duet on Romeo Santos’s album Utopía, a record built entirely out of the older bachateros the singer grew up on. Kiko Rodríguez is the one he asked for that song, and it turned into the biggest thing either of them did that year.

It took the Soberano for Bachata del Año, the principal award in Dominican music. The statuette reached him late, because the ceremony that would have handed it over was not held and the next one covered two years at once, so a song judged best of one year was collected on a stage two years later.

He also sang Para Qué Llorar as a duet with Luis Segura, on the album assembled around the man the genre calls its father — an invitation that says fairly precisely where the bachata establishment files him.

**Still recording**

Corazón Lastimado, arranged and directed by Robinson Hernández, was released as the first taste of an album he had then been cutting for a year. Comerte a Besitos followed, then Usted No Sabe, then more singles after that, and he keeps a touring circuit going through the United States, Europe and Central America.

He turns up regularly on Dominican television playing the old songs live, which is where the case for him is easiest to make: El Chaval de la Bachata and the rest of that generation are judged on whether the voice still does in a studio what it does on a stage, and his does.',
       bio_es = 'Kiko Rodríguez, de nombre José Francisco Henríquez Peña, es cantante y compositor de bachata dominicano. Lleva tres décadas grabando sin un hueco en el medio, y la canción por la que más gente lo conoce la canta en el disco de otro.

**Tamboril**

Es de Tamboril, el pueblo tabaquero al norte de Santiago, y más exactamente de Canca Arriba, el mismo paraje del que salió Zacarías Ferreira. Para un lugar de ese tamaño es una cosecha improbable, y es parte de por qué los bachateros hablan del Cibao como hablan.

En la casa no había dinero. Empezó temprano en la percusión, se pasó a la guitarra y la dominó rápido, y ya componía y cantaba antes de tener edad para que le pagaran bien por ninguna de las dos cosas. La música ahí no era una afición que quizá se volviera carrera: era una manera de meter algo en la casa.

**La rondalla de la parroquia**

A los doce entró en la rondalla de la parroquia de Canca Arriba y se quedó seis años, tocando el tambor. Una rondalla de iglesia es un aprendizaje sin ningún brillo y bastante completo: uno aprende a sostenerle el tiempo a los demás, a cantar en grupo y a aparecer puntual todas las semanas durante años.

Lo que él quería era bachata, y eso la parroquia no se lo iba a dar. Con amigos y familia detrás armó un grupo, Los Modernos del Amargue, y lo trabajó como percusionista y como cantante.

**Los Claveles Míos**

Elvin Productions, que operaba como Discomanía, andaba pendiente de los grupos nuevos y lo firmó. Su debut salió en 1994, y la carátula, la ficha del sello y los propios discos no se ponen del todo de acuerdo sobre el título porque el título en realidad es el anuncio: Los Claveles Míos era el nombre de su grupo, y lo primero que se oye en el primer tema es él diciendo Kiko Rodríguez y los claveles míos encima de la entrada.

Dos canciones de ahí le fijaron la carrera. El Verde de Tus Ojos, que es suya, sigue siendo la que un público dominicano espera. Ya Te Olvidé la escribió Zacarías Ferreira, el vecino de Canca Arriba que todavía no era la figura en que se convirtió, y los créditos de distribución llevan su nombre hasta hoy.

**Un disco casi cada año**

A partir de ahí los álbumes no paran: Directo al Corazón, Epidemia de Amor y Sentimientos y Más en lo que quedaba de esa década, y después Dulce Mujer de mi Vida, Sombras de un Pasado, Vete y Vuelve Otra Vez, Otra Vez con Amor, Nací de Nuevo y No lo Esperaba de Ti. Casi todos salieron por Elvin Productions.

Cuando publicó Diferente llevaba veintitrés años en esto y un periódico nacional contó el álbum como el decimoctavo. Ese es el dato útil sobre él. Elvis Martínez, Frank Reyes y Raulín Rodríguez armaron la misma clase de carrera en los mismos años, y lo que comparten los cuatro no es un éxito sino un ritmo de trabajo.

**El beso que no le di**

El Beso Que No Le Di es un dúo en Utopía, el disco de Romeo Santos hecho entero con los bachateros mayores con los que él creció. A Kiko Rodríguez lo llamó para esa canción, y terminó siendo lo más grande que hizo cualquiera de los dos ese año.

Se llevó el Soberano a Bachata del Año, el premio principal de la música dominicana. La estatuilla le llegó tarde: la gala que debía entregársela no se celebró y la siguiente premió dos años de una vez, así que una canción juzgada la mejor de un año se recogió en una tarima dos años después.

También cantó Para Qué Llorar a dúo con Luis Segura, en el álbum armado alrededor del hombre al que el género llama su padre: una invitación que dice con bastante precisión en qué lugar lo tiene el establecimiento bachatero.

**Sigue grabando**

Corazón Lastimado, con arreglos y dirección de Robinson Hernández, salió como primer adelanto de un disco que llevaba entonces un año grabando. Después vino Comerte a Besitos, luego Usted No Sabe, y más sencillos detrás, y mantiene una ruta de presentaciones por Estados Unidos, Europa y Centroamérica.

Aparece con frecuencia en la televisión dominicana cantando en vivo las viejas, que es donde más fácil se defiende: a El Chaval de la Bachata y al resto de esa generación se les juzga por si la voz sigue haciendo en un estudio lo que hace en una tarima, y la suya sí.',
       updated_at = now()
 WHERE slug = 'kiko-rodriguez';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-rodriguez')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-rodriguez')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Kiko Rodríguez, born José Francisco Henríquez Peña, is a Dominican bachata singer and songwriter. He has been making records for three decades without a break in them, and the song most people know him by is one he sings on somebody else’s album.","type":"text"}]},{"type":"paragraph","content":[{"text":"Tamboril","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He is from Tamboril, the cigar town north of Santiago, and more precisely from Canca Arriba, the same small place that produced ","type":"text"},{"type":"artistReference","attrs":{"artistId":"a77079ce-351a-4eb5-baef-de02dc1b62ce","displayText":"Zacarías Ferreira","occurrenceId":"cecbb04e-1b21-4cfe-a6c9-a19c34ba1460"}},{"text":". For a town of its size that is an improbable return, and it is part of why bachateros talk about the Cibao the way they do.","type":"text"}]},{"type":"paragraph","content":[{"text":"The family had no money. He was on percussion young, moved to the guitar and had it under control quickly, and was writing songs and singing before he was old enough to be paid properly for either. Music in that house was not a hobby that might become a career; it was a way of bringing something in.","type":"text"}]},{"type":"paragraph","content":[{"text":"The parish rondalla","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"At twelve he joined the rondalla of the Canca Arriba parish and stayed six years, playing the drum. A church rondalla is an unglamorous apprenticeship and an unusually thorough one: you learn to hold a tempo for other people, to sing in a group, and to turn up on time every week for years.","type":"text"}]},{"type":"paragraph","content":[{"text":"What he wanted was bachata, which the parish was not going to give him. With friends and family behind him he put together a group called Los Modernos del Amargue and worked it as both percussionist and singer.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los Claveles Míos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Elvin Productions, working as Discomanía, was watching the new groups and signed him. His debut arrived in 1994, and the sleeve, the label copy and the records themselves disagree slightly about its title because the title is really the billing: Los Claveles Míos was the name of his band, and the first thing you hear on the opening track is him announcing Kiko Rodríguez y los claveles míos over the intro.","type":"text"}]},{"type":"paragraph","content":[{"text":"Two songs off it settled his career. El Verde de Tus Ojos, which he wrote, is still the one a Dominican crowd waits for. Ya Te Olvidé was written by ","type":"text"},{"type":"artistReference","attrs":{"artistId":"a77079ce-351a-4eb5-baef-de02dc1b62ce","displayText":"Zacarías Ferreira","occurrenceId":"14dc39ce-d017-4ebe-8b86-83a64fe7bb0b"}},{"text":" — the neighbour from Canca Arriba, at that point not yet the star he became — and the distribution credits carry his name on it to this day.","type":"text"}]},{"type":"paragraph","content":[{"text":"A record most years","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Then the albums simply keep coming: Directo al Corazón, Epidemia de Amor and Sentimientos y Más through the rest of that decade, then Dulce Mujer de mi Vida, Sombras de un Pasado, Vete y Vuelve Otra Vez, Otra Vez con Amor, Nací de Nuevo and No lo Esperaba de Ti. Most of them came out through Elvin Productions.","type":"text"}]},{"type":"paragraph","content":[{"text":"By the time he released Diferente he had been at it twenty-three years and a national newspaper counted the album as his eighteenth. That is the useful number about him. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"e566c763-02c1-4f96-8a82-edbba9fc0bb2","displayText":"Elvis Martínez","occurrenceId":"d04e6344-82cb-48a5-ab93-3e4ca07c62e2"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3dd83e6b-2058-4d04-ac68-38e11d9348a9","displayText":"Frank Reyes","occurrenceId":"956a207b-2996-4aab-8768-e0bb7514eba5"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"96e69c00-dbb0-4cb4-ab48-ea46be9c4591","displayText":"Raulín Rodríguez","occurrenceId":"8dc87a6b-f97b-4035-b5ab-378f33f80e6b"}},{"text":" all built the same kind of career in the same years, and what the four of them share is not a hit but a rate of work.","type":"text"}]},{"type":"paragraph","content":[{"text":"The kiss he did not give","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El Beso Que No Le Di is a duet on Romeo Santos’s album Utopía, a record built entirely out of the older bachateros the singer grew up on. Kiko Rodríguez is the one he asked for that song, and it turned into the biggest thing either of them did that year.","type":"text"}]},{"type":"paragraph","content":[{"text":"It took the Soberano for Bachata del Año, the principal award in Dominican music. The statuette reached him late, because the ceremony that would have handed it over was not held and the next one covered two years at once, so a song judged best of one year was collected on a stage two years later.","type":"text"}]},{"type":"paragraph","content":[{"text":"He also sang Para Qué Llorar as a duet with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"5ceceef0-765d-4e01-8017-85422a263357","displayText":"Luis Segura","occurrenceId":"03e176b7-7991-4e68-adf2-3903284ffc2a"}},{"text":", on the album assembled around the man the genre calls its father — an invitation that says fairly precisely where the bachata establishment files him.","type":"text"}]},{"type":"paragraph","content":[{"text":"Still recording","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Corazón Lastimado, arranged and directed by Robinson Hernández, was released as the first taste of an album he had then been cutting for a year. Comerte a Besitos followed, then Usted No Sabe, then more singles after that, and he keeps a touring circuit going through the United States, Europe and Central America.","type":"text"}]},{"type":"paragraph","content":[{"text":"He turns up regularly on Dominican television playing the old songs live, which is where the case for him is easiest to make: ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8be8c38c-e6a5-4e0d-83d1-8c8d20813ce6","displayText":"El Chaval de la Bachata","occurrenceId":"43df5593-1de2-4b5d-959f-45edec427c95"}},{"text":" and the rest of that generation are judged on whether the voice still does in a studio what it does on a stage, and his does.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'kiko-rodriguez'), 2)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Kiko Rodríguez, de nombre José Francisco Henríquez Peña, es cantante y compositor de bachata dominicano. Lleva tres décadas grabando sin un hueco en el medio, y la canción por la que más gente lo conoce la canta en el disco de otro.","type":"text"}]},{"type":"paragraph","content":[{"text":"Tamboril","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Es de Tamboril, el pueblo tabaquero al norte de Santiago, y más exactamente de Canca Arriba, el mismo paraje del que salió ","type":"text"},{"type":"artistReference","attrs":{"artistId":"a77079ce-351a-4eb5-baef-de02dc1b62ce","displayText":"Zacarías Ferreira","occurrenceId":"8652f210-2547-49d0-bd5b-4f36b20ac690"}},{"text":". Para un lugar de ese tamaño es una cosecha improbable, y es parte de por qué los bachateros hablan del Cibao como hablan.","type":"text"}]},{"type":"paragraph","content":[{"text":"En la casa no había dinero. Empezó temprano en la percusión, se pasó a la guitarra y la dominó rápido, y ya componía y cantaba antes de tener edad para que le pagaran bien por ninguna de las dos cosas. La música ahí no era una afición que quizá se volviera carrera: era una manera de meter algo en la casa.","type":"text"}]},{"type":"paragraph","content":[{"text":"La rondalla de la parroquia","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"A los doce entró en la rondalla de la parroquia de Canca Arriba y se quedó seis años, tocando el tambor. Una rondalla de iglesia es un aprendizaje sin ningún brillo y bastante completo: uno aprende a sostenerle el tiempo a los demás, a cantar en grupo y a aparecer puntual todas las semanas durante años.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que él quería era bachata, y eso la parroquia no se lo iba a dar. Con amigos y familia detrás armó un grupo, Los Modernos del Amargue, y lo trabajó como percusionista y como cantante.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los Claveles Míos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Elvin Productions, que operaba como Discomanía, andaba pendiente de los grupos nuevos y lo firmó. Su debut salió en 1994, y la carátula, la ficha del sello y los propios discos no se ponen del todo de acuerdo sobre el título porque el título en realidad es el anuncio: Los Claveles Míos era el nombre de su grupo, y lo primero que se oye en el primer tema es él diciendo Kiko Rodríguez y los claveles míos encima de la entrada.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dos canciones de ahí le fijaron la carrera. El Verde de Tus Ojos, que es suya, sigue siendo la que un público dominicano espera. Ya Te Olvidé la escribió ","type":"text"},{"type":"artistReference","attrs":{"artistId":"a77079ce-351a-4eb5-baef-de02dc1b62ce","displayText":"Zacarías Ferreira","occurrenceId":"9a8ca176-8b08-4f2f-870a-91ef47e903e4"}},{"text":", el vecino de Canca Arriba que todavía no era la figura en que se convirtió, y los créditos de distribución llevan su nombre hasta hoy.","type":"text"}]},{"type":"paragraph","content":[{"text":"Un disco casi cada año","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"A partir de ahí los álbumes no paran: Directo al Corazón, Epidemia de Amor y Sentimientos y Más en lo que quedaba de esa década, y después Dulce Mujer de mi Vida, Sombras de un Pasado, Vete y Vuelve Otra Vez, Otra Vez con Amor, Nací de Nuevo y No lo Esperaba de Ti. Casi todos salieron por Elvin Productions.","type":"text"}]},{"type":"paragraph","content":[{"text":"Cuando publicó Diferente llevaba veintitrés años en esto y un periódico nacional contó el álbum como el decimoctavo. Ese es el dato útil sobre él. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"e566c763-02c1-4f96-8a82-edbba9fc0bb2","displayText":"Elvis Martínez","occurrenceId":"c4ea9601-0c9f-4aeb-bdb8-348afef88f4a"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3dd83e6b-2058-4d04-ac68-38e11d9348a9","displayText":"Frank Reyes","occurrenceId":"57033de2-90fd-47ca-bd68-7440f6221a53"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"96e69c00-dbb0-4cb4-ab48-ea46be9c4591","displayText":"Raulín Rodríguez","occurrenceId":"db223029-c7f5-4180-aa6c-c97282eacd49"}},{"text":" armaron la misma clase de carrera en los mismos años, y lo que comparten los cuatro no es un éxito sino un ritmo de trabajo.","type":"text"}]},{"type":"paragraph","content":[{"text":"El beso que no le di","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El Beso Que No Le Di es un dúo en Utopía, el disco de Romeo Santos hecho entero con los bachateros mayores con los que él creció. A Kiko Rodríguez lo llamó para esa canción, y terminó siendo lo más grande que hizo cualquiera de los dos ese año.","type":"text"}]},{"type":"paragraph","content":[{"text":"Se llevó el Soberano a Bachata del Año, el premio principal de la música dominicana. La estatuilla le llegó tarde: la gala que debía entregársela no se celebró y la siguiente premió dos años de una vez, así que una canción juzgada la mejor de un año se recogió en una tarima dos años después.","type":"text"}]},{"type":"paragraph","content":[{"text":"También cantó Para Qué Llorar a dúo con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"5ceceef0-765d-4e01-8017-85422a263357","displayText":"Luis Segura","occurrenceId":"d7b51113-1aa7-4982-9bf2-c6efdd62bf61"}},{"text":", en el álbum armado alrededor del hombre al que el género llama su padre: una invitación que dice con bastante precisión en qué lugar lo tiene el establecimiento bachatero.","type":"text"}]},{"type":"paragraph","content":[{"text":"Sigue grabando","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Corazón Lastimado, con arreglos y dirección de Robinson Hernández, salió como primer adelanto de un disco que llevaba entonces un año grabando. Después vino Comerte a Besitos, luego Usted No Sabe, y más sencillos detrás, y mantiene una ruta de presentaciones por Estados Unidos, Europa y Centroamérica.","type":"text"}]},{"type":"paragraph","content":[{"text":"Aparece con frecuencia en la televisión dominicana cantando en vivo las viejas, que es donde más fácil se defiende: a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8be8c38c-e6a5-4e0d-83d1-8c8d20813ce6","displayText":"El Chaval de la Bachata","occurrenceId":"a9c0c188-16fb-44d3-94cd-162f6af0428c"}},{"text":" y al resto de esa generación se les juzga por si la voz sigue haciendo en un estudio lo que hace en una tarima, y la suya sí.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'kiko-rodriguez'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-rodriguez') AND locale = 'en'), '03e176b7-7991-4e68-adf2-3903284ffc2a', 'artist', '5ceceef0-765d-4e01-8017-85422a263357');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-rodriguez') AND locale = 'en'), '14dc39ce-d017-4ebe-8b86-83a64fe7bb0b', 'artist', 'a77079ce-351a-4eb5-baef-de02dc1b62ce');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-rodriguez') AND locale = 'en'), '43df5593-1de2-4b5d-959f-45edec427c95', 'artist', '8be8c38c-e6a5-4e0d-83d1-8c8d20813ce6');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-rodriguez') AND locale = 'en'), '8dc87a6b-f97b-4035-b5ab-378f33f80e6b', 'artist', '96e69c00-dbb0-4cb4-ab48-ea46be9c4591');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-rodriguez') AND locale = 'en'), '956a207b-2996-4aab-8768-e0bb7514eba5', 'artist', '3dd83e6b-2058-4d04-ac68-38e11d9348a9');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-rodriguez') AND locale = 'en'), 'cecbb04e-1b21-4cfe-a6c9-a19c34ba1460', 'artist', 'a77079ce-351a-4eb5-baef-de02dc1b62ce');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-rodriguez') AND locale = 'en'), 'd04e6344-82cb-48a5-ab93-3e4ca07c62e2', 'artist', 'e566c763-02c1-4f96-8a82-edbba9fc0bb2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-rodriguez') AND locale = 'es'), '57033de2-90fd-47ca-bd68-7440f6221a53', 'artist', '3dd83e6b-2058-4d04-ac68-38e11d9348a9');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-rodriguez') AND locale = 'es'), '8652f210-2547-49d0-bd5b-4f36b20ac690', 'artist', 'a77079ce-351a-4eb5-baef-de02dc1b62ce');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-rodriguez') AND locale = 'es'), '9a8ca176-8b08-4f2f-870a-91ef47e903e4', 'artist', 'a77079ce-351a-4eb5-baef-de02dc1b62ce');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-rodriguez') AND locale = 'es'), 'a9c0c188-16fb-44d3-94cd-162f6af0428c', 'artist', '8be8c38c-e6a5-4e0d-83d1-8c8d20813ce6');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-rodriguez') AND locale = 'es'), 'c4ea9601-0c9f-4aeb-bdb8-348afef88f4a', 'artist', 'e566c763-02c1-4f96-8a82-edbba9fc0bb2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-rodriguez') AND locale = 'es'), 'd7b51113-1aa7-4982-9bf2-c6efdd62bf61', 'artist', '5ceceef0-765d-4e01-8017-85422a263357');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-rodriguez') AND locale = 'es'), 'db223029-c7f5-4180-aa6c-c97282eacd49', 'artist', '96e69c00-dbb0-4cb4-ab48-ea46be9c4591');

COMMIT;
