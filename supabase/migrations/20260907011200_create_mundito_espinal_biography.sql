BEGIN;

-- Create the catalogue entry for Mundito Espinal.
--
-- Mundito Espinal. Ficha nueva. Cierra el nivel 1 de la lista de prioridad.
--
-- NUEVE ENLACES, Y AQUÍ SÍ ESTÁN JUSTIFICADOS. En un compositor, la lista de
-- quién le cantó no es un adorno: es la obra. Todos comprobados y publicados:
-- julito-deschamps, anthony-rios, fausto-rey, johnny-ventura, luisito-marti,
-- fernando-casado, rafael-solano, fernando-villalona y charytin.
--
-- UN CRUCE BONITO CON LA FICHA DE HOY. En 1970 ganó el segundo lugar como
-- compositor en el Festival de la Canción de Miami con un tema arreglado por
-- Rafael Solano e interpretado por Fernando Casado -- los dos escritos o
-- enlazados hoy mismo. Y le escribió a Casado "Piénsalo" y "La noche está triste".
--
-- LA CENSURA VA DENTRO Y YA ESTABA MEDIO CONTADA. La ficha de julito-deschamps
-- dice que la Comisión de Espectáculos Públicos prohibió "Navidad 69" y "Aguinaldo
-- 69" y que, según la lectura del propio Espinal, sus letras eran llamados a la
-- sublevación. Esta ficha lo cuenta desde el otro lado, el del autor. Circula
-- además la resolución de la Comisión con el primer verso: "Ya llegan las
-- navidades y la triste patria mía, las recibe con dolor". Se cita porque es la
-- letra que costó la prohibición.
--
-- EDAD AL MORIR: HAY UN ERROR DE UN AÑO EN LA PRENSA. Listín Diario dijo el 12 de
-- agosto de 2015 que murió "a la edad de 81 años". No cuadra: nació el 3 de
-- septiembre de 1934, así que le faltaban tres semanas para los 81. La Wikipedia
-- alemana dice ochenta, que es lo correcto. La prosa no da la cuenta y la fila
-- guarda las dos fechas, que es de donde sale bien.
--
-- LA SALUD QUEDA FUERA -- diabetes y la neumonía que lo mató. La fuente alemana y
-- la dominicana las traen y ninguna entra.
--
-- MILAGROS GARCÍA FRANCO SE NOMBRA COMO COPRESENTADORA y nada más. Presentó con
-- él "De todo un poco" durante décadas, que es hecho profesional; el vínculo
-- personal no es asunto de este registro.
--
-- EXILIO A LOS TRECE. Salió del país con sus padres, opositores a Trujillo, y en
-- Nueva York se hizo del PRD. Es persecución política, del mismo tipo que la de
-- anibal-de-pena, y por la misma razón entra: sin eso no se explica que las
-- primeras canciones que le grabaron acabaran prohibidas.
--
-- primary_genre merengue, CON LA DISTINCIÓN NUEVA APLICADA: bolero y ballads son
-- géneros distintos de nivel 0 y los dos van en el array. Su obituario lo llama
-- "importante compositor de boleros y merengues", pero lo que el país canta son
-- los merengues navideños que popularizó Johnny Ventura.
--
-- FUENTES: LaCronica.do, obituario firmado por Máximo Jiménez -- periodista y
-- expresidente de Acroarte --, que es la fuente larga y de donde salen la emisora
-- W.H.O.M., la revista Alas, la columna en Ahora, el Festival de Miami y las
-- listas de intérpretes. Wikipedia en alemán, que es el único artículo
-- enciclopédico que tiene en ningún idioma, y que añade a Camboy Estévez,
-- Fernando Casado y Fernando Villalona. Listín Diario, El Caribe y El Tiempo, 12 y
-- 13 de agosto de 2015. El Fichero artístico dominicano de Jesús Torres Tejeda,
-- citado por LaCronica, para el inicio en la locución.
--
-- NOMBRES NUEVOS PARA LA LISTA: Camboy Estévez -- que ya estaba, por "Lucía" de
-- Balaguer, y ahora se confirma por segunda vía con "Un imposible" -- y Milagros
-- García Franco.
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
       name = 'Mundito Espinal',
       sort_name = 'Espinal Hernández, Rafael Edmundo',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = TRUE,
       primary_role = 'composer',
       primary_genre = 'merengue',
       date_of_birth = '1934-09-03',
       birth_year = 1934,
       date_of_death = '2015-08-12',
       birth_place = 'La Romana',
       province = 'La Romana',
       first_name = 'Rafael',
       middle_name = 'Edmundo',
       last_name = 'Espinal',
       second_last_name = 'Hernández',
       stage_name = 'Mundito Espinal',
       aliases = ARRAY['Rafael Edmundo Espinal Hernández']::text[],
       occupations = '["writer","radio_host","television_host"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['ballads', 'bolero']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Composer and broadcaster; wrote the Christmas merengues and the romantic songs of a generation of Dominican singers',
       bio_en = 'Mundito Espinal, born Rafael Edmundo Espinal Hernández, was a Dominican composer, journalist and broadcaster. He wrote around eighty songs and almost none of them are famous under his own name, which is the ordinary condition of a songwriter and was in his case very nearly the point.

**New York and the return**

He left the country at thirteen, with parents who opposed the Trujillo dictatorship, and grew up in New York, where he joined the Dominican Revolutionary Party and began announcing on radio at eighteen. He studied journalism there.

He came back in 1961, after the dictator was killed, to report on what was happening, and stayed. He directed a magazine for the air force, ran press offices, and wrote a column for years in one of the country’s political weeklies. The songwriting grew alongside all of that rather than instead of it.

**The banned Christmas songs**

The first person to record him was Julito Deschamps, in 1969, with two Christmas songs — Navidad del 69 and Aguinaldo 69. The public entertainment commission banned them.

The reason is audible in the opening line: the Christmasses are arriving, and my sad country receives them in pain. Espinal himself later said the lyrics were calls to rise against the government. A songwriter whose first two recorded works are seized by a censor has been told something useful about his own register, and he went on writing Christmas songs for the rest of his life — cheerful ones, mostly, which is its own kind of answer.

**Who sang him**

The merengues went to Johnny Ventura and his Combo Show: Sigo, Ah No Yo No Sé No, Llegó Navidad, Salsa Pa’ Tu Lechón and Llegó Nochebuena Otra Vez. Those are the ones the country still plays every December, and most people who can sing them could not name the man who wrote them.

The romantic songs went elsewhere. Fausto Rey had hits with Moriré Sin Ti, No Me Busques, Dime and Qué Triste. Anthony Ríos recorded Viejo Amigo and Nada. Charytin made Dime her own before Rey did. Luisito Martí took El Vestido, Fernando Villalona took Mayra, and Fernando Casado took Piénsalo and La Noche Está Triste.

In 1970 he came second as a composer at the Miami song festival, with a piece arranged by Rafael Solano and sung by Fernando Casado. That combination — his words, Solano’s arrangement, Casado’s voice — is about as concentrated a sample of Dominican popular song of the period as exists.

**De todo un poco**

The programme that made him a household presence was not musical. De todo un poco began on radio in 1971, moved to television in 1987, and he kept it running on one channel or another until the end of his life, presenting it with Milagros García Franco.

That is the shape of the career: a broadcaster whom the whole country watched, who happened to have written a large part of what it was listening to. The critics’ association dedicated a gala to him a couple of years before he died. He was eighty when he died, in 2015.',
       bio_es = 'Mundito Espinal, de nombre Rafael Edmundo Espinal Hernández, fue compositor, periodista y comunicador dominicano. Escribió alrededor de ochenta canciones y casi ninguna es famosa con su nombre encima, que es la condición corriente de un compositor y en su caso era casi el propósito.

**Nueva York y la vuelta**

Salió del país a los trece años, con unos padres opositores a la dictadura de Trujillo, y se crió en Nueva York, donde entró al Partido Revolucionario Dominicano y empezó a hacer locución a los dieciocho. Allí estudió periodismo.

Volvió en 1961, muerto el tirano, a cubrir lo que estaba pasando, y se quedó. Dirigió una revista de la fuerza aérea, llevó oficinas de prensa y escribió durante años una columna en uno de los semanarios políticos del país. Lo de componer creció al lado de todo eso y no en lugar de eso.

**Las navidades prohibidas**

El primero que le grabó fue Julito Deschamps, en 1969, con dos canciones de navidad: Navidad del 69 y Aguinaldo 69. La comisión de espectáculos públicos las prohibió.

El motivo se oye en el primer verso: ya llegan las navidades y la triste patria mía las recibe con dolor. El propio Espinal dijo después que aquellas letras eran llamados a la sublevación. A un compositor al que le incautan sus dos primeras obras grabadas le han dicho algo útil sobre su propio registro, y él siguió escribiendo canciones de navidad el resto de su vida —alegres, casi todas—, que es una respuesta a su manera.

**Quién le cantó**

Los merengues fueron a parar a Johnny Ventura y su Combo Show: Sigo, Ah No Yo No Sé No, Llegó Navidad, Salsa Pa’ Tu Lechón y Llegó Nochebuena Otra Vez. Esos son los que el país sigue poniendo cada diciembre, y casi todo el que se los sabe no sabría decir quién los escribió.

Las románticas fueron a otra parte. Fausto Rey pegó Moriré Sin Ti, No Me Busques, Dime y Qué Triste. Anthony Ríos grabó Viejo Amigo y Nada. Charytin hizo suya Dime antes que Rey. Luisito Martí se llevó El Vestido, Fernando Villalona se llevó Mayra, y Fernando Casado se llevó Piénsalo y La Noche Está Triste.

En 1970 quedó segundo como compositor en el festival de la canción de Miami, con un tema arreglado por Rafael Solano e interpretado por Fernando Casado. Esa combinación —su letra, el arreglo de Solano, la voz de Casado— es una muestra tan concentrada de la canción popular dominicana de aquellos años como pueda encontrarse.

**De todo un poco**

El programa que lo volvió presencia de casa no era musical. De todo un poco empezó en la radio en 1971, pasó a la televisión en 1987, y lo mantuvo en un canal o en otro hasta el final de su vida, presentándolo junto a Milagros García Franco.

Esa es la forma de la carrera: un comunicador al que veía el país entero, que resultaba haber escrito buena parte de lo que el país estaba oyendo. La asociación de cronistas le dedicó una gala un par de años antes de que muriera. Tenía ochenta años cuando murió, en 2015.',
       updated_at = now()
 WHERE slug = 'mundito-espinal';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'mundito-espinal')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'mundito-espinal')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Mundito Espinal, born Rafael Edmundo Espinal Hernández, was a Dominican composer, journalist and broadcaster. He wrote around eighty songs and almost none of them are famous under his own name, which is the ordinary condition of a songwriter and was in his case very nearly the point.","type":"text"}]},{"type":"paragraph","content":[{"text":"New York and the return","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He left the country at thirteen, with parents who opposed the Trujillo dictatorship, and grew up in New York, where he joined the Dominican Revolutionary Party and began announcing on radio at eighteen. He studied journalism there.","type":"text"}]},{"type":"paragraph","content":[{"text":"He came back in 1961, after the dictator was killed, to report on what was happening, and stayed. He directed a magazine for the air force, ran press offices, and wrote a column for years in one of the country’s political weeklies. The songwriting grew alongside all of that rather than instead of it.","type":"text"}]},{"type":"paragraph","content":[{"text":"The banned Christmas songs","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The first person to record him was ","type":"text"},{"type":"artistReference","attrs":{"artistId":"a4b2104e-5b76-4e04-b9ac-dfe3f25ea71d","displayText":"Julito Deschamps","occurrenceId":"e760795e-832b-47be-851e-2feef9049b9b"}},{"text":", in 1969, with two Christmas songs — Navidad del 69 and Aguinaldo 69. The public entertainment commission banned them.","type":"text"}]},{"type":"paragraph","content":[{"text":"The reason is audible in the opening line: the Christmasses are arriving, and my sad country receives them in pain. Espinal himself later said the lyrics were calls to rise against the government. A songwriter whose first two recorded works are seized by a censor has been told something useful about his own register, and he went on writing Christmas songs for the rest of his life — cheerful ones, mostly, which is its own kind of answer.","type":"text"}]},{"type":"paragraph","content":[{"text":"Who sang him","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The merengues went to ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"671a7f85-c416-480e-ae78-d927d7cc52c1"}},{"text":" and his Combo Show: Sigo, Ah No Yo No Sé No, Llegó Navidad, Salsa Pa’ Tu Lechón and Llegó Nochebuena Otra Vez. Those are the ones the country still plays every December, and most people who can sing them could not name the man who wrote them.","type":"text"}]},{"type":"paragraph","content":[{"text":"The romantic songs went elsewhere. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"60b0cfd0-b572-4d0f-a913-bbeb1aa734c6","displayText":"Fausto Rey","occurrenceId":"1ebddb54-dcfa-4c87-9739-3cf2e1a73c42"}},{"text":" had hits with Moriré Sin Ti, No Me Busques, Dime and Qué Triste. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"081c1484-bf1c-4b11-ba01-d68446b7b111","displayText":"Anthony Ríos","occurrenceId":"50b65fd7-9954-4e94-9f24-54cd2c01ace9"}},{"text":" recorded Viejo Amigo and Nada. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9e585186-f3b8-4720-979b-505f6198558e","displayText":"Charytin","occurrenceId":"f07dd816-5686-4be6-9e28-24b40d9bed0c"}},{"text":" made Dime her own before Rey did. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bd631179-2de1-4db3-809d-a896b591ca1d","displayText":"Luisito Martí","occurrenceId":"118e4f3b-566c-48b9-a70d-88e95d1265ac"}},{"text":" took El Vestido, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bc310977-31a9-41bb-9af2-7d3a0d7fabdd","displayText":"Fernando Villalona","occurrenceId":"7b587e58-ae55-4839-84fd-091a66f656ff"}},{"text":" took Mayra, and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"1131dfe6-f404-44b4-8d0d-f8120dc6f71a","displayText":"Fernando Casado","occurrenceId":"65759e20-0e3f-4588-b0ef-c4bf29d7f587"}},{"text":" took Piénsalo and La Noche Está Triste.","type":"text"}]},{"type":"paragraph","content":[{"text":"In 1970 he came second as a composer at the Miami song festival, with a piece arranged by ","type":"text"},{"type":"artistReference","attrs":{"artistId":"ba42e200-51b0-437b-99ac-1daf39ade337","displayText":"Rafael Solano","occurrenceId":"8b8897a8-84e4-4559-96c1-1fe2e9429698"}},{"text":" and sung by ","type":"text"},{"type":"artistReference","attrs":{"artistId":"1131dfe6-f404-44b4-8d0d-f8120dc6f71a","displayText":"Fernando Casado","occurrenceId":"ace82cb2-1966-4f63-b05f-6e6baa127827"}},{"text":". That combination — his words, Solano’s arrangement, Casado’s voice — is about as concentrated a sample of Dominican popular song of the period as exists.","type":"text"}]},{"type":"paragraph","content":[{"text":"De todo un poco","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The programme that made him a household presence was not musical. De todo un poco began on radio in 1971, moved to television in 1987, and he kept it running on one channel or another until the end of his life, presenting it with Milagros García Franco.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is the shape of the career: a broadcaster whom the whole country watched, who happened to have written a large part of what it was listening to. The critics’ association dedicated a gala to him a couple of years before he died. He was eighty when he died, in 2015.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'mundito-espinal'), 1)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Mundito Espinal, de nombre Rafael Edmundo Espinal Hernández, fue compositor, periodista y comunicador dominicano. Escribió alrededor de ochenta canciones y casi ninguna es famosa con su nombre encima, que es la condición corriente de un compositor y en su caso era casi el propósito.","type":"text"}]},{"type":"paragraph","content":[{"text":"Nueva York y la vuelta","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Salió del país a los trece años, con unos padres opositores a la dictadura de Trujillo, y se crió en Nueva York, donde entró al Partido Revolucionario Dominicano y empezó a hacer locución a los dieciocho. Allí estudió periodismo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Volvió en 1961, muerto el tirano, a cubrir lo que estaba pasando, y se quedó. Dirigió una revista de la fuerza aérea, llevó oficinas de prensa y escribió durante años una columna en uno de los semanarios políticos del país. Lo de componer creció al lado de todo eso y no en lugar de eso.","type":"text"}]},{"type":"paragraph","content":[{"text":"Las navidades prohibidas","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El primero que le grabó fue ","type":"text"},{"type":"artistReference","attrs":{"artistId":"a4b2104e-5b76-4e04-b9ac-dfe3f25ea71d","displayText":"Julito Deschamps","occurrenceId":"8bcd4a07-a66b-4883-96d1-e69b0227585d"}},{"text":", en 1969, con dos canciones de navidad: Navidad del 69 y Aguinaldo 69. La comisión de espectáculos públicos las prohibió.","type":"text"}]},{"type":"paragraph","content":[{"text":"El motivo se oye en el primer verso: ya llegan las navidades y la triste patria mía las recibe con dolor. El propio Espinal dijo después que aquellas letras eran llamados a la sublevación. A un compositor al que le incautan sus dos primeras obras grabadas le han dicho algo útil sobre su propio registro, y él siguió escribiendo canciones de navidad el resto de su vida —alegres, casi todas—, que es una respuesta a su manera.","type":"text"}]},{"type":"paragraph","content":[{"text":"Quién le cantó","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Los merengues fueron a parar a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3f8bafec-e5ee-415d-8405-9551cceeeb9b","displayText":"Johnny Ventura","occurrenceId":"d40099e2-762c-4427-8be2-1bafc874b25e"}},{"text":" y su Combo Show: Sigo, Ah No Yo No Sé No, Llegó Navidad, Salsa Pa’ Tu Lechón y Llegó Nochebuena Otra Vez. Esos son los que el país sigue poniendo cada diciembre, y casi todo el que se los sabe no sabría decir quién los escribió.","type":"text"}]},{"type":"paragraph","content":[{"text":"Las románticas fueron a otra parte. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"60b0cfd0-b572-4d0f-a913-bbeb1aa734c6","displayText":"Fausto Rey","occurrenceId":"d02eb699-bd84-41da-9770-68a4a6d0bb2e"}},{"text":" pegó Moriré Sin Ti, No Me Busques, Dime y Qué Triste. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"081c1484-bf1c-4b11-ba01-d68446b7b111","displayText":"Anthony Ríos","occurrenceId":"88d6e1b0-ba12-47c3-b8b9-58a020a4c8db"}},{"text":" grabó Viejo Amigo y Nada. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9e585186-f3b8-4720-979b-505f6198558e","displayText":"Charytin","occurrenceId":"be880a55-cd00-4597-ab95-09fb942e825f"}},{"text":" hizo suya Dime antes que Rey. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bd631179-2de1-4db3-809d-a896b591ca1d","displayText":"Luisito Martí","occurrenceId":"e4b4879b-1db7-47a5-8194-7c66af0bbdab"}},{"text":" se llevó El Vestido, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bc310977-31a9-41bb-9af2-7d3a0d7fabdd","displayText":"Fernando Villalona","occurrenceId":"3270a7e3-1922-4072-bea3-2064296c2163"}},{"text":" se llevó Mayra, y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"1131dfe6-f404-44b4-8d0d-f8120dc6f71a","displayText":"Fernando Casado","occurrenceId":"cc29a345-814d-4a53-9031-c66fd387fc30"}},{"text":" se llevó Piénsalo y La Noche Está Triste.","type":"text"}]},{"type":"paragraph","content":[{"text":"En 1970 quedó segundo como compositor en el festival de la canción de Miami, con un tema arreglado por ","type":"text"},{"type":"artistReference","attrs":{"artistId":"ba42e200-51b0-437b-99ac-1daf39ade337","displayText":"Rafael Solano","occurrenceId":"7f976322-51b0-4fbf-90fc-95c21d8f731d"}},{"text":" e interpretado por ","type":"text"},{"type":"artistReference","attrs":{"artistId":"1131dfe6-f404-44b4-8d0d-f8120dc6f71a","displayText":"Fernando Casado","occurrenceId":"0808e32b-f2e3-4202-a5b9-0a0979c1525a"}},{"text":". Esa combinación —su letra, el arreglo de Solano, la voz de Casado— es una muestra tan concentrada de la canción popular dominicana de aquellos años como pueda encontrarse.","type":"text"}]},{"type":"paragraph","content":[{"text":"De todo un poco","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El programa que lo volvió presencia de casa no era musical. De todo un poco empezó en la radio en 1971, pasó a la televisión en 1987, y lo mantuvo en un canal o en otro hasta el final de su vida, presentándolo junto a Milagros García Franco.","type":"text"}]},{"type":"paragraph","content":[{"text":"Esa es la forma de la carrera: un comunicador al que veía el país entero, que resultaba haber escrito buena parte de lo que el país estaba oyendo. La asociación de cronistas le dedicó una gala un par de años antes de que muriera. Tenía ochenta años cuando murió, en 2015.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'mundito-espinal'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'mundito-espinal') AND locale = 'en'), '118e4f3b-566c-48b9-a70d-88e95d1265ac', 'artist', 'bd631179-2de1-4db3-809d-a896b591ca1d');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'mundito-espinal') AND locale = 'en'), '1ebddb54-dcfa-4c87-9739-3cf2e1a73c42', 'artist', '60b0cfd0-b572-4d0f-a913-bbeb1aa734c6');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'mundito-espinal') AND locale = 'en'), '50b65fd7-9954-4e94-9f24-54cd2c01ace9', 'artist', '081c1484-bf1c-4b11-ba01-d68446b7b111');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'mundito-espinal') AND locale = 'en'), '65759e20-0e3f-4588-b0ef-c4bf29d7f587', 'artist', '1131dfe6-f404-44b4-8d0d-f8120dc6f71a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'mundito-espinal') AND locale = 'en'), '671a7f85-c416-480e-ae78-d927d7cc52c1', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'mundito-espinal') AND locale = 'en'), '7b587e58-ae55-4839-84fd-091a66f656ff', 'artist', 'bc310977-31a9-41bb-9af2-7d3a0d7fabdd');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'mundito-espinal') AND locale = 'en'), '8b8897a8-84e4-4559-96c1-1fe2e9429698', 'artist', 'ba42e200-51b0-437b-99ac-1daf39ade337');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'mundito-espinal') AND locale = 'en'), 'ace82cb2-1966-4f63-b05f-6e6baa127827', 'artist', '1131dfe6-f404-44b4-8d0d-f8120dc6f71a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'mundito-espinal') AND locale = 'en'), 'e760795e-832b-47be-851e-2feef9049b9b', 'artist', 'a4b2104e-5b76-4e04-b9ac-dfe3f25ea71d');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'mundito-espinal') AND locale = 'en'), 'f07dd816-5686-4be6-9e28-24b40d9bed0c', 'artist', '9e585186-f3b8-4720-979b-505f6198558e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'mundito-espinal') AND locale = 'es'), '0808e32b-f2e3-4202-a5b9-0a0979c1525a', 'artist', '1131dfe6-f404-44b4-8d0d-f8120dc6f71a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'mundito-espinal') AND locale = 'es'), '3270a7e3-1922-4072-bea3-2064296c2163', 'artist', 'bc310977-31a9-41bb-9af2-7d3a0d7fabdd');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'mundito-espinal') AND locale = 'es'), '7f976322-51b0-4fbf-90fc-95c21d8f731d', 'artist', 'ba42e200-51b0-437b-99ac-1daf39ade337');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'mundito-espinal') AND locale = 'es'), '88d6e1b0-ba12-47c3-b8b9-58a020a4c8db', 'artist', '081c1484-bf1c-4b11-ba01-d68446b7b111');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'mundito-espinal') AND locale = 'es'), '8bcd4a07-a66b-4883-96d1-e69b0227585d', 'artist', 'a4b2104e-5b76-4e04-b9ac-dfe3f25ea71d');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'mundito-espinal') AND locale = 'es'), 'be880a55-cd00-4597-ab95-09fb942e825f', 'artist', '9e585186-f3b8-4720-979b-505f6198558e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'mundito-espinal') AND locale = 'es'), 'cc29a345-814d-4a53-9031-c66fd387fc30', 'artist', '1131dfe6-f404-44b4-8d0d-f8120dc6f71a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'mundito-espinal') AND locale = 'es'), 'd02eb699-bd84-41da-9770-68a4a6d0bb2e', 'artist', '60b0cfd0-b572-4d0f-a913-bbeb1aa734c6');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'mundito-espinal') AND locale = 'es'), 'd40099e2-762c-4427-8be2-1bafc874b25e', 'artist', '3f8bafec-e5ee-415d-8405-9551cceeeb9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'mundito-espinal') AND locale = 'es'), 'e4b4879b-1db7-47a5-8194-7c66af0bbdab', 'artist', 'bd631179-2de1-4db3-809d-a896b591ca1d');

COMMIT;
