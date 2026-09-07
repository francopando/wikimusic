BEGIN;

-- Create the catalogue entry for Fernando Casado.
--
-- Fernando Casado. Ficha nueva. Número cuatro de la lista de prioridad y el
-- único de los primeros que está vivo.
--
-- EL AÑO DE NACIMIENTO NO SE GUARDA, Y ESA ES LA DECISIÓN IMPORTANTE DE ESTA
-- FICHA. Hay dos versiones irreconciliables y las dos vienen de fuentes serias:
--
--   1940 -- Diccionario Cultural Dominicano de Funglode ("Nacimiento: 1940");
--           EcuRed, que cita la Enciclopedia Encaribe; e IMDb, que da "4 de marzo
--           de 1940" y llega por otra vía, la de sus créditos de cine. Encaja
--           además con dos menciones de edad: una publicación del 4 de marzo de
--           2019 que le cuenta 79 años, y un pie de Nuria Piera de febrero de
--           2022 que le pone 81 junto a Niní Cáffaro con 82 -- y la edad de
--           Cáffaro en esa fecha es correcta, lo que le da peso al pie entero.
--
--   1932 -- Listín Diario, 27 de junio de 2023, en un reportaje hecho en su casa:
--           "Fernando Casado, de 91 años". Y Hoy, 26 de marzo de 2022: "Un
--           recorrido por los 90 años de vida de Fernando Casado". Dos periódicos
--           nacionales, con fotógrafo acreditado uno de ellos.
--
-- Los dos bandos coinciden en el 4 de marzo. No es el caso corriente de obras de
-- referencia contra Facebook: son obras de referencia contra prensa nacional, y
-- no tengo cómo desempatar desde aquí. Guardar cualquiera de los dos años metería
-- en la base un dato que puede estar ocho años equivocado y sobre el que después
-- se construye. Así que date_of_birth y birth_year QUEDAN VACÍOS y la prosa dice
-- el 4 de marzo sin año. DECISIÓN PARA EL EDITOR, que probablemente pueda
-- resolverlo preguntando.
--
-- ESTO CORRIGE ALGO QUE YO MISMO DIJE HOY. En la evaluación del lote lo puse como
-- "vivo, 94 años" y como el más urgente por edad. Con 1940 tendría 86. Sigue
-- siendo el más urgente de los vivos, pero la cifra que di no estaba comprobada.
--
-- PRIMERA FILA DE SAN JOSÉ DE OCOA. Ninguna de las 30 provincias en uso en la
-- tabla incluía esa. Es provincia real desde 2000, antes parte de Peravia, y el
-- valor entra escrito como se escribe oficialmente.
--
-- LA SALUD QUEDA FUERA. Diario Libre publicó en enero de 2018 su ingreso de
-- urgencia. Nada de eso va.
--
-- UNA ATRIBUCIÓN QUE NO SE COPIA. EcuRed escribe: "intérprete de baladas y
-- boleros como Una primavera para el mundo, poema de René del Risco Bermúdez,
-- Como me besabas tú y Por amor de Rafael Solano". La sintaxis permite leer que
-- las dos últimas son de Solano, pero el Archivo General de la Nación registra
-- "Como me besabas tu" con letra y música de José Dolores Cerón. Así que la ficha
-- le atribuye a Solano SOLO "Por amor" y no nombra la otra.
--
-- EL DÚO CON EDUARDO BRITO ES PÓSTUMO y hay que decirlo bien: Brito murió en 1946
-- y el dúo se hizo con medios técnicos. Escribirlo sin más sugeriría que
-- coincidieron.
--
-- SE ENLAZAN TRES: eduardo-brito, rafael-solano y rene-del-risco-bermudez. OJO con
-- el último: el registro guarda el nombre como "René del Risco Bermudez", sin
-- tilde en Bermudez, y el displayText tiene que coincidir carácter por carácter
-- con artists.name. Se escribe como está en la fila, no como debería estar.
--
-- primary_genre bolero, CON LA DISTINCIÓN QUE EL EDITOR ACABA DE ACLARAR: bolero y
-- ballads son dos géneros de nivel 0 distintos. EcuRed dice que su voz lo llevó al
-- bolero y que se hizo más expresiva en la criolla. No hay género criolla en la
-- taxonomía; bolero es el más cercano y ballads va en el array.
--
-- FUENTES: EcuRed, que cita la Enciclopedia Encaribe y es la más detallada -- de
-- ahí salen el maestro de canto Charles Guild, las emisoras, los programas de
-- televisión, los dos festivales OTI, la Reserva Musical del País y los títulos de
-- las criollas. Diccionario Cultural Dominicano de Funglode. Listín Diario, 27 de
-- junio de 2023. Hoy, 26 de marzo de 2022, y el texto de Juan Luis Guerra sobre él
-- en Areíto, 26 de julio de 2025. Semblanza de la Fundación Juan Bosch, julio de
-- 2025.
--
-- NOMBRES NUEVOS PARA LA LISTA: Charles Guild, su maestro de canto; Raudo Saldaña
-- y Antonio Mesa, los trovadores del XIX en cuyas voces vivió la criolla antes que
-- en la suya; y José Dolores Cerón, autor de "Como me besabas tú".
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
       name = 'Fernando Casado',
       sort_name = 'Casado Linares, Fernando Arturo',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'bolero',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'San José de Ocoa',
       province = 'San José de Ocoa',
       first_name = 'Fernando',
       middle_name = 'Arturo',
       last_name = 'Casado',
       second_last_name = 'Linares',
       stage_name = 'Fernando Casado',
       aliases = ARRAY['El Magistrado']::text[],
       occupations = '["actor","writer","radio_host"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['ballads']::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Singer, broadcaster and researcher known as El Magistrado; brought the criolla back into the repertoire',
       bio_en = 'Fernando Casado, billed as El Magistrado, is a Dominican singer, broadcaster, actor and music researcher. He built a career on a velvet bolero voice and then spent much of it on something less commercial: putting the criolla, a Dominican song form that had gone quiet, back into the country’s working repertoire.

**The voice and the microphone**

He was born on 4 March in San José de Ocoa and raised in the capital. He studied singing with the maestro Charles Guild and made his first appearances on live radio, and then did what a young man with that voice did in the fifties: he became an announcer.

He read news on a Spanish-language station in New York and worked through most of the Dominican dial, ending as head of the announcers’ department and programming coordinator at La Voz Dominicana, and later directing two other stations. He then moved to television and kept a programme under his own name across three different channels, one of which he founded.

That double career matters for what came later. A singer who also controls a microphone and a schedule can put a repertoire on the air, and he did.

**The criolla**

The criolla is the Dominican romantic song of the nineteenth century, the music of trovadores like Raudo Saldaña and Antonio Mesa, and by the middle of the twentieth it was more or less a museum piece. He recorded Cartas y Lágrimas, Aquel Beso, Carmencita and Duvergé, and he kept singing them when nothing about the market rewarded it.

He also worked as a researcher and writer, which is unusual for a performer and is the reason the recovery stuck. He was arguing a case about what Dominican music includes — merengue and bolero, but also the criolla, the son and the palos — and Juan Luis Guerra wrote about that argument at length last year.

The strangest thing in his discography belongs here too: a duet with Eduardo Brito. Brito died in 1946, so it was assembled by technical means rather than sung together, and it is exactly the gesture of a man who thinks the nineteenth-century repertoire is still live material.

**Festivals and the rest**

He represented the country at the OTI song festival in Spain in 1972 with Siempre Habrá Una Sonrisa En La Luna, and took second place at the same festival in 1977 with Al Nacer Cada Enero. He has sung at Carnegie Hall and appeared on the big Spanish-language variety programmes of the era, in Chile, in Spain and on the Mexican show that filmed an edition in La Romana.

His repertoire runs through the good Dominican songwriting of the period. He recorded Una Primavera Para El Mundo, on a poem by René del Risco Bermudez, and Por Amor by Rafael Solano.

The Ayuntamiento of the Distrito Nacional named him a distinguished citizen, and he was later chosen for the country’s musical reserve. He is still working, still being interviewed at home, and still making the same argument about the criolla.',
       bio_es = 'Fernando Casado, anunciado como El Magistrado, es cantante, locutor, actor e investigador musical dominicano. Levantó una carrera sobre una voz aterciopelada de bolerista y después dedicó buena parte de ella a algo bastante menos comercial: devolverle a la criolla, una forma dominicana que se había apagado, un sitio en el repertorio vivo del país.

**La voz y el micrófono**

Nació un 4 de marzo en San José de Ocoa y se crió en la capital. Estudió canto con el maestro Charles Guild e hizo sus primeras interpretaciones en programas de radio en vivo, y después hizo lo que hacía en los años cincuenta un muchacho con esa voz: se metió a locutor.

Leyó noticias en una emisora en español de Nueva York y pasó por casi todo el dial dominicano, hasta quedar como director del departamento de locutores y coordinador de programación de La Voz Dominicana, y más tarde dirigir otras dos emisoras. Luego se pasó a la televisión y mantuvo un programa con su propio nombre en tres canales distintos, uno de ellos fundado por él.

Esa doble carrera importa para lo que vino después. Un cantante que además maneja un micrófono y una programación puede poner un repertorio al aire, y eso hizo.

**La criolla**

La criolla es la canción romántica dominicana del siglo diecinueve, la música de trovadores como Raudo Saldaña y Antonio Mesa, y a mediados del veinte era más o menos una pieza de museo. Grabó Cartas y Lágrimas, Aquel Beso, Carmencita y Duvergé, y siguió cantándolas cuando nada en el mercado premiaba hacerlo.

Trabajó además como investigador y como escritor, cosa rara en un intérprete, y por eso el rescate cuajó. Estaba defendiendo una tesis sobre qué cosas incluye la música dominicana —el merengue y el bolero, sí, pero también la criolla, el son y los palos— y Juan Luis Guerra le dedicó el año pasado un texto largo a esa tesis.

Lo más raro de su discografía va aquí también: un dúo con Eduardo Brito. Brito murió en 1946, así que se armó por medios técnicos y no cantando juntos, y es exactamente el gesto de alguien que cree que el repertorio del diecinueve sigue siendo material vivo.

**Festivales y lo demás**

Representó al país en el festival OTI de la canción en España en 1972 con Siempre Habrá Una Sonrisa En La Luna, y quedó segundo en ese mismo festival en 1977 con Al Nacer Cada Enero. Ha cantado en el Carnegie Hall y salió en los grandes programas de variedades en español de la época, en Chile, en España y en el show mexicano que grabó una edición en La Romana.

Su repertorio atraviesa la buena canción dominicana del período. Grabó Una Primavera Para El Mundo, sobre un poema de René del Risco Bermudez, y Por Amor, de Rafael Solano.

El Ayuntamiento del Distrito Nacional lo declaró munícipe distinguido, y más tarde fue escogido para la reserva musical del país. Sigue trabajando, sigue dando entrevistas en su casa y sigue defendiendo lo mismo sobre la criolla.',
       updated_at = now()
 WHERE slug = 'fernando-casado';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'fernando-casado')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'fernando-casado')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Fernando Casado, billed as El Magistrado, is a Dominican singer, broadcaster, actor and music researcher. He built a career on a velvet bolero voice and then spent much of it on something less commercial: putting the criolla, a Dominican song form that had gone quiet, back into the country’s working repertoire.","type":"text"}]},{"type":"paragraph","content":[{"text":"The voice and the microphone","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He was born on 4 March in San José de Ocoa and raised in the capital. He studied singing with the maestro Charles Guild and made his first appearances on live radio, and then did what a young man with that voice did in the fifties: he became an announcer.","type":"text"}]},{"type":"paragraph","content":[{"text":"He read news on a Spanish-language station in New York and worked through most of the Dominican dial, ending as head of the announcers’ department and programming coordinator at La Voz Dominicana, and later directing two other stations. He then moved to television and kept a programme under his own name across three different channels, one of which he founded.","type":"text"}]},{"type":"paragraph","content":[{"text":"That double career matters for what came later. A singer who also controls a microphone and a schedule can put a repertoire on the air, and he did.","type":"text"}]},{"type":"paragraph","content":[{"text":"The criolla","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The criolla is the Dominican romantic song of the nineteenth century, the music of trovadores like Raudo Saldaña and Antonio Mesa, and by the middle of the twentieth it was more or less a museum piece. He recorded Cartas y Lágrimas, Aquel Beso, Carmencita and Duvergé, and he kept singing them when nothing about the market rewarded it.","type":"text"}]},{"type":"paragraph","content":[{"text":"He also worked as a researcher and writer, which is unusual for a performer and is the reason the recovery stuck. He was arguing a case about what Dominican music includes — merengue and bolero, but also the criolla, the son and the palos — and Juan Luis Guerra wrote about that argument at length last year.","type":"text"}]},{"type":"paragraph","content":[{"text":"The strangest thing in his discography belongs here too: a duet with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"ec0423fc-fe53-42e9-8d0f-f2ae902512d3","displayText":"Eduardo Brito","occurrenceId":"e91cfa17-4dbd-4733-a08f-a47e703d62c0"}},{"text":". Brito died in 1946, so it was assembled by technical means rather than sung together, and it is exactly the gesture of a man who thinks the nineteenth-century repertoire is still live material.","type":"text"}]},{"type":"paragraph","content":[{"text":"Festivals and the rest","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He represented the country at the OTI song festival in Spain in 1972 with Siempre Habrá Una Sonrisa En La Luna, and took second place at the same festival in 1977 with Al Nacer Cada Enero. He has sung at Carnegie Hall and appeared on the big Spanish-language variety programmes of the era, in Chile, in Spain and on the Mexican show that filmed an edition in La Romana.","type":"text"}]},{"type":"paragraph","content":[{"text":"His repertoire runs through the good Dominican songwriting of the period. He recorded Una Primavera Para El Mundo, on a poem by ","type":"text"},{"type":"artistReference","attrs":{"artistId":"c1575281-d275-4f34-a721-9f02736132d2","displayText":"René del Risco Bermudez","occurrenceId":"081e3324-b964-40de-93e8-21fc5cc388dd"}},{"text":", and Por Amor by ","type":"text"},{"type":"artistReference","attrs":{"artistId":"ba42e200-51b0-437b-99ac-1daf39ade337","displayText":"Rafael Solano","occurrenceId":"89dc8541-24f7-4316-b963-b0de889cd913"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"The Ayuntamiento of the Distrito Nacional named him a distinguished citizen, and he was later chosen for the country’s musical reserve. He is still working, still being interviewed at home, and still making the same argument about the criolla.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'fernando-casado'), 1)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Fernando Casado, anunciado como El Magistrado, es cantante, locutor, actor e investigador musical dominicano. Levantó una carrera sobre una voz aterciopelada de bolerista y después dedicó buena parte de ella a algo bastante menos comercial: devolverle a la criolla, una forma dominicana que se había apagado, un sitio en el repertorio vivo del país.","type":"text"}]},{"type":"paragraph","content":[{"text":"La voz y el micrófono","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Nació un 4 de marzo en San José de Ocoa y se crió en la capital. Estudió canto con el maestro Charles Guild e hizo sus primeras interpretaciones en programas de radio en vivo, y después hizo lo que hacía en los años cincuenta un muchacho con esa voz: se metió a locutor.","type":"text"}]},{"type":"paragraph","content":[{"text":"Leyó noticias en una emisora en español de Nueva York y pasó por casi todo el dial dominicano, hasta quedar como director del departamento de locutores y coordinador de programación de La Voz Dominicana, y más tarde dirigir otras dos emisoras. Luego se pasó a la televisión y mantuvo un programa con su propio nombre en tres canales distintos, uno de ellos fundado por él.","type":"text"}]},{"type":"paragraph","content":[{"text":"Esa doble carrera importa para lo que vino después. Un cantante que además maneja un micrófono y una programación puede poner un repertorio al aire, y eso hizo.","type":"text"}]},{"type":"paragraph","content":[{"text":"La criolla","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La criolla es la canción romántica dominicana del siglo diecinueve, la música de trovadores como Raudo Saldaña y Antonio Mesa, y a mediados del veinte era más o menos una pieza de museo. Grabó Cartas y Lágrimas, Aquel Beso, Carmencita y Duvergé, y siguió cantándolas cuando nada en el mercado premiaba hacerlo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Trabajó además como investigador y como escritor, cosa rara en un intérprete, y por eso el rescate cuajó. Estaba defendiendo una tesis sobre qué cosas incluye la música dominicana —el merengue y el bolero, sí, pero también la criolla, el son y los palos— y Juan Luis Guerra le dedicó el año pasado un texto largo a esa tesis.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo más raro de su discografía va aquí también: un dúo con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"ec0423fc-fe53-42e9-8d0f-f2ae902512d3","displayText":"Eduardo Brito","occurrenceId":"9d3cb12d-d490-46ce-a021-93fa43493b0b"}},{"text":". Brito murió en 1946, así que se armó por medios técnicos y no cantando juntos, y es exactamente el gesto de alguien que cree que el repertorio del diecinueve sigue siendo material vivo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Festivales y lo demás","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Representó al país en el festival OTI de la canción en España en 1972 con Siempre Habrá Una Sonrisa En La Luna, y quedó segundo en ese mismo festival en 1977 con Al Nacer Cada Enero. Ha cantado en el Carnegie Hall y salió en los grandes programas de variedades en español de la época, en Chile, en España y en el show mexicano que grabó una edición en La Romana.","type":"text"}]},{"type":"paragraph","content":[{"text":"Su repertorio atraviesa la buena canción dominicana del período. Grabó Una Primavera Para El Mundo, sobre un poema de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"c1575281-d275-4f34-a721-9f02736132d2","displayText":"René del Risco Bermudez","occurrenceId":"3e2c1099-71eb-4179-a28e-a94cf38a90be"}},{"text":", y Por Amor, de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"ba42e200-51b0-437b-99ac-1daf39ade337","displayText":"Rafael Solano","occurrenceId":"3078b063-14fd-45cd-a2d5-73b6cd865ce7"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"El Ayuntamiento del Distrito Nacional lo declaró munícipe distinguido, y más tarde fue escogido para la reserva musical del país. Sigue trabajando, sigue dando entrevistas en su casa y sigue defendiendo lo mismo sobre la criolla.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'fernando-casado'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'fernando-casado') AND locale = 'en'), '081e3324-b964-40de-93e8-21fc5cc388dd', 'artist', 'c1575281-d275-4f34-a721-9f02736132d2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'fernando-casado') AND locale = 'en'), '89dc8541-24f7-4316-b963-b0de889cd913', 'artist', 'ba42e200-51b0-437b-99ac-1daf39ade337');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'fernando-casado') AND locale = 'en'), 'e91cfa17-4dbd-4733-a08f-a47e703d62c0', 'artist', 'ec0423fc-fe53-42e9-8d0f-f2ae902512d3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'fernando-casado') AND locale = 'es'), '3078b063-14fd-45cd-a2d5-73b6cd865ce7', 'artist', 'ba42e200-51b0-437b-99ac-1daf39ade337');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'fernando-casado') AND locale = 'es'), '3e2c1099-71eb-4179-a28e-a94cf38a90be', 'artist', 'c1575281-d275-4f34-a721-9f02736132d2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'fernando-casado') AND locale = 'es'), '9d3cb12d-d490-46ce-a021-93fa43493b0b', 'artist', 'ec0423fc-fe53-42e9-8d0f-f2ae902512d3');

COMMIT;
