BEGIN;

-- Rewrite the catalogue entry for Soul of Death.
--
-- Soul of Death. Filler in English, nothing in Spanish, and filed as a solo
-- artist with a singer's role. They are a band.
--
-- TYPE CORRECTED from solo_artist to group.
-- primary_role changed from singer to musician.
--
-- SOURCES: their Encyclopaedia Metallum entry -- Santo Domingo, Distrito
-- Nacional; formed 2004; melodic death metal; themes of occultism early and of
-- ancestral war, apocalyptic prophecies and mythology later; label Nefast Films
-- Records; active 2004-2015 and again since 2020 -- and its discography: the
-- 2006 EP "Apocalipsis", the 2020 single "Spiritual Disease" and the 2023
-- full-length of the same name. Their Bandcamp, which names the founder as the
-- guitarist "Focalor" Melvin Holguin and dates the band to the beginning of
-- August 2004. MetalSucks, 29 November 2022, "International Mosh: 15 Bands from
-- the Dominican Republic", for their place in that scene, for the statement
-- they posted on returning, and for Ruben Mahfoud playing in Mucaro. Metal
-- Forces Magazine's review of "Spiritual Disease".
--
-- FLAGGED: the genre. There is no metal in the taxonomy, so this uses rock.
-- FLAGGED: status. Left at needs_review; no image on the row.
--
-- NOTE FOR THE METAL ENTRIES GENERALLY: that MetalSucks piece is the single
-- best English-language survey of this scene and covers fifteen bands,
-- including Necro, which is already in the catalogue. It adds a fact that
-- entry does not have -- Necro's bassist Ariel Nux went on to the industrial
-- band Nux -- and is worth mining for the rest.
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
       name = 'Soul of Death',
       sort_name = 'Soul of Death',
       type = 'group',
       status = 'needs_review',
       gender = NULL,
       ended = FALSE,
       primary_role = 'musician',
       primary_genre = 'rock',
       date_of_birth = NULL,
       birth_year = 2004,
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
       website = 'https://soulofdeathrd.bandcamp.com',
       youtube = NULL,
       facebook = 'soulofdeath6',
       instagram = 'soulofdeath_rd',
       disambiguation = 'Dominican melodic death metal band formed in Santo Domingo in 2004',
       bio_en = 'Soul of Death are a Dominican melodic death metal band from Santo Domingo. The guitarist Melvin Holguín, who works as Focalor, started them at the beginning of August 2004.

**Two lives**

They worked until 2015 and then stopped, and came back in 2020. On returning they posted that they were not vanquished and not beaten, that they had been through some turmoil and were rising again with the same strength and the same brotherhood.

That is a fair description of what running a metal band in the Dominican Republic costs. There is no circuit to sustain one — no label money, no radio, no festival that pays — so a five-year silence is the ordinary shape of a career rather than a failure of one.

**Apocalipsis and Spiritual Disease**

The EP Apocalipsis came in 2006. Spiritual Disease arrived first as a single in 2020, marking the return, and then as a full album in February 2023 on Nefast Films Records. Metal Forces Magazine reviewed it.

The subject matter moved as the band did. The early records were occult; the later ones deal in ancestral war, apocalyptic prophecy and mythology, which is a turn from shock toward something closer to history.

**The scene around them**

Dominican metal is small enough that its musicians hold several bands at once. Rubén Mahfoud plays in Múcaro alongside a former Abaddon RD drummer, and Focalor built the one-man project Sífilis de Nazareth in 2015.

The foreign metal press has begun to notice. MetalSucks put them among fifteen bands worth hearing from the country in 2022, which for a scene that has never had a domestic industry is how recognition arrives at all.',
       bio_es = 'Soul of Death es una banda dominicana de death metal melódico de Santo Domingo. La armó el guitarrista Melvin Holguín, que trabaja como Focalor, a principios de agosto de 2004.

**Dos vidas**

Trabajaron hasta 2015 y pararon, y volvieron en 2020. Al regresar publicaron que no estaban vencidos ni derrotados, que habían pasado por una turbulencia y estaban levantándose otra vez con la misma fuerza y la misma hermandad.

Ésa es una descripción justa de lo que cuesta sostener una banda de metal en la República Dominicana. No hay circuito que la mantenga —ni dinero de sello, ni radio, ni festival que pague—, así que cinco años de silencio son la forma corriente de una carrera y no el fracaso de una.

**Apocalipsis y Spiritual Disease**

El EP Apocalipsis salió en 2006. Spiritual Disease llegó primero como sencillo en 2020, marcando el regreso, y después como álbum completo en febrero de 2023 por Nefast Films Records. Metal Forces Magazine lo reseñó.

Los temas se movieron con la banda. Los discos tempranos eran ocultistas; los últimos tratan de guerra ancestral, profecía apocalíptica y mitología, que es un giro del susto hacia algo más cercano a la historia.

**La escena alrededor**

El metal dominicano es lo bastante pequeño como para que sus músicos sostengan varias bandas a la vez. Rubén Mahfoud toca en Múcaro junto a un exbaterista de Abaddon RD, y Focalor levantó en 2015 el proyecto de un solo hombre Sífilis de Nazareth.

La prensa extranjera de metal ha empezado a notarlos. MetalSucks los puso entre quince bandas del país que vale la pena oír en 2022, que para una escena que nunca ha tenido industria propia es la manera en que llega cualquier reconocimiento.',
       updated_at = now()
 WHERE slug = 'soul-of-death';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'soul-of-death')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'soul-of-death')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Soul of Death are a Dominican melodic death metal band from Santo Domingo. The guitarist Melvin Holguín, who works as Focalor, started them at the beginning of August 2004.","type":"text"}]},{"type":"paragraph","content":[{"text":"Two lives","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"They worked until 2015 and then stopped, and came back in 2020. On returning they posted that they were not vanquished and not beaten, that they had been through some turmoil and were rising again with the same strength and the same brotherhood.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is a fair description of what running a metal band in the Dominican Republic costs. There is no circuit to sustain one — no label money, no radio, no festival that pays — so a five-year silence is the ordinary shape of a career rather than a failure of one.","type":"text"}]},{"type":"paragraph","content":[{"text":"Apocalipsis and Spiritual Disease","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The EP Apocalipsis came in 2006. Spiritual Disease arrived first as a single in 2020, marking the return, and then as a full album in February 2023 on Nefast Films Records. Metal Forces Magazine reviewed it.","type":"text"}]},{"type":"paragraph","content":[{"text":"The subject matter moved as the band did. The early records were occult; the later ones deal in ancestral war, apocalyptic prophecy and mythology, which is a turn from shock toward something closer to history.","type":"text"}]},{"type":"paragraph","content":[{"text":"The scene around them","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dominican metal is small enough that its musicians hold several bands at once. Rubén Mahfoud plays in Múcaro alongside a former Abaddon RD drummer, and Focalor built the one-man project Sífilis de Nazareth in 2015.","type":"text"}]},{"type":"paragraph","content":[{"text":"The foreign metal press has begun to notice. MetalSucks put them among fifteen bands worth hearing from the country in 2022, which for a scene that has never had a domestic industry is how recognition arrives at all.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'soul-of-death'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Soul of Death es una banda dominicana de death metal melódico de Santo Domingo. La armó el guitarrista Melvin Holguín, que trabaja como Focalor, a principios de agosto de 2004.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dos vidas","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Trabajaron hasta 2015 y pararon, y volvieron en 2020. Al regresar publicaron que no estaban vencidos ni derrotados, que habían pasado por una turbulencia y estaban levantándose otra vez con la misma fuerza y la misma hermandad.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ésa es una descripción justa de lo que cuesta sostener una banda de metal en la República Dominicana. No hay circuito que la mantenga —ni dinero de sello, ni radio, ni festival que pague—, así que cinco años de silencio son la forma corriente de una carrera y no el fracaso de una.","type":"text"}]},{"type":"paragraph","content":[{"text":"Apocalipsis y Spiritual Disease","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El EP Apocalipsis salió en 2006. Spiritual Disease llegó primero como sencillo en 2020, marcando el regreso, y después como álbum completo en febrero de 2023 por Nefast Films Records. Metal Forces Magazine lo reseñó.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los temas se movieron con la banda. Los discos tempranos eran ocultistas; los últimos tratan de guerra ancestral, profecía apocalíptica y mitología, que es un giro del susto hacia algo más cercano a la historia.","type":"text"}]},{"type":"paragraph","content":[{"text":"La escena alrededor","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El metal dominicano es lo bastante pequeño como para que sus músicos sostengan varias bandas a la vez. Rubén Mahfoud toca en Múcaro junto a un exbaterista de Abaddon RD, y Focalor levantó en 2015 el proyecto de un solo hombre Sífilis de Nazareth.","type":"text"}]},{"type":"paragraph","content":[{"text":"La prensa extranjera de metal ha empezado a notarlos. MetalSucks los puso entre quince bandas del país que vale la pena oír en 2022, que para una escena que nunca ha tenido industria propia es la manera en que llega cualquier reconocimiento.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'soul-of-death'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
