BEGIN;

-- Reverts 20260907000500_rewrite_crispin_fernandez_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

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
       bio_en = '**Crispín Fernández Minaya** (born 1946, Villa Vásquez, Dominican Republic) is a Dominican saxophonist, flutist, arranger, and educator, widely regarded as one of the most influential instrumentalists in the history of modern merengue. His career spans more than six decades and includes contributions to merengue, jazz, classical music, and Caribbean popular music. Fernández is known for his bright saxophone tone, his technical precision, his jazz‑influenced improvisation, and his extensive work as a studio musician in the Dominican Republic.

## **Early life and education**

Fernández was born in Villa Vásquez in 1946. He grew up in a musical environment where merengue and tambora rhythms were part of daily life. As he recalls, “with the womb of my mother we heard the tambora.” At age eight, he entered the local music academy at the request of his father, studying solfège, reading, and tambora under professor Eduardo Cruz.

Originally interested in the trumpet, he was guided toward the saxophone, which became his primary instrument. During his youth he met the renowned Dominican saxophonist Tavito Vásquez, who introduced him to the concept of a **brighter merengue sound**, a tonal idea that would shape his entire career.

Fernández performed in the municipal band of Villa Vásquez, playing at funerals, dances, and community events.

## **Career in Santo Domingo**

At age sixteen, Fernández moved to Santo Domingo and joined the **Banda de Música de la Policía Nacional**. There he developed advanced reading skills, learned transposition, and mastered the F‑clef in third position. He performed alongside Tavito Vásquez and played his first solo under Vásquez’s direction.

During this period he was first exposed to jazz, which sparked a lifelong interest in improvisation and modern harmony.

## **New York period**

Fernández traveled to New York in 1968 with Johnny Ventura’s orchestra and decided to remain in the city in 1969. He studied English, completed the high‑school equivalency program, and immersed himself in the city’s Latin and jazz scenes.

He studied jazz with notable musicians such as **Mario Rivera**, **Frank Wess**, and **Jimmy Owens**, and attended the prestigious **Jazzmobile** program. Fernández also practiced and performed with **Tito Puente’s orchestra**, learning the saxophone section parts of big‑band Latin jazz.

Seeking broader musical development, he studied classical flute with **Henry Stonier**, a student of Georges Barrère. Under Stonier’s guidance, Fernández adopted a rigorous three‑hour daily practice routine focused on tone, technique, and interpretation.

During his New York years he performed merengue, salsa, charanga, jazz, and classical repertoire, becoming a versatile and technically refined musician.

## **Puerto Rico and Conjunto Quisqueya**

In the early 1980s, Fernández joined **Conjunto Quisqueya** in Puerto Rico at the invitation of Elías Santana. He performed as tenor saxophonist and later as first alto, participating in recordings and live performances that expanded his recognition throughout the Caribbean.

## **Return to the Dominican Republic**

Fernández returned to Santo Domingo in the mid‑1980s. Shortly afterward he joined the **Orquesta Sinfónica Nacional** as a flutist, combining classical performance with his work in popular music.

He became one of the most sought‑after studio musicians in the Dominican Republic, recording saxophone lines for major artists including:

- Sergio Vargas  
- Ramón Orlando  
- Pochy y Familia  
- Juan Luis Guerra  
- Conjunto Quisqueya  
- Johnny Ventura  

His bright tone, clean articulation, and rapid **Dominican picado** style became hallmarks of merengue saxophone playing.

Fernández also developed an instrumental fusion project called **Licuado**, blending merengue, jazz, and classical elements.

## **Musical style**

Fernández’s style is characterized by:

- Bright, focused saxophone tone  
- Clean and rapid articulation  
- Jazz‑influenced improvisation  
- Classical technique applied to merengue  
- Versatility across alto sax, tenor sax, and flute  

A representative quote from his interviews is:  
“Learning is easy; teaching well is what is difficult.”

## **Legacy**

Crispín Fernández is regarded as one of the most complete musicians in Dominican history. His technical mastery, discipline, and influence on generations of saxophonists have made him a central figure in the development of modern merengue. His contributions span performance, recording, education, and stylistic innovation.

## **Instruments**

- Alto saxophone  
- Tenor saxophone  
- Classical flute  
- Piccolo  
- Tambora (early years)

## **Associated acts**

- Banda de Música de la Policía Nacional  
- Johnny Ventura  
- Conjunto Quisqueya  
- Orquesta Sinfónica Nacional  
- Sergio Vargas  
- Ramón Orlando  
- Pochy y Familia  
- Juan Luis Guerra  
- Tito Puente (study and practice)',
       bio_es = '**Crispín Fernández Minaya** (Villa Vásquez, 1946) es un saxofonista, flautista, arreglista y maestro dominicano, considerado una de las figuras más influyentes en la historia del merengue moderno. Su trayectoria abarca más de seis décadas y se distingue por su aporte al sonido brillante del merengue, su dominio técnico del saxofón, su formación jazzística en Nueva York y su rol como músico de grabación en cientos de producciones emblemáticas de la música dominicana.

## **Primeros años y formación**

Crispín Fernández nació en Villa Vásquez, República Dominicana, en 1946. Creció en un entorno profundamente musical: “con el vientre de mamá oíamos la tambora”. A los ocho años ingresó a la Academia de Música por recomendación de su padre, donde estudió solfeo, lectura musical y tambora. Su maestro Eduardo Cruz lo orientó hacia el saxofón, instrumento que marcaría su vida profesional.

Durante su adolescencia conoció al saxofonista Tavito Vásquez, quien influyó decisivamente en su concepto de sonoridad y le introdujo la idea del **sonido brillante** en el merengue. En Villa Vásquez tocó en la banda municipal, participando en funerales, bailes y combos locales.

## **Carrera temprana en Santo Domingo**

A los 16 años se trasladó a Santo Domingo, donde ingresó a la Banda de Música de la Policía Nacional. Allí perfeccionó la lectura, el transporte, la clave de Fa en tercera y la técnica avanzada del saxofón. Tocó tercer alto junto a Tavito Vásquez y realizó su primer solo bajo la dirección del maestro.

En esta etapa descubrió el jazz por primera vez, iniciando un interés que más tarde se convertiría en una parte esencial de su formación musical.

## **Etapa en Nueva York**

En 1968 viajó a Nueva York con Johnny Ventura y decidió establecerse allí en 1969. En la ciudad estudió inglés, completó la equivalencia de high school y se integró al ambiente musical latino y jazzístico.

Fernández estudió jazz con maestros como Mario Rivera, Frank Wess y Jimmy Owens, y asistió a la prestigiosa escuela Jazzmobile. También tocó de lunes a jueves con la orquesta de Tito Puente, experiencia que le permitió aprender las voces de saxofón de las grandes bandas.

Durante su estancia en Nueva York estudió flauta clásica con Henry Stonier, discípulo de Georges Barrère, desarrollando una técnica rigurosa basada en la sonoridad, la articulación y la disciplina diaria.

## **Conjunto Quisqueya y etapa en Puerto Rico**

A principios de los años 80 fue invitado por Elías Santana a integrarse al Conjunto Quisqueya en Puerto Rico. Allí se desempeñó como saxofonista tenor y posteriormente como primer alto, participando en grabaciones y presentaciones que consolidaron su reputación en el Caribe.

## **Regreso a República Dominicana**

Fernández regresó a Santo Domingo a mediados de los años 80. Poco después ingresó a la Orquesta Sinfónica Nacional como flautista, combinando la música clásica con su trabajo en el merengue.

Durante esta etapa se convirtió en uno de los músicos de grabación más solicitados del país. Su saxofón aparece en éxitos de Sergio Vargas, Ramón Orlando, Pochy y Familia, Juan Luis Guerra, Conjunto Quisqueya, Johnny Ventura y numerosos artistas más. Su estilo de **picado dominicano**, caracterizado por articulación rápida y limpia, se convirtió en sello distintivo del merengue moderno.

## **Estilo musical**

El estilo de Crispín Fernández se caracteriza por:

- Sonido brillante y definido  
- Articulación limpia y rápida  
- Influencia del jazz en la improvisación  
- Técnica clásica aplicada al merengue  
- Versatilidad entre saxofón alto, tenor y flauta  

Su frase más representativa del documento es:  
“Aprender es fácil, enseñar bien es que es difícil.”

## **Legado**

Crispín Fernández es considerado uno de los músicos más completos de la República Dominicana. Su aporte técnico, su disciplina, su influencia en generaciones de saxofonistas y su participación en cientos de grabaciones lo convierten en una figura central del merengue y de la música dominicana en general.

Además de su trabajo como intérprete, Fernández ha sido maestro de numerosos músicos jóvenes y líder del proyecto instrumental **Licuado**, donde fusiona merengue, jazz y música clásica.

## **Instrumentos**

- Saxofón alto  
- Saxofón tenor  
- Flauta clásica  
- Flauta piccolo  

## **Agrupaciones destacadas**

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
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"**Crispín Fernández Minaya** (born 1946, Villa Vásquez, Dominican Republic) is a Dominican saxophonist, flutist, arranger, and educator, widely regarded as one of the most influential instrumentalists in the history of modern merengue. His career spans more than six decades and includes contributions to merengue, jazz, classical music, and Caribbean popular music. Fernández is known for his bright saxophone tone, his technical precision, his jazz‑influenced improvisation, and his extensive work as a studio musician in the Dominican Republic.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Early life and education**","type":"text"}]},{"type":"paragraph","content":[{"text":"Fernández was born in Villa Vásquez in 1946. He grew up in a musical environment where merengue and tambora rhythms were part of daily life. As he recalls, “with the womb of my mother we heard the tambora.” At age eight, he entered the local music academy at the request of his father, studying solfège, reading, and tambora under professor Eduardo Cruz.","type":"text"}]},{"type":"paragraph","content":[{"text":"Originally interested in the trumpet, he was guided toward the saxophone, which became his primary instrument. During his youth he met the renowned Dominican saxophonist Tavito Vásquez, who introduced him to the concept of a **brighter merengue sound**, a tonal idea that would shape his entire career.","type":"text"}]},{"type":"paragraph","content":[{"text":"Fernández performed in the municipal band of Villa Vásquez, playing at funerals, dances, and community events.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Career in Santo Domingo**","type":"text"}]},{"type":"paragraph","content":[{"text":"At age sixteen, Fernández moved to Santo Domingo and joined the **Banda de Música de la Policía Nacional**. There he developed advanced reading skills, learned transposition, and mastered the F‑clef in third position. He performed alongside Tavito Vásquez and played his first solo under Vásquez’s direction.","type":"text"}]},{"type":"paragraph","content":[{"text":"During this period he was first exposed to jazz, which sparked a lifelong interest in improvisation and modern harmony.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **New York period**","type":"text"}]},{"type":"paragraph","content":[{"text":"Fernández traveled to New York in 1968 with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"a292d2ee-ab07-4ade-b05f-5989018eec65"}},{"text":"’s orchestra and decided to remain in the city in 1969. He studied English, completed the high‑school equivalency program, and immersed himself in the city’s Latin and jazz scenes.","type":"text"}]},{"type":"paragraph","content":[{"text":"He studied jazz with notable musicians such as **Mario Rivera**, **Frank Wess**, and **Jimmy Owens**, and attended the prestigious **Jazzmobile** program. Fernández also practiced and performed with **Tito Puente’s orchestra**, learning the saxophone section parts of big‑band Latin jazz.","type":"text"}]},{"type":"paragraph","content":[{"text":"Seeking broader musical development, he studied classical flute with **Henry Stonier**, a student of Georges Barrère. Under Stonier’s guidance, Fernández adopted a rigorous three‑hour daily practice routine focused on tone, technique, and interpretation.","type":"text"}]},{"type":"paragraph","content":[{"text":"During his New York years he performed merengue, salsa, charanga, jazz, and classical repertoire, becoming a versatile and technically refined musician.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Puerto Rico and Conjunto Quisqueya**","type":"text"}]},{"type":"paragraph","content":[{"text":"In the early 1980s, Fernández joined **Conjunto Quisqueya** in Puerto Rico at the invitation of Elías Santana. He performed as tenor saxophonist and later as first alto, participating in recordings and live performances that expanded his recognition throughout the Caribbean.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Return to the Dominican Republic**","type":"text"}]},{"type":"paragraph","content":[{"text":"Fernández returned to Santo Domingo in the mid‑1980s. Shortly afterward he joined the **Orquesta Sinfónica Nacional** as a flutist, combining classical performance with his work in popular music.","type":"text"}]},{"type":"paragraph","content":[{"text":"He became one of the most sought‑after studio musicians in the Dominican Republic, recording saxophone lines for major artists including:","type":"text"}]},{"type":"paragraph","content":[{"text":"- ","type":"text"},{"type":"artistReference","attrs":{"artistId":"059a9e99-5d11-433e-97b9-9c35e57908f1","displayText":"Sergio Vargas","occurrenceId":"cd36bfe9-ec33-4606-967c-d9b437b7ebff"}},{"text":"  ","type":"text"},{"type":"hardBreak"},{"text":"- ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"894270f0-fb83-457d-9c21-1c5da4d810db"}},{"text":"  ","type":"text"},{"type":"hardBreak"},{"text":"- Pochy y Familia  ","type":"text"},{"type":"hardBreak"},{"text":"- ","type":"text"},{"type":"artistReference","attrs":{"artistId":"10034596-47cb-46ba-9e80-9ea319a2c0df","displayText":"Juan Luis Guerra","occurrenceId":"540641fb-f80e-43e3-8bc1-c6450d2169b2"}},{"text":"  ","type":"text"},{"type":"hardBreak"},{"text":"- Conjunto Quisqueya  ","type":"text"},{"type":"hardBreak"},{"text":"- ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"9279f991-099b-4607-994e-b9ad761bf12a"}},{"text":"  ","type":"text"}]},{"type":"paragraph","content":[{"text":"His bright tone, clean articulation, and rapid **Dominican picado** style became hallmarks of merengue saxophone playing.","type":"text"}]},{"type":"paragraph","content":[{"text":"Fernández also developed an instrumental fusion project called **Licuado**, blending merengue, jazz, and classical elements.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Musical style**","type":"text"}]},{"type":"paragraph","content":[{"text":"Fernández’s style is characterized by:","type":"text"}]},{"type":"paragraph","content":[{"text":"- Bright, focused saxophone tone  ","type":"text"},{"type":"hardBreak"},{"text":"- Clean and rapid articulation  ","type":"text"},{"type":"hardBreak"},{"text":"- Jazz‑influenced improvisation  ","type":"text"},{"type":"hardBreak"},{"text":"- Classical technique applied to merengue  ","type":"text"},{"type":"hardBreak"},{"text":"- Versatility across alto sax, tenor sax, and flute  ","type":"text"}]},{"type":"paragraph","content":[{"text":"A representative quote from his interviews is:  ","type":"text"},{"type":"hardBreak"},{"text":"“Learning is easy; teaching well is what is difficult.”","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Legacy**","type":"text"}]},{"type":"paragraph","content":[{"text":"Crispín Fernández is regarded as one of the most complete musicians in Dominican history. His technical mastery, discipline, and influence on generations of saxophonists have made him a central figure in the development of modern merengue. His contributions span performance, recording, education, and stylistic innovation.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Instruments**","type":"text"}]},{"type":"paragraph","content":[{"text":"- Alto saxophone  ","type":"text"},{"type":"hardBreak"},{"text":"- Tenor saxophone  ","type":"text"},{"type":"hardBreak"},{"text":"- Classical flute  ","type":"text"},{"type":"hardBreak"},{"text":"- Piccolo  ","type":"text"},{"type":"hardBreak"},{"text":"- Tambora (early years)","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Associated acts**","type":"text"}]},{"type":"paragraph","content":[{"text":"- Banda de Música de la Policía Nacional  ","type":"text"},{"type":"hardBreak"},{"text":"- ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"9eb0d69d-d63d-4bbd-8ab3-6512a0df0419"}},{"text":"  ","type":"text"},{"type":"hardBreak"},{"text":"- Conjunto Quisqueya  ","type":"text"},{"type":"hardBreak"},{"text":"- Orquesta Sinfónica Nacional  ","type":"text"},{"type":"hardBreak"},{"text":"- ","type":"text"},{"type":"artistReference","attrs":{"artistId":"059a9e99-5d11-433e-97b9-9c35e57908f1","displayText":"Sergio Vargas","occurrenceId":"842ac717-0910-469e-849f-9ccce6919ca1"}},{"text":"  ","type":"text"},{"type":"hardBreak"},{"text":"- ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"dffb6454-ba1d-42ad-8197-3c76983a4d52"}},{"text":"  ","type":"text"},{"type":"hardBreak"},{"text":"- Pochy y Familia  ","type":"text"},{"type":"hardBreak"},{"text":"- ","type":"text"},{"type":"artistReference","attrs":{"artistId":"10034596-47cb-46ba-9e80-9ea319a2c0df","displayText":"Juan Luis Guerra","occurrenceId":"1b3e46c4-7f2f-4b1e-ae9a-5ed05176f106"}},{"text":"  ","type":"text"},{"type":"hardBreak"},{"text":"- Tito Puente (study and practice)","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'crispin-fernandez'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"**Crispín Fernández Minaya** (Villa Vásquez, 1946) es un saxofonista, flautista, arreglista y maestro dominicano, considerado una de las figuras más influyentes en la historia del merengue moderno. Su trayectoria abarca más de seis décadas y se distingue por su aporte al sonido brillante del merengue, su dominio técnico del saxofón, su formación jazzística en Nueva York y su rol como músico de grabación en cientos de producciones emblemáticas de la música dominicana.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Primeros años y formación**","type":"text"}]},{"type":"paragraph","content":[{"text":"Crispín Fernández nació en Villa Vásquez, República Dominicana, en 1946. Creció en un entorno profundamente musical: “con el vientre de mamá oíamos la tambora”. A los ocho años ingresó a la Academia de Música por recomendación de su padre, donde estudió solfeo, lectura musical y tambora. Su maestro Eduardo Cruz lo orientó hacia el saxofón, instrumento que marcaría su vida profesional.","type":"text"}]},{"type":"paragraph","content":[{"text":"Durante su adolescencia conoció al saxofonista Tavito Vásquez, quien influyó decisivamente en su concepto de sonoridad y le introdujo la idea del **sonido brillante** en el merengue. En Villa Vásquez tocó en la banda municipal, participando en funerales, bailes y combos locales.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Carrera temprana en Santo Domingo**","type":"text"}]},{"type":"paragraph","content":[{"text":"A los 16 años se trasladó a Santo Domingo, donde ingresó a la Banda de Música de la Policía Nacional. Allí perfeccionó la lectura, el transporte, la clave de Fa en tercera y la técnica avanzada del saxofón. Tocó tercer alto junto a Tavito Vásquez y realizó su primer solo bajo la dirección del maestro.","type":"text"}]},{"type":"paragraph","content":[{"text":"En esta etapa descubrió el jazz por primera vez, iniciando un interés que más tarde se convertiría en una parte esencial de su formación musical.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Etapa en Nueva York**","type":"text"}]},{"type":"paragraph","content":[{"text":"En 1968 viajó a Nueva York con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"6c0c1f68-5d8e-4a35-b559-54aee31b302f"}},{"text":" y decidió establecerse allí en 1969. En la ciudad estudió inglés, completó la equivalencia de high school y se integró al ambiente musical latino y jazzístico.","type":"text"}]},{"type":"paragraph","content":[{"text":"Fernández estudió jazz con maestros como Mario Rivera, Frank Wess y Jimmy Owens, y asistió a la prestigiosa escuela Jazzmobile. También tocó de lunes a jueves con la orquesta de Tito Puente, experiencia que le permitió aprender las voces de saxofón de las grandes bandas.","type":"text"}]},{"type":"paragraph","content":[{"text":"Durante su estancia en Nueva York estudió flauta clásica con Henry Stonier, discípulo de Georges Barrère, desarrollando una técnica rigurosa basada en la sonoridad, la articulación y la disciplina diaria.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Conjunto Quisqueya y etapa en Puerto Rico**","type":"text"}]},{"type":"paragraph","content":[{"text":"A principios de los años 80 fue invitado por Elías Santana a integrarse al Conjunto Quisqueya en Puerto Rico. Allí se desempeñó como saxofonista tenor y posteriormente como primer alto, participando en grabaciones y presentaciones que consolidaron su reputación en el Caribe.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Regreso a República Dominicana**","type":"text"}]},{"type":"paragraph","content":[{"text":"Fernández regresó a Santo Domingo a mediados de los años 80. Poco después ingresó a la Orquesta Sinfónica Nacional como flautista, combinando la música clásica con su trabajo en el merengue.","type":"text"}]},{"type":"paragraph","content":[{"text":"Durante esta etapa se convirtió en uno de los músicos de grabación más solicitados del país. Su saxofón aparece en éxitos de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"059a9e99-5d11-433e-97b9-9c35e57908f1","displayText":"Sergio Vargas","occurrenceId":"4d04f819-bfb4-4cb1-8b64-59655ec6ef90"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"b5594a3e-8a88-4b33-9d0c-7bc07f66a75b"}},{"text":", Pochy y Familia, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"10034596-47cb-46ba-9e80-9ea319a2c0df","displayText":"Juan Luis Guerra","occurrenceId":"aad87bec-591a-4822-989e-371151784038"}},{"text":", Conjunto Quisqueya, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"e4cd0135-9abf-4d96-a796-0dadbdc1eb41"}},{"text":" y numerosos artistas más. Su estilo de **picado dominicano**, caracterizado por articulación rápida y limpia, se convirtió en sello distintivo del merengue moderno.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Estilo musical**","type":"text"}]},{"type":"paragraph","content":[{"text":"El estilo de Crispín Fernández se caracteriza por:","type":"text"}]},{"type":"paragraph","content":[{"text":"- Sonido brillante y definido  ","type":"text"},{"type":"hardBreak"},{"text":"- Articulación limpia y rápida  ","type":"text"},{"type":"hardBreak"},{"text":"- Influencia del jazz en la improvisación  ","type":"text"},{"type":"hardBreak"},{"text":"- Técnica clásica aplicada al merengue  ","type":"text"},{"type":"hardBreak"},{"text":"- Versatilidad entre saxofón alto, tenor y flauta  ","type":"text"}]},{"type":"paragraph","content":[{"text":"Su frase más representativa del documento es:  ","type":"text"},{"type":"hardBreak"},{"text":"“Aprender es fácil, enseñar bien es que es difícil.”","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Legado**","type":"text"}]},{"type":"paragraph","content":[{"text":"Crispín Fernández es considerado uno de los músicos más completos de la República Dominicana. Su aporte técnico, su disciplina, su influencia en generaciones de saxofonistas y su participación en cientos de grabaciones lo convierten en una figura central del merengue y de la música dominicana en general.","type":"text"}]},{"type":"paragraph","content":[{"text":"Además de su trabajo como intérprete, Fernández ha sido maestro de numerosos músicos jóvenes y líder del proyecto instrumental **Licuado**, donde fusiona merengue, jazz y música clásica.","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Instrumentos**","type":"text"}]},{"type":"paragraph","content":[{"text":"- Saxofón alto  ","type":"text"},{"type":"hardBreak"},{"text":"- Saxofón tenor  ","type":"text"},{"type":"hardBreak"},{"text":"- Flauta clásica  ","type":"text"},{"type":"hardBreak"},{"text":"- Flauta piccolo  ","type":"text"}]},{"type":"paragraph","content":[{"text":"## **Agrupaciones destacadas**","type":"text"}]},{"type":"paragraph","content":[{"text":"- Banda de Música de la Policía Nacional  ","type":"text"},{"type":"hardBreak"},{"text":"- ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"b6fba039-60ad-4857-b06a-b86efaf6538c"}},{"text":"  ","type":"text"},{"type":"hardBreak"},{"text":"- Conjunto Quisqueya  ","type":"text"},{"type":"hardBreak"},{"text":"- Orquesta Sinfónica Nacional  ","type":"text"},{"type":"hardBreak"},{"text":"- ","type":"text"},{"type":"artistReference","attrs":{"artistId":"059a9e99-5d11-433e-97b9-9c35e57908f1","displayText":"Sergio Vargas","occurrenceId":"e437dd3a-a402-41fb-b27f-ab2b30eba5e2"}},{"text":"  ","type":"text"},{"type":"hardBreak"},{"text":"- ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"bfc06686-ac2a-4882-93fe-0db1c1881275"}},{"text":"  ","type":"text"},{"type":"hardBreak"},{"text":"- Pochy y Familia  ","type":"text"},{"type":"hardBreak"},{"text":"- ","type":"text"},{"type":"artistReference","attrs":{"artistId":"10034596-47cb-46ba-9e80-9ea319a2c0df","displayText":"Juan Luis Guerra","occurrenceId":"7c691c7d-a58a-4ca0-bf3f-d6f828182190"}},{"text":"  ","type":"text"},{"type":"hardBreak"},{"text":"- Tito Puente (prácticas y estudio)","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'crispin-fernandez'), 2)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), '1b3e46c4-7f2f-4b1e-ae9a-5ed05176f106', 'artist', '10034596-47cb-46ba-9e80-9ea319a2c0df');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), '540641fb-f80e-43e3-8bc1-c6450d2169b2', 'artist', '10034596-47cb-46ba-9e80-9ea319a2c0df');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), '842ac717-0910-469e-849f-9ccce6919ca1', 'artist', '059a9e99-5d11-433e-97b9-9c35e57908f1');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), '894270f0-fb83-457d-9c21-1c5da4d810db', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), '9279f991-099b-4607-994e-b9ad761bf12a', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), '9eb0d69d-d63d-4bbd-8ab3-6512a0df0419', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), 'a292d2ee-ab07-4ade-b05f-5989018eec65', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), 'cd36bfe9-ec33-4606-967c-d9b437b7ebff', 'artist', '059a9e99-5d11-433e-97b9-9c35e57908f1');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'en'), 'dffb6454-ba1d-42ad-8197-3c76983a4d52', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), '4d04f819-bfb4-4cb1-8b64-59655ec6ef90', 'artist', '059a9e99-5d11-433e-97b9-9c35e57908f1');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), '6c0c1f68-5d8e-4a35-b559-54aee31b302f', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), '7c691c7d-a58a-4ca0-bf3f-d6f828182190', 'artist', '10034596-47cb-46ba-9e80-9ea319a2c0df');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), 'aad87bec-591a-4822-989e-371151784038', 'artist', '10034596-47cb-46ba-9e80-9ea319a2c0df');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), 'b5594a3e-8a88-4b33-9d0c-7bc07f66a75b', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), 'b6fba039-60ad-4857-b06a-b86efaf6538c', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), 'bfc06686-ac2a-4882-93fe-0db1c1881275', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), 'e437dd3a-a402-41fb-b27f-ab2b30eba5e2', 'artist', '059a9e99-5d11-433e-97b9-9c35e57908f1');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez') AND locale = 'es'), 'e4cd0135-9abf-4d96-a796-0dadbdc1eb41', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

COMMIT;
