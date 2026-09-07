BEGIN;

-- Rewrite the catalogue entry for La Mayeya.
--
-- La Mayeya. Filler in English, nothing in Spanish, no occupations, no genres,
-- no disambiguation -- and filed under folklore, which he is not.
--
-- PRIMARY_GENRE CHANGED FROM folklore TO bachata, AND IT IS THE EDITOR'S TO
-- REVERSE. Nothing about him is folkloric. His own Facebook page says "su música
-- fusiona la bachata tradicional con un estilo contemporáneo". El Nuevo Diario
-- and Listín Diario both covered him in August 2026 under the headline that he
-- had arrived in the country to present an album called "Bachatas para el alma".
-- The record itself is bachata versions of classics. Every song on his channel
-- is a bachata or a romantic ballad. TO REVERT: the primary_genre line in the row
-- block below.
--
-- EVERYTHING ELSE IN THE ROW WAS ALREADY RIGHT AND IS CONFIRMED, NOT ASSUMED.
-- His channel carries a first-person biography: "Mi nombre es José María Disla,
-- nací el 30 de noviembre de 1983 en San Francisco de Macorís". That matches
-- first_name, middle_name, last_name, date_of_birth, birth_year, birth_place and
-- province exactly. gender male is confirmed by the same text -- worth checking
-- because the stage name is feminine and this catalogue has already had a gender
-- inferred wrongly from a name.
--
-- A SURNAME NOT WRITTEN. His biography names his father as Juan José Disla and
-- his mother as María Elena Bautista. Dominican naming convention would make him
-- José María Disla Bautista, and that is almost certainly right -- which is
-- exactly why it is not being written into second_last_name. An inference from a
-- naming convention is not a source.
--
-- ADDED: occupations composer and producer, which are two of the three words in
-- his own Instagram bio ("Artista / Compositor / Productor"); the third is the
-- primary_role already stored. disambiguation.
--
-- genres LEFT EMPTY, for the fourth time in this run: every bachata subgenre slug
-- in the table is inactive.
--
-- website NOT FILLED. His channel links lamayeya.com; the domain has lapsed and
-- is currently listed for sale.
--
-- SOURCES: his own YouTube channel, for the first-person biography and thirty
-- video titles. His own Instagram. His own Facebook page description. El Nuevo
-- Diario, 18 August 2026, and Listín Diario, 19 August 2026, both on the album
-- and the Juan Gabriel cover -- these are the independent sources and they carry
-- the label, the album title and the track list. Songstats and Soundcharts, which
-- republish his channel biography.
--
-- NOT WRITTEN: no follower counts, no playlist placements, no chart talk -- the
-- newspaper piece is a label release and is full of all three. His mother is
-- named in his own biography as a housewife; the entry names his father and
-- grandfather because they are musicians and that is his musical formation, and
-- stops there.
--
-- NOT LINKED: Juan Gabriel is Mexican. Goldy Boy and Cerro Music Group have no
-- entries.
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
       name = 'La Mayeya',
       sort_name = 'La Mayeya',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'bachata',
       date_of_birth = '1983-11-30',
       birth_year = 1983,
       date_of_death = NULL,
       birth_place = 'San Francisco de Macorís',
       province = 'Duarte',
       first_name = 'José',
       middle_name = 'María',
       last_name = 'Disla',
       second_last_name = NULL,
       stage_name = 'La Mayeya',
       aliases = ARRAY[]::text[],
       occupations = '["composer","producer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@lamayeya',
       facebook = 'lamayeya',
       instagram = 'lamayeya',
       disambiguation = 'Bachata singer-songwriter from San Francisco de Macorís; Bachatas para el Alma',
       bio_en = 'La Mayeya is the stage name of José María Disla, a Dominican bachata singer, songwriter and producer from San Francisco de Macorís. The name is feminine and he is not; it is a word he took, and it has stuck for two decades.

**A house with a guitar in it**

His father was a musician and so was his grandfather, which in the Cibao means the instrument was already in the house and somebody was already practising on it. He grew up watching his father rehearse with a guitar in his hands.

What was playing was boleros, bachata, merengue, salsa and ballads — not one tradition but the whole of what a Dominican radio dial offered. He started writing songs as a child and has been doing it ever since.

**Songs about being left**

The catalogue under his own name is consistent to the point of being a thesis. Ella Se Fue, Olvídame Tú, Corazón De Piedra, Ya Me Enteré, Jugando A Ser Infiel, Camas Separadas, Ni Diablo Ni Santo, Se Está Muriendo Un Hombre, Te Irá Mejor Sin Mí, Ya Supérame.

That is the subject bachata was built on and it is not exhausted. He writes it plainly, from the point of view of the person who found out rather than the person who did it.

There is a comic streak alongside it — an animated video, a parody of a Shelow Shaq record, a song about a monkey. A bachatero who can also be funny has somewhere to go when the ballads get heavy, and the Dominican audience has always rewarded both at once.

**Bachatas para el Alma**

He signed to a label and made a covers album, and the idea behind it is better than most covers albums get: take songs from outside the genre that have outlived their own moment, and rebuild them as bachatas.

The lead track is a ranchera — the definitive Mexican song of romantic humiliation, made permanent by Juan Gabriel — turned into a bachata. Those two traditions are closer than they look. Both are about being wronged and saying so at length, and the guitar figure that carries a bachata does the same job as the mariachi trumpet answering a line.

Ese Tipo Soy Yo and ¿Cuál Adiós? come off the same record. He came back to the Dominican Republic to present it, after years of working the audience abroad.',
       bio_es = 'La Mayeya es el nombre artístico de José María Disla, cantautor y productor de bachata dominicano, de San Francisco de Macorís. El nombre es femenino y él no lo es; es una palabra que agarró, y le lleva pegada dos décadas.

**Una casa con una guitarra adentro**

Su padre fue músico y su abuelo también, que en el Cibao quiere decir que el instrumento ya estaba en la casa y que alguien ya estaba ensayando con él. Se crió viendo a su papá repasar sus canciones con la guitarra en la mano.

Lo que sonaba era bolero, bachata, merengue, salsa y balada; no una tradición sino todo lo que ofrecía el dial dominicano. Empezó a componer de niño y no ha parado.

**Canciones de quien se queda**

El catálogo con su nombre es coherente al punto de ser una tesis. Ella Se Fue, Olvídame Tú, Corazón De Piedra, Ya Me Enteré, Jugando A Ser Infiel, Camas Separadas, Ni Diablo Ni Santo, Se Está Muriendo Un Hombre, Te Irá Mejor Sin Mí, Ya Supérame.

Ese es el asunto sobre el que se construyó la bachata y no está agotado. Él lo escribe llano, desde el punto de vista del que se enteró y no del que lo hizo.

Al lado hay una vena cómica: un video animado, una parodia de un tema de Shelow Shaq, una canción sobre un monito. Un bachatero que además puede ser gracioso tiene a dónde ir cuando las baladas pesan, y al público dominicano las dos cosas juntas siempre le han gustado.

**Bachatas para el Alma**

Firmó con un sello e hizo un disco de versiones, y la idea detrás es mejor que la de la mayoría de los discos de versiones: agarrar canciones de fuera del género que le sobrevivieron a su propio momento, y rearmarlas como bachatas.

El tema que lo abre es una ranchera —la canción mexicana definitiva del despecho, vuelta eterna por Juan Gabriel— convertida en bachata. Esas dos tradiciones están más cerca de lo que parecen. Las dos van de que a uno lo agraviaron y de decirlo largo, y la figura de guitarra que carga una bachata hace el mismo trabajo que la trompeta del mariachi contestándole a un verso.

Ese Tipo Soy Yo y ¿Cuál Adiós? salen del mismo disco. Volvió a la República Dominicana a presentarlo, después de años trabajando el público de afuera.',
       updated_at = now()
 WHERE slug = 'la-mayeya';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'la-mayeya')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'la-mayeya')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"La Mayeya is the stage name of José María Disla, a Dominican bachata singer, songwriter and producer from San Francisco de Macorís. The name is feminine and he is not; it is a word he took, and it has stuck for two decades.","type":"text"}]},{"type":"paragraph","content":[{"text":"A house with a guitar in it","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"His father was a musician and so was his grandfather, which in the Cibao means the instrument was already in the house and somebody was already practising on it. He grew up watching his father rehearse with a guitar in his hands.","type":"text"}]},{"type":"paragraph","content":[{"text":"What was playing was boleros, bachata, merengue, salsa and ballads — not one tradition but the whole of what a Dominican radio dial offered. He started writing songs as a child and has been doing it ever since.","type":"text"}]},{"type":"paragraph","content":[{"text":"Songs about being left","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The catalogue under his own name is consistent to the point of being a thesis. Ella Se Fue, Olvídame Tú, Corazón De Piedra, Ya Me Enteré, Jugando A Ser Infiel, Camas Separadas, Ni Diablo Ni Santo, Se Está Muriendo Un Hombre, Te Irá Mejor Sin Mí, Ya Supérame.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is the subject bachata was built on and it is not exhausted. He writes it plainly, from the point of view of the person who found out rather than the person who did it.","type":"text"}]},{"type":"paragraph","content":[{"text":"There is a comic streak alongside it — an animated video, a parody of a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cadebd75-4af4-4519-9599-6ec606694a36","displayText":"Shelow Shaq","occurrenceId":"cf8638db-c534-45ac-b1b2-fef907d89db8"}},{"text":" record, a song about a monkey. A bachatero who can also be funny has somewhere to go when the ballads get heavy, and the Dominican audience has always rewarded both at once.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bachatas para el Alma","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He signed to a label and made a covers album, and the idea behind it is better than most covers albums get: take songs from outside the genre that have outlived their own moment, and rebuild them as bachatas.","type":"text"}]},{"type":"paragraph","content":[{"text":"The lead track is a ranchera — the definitive Mexican song of romantic humiliation, made permanent by Juan Gabriel — turned into a bachata. Those two traditions are closer than they look. Both are about being wronged and saying so at length, and the guitar figure that carries a bachata does the same job as the mariachi trumpet answering a line.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ese Tipo Soy Yo and ¿Cuál Adiós? come off the same record. He came back to the Dominican Republic to present it, after years of working the audience abroad.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'la-mayeya'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"La Mayeya es el nombre artístico de José María Disla, cantautor y productor de bachata dominicano, de San Francisco de Macorís. El nombre es femenino y él no lo es; es una palabra que agarró, y le lleva pegada dos décadas.","type":"text"}]},{"type":"paragraph","content":[{"text":"Una casa con una guitarra adentro","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Su padre fue músico y su abuelo también, que en el Cibao quiere decir que el instrumento ya estaba en la casa y que alguien ya estaba ensayando con él. Se crió viendo a su papá repasar sus canciones con la guitarra en la mano.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que sonaba era bolero, bachata, merengue, salsa y balada; no una tradición sino todo lo que ofrecía el dial dominicano. Empezó a componer de niño y no ha parado.","type":"text"}]},{"type":"paragraph","content":[{"text":"Canciones de quien se queda","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El catálogo con su nombre es coherente al punto de ser una tesis. Ella Se Fue, Olvídame Tú, Corazón De Piedra, Ya Me Enteré, Jugando A Ser Infiel, Camas Separadas, Ni Diablo Ni Santo, Se Está Muriendo Un Hombre, Te Irá Mejor Sin Mí, Ya Supérame.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ese es el asunto sobre el que se construyó la bachata y no está agotado. Él lo escribe llano, desde el punto de vista del que se enteró y no del que lo hizo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Al lado hay una vena cómica: un video animado, una parodia de un tema de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cadebd75-4af4-4519-9599-6ec606694a36","displayText":"Shelow Shaq","occurrenceId":"465ec5bd-63dd-4b67-a51f-5f9abc8cd71f"}},{"text":", una canción sobre un monito. Un bachatero que además puede ser gracioso tiene a dónde ir cuando las baladas pesan, y al público dominicano las dos cosas juntas siempre le han gustado.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bachatas para el Alma","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Firmó con un sello e hizo un disco de versiones, y la idea detrás es mejor que la de la mayoría de los discos de versiones: agarrar canciones de fuera del género que le sobrevivieron a su propio momento, y rearmarlas como bachatas.","type":"text"}]},{"type":"paragraph","content":[{"text":"El tema que lo abre es una ranchera —la canción mexicana definitiva del despecho, vuelta eterna por Juan Gabriel— convertida en bachata. Esas dos tradiciones están más cerca de lo que parecen. Las dos van de que a uno lo agraviaron y de decirlo largo, y la figura de guitarra que carga una bachata hace el mismo trabajo que la trompeta del mariachi contestándole a un verso.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ese Tipo Soy Yo y ¿Cuál Adiós? salen del mismo disco. Volvió a la República Dominicana a presentarlo, después de años trabajando el público de afuera.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'la-mayeya'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'la-mayeya') AND locale = 'en'), 'cf8638db-c534-45ac-b1b2-fef907d89db8', 'artist', 'cadebd75-4af4-4519-9599-6ec606694a36');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'la-mayeya') AND locale = 'es'), '465ec5bd-63dd-4b67-a51f-5f9abc8cd71f', 'artist', 'cadebd75-4af4-4519-9599-6ec606694a36');

COMMIT;
