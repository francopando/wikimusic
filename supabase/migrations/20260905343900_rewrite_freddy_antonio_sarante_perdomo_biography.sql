BEGIN;

-- Rewrite the catalogue entry for Freddy Antonio Sarante Perdomo.
--
-- Freddy Antonio Sarante Perdomo. Filler in English, nothing in Spanish, the
-- wrong role and the wrong genre. He was filed as a salsa singer. He is a
-- bachata songwriter and there is no evidence he ever sang anything.
--
-- CORRECTED: primary_role singer -> composer, primary_genre salsa -> bachata,
-- and merengue removed from genres. MusicBrainz's disambiguation for him is
-- literally "bachata songwriter", and the four works attached to him are all
-- bachatas from the same album. Nothing anywhere credits him as a performer.
--
-- OVERWRITTEN: birth_place "Santo Domingo" -> null and province "Distrito
-- Nacional" -> null, both the importer's default. No source says where he is
-- from.
--
-- THE CONFLATION HAD TO BE RULED OUT, and it was. He is NOT Yoskar Sarante.
-- Yoskar's legal name is Yoskar Sarante Ventura -- different second surname --
-- born in Villas Agricolas, Santo Domingo, 2 January 1970, died in Orlando,
-- Florida, 28 January 2019. The two names sit side by side on YouTube's
-- auto-generated credits for the same recordings, in the pattern The Orchard
-- uses: performer first, writer second. Yoskar is the performer; Freddy Antonio
-- Sarante Perdomo is the writer.
--
-- FLAGGED, not changed: the stored alias "Tony Sarante". Nothing found
-- corroborates it, and nothing contradicts it either. It looks like earlier
-- research rather than importer noise, so it stays until somebody can check it.
--
-- NOT ASSERTED: any family link. Yiyo Sarante's legal name is Eduardo Sarante
-- Perdomo, which is the same pair of surnames, and it would be natural to
-- suppose the two are brothers. No source says so, so nothing here says so.
--
-- SOURCES: MusicBrainz, which gives him country DO, gender male, the
-- disambiguation "bachata songwriter", and four works -- Dulces recuerdos,
-- Mujer de nadie, Nina sedienta and Sabor a muerte -- and which credits him as
-- composer on the recording of Nina sedienta. The Orchard's credits carried on
-- Yoskar Sarante's official YouTube channel, which name him as writer on Nina
-- Sedienta and Mujer De Nadie, on the album Nina Sedienta, J&N Records. Spotify
-- for the album's date. Dominican pages and JN Music Group for Yoskar Sarante's
-- legal name, birth and death.
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
       name = 'Freddy Antonio Sarante Perdomo',
       sort_name = 'Sarante Perdomo, Freddy Antonio',
       type = 'person',
       status = 'needs_review',
       gender = 'male',
       ended = FALSE,
       primary_role = 'composer',
       primary_genre = 'bachata',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = NULL,
       province = NULL,
       first_name = 'Freddy',
       middle_name = 'Antonio',
       last_name = 'Sarante',
       second_last_name = 'Perdomo',
       stage_name = 'Freddy Antonio Sarante Perdomo',
       aliases = ARRAY['Tony Sarante']::text[],
       occupations = '["songwriter"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Dominican bachata songwriter; wrote for Yoskar Sarante. Not Yoskar Sarante',
       bio_en = 'Freddy Antonio Sarante Perdomo is a Dominican bachata songwriter. He wrote Niña Sedienta, Mujer de Nadie, Sabor a Muerte and Dulces Recuerdos — the songs on the album that launched Yoskar Sarante.

**The songs behind a debut**

Niña Sedienta came out on J&N Records and is the record that made a career. Four of its songs are his, including the one the album is named after.

Writing for someone else in bachata is largely invisible work. The voice takes the credit, the sleeve gives the writer a line of small type, and thirty years later the song is remembered as belonging to whoever sang it. That is what happened here.

**Two men, one surname**

He is not the singer. Yoskar Sarante’s legal name was Yoskar Sarante Ventura; this is Sarante Perdomo, a different second surname and a different person. The two names appear next to each other in the streaming credits for the same recordings, performer first and writer second, and that ordering is the whole distinction.

Beyond the four songs, nothing about him is published — no birth date, no town, no interview. He is documented entirely by what he wrote.',
       bio_es = 'Freddy Antonio Sarante Perdomo es un compositor de bachata dominicano. Escribió Niña Sedienta, Mujer de Nadie, Sabor a Muerte y Dulces Recuerdos, los temas del álbum con que arrancó Yoskar Sarante.

**Las canciones detrás de un debut**

Niña Sedienta salió por J&N Records y es el disco que hizo una carrera. Cuatro de sus canciones son suyas, incluida la que le da nombre al álbum.

Escribirle a otro en la bachata es un trabajo en buena medida invisible. La voz se lleva el crédito, la portada le da al autor una línea en letra chiquita, y treinta años después la canción se recuerda como propiedad de quien la cantó. Eso fue lo que pasó aquí.

**Dos hombres, un apellido**

No es el cantante. El nombre legal de Yoskar Sarante era Yoskar Sarante Ventura; este es Sarante Perdomo, otro segundo apellido y otra persona. Los dos nombres aparecen uno al lado del otro en los créditos de las mismas grabaciones, primero el intérprete y después el autor, y ese orden es toda la distinción.

Fuera de las cuatro canciones no hay nada publicado sobre él: ni fecha de nacimiento, ni pueblo, ni entrevista. Está documentado enteramente por lo que escribió.',
       updated_at = now()
 WHERE slug = 'freddy-antonio-sarante-perdomo';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'freddy-antonio-sarante-perdomo')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'freddy-antonio-sarante-perdomo')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Freddy Antonio Sarante Perdomo is a Dominican bachata songwriter. He wrote Niña Sedienta, Mujer de Nadie, Sabor a Muerte and Dulces Recuerdos — the songs on the album that launched ","type":"text"},{"type":"artistReference","attrs":{"artistId":"a92fa7a6-842f-44fe-95cb-103c3c38f903","displayText":"Yoskar Sarante","occurrenceId":"562c7bc2-8c74-4023-915a-0f33ceefe3d8"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"The songs behind a debut","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Niña Sedienta came out on J&N Records and is the record that made a career. Four of its songs are his, including the one the album is named after.","type":"text"}]},{"type":"paragraph","content":[{"text":"Writing for someone else in bachata is largely invisible work. The voice takes the credit, the sleeve gives the writer a line of small type, and thirty years later the song is remembered as belonging to whoever sang it. That is what happened here.","type":"text"}]},{"type":"paragraph","content":[{"text":"Two men, one surname","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He is not the singer. Yoskar Sarante’s legal name was Yoskar Sarante Ventura; this is Sarante Perdomo, a different second surname and a different person. The two names appear next to each other in the streaming credits for the same recordings, performer first and writer second, and that ordering is the whole distinction.","type":"text"}]},{"type":"paragraph","content":[{"text":"Beyond the four songs, nothing about him is published — no birth date, no town, no interview. He is documented entirely by what he wrote.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'freddy-antonio-sarante-perdomo'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Freddy Antonio Sarante Perdomo es un compositor de bachata dominicano. Escribió Niña Sedienta, Mujer de Nadie, Sabor a Muerte y Dulces Recuerdos, los temas del álbum con que arrancó ","type":"text"},{"type":"artistReference","attrs":{"artistId":"a92fa7a6-842f-44fe-95cb-103c3c38f903","displayText":"Yoskar Sarante","occurrenceId":"984dcefd-1108-4aa3-b166-117fb108636a"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Las canciones detrás de un debut","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Niña Sedienta salió por J&N Records y es el disco que hizo una carrera. Cuatro de sus canciones son suyas, incluida la que le da nombre al álbum.","type":"text"}]},{"type":"paragraph","content":[{"text":"Escribirle a otro en la bachata es un trabajo en buena medida invisible. La voz se lleva el crédito, la portada le da al autor una línea en letra chiquita, y treinta años después la canción se recuerda como propiedad de quien la cantó. Eso fue lo que pasó aquí.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dos hombres, un apellido","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"No es el cantante. El nombre legal de Yoskar Sarante era Yoskar Sarante Ventura; este es Sarante Perdomo, otro segundo apellido y otra persona. Los dos nombres aparecen uno al lado del otro en los créditos de las mismas grabaciones, primero el intérprete y después el autor, y ese orden es toda la distinción.","type":"text"}]},{"type":"paragraph","content":[{"text":"Fuera de las cuatro canciones no hay nada publicado sobre él: ni fecha de nacimiento, ni pueblo, ni entrevista. Está documentado enteramente por lo que escribió.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'freddy-antonio-sarante-perdomo'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'freddy-antonio-sarante-perdomo') AND locale = 'en'), '562c7bc2-8c74-4023-915a-0f33ceefe3d8', 'artist', 'a92fa7a6-842f-44fe-95cb-103c3c38f903');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'freddy-antonio-sarante-perdomo') AND locale = 'es'), '984dcefd-1108-4aa3-b166-117fb108636a', 'artist', 'a92fa7a6-842f-44fe-95cb-103c3c38f903');

COMMIT;
