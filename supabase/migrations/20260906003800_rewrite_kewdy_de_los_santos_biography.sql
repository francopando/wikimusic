BEGIN;

-- Rewrite the catalogue entry for Kewdy de Los Santos.
--
-- Kewdy de Los Santos. Filler in English, nothing in Spanish, no date, no
-- place, no genres, and filed under merengue when he is a bachatero.
--
-- CORRECTED: primary_genre merengue -> bachata. His own Facebook page describes
-- him as "destacado en la bachata y merengue de cuerdas", every outlet that
-- writes about him calls him a bachatero, and the singles are bachatas. Merengue
-- moves into genres, where the merengue de cuerdas belongs.
--
-- FILLED: date_of_birth 19 September 1982 and birth_place Yamasá, province
-- Monte Plata. Two independent sources agree: a birthday post on the blog
-- Vainita con Tostones, 16 September 2012, which gives "19 de septiembre de
-- 1982 en el municipio Yamasa en la provincia de Monte Plata", and BuenaMusica,
-- whose Datos block gives the same day and year. BuenaMusica writes the town as
-- "Llamasa", which is Yamasá misspelled. One Instagram copy of the BuenaMusica
-- text says 1984; it is a copy with a typo, and the 2012 blog predates it.
--
-- ADDED: instruments guitar and requinto -- he accompanies himself and came up
-- as a requinto player -- occupations producer beside the composer already
-- stored, aliases, genres, disambiguation.
--
-- SOURCES: BuenaMusica for the career order, which is the only place it is
-- written down: guitar from early childhood in a family of musicians on both
-- sides, the chorus of several groups at thirteen, requinto in a group called
-- Francis at sixteen, then requinto and singing in Las Hembras de la Bachata a
-- year later; and for the albums Bachatas para él (2019), Todos sus éxitos and
-- Gato malo, and the label JR Music Latino Record. El Caribe and Teleradio
-- América, both 13 February 2024, on Te Duele. His own channel for the live
-- popurrís of Antony Santos and Raulín Rodríguez, for El Destino with Ydalia,
-- and for Como Yo Nadie Te Ha Amado. Facebook for the self-description.
--
-- NOT WRITTEN: view counts, which BuenaMusica quotes in the middle of its own
-- prose. Nothing about his household beyond the fact that the family played,
-- which is how he learned the instrument and is career, not private life.
--
-- NOT LINKED: Las Hembras de la Bachata, the group Francis and the singer
-- Ydalia have no entries. Porfi Guerrero, in whose chorus he is credited on one
-- video, has none either.
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
       name = 'Kewdy de Los Santos',
       sort_name = 'De Los Santos, Kewdy',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'bachata',
       date_of_birth = '1982-09-19',
       birth_year = 1982,
       date_of_death = NULL,
       birth_place = 'Yamasá',
       province = 'Monte Plata',
       first_name = 'Kewdy',
       middle_name = NULL,
       last_name = 'De Los Santos',
       second_last_name = NULL,
       stage_name = 'Kewdy de Los Santos',
       aliases = ARRAY['El Gato Malo']::text[],
       occupations = '["composer","producer"]'::jsonb,
       instruments = ARRAY['guitar', 'requinto']::text[],
       genres = ARRAY['merengue']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@Kewdyelgatomalo',
       facebook = 'kewdyelgatomalo',
       instagram = 'kewdyelgatomalo',
       disambiguation = 'Dominican bachata singer and requinto player from Yamasá, known as El Gato Malo',
       bio_en = 'Kewdy de Los Santos, who works as El Gato Malo, is a bachata singer from Yamasá, in Monte Plata. He accompanies himself on guitar and came up on the requinto, which is a different sort of career from the one a bachatero usually has.

**The requinto years**

He was playing guitar as a small child in a house where both sides of the family were musicians. At thirteen he was singing in the chorus of several groups; at sixteen he was playing requinto in a group called Francis; a year after that he was doing the same in Las Hembras de la Bachata, and singing as well.

That is the old apprenticeship: the requinto player stands behind the singer for years, learning the repertoire from inside the arrangement, and then one day steps forward. The lead lines he plays now come out of it.

**El Gato Malo**

The nickname became the act. Soldadito Marinero, El Gato Malo, Linda To’, Como Yo Nadie Te Ha Amado, Bram Bram, Vuelve Pa’ Tu Casa and El Celular are the songs people ask for, and they are almost all about love and betrayal, which is where bachata has always kept its business.

Bachatas Para Él came out in 2019, and Todos Sus Éxitos and Gato Malo followed. Te Duele, in 2024, went somewhere else: a bachata written as a social song rather than a romantic one.

**Playing the songbook**

A large part of what he does live is other people’s repertoire, sung whole. His medleys of Antony Santos and of Raulín Rodríguez are among the most watched things on his channel, and the tribute is not incidental — those are the two voices a bachatero of his generation grew up copying.

He tours, including long runs in Spain, and keeps releasing singles between the medleys.',
       bio_es = 'Kewdy de Los Santos, que trabaja como El Gato Malo, es un bachatero de Yamasá, en Monte Plata. Se acompaña con la guitarra y se formó en el requinto, que es otro tipo de carrera de la que suele tener un bachatero.

**Los años de requinto**

Tocaba guitarra desde muy pequeño en una casa donde los músicos venían por parte de padre y de madre. A los trece cantaba en el coro de varias agrupaciones; a los dieciséis tocaba requinto en un grupo llamado Francis; un año después hacía lo mismo en Las Hembras de la Bachata, y además cantaba.

Ese es el aprendizaje viejo: el requintista se para detrás del cantante durante años, se aprende el repertorio desde dentro del arreglo, y un día da el paso al frente. Las líneas que toca hoy salen de ahí.

**El Gato Malo**

El apodo se volvió el acto. Soldadito Marinero, El Gato Malo, Linda To’, Como Yo Nadie Te Ha Amado, Bram Bram, Vuelve Pa’ Tu Casa y El Celular son las canciones que le piden, y casi todas hablan de amor y de traición, que es donde la bachata siempre ha tenido su negocio.

Bachatas Para Él salió en 2019, y detrás vinieron Todos Sus Éxitos y Gato Malo. Te Duele, en 2024, fue por otro lado: una bachata escrita como canción social y no como canción de amor.

**Cantar el cancionero**

Buena parte de lo que hace en vivo es repertorio ajeno, cantado entero. Sus popurrís de Antony Santos y de Raulín Rodríguez están entre lo más visto de su canal, y el homenaje no es un detalle: esas son las dos voces que un bachatero de su generación se crió copiando.

Hace giras, incluidas temporadas largas en España, y entre popurrí y popurrí sigue sacando sencillos.',
       updated_at = now()
 WHERE slug = 'kewdy-de-los-santos';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kewdy-de-los-santos')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kewdy-de-los-santos')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Kewdy de Los Santos, who works as El Gato Malo, is a bachata singer from Yamasá, in Monte Plata. He accompanies himself on guitar and came up on the requinto, which is a different sort of career from the one a bachatero usually has.","type":"text"}]},{"type":"paragraph","content":[{"text":"The requinto years","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He was playing guitar as a small child in a house where both sides of the family were musicians. At thirteen he was singing in the chorus of several groups; at sixteen he was playing requinto in a group called Francis; a year after that he was doing the same in Las Hembras de la Bachata, and singing as well.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is the old apprenticeship: the requinto player stands behind the singer for years, learning the repertoire from inside the arrangement, and then one day steps forward. The lead lines he plays now come out of it.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Gato Malo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The nickname became the act. Soldadito Marinero, El Gato Malo, Linda To’, Como Yo Nadie Te Ha Amado, Bram Bram, Vuelve Pa’ Tu Casa and El Celular are the songs people ask for, and they are almost all about love and betrayal, which is where bachata has always kept its business.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bachatas Para Él came out in 2019, and Todos Sus Éxitos and Gato Malo followed. Te Duele, in 2024, went somewhere else: a bachata written as a social song rather than a romantic one.","type":"text"}]},{"type":"paragraph","content":[{"text":"Playing the songbook","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"A large part of what he does live is other people’s repertoire, sung whole. His medleys of ","type":"text"},{"type":"artistReference","attrs":{"artistId":"28a3745e-90d6-45cd-b8bd-798028f8deb8","displayText":"Antony Santos","occurrenceId":"8cbed08f-07f1-4264-9cf2-51bb0dde156c"}},{"text":" and of ","type":"text"},{"type":"artistReference","attrs":{"artistId":"96e69c00-dbb0-4cb4-ab48-ea46be9c4591","displayText":"Raulín Rodríguez","occurrenceId":"93b22d84-301f-412c-8ec0-e75b924a6d9a"}},{"text":" are among the most watched things on his channel, and the tribute is not incidental — those are the two voices a bachatero of his generation grew up copying.","type":"text"}]},{"type":"paragraph","content":[{"text":"He tours, including long runs in Spain, and keeps releasing singles between the medleys.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'kewdy-de-los-santos'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Kewdy de Los Santos, que trabaja como El Gato Malo, es un bachatero de Yamasá, en Monte Plata. Se acompaña con la guitarra y se formó en el requinto, que es otro tipo de carrera de la que suele tener un bachatero.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los años de requinto","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Tocaba guitarra desde muy pequeño en una casa donde los músicos venían por parte de padre y de madre. A los trece cantaba en el coro de varias agrupaciones; a los dieciséis tocaba requinto en un grupo llamado Francis; un año después hacía lo mismo en Las Hembras de la Bachata, y además cantaba.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ese es el aprendizaje viejo: el requintista se para detrás del cantante durante años, se aprende el repertorio desde dentro del arreglo, y un día da el paso al frente. Las líneas que toca hoy salen de ahí.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Gato Malo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El apodo se volvió el acto. Soldadito Marinero, El Gato Malo, Linda To’, Como Yo Nadie Te Ha Amado, Bram Bram, Vuelve Pa’ Tu Casa y El Celular son las canciones que le piden, y casi todas hablan de amor y de traición, que es donde la bachata siempre ha tenido su negocio.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bachatas Para Él salió en 2019, y detrás vinieron Todos Sus Éxitos y Gato Malo. Te Duele, en 2024, fue por otro lado: una bachata escrita como canción social y no como canción de amor.","type":"text"}]},{"type":"paragraph","content":[{"text":"Cantar el cancionero","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Buena parte de lo que hace en vivo es repertorio ajeno, cantado entero. Sus popurrís de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"28a3745e-90d6-45cd-b8bd-798028f8deb8","displayText":"Antony Santos","occurrenceId":"fa40b25f-0cc6-47d6-8ae6-38b4db14c5a0"}},{"text":" y de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"96e69c00-dbb0-4cb4-ab48-ea46be9c4591","displayText":"Raulín Rodríguez","occurrenceId":"d7ad8abf-aabb-4dd9-9485-dea34f9cf155"}},{"text":" están entre lo más visto de su canal, y el homenaje no es un detalle: esas son las dos voces que un bachatero de su generación se crió copiando.","type":"text"}]},{"type":"paragraph","content":[{"text":"Hace giras, incluidas temporadas largas en España, y entre popurrí y popurrí sigue sacando sencillos.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'kewdy-de-los-santos'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kewdy-de-los-santos') AND locale = 'en'), '8cbed08f-07f1-4264-9cf2-51bb0dde156c', 'artist', '28a3745e-90d6-45cd-b8bd-798028f8deb8');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kewdy-de-los-santos') AND locale = 'en'), '93b22d84-301f-412c-8ec0-e75b924a6d9a', 'artist', '96e69c00-dbb0-4cb4-ab48-ea46be9c4591');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kewdy-de-los-santos') AND locale = 'es'), 'd7ad8abf-aabb-4dd9-9485-dea34f9cf155', 'artist', '96e69c00-dbb0-4cb4-ab48-ea46be9c4591');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kewdy-de-los-santos') AND locale = 'es'), 'fa40b25f-0cc6-47d6-8ae6-38b4db14c5a0', 'artist', '28a3745e-90d6-45cd-b8bd-798028f8deb8');

COMMIT;
