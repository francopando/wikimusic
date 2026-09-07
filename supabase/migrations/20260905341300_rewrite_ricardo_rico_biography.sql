BEGIN;

-- Rewrite the catalogue entry for Ricardo Rico.
--
-- Ricardo Rico. A 133-character filler biography in English, nothing in
-- Spanish, no genre, no gender, no dates -- for one of the men who put merengue
-- in front of an American audience in the 1950s.
--
-- SOURCES: Discogs, which gives "Dominican composer, singer, and orchestra
-- leader (1915-1979)" and the two groups, Los Tipicos Dominicanos and Ricardo
-- Rico And His Orchestra. The Tropicales del Recuerdo discography, which is the
-- fullest account of him anywhere: the legal name Herminio Ricardo Rico, the
-- birth on 15 December 1915 and the death on 26 May 1979 in Santo Domingo, the
-- French circus, the 1939 departure for Curacao and the United States, the 1940
-- Venezuelan period with Antonio Saavedra and Santiago Serra, the orchestra
-- formed in 1954, and a label-by-label listing with catalogue numbers across
-- Tico, RCA Victor, Verne, Century, Monogram, Alberto, Del Orbe, ORC and Audio
-- Fidelity. The Facebook page Imagenes de Nuestra Historia RD, which carries
-- the circus account contributed by his own nephew Luis Rico and is therefore a
-- second, independent source for it. Guaguanco de mi Tierra for "El Hombre
-- Marinero" and the orchestra formed in the United States. Dominican Music USA
-- and Dailymotion for the instructional film. Spotify and the Tico LP listings
-- for the albums.
--
-- CORROBORATION WORTH NOTING: the CUNY Dominican Studies Institute holds a
-- photograph of Ricardo Rico and his orchestra, circa the 1960s, in the Julio
-- Cesar Rodriguez Collection, and uses it on the front of "A History of
-- Dominican Music in the United States". That is the scholarly record placing
-- him at the centre of this story, not a fan page.
--
-- NOT WRITTEN: that he was a cousin of Joaquin Balaguer Ricardo. One blog says
-- so, nothing else does, and a claimed family tie to that particular president
-- is not something to publish on a single source.
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
       name = 'Ricardo Rico',
       sort_name = 'Rico, Herminio Ricardo',
       type = 'solo_artist',
       status = 'needs_review',
       gender = 'male',
       ended = TRUE,
       primary_role = 'singer',
       primary_genre = 'merengue',
       date_of_birth = '1915-12-15',
       birth_year = 1915,
       date_of_death = '1979-05-26',
       birth_place = NULL,
       province = NULL,
       first_name = 'Herminio',
       middle_name = 'Ricardo',
       last_name = 'Rico',
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY['Herminio Ricardo Rico', 'Ricardo Rico y su Conjunto Los Típicos Dominicanos']::text[],
       occupations = '["composer","bandleader","songwriter"]'::jsonb,
       instruments = ARRAY['voice']::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Dominican merengue singer, composer and orchestra leader, 1915–1979; recorded for Tico and RCA Victor',
       bio_en = 'Ricardo Rico — Herminio Ricardo Rico, born on 15 December 1915 and died in Santo Domingo on 26 May 1979 — was a Dominican singer, composer and orchestra leader. He was among the first to sell merengue to an audience that did not already know it.

**A juggler and a ventriloquist**

He arrived in the Dominican Republic in 1937 with a French circus, working as a juggler and a ventriloquist, and he performed those acts across Latin America. His nephew, who told the story, thought he was probably the only merenguero in history who had been a circus act, and that is likely right.

The contract ended in 1939 and he went to Curaçao and then to the United States. By 1940 he was in Venezuela, where Antonio Saavedra and Santiago Serra put him to work as a comedian.

It is a strange apprenticeship for a bandleader, and it explains something about what came after. A man who has held a room as a ventriloquist knows exactly how to sell an unfamiliar thing to an audience that did not come for it.

**His own orchestra**

He formed his own orchestra in 1954 and began recording immediately. What followed was one of the densest recording runs any Dominican of that era managed: Tico, RCA Victor, Verne, Century, Monogram and Audio Fidelity all pressed him, sometimes in the same year.

He worked under several names — Ricardo Rico y su Orquesta, Ricardo Rico y su Conjunto Los Típicos Dominicanos, and for a stretch Ricardo Rico y su Danzonera, playing Mexican danzón. The Hermanas Malagón sang with him on Papá Candelo and Lenguetera.

El Hombre Marinero is the record his name is attached to. El Negrito del Batey, La Cheriona, El Mosquito, Loretta, Macario y Felipa, A Lo Oscuro and Del Corazón del Cibao belong to the same period, and so does José Antonio en Nueva York, which names the city he was working in.

**Teaching Americans to dance**

Two of his albums are titled as instructions rather than as records: Dance the Merengue with Tony & Lucille and Dance the Merengue with Killer Joe, both on Tico in 1956, each built around a New York dance instructor.

He went further. El Marinero was used in an American instructional film that taught English-speaking audiences the steps, with his conjunto playing La Cruz de Palo Bonito on camera. Merengue was being explained to people who had never heard it, and his was the band doing the explaining.

There are titles that only make sense from inside that project — Jellybean Merengue, The Flying Merengue, Peter John Merengue, Merengue Navidad. He was writing merengues for an American ear on purpose.

**The record he left**

In 1960 he made Merengueando with Luis Kalaff, which put two of the form’s exporters on one album.

The Dominican press of the period called him the man who drove Dominican merengue abroad. The CUNY Dominican Studies Institute holds a photograph of his orchestra from the 1960s, and uses it at the front of its history of Dominican music in the United States — which is where a career like this ends up being counted.',
       bio_es = 'Ricardo Rico —Herminio Ricardo Rico, nacido el 15 de diciembre de 1915 y muerto en Santo Domingo el 26 de mayo de 1979— fue un cantante, compositor y director de orquesta dominicano. Estuvo entre los primeros en venderle el merengue a un público que no lo conocía.

**Un malabarista y un ventrílocuo**

Llegó a la República Dominicana en 1937 con un circo francés, trabajando de malabarista y de ventrílocuo, y llevó esos actos por toda América Latina. Su sobrino, que contó la historia, pensaba que probablemente fue el único merenguero de la historia que trabajó en un circo, y seguramente tenía razón.

El contrato se acabó en 1939 y se fue a Curazao y de ahí a Estados Unidos. Para 1940 estaba en Venezuela, donde Antonio Saavedra y Santiago Serra lo pusieron a trabajar como comediante.

Es un aprendizaje raro para un director de orquesta, y explica algo de lo que vino después. Un hombre que ha sostenido un salón entero haciendo de ventrílocuo sabe exactamente cómo venderle algo desconocido a un público que no vino por eso.

**La orquesta propia**

Formó su propia orquesta en 1954 y se puso a grabar de inmediato. Lo que siguió fue una de las rachas de grabación más densas que logró dominicano alguno de esa época: Tico, RCA Victor, Verne, Century, Monogram y Audio Fidelity lo prensaron, a veces el mismo año.

Trabajó bajo varios nombres —Ricardo Rico y su Orquesta, Ricardo Rico y su Conjunto Los Típicos Dominicanos, y por un tramo Ricardo Rico y su Danzonera, tocando danzón mexicano. Las Hermanas Malagón cantaron con él en Papá Candelo y en Lenguetera.

El Hombre Marinero es el disco al que su nombre está pegado. El Negrito del Batey, La Cheriona, El Mosquito, Loretta, Macario y Felipa, A Lo Oscuro y Del Corazón del Cibao son del mismo período, y también José Antonio en Nueva York, que nombra la ciudad donde estaba trabajando.

**Enseñarle a bailar a los americanos**

Dos de sus álbumes están titulados como instrucciones y no como discos: Dance the Merengue with Tony & Lucille y Dance the Merengue with Killer Joe, los dos por Tico en 1956, cada uno armado alrededor de un instructor de baile neoyorquino.

Fue más lejos. El Marinero se usó en una película didáctica estadounidense que le enseñaba los pasos al público anglosajón, con su conjunto tocando La Cruz de Palo Bonito frente a la cámara. Le estaban explicando el merengue a gente que nunca lo había oído, y la banda que lo explicaba era la suya.

Hay títulos que solo se entienden desde adentro de ese proyecto: Jellybean Merengue, The Flying Merengue, Peter John Merengue, Merengue Navidad. Estaba escribiendo merengues para un oído americano a propósito.

**Lo que dejó**

En 1960 hizo Merengueando con Luis Kalaff, que puso en un mismo disco a dos de los exportadores del género.

La prensa dominicana de entonces lo llamó el impulsor del merengue dominicano en el extranjero. El CUNY Dominican Studies Institute conserva una foto de su orquesta de los años sesenta, y la usa al frente de su historia de la música dominicana en Estados Unidos, que es donde termina contándose una carrera así.',
       updated_at = now()
 WHERE slug = 'ricardo-rico';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ricardo-rico')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ricardo-rico')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Ricardo Rico — Herminio Ricardo Rico, born on 15 December 1915 and died in Santo Domingo on 26 May 1979 — was a Dominican singer, composer and orchestra leader. He was among the first to sell merengue to an audience that did not already know it.","type":"text"}]},{"type":"paragraph","content":[{"text":"A juggler and a ventriloquist","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He arrived in the Dominican Republic in 1937 with a French circus, working as a juggler and a ventriloquist, and he performed those acts across Latin America. His nephew, who told the story, thought he was probably the only merenguero in history who had been a circus act, and that is likely right.","type":"text"}]},{"type":"paragraph","content":[{"text":"The contract ended in 1939 and he went to Curaçao and then to the United States. By 1940 he was in Venezuela, where Antonio Saavedra and Santiago Serra put him to work as a comedian.","type":"text"}]},{"type":"paragraph","content":[{"text":"It is a strange apprenticeship for a bandleader, and it explains something about what came after. A man who has held a room as a ventriloquist knows exactly how to sell an unfamiliar thing to an audience that did not come for it.","type":"text"}]},{"type":"paragraph","content":[{"text":"His own orchestra","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He formed his own orchestra in 1954 and began recording immediately. What followed was one of the densest recording runs any Dominican of that era managed: Tico, RCA Victor, Verne, Century, Monogram and Audio Fidelity all pressed him, sometimes in the same year.","type":"text"}]},{"type":"paragraph","content":[{"text":"He worked under several names — Ricardo Rico y su Orquesta, Ricardo Rico y su Conjunto Los Típicos Dominicanos, and for a stretch Ricardo Rico y su Danzonera, playing Mexican danzón. The Hermanas Malagón sang with him on Papá Candelo and Lenguetera.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Hombre Marinero is the record his name is attached to. El Negrito del Batey, La Cheriona, El Mosquito, Loretta, Macario y Felipa, A Lo Oscuro and Del Corazón del Cibao belong to the same period, and so does José Antonio en Nueva York, which names the city he was working in.","type":"text"}]},{"type":"paragraph","content":[{"text":"Teaching Americans to dance","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Two of his albums are titled as instructions rather than as records: Dance the Merengue with Tony & Lucille and Dance the Merengue with Killer Joe, both on Tico in 1956, each built around a New York dance instructor.","type":"text"}]},{"type":"paragraph","content":[{"text":"He went further. El Marinero was used in an American instructional film that taught English-speaking audiences the steps, with his conjunto playing La Cruz de Palo Bonito on camera. Merengue was being explained to people who had never heard it, and his was the band doing the explaining.","type":"text"}]},{"type":"paragraph","content":[{"text":"There are titles that only make sense from inside that project — Jellybean Merengue, The Flying Merengue, Peter John Merengue, Merengue Navidad. He was writing merengues for an American ear on purpose.","type":"text"}]},{"type":"paragraph","content":[{"text":"The record he left","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In 1960 he made Merengueando with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"dab6636c-21fd-4e34-a0a2-e59e9e147bbd","displayText":"Luis Kalaff","occurrenceId":"e2a5306f-1730-4665-adba-4a4760689195"}},{"text":", which put two of the form’s exporters on one album.","type":"text"}]},{"type":"paragraph","content":[{"text":"The Dominican press of the period called him the man who drove Dominican merengue abroad. The CUNY Dominican Studies Institute holds a photograph of his orchestra from the 1960s, and uses it at the front of its history of Dominican music in the United States — which is where a career like this ends up being counted.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'ricardo-rico'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Ricardo Rico —Herminio Ricardo Rico, nacido el 15 de diciembre de 1915 y muerto en Santo Domingo el 26 de mayo de 1979— fue un cantante, compositor y director de orquesta dominicano. Estuvo entre los primeros en venderle el merengue a un público que no lo conocía.","type":"text"}]},{"type":"paragraph","content":[{"text":"Un malabarista y un ventrílocuo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Llegó a la República Dominicana en 1937 con un circo francés, trabajando de malabarista y de ventrílocuo, y llevó esos actos por toda América Latina. Su sobrino, que contó la historia, pensaba que probablemente fue el único merenguero de la historia que trabajó en un circo, y seguramente tenía razón.","type":"text"}]},{"type":"paragraph","content":[{"text":"El contrato se acabó en 1939 y se fue a Curazao y de ahí a Estados Unidos. Para 1940 estaba en Venezuela, donde Antonio Saavedra y Santiago Serra lo pusieron a trabajar como comediante.","type":"text"}]},{"type":"paragraph","content":[{"text":"Es un aprendizaje raro para un director de orquesta, y explica algo de lo que vino después. Un hombre que ha sostenido un salón entero haciendo de ventrílocuo sabe exactamente cómo venderle algo desconocido a un público que no vino por eso.","type":"text"}]},{"type":"paragraph","content":[{"text":"La orquesta propia","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Formó su propia orquesta en 1954 y se puso a grabar de inmediato. Lo que siguió fue una de las rachas de grabación más densas que logró dominicano alguno de esa época: Tico, RCA Victor, Verne, Century, Monogram y Audio Fidelity lo prensaron, a veces el mismo año.","type":"text"}]},{"type":"paragraph","content":[{"text":"Trabajó bajo varios nombres —Ricardo Rico y su Orquesta, Ricardo Rico y su Conjunto Los Típicos Dominicanos, y por un tramo Ricardo Rico y su Danzonera, tocando danzón mexicano. Las Hermanas Malagón cantaron con él en Papá Candelo y en Lenguetera.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Hombre Marinero es el disco al que su nombre está pegado. El Negrito del Batey, La Cheriona, El Mosquito, Loretta, Macario y Felipa, A Lo Oscuro y Del Corazón del Cibao son del mismo período, y también José Antonio en Nueva York, que nombra la ciudad donde estaba trabajando.","type":"text"}]},{"type":"paragraph","content":[{"text":"Enseñarle a bailar a los americanos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dos de sus álbumes están titulados como instrucciones y no como discos: Dance the Merengue with Tony & Lucille y Dance the Merengue with Killer Joe, los dos por Tico en 1956, cada uno armado alrededor de un instructor de baile neoyorquino.","type":"text"}]},{"type":"paragraph","content":[{"text":"Fue más lejos. El Marinero se usó en una película didáctica estadounidense que le enseñaba los pasos al público anglosajón, con su conjunto tocando La Cruz de Palo Bonito frente a la cámara. Le estaban explicando el merengue a gente que nunca lo había oído, y la banda que lo explicaba era la suya.","type":"text"}]},{"type":"paragraph","content":[{"text":"Hay títulos que solo se entienden desde adentro de ese proyecto: Jellybean Merengue, The Flying Merengue, Peter John Merengue, Merengue Navidad. Estaba escribiendo merengues para un oído americano a propósito.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que dejó","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En 1960 hizo Merengueando con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"dab6636c-21fd-4e34-a0a2-e59e9e147bbd","displayText":"Luis Kalaff","occurrenceId":"f9295173-0e5a-4fc9-889e-2846a28098e8"}},{"text":", que puso en un mismo disco a dos de los exportadores del género.","type":"text"}]},{"type":"paragraph","content":[{"text":"La prensa dominicana de entonces lo llamó el impulsor del merengue dominicano en el extranjero. El CUNY Dominican Studies Institute conserva una foto de su orquesta de los años sesenta, y la usa al frente de su historia de la música dominicana en Estados Unidos, que es donde termina contándose una carrera así.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'ricardo-rico'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ricardo-rico') AND locale = 'en'), 'e2a5306f-1730-4665-adba-4a4760689195', 'artist', 'dab6636c-21fd-4e34-a0a2-e59e9e147bbd');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ricardo-rico') AND locale = 'es'), 'f9295173-0e5a-4fc9-889e-2846a28098e8', 'artist', 'dab6636c-21fd-4e34-a0a2-e59e9e147bbd');

COMMIT;
