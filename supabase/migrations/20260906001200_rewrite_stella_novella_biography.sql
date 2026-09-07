BEGIN;

-- Rewrite the catalogue entry for Stella Novella.
--
-- Stella Novella. Filler in English, nothing in Spanish -- and a gender and a
-- birthplace the record had no basis for.
--
-- SHORT ON PURPOSE. Almost nothing is published: a handful of singles, a
-- one-line self-description and a linked second artist name. The entry says
-- that and stops.
--
-- CORRECTED: gender "male" -> null. Nothing supports "male". MusicBrainz leaves
-- gender empty and files the entry as type Character, which is the right shape
-- for a stage persona; Spotify's own artist bio says only "Dominican American
-- drag artist"; the one third-party page that uses a pronoun uses "her" for
-- Stella, which describes the persona rather than the performer. No source
-- states the performer's gender or pronouns, so the column is emptied rather
-- than guessed and the prose uses none.
--
-- OVERWRITTEN: birth_place "Santo Domingo" -> null and province "Distrito
-- Nacional" -> null, both the importer's default. "Dominican American" does not
-- say which country the artist was born in, and "Born Abroad" would be as much
-- of a guess as Santo Domingo was.
--
-- LEFT ALONE AND FLAGGED: primary_genre electronic. The material is dance pop
-- with an electronic base as far as the titles and the artist's own pick
-- suggest, but nobody has classified it in print. Not wrong; not confirmed.
--
-- SOURCES: Spotify's artist page, whose About text is the artist's own and
-- reads in full "Dominican American drag artist", and whose artist pick quotes
-- Bailarin -- "bailarin, bailarin de go-go". MusicBrainz, which gives type
-- Character, country DO, gender empty, and the single Lonely at the Orgy of 27
-- June 2025. Chartmetric, which lists Your Dad, Drip and Bailarin among the most
-- played. Music Metrics Vault, which links the two names: "Mstr Fish also writes
-- music and performs as drag artist Stella Novella".
--
-- NOT WRITTEN: anything about the person behind the persona beyond the working
-- name, and nothing about private life. Drag is treated here as what it is --
-- a performance discipline, like any other listed in this catalogue.
--
-- FLAGGED FOR THE EDITOR: Mstr Fish, the other name the same person records
-- under, has no entry. If Stella Novella belongs in the catalogue then so
-- probably does Mstr Fish, and the two should be joined once somebody can
-- confirm the identification from a source the artist controls.
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
       name = 'Stella Novella',
       sort_name = 'Stella Novella',
       type = 'solo_artist',
       status = 'published',
       gender = NULL,
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'electronic',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = NULL,
       province = NULL,
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = 'Stella Novella',
       aliases = ARRAY[]::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano']::text[],
       artist_tags = ARRAY['secular', 'diaspora', 'emerging']::text[],
       website = NULL,
       youtube = 'channel/UCDOHyZYMUvwhHUBZ_y3YJsw',
       facebook = 'charliefish',
       instagram = 'thestellanovella',
       disambiguation = 'Dominican American drag artist and songwriter; also records as Mstr Fish',
       bio_en = 'Stella Novella is the performing name of a Dominican American drag artist and songwriter, who also writes and releases music under the name Mstr Fish.

**Two names, one catalogue**

Drag is a discipline with its own craft — a character, a voice, a look and a set that have to hold a room — and performers who also make records commonly keep the two names apart. One is the writer; the other is who walks out in front of the audience.

Bailarín is the one the artist points listeners to first, and its hook is about a go-go dancer. Your Dad, Drip and Lost are the others that get played, and Lonely at the Orgy came out in June 2025.

**Where it sits**

The titles are in two languages and the music is dance music with an electronic floor under it. That is a long way from merengue and bachata, and it is the sound of a specific place — the club circuit of the Dominican diaspora in North America, where the audience grew up on both catalogues and expects neither.

Almost nothing else is documented. There is no interview, no date, no label and no photograph in the public record, which is the normal condition of an artist releasing independently and early.',
       bio_es = 'Stella Novella es el nombre artístico de una figura del drag y compositor dominicano-estadounidense, que también escribe y publica música bajo el nombre de Mstr Fish.

**Dos nombres, un catálogo**

El drag es una disciplina con oficio propio —un personaje, una voz, una imagen y un espectáculo que tienen que sostener un salón— y quienes además graban discos suelen mantener los dos nombres separados. Uno es quien escribe; el otro es quien sale delante del público.

Bailarín es el tema al que el propio artista manda primero a los oyentes, y su gancho habla de un bailarín de go-go. Your Dad, Drip y Lost son los otros que suenan, y Lonely at the Orgy salió en junio de 2025.

**Dónde encaja**

Los títulos están en dos idiomas y la música es música de baile con un piso electrónico debajo. Eso queda lejos del merengue y de la bachata, y es el sonido de un sitio concreto: el circuito de clubes de la diáspora dominicana en Norteamérica, donde el público se crió con los dos catálogos y no espera ninguno de los dos.

Casi no hay nada más documentado. No hay entrevista, ni fecha, ni sello, ni fotografía en el registro público, que es la condición normal de quien publica por su cuenta y va empezando.',
       updated_at = now()
 WHERE slug = 'stella-novella';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'stella-novella')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'stella-novella')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Stella Novella is the performing name of a Dominican American drag artist and songwriter, who also writes and releases music under the name Mstr Fish.","type":"text"}]},{"type":"paragraph","content":[{"text":"Two names, one catalogue","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Drag is a discipline with its own craft — a character, a voice, a look and a set that have to hold a room — and performers who also make records commonly keep the two names apart. One is the writer; the other is who walks out in front of the audience.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bailarín is the one the artist points listeners to first, and its hook is about a go-go dancer. Your Dad, Drip and Lost are the others that get played, and Lonely at the Orgy came out in June 2025.","type":"text"}]},{"type":"paragraph","content":[{"text":"Where it sits","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The titles are in two languages and the music is dance music with an electronic floor under it. That is a long way from merengue and bachata, and it is the sound of a specific place — the club circuit of the Dominican diaspora in North America, where the audience grew up on both catalogues and expects neither.","type":"text"}]},{"type":"paragraph","content":[{"text":"Almost nothing else is documented. There is no interview, no date, no label and no photograph in the public record, which is the normal condition of an artist releasing independently and early.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'stella-novella'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Stella Novella es el nombre artístico de una figura del drag y compositor dominicano-estadounidense, que también escribe y publica música bajo el nombre de Mstr Fish.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dos nombres, un catálogo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El drag es una disciplina con oficio propio —un personaje, una voz, una imagen y un espectáculo que tienen que sostener un salón— y quienes además graban discos suelen mantener los dos nombres separados. Uno es quien escribe; el otro es quien sale delante del público.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bailarín es el tema al que el propio artista manda primero a los oyentes, y su gancho habla de un bailarín de go-go. Your Dad, Drip y Lost son los otros que suenan, y Lonely at the Orgy salió en junio de 2025.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dónde encaja","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Los títulos están en dos idiomas y la música es música de baile con un piso electrónico debajo. Eso queda lejos del merengue y de la bachata, y es el sonido de un sitio concreto: el circuito de clubes de la diáspora dominicana en Norteamérica, donde el público se crió con los dos catálogos y no espera ninguno de los dos.","type":"text"}]},{"type":"paragraph","content":[{"text":"Casi no hay nada más documentado. No hay entrevista, ni fecha, ni sello, ni fotografía en el registro público, que es la condición normal de quien publica por su cuenta y va empezando.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'stella-novella'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
