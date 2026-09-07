BEGIN;

-- Rewrite the catalogue entry for Clark.
--
-- Clark. A name, an Instagram handle and nothing else -- no genre, no gender,
-- no biography in either language, and filed as a singer. He is a bass player.
--
-- primary_role changed from singer to instrumentalist.
-- GENRE SET to rock; the row had none.
--
-- SOURCES: MusicBrainz, which lists him as an original member of Grunjeo on
-- bass from 10 November 2024 to 10 January 2026 and on electric guitar from 10
-- November 2024 to 1 February 2025, and credits him with bass guitar and
-- electric guitar on "Estoy Atrapado (Grunjeo)" by Korven Brox and with
-- electric bass on "Plan (demo)", Grunjeo's first demo. Grunjeo's own official
-- biography at grunjeo.com, which lists him among the earlier members as
-- "guitarrista y bajista entre 2024 y 2025", and which records the band as
-- founded in Santo Domingo on 10 November 2024 by Korven Brox and closed on 12
-- June 2026, leaving the album Desgaste behind.
--
-- NOT WRITTEN: a real name, a birth date or a birthplace. None is public.
-- NOT WRITTEN: the album Desgaste as his. He had left before it was recorded.
-- FLAGGED: status. Left at needs_review; no image and no identity on record.
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
       name = 'Clark',
       sort_name = 'Clark',
       type = 'solo_artist',
       status = 'needs_review',
       gender = 'male',
       ended = FALSE,
       primary_role = 'instrumentalist',
       primary_genre = 'rock',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = NULL,
       province = NULL,
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY[]::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY['bass', 'guitar']::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = 'clarkbassz',
       disambiguation = 'Dominican bassist and guitarist; an original member of the grunge band Grunjeo',
       bio_en = 'Clark is a Dominican bassist and guitarist. He was an original member of Grunjeo, the alternative grunge band from Santo Domingo, playing with it from its founding in November 2024.

**Bass and guitar**

He came in on both instruments. He held the electric guitar for the first few months and the bass for a year after that, which is what happens in a band small enough that the parts get assigned by who is available rather than by who specialises.

He plays bass and electric guitar on Estoy Atrapado, credited to Korven Brox, and electric bass on Plan, the first demo the band put out.

**A short scene**

Grunjeo lasted a year and a half and ended in June 2026. Clark had left before the album was made, so what survives of his playing is the demo and the early single.

That is the whole shape of Dominican alternative rock at this scale. Bands form among teenagers, record at home, play a handful of independent rooms in Santo Domingo and end, and the recorded trace of any one member is two or three tracks.',
       bio_es = 'Clark es un bajista y guitarrista dominicano. Fue miembro original de Grunjeo, la banda de grunge alternativo de Santo Domingo, y tocó con ella desde su fundación en noviembre de 2024.

**Bajo y guitarra**

Entró con los dos instrumentos. Sostuvo la guitarra eléctrica los primeros meses y el bajo durante un año después, que es lo que pasa en una banda lo bastante pequeña como para que los papeles se repartan por quién está disponible y no por quién se especializa.

Toca bajo y guitarra eléctrica en Estoy Atrapado, acreditada a Korven Brox, y bajo eléctrico en Plan, el primer demo que sacó la banda.

**Una escena corta**

Grunjeo duró año y medio y se acabó en junio de 2026. Clark ya había salido antes de que se hiciera el álbum, así que lo que sobrevive de lo que tocó es el demo y aquel primer tema.

Ésa es la forma entera del rock alternativo dominicano a esta escala. Las bandas se arman entre adolescentes, graban en casa, tocan en un puñado de locales independientes de Santo Domingo y se acaban, y el rastro grabado de cualquiera de sus integrantes son dos o tres temas.',
       updated_at = now()
 WHERE slug = 'clark';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'clark')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'clark')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Clark is a Dominican bassist and guitarist. He was an original member of ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d2d1dde7-94a6-4463-9a41-7be7245e3f55","displayText":"Grunjeo","occurrenceId":"627d2423-7d08-483c-afac-0f8904e02533"}},{"text":", the alternative grunge band from Santo Domingo, playing with it from its founding in November 2024.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bass and guitar","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He came in on both instruments. He held the electric guitar for the first few months and the bass for a year after that, which is what happens in a band small enough that the parts get assigned by who is available rather than by who specialises.","type":"text"}]},{"type":"paragraph","content":[{"text":"He plays bass and electric guitar on Estoy Atrapado, credited to ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6de9f638-4a9f-4fcc-ab2b-8b836166101c","displayText":"Korven Brox","occurrenceId":"3d622df8-e175-4c28-81f7-0ca5995213cc"}},{"text":", and electric bass on Plan, the first demo the band put out.","type":"text"}]},{"type":"paragraph","content":[{"text":"A short scene","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Grunjeo lasted a year and a half and ended in June 2026. Clark had left before the album was made, so what survives of his playing is the demo and the early single.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is the whole shape of Dominican alternative rock at this scale. Bands form among teenagers, record at home, play a handful of independent rooms in Santo Domingo and end, and the recorded trace of any one member is two or three tracks.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'clark'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Clark es un bajista y guitarrista dominicano. Fue miembro original de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d2d1dde7-94a6-4463-9a41-7be7245e3f55","displayText":"Grunjeo","occurrenceId":"475133f0-0521-4148-8f57-7509281be56f"}},{"text":", la banda de grunge alternativo de Santo Domingo, y tocó con ella desde su fundación en noviembre de 2024.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bajo y guitarra","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Entró con los dos instrumentos. Sostuvo la guitarra eléctrica los primeros meses y el bajo durante un año después, que es lo que pasa en una banda lo bastante pequeña como para que los papeles se repartan por quién está disponible y no por quién se especializa.","type":"text"}]},{"type":"paragraph","content":[{"text":"Toca bajo y guitarra eléctrica en Estoy Atrapado, acreditada a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6de9f638-4a9f-4fcc-ab2b-8b836166101c","displayText":"Korven Brox","occurrenceId":"090a6370-0388-4368-987d-c51526b24b13"}},{"text":", y bajo eléctrico en Plan, el primer demo que sacó la banda.","type":"text"}]},{"type":"paragraph","content":[{"text":"Una escena corta","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Grunjeo duró año y medio y se acabó en junio de 2026. Clark ya había salido antes de que se hiciera el álbum, así que lo que sobrevive de lo que tocó es el demo y aquel primer tema.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ésa es la forma entera del rock alternativo dominicano a esta escala. Las bandas se arman entre adolescentes, graban en casa, tocan en un puñado de locales independientes de Santo Domingo y se acaban, y el rastro grabado de cualquiera de sus integrantes son dos o tres temas.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'clark'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'clark') AND locale = 'en'), '3d622df8-e175-4c28-81f7-0ca5995213cc', 'artist', '6de9f638-4a9f-4fcc-ab2b-8b836166101c');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'clark') AND locale = 'en'), '627d2423-7d08-483c-afac-0f8904e02533', 'artist', 'd2d1dde7-94a6-4463-9a41-7be7245e3f55');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'clark') AND locale = 'es'), '090a6370-0388-4368-987d-c51526b24b13', 'artist', '6de9f638-4a9f-4fcc-ab2b-8b836166101c');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'clark') AND locale = 'es'), '475133f0-0521-4148-8f57-7509281be56f', 'artist', 'd2d1dde7-94a6-4463-9a41-7be7245e3f55');

COMMIT;
