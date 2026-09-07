BEGIN;

-- Rewrite the catalogue entry for Pierre Carbuccia.
--
-- Pierre Carbuccia. Filler in English, nothing in Spanish, no genre, no gender,
-- no name parts -- and a birthplace that was the import default and is wrong.
--
-- THE NATIONALITY QUESTION IS SETTLED, AND HE STAYS. He was born in Puerto Rico
-- and raised in the Dominican Republic. That is the same case as Felix Cumbe,
-- Silvio Mora and Dominic, all of whom are in the catalogue: the test is
-- belonging to Dominican music, not the place of birth. He passes it on his own
-- account -- every bio he writes for himself, on Bandcamp, on SoundCloud and
-- for Portland Center Stage, says "from Santo Domingo, Dominican Republic"; he
-- names bolero and merengue as the ground he builds on; his side project's
-- debut single was on rotation on two Dominican radio stations; and he named
-- the project itself Juracan, after the Taino storm.
--
-- OVERWRITTEN, and the old values were the import default: birth_place "Santo
-- Domingo" -> "Puerto Rico", province "Distrito Nacional" -> "Born Abroad",
-- which is the sentinel this catalogue already uses for Dominic, Felix Cumbe
-- and Silvio Mora. No source names the Puerto Rican town.
--
-- GENRE, editor's call: primary_genre was null and is set to fusion. His own
-- website carries the tagline "ambient bolero"; The Deli reports that he cites
-- bolero and merengue as inspirations; NPR's Alt.Latino calls it an
-- electronic/acoustic mash-up; New Noise says no single style defines the
-- album. genres gets bolero, electronic and rock alongside it. Change the
-- primary if fusion is wrong.
--
-- SOURCES: his own site, juracan.studio, and its updates page, which is where
-- the dates come from. Portland Center Stage's artist page: self-taught
-- multi-instrumentalist, singer-songwriter and producer from Santo Domingo;
-- pronouns he/el; Nino (2018) and Jarineo (2020); the 2023 singles Tenerte
-- Miedo and Al Despertar; bass credits for Hedwig and the Angry Inch, tick,
-- tick... BOOM! and HAIR. Bandcamp for the full release list. HighClouds, who
-- premiered the lead single Moraleja on 16 November 2018 and described him as
-- "a Puertorrican multi-instrumentalist who grew up in the Dominican Republic
-- and now resides in Portland". Remezcla's Richard Villegas, who put Moraleja
-- in Songs of the Week and called him "the Dominican-Puerto Rican songwriter".
-- NPR Alt.Latino's Felix Contreras, who listed Moraleja among his favourite
-- Latin songs on 21 November 2018 and played it on the podcast the following
-- day. The Deli Portland, which nominated Juracan emerging artist of the month.
-- New Noise Magazine, Independent Music News and BTR Today on Jarineo, which
-- Anima Recordings released on cassette and CD, mastered by Eric Leavell at
-- Husk Recording with artwork by Dylan Garrett Smith.
--
-- NOT WRITTEN: his injuries, his recoveries and everything else off the
-- bandstand, which he writes about openly on his own site and which is not
-- musical work.
--
-- FLAGGED, not changed: the stored Instagram handle is pcarbuccia, his personal
-- account. He directs readers to @juracan.studio for the music. Whichever is
-- the more active account is the one that belongs in the field, and that needs
-- checking before the value is touched.
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
       name = 'Pierre Carbuccia',
       sort_name = 'Carbuccia, Pierre',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'instrumentalist',
       primary_genre = 'fusion',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Puerto Rico',
       province = 'Born Abroad',
       first_name = 'Pierre',
       middle_name = NULL,
       last_name = 'Carbuccia',
       second_last_name = 'Abbott',
       stage_name = NULL,
       aliases = ARRAY['Pierre Carbuccia Abbott', 'Juracán']::text[],
       occupations = '["songwriter","producer","singer","bassist","guitarist"]'::jsonb,
       instruments = ARRAY['guitar', 'bass', 'keyboards', 'synthesizer']::text[],
       genres = ARRAY['bolero', 'electronic', 'rock']::text[],
       artist_tags = ARRAY['secular', 'diaspora']::text[],
       website = 'https://www.juracan.studio',
       youtube = NULL,
       facebook = NULL,
       instagram = 'pcarbuccia',
       disambiguation = 'Dominican multi-instrumentalist and producer behind the project juracán, based in Portland, Oregon',
       bio_en = 'Pierre Carbuccia is a self-taught Dominican multi-instrumentalist, songwriter and producer. Since December 2015 he has released his own music as juracán — named for the Taíno storm — and he describes what he makes as ambient bolero.

**Where the sound comes from**

He was born in Puerto Rico and grew up in the Dominican Republic, and he takes the second of those as his address: every biography he writes for himself begins in Santo Domingo. He absorbed Afro-Caribbean music first and went looking for rock afterwards, and the result is a body of work in which bolero and merengue are the underlying grammar and the surface is guitars, synthesisers and reverb.

He plays nearly all of it himself — guitar, bass, keys, drums programmed and sung parts stacked — which is what self-taught multi-instrumentalist means in practice: one person in a room deciding everything.

**Niño**

The first record arrived in December 2018, with Moraleja as its lead single. It is the only track on it with lyrics, and the question it asks is when we are going to accept that nobody has the answer to anything. By the end of the song the vocal lines are so layered over each other that the words dissolve into the guitars, which is the point.

It travelled further than a debut usually does. NPR’s Alt.Latino named it one of the best Latin songs of that week; Remezcla put it in Songs of the Week; a Portland magazine nominated the project emerging artist of the month.

**Jarineo**

The second album came out on 31 July 2020 through Anima Recordings, on cassette and CD, mastered by Eric Leavell at Husk Recording with artwork by Dylan Garrett Smith. Its title is the Dominican word for a fine, persistent drizzle, and the record is built around that image — Flying Again, En Casa and Psychotherapy went out ahead of it.

Reviewers could not agree on what genre it was, which is the most accurate description of it available: ambient passages, piano, indie-folk rhythm and post-rock all inside one running order.

**Singles, theatre and other people’s bands**

From 2021 he moved to releasing singles and let the voice come forward: You Said, Lecciones, Dame Todo, My Mind, Russian Puppet, Tenerte Miedo, Al Despertar, Ya Te Olvidé, Cada Vez. Six of them came out in 2023 alone. He has said the singing is the part he was most self-conscious about and has grown to love.

He also works as a hired player. He is the bassist in Flood Peak, a Portland sludge band, and he has played bass for Portland Center Stage in Hedwig and the Angry Inch, tick, tick… BOOM!, HAIR and Passing Strange — in Hedwig on stage in the role of Jacek, playing and singing harmonies. He co-writes and co-produces for Caribe Norwé, whose debut single Drive With Me was in rotation on two Dominican radio stations.

**pierretronic**

The most recent release is an EP of twelve short instrumental loops, put out through Bandcamp in December 2025 and on the streaming services days later, with cover art by Jonas Angelet.

He made it by deliberately putting down the guitar and the bass and working only with synthesisers and beats, taking soundtracks, video games, downtempo, ambient and IDM as models, and mixing and mastering it himself in order to learn how.',
       bio_es = 'Pierre Carbuccia es un multiinstrumentista, compositor y productor dominicano, autodidacta. Desde diciembre de 2015 publica su propia música como juracán —por la tormenta taína— y describe lo que hace como bolero ambiental.

**De dónde sale el sonido**

Nació en Puerto Rico y se crió en República Dominicana, y toma lo segundo como su dirección: todas las biografías que escribe de sí mismo empiezan en Santo Domingo. Primero absorbió la música afrocaribeña y después salió a buscar el rock, y el resultado es una obra donde el bolero y el merengue son la gramática de abajo y la superficie es guitarras, sintetizadores y reverberación.

Toca él casi todo —guitarra, bajo, teclados, baterías programadas y voces montadas unas sobre otras—, que es lo que significa en la práctica multiinstrumentista autodidacta: una persona sola en un cuarto decidiéndolo todo.

**Niño**

El primer disco salió en diciembre de 2018, con Moraleja de sencillo. Es el único tema con letra, y la pregunta que hace es cuándo vamos a entender que nadie tiene la respuesta a nada. Al final de la canción las líneas de voz están tan encimadas unas sobre otras que las palabras se disuelven en las guitarras, y de eso se trata.

Llegó más lejos de lo que suele llegar un debut. Alt.Latino de NPR la puso entre las mejores canciones latinas de aquella semana; Remezcla la metió en sus canciones de la semana; una revista de Portland nominó el proyecto a artista emergente del mes.

**Jarineo**

El segundo álbum salió el 31 de julio de 2020 por Anima Recordings, en casete y en CD, masterizado por Eric Leavell en Husk Recording y con arte de Dylan Garrett Smith. El título es la palabra dominicana para la llovizna fina y terca, y el disco está construido sobre esa imagen: Flying Again, En Casa y Psychotherapy salieron por delante.

Los reseñistas no se pusieron de acuerdo sobre qué género era, que es la descripción más exacta que hay de él: pasajes ambientales, piano, ritmo de folk indie y post-rock dentro del mismo orden de pistas.

**Sencillos, teatro y bandas ajenas**

Desde 2021 pasó a sacar sencillos y dejó que la voz se adelantara: You Said, Lecciones, Dame Todo, My Mind, Russian Puppet, Tenerte Miedo, Al Despertar, Ya Te Olvidé, Cada Vez. Seis de ellos salieron solo en 2023. Ha dicho que cantar era la parte que más vergüenza le daba y que ha llegado a quererla.

También trabaja de músico contratado. Es el bajista de Flood Peak, una banda de sludge de Portland, y ha tocado el bajo para Portland Center Stage en Hedwig and the Angry Inch, tick, tick… BOOM!, HAIR y Passing Strange —en Hedwig sobre el escenario, en el papel de Jacek, tocando y haciendo coros—. Coescribe y coproduce para Caribe Norwé, cuyo sencillo de estreno, Drive With Me, estuvo en rotación en dos emisoras dominicanas.

**pierretronic**

Lo más reciente es un EP de doce piezas instrumentales cortas y en bucle, publicado por Bandcamp en diciembre de 2025 y en las plataformas días después, con portada de Jonas Angelet.

Lo hizo soltando a propósito la guitarra y el bajo y trabajando solo con sintetizadores y ritmos, tomando como modelo las bandas sonoras, los videojuegos, el downtempo, el ambient y el IDM, y mezclándolo y masterizándolo él mismo para aprender a hacerlo.',
       updated_at = now()
 WHERE slug = 'pierre-carbuccia';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'pierre-carbuccia')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'pierre-carbuccia')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Pierre Carbuccia is a self-taught Dominican multi-instrumentalist, songwriter and producer. Since December 2015 he has released his own music as juracán — named for the Taíno storm — and he describes what he makes as ambient bolero.","type":"text"}]},{"type":"paragraph","content":[{"text":"Where the sound comes from","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He was born in Puerto Rico and grew up in the Dominican Republic, and he takes the second of those as his address: every biography he writes for himself begins in Santo Domingo. He absorbed Afro-Caribbean music first and went looking for rock afterwards, and the result is a body of work in which bolero and merengue are the underlying grammar and the surface is guitars, synthesisers and reverb.","type":"text"}]},{"type":"paragraph","content":[{"text":"He plays nearly all of it himself — guitar, bass, keys, drums programmed and sung parts stacked — which is what self-taught multi-instrumentalist means in practice: one person in a room deciding everything.","type":"text"}]},{"type":"paragraph","content":[{"text":"Niño","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The first record arrived in December 2018, with Moraleja as its lead single. It is the only track on it with lyrics, and the question it asks is when we are going to accept that nobody has the answer to anything. By the end of the song the vocal lines are so layered over each other that the words dissolve into the guitars, which is the point.","type":"text"}]},{"type":"paragraph","content":[{"text":"It travelled further than a debut usually does. NPR’s Alt.Latino named it one of the best Latin songs of that week; Remezcla put it in Songs of the Week; a Portland magazine nominated the project emerging artist of the month.","type":"text"}]},{"type":"paragraph","content":[{"text":"Jarineo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The second album came out on 31 July 2020 through Anima Recordings, on cassette and CD, mastered by Eric Leavell at Husk Recording with artwork by Dylan Garrett Smith. Its title is the Dominican word for a fine, persistent drizzle, and the record is built around that image — Flying Again, En Casa and Psychotherapy went out ahead of it.","type":"text"}]},{"type":"paragraph","content":[{"text":"Reviewers could not agree on what genre it was, which is the most accurate description of it available: ambient passages, piano, indie-folk rhythm and post-rock all inside one running order.","type":"text"}]},{"type":"paragraph","content":[{"text":"Singles, theatre and other people’s bands","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"From 2021 he moved to releasing singles and let the voice come forward: You Said, Lecciones, Dame Todo, My Mind, Russian Puppet, Tenerte Miedo, Al Despertar, Ya Te Olvidé, Cada Vez. Six of them came out in 2023 alone. He has said the singing is the part he was most self-conscious about and has grown to love.","type":"text"}]},{"type":"paragraph","content":[{"text":"He also works as a hired player. He is the bassist in Flood Peak, a Portland sludge band, and he has played bass for Portland Center Stage in Hedwig and the Angry Inch, tick, tick… BOOM!, HAIR and Passing Strange — in Hedwig on stage in the role of Jacek, playing and singing harmonies. He co-writes and co-produces for Caribe Norwé, whose debut single Drive With Me was in rotation on two Dominican radio stations.","type":"text"}]},{"type":"paragraph","content":[{"text":"pierretronic","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The most recent release is an EP of twelve short instrumental loops, put out through Bandcamp in December 2025 and on the streaming services days later, with cover art by Jonas Angelet.","type":"text"}]},{"type":"paragraph","content":[{"text":"He made it by deliberately putting down the guitar and the bass and working only with synthesisers and beats, taking soundtracks, video games, downtempo, ambient and IDM as models, and mixing and mastering it himself in order to learn how.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'pierre-carbuccia'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Pierre Carbuccia es un multiinstrumentista, compositor y productor dominicano, autodidacta. Desde diciembre de 2015 publica su propia música como juracán —por la tormenta taína— y describe lo que hace como bolero ambiental.","type":"text"}]},{"type":"paragraph","content":[{"text":"De dónde sale el sonido","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Nació en Puerto Rico y se crió en República Dominicana, y toma lo segundo como su dirección: todas las biografías que escribe de sí mismo empiezan en Santo Domingo. Primero absorbió la música afrocaribeña y después salió a buscar el rock, y el resultado es una obra donde el bolero y el merengue son la gramática de abajo y la superficie es guitarras, sintetizadores y reverberación.","type":"text"}]},{"type":"paragraph","content":[{"text":"Toca él casi todo —guitarra, bajo, teclados, baterías programadas y voces montadas unas sobre otras—, que es lo que significa en la práctica multiinstrumentista autodidacta: una persona sola en un cuarto decidiéndolo todo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Niño","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El primer disco salió en diciembre de 2018, con Moraleja de sencillo. Es el único tema con letra, y la pregunta que hace es cuándo vamos a entender que nadie tiene la respuesta a nada. Al final de la canción las líneas de voz están tan encimadas unas sobre otras que las palabras se disuelven en las guitarras, y de eso se trata.","type":"text"}]},{"type":"paragraph","content":[{"text":"Llegó más lejos de lo que suele llegar un debut. Alt.Latino de NPR la puso entre las mejores canciones latinas de aquella semana; Remezcla la metió en sus canciones de la semana; una revista de Portland nominó el proyecto a artista emergente del mes.","type":"text"}]},{"type":"paragraph","content":[{"text":"Jarineo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El segundo álbum salió el 31 de julio de 2020 por Anima Recordings, en casete y en CD, masterizado por Eric Leavell en Husk Recording y con arte de Dylan Garrett Smith. El título es la palabra dominicana para la llovizna fina y terca, y el disco está construido sobre esa imagen: Flying Again, En Casa y Psychotherapy salieron por delante.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los reseñistas no se pusieron de acuerdo sobre qué género era, que es la descripción más exacta que hay de él: pasajes ambientales, piano, ritmo de folk indie y post-rock dentro del mismo orden de pistas.","type":"text"}]},{"type":"paragraph","content":[{"text":"Sencillos, teatro y bandas ajenas","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Desde 2021 pasó a sacar sencillos y dejó que la voz se adelantara: You Said, Lecciones, Dame Todo, My Mind, Russian Puppet, Tenerte Miedo, Al Despertar, Ya Te Olvidé, Cada Vez. Seis de ellos salieron solo en 2023. Ha dicho que cantar era la parte que más vergüenza le daba y que ha llegado a quererla.","type":"text"}]},{"type":"paragraph","content":[{"text":"También trabaja de músico contratado. Es el bajista de Flood Peak, una banda de sludge de Portland, y ha tocado el bajo para Portland Center Stage en Hedwig and the Angry Inch, tick, tick… BOOM!, HAIR y Passing Strange —en Hedwig sobre el escenario, en el papel de Jacek, tocando y haciendo coros—. Coescribe y coproduce para Caribe Norwé, cuyo sencillo de estreno, Drive With Me, estuvo en rotación en dos emisoras dominicanas.","type":"text"}]},{"type":"paragraph","content":[{"text":"pierretronic","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Lo más reciente es un EP de doce piezas instrumentales cortas y en bucle, publicado por Bandcamp en diciembre de 2025 y en las plataformas días después, con portada de Jonas Angelet.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo hizo soltando a propósito la guitarra y el bajo y trabajando solo con sintetizadores y ritmos, tomando como modelo las bandas sonoras, los videojuegos, el downtempo, el ambient y el IDM, y mezclándolo y masterizándolo él mismo para aprender a hacerlo.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'pierre-carbuccia'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
