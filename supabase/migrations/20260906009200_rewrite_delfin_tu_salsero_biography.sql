BEGIN;

-- Rewrite the catalogue entry for Delfín Tu Salsero.
--
-- Delfín Tu Salsero. Filler in English, nothing in Spanish, no occupations, no
-- genres, no disambiguation, no website -- and a filler paragraph that
-- contradicted its own row twice, saying "Born in 1985 in Santo Domingo" over a
-- row that read 1981 and Cotuí.
--
-- PROVINCE CORRECTED, AND THE SOURCE IS HIM. The row paired birth_place "Cotuí"
-- with province "Distrito Nacional", which is the same systematic error already
-- swept out of the table twice. Cotuí is the capital of Sánchez Ramírez, and the
-- biography he wrote himself on his own YouTube channel says so in as many
-- words: "nacido ... en la República Dominicana, Sánchez Ramírez, en la ciudad
-- de Cotuí". province goes to Sánchez Ramírez.
--
-- A BIRTH DAY THAT THREE SOURCES GIVE THREE WAYS, AND WHY THE ROW STANDS.
--
--   24 July 1981  -- his own website, his own Spotify artist biography, and the
--                    value already stored in the row
--   21 July 1981  -- his own YouTube channel description, in both languages
--   19 July 1981  -- Apple Music's metadata field
--
-- The year and the month are unanimous. Two of the three sources for the 24th
-- are his own, and the row already held it, so nothing is overwritten. The
-- conflict is recorded here rather than resolved, because it cannot be resolved
-- from outside: the man has published two different days about himself.
--
-- THE INSTAGRAM HANDLE IN THE ROW IS THE RIGHT ONE, AND IT WAS WORTH CHECKING.
-- His YouTube About panel links instagram.com/delfintusalsero.official, while
-- the row stores delfintusalseroreal. Opening both settles it: the stored one is
-- live and its bio says "Official Account of Delfin Tu Salsero on Instagram",
-- and the one his own channel links returns nothing. The row is left alone.
--
-- FILLED: first_name gains its accent, Delfin -> Delfín, which is how he spells
-- it himself everywhere. occupations composer. website, from the link on his own
-- channel. aliases gains Delfin El Salsero, which is the name on his Twitter
-- account; the stored "Delfin Salsa" is kept rather than replaced.
--
-- genres IS DELIBERATELY LEFT EMPTY. He calls his own music salsa romántica and
-- that is plainly what it is, but `salsa-romantica` is inactive in the genres
-- table, and none of the active subgenres -- salsa-dura, salsa-dominicana,
-- salsa-classic -- describes it. An approximation would be worse than nothing.
-- If the editor wants salsa-romantica reactivated, this is a record that would
-- use it.
--
-- NOT WRITTEN. His own website publishes his family situation and the deaths of
-- his parents, and his Instagram bio names his family role. Personal life is
-- outside what this record keeps and none of it appears here. His website also
-- says he is a believer and puts God first in his projects; the artist_tags
-- value stays "secular", which describes the music and not the man, and nothing
-- is written about his faith. No follower counts and no listener figures.
--
-- THE DAY JOBS ARE IN, AND THAT IS A DELIBERATE DISTINCTION. He publishes on his
-- own site that he holds three occupations -- electrician, singer, and hotel
-- worker -- and that the hotel work is what pays. That is not private life; it
-- is the economic condition under which the records get made, and it is the most
-- honest thing in the entry.
--
-- SOURCES: his own YouTube channel description, in Spanish and English, for the
-- legal name, the province, the two jobs, the 2014 start and the bars and
-- birthday parties. His own website at delfintusalsero.wixsite.com, for the birth
-- date, for salsa romántica and for the list of nine song titles. His own
-- Spotify artist biography, for the birth date, for his choosing the commercial
-- name himself, and for a tenth title, Payaso Soy. Apple Music, for the release
-- years of the five singles that are on it. His own Instagram.
--
-- NOT LINKED: nobody. He names no collaborators anywhere and this entry carries
-- no references. "Lino Fino" appears as a title on his channel and could not be
-- established as a person rather than a song, so it is not treated as a credit.
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
       name = 'Delfín Tu Salsero',
       sort_name = 'Marte Acosta, Delfín Antonio',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'salsa',
       date_of_birth = '1981-07-24',
       birth_year = 1981,
       date_of_death = NULL,
       birth_place = 'Cotuí',
       province = 'Sánchez Ramírez',
       first_name = 'Delfín',
       middle_name = 'Antonio',
       last_name = 'Marte',
       second_last_name = 'Acosta',
       stage_name = 'Delfín Tu Salsero',
       aliases = ARRAY['Delfin Salsa', 'Delfin El Salsero']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = 'https://delfintusalsero.wixsite.com/officialweb',
       youtube = '@delfintusalserooficial',
       facebook = 'DelfinTuSalsero',
       instagram = 'delfintusalseroreal',
       disambiguation = 'Salsa singer-songwriter from Cotuí; Andas Pregonando, Tu Cara de Ángel',
       bio_en = 'Delfín Tu Salsero, born Delfín Antonio Marte Acosta, is a Dominican salsa singer and songwriter. He chose the stage name himself, and it is a plain description of the job: your salsero, the one who turns up.

**Cotuí**

He is from Cotuí, the capital of Sánchez Ramírez, in the mining country of the central Cibao — not a place with a salsa scene, and a long way from the Caribbean cities where the genre is manufactured.

He was listening to romantic music from adolescence and writing songs early, and then he did what almost everyone in that position does, which is to get on with earning a living. He trained as an electrician and took work in a hotel.

**Starting at thirty-three**

He launched himself as an artist in 2014, in his thirties, and picked salsa deliberately rather than falling into it — his own account is that he went looking for the genre that fitted what he wanted to sing, and settled on this one.

The first engagements were bars, birthday parties and small social clubs. That is the actual entry level of Dominican music, and it is where the overwhelming majority of the country’s working singers spend their careers, unrecorded by anybody.

He kept both jobs. The hotel work is what pays, and the electrician’s trade is still on the list of what he does — three occupations, one of which is singing. There is no version of his story in which the music supported him first.

**The songs**

El Control Del Penal, Si Usted Supiera Señora, Hasta Luego, Amor Amor, Payaso Soy. Then the ones that reached the streaming services: Andas Pregonando, Te Recordaré, Margarita Ruleta Del Destino, De Que Te Valió Dejarme and Tu Cara de Ángel.

They are salsa romántica — the melodic, unhurried strain of the genre, sung rather than shouted, built for a radio station in a provincial city rather than for a dancefloor. Dominican stations have played them.

**What a catalogue is for**

An artist at this scale is exactly the kind who disappears from the record. There is no press coverage, no award, no label with an archive, and everything documented above he wrote about himself on pages he pays for and maintains.

Dominican salsa is not a small tradition, and it is not made only by the people whose names travel. It is also made by a man in Cotuí who finishes a shift and goes to sing.',
       bio_es = 'Delfín Tu Salsero, de nombre Delfín Antonio Marte Acosta, es cantante y compositor de salsa dominicano. El nombre artístico lo escogió él, y es una descripción llana del oficio: tu salsero, el que aparece.

**Cotuí**

Es de Cotuí, la capital de Sánchez Ramírez, en la zona minera del Cibao central: no es un lugar con escena salsera, y queda lejísimos de las ciudades caribeñas donde el género se fabrica.

Desde la adolescencia oía música romántica y escribía canciones temprano, y después hizo lo que hace casi todo el que está en esa posición, que es ponerse a ganarse la vida. Se hizo electricista y entró a trabajar en un hotel.

**Arrancar a los treinta y tres**

Se lanzó como artista en 2014, pasados los treinta, y escogió la salsa a propósito y no por casualidad: su propio relato es que fue a buscar el género que le calzaba a lo que quería cantar, y se quedó con este.

Las primeras actividades fueron bares, fiestas de cumpleaños y centros sociales pequeños. Ese es el nivel de entrada real de la música dominicana, y es donde pasa la carrera entera la enorme mayoría de los cantantes que trabajan en el país, sin que nadie los registre.

No soltó los otros dos trabajos. Lo del hotel es lo que paga, y el oficio de electricista sigue en la lista de lo que hace: tres ocupaciones, una de las cuales es cantar. No hay una versión de esta historia en que la música lo sostuviera primero.

**Las canciones**

El Control Del Penal, Si Usted Supiera Señora, Hasta Luego, Amor Amor, Payaso Soy. Después las que llegaron a las plataformas: Andas Pregonando, Te Recordaré, Margarita Ruleta Del Destino, De Que Te Valió Dejarme y Tu Cara de Ángel.

Son salsa romántica: la vertiente melódica y sin apuro del género, cantada y no gritada, hecha para una emisora de una ciudad del interior antes que para una pista. Las estaciones dominicanas se las han puesto.

**Para qué sirve un registro**

Un artista de este tamaño es justamente el que se le pierde a la historia. No hay prensa, no hay premio, no hay sello con archivo, y todo lo documentado aquí lo escribió él mismo en páginas que paga y mantiene.

La salsa dominicana no es una tradición pequeña, y no la hace solamente la gente cuyo nombre viaja. También la hace un señor en Cotuí que sale de un turno y se va a cantar.',
       updated_at = now()
 WHERE slug = 'delfin-tu-salsero';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'delfin-tu-salsero')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'delfin-tu-salsero')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Delfín Tu Salsero, born Delfín Antonio Marte Acosta, is a Dominican salsa singer and songwriter. He chose the stage name himself, and it is a plain description of the job: your salsero, the one who turns up.","type":"text"}]},{"type":"paragraph","content":[{"text":"Cotuí","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He is from Cotuí, the capital of Sánchez Ramírez, in the mining country of the central Cibao — not a place with a salsa scene, and a long way from the Caribbean cities where the genre is manufactured.","type":"text"}]},{"type":"paragraph","content":[{"text":"He was listening to romantic music from adolescence and writing songs early, and then he did what almost everyone in that position does, which is to get on with earning a living. He trained as an electrician and took work in a hotel.","type":"text"}]},{"type":"paragraph","content":[{"text":"Starting at thirty-three","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He launched himself as an artist in 2014, in his thirties, and picked salsa deliberately rather than falling into it — his own account is that he went looking for the genre that fitted what he wanted to sing, and settled on this one.","type":"text"}]},{"type":"paragraph","content":[{"text":"The first engagements were bars, birthday parties and small social clubs. That is the actual entry level of Dominican music, and it is where the overwhelming majority of the country’s working singers spend their careers, unrecorded by anybody.","type":"text"}]},{"type":"paragraph","content":[{"text":"He kept both jobs. The hotel work is what pays, and the electrician’s trade is still on the list of what he does — three occupations, one of which is singing. There is no version of his story in which the music supported him first.","type":"text"}]},{"type":"paragraph","content":[{"text":"The songs","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El Control Del Penal, Si Usted Supiera Señora, Hasta Luego, Amor Amor, Payaso Soy. Then the ones that reached the streaming services: Andas Pregonando, Te Recordaré, Margarita Ruleta Del Destino, De Que Te Valió Dejarme and Tu Cara de Ángel.","type":"text"}]},{"type":"paragraph","content":[{"text":"They are salsa romántica — the melodic, unhurried strain of the genre, sung rather than shouted, built for a radio station in a provincial city rather than for a dancefloor. Dominican stations have played them.","type":"text"}]},{"type":"paragraph","content":[{"text":"What a catalogue is for","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"An artist at this scale is exactly the kind who disappears from the record. There is no press coverage, no award, no label with an archive, and everything documented above he wrote about himself on pages he pays for and maintains.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dominican salsa is not a small tradition, and it is not made only by the people whose names travel. It is also made by a man in Cotuí who finishes a shift and goes to sing.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'delfin-tu-salsero'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Delfín Tu Salsero, de nombre Delfín Antonio Marte Acosta, es cantante y compositor de salsa dominicano. El nombre artístico lo escogió él, y es una descripción llana del oficio: tu salsero, el que aparece.","type":"text"}]},{"type":"paragraph","content":[{"text":"Cotuí","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Es de Cotuí, la capital de Sánchez Ramírez, en la zona minera del Cibao central: no es un lugar con escena salsera, y queda lejísimos de las ciudades caribeñas donde el género se fabrica.","type":"text"}]},{"type":"paragraph","content":[{"text":"Desde la adolescencia oía música romántica y escribía canciones temprano, y después hizo lo que hace casi todo el que está en esa posición, que es ponerse a ganarse la vida. Se hizo electricista y entró a trabajar en un hotel.","type":"text"}]},{"type":"paragraph","content":[{"text":"Arrancar a los treinta y tres","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Se lanzó como artista en 2014, pasados los treinta, y escogió la salsa a propósito y no por casualidad: su propio relato es que fue a buscar el género que le calzaba a lo que quería cantar, y se quedó con este.","type":"text"}]},{"type":"paragraph","content":[{"text":"Las primeras actividades fueron bares, fiestas de cumpleaños y centros sociales pequeños. Ese es el nivel de entrada real de la música dominicana, y es donde pasa la carrera entera la enorme mayoría de los cantantes que trabajan en el país, sin que nadie los registre.","type":"text"}]},{"type":"paragraph","content":[{"text":"No soltó los otros dos trabajos. Lo del hotel es lo que paga, y el oficio de electricista sigue en la lista de lo que hace: tres ocupaciones, una de las cuales es cantar. No hay una versión de esta historia en que la música lo sostuviera primero.","type":"text"}]},{"type":"paragraph","content":[{"text":"Las canciones","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El Control Del Penal, Si Usted Supiera Señora, Hasta Luego, Amor Amor, Payaso Soy. Después las que llegaron a las plataformas: Andas Pregonando, Te Recordaré, Margarita Ruleta Del Destino, De Que Te Valió Dejarme y Tu Cara de Ángel.","type":"text"}]},{"type":"paragraph","content":[{"text":"Son salsa romántica: la vertiente melódica y sin apuro del género, cantada y no gritada, hecha para una emisora de una ciudad del interior antes que para una pista. Las estaciones dominicanas se las han puesto.","type":"text"}]},{"type":"paragraph","content":[{"text":"Para qué sirve un registro","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Un artista de este tamaño es justamente el que se le pierde a la historia. No hay prensa, no hay premio, no hay sello con archivo, y todo lo documentado aquí lo escribió él mismo en páginas que paga y mantiene.","type":"text"}]},{"type":"paragraph","content":[{"text":"La salsa dominicana no es una tradición pequeña, y no la hace solamente la gente cuyo nombre viaja. También la hace un señor en Cotuí que sale de un turno y se va a cantar.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'delfin-tu-salsero'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
