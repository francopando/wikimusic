BEGIN;

-- Rewrite the catalogue entry for La Pajarita La Paul.
--
-- La Pajarita La Paul. Filler in English, nothing in Spanish, no real name, no
-- dates -- for one of the most-watched Dominican urban artists on the internet.
--
-- SOURCES: her own YouTube channel for the singles and their videos, all
-- directed by Fernando Films -- "Pa Que Me De Con El Bate" and "Platano Maduro"
-- in 2018, "Mi Marido", and "Calembo", first in 2021 and again in 2025. Apple
-- Music and Spotify for the release dates. Teleuniverso, which reported the
-- Mexican tour. Interviews on Alofoke and on Buena Noche TV with Nelson Javier
-- "El Cocodrilo". A December 2024 podcast episode on her beginnings and her ups
-- and downs. Instagram listings placing her in the Dominican alternative scene
-- alongside La Napa and Quimico Ultra Mega.
--
-- NOT WRITTEN, DELIBERATELY: her sexual orientation. It is the single most
-- reported thing about her in the Dominican press and it is not a musical fact.
-- The standing rule for this catalogue excludes it, as it did for La Fiera
-- Tipica.
-- NOT WRITTEN: view and subscriber counts, under the same standing rule.
-- NOT WRITTEN: a legal name. Her Instagram display name reads Emely, which is
-- not enough to record as one.
--
-- The row's gender, "other", was already there and is left as it stands; it is
-- prior editorial research, not something to revisit from a search result.
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
       name = 'La Pajarita La Paul',
       sort_name = 'Pajarita La Paul, La',
       type = 'solo_artist',
       status = 'published',
       gender = 'other',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urbano',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = NULL,
       province = 'No Province',
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = 'La Pajarita La Paul',
       aliases = ARRAY[]::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY['voice']::text[],
       genres = ARRAY['urban-dembow']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@LaPajaritaLaPaul',
       facebook = '100067738762891',
       instagram = 'la_pajaritapaul_oficial',
       disambiguation = 'Dominican urban artist; “Pa Que Me Dé Con El Bate” and “Plátano Maduro”',
       bio_en = 'La Pajarita La Paul is a Dominican urban artist who built an audience online rather than through the industry.

**The songs**

Pa Que Me Dé Con El Bate and Plátano Maduro both came in 2018 and are the records people quote. Mi Marido followed, and Calembo arrived in 2021 and was cut again in 2025. Fernando Films directed the videos.

The titles are the method. They are jokes that carry, built to be repeated before they are listened to, and that is a real craft in a genre where a phrase either travels in a week or does not travel at all.

**Outside the machine**

She belongs to the Dominican alternative scene rather than the dembow mainstream, working the same ground as La Ñapa and Químico Ultra Mega — artists whose audiences were assembled on video platforms without a label deciding anything.

The reach carried her out of the country: she toured to Mexico off the strength of a single track, which almost no Dominican artist at that stage of a career manages.

The Dominican television and podcast circuit has interviewed her repeatedly, on Alofoke and on Buena Noche TV among others, and those conversations are most of what exists in the way of a record.',
       bio_es = 'La Pajarita La Paul es una artista urbana dominicana que se construyó un público en internet y no a través de la industria.

**Las canciones**

Pa Que Me Dé Con El Bate y Plátano Maduro salieron las dos en 2018 y son los discos que la gente cita. Después vino Mi Marido, y Calembo llegó en 2021 y se volvió a grabar en 2025. Fernando Films dirigió los videos.

Los títulos son el método. Son chistes que aguantan, hechos para repetirse antes de escucharse, y eso es un oficio de verdad en un género donde una frase o viaja en una semana o no viaja nunca.

**Fuera de la máquina**

Pertenece a la escena alternativa dominicana y no a la corriente principal del dembow, trabajando el mismo terreno que La Ñapa y Químico Ultra Mega: artistas cuyos públicos se armaron en plataformas de video sin que ningún sello decidiera nada.

El alcance la sacó del país: salió de gira a México por la fuerza de un solo tema, algo que casi ningún artista dominicano logra en esa etapa de una carrera.

El circuito dominicano de televisión y de pódcast la ha entrevistado una y otra vez, en Alofoke y en Buena Noche TV entre otros, y esas conversaciones son casi todo lo que existe a modo de registro.',
       updated_at = now()
 WHERE slug = 'la-pajarita-la-paul';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'la-pajarita-la-paul')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'la-pajarita-la-paul')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"La Pajarita La Paul is a Dominican urban artist who built an audience online rather than through the industry.","type":"text"}]},{"type":"paragraph","content":[{"text":"The songs","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Pa Que Me Dé Con El Bate and Plátano Maduro both came in 2018 and are the records people quote. Mi Marido followed, and Calembo arrived in 2021 and was cut again in 2025. Fernando Films directed the videos.","type":"text"}]},{"type":"paragraph","content":[{"text":"The titles are the method. They are jokes that carry, built to be repeated before they are listened to, and that is a real craft in a genre where a phrase either travels in a week or does not travel at all.","type":"text"}]},{"type":"paragraph","content":[{"text":"Outside the machine","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"She belongs to the Dominican alternative scene rather than the dembow mainstream, working the same ground as La Ñapa and Químico Ultra Mega — artists whose audiences were assembled on video platforms without a label deciding anything.","type":"text"}]},{"type":"paragraph","content":[{"text":"The reach carried her out of the country: she toured to Mexico off the strength of a single track, which almost no Dominican artist at that stage of a career manages.","type":"text"}]},{"type":"paragraph","content":[{"text":"The Dominican television and podcast circuit has interviewed her repeatedly, on Alofoke and on Buena Noche TV among others, and those conversations are most of what exists in the way of a record.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'la-pajarita-la-paul'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"La Pajarita La Paul es una artista urbana dominicana que se construyó un público en internet y no a través de la industria.","type":"text"}]},{"type":"paragraph","content":[{"text":"Las canciones","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Pa Que Me Dé Con El Bate y Plátano Maduro salieron las dos en 2018 y son los discos que la gente cita. Después vino Mi Marido, y Calembo llegó en 2021 y se volvió a grabar en 2025. Fernando Films dirigió los videos.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los títulos son el método. Son chistes que aguantan, hechos para repetirse antes de escucharse, y eso es un oficio de verdad en un género donde una frase o viaja en una semana o no viaja nunca.","type":"text"}]},{"type":"paragraph","content":[{"text":"Fuera de la máquina","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Pertenece a la escena alternativa dominicana y no a la corriente principal del dembow, trabajando el mismo terreno que La Ñapa y Químico Ultra Mega: artistas cuyos públicos se armaron en plataformas de video sin que ningún sello decidiera nada.","type":"text"}]},{"type":"paragraph","content":[{"text":"El alcance la sacó del país: salió de gira a México por la fuerza de un solo tema, algo que casi ningún artista dominicano logra en esa etapa de una carrera.","type":"text"}]},{"type":"paragraph","content":[{"text":"El circuito dominicano de televisión y de pódcast la ha entrevistado una y otra vez, en Alofoke y en Buena Noche TV entre otros, y esas conversaciones son casi todo lo que existe a modo de registro.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'la-pajarita-la-paul'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
