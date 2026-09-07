BEGIN;

-- Rewrite the catalogue entry for Rafael Petitón Guzmán.
--
-- Rafael Petitón Guzmán. Filler in English, nothing in Spanish -- on a
-- Juilliard-trained composer who died in 1983, whose archive of 1,861 scores
-- sits in a New York university, and who is the reason merengue was ever heard
-- in a Manhattan ballroom. This is the oldest and, by weight, the most
-- important row the audit has surfaced.
--
-- NAME CORRECTED. The row read "Petiton Guzman", with no accents, and split as
-- first_name "Rafael" / last_name "Petitón Guzmán". Petitón is the paternal
-- surname and Guzmán the maternal one, so they are separated here and the
-- display name becomes Rafael Petitón Guzmán.
--
-- PLACE CORRECTED. province "Distrito Nacional" -> "Hermanas Mirabal" and
-- birth_place "Santo Domingo" -> "Salcedo". Salcedo is his birthplace on every
-- source, including Slonimsky writing in 1945 while he was alive; the province
-- that contains it was renamed Hermanas Mirabal in 2007, which is the name this
-- catalogue uses.
--
-- DEATH RECORDED: death_year 1983, ended true. He died in San Juan, Puerto
-- Rico, on 14 December 1983 and was buried in Salcedo at his own request.
--
-- TWO CONFLICTS RECORDED, NEITHER RESOLVED:
--
--   THE BIRTH DATE, AND THE EDITOR SHOULD DECIDE THIS ONE. The row already
--   held date_of_birth 18 December 1894, which is Nicolas Slonimsky's date from
--   Music of Latin America, 1945 -- written while Petiton was alive. The CUNY
--   Dominican Studies Institute, which holds his papers, gives 29 January 1894
--   instead. Both agree on the year. The stored date is NOT overwritten,
--   because choosing an archive over a contemporary reference is a judgement
--   and not a correction, but the conflict is real and the prose gives no day.
--
--   THE YEAR HE REACHED NEW YORK. CUNY says 1935, twice, in the same
--   paragraph. América Tejeda's magazine and other Dominican accounts say 1939.
--   A third says he emigrated in 1920, which is compatible with both, since
--   he was in Puerto Rico and elsewhere in Latin America before New York. The
--   prose says the mid-nineteen-thirties and does not pick a year.
--
-- GENRE CHANGED, AND THIS ONE IS THE EDITOR'S CALL MORE THAN MOST:
-- primary_genre instrumental-classical -> merengue. He was Juilliard-trained
-- and wrote danzones and boleros, so the old value was not absurd. But what he
-- is historically is the man who put merengue in front of a New York audience,
-- his surviving recordings lead with two merengues, and the title he was given
-- in his lifetime was embajador del merengue. instrumental-classical and bolero
-- move into genres, where the rest of the work is still recorded. If the
-- editor prefers him filed as a classical composer, this is the line to change.
--
-- primary_role musician -> composer. ADDED: occupations musical_director,
-- arranger, musician; instruments piano and percussion; aliases; the legend and
-- diaspora tags; disambiguation.
--
-- SOURCES: the CUNY Dominican Studies Institute's page on the Rafael Petitón
-- Guzmán Collection, last updated 21 April 2025, which is the authority here:
-- the birth in Salcedo and the death in San Juan, the first training under his
-- father Edilio Petitón, the Dominican government scholarship that sent him to
-- Puerto Rico around 1915-1918, the teachers Julio de Arteaga and Ramón Morlá,
-- the seat in the original Rafael Muñoz Orchestra, the move to New York and the
-- Juilliard studies under Leopold Stokowski, the founding of Orquesta Lira
-- Dominicana, the title of merengue ambassador, the Radio City, Stork Club and
-- Copacabana engagements, the later years spent teaching and arranging, the
-- burial in Salcedo, and the 1,861-item collection donated in 2007 by his
-- daughter Angelina McKenna and his sons John and James Petitón. Nicolas
-- Slonimsky, Music of Latin America, 1945, for the alternative birth date and
-- for the fact that he was already documented in the standard reference of his
-- own era. Los Archivos de Américo Mejía for the nickname Fellito and for the
-- claim that he was the first to take merengue to the United States. The album
-- "Rafael Petitón Guzmán: A Dominican Musical Treasure on the World Stage" for
-- the surviving titles: El Llorón, El Merengue en Nueva York, Vibraciones,
-- Bésame and Amor y Pasión. The CUNY DSI Trilogía Petitón of 2021. The UCLA
-- Herb Alpert School of Music's Rafael Petitón Guzmán Project. Darío Tejeda in
-- the Latin American Music Review, 2023, which opens by saying his work has had
-- little attention until now.
--
-- A CLAIM ATTRIBUTED, NOT ASSERTED. "The first to take merengue to the United
-- States" comes from a Dominican archival page. CUNY puts it more carefully --
-- one of the first bands to introduce and popularise merengue in the city's
-- ballrooms -- and that is the wording followed here.
--
-- NOT WRITTEN: the family names appear only because they are the donors of a
-- public archive, which is a fact about the collection rather than about his
-- private life.
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
       name = 'Rafael Petitón Guzmán',
       sort_name = 'Petitón Guzmán, Rafael',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = TRUE,
       primary_role = 'composer',
       primary_genre = 'merengue',
       date_of_birth = '1894-12-18',
       birth_year = 1894,
       date_of_death = '1983-12-14',
       birth_place = 'Salcedo',
       province = 'Hermanas Mirabal',
       first_name = 'Rafael',
       middle_name = NULL,
       last_name = 'Petitón',
       second_last_name = 'Guzmán',
       stage_name = 'Rafael Petitón Guzmán',
       aliases = ARRAY['Fellito', 'Petitón Guzmán', 'Embajador del Merengue']::text[],
       occupations = '["musical_director","arranger","musician"]'::jsonb,
       instruments = ARRAY['piano', 'percussion']::text[],
       genres = ARRAY['instrumental-classical', 'bolero']::text[],
       artist_tags = ARRAY['secular', 'legend', 'diaspora']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Composer, pianist and bandleader from Salcedo who took merengue into New York ballrooms',
       bio_en = 'Rafael Petitón Guzmán was a Dominican composer, pianist, arranger and bandleader. He was born in Salcedo and he is the reason merengue was heard in New York ballrooms decades before anyone thought of it as an export.

**Salcedo, San Juan, New York**

His first teacher was his father, Edilio Petitón, a good amateur musician. A Dominican government scholarship then sent him to Puerto Rico for three years to study under Julio de Arteaga and Ramón Morlá, and he stayed on the island long enough to take a seat in the original Rafael Muñoz Orchestra, one of the most respected Puerto Rican bands of the day.

He travelled through much of Latin America before settling in New York in the middle of the nineteen-thirties, and once there he enrolled at Juilliard, where he studied under Leopold Stokowski. A Dominican from a small Cibao town, holding a conservatory place in Manhattan in that decade, is not a common biography.

**Orquesta Lira Dominicana**

The band he formed was among the first Dominican-led orchestras in the city, and among the first to put merengue in front of an audience that had never heard it. He was called the merengue ambassador for it, and the title was earned in rooms rather than in interviews: Radio City Music Hall, the Stork Club, the Copacabana.

The recordings that survive show what he actually did with the form. El Llorón and El Merengue en Nueva York are merengues, but Vibraciones is a danzón, Bésame a bolero-son and Amor y Pasión something else again. He was writing for a Latin New York in which Dominicans, Cubans and Puerto Ricans shared the same bandstands, and the merengue had to hold its own beside everything else on the stand.

**The last years, and the archive**

He spent his later working life teaching, arranging and composing. He died in San Juan in December 1983 and, at his own request, was buried in Salcedo.

What he left is unusually complete: more than eighteen hundred scores, lyric sheets, recordings, documents and photographs, given to the Dominican Archives at the City College of New York in 2007 by his daughter and two sons. Very little Dominican music of that generation survives in that shape.

**Recovered rather than remembered**

For most of the last forty years he was a name in specialist bibliographies and nowhere else. That has begun to change: the CUNY Dominican Studies Institute assembled a three-part tribute in 2021 and issued an album of his work, the Herb Alpert School of Music at UCLA has run a project on him, and in 2023 the Latin American Music Review published a study that opens by saying his work has had almost no attention until now.

It is a fair summary. The music that started in a New York ballroom in the nineteen-thirties is only now being read off the page again.',
       bio_es = 'Rafael Petitón Guzmán fue compositor, pianista, arreglista y director de orquesta dominicano. Nació en Salcedo y es la razón por la que se oyó merengue en los salones de baile de Nueva York décadas antes de que a alguien se le ocurriera pensarlo como exportación.

**Salcedo, San Juan, Nueva York**

Su primer maestro fue su padre, Edilio Petitón, buen músico aficionado. Después una beca del gobierno dominicano lo mandó tres años a Puerto Rico a estudiar con Julio de Arteaga y Ramón Morlá, y se quedó en la isla lo suficiente para ocupar una silla en la orquesta original de Rafael Muñoz, una de las bandas puertorriqueñas más respetadas de la época.

Viajó por buena parte de América Latina antes de establecerse en Nueva York a mediados de los años treinta, y ya allí entró a Juilliard, donde estudió con Leopold Stokowski. Un dominicano de un pueblo pequeño del Cibao con una plaza de conservatorio en Manhattan en aquella década no es una biografía corriente.

**Orquesta Lira Dominicana**

La banda que armó estuvo entre las primeras orquestas dirigidas por un dominicano en la ciudad, y entre las primeras en poner merengue delante de un público que nunca lo había oído. Por eso le dijeron el embajador del merengue, y el título se ganó en salones y no en entrevistas: Radio City Music Hall, el Stork Club, el Copacabana.

Las grabaciones que sobreviven muestran lo que de verdad hizo con la forma. El Llorón y El Merengue en Nueva York son merengues, pero Vibraciones es un danzón, Bésame un bolero-son y Amor y Pasión otra cosa más. Escribía para una Nueva York latina donde dominicanos, cubanos y puertorriqueños compartían los mismos atriles, y el merengue tenía que defenderse al lado de todo lo demás.

**Los últimos años, y el archivo**

Pasó el final de su vida de trabajo enseñando, arreglando y componiendo. Murió en San Juan en diciembre de 1983 y, por voluntad propia, lo enterraron en Salcedo.

Lo que dejó es de una integridad rara: más de mil ochocientas partituras, letras, grabaciones, documentos y fotografías, entregadas en 2007 a los Archivos Dominicanos del City College de Nueva York por su hija y sus dos hijos. Muy poca música dominicana de esa generación sobrevive de esa manera.

**Recuperado, no recordado**

Durante casi cuarenta años fue un nombre en bibliografías especializadas y en ningún otro sitio. Eso ha empezado a cambiar: el Instituto de Estudios Dominicanos de CUNY armó un homenaje en tres partes en 2021 y publicó un disco con su obra, la Herb Alpert School of Music de UCLA le ha dedicado un proyecto, y en 2023 la Latin American Music Review publicó un estudio que abre diciendo que su obra casi no ha tenido atención hasta ahora.

Es un resumen justo. La música que empezó en un salón de baile neoyorquino en los años treinta apenas ahora se está volviendo a leer del papel.',
       updated_at = now()
 WHERE slug = 'petiton-guzman';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'petiton-guzman')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'petiton-guzman')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Rafael Petitón Guzmán was a Dominican composer, pianist, arranger and bandleader. He was born in Salcedo and he is the reason merengue was heard in New York ballrooms decades before anyone thought of it as an export.","type":"text"}]},{"type":"paragraph","content":[{"text":"Salcedo, San Juan, New York","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"His first teacher was his father, Edilio Petitón, a good amateur musician. A Dominican government scholarship then sent him to Puerto Rico for three years to study under Julio de Arteaga and Ramón Morlá, and he stayed on the island long enough to take a seat in the original Rafael Muñoz Orchestra, one of the most respected Puerto Rican bands of the day.","type":"text"}]},{"type":"paragraph","content":[{"text":"He travelled through much of Latin America before settling in New York in the middle of the nineteen-thirties, and once there he enrolled at Juilliard, where he studied under Leopold Stokowski. A Dominican from a small Cibao town, holding a conservatory place in Manhattan in that decade, is not a common biography.","type":"text"}]},{"type":"paragraph","content":[{"text":"Orquesta Lira Dominicana","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The band he formed was among the first Dominican-led orchestras in the city, and among the first to put merengue in front of an audience that had never heard it. He was called the merengue ambassador for it, and the title was earned in rooms rather than in interviews: Radio City Music Hall, the Stork Club, the Copacabana.","type":"text"}]},{"type":"paragraph","content":[{"text":"The recordings that survive show what he actually did with the form. El Llorón and El Merengue en Nueva York are merengues, but Vibraciones is a danzón, Bésame a bolero-son and Amor y Pasión something else again. He was writing for a Latin New York in which Dominicans, Cubans and Puerto Ricans shared the same bandstands, and the merengue had to hold its own beside everything else on the stand.","type":"text"}]},{"type":"paragraph","content":[{"text":"The last years, and the archive","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He spent his later working life teaching, arranging and composing. He died in San Juan in December 1983 and, at his own request, was buried in Salcedo.","type":"text"}]},{"type":"paragraph","content":[{"text":"What he left is unusually complete: more than eighteen hundred scores, lyric sheets, recordings, documents and photographs, given to the Dominican Archives at the City College of New York in 2007 by his daughter and two sons. Very little Dominican music of that generation survives in that shape.","type":"text"}]},{"type":"paragraph","content":[{"text":"Recovered rather than remembered","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"For most of the last forty years he was a name in specialist bibliographies and nowhere else. That has begun to change: the CUNY Dominican Studies Institute assembled a three-part tribute in 2021 and issued an album of his work, the Herb Alpert School of Music at UCLA has run a project on him, and in 2023 the Latin American Music Review published a study that opens by saying his work has had almost no attention until now.","type":"text"}]},{"type":"paragraph","content":[{"text":"It is a fair summary. The music that started in a New York ballroom in the nineteen-thirties is only now being read off the page again.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'petiton-guzman'), 3)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Rafael Petitón Guzmán fue compositor, pianista, arreglista y director de orquesta dominicano. Nació en Salcedo y es la razón por la que se oyó merengue en los salones de baile de Nueva York décadas antes de que a alguien se le ocurriera pensarlo como exportación.","type":"text"}]},{"type":"paragraph","content":[{"text":"Salcedo, San Juan, Nueva York","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Su primer maestro fue su padre, Edilio Petitón, buen músico aficionado. Después una beca del gobierno dominicano lo mandó tres años a Puerto Rico a estudiar con Julio de Arteaga y Ramón Morlá, y se quedó en la isla lo suficiente para ocupar una silla en la orquesta original de Rafael Muñoz, una de las bandas puertorriqueñas más respetadas de la época.","type":"text"}]},{"type":"paragraph","content":[{"text":"Viajó por buena parte de América Latina antes de establecerse en Nueva York a mediados de los años treinta, y ya allí entró a Juilliard, donde estudió con Leopold Stokowski. Un dominicano de un pueblo pequeño del Cibao con una plaza de conservatorio en Manhattan en aquella década no es una biografía corriente.","type":"text"}]},{"type":"paragraph","content":[{"text":"Orquesta Lira Dominicana","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La banda que armó estuvo entre las primeras orquestas dirigidas por un dominicano en la ciudad, y entre las primeras en poner merengue delante de un público que nunca lo había oído. Por eso le dijeron el embajador del merengue, y el título se ganó en salones y no en entrevistas: Radio City Music Hall, el Stork Club, el Copacabana.","type":"text"}]},{"type":"paragraph","content":[{"text":"Las grabaciones que sobreviven muestran lo que de verdad hizo con la forma. El Llorón y El Merengue en Nueva York son merengues, pero Vibraciones es un danzón, Bésame un bolero-son y Amor y Pasión otra cosa más. Escribía para una Nueva York latina donde dominicanos, cubanos y puertorriqueños compartían los mismos atriles, y el merengue tenía que defenderse al lado de todo lo demás.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los últimos años, y el archivo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Pasó el final de su vida de trabajo enseñando, arreglando y componiendo. Murió en San Juan en diciembre de 1983 y, por voluntad propia, lo enterraron en Salcedo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que dejó es de una integridad rara: más de mil ochocientas partituras, letras, grabaciones, documentos y fotografías, entregadas en 2007 a los Archivos Dominicanos del City College de Nueva York por su hija y sus dos hijos. Muy poca música dominicana de esa generación sobrevive de esa manera.","type":"text"}]},{"type":"paragraph","content":[{"text":"Recuperado, no recordado","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Durante casi cuarenta años fue un nombre en bibliografías especializadas y en ningún otro sitio. Eso ha empezado a cambiar: el Instituto de Estudios Dominicanos de CUNY armó un homenaje en tres partes en 2021 y publicó un disco con su obra, la Herb Alpert School of Music de UCLA le ha dedicado un proyecto, y en 2023 la Latin American Music Review publicó un estudio que abre diciendo que su obra casi no ha tenido atención hasta ahora.","type":"text"}]},{"type":"paragraph","content":[{"text":"Es un resumen justo. La música que empezó en un salón de baile neoyorquino en los años treinta apenas ahora se está volviendo a leer del papel.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'petiton-guzman'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
