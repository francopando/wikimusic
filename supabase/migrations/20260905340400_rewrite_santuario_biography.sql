BEGIN;

-- Rewrite the catalogue entry for Santuario.
--
-- Santuario. Filler in English, nothing in Spanish, no genre, and filed as a
-- solo artist with a singer's role. They are a band, and have been since 1999.
--
-- TYPE CORRECTED from solo_artist to group.
-- primary_role changed from singer to musician; GENRE SET to rock.
--
-- SOURCES: their own Spotify biography, which dates the band to 1999 and
-- credits its impact on the Dominican rock scene to the energy of its live
-- shows. Spirit of Metal's line-up: Jehison Tavarez on voice and guitar, Robin
-- Valdez on guitar, Omar Nunez on bass, Juan Carlos "Kanky" Lora on drums.
-- Cartel Rock, Radio Amiga Internacional and Radio Violeta, May 2024, all
-- describing the current pair as Kanky Lora and Jehison Tavarez. En El Lente
-- TV, 13 May 2024, for the rock version of "El Costo de la Vida" and for the
-- track list. Discogs for "Porque No Estoy Muerto Hoy", released in the
-- Dominican Republic in 2008. Hoy, 19 August 2008, on the launch concert shared
-- with Voces en el Plasma and Tears for Veronica. Their own Instagram for the
-- full house at the Auditorio del Dominico Americano and for the hashtag they
-- use for themselves.
--
-- NOT CONFUSED WITH: the Brazilian Santuario, a short-lived heavy metal group,
-- or Santuario Producciones, a Christian metal label. Neither is this band.
-- FLAGGED: the genre. There is no metal in the taxonomy, so this uses rock,
-- which is also what the Dominican press calls them.
-- FLAGGED: status. Left at draft; there is no image on the row.
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
       name = 'Santuario',
       sort_name = 'Santuario',
       type = 'group',
       status = 'draft',
       gender = NULL,
       ended = FALSE,
       primary_role = 'musician',
       primary_genre = 'rock',
       date_of_birth = NULL,
       birth_year = 1999,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY[]::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = 'santuario_rd',
       disambiguation = 'Dominican heavy rock band formed in Santo Domingo in 1999',
       bio_en = 'Santuario are a Dominican heavy rock band, formed in Santo Domingo in 1999. Juan Carlos “Kanky” Lora on drums and Jehison Tavárez on voice and guitar have carried it through, with Robin Valdéz on guitar and Omar Núñez on bass.

**A quarter of a century**

What they built their name on was the live show. Dominican rock has never had an industry behind it — no label, no radio format, no festival circuit worth the name — so a band survives on whether people turn up, and they have been turning up for twenty-five years.

The band describes its own music as heavy metal from dembow city, which is the whole situation in four words. They work in a country whose musical identity is merengue, bachata and now dembow, and they have never made any of them.

**Porque No Estoy Muerto Hoy**

The album came out in 2008 and they launched it with a full house at the Auditorio del Domínico-Americano, sharing the night with Voces en el Plasma and Tears for Veronica.

Asesino, Policía Estúpido, El Viaje (Cabeza de Motor), Si Yo and the title track make up the record. In 2022 they went back and cut Brutalismo, Aquí No Es, O.B.L. and Todavía Sigo de Pie again, each marked as a twenty-year version — a band re-recording its own beginnings once the beginnings are old enough to count.

**El Costo de la Vida**

In May 2024 they released a rock version of El Costo de la Vida, the song Juan Luis Guerra 4.40 made a hit in 1992.

It is a sharper choice than a cover usually is. The original is a merengue about the price of everything rising while wages do not, sung by the most internationally celebrated Dominican there has ever been. Played as heavy rock by a band from the same city thirty years later, the complaint has not dated, and neither has the country it describes.',
       bio_es = 'Santuario es una banda de rock pesado dominicana, formada en Santo Domingo en 1999. Juan Carlos «Kanky» Lora en la batería y Jehison Tavárez en la voz y la guitarra la han sostenido, con Robin Valdéz en la guitarra y Omar Núñez en el bajo.

**Un cuarto de siglo**

Se hicieron el nombre en la tarima. El rock dominicano nunca ha tenido una industria detrás —ni sello, ni formato de radio, ni un circuito de festivales que merezca el nombre—, así que una banda sobrevive según si la gente aparece, y llevan veinticinco años apareciendo.

La banda describe su propia música como heavy metal de la ciudad del dembow, que resume la situación entera. Trabajan en un país cuya identidad musical es el merengue, la bachata y ahora el dembow, y nunca han hecho ninguna de las tres.

**Porque No Estoy Muerto Hoy**

El disco salió en 2008 y lo lanzaron a casa llena en el Auditorio del Domínico-Americano, compartiendo la noche con Voces en el Plasma y Tears for Veronica.

Asesino, Policía Estúpido, El Viaje (Cabeza de Motor), Si Yo y el tema que da título completan el disco. En 2022 volvieron a grabar Brutalismo, Aquí No Es, O.B.L. y Todavía Sigo de Pie, cada una marcada como versión de veinte años: una banda regrabando sus propios comienzos cuando los comienzos ya tienen edad suficiente.

**El Costo de la Vida**

En mayo de 2024 sacaron una versión rock de El Costo de la Vida, la canción que Juan Luis Guerra 4.40 convirtió en éxito en 1992.

Es una elección más filosa de lo que suele ser una versión. El original es un merengue sobre que todo sube menos el sueldo, cantado por el dominicano más celebrado internacionalmente que ha habido. Tocado como rock pesado por una banda de la misma ciudad treinta años después, el reclamo no ha envejecido, y el país que describe tampoco.',
       updated_at = now()
 WHERE slug = 'santuario';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'santuario')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'santuario')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Santuario are a Dominican heavy rock band, formed in Santo Domingo in 1999. Juan Carlos “Kanky” Lora on drums and Jehison Tavárez on voice and guitar have carried it through, with Robin Valdéz on guitar and Omar Núñez on bass.","type":"text"}]},{"type":"paragraph","content":[{"text":"A quarter of a century","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"What they built their name on was the live show. Dominican rock has never had an industry behind it — no label, no radio format, no festival circuit worth the name — so a band survives on whether people turn up, and they have been turning up for twenty-five years.","type":"text"}]},{"type":"paragraph","content":[{"text":"The band describes its own music as heavy metal from dembow city, which is the whole situation in four words. They work in a country whose musical identity is merengue, bachata and now dembow, and they have never made any of them.","type":"text"}]},{"type":"paragraph","content":[{"text":"Porque No Estoy Muerto Hoy","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The album came out in 2008 and they launched it with a full house at the Auditorio del Domínico-Americano, sharing the night with Voces en el Plasma and Tears for Veronica.","type":"text"}]},{"type":"paragraph","content":[{"text":"Asesino, Policía Estúpido, El Viaje (Cabeza de Motor), Si Yo and the title track make up the record. In 2022 they went back and cut Brutalismo, Aquí No Es, O.B.L. and Todavía Sigo de Pie again, each marked as a twenty-year version — a band re-recording its own beginnings once the beginnings are old enough to count.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Costo de la Vida","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In May 2024 they released a rock version of El Costo de la Vida, the song ","type":"text"},{"type":"artistReference","attrs":{"artistId":"10034596-47cb-46ba-9e80-9ea319a2c0df","displayText":"Juan Luis Guerra 4.40","occurrenceId":"b25573ff-cf41-4ff9-a76a-cd11a219dcc8"}},{"text":" made a hit in 1992.","type":"text"}]},{"type":"paragraph","content":[{"text":"It is a sharper choice than a cover usually is. The original is a merengue about the price of everything rising while wages do not, sung by the most internationally celebrated Dominican there has ever been. Played as heavy rock by a band from the same city thirty years later, the complaint has not dated, and neither has the country it describes.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'santuario'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Santuario es una banda de rock pesado dominicana, formada en Santo Domingo en 1999. Juan Carlos «Kanky» Lora en la batería y Jehison Tavárez en la voz y la guitarra la han sostenido, con Robin Valdéz en la guitarra y Omar Núñez en el bajo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Un cuarto de siglo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Se hicieron el nombre en la tarima. El rock dominicano nunca ha tenido una industria detrás —ni sello, ni formato de radio, ni un circuito de festivales que merezca el nombre—, así que una banda sobrevive según si la gente aparece, y llevan veinticinco años apareciendo.","type":"text"}]},{"type":"paragraph","content":[{"text":"La banda describe su propia música como heavy metal de la ciudad del dembow, que resume la situación entera. Trabajan en un país cuya identidad musical es el merengue, la bachata y ahora el dembow, y nunca han hecho ninguna de las tres.","type":"text"}]},{"type":"paragraph","content":[{"text":"Porque No Estoy Muerto Hoy","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El disco salió en 2008 y lo lanzaron a casa llena en el Auditorio del Domínico-Americano, compartiendo la noche con Voces en el Plasma y Tears for Veronica.","type":"text"}]},{"type":"paragraph","content":[{"text":"Asesino, Policía Estúpido, El Viaje (Cabeza de Motor), Si Yo y el tema que da título completan el disco. En 2022 volvieron a grabar Brutalismo, Aquí No Es, O.B.L. y Todavía Sigo de Pie, cada una marcada como versión de veinte años: una banda regrabando sus propios comienzos cuando los comienzos ya tienen edad suficiente.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Costo de la Vida","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En mayo de 2024 sacaron una versión rock de El Costo de la Vida, la canción que ","type":"text"},{"type":"artistReference","attrs":{"artistId":"10034596-47cb-46ba-9e80-9ea319a2c0df","displayText":"Juan Luis Guerra 4.40","occurrenceId":"02bb4660-406d-4b5d-bca5-9e55ad71ba82"}},{"text":" convirtió en éxito en 1992.","type":"text"}]},{"type":"paragraph","content":[{"text":"Es una elección más filosa de lo que suele ser una versión. El original es un merengue sobre que todo sube menos el sueldo, cantado por el dominicano más celebrado internacionalmente que ha habido. Tocado como rock pesado por una banda de la misma ciudad treinta años después, el reclamo no ha envejecido, y el país que describe tampoco.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'santuario'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'santuario') AND locale = 'en'), 'b25573ff-cf41-4ff9-a76a-cd11a219dcc8', 'artist', '10034596-47cb-46ba-9e80-9ea319a2c0df');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'santuario') AND locale = 'es'), '02bb4660-406d-4b5d-bca5-9e55ad71ba82', 'artist', '10034596-47cb-46ba-9e80-9ea319a2c0df');

COMMIT;
