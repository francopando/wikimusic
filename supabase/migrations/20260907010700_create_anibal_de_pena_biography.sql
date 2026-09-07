BEGIN;

-- Create the catalogue entry for Aníbal de Peña.
--
-- Aníbal de Peña. Ficha nueva. Número tres de la lista de prioridad.
--
-- POR QUÉ CORRÍA PRISA. Murió hace tres años, con obituarios en Diario Libre,
-- Listín y Hoy, nota del INFOTEP y entrada en el Diccionario Cultural Dominicano
-- de Funglode. Esa ventana de fuentes está abierta ahora y se cierra sola: es la
-- misma razón por la que la auditoría de muertes de esta semana encontró sus
-- errores en la cohorte vieja y no en la reciente.
--
-- EL NOMBRE COMPLETO ES NEWTON ANÍBAL DE PEÑA, y la fecha exacta -- 11 de mayo de
-- 1933, Barahona -- la sostienen las Efemérides Barahoneras del Dr. Wilson Gómez
-- Ramírez y varias copias independientes de esa misma efeméride. Murió el 18 de
-- septiembre de 2023 en Estados Unidos, donde residía; no se nombra ciudad porque
-- ninguna fuente la da.
--
-- LA PRISIÓN BAJO TRUJILLO VA DENTRO. Funglode lo dice sin rodeos: "Opositor al
-- régimen de Rafael L. Trujillo, fue apresado y encarcelado". No es un asunto
-- criminal suyo ni vida privada, que es lo que esta casa deja fuera: es
-- persecución política, y es el antecedente directo de que en 1965 escribiera el
-- himno constitucionalista. Sin eso la obra no se entiende. Va en una cláusula de
-- hecho.
--
-- DOS HIMNOS, Y SON COSAS DISTINTAS. Escribió LETRA Y MÚSICA del himno
-- constitucionalista de abril de 1965, grabado por Fabiola Recording Studios en
-- los meses finales de la guerra. Y escribió SOLO LA MÚSICA del himno del Partido
-- Revolucionario Dominicano, cuya letra es de José Francisco Peña Gómez. La ficha
-- mantiene la distinción porque el catálogo registra autoría y no da lo mismo.
--
-- UN DETALLE QUE SE QUEDA. En julio de 1966 declaró que "Mi debilidad" era el
-- "relleno" de "Tú no tienes la culpa". La primera acabó siendo la que todo el
-- mundo recuerda. Es suyo, está fechado y dice algo cierto sobre cómo se acierta.
--
-- SE ENLAZAN DOS. rafael-solano, que aparece dos veces en las fuentes -- Funglode
-- lo llama producto de la cosecha artística que Solano propició por Rahintel desde
-- 1959, y además grabó un larga duración acompañado por él --; y jorge-taveras,
-- con quien produjo el programa Musiclan en 1968. Niní Cáffaro y Sonia Silvestre
-- están publicados pero NADA los relaciona con él en lo consultado, así que no se
-- enlazan: no se inventa un trato que ninguna fuente afirma.
--
-- primary_genre VA COMO ballads Y NO COMO bolero A PROPÓSITO. Hay DOS géneros
-- activos llamados "Bolero" en la tabla, con slugs distintos: "bolero" y
-- "ballads-bolero". Elegir uno sería tomar partido en un duplicado que el editor
-- no ha resuelto. Se usa el padre, ballads, que es lo que llevan anthony-rios y
-- cheo-zorrilla. DUPLICADO PARA LA LISTA DE DECISIONES ABIERTAS.
--
-- NO SE ESCRIBE de qué murió, ni el nombre de su viuda, aunque ella es fuente
-- pública sobre su obra.
--
-- FUENTES: Diccionario Cultural Dominicano de Funglode, que es la más densa y de
-- donde salen Rahintel, la prisión, el sello Kubaney de Miami y Nueva York, Los
-- Diplomáticos y los dos himnos. Diario Libre y Hoy, 18 de septiembre de 2023.
-- INFOTEP, misma fecha. Tribunal Constitucional para el reconocimiento tardío.
-- Efemérides Barahoneras para la fecha de nacimiento. Los Archivos de Américo
-- Mejía para la declaración de julio de 1966.
--
-- NOMBRES NUEVOS PARA LA LISTA: Los Diplomáticos, la agrupación que lo acompañó en
-- el LP de Kubaney; Milton Peláez, coproductor de Musiclan; y "Fellito", maestro
-- suyo según varias efemérides -- el nombre aparece siempre truncado y NO se
-- escribe en la ficha hasta tenerlo completo.
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
       name = 'Aníbal de Peña',
       sort_name = 'Peña, Aníbal de',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = TRUE,
       primary_role = 'singer',
       primary_genre = 'ballads',
       date_of_birth = '1933-05-11',
       birth_year = 1933,
       date_of_death = '2023-09-18',
       birth_place = 'Barahona',
       province = 'Barahona',
       first_name = 'Newton',
       middle_name = 'Aníbal',
       last_name = 'de Peña',
       second_last_name = NULL,
       stage_name = 'Aníbal de Peña',
       aliases = ARRAY['Newton Aníbal de Peña']::text[],
       occupations = '["composer","pianist"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Bolero singer, pianist and composer; wrote the constitutionalist hymn of April 1965',
       bio_en = 'Aníbal de Peña, born Newton Aníbal de Peña, was a Dominican singer, pianist and composer. He spent a career writing love songs and is remembered above all for one that was not: the hymn of the April revolution, whose words and music are both his.

**Rahintel and the first records**

He came out of Barahona and into the television studios of the capital at the turn of the sixties, part of the crop of singers that Rafael Solano brought through Rahintel from 1959 onward. That channel functioned as a conservatory with cameras, and a great many Dominican careers of that generation begin in it.

His first recordings were Mi Debilidad and Tú No Tienes La Culpa. He later said, in 1966, that Mi Debilidad had been the filler — the throwaway on the other side of the record he actually cared about. It became the song people still ask for, which is the ordinary fate of a hunch about one’s own work.

He recorded for the Kubaney label out of Miami and New York, backed on one album by the group Los Diplomáticos, and on another by Rafael Solano himself. He worked as a singer in the Dominican Republic, Puerto Rico, Venezuela, New York, Miami and Boston, which was the ordinary circuit for a Dominican romantic singer and remains so.

**The April hymn**

He had opposed the Trujillo dictatorship and was arrested and imprisoned for it. That is the background to the thing he is best known for.

When the constitutionalist revolt broke out in April 1965 he wrote a hymn for it — words and music both — and it was recorded at a studio in the capital during the closing months of the fighting. A song written inside a war, by someone who had already been jailed by the previous regime, is not a commemorative piece composed afterwards at a safe distance. It was made while the outcome was unknown.

He also wrote the music for the hymn of the Dominican Revolutionary Party, to words by José Francisco Peña Gómez. The distinction is worth keeping: on the April hymn he wrote everything, and on this one he wrote the tune.

Formal recognition took a long time to arrive. He said as much himself, half a century later, when it finally did.

**The boleros**

The rest of the catalogue is romantic song, and it is what he was doing before and after the war. Déjame Beber, Virgen Negra, Muchachita De Mi Pueblo and Tú No Tienes La Culpa are the ones that lasted, alongside the accidental hit.

He produced for television too, sharing a programme in 1968 with Jorge Taveras on the state channel. A singer who is also a pianist and a composer tends to end up on that side of the desk eventually.

He spent his later life in the United States and died there in 2023, at ninety. The obituaries in the Dominican press led with the hymn rather than with the boleros, which is probably right and is certainly what he would have expected.',
       bio_es = 'Aníbal de Peña, de nombre Newton Aníbal de Peña, fue cantante, pianista y compositor dominicano. Se pasó una carrera escribiendo canciones de amor y se le recuerda sobre todo por una que no lo era: el himno de la revolución de abril, cuya letra y música son las dos suyas.

**Rahintel y los primeros discos**

Salió de Barahona a los estudios de televisión de la capital al doblar los años sesenta, dentro de la cosecha de cantantes que Rafael Solano propició por Rahintel a partir de 1959. Aquel canal funcionó como un conservatorio con cámaras, y muchísimas carreras dominicanas de esa generación empiezan ahí.

Sus primeras grabaciones fueron Mi Debilidad y Tú No Tienes La Culpa. Años después, en 1966, dijo que Mi Debilidad había sido el relleno: lo que iba del otro lado del disco que de verdad le importaba. Terminó siendo la canción que la gente sigue pidiendo, que es el destino corriente de una corazonada sobre la obra propia.

Grabó para el sello Kubaney, de Miami y Nueva York, acompañado en un larga duración por el conjunto Los Diplomáticos y en otro por el propio Rafael Solano. Trabajó como cantante en la República Dominicana, Puerto Rico, Venezuela, Nueva York, Miami y Boston, que era el circuito corriente de un romántico dominicano y lo sigue siendo.

**El himno de abril**

Se había opuesto a la dictadura de Trujillo y por eso fue apresado y encarcelado. Ese es el antecedente de aquello por lo que más se le conoce.

Cuando estalló la revuelta constitucionalista en abril de 1965 le escribió un himno —letra y música— y se grabó en un estudio de la capital en los meses finales de la contienda. Una canción hecha dentro de una guerra, por alguien a quien el régimen anterior ya había metido preso, no es una pieza conmemorativa compuesta después y a distancia prudente. Se hizo cuando no se sabía cómo iba a terminar.

Escribió además la música del himno del Partido Revolucionario Dominicano, con letra de José Francisco Peña Gómez. La distinción conviene mantenerla: en el de abril puso todo, y en este puso la melodía.

El reconocimiento oficial tardó mucho en llegar. Lo dijo él mismo, medio siglo después, cuando por fin llegó.

**Los boleros**

El resto del catálogo es canción romántica, que es lo que hacía antes de la guerra y lo que siguió haciendo después. Déjame Beber, Virgen Negra, Muchachita De Mi Pueblo y Tú No Tienes La Culpa son las que quedaron, junto al éxito accidental.

Produjo también para la televisión: en 1968 compartió un programa con Jorge Taveras en el canal del Estado. Un cantante que además es pianista y compositor suele acabar de ese lado del escritorio.

Pasó sus últimos años en Estados Unidos y allí murió en 2023, a los noventa. Los obituarios de la prensa dominicana abrieron con el himno y no con los boleros, que probablemente sea lo justo y desde luego es lo que él habría esperado.',
       updated_at = now()
 WHERE slug = 'anibal-de-pena';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'anibal-de-pena')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'anibal-de-pena')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Aníbal de Peña, born Newton Aníbal de Peña, was a Dominican singer, pianist and composer. He spent a career writing love songs and is remembered above all for one that was not: the hymn of the April revolution, whose words and music are both his.","type":"text"}]},{"type":"paragraph","content":[{"text":"Rahintel and the first records","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He came out of Barahona and into the television studios of the capital at the turn of the sixties, part of the crop of singers that ","type":"text"},{"type":"artistReference","attrs":{"artistId":"ba42e200-51b0-437b-99ac-1daf39ade337","displayText":"Rafael Solano","occurrenceId":"90916bea-0608-4106-af78-79c427eed54b"}},{"text":" brought through Rahintel from 1959 onward. That channel functioned as a conservatory with cameras, and a great many Dominican careers of that generation begin in it.","type":"text"}]},{"type":"paragraph","content":[{"text":"His first recordings were Mi Debilidad and Tú No Tienes La Culpa. He later said, in 1966, that Mi Debilidad had been the filler — the throwaway on the other side of the record he actually cared about. It became the song people still ask for, which is the ordinary fate of a hunch about one’s own work.","type":"text"}]},{"type":"paragraph","content":[{"text":"He recorded for the Kubaney label out of Miami and New York, backed on one album by the group Los Diplomáticos, and on another by ","type":"text"},{"type":"artistReference","attrs":{"artistId":"ba42e200-51b0-437b-99ac-1daf39ade337","displayText":"Rafael Solano","occurrenceId":"6ec8bcf4-0dfc-4d67-a1ce-143cef0c4a13"}},{"text":" himself. He worked as a singer in the Dominican Republic, Puerto Rico, Venezuela, New York, Miami and Boston, which was the ordinary circuit for a Dominican romantic singer and remains so.","type":"text"}]},{"type":"paragraph","content":[{"text":"The April hymn","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He had opposed the Trujillo dictatorship and was arrested and imprisoned for it. That is the background to the thing he is best known for.","type":"text"}]},{"type":"paragraph","content":[{"text":"When the constitutionalist revolt broke out in April 1965 he wrote a hymn for it — words and music both — and it was recorded at a studio in the capital during the closing months of the fighting. A song written inside a war, by someone who had already been jailed by the previous regime, is not a commemorative piece composed afterwards at a safe distance. It was made while the outcome was unknown.","type":"text"}]},{"type":"paragraph","content":[{"text":"He also wrote the music for the hymn of the Dominican Revolutionary Party, to words by José Francisco Peña Gómez. The distinction is worth keeping: on the April hymn he wrote everything, and on this one he wrote the tune.","type":"text"}]},{"type":"paragraph","content":[{"text":"Formal recognition took a long time to arrive. He said as much himself, half a century later, when it finally did.","type":"text"}]},{"type":"paragraph","content":[{"text":"The boleros","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The rest of the catalogue is romantic song, and it is what he was doing before and after the war. Déjame Beber, Virgen Negra, Muchachita De Mi Pueblo and Tú No Tienes La Culpa are the ones that lasted, alongside the accidental hit.","type":"text"}]},{"type":"paragraph","content":[{"text":"He produced for television too, sharing a programme in 1968 with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"c958758c-a949-4bd9-963d-6d48bc750b60","displayText":"Jorge Taveras","occurrenceId":"ea7b21e1-87bf-4b5c-afee-cb7fca430f06"}},{"text":" on the state channel. A singer who is also a pianist and a composer tends to end up on that side of the desk eventually.","type":"text"}]},{"type":"paragraph","content":[{"text":"He spent his later life in the United States and died there in 2023, at ninety. The obituaries in the Dominican press led with the hymn rather than with the boleros, which is probably right and is certainly what he would have expected.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'anibal-de-pena'), 1)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Aníbal de Peña, de nombre Newton Aníbal de Peña, fue cantante, pianista y compositor dominicano. Se pasó una carrera escribiendo canciones de amor y se le recuerda sobre todo por una que no lo era: el himno de la revolución de abril, cuya letra y música son las dos suyas.","type":"text"}]},{"type":"paragraph","content":[{"text":"Rahintel y los primeros discos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Salió de Barahona a los estudios de televisión de la capital al doblar los años sesenta, dentro de la cosecha de cantantes que ","type":"text"},{"type":"artistReference","attrs":{"artistId":"ba42e200-51b0-437b-99ac-1daf39ade337","displayText":"Rafael Solano","occurrenceId":"f2fd3cc2-0be8-4c74-afbb-80a6af5b802f"}},{"text":" propició por Rahintel a partir de 1959. Aquel canal funcionó como un conservatorio con cámaras, y muchísimas carreras dominicanas de esa generación empiezan ahí.","type":"text"}]},{"type":"paragraph","content":[{"text":"Sus primeras grabaciones fueron Mi Debilidad y Tú No Tienes La Culpa. Años después, en 1966, dijo que Mi Debilidad había sido el relleno: lo que iba del otro lado del disco que de verdad le importaba. Terminó siendo la canción que la gente sigue pidiendo, que es el destino corriente de una corazonada sobre la obra propia.","type":"text"}]},{"type":"paragraph","content":[{"text":"Grabó para el sello Kubaney, de Miami y Nueva York, acompañado en un larga duración por el conjunto Los Diplomáticos y en otro por el propio ","type":"text"},{"type":"artistReference","attrs":{"artistId":"ba42e200-51b0-437b-99ac-1daf39ade337","displayText":"Rafael Solano","occurrenceId":"18054039-8fe8-4110-9fc5-0cda2001be5a"}},{"text":". Trabajó como cantante en la República Dominicana, Puerto Rico, Venezuela, Nueva York, Miami y Boston, que era el circuito corriente de un romántico dominicano y lo sigue siendo.","type":"text"}]},{"type":"paragraph","content":[{"text":"El himno de abril","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Se había opuesto a la dictadura de Trujillo y por eso fue apresado y encarcelado. Ese es el antecedente de aquello por lo que más se le conoce.","type":"text"}]},{"type":"paragraph","content":[{"text":"Cuando estalló la revuelta constitucionalista en abril de 1965 le escribió un himno —letra y música— y se grabó en un estudio de la capital en los meses finales de la contienda. Una canción hecha dentro de una guerra, por alguien a quien el régimen anterior ya había metido preso, no es una pieza conmemorativa compuesta después y a distancia prudente. Se hizo cuando no se sabía cómo iba a terminar.","type":"text"}]},{"type":"paragraph","content":[{"text":"Escribió además la música del himno del Partido Revolucionario Dominicano, con letra de José Francisco Peña Gómez. La distinción conviene mantenerla: en el de abril puso todo, y en este puso la melodía.","type":"text"}]},{"type":"paragraph","content":[{"text":"El reconocimiento oficial tardó mucho en llegar. Lo dijo él mismo, medio siglo después, cuando por fin llegó.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los boleros","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El resto del catálogo es canción romántica, que es lo que hacía antes de la guerra y lo que siguió haciendo después. Déjame Beber, Virgen Negra, Muchachita De Mi Pueblo y Tú No Tienes La Culpa son las que quedaron, junto al éxito accidental.","type":"text"}]},{"type":"paragraph","content":[{"text":"Produjo también para la televisión: en 1968 compartió un programa con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"c958758c-a949-4bd9-963d-6d48bc750b60","displayText":"Jorge Taveras","occurrenceId":"3e5af910-ab2a-42d2-9548-06ca6e7b4065"}},{"text":" en el canal del Estado. Un cantante que además es pianista y compositor suele acabar de ese lado del escritorio.","type":"text"}]},{"type":"paragraph","content":[{"text":"Pasó sus últimos años en Estados Unidos y allí murió en 2023, a los noventa. Los obituarios de la prensa dominicana abrieron con el himno y no con los boleros, que probablemente sea lo justo y desde luego es lo que él habría esperado.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'anibal-de-pena'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'anibal-de-pena') AND locale = 'en'), '6ec8bcf4-0dfc-4d67-a1ce-143cef0c4a13', 'artist', 'ba42e200-51b0-437b-99ac-1daf39ade337');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'anibal-de-pena') AND locale = 'en'), '90916bea-0608-4106-af78-79c427eed54b', 'artist', 'ba42e200-51b0-437b-99ac-1daf39ade337');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'anibal-de-pena') AND locale = 'en'), 'ea7b21e1-87bf-4b5c-afee-cb7fca430f06', 'artist', 'c958758c-a949-4bd9-963d-6d48bc750b60');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'anibal-de-pena') AND locale = 'es'), '18054039-8fe8-4110-9fc5-0cda2001be5a', 'artist', 'ba42e200-51b0-437b-99ac-1daf39ade337');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'anibal-de-pena') AND locale = 'es'), '3e5af910-ab2a-42d2-9548-06ca6e7b4065', 'artist', 'c958758c-a949-4bd9-963d-6d48bc750b60');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'anibal-de-pena') AND locale = 'es'), 'f2fd3cc2-0be8-4c74-afbb-80a6af5b802f', 'artist', 'ba42e200-51b0-437b-99ac-1daf39ade337');

COMMIT;
