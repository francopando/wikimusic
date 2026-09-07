BEGIN;

-- Rewrite the catalogue entry for Dalvin la Melodía.
--
-- Dalvin la Melodía. Rewrite. The old entry was machine-written, twenty-one
-- paragraphs of it, with a section called "Personal Context" and bulleted lists
-- of style attributes, and it had no sort_name, no stage_name, no occupations
-- and no disambiguation.
--
-- THE ORIGIN STORY WAS MISSING AND IT IS THE WHOLE ENTRY. Listín Diario, 4
-- September 2025, headlined its piece on him: "Dalvin La Melodía: la revelación
-- de la bachata que trabajó duro en un colmadón". He worked in a colmadón --
-- the Dominican corner shop that doubles as a bar, and the single most important
-- venue bachata has, because it is where the music is actually played all day.
-- A bachatero who came out of one is not a detail, it is the fact.
--
-- THE CHRONOLOGY IS FIXED FROM A DISCOGRAPHY RATHER THAN A GUESS. Qobuz's
-- editorial discography gives the order: the covers came first -- including the
-- Yoskar Sarante tribute "Pensando en Ella" -- then "Por Ti", his first original
-- single, and then "Mi Reina" later in 2024. That order is the argument of the
-- entry: he arrived singing other people's classics and then started writing.
--
-- THE YOSKAR SARANTE LINK IS VERIFIED, NOT ASSUMED. The old text asserted the
-- tribute without a source. Checked: Qobuz calls it a Yoskar Sarante tribute
-- outright, his own SoundCloud upload says "En honor a nuestro querido artista
-- Dominicano Yoskar Sarante", a live video is titled "HOMENAJE A YOSKAR
-- SARANTE", and his own TikTok posted it as such. Linked.
--
-- FILLED: sort_name and stage_name, both null; occupations composer, since he
-- now writes his own; the emerging tag, which is what he is at twenty-three;
-- disambiguation.
--
-- genres LEFT EMPTY. Every bachata subgenre slug in the table is inactive, the
-- same wall this run has hit five times now.
--
-- A BIRTHPLACE NOT CHANGED. One aggregated summary says he was born in Los
-- Alcarrizos and built his career in Santiago de los Caballeros, and Los
-- Alcarrizos also appears in an unrelated headline about him. Los Alcarrizos is
-- a municipality of Santo Domingo province, so the stored province is right
-- either way; birth_place stays "Santo Domingo" because a single aggregator is
-- not enough to narrow it. date_of_birth 2003-06-07 is left as stored and is
-- corroborated by Famous Birthdays and by Qobuz's "born in 2003 in Santo
-- Domingo".
--
-- NOT WRITTEN. There is a January 2026 story about him defending his wife during
-- an incident. Private life and public incidents are both outside what this
-- record keeps, and it is not here. The old text's "Personal Context" section is
-- gone with it. No view counts, no follower counts.
--
-- SOURCES: his own YouTube channel -- the About text, which names the debut
-- album La Bachata Volvió and the imprint, and twenty-seven video titles. His
-- own Instagram, Facebook and TikTok. Listín Diario, 4 September 2025. Qobuz's
-- discography. Tony Dandrades's feature for Primer Impacto, 27-28 August 2026.
-- Venue announcements from the Kia Center in Orlando and the Santander Arena for
-- the 2026 United States tour. A recording from the Vibra Latina Festival in
-- Aruba.
--
-- NOT LINKED: Tito "El Bambino" is Puerto Rican. El Blachy, Lady Laura LMS and
-- Deivv have no entries. "Las Gemelas", credited on Los Niños, is NOT linked to
-- the published Las Gemelas Fantásticas RD -- the billing is not the same name
-- and the identity was not established.
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
       name = 'Dalvin la Melodía',
       sort_name = 'Dalvin la Melodía',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'bachata',
       date_of_birth = '2003-06-07',
       birth_year = 2003,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Santo Domingo',
       first_name = 'Dalvin',
       middle_name = 'Antonio',
       last_name = 'Núñez',
       second_last_name = 'Vargas',
       stage_name = 'Dalvin la Melodía',
       aliases = ARRAY[]::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular', 'emerging']::text[],
       website = 'https://www.dalvinlamelodiausa.com',
       youtube = '@DalvinLaMelodiaOfficial',
       facebook = 'dalvinlamelodiaofficial',
       instagram = 'dalvinmelody',
       disambiguation = 'Young bachatero; Mi Reina, La Bachata Volvió',
       bio_en = 'Dalvin la Melodía, born Dalvin Antonio Núñez Vargas, is a Dominican bachata singer and songwriter. He is twenty-three, he came out of a colmadón, and he is currently filling arenas in the United States.

**The colmadón**

A colmadón is a corner shop with a speaker outside and plastic chairs on the pavement, and it is where bachata actually lives. Not the radio, not the concert hall — the shop on the corner, at volume, all day, every day, with the whole street as an audience whether it wants to be or not.

He worked in one. A national newspaper made that the headline when it wrote about him, and it deserved to be: every bachatero learns the repertoire from a colmadón speaker, and he learned it from behind the counter.

**Singing other people’s songs first**

He arrived doing covers, which is the ordinary route and it is also a statement about what he thinks bachata is. Pensando en Ella is his tribute to Yoskar Sarante, and he has said so plainly every time he has released it. Chiquilla Bonita and Tesoro Perdido are the same instinct: take the songs the country already knows and sing them like they are new.

Then came Por Ti, his first original, and after it Mi Reina, which is the record that did it. Everything since has been his own.

That order matters. A young singer who covers the classics first is putting himself in a line rather than announcing himself as a break with one, and the album he eventually made is called La Bachata Volvió — bachata came back. He is arguing that the genre had gone somewhere and that he is part of bringing it home.

**The catalogue**

Duele, Amnesia, Suéltenla, Alma Rota, Los Niños, Navidad Sin Ti, Te Lo Agradezco, Así Se Vende with the Puerto Rican Tito El Bambino, and a run of visualizers — Que Seas Feliz, Sin Alma y Sin Bandera, Me Diste La Espalda, Que Fue Lo Que Me Hiciste, Me Dejaste, Amor Artesanal, La Verdadera Mentira and one simply called IA.

Naming a bachata after artificial intelligence is the kind of thing a twenty-three-year-old does and a fifty-year-old does not, and it sits on the same record as songs that could have been written in 1994. That is roughly the whole shape of his music.

**Arenas**

He has a United States tour announced for 2026 with dates at arenas in Orlando and Reading, and he has played festivals in Aruba. A Univision programme ran a long feature on him this year and it went far beyond the usual music segment.

Bachata has been exportable for two decades, but it exports through New York and through the dance-school circuit in Europe. A singer going from a Dominican corner shop to an American arena in two years, on straight bachata with no crossover and no English, is a different route and a newer one.',
       bio_es = 'Dalvin la Melodía, de nombre Dalvin Antonio Núñez Vargas, es cantante y compositor de bachata dominicano. Tiene veintitrés años, salió de un colmadón, y ahora mismo está llenando arenas en Estados Unidos.

**El colmadón**

Un colmadón es una tienda de esquina con una bocina afuera y sillas plásticas en la acera, y es donde de verdad vive la bachata. Ni la radio ni la sala de conciertos: la tienda de la esquina, a todo volumen, todo el día, todos los días, con la calle entera de público quiera o no.

Él trabajó en uno. Un periódico nacional lo puso de titular cuando escribió sobre él, y con razón: todo bachatero aprende el repertorio de la bocina de un colmadón, y él lo aprendió desde detrás del mostrador.

**Primero las canciones de otros**

Llegó haciendo versiones, que es la ruta corriente y es además una declaración sobre lo que él cree que es la bachata. Pensando en Ella es su homenaje a Yoskar Sarante, y lo ha dicho sin rodeos cada vez que la ha publicado. Chiquilla Bonita y Tesoro Perdido son el mismo instinto: agarrar las canciones que el país ya se sabe y cantarlas como si fueran nuevas.

Después vino Por Ti, su primera canción propia, y detrás Mi Reina, que es el disco que lo puso donde está. Desde entonces todo es suyo.

Ese orden importa. Un cantante joven que primero versiona los clásicos se está metiendo en una fila en vez de anunciarse como una ruptura, y el álbum que terminó haciendo se llama La Bachata Volvió. Está argumentando que el género se había ido a alguna parte y que él es parte de traerlo de vuelta.

**El catálogo**

Duele, Amnesia, Suéltenla, Alma Rota, Los Niños, Navidad Sin Ti, Te Lo Agradezco, Así Se Vende con el puertorriqueño Tito El Bambino, y una tanda de visualizers: Que Seas Feliz, Sin Alma y Sin Bandera, Me Diste La Espalda, Que Fue Lo Que Me Hiciste, Me Dejaste, Amor Artesanal, La Verdadera Mentira y una llamada simplemente IA.

Ponerle a una bachata el nombre de la inteligencia artificial es cosa que hace alguien de veintitrés años y no alguien de cincuenta, y está en el mismo disco que canciones que podrían haberse escrito en 1994. Esa es más o menos la forma completa de su música.

**Arenas**

Tiene anunciada una gira por Estados Unidos para 2026 con fechas en arenas de Orlando y de Reading, y ha tocado festivales en Aruba. Un programa de Univisión le hizo este año un reportaje largo que se salió bastante del segmento musical de costumbre.

La bachata lleva dos décadas siendo exportable, pero exporta por Nueva York y por el circuito de escuelas de baile de Europa. Que un cantante pase de un colmadón dominicano a una arena estadounidense en dos años, con bachata pelada, sin cruce y sin inglés, es otra ruta y es más nueva.',
       updated_at = now()
 WHERE slug = 'dalvin-la-melodia';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dalvin-la-melodia')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dalvin-la-melodia')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Dalvin la Melodía, born Dalvin Antonio Núñez Vargas, is a Dominican bachata singer and songwriter. He is twenty-three, he came out of a colmadón, and he is currently filling arenas in the United States.","type":"text"}]},{"type":"paragraph","content":[{"text":"The colmadón","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"A colmadón is a corner shop with a speaker outside and plastic chairs on the pavement, and it is where bachata actually lives. Not the radio, not the concert hall — the shop on the corner, at volume, all day, every day, with the whole street as an audience whether it wants to be or not.","type":"text"}]},{"type":"paragraph","content":[{"text":"He worked in one. A national newspaper made that the headline when it wrote about him, and it deserved to be: every bachatero learns the repertoire from a colmadón speaker, and he learned it from behind the counter.","type":"text"}]},{"type":"paragraph","content":[{"text":"Singing other people’s songs first","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He arrived doing covers, which is the ordinary route and it is also a statement about what he thinks bachata is. Pensando en Ella is his tribute to ","type":"text"},{"type":"artistReference","attrs":{"artistId":"a92fa7a6-842f-44fe-95cb-103c3c38f903","displayText":"Yoskar Sarante","occurrenceId":"7f72de90-5d34-4097-9bf7-bbb1a09f8a93"}},{"text":", and he has said so plainly every time he has released it. Chiquilla Bonita and Tesoro Perdido are the same instinct: take the songs the country already knows and sing them like they are new.","type":"text"}]},{"type":"paragraph","content":[{"text":"Then came Por Ti, his first original, and after it Mi Reina, which is the record that did it. Everything since has been his own.","type":"text"}]},{"type":"paragraph","content":[{"text":"That order matters. A young singer who covers the classics first is putting himself in a line rather than announcing himself as a break with one, and the album he eventually made is called La Bachata Volvió — bachata came back. He is arguing that the genre had gone somewhere and that he is part of bringing it home.","type":"text"}]},{"type":"paragraph","content":[{"text":"The catalogue","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Duele, Amnesia, Suéltenla, Alma Rota, Los Niños, Navidad Sin Ti, Te Lo Agradezco, Así Se Vende with the Puerto Rican Tito El Bambino, and a run of visualizers — Que Seas Feliz, Sin Alma y Sin Bandera, Me Diste La Espalda, Que Fue Lo Que Me Hiciste, Me Dejaste, Amor Artesanal, La Verdadera Mentira and one simply called IA.","type":"text"}]},{"type":"paragraph","content":[{"text":"Naming a bachata after artificial intelligence is the kind of thing a twenty-three-year-old does and a fifty-year-old does not, and it sits on the same record as songs that could have been written in 1994. That is roughly the whole shape of his music.","type":"text"}]},{"type":"paragraph","content":[{"text":"Arenas","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He has a United States tour announced for 2026 with dates at arenas in Orlando and Reading, and he has played festivals in Aruba. A Univision programme ran a long feature on him this year and it went far beyond the usual music segment.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bachata has been exportable for two decades, but it exports through New York and through the dance-school circuit in Europe. A singer going from a Dominican corner shop to an American arena in two years, on straight bachata with no crossover and no English, is a different route and a newer one.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'dalvin-la-melodia'), 5)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Dalvin la Melodía, de nombre Dalvin Antonio Núñez Vargas, es cantante y compositor de bachata dominicano. Tiene veintitrés años, salió de un colmadón, y ahora mismo está llenando arenas en Estados Unidos.","type":"text"}]},{"type":"paragraph","content":[{"text":"El colmadón","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Un colmadón es una tienda de esquina con una bocina afuera y sillas plásticas en la acera, y es donde de verdad vive la bachata. Ni la radio ni la sala de conciertos: la tienda de la esquina, a todo volumen, todo el día, todos los días, con la calle entera de público quiera o no.","type":"text"}]},{"type":"paragraph","content":[{"text":"Él trabajó en uno. Un periódico nacional lo puso de titular cuando escribió sobre él, y con razón: todo bachatero aprende el repertorio de la bocina de un colmadón, y él lo aprendió desde detrás del mostrador.","type":"text"}]},{"type":"paragraph","content":[{"text":"Primero las canciones de otros","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Llegó haciendo versiones, que es la ruta corriente y es además una declaración sobre lo que él cree que es la bachata. Pensando en Ella es su homenaje a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"a92fa7a6-842f-44fe-95cb-103c3c38f903","displayText":"Yoskar Sarante","occurrenceId":"f7604fa4-b541-4ded-862e-8357e3c9a1c1"}},{"text":", y lo ha dicho sin rodeos cada vez que la ha publicado. Chiquilla Bonita y Tesoro Perdido son el mismo instinto: agarrar las canciones que el país ya se sabe y cantarlas como si fueran nuevas.","type":"text"}]},{"type":"paragraph","content":[{"text":"Después vino Por Ti, su primera canción propia, y detrás Mi Reina, que es el disco que lo puso donde está. Desde entonces todo es suyo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ese orden importa. Un cantante joven que primero versiona los clásicos se está metiendo en una fila en vez de anunciarse como una ruptura, y el álbum que terminó haciendo se llama La Bachata Volvió. Está argumentando que el género se había ido a alguna parte y que él es parte de traerlo de vuelta.","type":"text"}]},{"type":"paragraph","content":[{"text":"El catálogo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Duele, Amnesia, Suéltenla, Alma Rota, Los Niños, Navidad Sin Ti, Te Lo Agradezco, Así Se Vende con el puertorriqueño Tito El Bambino, y una tanda de visualizers: Que Seas Feliz, Sin Alma y Sin Bandera, Me Diste La Espalda, Que Fue Lo Que Me Hiciste, Me Dejaste, Amor Artesanal, La Verdadera Mentira y una llamada simplemente IA.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ponerle a una bachata el nombre de la inteligencia artificial es cosa que hace alguien de veintitrés años y no alguien de cincuenta, y está en el mismo disco que canciones que podrían haberse escrito en 1994. Esa es más o menos la forma completa de su música.","type":"text"}]},{"type":"paragraph","content":[{"text":"Arenas","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Tiene anunciada una gira por Estados Unidos para 2026 con fechas en arenas de Orlando y de Reading, y ha tocado festivales en Aruba. Un programa de Univisión le hizo este año un reportaje largo que se salió bastante del segmento musical de costumbre.","type":"text"}]},{"type":"paragraph","content":[{"text":"La bachata lleva dos décadas siendo exportable, pero exporta por Nueva York y por el circuito de escuelas de baile de Europa. Que un cantante pase de un colmadón dominicano a una arena estadounidense en dos años, con bachata pelada, sin cruce y sin inglés, es otra ruta y es más nueva.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'dalvin-la-melodia'), 6)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dalvin-la-melodia') AND locale = 'en'), '7f72de90-5d34-4097-9bf7-bbb1a09f8a93', 'artist', 'a92fa7a6-842f-44fe-95cb-103c3c38f903');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dalvin-la-melodia') AND locale = 'es'), 'f7604fa4-b541-4ded-862e-8357e3c9a1c1', 'artist', 'a92fa7a6-842f-44fe-95cb-103c3c38f903');

COMMIT;
