BEGIN;

-- Rewrite the catalogue entry for Santana.
--
-- Santana. A 133-character filler biography in English, nothing in Spanish, no
-- genre, no gender, no dates -- and a birthplace belonging to somebody else.
--
-- BIRTHPLACE CORRECTED. The row read "Autlan de Navarro" with the Born Abroad
-- sentinel. Autlan de Navarro is Carlos Santana's home town, in Jalisco. This
-- is name contamination of exactly the kind BuenaMusica produced when it
-- resolved "Santana" to Carlos Santana and "Pablo Martinez" to an Argentine.
-- The artist here is Dominican, and his own account gives Santo Domingo Este.
--
-- SOURCES: his own YouTube channel, Santana_MC, whose description gives the
-- legal name Rayniel Santana, the birth on 1 August 2005 in Santo Domingo Este
-- where he has spent most of his life, that both his parents are Dominican,
-- that he began the project in 2018 with a first single called "Junto a Ti", a
-- dancehall produced by Remi Abreu, known as Remi Produce, and the recent "Dos
-- Extranos" with Emely Rosario. His MusicBrainz record, which carries "Rayniel
-- Santana" as the legal-name alias and the accounts it was matched on. His
-- Facebook, rayniel0801, which the MusicBrainz record and the row share.
--
-- UPDATED: youtube. The channel id stored on the row no longer exists; the live
-- channel is Santana_MC.
-- CLEARED: instagram. santana_oficial.rd no longer resolves.
-- FLAGGED: the genre. His first record was dancehall and the recent ones are
-- romantic urban; the taxonomy has no dancehall, so this uses urbano.
-- FLAGGED: status. Left at needs_review; there is no image on the row.
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
       name = 'Santana',
       sort_name = 'Santana, Rayniel',
       type = 'solo_artist',
       status = 'needs_review',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urbano',
       date_of_birth = '2005-08-01',
       birth_year = 2005,
       date_of_death = NULL,
       birth_place = 'Santo Domingo Este',
       province = 'Santo Domingo',
       first_name = 'Rayniel',
       middle_name = NULL,
       last_name = 'Santana',
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY['Rayniel Santana', 'Santana Official']::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY['voice']::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular', 'emerging']::text[],
       website = NULL,
       youtube = '@Santana_MC',
       facebook = 'rayniel0801',
       instagram = NULL,
       disambiguation = 'Dominican urban singer born 2005 in Santo Domingo Este; not the Mexican guitarist',
       bio_en = 'Santana — Rayniel Santana, born on 1 August 2005 — is a Dominican urban singer from Santo Domingo Este, where he has spent most of his life. Both his parents are Dominican.

**Starting at thirteen**

He began the project in 2018 and recorded his first single, Junto a Ti, a dancehall produced by Remi Abreu, who works as Remi Produce. He was thirteen years old.

Dancehall is a Jamaican form rather than a Dominican one, and a Dominican teenager reaching for it instead of dembow is choosing the harder audience. The music of the eastern Caribbean has always crossed into Santo Domingo, but it has rarely been where a young artist starts.

**The records since**

He has moved toward romantic urban material. Dos Extraños, made with Emely Rosario, is a song about two people who once meant everything to each other and now share only the memory.

He is at the stage where a career is a channel, a handful of singles and whatever an audience decides. Nothing about him has been written down anywhere else.',
       bio_es = 'Santana —Rayniel Santana, nacido el 1 de agosto de 2005— es un cantante urbano dominicano de Santo Domingo Este, donde ha pasado la mayor parte de su vida. Sus dos padres son dominicanos.

**Empezar a los trece**

Arrancó el proyecto en 2018 y grabó su primer sencillo, Junto a Ti, un dancehall producido por Remi Abreu, que trabaja como Remi Produce. Tenía trece años.

El dancehall es una forma jamaicana y no dominicana, y un adolescente dominicano que va por ahí en vez de ir al dembow está escogiendo el público más difícil. La música del Caribe oriental siempre ha cruzado hacia Santo Domingo, pero pocas veces ha sido el punto de partida de un artista joven.

**Los discos que vinieron**

Se ha ido moviendo hacia el material urbano romántico. Dos Extraños, hecha con Emely Rosario, es una canción sobre dos personas que alguna vez lo fueron todo y hoy solo comparten el recuerdo.

Está en la etapa en que una carrera es un canal, un puñado de sencillos y lo que decida un público. De él no se ha escrito nada en ninguna otra parte.',
       updated_at = now()
 WHERE slug = 'santana';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'santana')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'santana')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Santana — Rayniel Santana, born on 1 August 2005 — is a Dominican urban singer from Santo Domingo Este, where he has spent most of his life. Both his parents are Dominican.","type":"text"}]},{"type":"paragraph","content":[{"text":"Starting at thirteen","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He began the project in 2018 and recorded his first single, Junto a Ti, a dancehall produced by Remi Abreu, who works as Remi Produce. He was thirteen years old.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dancehall is a Jamaican form rather than a Dominican one, and a Dominican teenager reaching for it instead of dembow is choosing the harder audience. The music of the eastern Caribbean has always crossed into Santo Domingo, but it has rarely been where a young artist starts.","type":"text"}]},{"type":"paragraph","content":[{"text":"The records since","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He has moved toward romantic urban material. Dos Extraños, made with Emely Rosario, is a song about two people who once meant everything to each other and now share only the memory.","type":"text"}]},{"type":"paragraph","content":[{"text":"He is at the stage where a career is a channel, a handful of singles and whatever an audience decides. Nothing about him has been written down anywhere else.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'santana'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Santana —Rayniel Santana, nacido el 1 de agosto de 2005— es un cantante urbano dominicano de Santo Domingo Este, donde ha pasado la mayor parte de su vida. Sus dos padres son dominicanos.","type":"text"}]},{"type":"paragraph","content":[{"text":"Empezar a los trece","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Arrancó el proyecto en 2018 y grabó su primer sencillo, Junto a Ti, un dancehall producido por Remi Abreu, que trabaja como Remi Produce. Tenía trece años.","type":"text"}]},{"type":"paragraph","content":[{"text":"El dancehall es una forma jamaicana y no dominicana, y un adolescente dominicano que va por ahí en vez de ir al dembow está escogiendo el público más difícil. La música del Caribe oriental siempre ha cruzado hacia Santo Domingo, pero pocas veces ha sido el punto de partida de un artista joven.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los discos que vinieron","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Se ha ido moviendo hacia el material urbano romántico. Dos Extraños, hecha con Emely Rosario, es una canción sobre dos personas que alguna vez lo fueron todo y hoy solo comparten el recuerdo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Está en la etapa en que una carrera es un canal, un puñado de sencillos y lo que decida un público. De él no se ha escrito nada en ninguna otra parte.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'santana'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
