BEGIN;

-- Rewrite the catalogue entry for Vanessa.
--
-- Vanessa. Filler in English, nothing in Spanish, no gender, no genre.
--
-- SHORT ON PURPOSE. She records under a first name only and nothing beyond her
-- recordings is documented anywhere -- no surname, no town, no dates, no
-- interview, no photograph. What follows is what can be shown, and it stops
-- there. The entry stays needs_review.
--
-- ADDED: gender female, primary_genre bachata. Both are carried by the sources
-- rather than assumed: MusicBrainz files her as a Dominican bachata artist,
-- her recording Si llego a ser adivina is titled in the feminine, and the
-- compilation her tracks appear on is a women's bachata album.
--
-- OVERWRITTEN: birth_place "Santo Domingo" -> null and province "Distrito
-- Nacional" -> null. Both were the import default. No source names her town.
--
-- SOURCES: MusicBrainz, "Vanessa", Person, country DO, disambiguation
-- "Dominican bachata artist", with four recordings -- Mambo, Puedo ser,
-- Quedate con el, Si llego a ser adivina. Spotify and YouTube, which place
-- Quedate con el on Mujeres En Bachata Sensual, recorded 2003, and also list
-- her on the compilation Bachaton '97. Amazon's tracklist for Mujeres En
-- Bachata Sensual, which gives her El Perdon and puts her alongside Alexandra,
-- Ivelises Novo and Vicky Castro.
--
-- NOT WRITTEN, and it was checked: she is not Vanessa Gil, the later J&N
-- Records bachata singer who also recorded a song called Quedate Con El. That
-- is a different recording from 2018 and there is nothing tying the two women
-- together beyond a shared first name and a shared title.
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
       name = 'Vanessa',
       sort_name = 'Vanessa',
       type = 'solo_artist',
       status = 'needs_review',
       gender = 'female',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'bachata',
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
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Dominican bachata singer of the late nineties and early two-thousands compilations',
       bio_en = 'Vanessa is a Dominican bachata singer. She recorded under her first name alone, and her surviving work is a handful of tracks spread across the bachata compilations of the late nineties and early two-thousands.

**What she recorded**

Four titles are documented: Mambo, Puedo ser, Quédate con él and Si llego a ser adivina. El Perdón appears under her name on Mujeres En Bachata Sensual, an album that gathered the women working in the genre — Alexandra, Ivelises Novo, Vicky Castro and Vanessa on the same running order. Her name also turns up on Bachatón ’97.

**A women’s corner of the genre**

Bachata in those years was overwhelmingly sung by men, and the compilations that collected women singing it existed because there was no other shelf to put them on. Being on one of those records is how a woman with a good voice and no label push got heard at all.

Beyond the recordings nothing about her is documented — no surname, no town, no date. She is one of the singers the genre carried for a few years without writing down.',
       bio_es = 'Vanessa es una cantante de bachata dominicana. Grabó solo con su nombre de pila, y lo que sobrevive de ella es un puñado de temas repartidos por las recopilaciones de bachata de finales de los noventa y comienzos de los dos mil.

**Lo que grabó**

Hay cuatro títulos documentados: Mambo, Puedo ser, Quédate con él y Si llego a ser adivina. El Perdón aparece con su nombre en Mujeres En Bachata Sensual, un disco que reunió a las mujeres que trabajaban el género —Alexandra, Ivelises Novo, Vicky Castro y Vanessa en el mismo orden de pistas—. Su nombre también sale en Bachatón ’97.

**Un rincón de mujeres en el género**

La bachata de aquellos años la cantaban abrumadoramente hombres, y las recopilaciones que juntaban mujeres cantándola existían porque no había otro estante donde ponerlas. Estar en uno de esos discos era la manera en que una mujer con buena voz y sin empuje de sello llegaba a oírse.

Fuera de las grabaciones no hay nada documentado sobre ella: ni apellido, ni pueblo, ni fecha. Es una de las cantantes que el género cargó unos años sin anotarlas.',
       updated_at = now()
 WHERE slug = 'vanessa';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'vanessa')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'vanessa')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Vanessa is a Dominican bachata singer. She recorded under her first name alone, and her surviving work is a handful of tracks spread across the bachata compilations of the late nineties and early two-thousands.","type":"text"}]},{"type":"paragraph","content":[{"text":"What she recorded","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Four titles are documented: Mambo, Puedo ser, Quédate con él and Si llego a ser adivina. El Perdón appears under her name on Mujeres En Bachata Sensual, an album that gathered the women working in the genre — Alexandra, Ivelises Novo, Vicky Castro and Vanessa on the same running order. Her name also turns up on Bachatón ’97.","type":"text"}]},{"type":"paragraph","content":[{"text":"A women’s corner of the genre","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Bachata in those years was overwhelmingly sung by men, and the compilations that collected women singing it existed because there was no other shelf to put them on. Being on one of those records is how a woman with a good voice and no label push got heard at all.","type":"text"}]},{"type":"paragraph","content":[{"text":"Beyond the recordings nothing about her is documented — no surname, no town, no date. She is one of the singers the genre carried for a few years without writing down.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'vanessa'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Vanessa es una cantante de bachata dominicana. Grabó solo con su nombre de pila, y lo que sobrevive de ella es un puñado de temas repartidos por las recopilaciones de bachata de finales de los noventa y comienzos de los dos mil.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que grabó","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Hay cuatro títulos documentados: Mambo, Puedo ser, Quédate con él y Si llego a ser adivina. El Perdón aparece con su nombre en Mujeres En Bachata Sensual, un disco que reunió a las mujeres que trabajaban el género —Alexandra, Ivelises Novo, Vicky Castro y Vanessa en el mismo orden de pistas—. Su nombre también sale en Bachatón ’97.","type":"text"}]},{"type":"paragraph","content":[{"text":"Un rincón de mujeres en el género","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La bachata de aquellos años la cantaban abrumadoramente hombres, y las recopilaciones que juntaban mujeres cantándola existían porque no había otro estante donde ponerlas. Estar en uno de esos discos era la manera en que una mujer con buena voz y sin empuje de sello llegaba a oírse.","type":"text"}]},{"type":"paragraph","content":[{"text":"Fuera de las grabaciones no hay nada documentado sobre ella: ni apellido, ni pueblo, ni fecha. Es una de las cantantes que el género cargó unos años sin anotarlas.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'vanessa'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
