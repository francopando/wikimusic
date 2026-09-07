BEGIN;

-- Create the catalogue entry for Rafael Encarnación.
--
-- Rafael Encarnación. Ficha nueva. Número dos de la lista de prioridad.
--
-- DOS CORRECCIONES A LO QUE CIRCULA, Y LAS DOS IMPORTAN.
--
-- 1. NO NACIÓ EN EL CERCADO. Por Facebook circula, copiado en decenas de páginas
-- con el mismo texto palabra por palabra, que era "Nacido en El Cercado, San
-- Juan". La crónica de Miguel "Mickey" López Ortiz lo desmonta: El Cercado era el
-- pueblo de su PADRE, el doctor Blas Eduardo Encarnación Berigüeta. Rafael nació
-- en la calle Gaspar Hernández número 1, barrio San Carlos, Santo Domingo, el 11
-- de enero de 1944. Bachata Republic coincide en que era capitaleño. El texto de
-- Facebook confundió al padre con el hijo, y de ahí se copió a todas partes.
--
-- 2. MURIÓ EL 24, NO EL 23 DE MARZO. Casi todas las fuentes dan el 23 de marzo de
-- 1964. López Ortiz da la secuencia con horas: el accidente fue la mañana del
-- lunes 23, y murió a las tres de la tarde del martes 24 en la Clínica Abel
-- González. Es el único relato que separa las dos fechas, y es el más detallado
-- con diferencia. Se guarda el 24. CONFLICTO ANOTADO: Bachata Republic y toda la
-- cadena de Facebook dicen 23. Si el editor prefiere la fecha mayoritaria, se
-- cambia date_of_death a 1964-03-23 en la fila.
--
-- NO SE ESCRIBE CÓMO MURIÓ, por la regla de siempre. La crónica trae la
-- intersección, el vehículo y el nombre del conductor. Nada de eso va. Lo que sí
-- va es adónde iba, porque es un hecho musical: iba al estudio a recoger las
-- cintas de dos canciones suyas que nunca llegó a oír.
--
-- UNA COMPROBACIÓN CRONOLÓGICA QUE CAMBIA LA HISTORIA. iASO lo lista entre los
-- músicos que "colaboraron con Guarachita". No puede ser en vida: sus éxitos son
-- de finales de 1963 y Radio Guarachita no salió al aire en el 690 de AM hasta
-- 1965, tras un año de pruebas. Sus discos son ANTERIORES a la emisora que
-- después definiría el género. Por eso NO se enlaza a radhames-aracena, aunque
-- tenga ficha desde hoy: enlazarlo sugeriría una relación que las fechas no
-- permiten.
--
-- LO QUE SÍ SE ENLAZA. rafael-solano, porque la única vez que Encarnación salió en
-- televisión fue en "La hora del moro", el programa que Solano tenía en Rahintel /
-- Canal 7 -- y es el mismo conducto por el que pasó anibal-de-pena, escrito hoy.
-- Y jose-manuel-calderon, que grabó la primera bachata en 1962 y es la referencia
-- obligada para situar a Encarnación en la primera generación.
--
-- EL MATIZ DEL CRONISTA VA DENTRO, porque es lo más fino que dice ninguna fuente:
-- a Encarnación se le llama de los primeros bachateros de peso "a pesar de que
-- luego este estilo bolerístico adquirió unas características que no están
-- presentes en sus registros discográficos", en particular el floreo de la primera
-- guitarra. Es decir: es un fundador de un género cuyo sonido característico
-- todavía no existía cuando él grabó. Eso merece decirse.
--
-- LA VIDA FAMILIAR QUEDA FUERA -- padres, veinticuatro hermanos, la casa, el
-- velatorio, el cementerio. Sí entra su hermano Julio César, pero solo por el
-- crédito: escribió y cantó el tema que cierra el disco de homenaje, y la autoría
-- es lo que este registro guarda.
--
-- FUENTES: Miguel "Mickey" López Ortiz, "Rafael Encarnación (1944-1964): un ídolo
-- ido a destiempo", que es la fuente larga y de donde salen el nombre completo, la
-- fecha y el lugar de nacimiento, el Salón Mozart de doña Atala Blandino, la fecha
-- exacta del primer sencillo, la actuación en televisión, el contrato con Sonus y
-- el contenido del disco de Kubaney. Bachata Republic, ficha firmada por Luis
-- Becker Cabrera, 22 de julio de 2022. Bachamag, 23 de septiembre de 2016. No hay
-- artículo de Wikipedia en ningún idioma.
--
-- NOMBRES NUEVOS PARA LA LISTA: Atala Blandino, dueña del estudio Salón Mozart
-- donde se grabaron las primeras bachatas; el Trío Ideal, que lo acompaña en el
-- disco de Kubaney; Chicho Severino "El Millonario", que Bachata Republic señala
-- como su mayor seguidor; Rafael Bolívar Quiñones, el músico que lo acompañaba; y
-- Julio César Encarnación. Andrés Rodríguez, autor de la letra de "Esclavo de tu
-- amor", NO se enlaza: hay un andres-rodriguez en la base pero está en
-- needs_review y nada confirma que sea el mismo.
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
       name = 'Rafael Encarnación',
       sort_name = 'Encarnación Núñez, Rafael Eduardo',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = TRUE,
       primary_role = 'singer',
       primary_genre = 'bachata',
       date_of_birth = '1944-01-11',
       birth_year = 1944,
       date_of_death = '1964-03-24',
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Rafael',
       middle_name = 'Eduardo',
       last_name = 'Encarnación',
       second_last_name = 'Núñez',
       stage_name = 'Rafael Encarnación',
       aliases = ARRAY['Rafelito Encarnación']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Bachata pioneer; ten boleros recorded in a six-month career that ended in 1964',
       bio_en = 'Rafael Encarnación, also billed as Rafelito, was a Dominican singer and songwriter and one of the founding voices of bachata. His professional career lasted about six months. He left ten boleros behind and was twenty years old when he died.

**Salón Mozart**

He was born in Santo Domingo in 1944, in the San Carlos barrio, and he was self-taught — no musician in the family, no formal study, a boy who simply started writing songs in his teens and turned out to be good at it.

In mid-1963 he got into Salón Mozart, a recording studio in the capital, and on 24 September that year his first single reached the shops: Muero Contigo on one side, Pena de Hombre on the other. Both went into radio rotation at once, which almost never happens, and Castigo de Amor, Loco Anhelo and Sin Rencores followed them onto the lists.

The timing is worth getting right. This was a full year before Radio Guarachita went on the air, so the station that would later carry this music across the country played no part in making him. His records travelled on ordinary radio, at a moment when nobody had yet decided what to call what he was doing.

**Ten boleros**

What he recorded were boleros, sung to a guitar, and they belong to the same first wave as José Manuel Calderón, who had cut the earliest Dominican records in this style the year before.

There is a point about him that careful chroniclers make and casual ones miss. He is named among the first significant bachateros, but the florid lead-guitar playing that later became the sound of the genre is simply not on his recordings. The style had not arrived yet. He is a founder of a music whose defining texture he never heard, which is an odd thing to be and is almost never said.

What is on the records instead is the voice, and that is what people kept. Muero Contigo has been recorded again by singers of several later generations and in several genres, and it is still the song of his that gets asked for.

**La hora del moro**

A week before the end he appeared on television for the first and only time, singing Muero Contigo and Pena de Hombre on the programme Rafael Solano presented on Rahintel. He is generally credited as the first bachatero to sing on a Dominican television programme, which mattered because the music was then considered unfit for it.

He had plans that week. A Venezuelan label had just signed him and he was preparing to travel to Caracas to record, and he had arranged to enter the national university to read dentistry, which he intended to combine with singing.

**The tapes he never heard**

On the morning of Monday 23 March 1964 he set out for Salón Mozart to collect the tapes of his two newest recordings, ¡Ay, Qué Amor! and Logré Olvidarte. He never arrived and never heard them. He died the following afternoon, at twenty.

Two years later the Cuban label Kubaney gathered the singles that had been issued separately and released them as an album of homage, with the Trío Ideal accompanying. It holds the whole surviving catalogue: ¡Ay, Qué Amor!, Calma Mi Llanto, Castigo de Amor, Esclavo de Tu Amor, Falsedad, Loco Anhelo, Logré Olvidarte, Muero Contigo, No Lo Niegues, Pena de Hombre and Sin Rencores. Every lyric on it is his except one. The record closes with a song written and sung by his brother Julio César, who made his own debut that way.

Six months of work is not much to be judged on. It has been enough for sixty years.',
       bio_es = 'Rafael Encarnación, anunciado también como Rafelito, fue cantante y compositor dominicano y una de las voces fundadoras de la bachata. Su carrera profesional duró unos seis meses. Dejó diez boleros grabados y tenía veinte años cuando murió.

**Salón Mozart**

Nació en Santo Domingo en 1944, en el barrio San Carlos, y era intuitivo: ningún músico en la familia, ningún estudio formal, un muchacho que simplemente se puso a escribir canciones en la adolescencia y resultó que le salían.

A mediados de 1963 entró al Salón Mozart, un estudio de grabación de la capital, y el 24 de septiembre de ese año salió a la venta su primer sencillo: Muero Contigo de un lado, Pena de Hombre del otro. Los dos entraron en rotación radial de una vez, cosa que casi nunca pasa, y detrás se colocaron Castigo de Amor, Loco Anhelo y Sin Rencores.

Conviene precisar las fechas. Esto es un año entero antes de que Radio Guarachita saliera al aire, así que la emisora que después llevaría esta música por todo el país no tuvo nada que ver con hacerlo a él. Sus discos viajaron por la radio corriente, en un momento en que todavía nadie había decidido cómo llamar a lo que él hacía.

**Diez boleros**

Lo que grabó fueron boleros, cantados a la guitarra, y pertenecen a la misma primera oleada que José Manuel Calderón, que había grabado los discos dominicanos más tempranos de ese estilo el año anterior.

Hay algo sobre él que los cronistas cuidadosos señalan y los descuidados se saltan. Se le nombra entre los primeros bachateros de peso, pero el floreo de la primera guitarra, que después sería el sonido del género, sencillamente no está en sus grabaciones. Ese estilo aún no había llegado. Es fundador de una música cuya textura característica nunca oyó, que es una cosa rara de ser y casi nunca se dice.

Lo que sí hay en los discos es la voz, y eso es lo que la gente se quedó. Muero Contigo la han vuelto a grabar cantantes de varias generaciones posteriores y de varios géneros, y sigue siendo la canción suya que se pide.

**La hora del moro**

Una semana antes del final salió en televisión por primera y única vez, cantando Muero Contigo y Pena de Hombre en el programa que Rafael Solano presentaba en Rahintel. Se le acredita generalmente como el primer bachatero que cantó en un programa de la televisión dominicana, y eso importaba porque entonces se tenía esa música por impresentable ahí.

Aquella semana tenía planes. Un sello venezolano acababa de contratarlo y se preparaba para viajar a Caracas a grabar, y había arreglado su ingreso a la universidad nacional para estudiar odontología, que pensaba alternar con el canto.

**Las cintas que no oyó**

La mañana del lunes 23 de marzo de 1964 salió hacia el Salón Mozart a recoger las cintas de sus dos grabaciones más nuevas, ¡Ay, Qué Amor! y Logré Olvidarte. No llegó y no las oyó. Murió la tarde del día siguiente, a los veinte años.

Dos años después el sello cubano Kubaney reunió los sencillos que se habían editado por separado y los sacó como un disco de homenaje, con el Trío Ideal acompañando. Ahí está el catálogo entero que sobrevive: ¡Ay, Qué Amor!, Calma Mi Llanto, Castigo de Amor, Esclavo de Tu Amor, Falsedad, Loco Anhelo, Logré Olvidarte, Muero Contigo, No Lo Niegues, Pena de Hombre y Sin Rencores. Todas las letras son suyas menos una. El disco cierra con un tema escrito y cantado por su hermano Julio César, que se estrenó así.

Seis meses de trabajo no es mucho para que a uno lo juzguen. Ha bastado durante sesenta años.',
       updated_at = now()
 WHERE slug = 'rafael-encarnacion';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rafael-encarnacion')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rafael-encarnacion')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Rafael Encarnación, also billed as Rafelito, was a Dominican singer and songwriter and one of the founding voices of bachata. His professional career lasted about six months. He left ten boleros behind and was twenty years old when he died.","type":"text"}]},{"type":"paragraph","content":[{"text":"Salón Mozart","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He was born in Santo Domingo in 1944, in the San Carlos barrio, and he was self-taught — no musician in the family, no formal study, a boy who simply started writing songs in his teens and turned out to be good at it.","type":"text"}]},{"type":"paragraph","content":[{"text":"In mid-1963 he got into Salón Mozart, a recording studio in the capital, and on 24 September that year his first single reached the shops: Muero Contigo on one side, Pena de Hombre on the other. Both went into radio rotation at once, which almost never happens, and Castigo de Amor, Loco Anhelo and Sin Rencores followed them onto the lists.","type":"text"}]},{"type":"paragraph","content":[{"text":"The timing is worth getting right. This was a full year before Radio Guarachita went on the air, so the station that would later carry this music across the country played no part in making him. His records travelled on ordinary radio, at a moment when nobody had yet decided what to call what he was doing.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ten boleros","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"What he recorded were boleros, sung to a guitar, and they belong to the same first wave as ","type":"text"},{"type":"artistReference","attrs":{"artistId":"27c82e93-8c8f-4466-86ab-e1afba1e5487","displayText":"José Manuel Calderón","occurrenceId":"0e3748f7-38ad-40c9-ba4b-c8c23f197ce2"}},{"text":", who had cut the earliest Dominican records in this style the year before.","type":"text"}]},{"type":"paragraph","content":[{"text":"There is a point about him that careful chroniclers make and casual ones miss. He is named among the first significant bachateros, but the florid lead-guitar playing that later became the sound of the genre is simply not on his recordings. The style had not arrived yet. He is a founder of a music whose defining texture he never heard, which is an odd thing to be and is almost never said.","type":"text"}]},{"type":"paragraph","content":[{"text":"What is on the records instead is the voice, and that is what people kept. Muero Contigo has been recorded again by singers of several later generations and in several genres, and it is still the song of his that gets asked for.","type":"text"}]},{"type":"paragraph","content":[{"text":"La hora del moro","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"A week before the end he appeared on television for the first and only time, singing Muero Contigo and Pena de Hombre on the programme ","type":"text"},{"type":"artistReference","attrs":{"artistId":"ba42e200-51b0-437b-99ac-1daf39ade337","displayText":"Rafael Solano","occurrenceId":"c9a63f85-b54d-4831-91d0-a46930346c1a"}},{"text":" presented on Rahintel. He is generally credited as the first bachatero to sing on a Dominican television programme, which mattered because the music was then considered unfit for it.","type":"text"}]},{"type":"paragraph","content":[{"text":"He had plans that week. A Venezuelan label had just signed him and he was preparing to travel to Caracas to record, and he had arranged to enter the national university to read dentistry, which he intended to combine with singing.","type":"text"}]},{"type":"paragraph","content":[{"text":"The tapes he never heard","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"On the morning of Monday 23 March 1964 he set out for Salón Mozart to collect the tapes of his two newest recordings, ¡Ay, Qué Amor! and Logré Olvidarte. He never arrived and never heard them. He died the following afternoon, at twenty.","type":"text"}]},{"type":"paragraph","content":[{"text":"Two years later the Cuban label Kubaney gathered the singles that had been issued separately and released them as an album of homage, with the Trío Ideal accompanying. It holds the whole surviving catalogue: ¡Ay, Qué Amor!, Calma Mi Llanto, Castigo de Amor, Esclavo de Tu Amor, Falsedad, Loco Anhelo, Logré Olvidarte, Muero Contigo, No Lo Niegues, Pena de Hombre and Sin Rencores. Every lyric on it is his except one. The record closes with a song written and sung by his brother Julio César, who made his own debut that way.","type":"text"}]},{"type":"paragraph","content":[{"text":"Six months of work is not much to be judged on. It has been enough for sixty years.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'rafael-encarnacion'), 1)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Rafael Encarnación, anunciado también como Rafelito, fue cantante y compositor dominicano y una de las voces fundadoras de la bachata. Su carrera profesional duró unos seis meses. Dejó diez boleros grabados y tenía veinte años cuando murió.","type":"text"}]},{"type":"paragraph","content":[{"text":"Salón Mozart","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Nació en Santo Domingo en 1944, en el barrio San Carlos, y era intuitivo: ningún músico en la familia, ningún estudio formal, un muchacho que simplemente se puso a escribir canciones en la adolescencia y resultó que le salían.","type":"text"}]},{"type":"paragraph","content":[{"text":"A mediados de 1963 entró al Salón Mozart, un estudio de grabación de la capital, y el 24 de septiembre de ese año salió a la venta su primer sencillo: Muero Contigo de un lado, Pena de Hombre del otro. Los dos entraron en rotación radial de una vez, cosa que casi nunca pasa, y detrás se colocaron Castigo de Amor, Loco Anhelo y Sin Rencores.","type":"text"}]},{"type":"paragraph","content":[{"text":"Conviene precisar las fechas. Esto es un año entero antes de que Radio Guarachita saliera al aire, así que la emisora que después llevaría esta música por todo el país no tuvo nada que ver con hacerlo a él. Sus discos viajaron por la radio corriente, en un momento en que todavía nadie había decidido cómo llamar a lo que él hacía.","type":"text"}]},{"type":"paragraph","content":[{"text":"Diez boleros","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Lo que grabó fueron boleros, cantados a la guitarra, y pertenecen a la misma primera oleada que ","type":"text"},{"type":"artistReference","attrs":{"artistId":"27c82e93-8c8f-4466-86ab-e1afba1e5487","displayText":"José Manuel Calderón","occurrenceId":"fc2c3e27-44b6-43a9-a448-4532ad6b2de8"}},{"text":", que había grabado los discos dominicanos más tempranos de ese estilo el año anterior.","type":"text"}]},{"type":"paragraph","content":[{"text":"Hay algo sobre él que los cronistas cuidadosos señalan y los descuidados se saltan. Se le nombra entre los primeros bachateros de peso, pero el floreo de la primera guitarra, que después sería el sonido del género, sencillamente no está en sus grabaciones. Ese estilo aún no había llegado. Es fundador de una música cuya textura característica nunca oyó, que es una cosa rara de ser y casi nunca se dice.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que sí hay en los discos es la voz, y eso es lo que la gente se quedó. Muero Contigo la han vuelto a grabar cantantes de varias generaciones posteriores y de varios géneros, y sigue siendo la canción suya que se pide.","type":"text"}]},{"type":"paragraph","content":[{"text":"La hora del moro","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Una semana antes del final salió en televisión por primera y única vez, cantando Muero Contigo y Pena de Hombre en el programa que ","type":"text"},{"type":"artistReference","attrs":{"artistId":"ba42e200-51b0-437b-99ac-1daf39ade337","displayText":"Rafael Solano","occurrenceId":"cdcd4be5-e58a-4a1f-b9e3-db90d0f269b7"}},{"text":" presentaba en Rahintel. Se le acredita generalmente como el primer bachatero que cantó en un programa de la televisión dominicana, y eso importaba porque entonces se tenía esa música por impresentable ahí.","type":"text"}]},{"type":"paragraph","content":[{"text":"Aquella semana tenía planes. Un sello venezolano acababa de contratarlo y se preparaba para viajar a Caracas a grabar, y había arreglado su ingreso a la universidad nacional para estudiar odontología, que pensaba alternar con el canto.","type":"text"}]},{"type":"paragraph","content":[{"text":"Las cintas que no oyó","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La mañana del lunes 23 de marzo de 1964 salió hacia el Salón Mozart a recoger las cintas de sus dos grabaciones más nuevas, ¡Ay, Qué Amor! y Logré Olvidarte. No llegó y no las oyó. Murió la tarde del día siguiente, a los veinte años.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dos años después el sello cubano Kubaney reunió los sencillos que se habían editado por separado y los sacó como un disco de homenaje, con el Trío Ideal acompañando. Ahí está el catálogo entero que sobrevive: ¡Ay, Qué Amor!, Calma Mi Llanto, Castigo de Amor, Esclavo de Tu Amor, Falsedad, Loco Anhelo, Logré Olvidarte, Muero Contigo, No Lo Niegues, Pena de Hombre y Sin Rencores. Todas las letras son suyas menos una. El disco cierra con un tema escrito y cantado por su hermano Julio César, que se estrenó así.","type":"text"}]},{"type":"paragraph","content":[{"text":"Seis meses de trabajo no es mucho para que a uno lo juzguen. Ha bastado durante sesenta años.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'rafael-encarnacion'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rafael-encarnacion') AND locale = 'en'), '0e3748f7-38ad-40c9-ba4b-c8c23f197ce2', 'artist', '27c82e93-8c8f-4466-86ab-e1afba1e5487');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rafael-encarnacion') AND locale = 'en'), 'c9a63f85-b54d-4831-91d0-a46930346c1a', 'artist', 'ba42e200-51b0-437b-99ac-1daf39ade337');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rafael-encarnacion') AND locale = 'es'), 'cdcd4be5-e58a-4a1f-b9e3-db90d0f269b7', 'artist', 'ba42e200-51b0-437b-99ac-1daf39ade337');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rafael-encarnacion') AND locale = 'es'), 'fc2c3e27-44b6-43a9-a448-4532ad6b2de8', 'artist', '27c82e93-8c8f-4466-86ab-e1afba1e5487');

COMMIT;
