BEGIN;

-- Reverts 20260907001400_rewrite_dioni_fernandez_y_el_equipo_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'Dioni Fernández y El Equipo',
       sort_name = 'Fernández, Dioni y El Equipo',
       type = 'group',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'merengue',
       date_of_birth = '1952-03-24',
       birth_year = 1952,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'José',
       middle_name = 'Dionisio',
       last_name = 'Fernández',
       second_last_name = 'Zapata',
       stage_name = 'Dioni Fernández y El Equipo',
       aliases = ARRAY['Dioni Fernandez', 'El Equipo']::text[],
       occupations = '["bandleader","musician","arranger"]'::jsonb,
       instruments = ARRAY['piano']::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = '@dfestudio',
       facebook = 'dionifernandezoficial',
       instagram = 'dionifernandez_oficial',
       disambiguation = NULL,
       bio_en = 'José Dionisio Fernández Zapata, known artistically as Dioni Fernández, is one of the most influential Dominican musicians, arrangers, and orchestra leaders of the 20th century. Born in Los Mina, Santo Domingo, in March 1952, Dioni’s life and career trace the evolution of modern merengue, blending academic training, street‑level creativity, and a visionary approach to orchestration.

**Early Life and Origins**

Dioni’s name carries a story rooted in Dominican tradition. His grandmother, a devout Catholic, chose “Dionisio” from el almanaque de Bristol, a pharmacy calendar listing saints. As he recalls:

“Dionisio nombre pesado… lo suavizado un puesto más chiquito entonces viene Dioni.”

Raised between Los Mina and Gascue, Dioni lived through the turbulence of the 1965 Dominican Civil War, an experience that shaped his early worldview. His family relocated during the conflict, and it was in Los Mina where his musical curiosity began to flourish.

**Musical Formation**

Dioni’s first formal steps in music came through the guitar, studying with respected musician Roberto Olea, who introduced him to notation, harmony, and structured practice. Seeking academic grounding, he enrolled in the Conservatorio Nacional de Música, after completing two years at a private academy due to age restrictions.

His conservatory years exposed him to classical technique, discipline, and theory. Yet, life’s demands pulled him toward professional work before finishing the full program. Still, the foundation he built there became essential to his later innovations.

In the late 1970s, Dioni expanded his musical universe in New York City, studying orchestration with jazz arranger Don Sebesky and orchestrator Jorge Millet. These sessions—intensive, technical, and transformative—refined his arranging style and gave him the tools to craft the sophisticated merengue sound he would later pioneer.

**Rock Beginnings**

Before becoming a merengue icon, Dioni was a rock guitarist. He performed American rock with bands like Iron Fire, alongside musicians such as Rafael Comprés. He spent countless hours learning Santana solos by ear, replaying vinyl until the needle wore out. This period sharpened his musical instincts and broadened his stylistic palette.

**Entry into Professional Merengue**

Dioni’s professional breakthrough came in 1974, when he joined Félix del Rosario y Los Magos del Ritmo, one of the most popular orchestras of the era. Touring extensively, he gained real-world experience and industry visibility.

By the early 1980s, Dioni emerged as a central figure in Dominican popular music when he co‑founded El Equipo, an orchestra that revolutionized merengue with its refined arrangements, modern harmonies, and distinctive sound. His partnership with producer Bienvenido Rodríguez gave him creative freedom to select, arrange, and record songs—an unusual privilege in the industry.

**Architect of Iconic Merengues**

Dioni’s legacy is inseparable from the legendary songs he arranged. Many of these tracks became cultural landmarks, and the interview reveals the intimate stories behind them.

El Africano – Wilfrido Vargas

A last‑minute request at 2 AM led to one of merengue’s most recognizable hits. Dioni adapted the vallenato accordion lines into saxophone phrases and crafted an unconventional structure that defied commercial norms. Bienvenido Rodríguez trusted his instinct—and the song became a classic.

Julie – Rasputín

Co‑produced for CBS Records, “Julie” showcased Dioni’s ability to shape an artist’s sound while avoiding repetition. He intentionally changed the piano style to prevent it from sounding like El Equipo.

Compañera – Fernandito Villalona

Dioni added the iconic whistling intro, an intuitive touch that became part of his signature style:

“El silbido de adelante… esas ocurrencias mía.”

Me Gusta de Ti – Jerry Vargas

Originally a ballad singer, Jerry Vargas transitioned into merengue under Dioni’s guidance. The arrangement’s intro and harmonic color defined the song’s identity.

El Gran Comprés – Legrán Comprés

A tribute to Johnny Ventura’s style, this arrangement blended homage with innovation.

El Hombre Enamorado – Johnny Ventura

Dioni solved a harmonic puzzle Johnny himself couldn’t crack, discovering that the melody began on the dominant, not the tonic. He studied Ventura’s mambo style to match the orchestra’s energy.

El Guardia del Arsenal – Luis Díaz

Considered by Dioni one of the most beautiful merengues ever written, this song required weeks of experimentation. The breakthrough came when he imagined it as a primitive merengue with a simple saxophone lead. The famous whistling intro was improvised in the studio. Initially doubted by the label, the song became a cultural masterpiece.

**Philosophy of Arranging**

Dioni views arranging as a form of storytelling. Each song requires the right “vestido”—the correct musical clothing. He believes in intuition, simplicity, and emotional truth. His arrangements often included small, unexpected ideas that made songs stand out among dozens of merengues released at the time.

**Legacy**

Dioni Fernández is widely regarded as one of the architects of modern merengue. His work shaped the sound of the 1980s and influenced generations of musicians. Through El Equipo, his collaborations with giants like Wilfrido Vargas, Fernandito Villalona, Johnny Ventura, Rasputín, Jerry Vargas, and Luis Díaz, and his unmatched arranging style, Dioni left an indelible mark on Dominican music.

His biography is not just the story of a musician—it is the story of merengue’s evolution, told through the hands of a man who understood both its roots and its future.',
       bio_es = 'José Dionisio Fernández Zapata, conocido artísticamente como Dioni Fernández, es uno de los músicos, arreglistas y directores de orquesta más influyentes del merengue moderno. Nacido en Los Mina, Santo Domingo, en marzo de 1952, su vida refleja la evolución de la música popular dominicana a través de disciplina, creatividad e innovación.

**PRIMEROS AÑOS**

El nombre de Dioni fue elegido por su abuela a partir del tradicional almanaque Bristol. Él recuerda:

“Dionisio nombre pesado... lo suavizado un puesto más chiquito entonces viene Dioni.”

Creció entre Los Mina y Gascue, y vivió de cerca la Guerra Civil Dominicana de 1965, experiencia que marcó su infancia.

**FORMACIÓN MUSICAL**

Dioni comenzó estudiando guitarra con el músico Roberto Olea, quien le enseñó notación y armonía. Luego ingresó al Conservatorio Nacional de Música, después de completar dos años en una academia privada debido a restricciones de edad. Esta base académica sería fundamental en su carrera.

A finales de los años setenta viajó a Nueva York, donde estudió orquestación con Don Sebesky y Jorge Millet. Estas sesiones intensivas ampliaron su vocabulario musical y refinaron su estilo de arreglos.

**ETAPA ROCKERA**

Antes de dedicarse al merengue, Dioni fue guitarrista de rock en grupos como Iron Fire, interpretando música de Santana y otros artistas estadounidenses. Esta etapa fortaleció su oído y su versatilidad musical.

**ENTRADA AL MERENGUE PROFESIONAL**

En 1974 se unió a Félix del Rosario y Los Magos del Ritmo, una de las orquestas más populares de la época. Las giras y el trabajo constante le dieron experiencia profesional y reconocimiento.

A principios de los años ochenta cofundó El Equipo, una orquesta que transformó el merengue con armonías modernas, arreglos refinados y un sonido distintivo. El productor Bienvenido Rodríguez le otorgó libertad creativa para seleccionar, arreglar y grabar temas.

**ARREGLOS ICÓNICOS**

Dioni es responsable de algunos de los arreglos más importantes en la historia del merengue.

El Africano – Wilfrido Vargas

Arreglo creado de madrugada, adaptando líneas de acordeón vallenato al saxofón. Su estructura poco convencional se convirtió en un éxito.

Julie – Rasputín

Coproducido para CBS Records. Dioni cambió el estilo del piano para evitar que sonara como El Equipo.

Compañera – Fernandito Villalona

Incluye el famoso silbido inicial:

“El silbido de adelante... esas ocurrencias mía.”

Me Gusta de Ti – Jerry Vargas

Dioni guió a Jerry, originalmente baladista, hacia el merengue. El arreglo definió la identidad del tema.

El Gran Comprés – Legrán Comprés

Arreglo inspirado en el estilo de Johnny Ventura.

El Hombre Enamorado – Johnny Ventura

Dioni descubrió que la melodía comenzaba en la dominante, no en la tónica, resolviendo un problema armónico que Johnny no lograba definir.

El Guardia del Arsenal – Luis Díaz

Considerado por Dioni como uno de los merengues más hermosos. Tardó semanas en encontrar el arreglo adecuado. El silbido inicial fue improvisado en el estudio.

**SU FILOSOFÍA COMO ARREGLISTA**

Dioni cree que cada canción necesita el “vestido” correcto. Su enfoque combina intuición, sencillez y verdad emocional. Sus arreglos suelen incluir ideas pequeñas pero distintivas que los hacen resaltar entre otros merengues de su época.

**LEGADO**

Dioni Fernández es reconocido como un arquitecto del merengue moderno. Su trabajo con El Equipo, sus colaboraciones con grandes artistas y su estilo innovador definieron el sonido del merengue en los años ochenta y dejaron una huella permanente en la música dominicana.',
       updated_at = now()
 WHERE slug = 'dioni-fernandez-y-el-equipo';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"José Dionisio Fernández Zapata, known artistically as ","type":"text"},{"type":"artistReference","attrs":{"artistId":"fb2c703f-5362-47dd-ada0-7c6d5e106f3b","displayText":"Dioni Fernández","occurrenceId":"1afc9647-65bc-4714-9340-aa87dde49c7a"}},{"text":", is one of the most influential Dominican musicians, arrangers, and orchestra leaders of the 20th century. Born in Los Mina, Santo Domingo, in March 1952, Dioni’s life and career trace the evolution of modern merengue, blending academic training, street‑level creativity, and a visionary approach to orchestration.","type":"text"}]},{"type":"paragraph","content":[{"text":"Early Life and Origins","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dioni’s name carries a story rooted in Dominican tradition. His grandmother, a devout Catholic, chose “Dionisio” from el almanaque de Bristol, a pharmacy calendar listing saints. As he recalls:","type":"text"}]},{"type":"paragraph","content":[{"text":"“Dionisio nombre pesado… lo suavizado un puesto más chiquito entonces viene Dioni.”","type":"text"}]},{"type":"paragraph","content":[{"text":"Raised between Los Mina and Gascue, Dioni lived through the turbulence of the 1965 Dominican Civil War, an experience that shaped his early worldview. His family relocated during the conflict, and it was in Los Mina where his musical curiosity began to flourish.","type":"text"}]},{"type":"paragraph","content":[{"text":"Musical Formation","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dioni’s first formal steps in music came through the guitar, studying with respected musician Roberto Olea, who introduced him to notation, harmony, and structured practice. Seeking academic grounding, he enrolled in the Conservatorio Nacional de Música, after completing two years at a private academy due to age restrictions.","type":"text"}]},{"type":"paragraph","content":[{"text":"His conservatory years exposed him to classical technique, discipline, and theory. Yet, life’s demands pulled him toward professional work before finishing the full program. Still, the foundation he built there became essential to his later innovations.","type":"text"}]},{"type":"paragraph","content":[{"text":"In the late 1970s, Dioni expanded his musical universe in New York City, studying orchestration with jazz arranger Don Sebesky and orchestrator Jorge Millet. These sessions—intensive, technical, and transformative—refined his arranging style and gave him the tools to craft the sophisticated merengue sound he would later pioneer.","type":"text"}]},{"type":"paragraph","content":[{"text":"Rock Beginnings","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Before becoming a merengue icon, Dioni was a rock guitarist. He performed American rock with bands like Iron Fire, alongside musicians such as Rafael Comprés. He spent countless hours learning Santana solos by ear, replaying vinyl until the needle wore out. This period sharpened his musical instincts and broadened his stylistic palette.","type":"text"}]},{"type":"paragraph","content":[{"text":"Entry into Professional Merengue","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dioni’s professional breakthrough came in 1974, when he joined Félix del Rosario y Los Magos del Ritmo, one of the most popular orchestras of the era. Touring extensively, he gained real-world experience and industry visibility.","type":"text"}]},{"type":"paragraph","content":[{"text":"By the early 1980s, Dioni emerged as a central figure in Dominican popular music when he co‑founded El Equipo, an orchestra that revolutionized merengue with its refined arrangements, modern harmonies, and distinctive sound. His partnership with producer Bienvenido Rodríguez gave him creative freedom to select, arrange, and record songs—an unusual privilege in the industry.","type":"text"}]},{"type":"paragraph","content":[{"text":"Architect of Iconic Merengues","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dioni’s legacy is inseparable from the legendary songs he arranged. Many of these tracks became cultural landmarks, and the interview reveals the intimate stories behind them.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Africano – ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"e76dff1c-46d4-44ec-abf8-eba243c6cd38"}},{"text":"","type":"text"}]},{"type":"paragraph","content":[{"text":"A last‑minute request at 2 AM led to one of merengue’s most recognizable hits. Dioni adapted the vallenato accordion lines into saxophone phrases and crafted an unconventional structure that defied commercial norms. Bienvenido Rodríguez trusted his instinct—and the song became a classic.","type":"text"}]},{"type":"paragraph","content":[{"text":"Julie – Rasputín","type":"text"}]},{"type":"paragraph","content":[{"text":"Co‑produced for CBS Records, “Julie” showcased Dioni’s ability to shape an artist’s sound while avoiding repetition. He intentionally changed the piano style to prevent it from sounding like El Equipo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Compañera – Fernandito Villalona","type":"text"}]},{"type":"paragraph","content":[{"text":"Dioni added the iconic whistling intro, an intuitive touch that became part of his signature style:","type":"text"}]},{"type":"paragraph","content":[{"text":"“El silbido de adelante… esas ocurrencias mía.”","type":"text"}]},{"type":"paragraph","content":[{"text":"Me Gusta de Ti – Jerry Vargas","type":"text"}]},{"type":"paragraph","content":[{"text":"Originally a ballad singer, Jerry Vargas transitioned into merengue under Dioni’s guidance. The arrangement’s intro and harmonic color defined the song’s identity.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Gran Comprés – Legrán Comprés","type":"text"}]},{"type":"paragraph","content":[{"text":"A tribute to ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"57645d3f-cacf-47a0-a439-0d6fbe807479"}},{"text":"’s style, this arrangement blended homage with innovation.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Hombre Enamorado – ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"549e556b-5234-4535-bcf7-e29c295a4978"}},{"text":"","type":"text"}]},{"type":"paragraph","content":[{"text":"Dioni solved a harmonic puzzle Johnny himself couldn’t crack, discovering that the melody began on the dominant, not the tonic. He studied Ventura’s mambo style to match the orchestra’s energy.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Guardia del Arsenal – Luis Díaz","type":"text"}]},{"type":"paragraph","content":[{"text":"Considered by Dioni one of the most beautiful merengues ever written, this song required weeks of experimentation. The breakthrough came when he imagined it as a primitive merengue with a simple saxophone lead. The famous whistling intro was improvised in the studio. Initially doubted by the label, the song became a cultural masterpiece.","type":"text"}]},{"type":"paragraph","content":[{"text":"Philosophy of Arranging","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dioni views arranging as a form of storytelling. Each song requires the right “vestido”—the correct musical clothing. He believes in intuition, simplicity, and emotional truth. His arrangements often included small, unexpected ideas that made songs stand out among dozens of merengues released at the time.","type":"text"}]},{"type":"paragraph","content":[{"text":"Legacy","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"artistReference","attrs":{"artistId":"fb2c703f-5362-47dd-ada0-7c6d5e106f3b","displayText":"Dioni Fernández","occurrenceId":"cbab7fc9-05e3-4d7d-94df-0958bef23e47"}},{"text":" is widely regarded as one of the architects of modern merengue. His work shaped the sound of the 1980s and influenced generations of musicians. Through El Equipo, his collaborations with giants like ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"0b12a038-5639-4453-8c08-7d68b9bd6021"}},{"text":", Fernandito Villalona, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"52ea8cb7-34a9-43af-a8d2-60898f639511"}},{"text":", Rasputín, Jerry Vargas, and Luis Díaz, and his unmatched arranging style, Dioni left an indelible mark on Dominican music.","type":"text"}]},{"type":"paragraph","content":[{"text":"His biography is not just the story of a musician—it is the story of merengue’s evolution, told through the hands of a man who understood both its roots and its future.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo'), 3)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"José Dionisio Fernández Zapata, conocido artísticamente como ","type":"text"},{"type":"artistReference","attrs":{"artistId":"fb2c703f-5362-47dd-ada0-7c6d5e106f3b","displayText":"Dioni Fernández","occurrenceId":"ad822e6e-31fe-4734-b472-0a329a8392f8"}},{"text":", es uno de los músicos, arreglistas y directores de orquesta más influyentes del merengue moderno. Nacido en Los Mina, Santo Domingo, en marzo de 1952, su vida refleja la evolución de la música popular dominicana a través de disciplina, creatividad e innovación.","type":"text"}]},{"type":"paragraph","content":[{"text":"PRIMEROS AÑOS","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El nombre de Dioni fue elegido por su abuela a partir del tradicional almanaque Bristol. Él recuerda:","type":"text"}]},{"type":"paragraph","content":[{"text":"“Dionisio nombre pesado... lo suavizado un puesto más chiquito entonces viene Dioni.”","type":"text"}]},{"type":"paragraph","content":[{"text":"Creció entre Los Mina y Gascue, y vivió de cerca la Guerra Civil Dominicana de 1965, experiencia que marcó su infancia.","type":"text"}]},{"type":"paragraph","content":[{"text":"FORMACIÓN MUSICAL","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dioni comenzó estudiando guitarra con el músico Roberto Olea, quien le enseñó notación y armonía. Luego ingresó al Conservatorio Nacional de Música, después de completar dos años en una academia privada debido a restricciones de edad. Esta base académica sería fundamental en su carrera.","type":"text"}]},{"type":"paragraph","content":[{"text":"A finales de los años setenta viajó a Nueva York, donde estudió orquestación con Don Sebesky y Jorge Millet. Estas sesiones intensivas ampliaron su vocabulario musical y refinaron su estilo de arreglos.","type":"text"}]},{"type":"paragraph","content":[{"text":"ETAPA ROCKERA","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Antes de dedicarse al merengue, Dioni fue guitarrista de rock en grupos como Iron Fire, interpretando música de Santana y otros artistas estadounidenses. Esta etapa fortaleció su oído y su versatilidad musical.","type":"text"}]},{"type":"paragraph","content":[{"text":"ENTRADA AL MERENGUE PROFESIONAL","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En 1974 se unió a Félix del Rosario y Los Magos del Ritmo, una de las orquestas más populares de la época. Las giras y el trabajo constante le dieron experiencia profesional y reconocimiento.","type":"text"}]},{"type":"paragraph","content":[{"text":"A principios de los años ochenta cofundó El Equipo, una orquesta que transformó el merengue con armonías modernas, arreglos refinados y un sonido distintivo. El productor Bienvenido Rodríguez le otorgó libertad creativa para seleccionar, arreglar y grabar temas.","type":"text"}]},{"type":"paragraph","content":[{"text":"ARREGLOS ICÓNICOS","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dioni es responsable de algunos de los arreglos más importantes en la historia del merengue.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Africano – ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"d84c1d15-b69f-4ec5-a279-e86dc45f2c3d"}},{"text":"","type":"text"}]},{"type":"paragraph","content":[{"text":"Arreglo creado de madrugada, adaptando líneas de acordeón vallenato al saxofón. Su estructura poco convencional se convirtió en un éxito.","type":"text"}]},{"type":"paragraph","content":[{"text":"Julie – Rasputín","type":"text"}]},{"type":"paragraph","content":[{"text":"Coproducido para CBS Records. Dioni cambió el estilo del piano para evitar que sonara como El Equipo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Compañera – Fernandito Villalona","type":"text"}]},{"type":"paragraph","content":[{"text":"Incluye el famoso silbido inicial:","type":"text"}]},{"type":"paragraph","content":[{"text":"“El silbido de adelante... esas ocurrencias mía.”","type":"text"}]},{"type":"paragraph","content":[{"text":"Me Gusta de Ti – Jerry Vargas","type":"text"}]},{"type":"paragraph","content":[{"text":"Dioni guió a Jerry, originalmente baladista, hacia el merengue. El arreglo definió la identidad del tema.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Gran Comprés – Legrán Comprés","type":"text"}]},{"type":"paragraph","content":[{"text":"Arreglo inspirado en el estilo de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"b571d63e-4151-4505-8cac-7a285b169e4b"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"El Hombre Enamorado – ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"36978562-5956-4464-8d2e-213940052ffc"}},{"text":"","type":"text"}]},{"type":"paragraph","content":[{"text":"Dioni descubrió que la melodía comenzaba en la dominante, no en la tónica, resolviendo un problema armónico que Johnny no lograba definir.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Guardia del Arsenal – Luis Díaz","type":"text"}]},{"type":"paragraph","content":[{"text":"Considerado por Dioni como uno de los merengues más hermosos. Tardó semanas en encontrar el arreglo adecuado. El silbido inicial fue improvisado en el estudio.","type":"text"}]},{"type":"paragraph","content":[{"text":"SU FILOSOFÍA COMO ARREGLISTA","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dioni cree que cada canción necesita el “vestido” correcto. Su enfoque combina intuición, sencillez y verdad emocional. Sus arreglos suelen incluir ideas pequeñas pero distintivas que los hacen resaltar entre otros merengues de su época.","type":"text"}]},{"type":"paragraph","content":[{"text":"LEGADO","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"artistReference","attrs":{"artistId":"fb2c703f-5362-47dd-ada0-7c6d5e106f3b","displayText":"Dioni Fernández","occurrenceId":"7be9f061-3309-4eec-ac5c-c7d0a107df1a"}},{"text":" es reconocido como un arquitecto del merengue moderno. Su trabajo con El Equipo, sus colaboraciones con grandes artistas y su estilo innovador definieron el sonido del merengue en los años ochenta y dejaron una huella permanente en la música dominicana.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo'), 3)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'en'), '0b12a038-5639-4453-8c08-7d68b9bd6021', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'en'), '1afc9647-65bc-4714-9340-aa87dde49c7a', 'artist', 'fb2c703f-5362-47dd-ada0-7c6d5e106f3b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'en'), '52ea8cb7-34a9-43af-a8d2-60898f639511', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'en'), '549e556b-5234-4535-bcf7-e29c295a4978', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'en'), '57645d3f-cacf-47a0-a439-0d6fbe807479', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'en'), 'cbab7fc9-05e3-4d7d-94df-0958bef23e47', 'artist', 'fb2c703f-5362-47dd-ada0-7c6d5e106f3b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'en'), 'e76dff1c-46d4-44ec-abf8-eba243c6cd38', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'es'), '36978562-5956-4464-8d2e-213940052ffc', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'es'), '7be9f061-3309-4eec-ac5c-c7d0a107df1a', 'artist', 'fb2c703f-5362-47dd-ada0-7c6d5e106f3b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'es'), 'ad822e6e-31fe-4734-b472-0a329a8392f8', 'artist', 'fb2c703f-5362-47dd-ada0-7c6d5e106f3b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'es'), 'b571d63e-4151-4505-8cac-7a285b169e4b', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dioni-fernandez-y-el-equipo') AND locale = 'es'), 'd84c1d15-b69f-4ec5-a279-e86dc45f2c3d', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

COMMIT;
