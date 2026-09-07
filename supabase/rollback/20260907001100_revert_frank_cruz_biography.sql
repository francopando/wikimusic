BEGIN;

-- Reverts 20260907001100_rewrite_frank_cruz_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'Frank Cruz',
       sort_name = 'Cruz, Frank',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = TRUE,
       primary_role = 'singer',
       primary_genre = 'merengue',
       date_of_birth = '1927-06-28',
       birth_year = 1927,
       date_of_death = '2020-02-18',
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Francisco',
       middle_name = NULL,
       last_name = 'Cruz',
       second_last_name = 'Osuna',
       stage_name = 'Frank Cruz',
       aliases = ARRAY[]::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['bolero']::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = NULL,
       bio_en = 'Francisco Cruz Osuna (San Antón, Santo Domingo, June 28, 1927 – Santo Domingo, February 18, 2020) was a Dominican singer of merengue and bolero, widely known by his stage name Frank Cruz and by the nicknames “El Señor Bolero” and “El Calvo de Oro.” He became one of the most recognizable voices of Dominican popular music during the 1950s, 1960s, and 1970s, particularly through his work with maestro Félix del Rosario in the celebrated ensemble Los Magos del Ritmo.

**Early Life**

Frank Cruz was born in the historic neighborhood of San Antón in Santo Domingo. From a young age he showed interest in singing and performance. At age 20, he began his musical career with the Conjunto de Gilberto Muñoz after participating in an amateur program at La Voz Dominicana, one of the most influential broadcasting platforms of the era.

**Career**

During the 1950s, Cruz joined the Conjunto de Enrique Bustamante (Rikín), which performed regularly at the popular Balneario de Güibia. In 1955 he was hired by Antonio Morel to perform at the Teatro Agua y Luz, sharing the stage with Lucía Félix and Francis Santana.

His major breakthrough came in 1963, when maestro Félix del Rosario was commissioned to form a resident orchestra for the Hotel y Casino Europa. Del Rosario selected Frank Cruz as the lead vocalist, and radio announcer Ramón Rivera Batista named the group Los Magos del Ritmo. The combination of Del Rosario’s arrangements and Cruz’s distinctive voice produced one of the most successful partnerships in Dominican music.

Cruz became known for his warm tone, impeccable phrasing, and expressive delivery. Although celebrated for his boleros, he was equally admired for his elegant and melodic approach to merengue, becoming a reference point for later generations of singers.

**Recognition**

Throughout his career, Frank Cruz received numerous honors for his contributions to Dominican music:

- 2011: Named Reserva Musical by Banco de Reservas.  
- 2014: Honored by the Ministry of Culture and featured at the Festival del Merengue Ritmo Caribeño.  
- 2019: Included in the Galería Nacional of the Dirección Nacional de Folklore as one of the emblematic figures who elevated merengue nationally and internationally.

**Death**

Frank Cruz died on February 18, 2020, in Santo Domingo, at the age of 92.

Dominican news outlets (including Diario Libre, Listín Diario, and CDN) reported that his passing was due to health complications associated with advanced age.

His death prompted tributes from musicians, cultural institutions, and admirers of traditional merengue, who highlighted his status as one of the most important vocalists of the Dominican Republic’s musical heritage.

**Legacy**

Frank Cruz is remembered as one of the defining voices of Dominican merengue and bolero. His partnership with Félix del Rosario marked a golden era in the country’s popular music, and his vocal style remains a model of elegance and emotional depth. His influence continues to be felt among singers, arrangers, and historians of Dominican music.',
       bio_es = 'Francisco Cruz Osuna (San Antón, Santo Domingo, 28 de junio de 1927 – Santo Domingo, 18 de febrero de 2020) fue un cantante dominicano de merengue y bolero, conocido artísticamente como Frank Cruz y apodado “El Señor Bolero” y “El Calvo de Oro”. Su voz se convirtió en una de las más representativas de la música popular dominicana durante las décadas de 1950, 1960 y 1970, especialmente por su trabajo junto al maestro Félix del Rosario en la agrupación Los Magos del Ritmo.

**Primeros años**

Frank Cruz nació en el sector San Antón de Santo Domingo el 28 de junio de 1927. Desde joven mostró inclinación por el canto y comenzó su carrera musical a los 20 años con el Conjunto de Gilberto Muñoz, tras participar en un programa de aficionados en La Voz Dominicana, una de las plataformas más importantes para nuevos talentos en la época.

**Carrera musical**

Durante los años 50, Cruz formó parte del Conjunto de Enrique Bustamante (Rikín), que amenizaba los bailes del balneario de Güibia. En 1955 fue contratado por Antonio Morel para presentarse en el Teatro Agua y Luz, compartiendo escenario con figuras como Lucía Félix y Francis Santana.

Su salto definitivo al estrellato ocurrió en 1963, cuando el maestro Félix del Rosario fue designado para formar un grupo residente del Hotel y Casino Europa. Del Rosario eligió a Frank Cruz como su vocalista principal, y el locutor Ramón Rivera Batista bautizó la agrupación como Los Magos del Ritmo. La combinación del sonido del conjunto y la voz de Cruz se convirtió en una de las fórmulas más exitosas de la música dominicana.

Cruz destacó tanto en merengue como en bolero, siendo reconocido por su estilo elegante, su afinación impecable y su capacidad interpretativa. Su voz se convirtió en una referencia obligada para cantantes de generaciones posteriores.

**Reconocimientos**

A lo largo de su carrera, Frank Cruz recibió múltiples homenajes por su aporte a la música dominicana:

- 2011: Proclamado Reserva Musical por el Banco de Reservas.  
- 2014: Reconocido por el Ministerio de Cultura y homenajeado en el Festival del Merengue Ritmo Caribeño.  
- 2019: Su fotografía fue incluida en la Galería Nacional de la Dirección Nacional de Folklore, junto a otras figuras emblemáticas del merengue.

**Muerte**

Frank Cruz falleció el 18 de febrero de 2020 en Santo Domingo, a los 92 años.

De acuerdo con reportes de prensa dominicana (Diario Libre, Listín Diario, CDN), su muerte se produjo por complicaciones de salud asociadas a su avanzada edad. No se reportó una causa específica distinta al deterioro natural propio de sus años.

Su fallecimiento generó numerosas expresiones de reconocimiento y homenaje por parte de músicos, instituciones culturales y seguidores del merengue tradicional, quienes destacaron su legado como una de las voces más importantes de la música dominicana del siglo XX.

**Legado**

Frank Cruz es considerado uno de los vocalistas más influyentes del merengue y el bolero dominicano. Su trabajo con Félix del Rosario marcó una época dorada, y su estilo interpretativo continúa siendo referencia para cantantes y estudiosos del género. Su voz, descrita como “irrepetible” en múltiples crónicas, permanece como símbolo de elegancia y tradición en la música popular dominicana.',
       updated_at = now()
 WHERE slug = 'frank-cruz';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'frank-cruz')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'frank-cruz')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Francisco Cruz Osuna (San Antón, Santo Domingo, June 28, 1927 – Santo Domingo, February 18, 2020) was a Dominican singer of merengue and bolero, widely known by his stage name Frank Cruz and by the nicknames “El Señor Bolero” and “El Calvo de Oro.” He became one of the most recognizable voices of Dominican popular music during the 1950s, 1960s, and 1970s, particularly through his work with maestro Félix del Rosario in the celebrated ensemble Los Magos del Ritmo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Early Life","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Frank Cruz was born in the historic neighborhood of San Antón in Santo Domingo. From a young age he showed interest in singing and performance. At age 20, he began his musical career with the Conjunto de Gilberto Muñoz after participating in an amateur program at La Voz Dominicana, one of the most influential broadcasting platforms of the era.","type":"text"}]},{"type":"paragraph","content":[{"text":"Career","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"During the 1950s, Cruz joined the Conjunto de Enrique Bustamante (Rikín), which performed regularly at the popular Balneario de Güibia. In 1955 he was hired by Antonio Morel to perform at the Teatro Agua y Luz, sharing the stage with Lucía Félix and Francis Santana.","type":"text"}]},{"type":"paragraph","content":[{"text":"His major breakthrough came in 1963, when maestro Félix del Rosario was commissioned to form a resident orchestra for the Hotel y Casino Europa. Del Rosario selected Frank Cruz as the lead vocalist, and radio announcer Ramón Rivera Batista named the group Los Magos del Ritmo. The combination of Del Rosario’s arrangements and Cruz’s distinctive voice produced one of the most successful partnerships in Dominican music.","type":"text"}]},{"type":"paragraph","content":[{"text":"Cruz became known for his warm tone, impeccable phrasing, and expressive delivery. Although celebrated for his boleros, he was equally admired for his elegant and melodic approach to merengue, becoming a reference point for later generations of singers.","type":"text"}]},{"type":"paragraph","content":[{"text":"Recognition","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Throughout his career, Frank Cruz received numerous honors for his contributions to Dominican music:","type":"text"}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"2011: Named Reserva Musical by Banco de Reservas.","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"2014: Honored by the Ministry of Culture and featured at the Festival del Merengue Ritmo Caribeño.","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"2019: Included in the Galería Nacional of the Dirección Nacional de Folklore as one of the emblematic figures who elevated merengue nationally and internationally.","type":"text"}]}]}]},{"type":"paragraph","content":[{"text":"Death","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Frank Cruz died on February 18, 2020, in Santo Domingo, at the age of 92.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dominican news outlets (including Diario Libre, Listín Diario, and CDN) reported that his passing was due to health complications associated with advanced age.","type":"text"}]},{"type":"paragraph","content":[{"text":"His death prompted tributes from musicians, cultural institutions, and admirers of traditional merengue, who highlighted his status as one of the most important vocalists of the Dominican Republic’s musical heritage.","type":"text"}]},{"type":"paragraph","content":[{"text":"Legacy","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Frank Cruz is remembered as one of the defining voices of Dominican merengue and bolero. His partnership with Félix del Rosario marked a golden era in the country’s popular music, and his vocal style remains a model of elegance and emotional depth. His influence continues to be felt among singers, arrangers, and historians of Dominican music.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'frank-cruz'), 3)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Francisco Cruz Osuna (San Antón, Santo Domingo, 28 de junio de 1927 – Santo Domingo, 18 de febrero de 2020) fue un cantante dominicano de merengue y bolero, conocido artísticamente como Frank Cruz y apodado “El Señor Bolero” y “El Calvo de Oro”. Su voz se convirtió en una de las más representativas de la música popular dominicana durante las décadas de 1950, 1960 y 1970, especialmente por su trabajo junto al maestro Félix del Rosario en la agrupación Los Magos del Ritmo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Primeros años","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Frank Cruz nació en el sector San Antón de Santo Domingo el 28 de junio de 1927. Desde joven mostró inclinación por el canto y comenzó su carrera musical a los 20 años con el Conjunto de Gilberto Muñoz, tras participar en un programa de aficionados en La Voz Dominicana, una de las plataformas más importantes para nuevos talentos en la época.","type":"text"}]},{"type":"paragraph","content":[{"text":"Carrera musical","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Durante los años 50, Cruz formó parte del Conjunto de Enrique Bustamante (Rikín), que amenizaba los bailes del balneario de Güibia. En 1955 fue contratado por Antonio Morel para presentarse en el Teatro Agua y Luz, compartiendo escenario con figuras como Lucía Félix y Francis Santana.","type":"text"}]},{"type":"paragraph","content":[{"text":"Su salto definitivo al estrellato ocurrió en 1963, cuando el maestro Félix del Rosario fue designado para formar un grupo residente del Hotel y Casino Europa. Del Rosario eligió a Frank Cruz como su vocalista principal, y el locutor Ramón Rivera Batista bautizó la agrupación como Los Magos del Ritmo. La combinación del sonido del conjunto y la voz de Cruz se convirtió en una de las fórmulas más exitosas de la música dominicana.","type":"text"}]},{"type":"paragraph","content":[{"text":"Cruz destacó tanto en merengue como en bolero, siendo reconocido por su estilo elegante, su afinación impecable y su capacidad interpretativa. Su voz se convirtió en una referencia obligada para cantantes de generaciones posteriores.","type":"text"}]},{"type":"paragraph","content":[{"text":"Reconocimientos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"A lo largo de su carrera, Frank Cruz recibió múltiples homenajes por su aporte a la música dominicana:","type":"text"}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"2011: Proclamado Reserva Musical por el Banco de Reservas.","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"2014: Reconocido por el Ministerio de Cultura y homenajeado en el Festival del Merengue Ritmo Caribeño.","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"2019: Su fotografía fue incluida en la Galería Nacional de la Dirección Nacional de Folklore, junto a otras figuras emblemáticas del merengue.","type":"text"}]}]}]},{"type":"paragraph","content":[{"text":"Muerte","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Frank Cruz falleció el 18 de febrero de 2020 en Santo Domingo, a los 92 años.","type":"text"}]},{"type":"paragraph","content":[{"text":"De acuerdo con reportes de prensa dominicana (Diario Libre, Listín Diario, CDN), su muerte se produjo por complicaciones de salud asociadas a su avanzada edad. No se reportó una causa específica distinta al deterioro natural propio de sus años.","type":"text"}]},{"type":"paragraph","content":[{"text":"Su fallecimiento generó numerosas expresiones de reconocimiento y homenaje por parte de músicos, instituciones culturales y seguidores del merengue tradicional, quienes destacaron su legado como una de las voces más importantes de la música dominicana del siglo XX.","type":"text"}]},{"type":"paragraph","content":[{"text":"Legado","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Frank Cruz es considerado uno de los vocalistas más influyentes del merengue y el bolero dominicano. Su trabajo con Félix del Rosario marcó una época dorada, y su estilo interpretativo continúa siendo referencia para cantantes y estudiosos del género. Su voz, descrita como “irrepetible” en múltiples crónicas, permanece como símbolo de elegancia y tradición en la música popular dominicana.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'frank-cruz'), 2)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
