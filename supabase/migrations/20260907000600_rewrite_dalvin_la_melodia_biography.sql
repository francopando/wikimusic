BEGIN;

-- Rewrite the catalogue entry for Dalvin la Melodía.
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
       name = 'Dalvin la Melodía',
       sort_name = NULL,
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
       stage_name = NULL,
       aliases = ARRAY[]::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = 'https://www.dalvinlamelodiausa.com',
       youtube = '@DalvinLaMelodiaOfficial',
       facebook = 'dalvinlamelodiaofficial',
       instagram = 'dalvinmelody',
       disambiguation = NULL,
       bio_en = 'Dalvin Antonio Núñez Vargas (born June 7, 2003, Santo Domingo, Dominican Republic) is a Dominican bachata singer and songwriter recognized as one of the most prominent emerging voices of the genre’s new generation. His rise began between 2024 and 2026, driven by viral digital exposure, rapid audience growth, and the success of singles such as “Mi reina”, “Chiquilla bonita”, “Por ti”, and “Pensando en ella.” His work blends traditional bachata elements with contemporary arrangements, positioning him as a leading figure in the modernization of Dominican romantic music.

**Early Life and Background**

Dalvin Núñez was raised in a low‑income urban environment in Santo Domingo. From childhood he worked in various informal jobs to support his household, including shoeshiner, street vendor, car washer, delivery worker, and motoconchista. He attended school until approximately age 14–15, after which he began working more consistently.

His earliest musical experiences occurred in church, where he sang alongside his father. Although he did not initially plan to pursue music professionally, friends and acquaintances—particularly Giancarlos and El Gigo—encouraged him to record informal vocal performances, which later became the foundation of his early digital presence.

**Professional Beginnings**

Dalvin’s professional career began in 2024 after meeting guitarist and producer Michael Quevedo (Mikey Touch). Quevedo identified his potential and began supporting him financially and musically, even before any formal agreement existed. During this period, Dalvin continued working as a motoconchista while recording his first songs.

His earliest releases—“Pensando en ella,” “Ajena,” “Por ti,” and “Mi reina”—were initially shared on social media and digital platforms, where they quickly gained traction. His first paid performance took place in Los Guandules, Santo Domingo, where he performed four songs for a fee of 5,000 pesos.

**Rise to Popularity**

**Breakthrough with “Mi reina”**

Dalvin’s first major commercial breakthrough came with “Mi reina,” a composition by Martín Aquino. The song was a massive success, establishing him as a rising figure in Dominican bachata and expanding his audience internationally.

**“Chiquilla bonita”**

The bachata version of “Chiquilla bonita” originated as part of his live repertoire. After recording the song in studio, it went viral within a day of release, becoming one of his most widely recognized tracks.

**Additional Releases**

Between 2024 and 2026, Dalvin released several singles that strengthened his digital presence:

- “Por ti” – an original composition inspired by personal experiences.  
- “Pensando en ella” – a tribute to Yóskar Sarante.  
- “Tesoro perdido” – later included in his debut album.  
- “Suéltenla” – a modern bachata release that expanded his audience.

**Collaborations and International Projection**

In 2025, Dalvin recorded a session with Romeo Santos, facilitated by composer Martín Aquino. The collaboration took place in Santo Domingo and formed part of a joint project between Romeo Santos and Prince Royce, with Dalvin as the only external invited artist.

His growing popularity led to performances in the Dominican Republic, the United States, San Martín, Curaçao, and preparations for his first European tour.

**Musical Style**

Dalvin La Melodía’s style is defined by:

- a melodic, soft vocal approach,  
- incorporation of traditional amargue elements,  
- contemporary arrangements aimed at younger audiences,  
- lyrics centered on personal experiences, love, and heartbreak.

His influences include Anthony Santos, Romeo Santos, Zacarías Ferreira, El Chaval de la Bachata, and contemporary artists such as Jay Wheeler.

**Personal Context**

Before achieving recognition, Dalvin lived in precarious conditions with his partner Kira, sharing periods of financial instability, informal work, and housing challenges. Their story has been highlighted in Dominican media as an example of perseverance and upward mobility within the urban music scene.

**Legacy and Contemporary Relevance**

Despite his young age, Dalvin La Melodía is considered one of the most promising voices in modern bachata. His impact is reflected in:

- rapid viral growth across digital platforms,  
- strong connection with younger audiences,  
- integration of modern production without abandoning traditional elements,  
- participation in high‑profile collaborations,  
- and early international expansion.

He is widely regarded as part of the new wave of Dominican bachateros contributing to the genre’s global evolution.',
       bio_es = 'Dalvin Antonio Núñez Vargas (nacido el 7 de junio de 2003 en Santo Domingo, República Dominicana) es un cantante y compositor dominicano de bachata, considerado una de las figuras emergentes más destacadas de la nueva generación del género. Su ascenso se produjo entre 2024 y 2026, impulsado por la viralidad de sus primeras grabaciones, su presencia en redes sociales y la consolidación de éxitos como “Mi reina”, “Chiquilla bonita”, “Por ti” y “Pensando en ella”. Su propuesta combina elementos de la bachata tradicional con arreglos contemporáneos y una estética juvenil que ha conectado con audiencias locales e internacionales.

**Primeros años y formación**

Dalvin Núñez creció en un entorno de recursos limitados en Santo Domingo. Desde la infancia realizó diversos oficios para contribuir económicamente en su hogar, incluyendo limpiabotas, vendedor ambulante, lavador de autos, delivery y motoconchista. Estas actividades se desarrollaron paralelamente a su educación básica, la cual cursó hasta aproximadamente los 14–15 años, momento en el que comenzó a trabajar de manera más constante.

Su primera aproximación a la música ocurrió en el coro de la iglesia, donde cantaba junto a su padre. Aunque inicialmente no consideraba dedicarse profesionalmente al canto, personas de su entorno —incluyendo amigos como Giancarlos y El Gigo— lo motivaron a grabar sus primeras interpretaciones informales.

**Inicios profesionales**

El inicio formal de su carrera se produjo en 2024, cuando conoció al guitarrista y productor Michael Quevedo (Mikey Touch). Quevedo identificó su potencial y comenzó a apoyarlo económicamente y musicalmente, incluso antes de firmar un acuerdo formal. Durante este periodo, Dalvin continuaba trabajando como motoconchista mientras grababa sus primeras canciones.

Las primeras grabaciones —incluyendo “Pensando en ella”, “Ajena”, “Por ti” y “Mi reina”— se difundieron inicialmente en redes sociales y plataformas digitales, donde comenzaron a viralizarse. Su primera presentación pagada se realizó en Los Guandules, Santo Domingo, interpretando cuatro temas por un pago de 5,000 pesos y una botella de ron.

**Ascenso y consolidación**

**“Mi reina” y la viralidad digital**

El lanzamiento de “Mi reina”, composición de Martín Aquino, marcó su primer gran impacto comercial. El tema fue un éxito rotundo, convirtiéndose en su carta de presentación ante el público dominicano e internacional.

**“Chiquilla bonita”**

La versión bachata de “Chiquilla bonita” surgió inicialmente como parte del repertorio para presentaciones en vivo. Tras grabarla en estudio, el tema se viralizó en cuestión de horas, consolidándose como uno de sus éxitos más difundidos.

**Otros lanzamientos**

Entre 2024 y 2026 publicó varios sencillos que ampliaron su presencia en plataformas digitales:

- “Por ti” – composición original basada en experiencias personales.  
- “Pensando en ella” – homenaje a Yóskar Sarante.  
- “Tesoro perdido” – sencillo incluido posteriormente en su primer álbum.  
- “Suéltenla” – lanzamiento que reafirmó su presencia en la bachata moderna.

**Colaboraciones y proyección internacional**

En 2025, Dalvin participó en una sesión de grabación junto a Romeo Santos, facilitada por el compositor Martín Aquino. La colaboración se realizó en Santo Domingo y formó parte de un proyecto conjunto entre Romeo Santos y Prince Royce, donde Dalvin fue el único artista invitado externo.

Su creciente popularidad lo llevó a realizar presentaciones en República Dominicana, Estados Unidos, San Martín, Curazao y posteriormente a preparar su primer Eurotour.

**Estilo musical**

Dalvin La Melodía se caracteriza por una voz suave, melódica y orientada al sentimiento romántico. Su estilo combina:

- elementos tradicionales del amargue,  
- fusiones con pop y ritmos urbanos,  
- arreglos modernos dirigidos a audiencias jóvenes,  
- letras centradas en experiencias personales, amor y desamor.

Sus influencias incluyen a Anthony Santos, Romeo Santos, Zacarías Ferreira, El Chaval de la Bachata y artistas contemporáneos como Jay Wheeler.

**Contexto social**

Antes de su ascenso, Dalvin vivió en condiciones de precariedad atravesando dificultades económicas, viviendas en mal estado y trabajos informales. Ambos han relatado públicamente el proceso de superación que vivieron antes de estabilizarse económicamente gracias a la música.

Su historia ha sido destacada en prensa como ejemplo de resiliencia y movilidad social dentro del contexto urbano dominicano.

**Legado y relevancia contemporánea**

A pesar de su corta trayectoria, Dalvin La Melodía es considerado una de las voces más prometedoras de la bachata moderna. Su impacto se refleja en:

- la rápida viralidad de sus primeros lanzamientos,  
- la consolidación de una audiencia joven,  
- la integración de elementos contemporáneos sin perder la esencia tradicional del género,  
- su presencia en colaboraciones de alto perfil,  
- y su proyección internacional temprana.

La crítica especializada lo identifica como parte de la nueva generación de bachateros que está renovando el género y ampliando su alcance global.',
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
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Dalvin Antonio Núñez Vargas (born June 7, 2003, Santo Domingo, Dominican Republic) is a Dominican bachata singer and songwriter recognized as one of the most prominent emerging voices of the genre’s new generation. His rise began between 2024 and 2026, driven by viral digital exposure, rapid audience growth, and the success of singles such as “Mi reina”, “Chiquilla bonita”, “Por ti”, and “Pensando en ella.” His work blends traditional bachata elements with contemporary arrangements, positioning him as a leading figure in the modernization of Dominican romantic music.","type":"text"}]},{"type":"paragraph","content":[{"text":"Early Life and Background","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dalvin Núñez was raised in a low‑income urban environment in Santo Domingo. From childhood he worked in various informal jobs to support his household, including shoeshiner, street vendor, car washer, delivery worker, and motoconchista. He attended school until approximately age 14–15, after which he began working more consistently.","type":"text"}]},{"type":"paragraph","content":[{"text":"His earliest musical experiences occurred in church, where he sang alongside his father. Although he did not initially plan to pursue music professionally, friends and acquaintances—particularly Giancarlos and El Gigo—encouraged him to record informal vocal performances, which later became the foundation of his early digital presence.","type":"text"}]},{"type":"paragraph","content":[{"text":"Professional Beginnings","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dalvin’s professional career began in 2024 after meeting guitarist and producer Michael Quevedo (Mikey Touch). Quevedo identified his potential and began supporting him financially and musically, even before any formal agreement existed. During this period, Dalvin continued working as a motoconchista while recording his first songs.","type":"text"}]},{"type":"paragraph","content":[{"text":"His earliest releases—“Pensando en ella,” “Ajena,” “Por ti,” and “Mi reina”—were initially shared on social media and digital platforms, where they quickly gained traction. His first paid performance took place in Los Guandules, Santo Domingo, where he performed four songs for a fee of 5,000 pesos.","type":"text"}]},{"type":"paragraph","content":[{"text":"Rise to Popularity","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Breakthrough with “Mi reina”","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dalvin’s first major commercial breakthrough came with “Mi reina,” a composition by Martín Aquino. The song was a massive success, establishing him as a rising figure in Dominican bachata and expanding his audience internationally.","type":"text"}]},{"type":"paragraph","content":[{"text":"“Chiquilla bonita”","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The bachata version of “Chiquilla bonita” originated as part of his live repertoire. After recording the song in studio, it went viral within a day of release, becoming one of his most widely recognized tracks.","type":"text"}]},{"type":"paragraph","content":[{"text":"Additional Releases","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Between 2024 and 2026, Dalvin released several singles that strengthened his digital presence:","type":"text"}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"“Por ti” – an original composition inspired by personal experiences.","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"“Pensando en ella” – a tribute to Yóskar Sarante.","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"“Tesoro perdido” – later included in his debut album.","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"“Suéltenla” – a modern bachata release that expanded his audience.","type":"text"}]}]}]},{"type":"paragraph","content":[{"text":"Collaborations and International Projection","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In 2025, Dalvin recorded a session with Romeo Santos, facilitated by composer Martín Aquino. The collaboration took place in Santo Domingo and formed part of a joint project between Romeo Santos and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9c02d1a1-952e-4855-9b60-c0266236378d","displayText":"Prince Royce","occurrenceId":"9af5208c-6acd-4c13-ae51-f8f23e66bcb7"}},{"text":", with Dalvin as the only external invited artist.","type":"text"}]},{"type":"paragraph","content":[{"text":"His growing popularity led to performances in the Dominican Republic, the United States, San Martín, Curaçao, and preparations for his first European tour.","type":"text"}]},{"type":"paragraph","content":[{"text":"Musical Style","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dalvin La Melodía’s style is defined by:","type":"text"}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"a melodic, soft vocal approach,","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"incorporation of traditional amargue elements,","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"contemporary arrangements aimed at younger audiences,","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"lyrics centered on personal experiences, love, and heartbreak.","type":"text"}]}]}]},{"type":"paragraph","content":[{"text":"His influences include Anthony Santos, Romeo Santos, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"a77079ce-351a-4eb5-baef-de02dc1b62ce","displayText":"Zacarías Ferreira","occurrenceId":"a937accc-41ba-42bc-8c89-4306c0329c89"}},{"text":", El Chaval de la Bachata, and contemporary artists such as Jay Wheeler.","type":"text"}]},{"type":"paragraph","content":[{"text":"Personal Context","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Before achieving recognition, Dalvin lived in precarious conditions with his partner Kira, sharing periods of financial instability, informal work, and housing challenges. Their story has been highlighted in Dominican media as an example of perseverance and upward mobility within the urban music scene.","type":"text"}]},{"type":"paragraph","content":[{"text":"Legacy and Contemporary Relevance","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Despite his young age, Dalvin La Melodía is considered one of the most promising voices in modern bachata. His impact is reflected in:","type":"text"}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"rapid viral growth across digital platforms,","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"strong connection with younger audiences,","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"integration of modern production without abandoning traditional elements,","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"participation in high‑profile collaborations,","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"and early international expansion.","type":"text"}]}]}]},{"type":"paragraph","content":[{"text":"He is widely regarded as part of the new wave of Dominican bachateros contributing to the genre’s global evolution.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'dalvin-la-melodia'), 4)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Dalvin Antonio Núñez Vargas (nacido el 7 de junio de 2003 en Santo Domingo, República Dominicana) es un cantante y compositor dominicano de bachata, considerado una de las figuras emergentes más destacadas de la nueva generación del género. Su ascenso se produjo entre 2024 y 2026, impulsado por la viralidad de sus primeras grabaciones, su presencia en redes sociales y la consolidación de éxitos como “Mi reina”, “Chiquilla bonita”, “Por ti” y “Pensando en ella”. Su propuesta combina elementos de la bachata tradicional con arreglos contemporáneos y una estética juvenil que ha conectado con audiencias locales e internacionales.","type":"text"}]},{"type":"paragraph","content":[{"text":"Primeros años y formación","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dalvin Núñez creció en un entorno de recursos limitados en Santo Domingo. Desde la infancia realizó diversos oficios para contribuir económicamente en su hogar, incluyendo limpiabotas, vendedor ambulante, lavador de autos, delivery y motoconchista. Estas actividades se desarrollaron paralelamente a su educación básica, la cual cursó hasta aproximadamente los 14–15 años, momento en el que comenzó a trabajar de manera más constante.","type":"text"}]},{"type":"paragraph","content":[{"text":"Su primera aproximación a la música ocurrió en el coro de la iglesia, donde cantaba junto a su padre. Aunque inicialmente no consideraba dedicarse profesionalmente al canto, personas de su entorno —incluyendo amigos como Giancarlos y El Gigo— lo motivaron a grabar sus primeras interpretaciones informales.","type":"text"}]},{"type":"paragraph","content":[{"text":"Inicios profesionales","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El inicio formal de su carrera se produjo en 2024, cuando conoció al guitarrista y productor Michael Quevedo (Mikey Touch). Quevedo identificó su potencial y comenzó a apoyarlo económicamente y musicalmente, incluso antes de firmar un acuerdo formal. Durante este periodo, Dalvin continuaba trabajando como motoconchista mientras grababa sus primeras canciones.","type":"text"}]},{"type":"paragraph","content":[{"text":"Las primeras grabaciones —incluyendo “Pensando en ella”, “Ajena”, “Por ti” y “Mi reina”— se difundieron inicialmente en redes sociales y plataformas digitales, donde comenzaron a viralizarse. Su primera presentación pagada se realizó en Los Guandules, Santo Domingo, interpretando cuatro temas por un pago de 5,000 pesos y una botella de ron.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ascenso y consolidación","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"“Mi reina” y la viralidad digital","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El lanzamiento de “Mi reina”, composición de Martín Aquino, marcó su primer gran impacto comercial. El tema fue un éxito rotundo, convirtiéndose en su carta de presentación ante el público dominicano e internacional.","type":"text"}]},{"type":"paragraph","content":[{"text":"“Chiquilla bonita”","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La versión bachata de “Chiquilla bonita” surgió inicialmente como parte del repertorio para presentaciones en vivo. Tras grabarla en estudio, el tema se viralizó en cuestión de horas, consolidándose como uno de sus éxitos más difundidos.","type":"text"}]},{"type":"paragraph","content":[{"text":"Otros lanzamientos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Entre 2024 y 2026 publicó varios sencillos que ampliaron su presencia en plataformas digitales:","type":"text"}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"“Por ti” – composición original basada en experiencias personales.","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"“Pensando en ella” – homenaje a Yóskar Sarante.","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"“Tesoro perdido” – sencillo incluido posteriormente en su primer álbum.","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"“Suéltenla” – lanzamiento que reafirmó su presencia en la bachata moderna.","type":"text"}]}]}]},{"type":"paragraph","content":[{"text":"Colaboraciones y proyección internacional","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En 2025, Dalvin participó en una sesión de grabación junto a Romeo Santos, facilitada por el compositor Martín Aquino. La colaboración se realizó en Santo Domingo y formó parte de un proyecto conjunto entre Romeo Santos y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9c02d1a1-952e-4855-9b60-c0266236378d","displayText":"Prince Royce","occurrenceId":"ac9681c5-3508-4c27-b00a-b0fbad9d7c63"}},{"text":", donde Dalvin fue el único artista invitado externo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Su creciente popularidad lo llevó a realizar presentaciones en República Dominicana, Estados Unidos, San Martín, Curazao y posteriormente a preparar su primer Eurotour.","type":"text"}]},{"type":"paragraph","content":[{"text":"Estilo musical","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dalvin La Melodía se caracteriza por una voz suave, melódica y orientada al sentimiento romántico. Su estilo combina:","type":"text"}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"elementos tradicionales del amargue,","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"fusiones con pop y ritmos urbanos,","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"arreglos modernos dirigidos a audiencias jóvenes,","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"letras centradas en experiencias personales, amor y desamor.","type":"text"}]}]}]},{"type":"paragraph","content":[{"text":"Sus influencias incluyen a Anthony Santos, Romeo Santos, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"a77079ce-351a-4eb5-baef-de02dc1b62ce","displayText":"Zacarías Ferreira","occurrenceId":"db98e0e4-1a99-4156-81fa-4530b52778e8"}},{"text":", El Chaval de la Bachata y artistas contemporáneos como Jay Wheeler.","type":"text"}]},{"type":"paragraph","content":[{"text":"Contexto social","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Antes de su ascenso, Dalvin vivió en condiciones de precariedad atravesando dificultades económicas, viviendas en mal estado y trabajos informales. Ambos han relatado públicamente el proceso de superación que vivieron antes de estabilizarse económicamente gracias a la música.","type":"text"}]},{"type":"paragraph","content":[{"text":"Su historia ha sido destacada en prensa como ejemplo de resiliencia y movilidad social dentro del contexto urbano dominicano.","type":"text"}]},{"type":"paragraph","content":[{"text":"Legado y relevancia contemporánea","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"A pesar de su corta trayectoria, Dalvin La Melodía es considerado una de las voces más prometedoras de la bachata moderna. Su impacto se refleja en:","type":"text"}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"la rápida viralidad de sus primeros lanzamientos,","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"la consolidación de una audiencia joven,","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"la integración de elementos contemporáneos sin perder la esencia tradicional del género,","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"su presencia en colaboraciones de alto perfil,","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"y su proyección internacional temprana.","type":"text"}]}]}]},{"type":"paragraph","content":[{"text":"La crítica especializada lo identifica como parte de la nueva generación de bachateros que está renovando el género y ampliando su alcance global.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'dalvin-la-melodia'), 5)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dalvin-la-melodia') AND locale = 'en'), '9af5208c-6acd-4c13-ae51-f8f23e66bcb7', 'artist', '9c02d1a1-952e-4855-9b60-c0266236378d');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dalvin-la-melodia') AND locale = 'en'), 'a937accc-41ba-42bc-8c89-4306c0329c89', 'artist', 'a77079ce-351a-4eb5-baef-de02dc1b62ce');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dalvin-la-melodia') AND locale = 'es'), 'ac9681c5-3508-4c27-b00a-b0fbad9d7c63', 'artist', '9c02d1a1-952e-4855-9b60-c0266236378d');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dalvin-la-melodia') AND locale = 'es'), 'db98e0e4-1a99-4156-81fa-4530b52778e8', 'artist', 'a77079ce-351a-4eb5-baef-de02dc1b62ce');

COMMIT;
