BEGIN;

-- Rewrite the catalogue entry for Crispín Fernández.
--
-- Repair the editorial documents that carry raw markdown inside their text
-- nodes, without rewriting a word of the prose.
--
-- THE FAULT. Nine published artists have biographies whose paragraphs contain
-- literal markdown: "**Francisco Cruz Osuna**" and "## **Early Life**" as
-- characters inside a text node rather than as a section-title block and plain
-- prose, and bullet lists written as "- item" separated by hardBreak nodes
-- inside a single paragraph. The reader sees the asterisks, the hashes and the
-- hyphens. It also breaks the rule that bold is reserved for section titles: a
-- sweep of all eighteen documents found ZERO text nodes carrying an actual bold
-- mark, so these entries have no section titles at all.
--
-- WHAT THIS DOES. It parses each stored document back into the authoring blocks
-- that editorial.cjs uses, applying four transformations and no others:
--
--   1. Each paragraph's inline run is split on hardBreak into lines.
--   2. A line of the form "## Title" or "## **Title**" becomes a sectionTitle,
--      and so does a first line of the form "**Title**" when more lines follow
--      it in the same paragraph -- which is how dioni-fernandez-y-el-equipo has
--      its headings, glued to the body text by a line break.
--   3. A paragraph whose lines ALL begin with "- " becomes a bulletList, with
--      the marker stripped from each item.
--   4. Every remaining text node has its "**" pairs removed. Any other line
--      becomes its own paragraph.
--
-- Then it hands the blocks to run() from mk.cjs -- the same pipeline every entry
-- in this catalogue goes through. It rebuilds the document, deletes and
-- reinserts the reference rows with fresh occurrence ids, mirrors the markdown
-- into bio_en and bio_es, runs the editorial gates and emits a migration with a
-- rollback.
--
-- WHAT THIS DOES NOT DO. Not one word of prose is changed, added or removed. No
-- field on the artists row is touched -- run() is called with an empty row
-- block. The 45 artistReference nodes across these documents are carried through
-- with their artistId and displayText intact; only their occurrence ids are
-- regenerated, which is what the pipeline does on every rewrite.
--
-- HEADINGS THAT SURVIVE AND ARE WORTH A LOOK LATER: peter-cruz has "Later Years
-- and Health" / "Salud y vida reciente" and dalvin-la-melodia has "Personal
-- Context" / "Contexto social" -- section titles pointing at material the
-- catalogue's rules would normally keep out. They are NOT touched here. This
-- pass fixes structure; it does not make editorial cuts.
--
-- Uso: node md-arreglar.cjs [--dry] slug [slug...]
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
       name = 'Crispín Fernández',
       sort_name = NULL,
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'musician',
       primary_genre = 'merengue',
       date_of_birth = '1946-01-20',
       birth_year = 1946,
       date_of_death = NULL,
       birth_place = 'Villa Vásquez',
       province = 'Monte Cristi',
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY[]::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY['saxophone']::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = NULL,
       bio_en = 'Crispín Fernández Minaya (born 1946, Villa Vásquez, Dominican Republic) is a Dominican saxophonist, flutist, arranger, and educator, widely regarded as one of the most influential instrumentalists in the history of modern merengue. His career spans more than six decades and includes contributions to merengue, jazz, classical music, and Caribbean popular music. Fernández is known for his bright saxophone tone, his technical precision, his jazz‑influenced improvisation, and his extensive work as a studio musician in the Dominican Republic.

**Early life and education**

Fernández was born in Villa Vásquez in 1946. He grew up in a musical environment where merengue and tambora rhythms were part of daily life. As he recalls, “with the womb of my mother we heard the tambora.” At age eight, he entered the local music academy at the request of his father, studying solfège, reading, and tambora under professor Eduardo Cruz.

Originally interested in the trumpet, he was guided toward the saxophone, which became his primary instrument. During his youth he met the renowned Dominican saxophonist Tavito Vásquez, who introduced him to the concept of a brighter merengue sound, a tonal idea that would shape his entire career.

Fernández performed in the municipal band of Villa Vásquez, playing at funerals, dances, and community events.

**Career in Santo Domingo**

At age sixteen, Fernández moved to Santo Domingo and joined the Banda de Música de la Policía Nacional. There he developed advanced reading skills, learned transposition, and mastered the F‑clef in third position. He performed alongside Tavito Vásquez and played his first solo under Vásquez’s direction.

During this period he was first exposed to jazz, which sparked a lifelong interest in improvisation and modern harmony.

**New York period**

Fernández traveled to New York in 1968 with Johnny Ventura’s orchestra and decided to remain in the city in 1969. He studied English, completed the high‑school equivalency program, and immersed himself in the city’s Latin and jazz scenes.

He studied jazz with notable musicians such as Mario Rivera, Frank Wess, and Jimmy Owens, and attended the prestigious Jazzmobile program. Fernández also practiced and performed with Tito Puente’s orchestra, learning the saxophone section parts of big‑band Latin jazz.

Seeking broader musical development, he studied classical flute with Henry Stonier, a student of Georges Barrère. Under Stonier’s guidance, Fernández adopted a rigorous three‑hour daily practice routine focused on tone, technique, and interpretation.

During his New York years he performed merengue, salsa, charanga, jazz, and classical repertoire, becoming a versatile and technically refined musician.

**Puerto Rico and Conjunto Quisqueya**

In the early 1980s, Fernández joined Conjunto Quisqueya in Puerto Rico at the invitation of Elías Santana. He performed as tenor saxophonist and later as first alto, participating in recordings and live performances that expanded his recognition throughout the Caribbean.

**Return to the Dominican Republic**

Fernández returned to Santo Domingo in the mid‑1980s. Shortly afterward he joined the Orquesta Sinfónica Nacional as a flutist, combining classical performance with his work in popular music.

He became one of the most sought‑after studio musicians in the Dominican Republic, recording saxophone lines for major artists including:

- Sergio Vargas  
- Ramón Orlando  
- Pochy y Familia  
- Juan Luis Guerra  
- Conjunto Quisqueya  
- Johnny Ventura

His bright tone, clean articulation, and rapid Dominican picado style became hallmarks of merengue saxophone playing.

Fernández also developed an instrumental fusion project called Licuado, blending merengue, jazz, and classical elements.

**Musical style**

Fernández’s style is characterized by:

- Bright, focused saxophone tone  
- Clean and rapid articulation  
- Jazz‑influenced improvisation  
- Classical technique applied to merengue  
- Versatility across alto sax, tenor sax, and flute

A representative quote from his interviews is:

“Learning is easy; teaching well is what is difficult.”

**Legacy**

Crispín Fernández is regarded as one of the most complete musicians in Dominican history. His technical mastery, discipline, and influence on generations of saxophonists have made him a central figure in the development of modern merengue. His contributions span performance, recording, education, and stylistic innovation.

**Instruments**

- Alto saxophone  
- Tenor saxophone  
- Classical flute  
- Piccolo  
- Tambora (early years)

**Associated acts**

- Banda de Música de la Policía Nacional  
- Johnny Ventura  
- Conjunto Quisqueya  
- Orquesta Sinfónica Nacional  
- Sergio Vargas  
- Ramón Orlando  
- Pochy y Familia  
- Juan Luis Guerra  
- Tito Puente (study and practice)',
       bio_es = 'Crispín Fernández Minaya (Villa Vásquez, 1946) es un saxofonista, flautista, arreglista y maestro dominicano, considerado una de las figuras más influyentes en la historia del merengue moderno. Su trayectoria abarca más de seis décadas y se distingue por su aporte al sonido brillante del merengue, su dominio técnico del saxofón, su formación jazzística en Nueva York y su rol como músico de grabación en cientos de producciones emblemáticas de la música dominicana.

**Primeros años y formación**

Crispín Fernández nació en Villa Vásquez, República Dominicana, en 1946. Creció en un entorno profundamente musical: “con el vientre de mamá oíamos la tambora”. A los ocho años ingresó a la Academia de Música por recomendación de su padre, donde estudió solfeo, lectura musical y tambora. Su maestro Eduardo Cruz lo orientó hacia el saxofón, instrumento que marcaría su vida profesional.

Durante su adolescencia conoció al saxofonista Tavito Vásquez, quien influyó decisivamente en su concepto de sonoridad y le introdujo la idea del sonido brillante en el merengue. En Villa Vásquez tocó en la banda municipal, participando en funerales, bailes y combos locales.

**Carrera temprana en Santo Domingo**

A los 16 años se trasladó a Santo Domingo, donde ingresó a la Banda de Música de la Policía Nacional. Allí perfeccionó la lectura, el transporte, la clave de Fa en tercera y la técnica avanzada del saxofón. Tocó tercer alto junto a Tavito Vásquez y realizó su primer solo bajo la dirección del maestro.

En esta etapa descubrió el jazz por primera vez, iniciando un interés que más tarde se convertiría en una parte esencial de su formación musical.

**Etapa en Nueva York**

En 1968 viajó a Nueva York con Johnny Ventura y decidió establecerse allí en 1969. En la ciudad estudió inglés, completó la equivalencia de high school y se integró al ambiente musical latino y jazzístico.

Fernández estudió jazz con maestros como Mario Rivera, Frank Wess y Jimmy Owens, y asistió a la prestigiosa escuela Jazzmobile. También tocó de lunes a jueves con la orquesta de Tito Puente, experiencia que le permitió aprender las voces de saxofón de las grandes bandas.

Durante su estancia en Nueva York estudió flauta clásica con Henry Stonier, discípulo de Georges Barrère, desarrollando una técnica rigurosa basada en la sonoridad, la articulación y la disciplina diaria.

**Conjunto Quisqueya y etapa en Puerto Rico**

A principios de los años 80 fue invitado por Elías Santana a integrarse al Conjunto Quisqueya en Puerto Rico. Allí se desempeñó como saxofonista tenor y posteriormente como primer alto, participando en grabaciones y presentaciones que consolidaron su reputación en el Caribe.

**Regreso a República Dominicana**

Fernández regresó a Santo Domingo a mediados de los años 80. Poco después ingresó a la Orquesta Sinfónica Nacional como flautista, combinando la música clásica con su trabajo en el merengue.

Durante esta etapa se convirtió en uno de los músicos de grabación más solicitados del país. Su saxofón aparece en éxitos de Sergio Vargas, Ramón Orlando, Pochy y Familia, Juan Luis Guerra, Conjunto Quisqueya, Johnny Ventura y numerosos artistas más. Su estilo de picado dominicano, caracterizado por articulación rápida y limpia, se convirtió en sello distintivo del merengue moderno.

**Estilo musical**

El estilo de Crispín Fernández se caracteriza por:

- Sonido brillante y definido  
- Articulación limpia y rápida  
- Influencia del jazz en la improvisación  
- Técnica clásica aplicada al merengue  
- Versatilidad entre saxofón alto, tenor y flauta

Su frase más representativa del documento es:

“Aprender es fácil, enseñar bien es que es difícil.”

**Legado**

Crispín Fernández es considerado uno de los músicos más completos de la República Dominicana. Su aporte técnico, su disciplina, su influencia en generaciones de saxofonistas y su participación en cientos de grabaciones lo convierten en una figura central del merengue y de la música dominicana en general.

Además de su trabajo como intérprete, Fernández ha sido maestro de numerosos músicos jóvenes y líder del proyecto instrumental Licuado, donde fusiona merengue, jazz y música clásica.

**Instrumentos**

- Saxofón alto  
- Saxofón tenor  
- Flauta clásica  
- Flauta piccolo

**Agrupaciones destacadas**

- Banda de Música de la Policía Nacional  
- Johnny Ventura  
- Conjunto Quisqueya  
- Orquesta Sinfónica Nacional  
- Sergio Vargas  
- Ramón Orlando  
- Pochy y Familia  
- Juan Luis Guerra  
- Tito Puente (prácticas y estudio)',
       updated_at = now()
 WHERE slug = 'crispin-fernandez';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Crispín Fernández Minaya (born 1946, Villa Vásquez, Dominican Republic) is a Dominican saxophonist, flutist, arranger, and educator, widely regarded as one of the most influential instrumentalists in the history of modern merengue. His career spans more than six decades and includes contributions to merengue, jazz, classical music, and Caribbean popular music. Fernández is known for his bright saxophone tone, his technical precision, his jazz‑influenced improvisation, and his extensive work as a studio musician in the Dominican Republic.","type":"text"}]},{"type":"paragraph","content":[{"text":"Early life and education","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Fernández was born in Villa Vásquez in 1946. He grew up in a musical environment where merengue and tambora rhythms were part of daily life. As he recalls, “with the womb of my mother we heard the tambora.” At age eight, he entered the local music academy at the request of his father, studying solfège, reading, and tambora under professor Eduardo Cruz.","type":"text"}]},{"type":"paragraph","content":[{"text":"Originally interested in the trumpet, he was guided toward the saxophone, which became his primary instrument. During his youth he met the renowned Dominican saxophonist Tavito Vásquez, who introduced him to the concept of a brighter merengue sound, a tonal idea that would shape his entire career.","type":"text"}]},{"type":"paragraph","content":[{"text":"Fernández performed in the municipal band of Villa Vásquez, playing at funerals, dances, and community events.","type":"text"}]},{"type":"paragraph","content":[{"text":"Career in Santo Domingo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"At age sixteen, Fernández moved to Santo Domingo and joined the Banda de Música de la Policía Nacional. There he developed advanced reading skills, learned transposition, and mastered the F‑clef in third position. He performed alongside Tavito Vásquez and played his first solo under Vásquez’s direction.","type":"text"}]},{"type":"paragraph","content":[{"text":"During this period he was first exposed to jazz, which sparked a lifelong interest in improvisation and modern harmony.","type":"text"}]},{"type":"paragraph","content":[{"text":"New York period","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Fernández traveled to New York in 1968 with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"26024702-c1c8-4276-b670-57e9711d9b5b"}},{"text":"’s orchestra and decided to remain in the city in 1969. He studied English, completed the high‑school equivalency program, and immersed himself in the city’s Latin and jazz scenes.","type":"text"}]},{"type":"paragraph","content":[{"text":"He studied jazz with notable musicians such as Mario Rivera, Frank Wess, and Jimmy Owens, and attended the prestigious Jazzmobile program. Fernández also practiced and performed with Tito Puente’s orchestra, learning the saxophone section parts of big‑band Latin jazz.","type":"text"}]},{"type":"paragraph","content":[{"text":"Seeking broader musical development, he studied classical flute with Henry Stonier, a student of Georges Barrère. Under Stonier’s guidance, Fernández adopted a rigorous three‑hour daily practice routine focused on tone, technique, and interpretation.","type":"text"}]},{"type":"paragraph","content":[{"text":"During his New York years he performed merengue, salsa, charanga, jazz, and classical repertoire, becoming a versatile and technically refined musician.","type":"text"}]},{"type":"paragraph","content":[{"text":"Puerto Rico and Conjunto Quisqueya","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In the early 1980s, Fernández joined Conjunto Quisqueya in Puerto Rico at the invitation of Elías Santana. He performed as tenor saxophonist and later as first alto, participating in recordings and live performances that expanded his recognition throughout the Caribbean.","type":"text"}]},{"type":"paragraph","content":[{"text":"Return to the Dominican Republic","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Fernández returned to Santo Domingo in the mid‑1980s. Shortly afterward he joined the Orquesta Sinfónica Nacional as a flutist, combining classical performance with his work in popular music.","type":"text"}]},{"type":"paragraph","content":[{"text":"He became one of the most sought‑after studio musicians in the Dominican Republic, recording saxophone lines for major artists including:","type":"text"}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"","type":"text"},{"type":"artistReference","attrs":{"artistId":"059a9e99-5d11-433e-97b9-9c35e57908f1","displayText":"Sergio Vargas","occurrenceId":"ecd85b4a-4b88-4f5f-b479-3e27ec72937d"}},{"text":"","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"65170efd-e187-4b66-9092-326033475cba"}},{"text":"","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Pochy y Familia","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"","type":"text"},{"type":"artistReference","attrs":{"artistId":"10034596-47cb-46ba-9e80-9ea319a2c0df","displayText":"Juan Luis Guerra","occurrenceId":"999e62d8-1671-40b2-88f0-c2bb425ff4c4"}},{"text":"","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Conjunto Quisqueya","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"14b20729-cc7d-43ec-b561-68df163ac809"}},{"text":"","type":"text"}]}]}]},{"type":"paragraph","content":[{"text":"His bright tone, clean articulation, and rapid Dominican picado style became hallmarks of merengue saxophone playing.","type":"text"}]},{"type":"paragraph","content":[{"text":"Fernández also developed an instrumental fusion project called Licuado, blending merengue, jazz, and classical elements.","type":"text"}]},{"type":"paragraph","content":[{"text":"Musical style","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Fernández’s style is characterized by:","type":"text"}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Bright, focused saxophone tone","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Clean and rapid articulation","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Jazz‑influenced improvisation","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Classical technique applied to merengue","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Versatility across alto sax, tenor sax, and flute","type":"text"}]}]}]},{"type":"paragraph","content":[{"text":"A representative quote from his interviews is:","type":"text"}]},{"type":"paragraph","content":[{"text":"“Learning is easy; teaching well is what is difficult.”","type":"text"}]},{"type":"paragraph","content":[{"text":"Legacy","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Crispín Fernández is regarded as one of the most complete musicians in Dominican history. His technical mastery, discipline, and influence on generations of saxophonists have made him a central figure in the development of modern merengue. His contributions span performance, recording, education, and stylistic innovation.","type":"text"}]},{"type":"paragraph","content":[{"text":"Instruments","type":"text","marks":[{"type":"bold"}]}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Alto saxophone","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Tenor saxophone","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Classical flute","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Piccolo","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Tambora (early years)","type":"text"}]}]}]},{"type":"paragraph","content":[{"text":"Associated acts","type":"text","marks":[{"type":"bold"}]}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Banda de Música de la Policía Nacional","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"4f33e239-6544-4545-9fba-0fffac9f5126"}},{"text":"","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Conjunto Quisqueya","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Orquesta Sinfónica Nacional","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"","type":"text"},{"type":"artistReference","attrs":{"artistId":"059a9e99-5d11-433e-97b9-9c35e57908f1","displayText":"Sergio Vargas","occurrenceId":"94ea2a19-131a-4ea2-9ce4-4fc4e136393c"}},{"text":"","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"df331ce5-9135-4f50-b1d7-286ee8f4723a"}},{"text":"","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Pochy y Familia","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"","type":"text"},{"type":"artistReference","attrs":{"artistId":"10034596-47cb-46ba-9e80-9ea319a2c0df","displayText":"Juan Luis Guerra","occurrenceId":"cbf8ec06-7b2f-4864-b076-5549f93f80b5"}},{"text":"","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Tito Puente (study and practice)","type":"text"}]}]}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'crispin-fernandez'), 3)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Crispín Fernández Minaya (Villa Vásquez, 1946) es un saxofonista, flautista, arreglista y maestro dominicano, considerado una de las figuras más influyentes en la historia del merengue moderno. Su trayectoria abarca más de seis décadas y se distingue por su aporte al sonido brillante del merengue, su dominio técnico del saxofón, su formación jazzística en Nueva York y su rol como músico de grabación en cientos de producciones emblemáticas de la música dominicana.","type":"text"}]},{"type":"paragraph","content":[{"text":"Primeros años y formación","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Crispín Fernández nació en Villa Vásquez, República Dominicana, en 1946. Creció en un entorno profundamente musical: “con el vientre de mamá oíamos la tambora”. A los ocho años ingresó a la Academia de Música por recomendación de su padre, donde estudió solfeo, lectura musical y tambora. Su maestro Eduardo Cruz lo orientó hacia el saxofón, instrumento que marcaría su vida profesional.","type":"text"}]},{"type":"paragraph","content":[{"text":"Durante su adolescencia conoció al saxofonista Tavito Vásquez, quien influyó decisivamente en su concepto de sonoridad y le introdujo la idea del sonido brillante en el merengue. En Villa Vásquez tocó en la banda municipal, participando en funerales, bailes y combos locales.","type":"text"}]},{"type":"paragraph","content":[{"text":"Carrera temprana en Santo Domingo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"A los 16 años se trasladó a Santo Domingo, donde ingresó a la Banda de Música de la Policía Nacional. Allí perfeccionó la lectura, el transporte, la clave de Fa en tercera y la técnica avanzada del saxofón. Tocó tercer alto junto a Tavito Vásquez y realizó su primer solo bajo la dirección del maestro.","type":"text"}]},{"type":"paragraph","content":[{"text":"En esta etapa descubrió el jazz por primera vez, iniciando un interés que más tarde se convertiría en una parte esencial de su formación musical.","type":"text"}]},{"type":"paragraph","content":[{"text":"Etapa en Nueva York","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En 1968 viajó a Nueva York con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"446e8f41-50c0-42f3-81ca-f9a540b3795e"}},{"text":" y decidió establecerse allí en 1969. En la ciudad estudió inglés, completó la equivalencia de high school y se integró al ambiente musical latino y jazzístico.","type":"text"}]},{"type":"paragraph","content":[{"text":"Fernández estudió jazz con maestros como Mario Rivera, Frank Wess y Jimmy Owens, y asistió a la prestigiosa escuela Jazzmobile. También tocó de lunes a jueves con la orquesta de Tito Puente, experiencia que le permitió aprender las voces de saxofón de las grandes bandas.","type":"text"}]},{"type":"paragraph","content":[{"text":"Durante su estancia en Nueva York estudió flauta clásica con Henry Stonier, discípulo de Georges Barrère, desarrollando una técnica rigurosa basada en la sonoridad, la articulación y la disciplina diaria.","type":"text"}]},{"type":"paragraph","content":[{"text":"Conjunto Quisqueya y etapa en Puerto Rico","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"A principios de los años 80 fue invitado por Elías Santana a integrarse al Conjunto Quisqueya en Puerto Rico. Allí se desempeñó como saxofonista tenor y posteriormente como primer alto, participando en grabaciones y presentaciones que consolidaron su reputación en el Caribe.","type":"text"}]},{"type":"paragraph","content":[{"text":"Regreso a República Dominicana","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Fernández regresó a Santo Domingo a mediados de los años 80. Poco después ingresó a la Orquesta Sinfónica Nacional como flautista, combinando la música clásica con su trabajo en el merengue.","type":"text"}]},{"type":"paragraph","content":[{"text":"Durante esta etapa se convirtió en uno de los músicos de grabación más solicitados del país. Su saxofón aparece en éxitos de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"059a9e99-5d11-433e-97b9-9c35e57908f1","displayText":"Sergio Vargas","occurrenceId":"bc420bcf-2c97-42c1-8904-941d0d74cf53"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"3d0757d6-3af2-4e00-8455-0f2c61687315"}},{"text":", Pochy y Familia, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"10034596-47cb-46ba-9e80-9ea319a2c0df","displayText":"Juan Luis Guerra","occurrenceId":"87952c3b-12bb-4dad-b4d9-c19d91f1c825"}},{"text":", Conjunto Quisqueya, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"bbcfabe5-1221-498c-b97c-b9439714ee5f"}},{"text":" y numerosos artistas más. Su estilo de picado dominicano, caracterizado por articulación rápida y limpia, se convirtió en sello distintivo del merengue moderno.","type":"text"}]},{"type":"paragraph","content":[{"text":"Estilo musical","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El estilo de Crispín Fernández se caracteriza por:","type":"text"}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Sonido brillante y definido","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Articulación limpia y rápida","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Influencia del jazz en la improvisación","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Técnica clásica aplicada al merengue","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Versatilidad entre saxofón alto, tenor y flauta","type":"text"}]}]}]},{"type":"paragraph","content":[{"text":"Su frase más representativa del documento es:","type":"text"}]},{"type":"paragraph","content":[{"text":"“Aprender es fácil, enseñar bien es que es difícil.”","type":"text"}]},{"type":"paragraph","content":[{"text":"Legado","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Crispín Fernández es considerado uno de los músicos más completos de la República Dominicana. Su aporte técnico, su disciplina, su influencia en generaciones de saxofonistas y su participación en cientos de grabaciones lo convierten en una figura central del merengue y de la música dominicana en general.","type":"text"}]},{"type":"paragraph","content":[{"text":"Además de su trabajo como intérprete, Fernández ha sido maestro de numerosos músicos jóvenes y líder del proyecto instrumental Licuado, donde fusiona merengue, jazz y música clásica.","type":"text"}]},{"type":"paragraph","content":[{"text":"Instrumentos","type":"text","marks":[{"type":"bold"}]}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Saxofón alto","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Saxofón tenor","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Flauta clásica","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Flauta piccolo","type":"text"}]}]}]},{"type":"paragraph","content":[{"text":"Agrupaciones destacadas","type":"text","marks":[{"type":"bold"}]}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Banda de Música de la Policía Nacional","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"4a030439-c13f-460d-9e82-df29fb068c2d"}},{"text":"","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Conjunto Quisqueya","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Orquesta Sinfónica Nacional","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"","type":"text"},{"type":"artistReference","attrs":{"artistId":"059a9e99-5d11-433e-97b9-9c35e57908f1","displayText":"Sergio Vargas","occurrenceId":"77f63c9e-c15e-457d-a696-1053f7006de6"}},{"text":"","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"4e13a2ea-60c1-47ef-b8df-04637f3b4dcb"}},{"text":"","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Pochy y Familia","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"","type":"text"},{"type":"artistReference","attrs":{"artistId":"10034596-47cb-46ba-9e80-9ea319a2c0df","displayText":"Juan Luis Guerra","occurrenceId":"00795141-35fe-409a-ab17-329cae469e58"}},{"text":"","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Tito Puente (prácticas y estudio)","type":"text"}]}]}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'crispin-fernandez'), 3)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), '14b20729-cc7d-43ec-b561-68df163ac809', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), '26024702-c1c8-4276-b670-57e9711d9b5b', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), '4f33e239-6544-4545-9fba-0fffac9f5126', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), '65170efd-e187-4b66-9092-326033475cba', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), '94ea2a19-131a-4ea2-9ce4-4fc4e136393c', 'artist', '059a9e99-5d11-433e-97b9-9c35e57908f1');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), '999e62d8-1671-40b2-88f0-c2bb425ff4c4', 'artist', '10034596-47cb-46ba-9e80-9ea319a2c0df');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), 'cbf8ec06-7b2f-4864-b076-5549f93f80b5', 'artist', '10034596-47cb-46ba-9e80-9ea319a2c0df');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), 'df331ce5-9135-4f50-b1d7-286ee8f4723a', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), 'ecd85b4a-4b88-4f5f-b479-3e27ec72937d', 'artist', '059a9e99-5d11-433e-97b9-9c35e57908f1');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), '00795141-35fe-409a-ab17-329cae469e58', 'artist', '10034596-47cb-46ba-9e80-9ea319a2c0df');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), '3d0757d6-3af2-4e00-8455-0f2c61687315', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), '446e8f41-50c0-42f3-81ca-f9a540b3795e', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), '4a030439-c13f-460d-9e82-df29fb068c2d', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), '4e13a2ea-60c1-47ef-b8df-04637f3b4dcb', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), '77f63c9e-c15e-457d-a696-1053f7006de6', 'artist', '059a9e99-5d11-433e-97b9-9c35e57908f1');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), '87952c3b-12bb-4dad-b4d9-c19d91f1c825', 'artist', '10034596-47cb-46ba-9e80-9ea319a2c0df');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), 'bbcfabe5-1221-498c-b97c-b9439714ee5f', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), 'bc420bcf-2c97-42c1-8904-941d0d74cf53', 'artist', '059a9e99-5d11-433e-97b9-9c35e57908f1');

COMMIT;
