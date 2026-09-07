BEGIN;

-- Rewrite the catalogue entry for The Nino.
--
-- The Nino. Filler in English, nothing in Spanish.
--
-- SHORT ON PURPOSE. He is a YouTuber and a gamer first and a recording artist
-- second, and the recording side is barely documented: three song titles, one
-- release date and one licensing deal. The entry says that and stops.
--
-- CORRECTED: primary_genre urban-dembow -> urban-rap-hip-hop. MusicBrainz
-- files him as a Dominican hip-hop artist, gamer and influencer, and the
-- releases named around him are rap and trap rather than dembow. Added rapper
-- to occupations and urbano to genres.
--
-- LEFT ALONE AND FLAGGED: province "Distrito Nacional" and birth_place "Santo
-- Domingo", the importer's default. No source names a town or a birth date, and
-- none gives a legal name.
--
-- SOURCES: MusicBrainz, which gives the disambiguation "Dominican hip-hop
-- artist/gamer/influencer" and the single Saquen Clip, 2021. Descifrando La
-- Noticia and La Informacion Digital, 2 August 2022, on the songs Saquen Clip,
-- Trap de 5 Millones and CR7, and on the brand licensing agreement he signed
-- with the company Music Mafia RD. His own channels for the rest.
--
-- NOT WRITTEN: subscriber and view counts, which is what every article about
-- him is actually about -- the pieces are headlined on his ranking as a
-- YouTuber -- and which this catalogue does not carry. Removing them leaves
-- very little, and that is an honest reflection of how much of his work is
-- music.
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
       name = 'The Nino',
       sort_name = 'The Nino',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urban-rap-hip-hop',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = 'The Nino',
       aliases = ARRAY[]::text[],
       occupations = '["rapper"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'urban-trap']::text[],
       artist_tags = ARRAY['secular', 'emerging']::text[],
       website = 'https://link.me/theninoyt',
       youtube = '@TheNino',
       facebook = '100059622788386',
       instagram = 'theninoyt',
       disambiguation = 'Dominican YouTuber and gamer who also records rap',
       bio_en = 'The Nino is a Dominican YouTuber, gamer and rapper. The music is one thing he does; the channel is the other, and the channel came first.

**Saquen Clip**

The single arrived in 2021, and Trap de 5 Millones and CR7 followed. The titles say what the songs are for: a clip is what a gamer captures and posts, five million is a subscriber milestone, and CR7 is a footballer. They are records addressed to an audience that already existed somewhere else.

In August 2022 he signed a brand licensing agreement with the company Music Mafia RD.

**A different order of operations**

For most of the last century a Dominican musician built an audience by making records. This is the inversion: the audience is assembled by streaming games, and the record is something the audience is then offered.

Whether that produces durable music is not yet answerable, and there is not much catalogue to judge it on. What it certainly produces is reach — a Dominican channel of that size is heard by more people in a week than most merengue orchestras reached in a career.

Nothing else about him is documented. No legal name, no date of birth, no town.',
       bio_es = 'The Nino es un youtuber, gamer y rapero dominicano. La música es una de las cosas que hace; el canal es la otra, y el canal fue primero.

**Saquen Clip**

El sencillo salió en 2021, y detrás vinieron Trap de 5 Millones y CR7. Los títulos dicen para qué son las canciones: un clip es lo que un gamer captura y publica, cinco millones es una marca de suscriptores y CR7 es un futbolista. Son discos dirigidos a un público que ya existía en otro sitio.

En agosto de 2022 firmó un acuerdo de licencia de marca con la empresa Music Mafia RD.

**Otro orden de operaciones**

Durante casi todo el siglo pasado un músico dominicano construía público haciendo discos. Esto es lo inverso: el público se arma transmitiendo videojuegos, y el disco es algo que después se le ofrece a ese público.

Si eso produce música duradera todavía no se puede contestar, y no hay mucho catálogo para juzgarlo. Lo que sí produce con seguridad es alcance: un canal dominicano de ese tamaño lo oye en una semana más gente de la que alcanzaron en una carrera casi todas las orquestas de merengue.

De él no hay nada más documentado. Ni nombre legal, ni fecha de nacimiento, ni pueblo.',
       updated_at = now()
 WHERE slug = 'the-nino';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'the-nino')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'the-nino')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"The Nino is a Dominican YouTuber, gamer and rapper. The music is one thing he does; the channel is the other, and the channel came first.","type":"text"}]},{"type":"paragraph","content":[{"text":"Saquen Clip","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The single arrived in 2021, and Trap de 5 Millones and CR7 followed. The titles say what the songs are for: a clip is what a gamer captures and posts, five million is a subscriber milestone, and CR7 is a footballer. They are records addressed to an audience that already existed somewhere else.","type":"text"}]},{"type":"paragraph","content":[{"text":"In August 2022 he signed a brand licensing agreement with the company Music Mafia RD.","type":"text"}]},{"type":"paragraph","content":[{"text":"A different order of operations","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"For most of the last century a Dominican musician built an audience by making records. This is the inversion: the audience is assembled by streaming games, and the record is something the audience is then offered.","type":"text"}]},{"type":"paragraph","content":[{"text":"Whether that produces durable music is not yet answerable, and there is not much catalogue to judge it on. What it certainly produces is reach — a Dominican channel of that size is heard by more people in a week than most merengue orchestras reached in a career.","type":"text"}]},{"type":"paragraph","content":[{"text":"Nothing else about him is documented. No legal name, no date of birth, no town.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'the-nino'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"The Nino es un youtuber, gamer y rapero dominicano. La música es una de las cosas que hace; el canal es la otra, y el canal fue primero.","type":"text"}]},{"type":"paragraph","content":[{"text":"Saquen Clip","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El sencillo salió en 2021, y detrás vinieron Trap de 5 Millones y CR7. Los títulos dicen para qué son las canciones: un clip es lo que un gamer captura y publica, cinco millones es una marca de suscriptores y CR7 es un futbolista. Son discos dirigidos a un público que ya existía en otro sitio.","type":"text"}]},{"type":"paragraph","content":[{"text":"En agosto de 2022 firmó un acuerdo de licencia de marca con la empresa Music Mafia RD.","type":"text"}]},{"type":"paragraph","content":[{"text":"Otro orden de operaciones","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Durante casi todo el siglo pasado un músico dominicano construía público haciendo discos. Esto es lo inverso: el público se arma transmitiendo videojuegos, y el disco es algo que después se le ofrece a ese público.","type":"text"}]},{"type":"paragraph","content":[{"text":"Si eso produce música duradera todavía no se puede contestar, y no hay mucho catálogo para juzgarlo. Lo que sí produce con seguridad es alcance: un canal dominicano de ese tamaño lo oye en una semana más gente de la que alcanzaron en una carrera casi todas las orquestas de merengue.","type":"text"}]},{"type":"paragraph","content":[{"text":"De él no hay nada más documentado. Ni nombre legal, ni fecha de nacimiento, ni pueblo.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'the-nino'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
