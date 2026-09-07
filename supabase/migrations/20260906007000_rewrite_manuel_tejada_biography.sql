BEGIN;

-- Rewrite the catalogue entry for Manuel Tejada.
--
-- Manuel Tejada. Filler in English, nothing in Spanish -- on the man Dominican
-- musicians describe as the most awarded arranger in the country's history.
-- This is the largest name left in the filler queue.
--
-- FILLED: date_of_birth 26 November 1957. birth_year 1957, province Santo
-- Domingo, birth_place Santo Domingo and the legend tag were all already stored
-- and are not touched.
--
-- ADDED: occupations musical_director beside the musician, arranger and
-- composer already there; instruments piano; genres; disambiguation. The
-- aliases array held only "Manuel Tejada", a copy of the name, and now holds
-- the honorific he is universally referred to by instead.
--
-- primary_role producer and primary_genre merengue both stay. He works far
-- outside merengue -- film scores, ballads, orchestral writing -- but merengue
-- is where the arranging reputation was built and it remains the largest part
-- of the catalogue.
--
-- SOURCES: Diario Libre, 21 January 2024, on his composing the score of the
-- documentary El Fotógrafo de La 40, and again on 1 February and 28 March 2024
-- on the premiere and on the film, directed by Erika Santelises, about Fuentes
-- Berg. MinayaPR, 21 March 2018, on the Soberano he took at the thirty-fourth
-- edition of the awards, at the Teatro Nacional. The Dominican Senate's culture
-- commission, which reported favourably on a resolution recognising his career.
-- Merengazo FM's biographical post for the birth date of 26 November 1957 in
-- Santo Domingo and for the description of him as the most awarded arranger in
-- the country's history. Junior Cabrera's long interview, published as "Los
-- secretos de producción del arreglista más premiado de la historia
-- dominicana", and the same interviewer's account of the specific passage
-- Tejada added to the arrangement of La Quiero a Morir for Sergio Vargas.
-- Franklin Blanco on the arrangement of Colegiala for Alex Bueno. A
-- Politihablando clip in which Adalgisa Pantaleón describes being hired by him
-- in 1992 to sing the choruses on a Dhario Primero record. Wilfrido Vargas's
-- own page, naming him with Jorge Taveras and Julio Gautreaux among the
-- musicians who built the genre.
--
-- NUMBERS DELIBERATELY LEFT VAGUE. One source says more than a thousand
-- arrangements, another more than five thousand. Neither is sourced to a count
-- and the difference is a factor of five, so the prose says the number is in
-- the thousands and does not pick one.
--
-- A CREDIT NOT TAKEN. A widely shared Instagram post that names him also
-- credits "Por H o por R" and "Como nadie" as compositions -- but the post is
-- addressed to somebody else, on International Women's Day, and merely lists
-- him among that person's collaborators. Those two songs are NOT attributed to
-- him here. This is exactly the kind of misreading that produces a false credit
-- in a catalogue.
--
-- NOT LINKED: Jorge Taveras, Julio Gautreaux, Dhario Primero and Erika
-- Santelises have no entries; the first two are notable gaps and are going on
-- the missing-artists list. Emmanuel, Olga Tañón and Julio Iglesias are named
-- as clients in a Facebook comment that nothing corroborates, and none of the
-- three appears in this entry.
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
       name = 'Manuel Tejada',
       sort_name = 'Tejada, Manuel',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'producer',
       primary_genre = 'merengue',
       date_of_birth = '1957-11-26',
       birth_year = 1957,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Santo Domingo',
       first_name = 'Manuel',
       middle_name = NULL,
       last_name = 'Tejada',
       second_last_name = NULL,
       stage_name = 'Manuel Tejada',
       aliases = ARRAY['Maestro Manuel Tejada']::text[],
       occupations = '["musician","arranger","composer","musical_director"]'::jsonb,
       instruments = ARRAY['piano']::text[],
       genres = ARRAY['merengue-orquesta', 'ballads', 'instrumental-classical']::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = 'https://www.midilabstudios.com',
       youtube = NULL,
       facebook = NULL,
       instagram = 'manueltejadat',
       disambiguation = 'Arranger, composer and producer; the most awarded arranger in Dominican music',
       bio_en = 'Manuel Tejada is a Dominican arranger, composer, pianist and record producer. Ask Dominican musicians who the most awarded arranger in the country’s history is and the answer comes back as his name, usually without argument.

**What an arranger does**

An arrangement is the part of a record nobody outside the studio can name and everybody recognises. The song arrives as a melody and a lyric; what decides whether it works is where the horns enter, what the piano is doing under the second verse, and how long the band waits before the chorus.

He has written those decisions into a number of records that runs into the thousands. Colegiala, for Alex Bueno, is one of the arrangements other arrangers point to. So is La Quiero a Morir for Sergio Vargas, where the passage he added is well enough known that he has been asked to explain it on camera.

He also arranged a version of Casandra Damirón’s repertoire, which is a different kind of job: taking material from the generation that made the Dominican songbook and setting it for a modern band without flattening it.

**Around the studio**

The work goes past arranging. He produces, he directs, and he hires — Adalgisa Pantaleón has described being brought in by him in 1992 to sing the choruses on a ballad record, which is the sort of decision that shapes a session and never appears on a sleeve.

When Wilfrido Vargas has named the musicians who built what Dominican music sounds like, Tejada is on the list, beside Jorge Taveras and Julio Gautreaux. Among Dominican listeners the perennial argument is whether he or Ramón Orlando is the more influential arranger in merengue, which is the kind of argument only two people can be in.

**Writing for film**

In 2024 he composed the score for El Fotógrafo de La 40, Erika Santelises’s documentary about Fuentes Berg, the man who photographed inside the Trujillo regime’s torture prison.

It is a long way from a merengue horn section, and it is the same skill: deciding what a piece of music should do to somebody who is not listening to it on purpose. Writing under archive footage of La 40 is about as far as that skill can be asked to reach.

**Recognition**

He took a Soberano at the thirty-fourth edition of the awards in March 2018, and the Dominican Senate’s culture commission has reported favourably on a resolution recognising his career.

Neither is what he is known for. What he is known for is that a very large share of the records a Dominican has heard in the last forty years were shaped by him, and that almost nobody outside the industry could name one of them as his.',
       bio_es = 'Manuel Tejada es arreglista, compositor, pianista y productor discográfico dominicano. Pregúntele a los músicos dominicanos quién es el arreglista más premiado de la historia del país y la respuesta vuelve con su nombre, casi siempre sin discusión.

**Qué hace un arreglista**

El arreglo es la parte de un disco que nadie fuera del estudio sabe nombrar y todo el mundo reconoce. La canción llega como melodía y letra; lo que decide si funciona es por dónde entran los metales, qué hace el piano debajo de la segunda estrofa, y cuánto espera la banda antes del coro.

Él ha escrito esas decisiones en una cantidad de discos que se cuenta por miles. Colegiala, para Alex Bueno, es uno de los arreglos que señalan otros arreglistas. También La Quiero a Morir para Sergio Vargas, donde la parte que él le agregó es lo bastante conocida como para que le hayan pedido explicarla frente a una cámara.

También arregló material del repertorio de Casandra Damirón, que es otro tipo de trabajo: agarrar canciones de la generación que hizo el cancionero dominicano y montarlas para una banda moderna sin aplanarlas.

**Alrededor del estudio**

El trabajo va más allá de arreglar. Produce, dirige y contrata: Adalgisa Pantaleón ha contado que él la llamó en 1992 para hacer los coros de un disco de balada, que es la clase de decisión que le da forma a una sesión y nunca aparece en una carátula.

Cuando Wilfrido Vargas ha nombrado a los músicos que construyeron el sonido de la música dominicana, Tejada está en la lista, al lado de Jorge Taveras y Julio Gautreaux. Entre los oyentes dominicanos la discusión eterna es si el arreglista más influyente del merengue es él o Ramón Orlando, que es la clase de discusión en la que solo pueden estar dos personas.

**Escribir para cine**

En 2024 compuso la banda sonora de El Fotógrafo de La 40, el documental de Erika Santelises sobre Fuentes Berg, el hombre que fotografió dentro de la cárcel de torturas del régimen de Trujillo.

Queda lejísimos de una sección de metales de merengue, y es la misma destreza: decidir qué tiene que hacerle una música a alguien que no la está oyendo a propósito. Escribir debajo de imágenes de archivo de La 40 es todo lo lejos que se le puede pedir a esa destreza que llegue.

**Reconocimiento**

Se llevó un Soberano en la trigésimo cuarta edición de los premios, en marzo de 2018, y la comisión de cultura del Senado dominicano rindió informe favorable a una resolución que reconoce su trayectoria.

Ninguna de las dos cosas es por lo que se le conoce. Por lo que se le conoce es porque una parte enorme de los discos que ha oído un dominicano en los últimos cuarenta años pasó por sus manos, y porque casi nadie fuera de la industria sabría nombrar uno como suyo.',
       updated_at = now()
 WHERE slug = 'manuel-tejada';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'manuel-tejada')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'manuel-tejada')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Manuel Tejada is a Dominican arranger, composer, pianist and record producer. Ask Dominican musicians who the most awarded arranger in the country’s history is and the answer comes back as his name, usually without argument.","type":"text"}]},{"type":"paragraph","content":[{"text":"What an arranger does","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"An arrangement is the part of a record nobody outside the studio can name and everybody recognises. The song arrives as a melody and a lyric; what decides whether it works is where the horns enter, what the piano is doing under the second verse, and how long the band waits before the chorus.","type":"text"}]},{"type":"paragraph","content":[{"text":"He has written those decisions into a number of records that runs into the thousands. Colegiala, for ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6c3e0d74-23b7-4d80-969f-9d5319ee5127","displayText":"Alex Bueno","occurrenceId":"efb3139b-6b4e-4989-bb8e-90cb022d954d"}},{"text":", is one of the arrangements other arrangers point to. So is La Quiero a Morir for ","type":"text"},{"type":"artistReference","attrs":{"artistId":"059a9e99-5d11-433e-97b9-9c35e57908f1","displayText":"Sergio Vargas","occurrenceId":"29c6fcb5-5664-4ca9-b3c3-8815ead8dd64"}},{"text":", where the passage he added is well enough known that he has been asked to explain it on camera.","type":"text"}]},{"type":"paragraph","content":[{"text":"He also arranged a version of ","type":"text"},{"type":"artistReference","attrs":{"artistId":"a81458f1-ccaa-451a-8cd5-2afd4d27affb","displayText":"Casandra Damirón","occurrenceId":"a959a8d8-00f3-489a-a59c-39e4b8d400ad"}},{"text":"’s repertoire, which is a different kind of job: taking material from the generation that made the Dominican songbook and setting it for a modern band without flattening it.","type":"text"}]},{"type":"paragraph","content":[{"text":"Around the studio","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The work goes past arranging. He produces, he directs, and he hires — ","type":"text"},{"type":"artistReference","attrs":{"artistId":"79d013c7-dafc-4807-966e-32c370172dee","displayText":"Adalgisa Pantaleón","occurrenceId":"f61189d2-0b59-4ecb-b3dc-c15b94d8c08c"}},{"text":" has described being brought in by him in 1992 to sing the choruses on a ballad record, which is the sort of decision that shapes a session and never appears on a sleeve.","type":"text"}]},{"type":"paragraph","content":[{"text":"When ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"da8b9b0d-90af-451a-9469-0dcc130fe140"}},{"text":" has named the musicians who built what Dominican music sounds like, Tejada is on the list, beside Jorge Taveras and Julio Gautreaux. Among Dominican listeners the perennial argument is whether he or ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"71ad8a48-1ac2-493b-a503-ea89ebe54cab"}},{"text":" is the more influential arranger in merengue, which is the kind of argument only two people can be in.","type":"text"}]},{"type":"paragraph","content":[{"text":"Writing for film","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In 2024 he composed the score for El Fotógrafo de La 40, Erika Santelises’s documentary about Fuentes Berg, the man who photographed inside the Trujillo regime’s torture prison.","type":"text"}]},{"type":"paragraph","content":[{"text":"It is a long way from a merengue horn section, and it is the same skill: deciding what a piece of music should do to somebody who is not listening to it on purpose. Writing under archive footage of La 40 is about as far as that skill can be asked to reach.","type":"text"}]},{"type":"paragraph","content":[{"text":"Recognition","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He took a Soberano at the thirty-fourth edition of the awards in March 2018, and the Dominican Senate’s culture commission has reported favourably on a resolution recognising his career.","type":"text"}]},{"type":"paragraph","content":[{"text":"Neither is what he is known for. What he is known for is that a very large share of the records a Dominican has heard in the last forty years were shaped by him, and that almost nobody outside the industry could name one of them as his.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'manuel-tejada'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Manuel Tejada es arreglista, compositor, pianista y productor discográfico dominicano. Pregúntele a los músicos dominicanos quién es el arreglista más premiado de la historia del país y la respuesta vuelve con su nombre, casi siempre sin discusión.","type":"text"}]},{"type":"paragraph","content":[{"text":"Qué hace un arreglista","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El arreglo es la parte de un disco que nadie fuera del estudio sabe nombrar y todo el mundo reconoce. La canción llega como melodía y letra; lo que decide si funciona es por dónde entran los metales, qué hace el piano debajo de la segunda estrofa, y cuánto espera la banda antes del coro.","type":"text"}]},{"type":"paragraph","content":[{"text":"Él ha escrito esas decisiones en una cantidad de discos que se cuenta por miles. Colegiala, para ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6c3e0d74-23b7-4d80-969f-9d5319ee5127","displayText":"Alex Bueno","occurrenceId":"e7d107ca-eeeb-430f-9619-c742c1acaffe"}},{"text":", es uno de los arreglos que señalan otros arreglistas. También La Quiero a Morir para ","type":"text"},{"type":"artistReference","attrs":{"artistId":"059a9e99-5d11-433e-97b9-9c35e57908f1","displayText":"Sergio Vargas","occurrenceId":"8bbccec1-eaa5-4090-887b-c83dc769865d"}},{"text":", donde la parte que él le agregó es lo bastante conocida como para que le hayan pedido explicarla frente a una cámara.","type":"text"}]},{"type":"paragraph","content":[{"text":"También arregló material del repertorio de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"a81458f1-ccaa-451a-8cd5-2afd4d27affb","displayText":"Casandra Damirón","occurrenceId":"ac2f6f9e-8418-4b59-a0d0-99b5e1ba0994"}},{"text":", que es otro tipo de trabajo: agarrar canciones de la generación que hizo el cancionero dominicano y montarlas para una banda moderna sin aplanarlas.","type":"text"}]},{"type":"paragraph","content":[{"text":"Alrededor del estudio","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El trabajo va más allá de arreglar. Produce, dirige y contrata: ","type":"text"},{"type":"artistReference","attrs":{"artistId":"79d013c7-dafc-4807-966e-32c370172dee","displayText":"Adalgisa Pantaleón","occurrenceId":"b1c3a169-a01d-44f9-a72b-ecbe9160880d"}},{"text":" ha contado que él la llamó en 1992 para hacer los coros de un disco de balada, que es la clase de decisión que le da forma a una sesión y nunca aparece en una carátula.","type":"text"}]},{"type":"paragraph","content":[{"text":"Cuando ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"badbb284-e9f4-4bad-9baf-ba4c9596d8b4"}},{"text":" ha nombrado a los músicos que construyeron el sonido de la música dominicana, Tejada está en la lista, al lado de Jorge Taveras y Julio Gautreaux. Entre los oyentes dominicanos la discusión eterna es si el arreglista más influyente del merengue es él o ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"ee9dd9ac-1e8b-487f-a080-28190310946c"}},{"text":", que es la clase de discusión en la que solo pueden estar dos personas.","type":"text"}]},{"type":"paragraph","content":[{"text":"Escribir para cine","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En 2024 compuso la banda sonora de El Fotógrafo de La 40, el documental de Erika Santelises sobre Fuentes Berg, el hombre que fotografió dentro de la cárcel de torturas del régimen de Trujillo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Queda lejísimos de una sección de metales de merengue, y es la misma destreza: decidir qué tiene que hacerle una música a alguien que no la está oyendo a propósito. Escribir debajo de imágenes de archivo de La 40 es todo lo lejos que se le puede pedir a esa destreza que llegue.","type":"text"}]},{"type":"paragraph","content":[{"text":"Reconocimiento","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Se llevó un Soberano en la trigésimo cuarta edición de los premios, en marzo de 2018, y la comisión de cultura del Senado dominicano rindió informe favorable a una resolución que reconoce su trayectoria.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ninguna de las dos cosas es por lo que se le conoce. Por lo que se le conoce es porque una parte enorme de los discos que ha oído un dominicano en los últimos cuarenta años pasó por sus manos, y porque casi nadie fuera de la industria sabría nombrar uno como suyo.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'manuel-tejada'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'manuel-tejada') AND locale = 'en'), '29c6fcb5-5664-4ca9-b3c3-8815ead8dd64', 'artist', '059a9e99-5d11-433e-97b9-9c35e57908f1');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'manuel-tejada') AND locale = 'en'), '71ad8a48-1ac2-493b-a503-ea89ebe54cab', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'manuel-tejada') AND locale = 'en'), 'a959a8d8-00f3-489a-a59c-39e4b8d400ad', 'artist', 'a81458f1-ccaa-451a-8cd5-2afd4d27affb');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'manuel-tejada') AND locale = 'en'), 'da8b9b0d-90af-451a-9469-0dcc130fe140', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'manuel-tejada') AND locale = 'en'), 'efb3139b-6b4e-4989-bb8e-90cb022d954d', 'artist', '6c3e0d74-23b7-4d80-969f-9d5319ee5127');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'manuel-tejada') AND locale = 'en'), 'f61189d2-0b59-4ecb-b3dc-c15b94d8c08c', 'artist', '79d013c7-dafc-4807-966e-32c370172dee');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'manuel-tejada') AND locale = 'es'), '8bbccec1-eaa5-4090-887b-c83dc769865d', 'artist', '059a9e99-5d11-433e-97b9-9c35e57908f1');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'manuel-tejada') AND locale = 'es'), 'ac2f6f9e-8418-4b59-a0d0-99b5e1ba0994', 'artist', 'a81458f1-ccaa-451a-8cd5-2afd4d27affb');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'manuel-tejada') AND locale = 'es'), 'b1c3a169-a01d-44f9-a72b-ecbe9160880d', 'artist', '79d013c7-dafc-4807-966e-32c370172dee');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'manuel-tejada') AND locale = 'es'), 'badbb284-e9f4-4bad-9baf-ba4c9596d8b4', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'manuel-tejada') AND locale = 'es'), 'e7d107ca-eeeb-430f-9619-c742c1acaffe', 'artist', '6c3e0d74-23b7-4d80-969f-9d5319ee5127');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'manuel-tejada') AND locale = 'es'), 'ee9dd9ac-1e8b-487f-a080-28190310946c', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

COMMIT;
