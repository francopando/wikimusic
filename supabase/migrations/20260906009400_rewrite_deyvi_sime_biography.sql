BEGIN;

-- Rewrite the catalogue entry for Deyvi Simé.
--
-- Deyvi Simé. Filler in English, nothing in Spanish, no aliases, no
-- disambiguation, jazz sitting in the genres array -- on the man who wrote the
-- bachata that won the Soberano in 2019.
--
-- PROVINCE AND BIRTHPLACE CORRECTED. The row said Santiago for both. Three
-- independent sources say La Romana: his own biography on about.me ("nació en
-- La Romana"), IMDb ("nació el 8 de octubre de 1986 en la localidad de La
-- Romana") and MusicBrainz, whose begin-area for his MBID is La Romana. His own
-- channel also carries a video titled "Anthony Santos & Deyvi Simé - Mal Educado
-- en Vivo | La Romana 2019". province and birth_place both go to La Romana.
--
-- LEGAL NAME COMPLETED. The row had first_name Deyvi, last_name Simé and no
-- second surname. His legal name is Deivi Antonio Rodríguez Simé -- Deyvi is the
-- stage spelling and Simé is his second surname, which is the same arrangement
-- the catalogue already handles for Frank Reyes. sort_name stays "Simé, Deyvi",
-- under the name people look for.
--
-- date_of_birth 1986-10-08 was already stored, is confirmed by IMDb and by
-- MusicBrainz, and is not touched.
--
-- JAZZ REMOVED FROM genres. Nothing found supports it -- not one source, not one
-- credit, not one title. It appears to come from the same machine-written
-- paragraph that also said "Merengue Tipico, Jazz Latino" over a row that says
-- bachata, and that claimed he was born in 1988 when the row says 1986. In its
-- place go the four genres elCaribe reports him writing in besides bachata:
-- merengue, salsa, urbano and balada.
--
-- AND THE GENRE SLUGS WERE CHECKED AGAINST `active` THIS TIME. Writing Kiko
-- Rodríguez an hour ago I put two inactive bachata slugs in his array because I
-- queried `genres` without reading the active column. Fixed in 20260906009300.
-- Every slug below is active.
--
-- THE AWARD, AND A CONTEMPORANEOUS ERROR THAT TWO PAPERS REPEATED. Listín
-- Diario's account of the 35th gala, 20 March 2019, says Antony Santos took the
-- best bachata with "Encadenado", composed by Deyvi Simé, and Vanguardia del
-- Pueblo repeats that sentence word for word in its own prose. But Vanguardia's
-- published winners' list, in the same article, reads:
--
--   BACHATA DEL AÑO
--   «Mal educado» - Anthony Santos (Deyvi Simé)
--
-- and elCaribe, a year later, says outright that "Mal educado" was his first
-- composition for Antony Santos and that it won bachata of the year at Soberano
-- 2019. His own channel and his own about.me page both say Mal Educado, and his
-- channel hosts a live video of it. The song is Mal Educado; "Encadenado" is a
-- wire-copy error that propagated. The awards row uses Mal Educado.
--
-- A WRONG ROW FOUND IN ANOTHER ARTIST WHILE VERIFYING THIS ONE. antony-santos
-- carries "El Gran Soberano, 2013". El Gran Soberano 2013 went to Héctor Acosta
-- "El Torito" -- Acento, Hoy, El Diario NY, Héctor Acosta's own site and the
-- winners table in Spanish Wikipedia all say so. Antony Santos won El Gran
-- Soberano in 2019, which is exactly why the 2019 reports frame it as the first
-- one ever taken by traditional bachata. Corrected in a separate migration
-- alongside the awards this entry adds, not silently.
--
-- SOURCES: his own YouTube channel -- the About panel, which states the Soberano
-- and lists his hits by hashtag, and the twenty-five video titles, which are the
-- fullest catalogue of his work that exists. His own biography on about.me, for
-- the family, the first guitar, Prófugos 26, Monchy and the recent Antony Santos
-- album. elCaribe, 12 March 2020, an independent newspaper profile, for Mal
-- Educado being his first for Antony Santos, for Segundo Plato and Antes del
-- Lunes, and for his writing outside bachata. Listín Diario and Vanguardia del
-- Pueblo, March 2019, for the gala. Joseph Cáceres's Merengala, May 2021, for
-- Boston. IMDb and MusicBrainz for the birth date and La Romana.
--
-- NOT WRITTEN: no view counts, no follower counts. His about.me says God is
-- first in his projects and elCaribe quotes him saying "Dios es el que manda";
-- religion is personal and the artist_tags value stays "secular", which
-- describes the music.
--
-- NOT LINKED: Akon is American. Francisco Xavier Rodríguez -- his uncle, and the
-- musician he names as his inspiration -- Henry Ulloa, Jimmy Bauer and Angelo
-- Vargas have no entries; all four are named in prose without a link and go on
-- the missing list, except Akon.
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
       name = 'Deyvi Simé',
       sort_name = 'Simé, Deyvi',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'composer',
       primary_genre = 'bachata',
       date_of_birth = '1986-10-08',
       birth_year = 1986,
       date_of_death = NULL,
       birth_place = 'La Romana',
       province = 'La Romana',
       first_name = 'Deivi',
       middle_name = 'Antonio',
       last_name = 'Rodríguez',
       second_last_name = 'Simé',
       stage_name = 'Deyvi Simé',
       aliases = ARRAY[]::text[],
       occupations = '["musician","singer","producer"]'::jsonb,
       instruments = ARRAY['guitar']::text[],
       genres = ARRAY['merengue', 'salsa', 'urbano', 'ballads']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = 'https://deyvisimemusic.com',
       youtube = '@DeyviSiméOficial',
       facebook = 'simeoficial',
       instagram = 'deyvi.sime',
       disambiguation = 'Songwriter; Soberano for Bachata of the Year with Mal Educado',
       bio_en = 'Deyvi Simé, born Deivi Antonio Rodríguez Simé, is a Dominican songwriter, singer and producer. He is filed here as a composer because that is the trade: several of the biggest bachatas of the last decade are songs he wrote for other people to sing.

**La Romana**

He is from La Romana, and he was the child who got asked to sing at every school event. When he was eight his grandparents had a guitar made for him — commissioned, not bought, which in a Dominican family is a decision rather than a present — and he had an uncle, the musician Francisco Xavier Rodríguez, to show him what the thing was for.

He wrote his first song at fourteen and put together a band with schoolmates called Prófugos 26. The name outlasted the band: the original address of his YouTube channel is still profugosmusica.

**The first studio**

What moved him from writing to recording was meeting Monchy, of one of the most successful duos bachata has produced. The friendship put him in a studio for the first time and on Dominican national television, which is a considerable head start for a teenager from La Romana with a notebook.

He later emigrated to the United States and settled in Boston, and kept writing from there. Dominican songwriting has a long history of being done at that distance.

**Writing for the Mayimbe**

Mal Educado was the first song he wrote for Antony Santos. It won Bachata of the Year at the thirty-fifth Soberano gala, on the same night Santos took Bachatero of the Year and the Gran Soberano, the first one ever given to traditional bachata.

The winners’ list printed the composer’s name in brackets after the performer’s. That bracket is the only reason a songwriter’s name survives an awards night at all, and it is worth noticing how thin the thread is: change the format of one list and the man who wrote the song disappears from the record of the year he won it.

Se Acabó El Abuso followed, for the same singer. Then Segundo Plato and Acaba Con Mi Vida for El Chaval de la Bachata; Antes Del Lunes and Pa’ Que Me Perdones for Héctor Acosta “El Torito”; Por Loco for El Gringo de la Bachata. He has also written for Elvis Martínez, Raulín Rosendo and Karlos Rosé, and outside bachata for merengue, salsa, urbano and balada singers.

Three of his songs are on Antony Santos’s recent album: Hay Amores de Más, cut with Akon, Desnuda, written with Henry Ulloa, and Corazón Olvida. Being called into the studio by the singer himself is the promotion a songwriter gets.

**His own voice**

He also records. Hipócrita Tú, made with Monchy, went to Primer Impacto and to Dominican-facing television in New York, and Malamaña, Cirugía, Si No La Puedo Olvidar, Cosa Vieja, Que Difícil, Que Será, Que Tu Sepas, Cuidado and Si Regresa La Boto are all his.

A songwriter who sings his own material is auditioning it as much as performing it. The versions under his own name are how the next singer hears the song.',
       bio_es = 'Deyvi Simé, de nombre Deivi Antonio Rodríguez Simé, es compositor, cantante y productor dominicano. Aquí está fichado como compositor porque ese es el oficio: varias de las bachatas más grandes de la última década son canciones que él escribió para que las cantara otro.

**La Romana**

Es de La Romana, y era el muchachito al que llamaban a cantar en todas las actividades de la escuela. A los ocho años sus abuelos le mandaron a fabricar una guitarra —encargada, no comprada, que en una familia dominicana es una decisión y no un regalo— y tenía un tío músico, Francisco Xavier Rodríguez, para enseñarle para qué servía el aparato.

Escribió su primera canción a los catorce y armó con compañeros de clase una banda llamada Prófugos 26. El nombre le sobrevivió a la banda: la dirección vieja de su canal de YouTube todavía es profugosmusica.

**El primer estudio**

Lo que lo pasó de escribir a grabar fue conocer a Monchy, de uno de los dúos más exitosos que ha dado la bachata. De esa amistad salieron su primera vez en un estudio y sus primeras apariciones en la televisión nacional dominicana, que es bastante ventaja para un adolescente de La Romana con una libreta.

Después emigró a Estados Unidos y se estableció en Boston, y siguió escribiendo desde allá. La composición dominicana lleva mucho tiempo haciéndose a esa distancia.

**Escribirle al Mayimbe**

Mal Educado fue la primera canción que le escribió a Antony Santos. Ganó la Bachata del Año en la trigésima quinta gala del Soberano, la misma noche en que Santos se llevó el Bachatero del Año y el Gran Soberano, el primero que se le daba a la bachata tradicional.

La lista de ganadores puso el nombre del compositor entre paréntesis detrás del intérprete. Ese paréntesis es la única razón por la que el nombre de un autor sobrevive a una noche de premios, y vale reparar en lo delgado que es el hilo: se le cambia el formato a una lista y el que escribió la canción desaparece del registro del año en que ganó.

Después vino Se Acabó El Abuso, para el mismo cantante. Luego Segundo Plato y Acaba Con Mi Vida para El Chaval de la Bachata; Antes Del Lunes y Pa’ Que Me Perdones para Héctor Acosta “El Torito”; Por Loco para El Gringo de la Bachata. También le ha escrito a Elvis Martínez, a Raulín Rosendo y a Karlos Rosé, y fuera de la bachata a gente de merengue, salsa, urbano y balada.

Tres canciones suyas están en el disco reciente de Antony Santos: Hay Amores de Más, grabada con Akon, Desnuda, escrita con Henry Ulloa, y Corazón Olvida. Que el cantante lo llame al estudio es el ascenso que recibe un compositor.

**Su propia voz**

También graba. Hipócrita Tú, hecha con Monchy, llegó a Primer Impacto y a la televisión dominicana de Nueva York, y Malamaña, Cirugía, Si No La Puedo Olvidar, Cosa Vieja, Que Difícil, Que Será, Que Tu Sepas, Cuidado y Si Regresa La Boto son suyas.

Un compositor que canta su propio material lo está audicionando tanto como interpretándolo. Las versiones con su nombre son la manera en que el próximo cantante oye la canción.',
       updated_at = now()
 WHERE slug = 'deyvi-sime';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'deyvi-sime')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'deyvi-sime')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Deyvi Simé, born Deivi Antonio Rodríguez Simé, is a Dominican songwriter, singer and producer. He is filed here as a composer because that is the trade: several of the biggest bachatas of the last decade are songs he wrote for other people to sing.","type":"text"}]},{"type":"paragraph","content":[{"text":"La Romana","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He is from La Romana, and he was the child who got asked to sing at every school event. When he was eight his grandparents had a guitar made for him — commissioned, not bought, which in a Dominican family is a decision rather than a present — and he had an uncle, the musician Francisco Xavier Rodríguez, to show him what the thing was for.","type":"text"}]},{"type":"paragraph","content":[{"text":"He wrote his first song at fourteen and put together a band with schoolmates called Prófugos 26. The name outlasted the band: the original address of his YouTube channel is still profugosmusica.","type":"text"}]},{"type":"paragraph","content":[{"text":"The first studio","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"What moved him from writing to recording was meeting ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d8aefbcb-6b6e-46e4-95ac-560a59cf8229","displayText":"Monchy","occurrenceId":"f0e35b73-8172-42fd-a480-2375af5779d9"}},{"text":", of one of the most successful duos bachata has produced. The friendship put him in a studio for the first time and on Dominican national television, which is a considerable head start for a teenager from La Romana with a notebook.","type":"text"}]},{"type":"paragraph","content":[{"text":"He later emigrated to the United States and settled in Boston, and kept writing from there. Dominican songwriting has a long history of being done at that distance.","type":"text"}]},{"type":"paragraph","content":[{"text":"Writing for the Mayimbe","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Mal Educado was the first song he wrote for ","type":"text"},{"type":"artistReference","attrs":{"artistId":"28a3745e-90d6-45cd-b8bd-798028f8deb8","displayText":"Antony Santos","occurrenceId":"0b0dd37c-cb1f-419f-829d-0cd2db17e8f3"}},{"text":". It won Bachata of the Year at the thirty-fifth Soberano gala, on the same night Santos took Bachatero of the Year and the Gran Soberano, the first one ever given to traditional bachata.","type":"text"}]},{"type":"paragraph","content":[{"text":"The winners’ list printed the composer’s name in brackets after the performer’s. That bracket is the only reason a songwriter’s name survives an awards night at all, and it is worth noticing how thin the thread is: change the format of one list and the man who wrote the song disappears from the record of the year he won it.","type":"text"}]},{"type":"paragraph","content":[{"text":"Se Acabó El Abuso followed, for the same singer. Then Segundo Plato and Acaba Con Mi Vida for ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8be8c38c-e6a5-4e0d-83d1-8c8d20813ce6","displayText":"El Chaval de la Bachata","occurrenceId":"51d2f754-56b4-42ec-be95-06775ebdccd1"}},{"text":"; Antes Del Lunes and Pa’ Que Me Perdones for ","type":"text"},{"type":"artistReference","attrs":{"artistId":"dee014d6-cb3c-4abb-9262-165538277a0d","displayText":"Héctor Acosta “El Torito”","occurrenceId":"ddb54c80-1a70-4e08-9149-b2d0b6944962"}},{"text":"; Por Loco for ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9fb49cd8-af2f-4417-b1f7-3acfe7263c21","displayText":"El Gringo de la Bachata","occurrenceId":"e5233f53-c2d7-4e25-97e4-adc0e4f044a2"}},{"text":". He has also written for ","type":"text"},{"type":"artistReference","attrs":{"artistId":"e566c763-02c1-4f96-8a82-edbba9fc0bb2","displayText":"Elvis Martínez","occurrenceId":"a3db07a0-a9ff-4366-a2fc-8462ae7a953f"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"faf3e4cb-808e-419c-87ff-5126eed85e73","displayText":"Raulín Rosendo","occurrenceId":"e2fcd26f-1a03-4b6a-bdd9-1eb3783d5608"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"63d21eeb-86d7-447b-9ddc-b764046880dc","displayText":"Karlos Rosé","occurrenceId":"b327b46f-bdee-426b-bdf9-68d123d97ed3"}},{"text":", and outside bachata for merengue, salsa, urbano and balada singers.","type":"text"}]},{"type":"paragraph","content":[{"text":"Three of his songs are on Antony Santos’s recent album: Hay Amores de Más, cut with Akon, Desnuda, written with Henry Ulloa, and Corazón Olvida. Being called into the studio by the singer himself is the promotion a songwriter gets.","type":"text"}]},{"type":"paragraph","content":[{"text":"His own voice","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He also records. Hipócrita Tú, made with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d8aefbcb-6b6e-46e4-95ac-560a59cf8229","displayText":"Monchy","occurrenceId":"3bece36b-2403-4269-b4c3-8eaf1c6b288f"}},{"text":", went to Primer Impacto and to Dominican-facing television in New York, and Malamaña, Cirugía, Si No La Puedo Olvidar, Cosa Vieja, Que Difícil, Que Será, Que Tu Sepas, Cuidado and Si Regresa La Boto are all his.","type":"text"}]},{"type":"paragraph","content":[{"text":"A songwriter who sings his own material is auditioning it as much as performing it. The versions under his own name are how the next singer hears the song.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'deyvi-sime'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Deyvi Simé, de nombre Deivi Antonio Rodríguez Simé, es compositor, cantante y productor dominicano. Aquí está fichado como compositor porque ese es el oficio: varias de las bachatas más grandes de la última década son canciones que él escribió para que las cantara otro.","type":"text"}]},{"type":"paragraph","content":[{"text":"La Romana","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Es de La Romana, y era el muchachito al que llamaban a cantar en todas las actividades de la escuela. A los ocho años sus abuelos le mandaron a fabricar una guitarra —encargada, no comprada, que en una familia dominicana es una decisión y no un regalo— y tenía un tío músico, Francisco Xavier Rodríguez, para enseñarle para qué servía el aparato.","type":"text"}]},{"type":"paragraph","content":[{"text":"Escribió su primera canción a los catorce y armó con compañeros de clase una banda llamada Prófugos 26. El nombre le sobrevivió a la banda: la dirección vieja de su canal de YouTube todavía es profugosmusica.","type":"text"}]},{"type":"paragraph","content":[{"text":"El primer estudio","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Lo que lo pasó de escribir a grabar fue conocer a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d8aefbcb-6b6e-46e4-95ac-560a59cf8229","displayText":"Monchy","occurrenceId":"571cb03f-b798-41e0-b8f3-f750d7a14c0d"}},{"text":", de uno de los dúos más exitosos que ha dado la bachata. De esa amistad salieron su primera vez en un estudio y sus primeras apariciones en la televisión nacional dominicana, que es bastante ventaja para un adolescente de La Romana con una libreta.","type":"text"}]},{"type":"paragraph","content":[{"text":"Después emigró a Estados Unidos y se estableció en Boston, y siguió escribiendo desde allá. La composición dominicana lleva mucho tiempo haciéndose a esa distancia.","type":"text"}]},{"type":"paragraph","content":[{"text":"Escribirle al Mayimbe","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Mal Educado fue la primera canción que le escribió a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"28a3745e-90d6-45cd-b8bd-798028f8deb8","displayText":"Antony Santos","occurrenceId":"7b1f3abc-5435-4bec-8281-7baa296f221e"}},{"text":". Ganó la Bachata del Año en la trigésima quinta gala del Soberano, la misma noche en que Santos se llevó el Bachatero del Año y el Gran Soberano, el primero que se le daba a la bachata tradicional.","type":"text"}]},{"type":"paragraph","content":[{"text":"La lista de ganadores puso el nombre del compositor entre paréntesis detrás del intérprete. Ese paréntesis es la única razón por la que el nombre de un autor sobrevive a una noche de premios, y vale reparar en lo delgado que es el hilo: se le cambia el formato a una lista y el que escribió la canción desaparece del registro del año en que ganó.","type":"text"}]},{"type":"paragraph","content":[{"text":"Después vino Se Acabó El Abuso, para el mismo cantante. Luego Segundo Plato y Acaba Con Mi Vida para ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8be8c38c-e6a5-4e0d-83d1-8c8d20813ce6","displayText":"El Chaval de la Bachata","occurrenceId":"5b4b73ce-52e6-4991-a9c2-c55bc5b0caa7"}},{"text":"; Antes Del Lunes y Pa’ Que Me Perdones para ","type":"text"},{"type":"artistReference","attrs":{"artistId":"dee014d6-cb3c-4abb-9262-165538277a0d","displayText":"Héctor Acosta “El Torito”","occurrenceId":"02e2ced6-e2fa-402c-8646-096ec4520d9d"}},{"text":"; Por Loco para ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9fb49cd8-af2f-4417-b1f7-3acfe7263c21","displayText":"El Gringo de la Bachata","occurrenceId":"719d9142-c79b-40bb-bb49-b907735936a1"}},{"text":". También le ha escrito a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"e566c763-02c1-4f96-8a82-edbba9fc0bb2","displayText":"Elvis Martínez","occurrenceId":"93c4c206-532b-4906-904c-e1de61d61e63"}},{"text":", a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"faf3e4cb-808e-419c-87ff-5126eed85e73","displayText":"Raulín Rosendo","occurrenceId":"a05d7431-f7fa-40df-8c65-4eab14245582"}},{"text":" y a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"63d21eeb-86d7-447b-9ddc-b764046880dc","displayText":"Karlos Rosé","occurrenceId":"6ef7ec22-7afb-4d39-804a-e5730169e450"}},{"text":", y fuera de la bachata a gente de merengue, salsa, urbano y balada.","type":"text"}]},{"type":"paragraph","content":[{"text":"Tres canciones suyas están en el disco reciente de Antony Santos: Hay Amores de Más, grabada con Akon, Desnuda, escrita con Henry Ulloa, y Corazón Olvida. Que el cantante lo llame al estudio es el ascenso que recibe un compositor.","type":"text"}]},{"type":"paragraph","content":[{"text":"Su propia voz","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"También graba. Hipócrita Tú, hecha con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d8aefbcb-6b6e-46e4-95ac-560a59cf8229","displayText":"Monchy","occurrenceId":"fc8cc217-f32d-47fc-95af-9d1fcc651718"}},{"text":", llegó a Primer Impacto y a la televisión dominicana de Nueva York, y Malamaña, Cirugía, Si No La Puedo Olvidar, Cosa Vieja, Que Difícil, Que Será, Que Tu Sepas, Cuidado y Si Regresa La Boto son suyas.","type":"text"}]},{"type":"paragraph","content":[{"text":"Un compositor que canta su propio material lo está audicionando tanto como interpretándolo. Las versiones con su nombre son la manera en que el próximo cantante oye la canción.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'deyvi-sime'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'deyvi-sime') AND locale = 'en'), '0b0dd37c-cb1f-419f-829d-0cd2db17e8f3', 'artist', '28a3745e-90d6-45cd-b8bd-798028f8deb8');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'deyvi-sime') AND locale = 'en'), '3bece36b-2403-4269-b4c3-8eaf1c6b288f', 'artist', 'd8aefbcb-6b6e-46e4-95ac-560a59cf8229');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'deyvi-sime') AND locale = 'en'), '51d2f754-56b4-42ec-be95-06775ebdccd1', 'artist', '8be8c38c-e6a5-4e0d-83d1-8c8d20813ce6');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'deyvi-sime') AND locale = 'en'), 'a3db07a0-a9ff-4366-a2fc-8462ae7a953f', 'artist', 'e566c763-02c1-4f96-8a82-edbba9fc0bb2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'deyvi-sime') AND locale = 'en'), 'b327b46f-bdee-426b-bdf9-68d123d97ed3', 'artist', '63d21eeb-86d7-447b-9ddc-b764046880dc');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'deyvi-sime') AND locale = 'en'), 'ddb54c80-1a70-4e08-9149-b2d0b6944962', 'artist', 'dee014d6-cb3c-4abb-9262-165538277a0d');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'deyvi-sime') AND locale = 'en'), 'e2fcd26f-1a03-4b6a-bdd9-1eb3783d5608', 'artist', 'faf3e4cb-808e-419c-87ff-5126eed85e73');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'deyvi-sime') AND locale = 'en'), 'e5233f53-c2d7-4e25-97e4-adc0e4f044a2', 'artist', '9fb49cd8-af2f-4417-b1f7-3acfe7263c21');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'deyvi-sime') AND locale = 'en'), 'f0e35b73-8172-42fd-a480-2375af5779d9', 'artist', 'd8aefbcb-6b6e-46e4-95ac-560a59cf8229');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'deyvi-sime') AND locale = 'es'), '02e2ced6-e2fa-402c-8646-096ec4520d9d', 'artist', 'dee014d6-cb3c-4abb-9262-165538277a0d');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'deyvi-sime') AND locale = 'es'), '571cb03f-b798-41e0-b8f3-f750d7a14c0d', 'artist', 'd8aefbcb-6b6e-46e4-95ac-560a59cf8229');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'deyvi-sime') AND locale = 'es'), '5b4b73ce-52e6-4991-a9c2-c55bc5b0caa7', 'artist', '8be8c38c-e6a5-4e0d-83d1-8c8d20813ce6');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'deyvi-sime') AND locale = 'es'), '6ef7ec22-7afb-4d39-804a-e5730169e450', 'artist', '63d21eeb-86d7-447b-9ddc-b764046880dc');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'deyvi-sime') AND locale = 'es'), '719d9142-c79b-40bb-bb49-b907735936a1', 'artist', '9fb49cd8-af2f-4417-b1f7-3acfe7263c21');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'deyvi-sime') AND locale = 'es'), '7b1f3abc-5435-4bec-8281-7baa296f221e', 'artist', '28a3745e-90d6-45cd-b8bd-798028f8deb8');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'deyvi-sime') AND locale = 'es'), '93c4c206-532b-4906-904c-e1de61d61e63', 'artist', 'e566c763-02c1-4f96-8a82-edbba9fc0bb2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'deyvi-sime') AND locale = 'es'), 'a05d7431-f7fa-40df-8c65-4eab14245582', 'artist', 'faf3e4cb-808e-419c-87ff-5126eed85e73');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'deyvi-sime') AND locale = 'es'), 'fc8cc217-f32d-47fc-95af-9d1fcc651718', 'artist', 'd8aefbcb-6b6e-46e4-95ac-560a59cf8229');

COMMIT;
