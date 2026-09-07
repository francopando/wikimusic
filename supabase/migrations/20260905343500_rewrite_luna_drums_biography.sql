BEGIN;

-- Rewrite the catalogue entry for Luna Drums.
--
-- Luna Drums. Filler in English, nothing in Spanish -- and two fields that were
-- simply wrong. The record said male, and it said urbano.
--
-- CORRECTED: gender male -> female. MusicBrainz records her gender as female
-- and describes her in Spanish as "baterista femenina en Grunjeo, banda de
-- grunge alternativo de Republica Dominicana"; the band itself billed her as
-- the only woman on drums in Dominican rock and made that the point of a video.
--
-- CORRECTED: primary_genre urbano -> rock. She plays drums in a grunge and
-- alternative rock band. Nothing connects her to urbano.
--
-- CORRECTED: occupations musician/producer -> drummer, and instruments filled
-- in with drums. No source calls her a producer. Cleared province "No
-- Province" to NULL, which means the same thing and is what the admin form
-- produces; its dropdown offers only "Born Abroad" and the thirty-two provinces.
--
-- NOT WRITTEN, and flagged: MusicBrainz gives her life-span as beginning in
-- 2007, which would make her seventeen when Grunjeo started. Nothing else
-- carries a birth year, and a single unconfirmed source is not enough to put a
-- date of birth on a public profile for someone this young. Confirm it before
-- adding it.
--
-- SOURCES: MusicBrainz, for gender, for the disambiguation quoted above, and
-- for her membership of Grunjeo, which it dates as ending on 12 June 2026.
-- Grunjeo's own biography page: "Luna Drums -- bateria. Luna Drums se incorporo
-- a la banda aportando una base ritmica solida", alongside Korven Brox on voice
-- and guitar and Toqita on guitar, bass and backing vocals, and an unnamed
-- first drummer who held the seat between 2024 and 2025. The band's Instagram
-- bio, which names her handle beside Korven's and dates the project 2024-2026.
-- Radio Bizarro's interview with Korven, Luna and Toqita. Korven Brox's TikTok,
-- "la unica banda de RD con baterista mujer".
--
-- NOT LINKED: Grunjeo is published and could be referenced, and is. Korven Brox
-- and Toqita have no entries.
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
       name = 'Luna Drums',
       sort_name = 'Luna Drums',
       type = 'solo_artist',
       status = 'needs_review',
       gender = 'female',
       ended = FALSE,
       primary_role = 'instrumentalist',
       primary_genre = 'rock',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = NULL,
       province = NULL,
       first_name = 'Luna',
       middle_name = NULL,
       last_name = 'Drums',
       second_last_name = NULL,
       stage_name = 'Luna Drums',
       aliases = ARRAY[]::text[],
       occupations = '["drummer"]'::jsonb,
       instruments = ARRAY['drums']::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular', 'emerging']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = 'luna_drumss',
       disambiguation = 'Dominican drummer; held the kit in the grunge band Grunjeo',
       bio_en = 'Luna Drums is a Dominican drummer. She played in Grunjeo, the Santo Domingo grunge and alternative rock band, from her arrival until the band finished in June 2026.

**Taking the seat**

She was not the band’s first drummer. Grunjeo had one for its opening year and she replaced him, and the band’s own account of what she brought is a solid rhythmic base — which in a three-piece playing loud guitar music is not a compliment about ornament. It means the thing held together after she sat down.

Grunge is drummer-dependent in a way most rock is not. The guitars are deliberately loose and the tempo is deliberately heavy, and if the kit does not carry both the whole arrangement turns to noise. That was the job.

**The only one in the room**

The band advertised her as the only woman behind a kit in Dominican rock, and returned to it more than once. Whether or not the claim survives a full count, the fact that it was worth making says what the room looks like: Dominican rock is a small scene and its drum seats have almost always been held by men.

She was in her teens for all of it, and Grunjeo lasted nineteen months. What she has is a short, complete run in a band that got as far as national television and then stopped.',
       bio_es = 'Luna Drums es una baterista dominicana. Tocó en Grunjeo, la banda de grunge y rock alternativo de Santo Domingo, desde que entró hasta que el grupo terminó en junio de 2026.

**Sentarse en la silla**

No fue la primera baterista de la banda. Grunjeo tuvo uno durante su primer año y ella lo reemplazó, y lo que la propia banda dice que ella aportó es una base rítmica sólida, que en un trío de guitarra dura no es un cumplido sobre adornos. Quiere decir que aquello se sostuvo cuando ella se sentó.

El grunge depende del baterista de una manera en que casi ningún otro rock depende. Las guitarras van sueltas a propósito y el tiempo va pesado a propósito, y si la batería no carga con las dos cosas el arreglo entero se vuelve ruido. Ese era el trabajo.

**La única en el cuarto**

La banda la anunciaba como la única mujer detrás de un set en el rock dominicano, y volvió sobre eso más de una vez. Sobreviva o no el dato a un conteo completo, que valiera la pena decirlo describe cómo es el cuarto: el rock dominicano es una escena pequeña y sus sillas de batería casi siempre las han ocupado hombres.

Fue adolescente durante todo aquello, y Grunjeo duró diecinueve meses. Lo que tiene es una carrera corta y completa en una banda que llegó hasta la televisión nacional y después paró.',
       updated_at = now()
 WHERE slug = 'luna-drums';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luna-drums')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luna-drums')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Luna Drums is a Dominican drummer. She played in ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d2d1dde7-94a6-4463-9a41-7be7245e3f55","displayText":"Grunjeo","occurrenceId":"37c37ded-b4cb-49a3-9662-6e6bdae84537"}},{"text":", the Santo Domingo grunge and alternative rock band, from her arrival until the band finished in June 2026.","type":"text"}]},{"type":"paragraph","content":[{"text":"Taking the seat","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"She was not the band’s first drummer. Grunjeo had one for its opening year and she replaced him, and the band’s own account of what she brought is a solid rhythmic base — which in a three-piece playing loud guitar music is not a compliment about ornament. It means the thing held together after she sat down.","type":"text"}]},{"type":"paragraph","content":[{"text":"Grunge is drummer-dependent in a way most rock is not. The guitars are deliberately loose and the tempo is deliberately heavy, and if the kit does not carry both the whole arrangement turns to noise. That was the job.","type":"text"}]},{"type":"paragraph","content":[{"text":"The only one in the room","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The band advertised her as the only woman behind a kit in Dominican rock, and returned to it more than once. Whether or not the claim survives a full count, the fact that it was worth making says what the room looks like: Dominican rock is a small scene and its drum seats have almost always been held by men.","type":"text"}]},{"type":"paragraph","content":[{"text":"She was in her teens for all of it, and Grunjeo lasted nineteen months. What she has is a short, complete run in a band that got as far as national television and then stopped.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'luna-drums'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Luna Drums es una baterista dominicana. Tocó en ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d2d1dde7-94a6-4463-9a41-7be7245e3f55","displayText":"Grunjeo","occurrenceId":"43c8f36a-bf67-4948-9669-6cbf8b420267"}},{"text":", la banda de grunge y rock alternativo de Santo Domingo, desde que entró hasta que el grupo terminó en junio de 2026.","type":"text"}]},{"type":"paragraph","content":[{"text":"Sentarse en la silla","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"No fue la primera baterista de la banda. Grunjeo tuvo uno durante su primer año y ella lo reemplazó, y lo que la propia banda dice que ella aportó es una base rítmica sólida, que en un trío de guitarra dura no es un cumplido sobre adornos. Quiere decir que aquello se sostuvo cuando ella se sentó.","type":"text"}]},{"type":"paragraph","content":[{"text":"El grunge depende del baterista de una manera en que casi ningún otro rock depende. Las guitarras van sueltas a propósito y el tiempo va pesado a propósito, y si la batería no carga con las dos cosas el arreglo entero se vuelve ruido. Ese era el trabajo.","type":"text"}]},{"type":"paragraph","content":[{"text":"La única en el cuarto","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La banda la anunciaba como la única mujer detrás de un set en el rock dominicano, y volvió sobre eso más de una vez. Sobreviva o no el dato a un conteo completo, que valiera la pena decirlo describe cómo es el cuarto: el rock dominicano es una escena pequeña y sus sillas de batería casi siempre las han ocupado hombres.","type":"text"}]},{"type":"paragraph","content":[{"text":"Fue adolescente durante todo aquello, y Grunjeo duró diecinueve meses. Lo que tiene es una carrera corta y completa en una banda que llegó hasta la televisión nacional y después paró.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'luna-drums'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luna-drums') AND locale = 'en'), '37c37ded-b4cb-49a3-9662-6e6bdae84537', 'artist', 'd2d1dde7-94a6-4463-9a41-7be7245e3f55');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luna-drums') AND locale = 'es'), '43c8f36a-bf67-4948-9669-6cbf8b420267', 'artist', 'd2d1dde7-94a6-4463-9a41-7be7245e3f55');

COMMIT;
