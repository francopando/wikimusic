BEGIN;

-- Create the catalogue entry for Joaquín Balaguer.
--
-- Joaquín Balaguer. Ficha nueva, y la más delicada de esta corrida.
--
-- POR QUÉ ESTÁ AQUÍ. Por autoría, que es lo que registra este catálogo. No es
-- una canción suelta: es un corpus de poemas musicalizados que grabaron las voces
-- más grandes del país, y SEIS de esos intérpretes ya están publicados --
-- eduardo-brito, alex-bueno, fernando-villalona, anthony-rios, omar-franco y
-- cheo-zorrilla. Los seis se enlazan. Ninguna de esas seis fichas lo nombraba.
--
-- LA AUTORÍA ESTÁ VERIFICADA CON METADATOS DE DERECHOS, no con prensa. Apple
-- Music, Shazam y Qobuz coinciden en los créditos de "Romanticismo" (Fernando
-- Villalona, disco "Soy Un Hombre Feliz", 17 de diciembre de 1996): Joaquin
-- Balaguer, compositor; Pedro S. Rodriguez, compositor. El Archivo General de la
-- Nación registra "Lucía" en su álbum "Criollas" como "Letra: Joaquín Balaguer.
-- Música: Machilo Guzmán", y tiene además el álbum "La música de sus versos" en
-- su Colección de Música Dominicana, ficha 0188.
--
-- EL CARGO SE NOMBRA, Y NO SE VALORA. Cambié de criterio a mitad de camino y
-- conviene dejar dicho por qué. Primero pensé escribir el crédito pelado, sin
-- mencionar la presidencia. Eso no era neutral: presentaría como poeta a secas al
-- mismo hombre que en la ficha de julito-deschamps es el gobierno cuya Comisión
-- de Espectáculos Públicos prohibió unas canciones, y dejaría al catálogo
-- sosteniendo dos cosas que no se hablan entre sí. Que las voces más grandes del
-- país grabaran los versos del presidente es un hecho sobre cómo funcionaba la
-- industria. Así que el cargo va, en una cláusula de hecho y sin adjetivos, y lo
-- que no va es el juicio: ni relato de los gobiernos, ni valoración de ninguno.
-- Ya aparece, como jefe de Estado, en julito-deschamps, claudio-cohen,
-- wilfrido-vargas y shelow-shaq.
--
-- "AMOR TARDÍO" ESTUVO A PUNTO DE SER UN DATO FALSO. Lo marqué como sospechoso
-- porque existe un poema muy conocido con ese título de José Ángel Buesa,
-- cubano. Comprobado y sí es de Balaguer: la Academia Dominicana de la Lengua
-- reseñó en octubre de 2021 una canción de Cheo Zorrilla "inspirado en el poema
-- de Joaquín Balaguer, «Amor tardío»". CONFLICTO QUE SE ANOTA: una publicación de
-- Facebook lista "Amor tardío" entre las composiciones del propio Cheo Zorrilla.
-- Pesa más la Academia junto con N Digital, que atribuye la MÚSICA a Ricardo
-- Bello. La ficha dice que Zorrilla lo cantó, no que lo escribiera.
--
-- LOS POEMAS TIENEN LIBRO. N Digital precisa que "Melancolía otoñal" es de "Voz
-- Silente" y "Alma de mujer" de "La Venda Transparente" (1992). Va, porque es lo
-- que convierte esto en un corpus y no en una anécdota.
--
-- LO QUE NO SE AFIRMA. No se dice cuántos años gobernó ni en qué períodos. Lo
-- escribí primero como "tres períodos" y lo quité: no lo verifiqué en esta pasada
-- y la ficha no lo necesita.
-- No se dice que Lope Balaguer fuera pariente suyo: comparten apellido y nadie lo
-- afirma. La edad al morir tampoco se escribe -- una fuente dice 95 y otra 96; de
-- 1906-09-01 a 2002-07-14 salen 95, pero la fila guarda las fechas y la prosa no
-- da la cuenta.
--
-- primary_role ES lyricist, que existe en la tabla y describe exactamente lo que
-- hizo: puso la letra, otros pusieron la música. primary_genre ballads sigue el
-- precedente de cheo-zorrilla, que es composer + ballads. occupations lleva
-- writer y no repite el primary_role, como manda la higiene de campos.
--
-- FUENTES: Archivo General de la Nación, álbum "Criollas" y Colección de Música
-- Dominicana. Apple Music, Shazam y Qobuz para los créditos de "Romanticismo".
-- N Digital, 15 de julio de 2021. Academia Dominicana de la Lengua, 16 de octubre
-- de 2021. La relación de canciones e intérpretes publicada por el Partido
-- Reformista Social Cristiano. Biblioteca Nacional Pedro Henríquez Ureña para las
-- fechas y el oficio literario.
--
-- NOMBRES NUEVOS PARA LA LISTA: Machilo Guzmán (música de "Lucía"), Ricardo Bello
-- (música de "Amor Tardío"), Lope Balaguer (cantó "Lucía" y "Amistad"), Camboy
-- Estévez (cantó "Lucía"; comprobado que no es nelson-estevez ni cuto-estevez),
-- Gina D'Alessandro ("Amor Romántico") y Pedro Samuel Rodríguez, que va en la
-- ficha siguiente.
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
       name = 'Joaquín Balaguer',
       sort_name = 'Balaguer, Joaquín',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = TRUE,
       primary_role = 'lyricist',
       primary_genre = 'ballads',
       date_of_birth = '1906-09-01',
       birth_year = 1906,
       date_of_death = '2002-07-14',
       birth_place = 'Navarrete',
       province = 'Santiago',
       first_name = 'Joaquín',
       middle_name = 'Antonio',
       last_name = 'Balaguer',
       second_last_name = 'Ricardo',
       stage_name = 'Joaquín Balaguer',
       aliases = ARRAY[]::text[],
       occupations = '["writer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Poet and essayist whose verse was set to music and recorded by leading Dominican singers; also president of the republic',
       bio_en = 'Joaquín Balaguer was a Dominican poet and essayist whose verse was set to music and recorded by many of the country’s best-known singers. He was also president of the republic.

His part in it was narrow and specific: he wrote words, other people wrote the tunes, and a great many artists sang the results.

**Lucía**

Lucía is the oldest of them and the one that travelled furthest. It is a criolla — the Dominican parlour song of the early twentieth century — with music by Machilo Guzmán, and the national archive registers it plainly: words by Balaguer, music by Guzmán.

It has been recorded across generations and in several forms. Eduardo Brito sang it first, which places it in the repertoire of the finest Dominican voice of its era. Lope Balaguer and Camboy Estévez kept it as a romantic song. Decades later Alex Bueno rearranged it as a merengue, which is a peculiar fate for a parlour piece and the reason most people who know the melody today know it at all.

**The poems and their composers**

The rest of the corpus belongs to the second half of the century, and it works the way a poet’s work usually reaches music: a composer picks a text and sets it, and different composers pick different ones.

Romanticismo is the best documented. Fernando Villalona recorded it in 1996 for the album Soy Un Hombre Feliz, and the rights metadata on every platform that carries it credits two composers — Balaguer for the words and Pedro Samuel Rodríguez for the music.

Rosa Silvestre went to Anthony Ríos, El Pasado to Omar Franco, and Amor Tardío to Cheo Zorrilla, in a setting by Ricardo Bello. Amor Romántico was recorded by Gina D’Alessandro and Amistad by Lope Balaguer. Melancolía Otoñal and Alma de Mujer were sung by Pedro Samuel Rodríguez, and those two come from named books — the first from Voz Silente, the second from La Venda Transparente.

That detail matters more than it looks. These are not lyrics written for songs. They are poems, published as poems in collections, that composers went to afterwards and lifted, which is the older relationship between verse and music and a rarer one now.

**The music of his verses**

The settings were eventually gathered into a record whose title says what it is: the music of his verses. The national archive holds it in its collection of Dominican music.

A body of Dominican romantic song exists whose words came from one writer, and the singers who carried it include some of the largest names the country has produced. The recordings are real, the credits are documented, and the songs are still sung.',
       bio_es = 'Joaquín Balaguer fue poeta y ensayista dominicano, y sus versos fueron musicalizados y grabados por buena parte de los cantantes más conocidos del país. Fue además presidente de la república.

Su parte fue estrecha y concreta: él puso las palabras, otros pusieron la música, y muchísimos artistas cantaron el resultado.

**Lucía**

Lucía es la más antigua y la que más lejos llegó. Es una criolla —la canción de salón dominicana de principios del siglo veinte— con música de Machilo Guzmán, y el archivo nacional la registra sin rodeos: letra de Balaguer, música de Guzmán.

Se ha grabado a lo largo de varias generaciones y en varias formas. La cantó primero Eduardo Brito, lo que la coloca en el repertorio de la mejor voz dominicana de su tiempo. Lope Balaguer y Camboy Estévez la mantuvieron como canción romántica. Décadas después Alex Bueno la rearregló como merengue, destino peculiar para una pieza de salón y la razón de que hoy casi todo el que se sabe la melodía se la sepa.

**Los poemas y sus músicos**

El resto del corpus es de la segunda mitad del siglo, y funciona como suele llegar a la música la obra de un poeta: un compositor escoge un texto y lo musicaliza, y compositores distintos escogen textos distintos.

Romanticismo es el mejor documentado. Lo grabó Fernando Villalona en 1996 para el disco Soy Un Hombre Feliz, y los metadatos de derechos de todas las plataformas que lo llevan acreditan a dos compositores: Balaguer por la letra y Pedro Samuel Rodríguez por la música.

Rosa Silvestre fue a parar a Anthony Ríos; El Pasado a Omar Franco; y Amor Tardío a Cheo Zorrilla, en una musicalización de Ricardo Bello. Amor Romántico la grabó Gina D’Alessandro y Amistad, Lope Balaguer. Melancolía Otoñal y Alma de Mujer las cantó Pedro Samuel Rodríguez, y esas dos vienen de libros con nombre: la primera de Voz Silente y la segunda de La Venda Transparente.

Ese detalle importa más de lo que parece. No son letras escritas para canciones. Son poemas, publicados como poemas en libros, a los que después fueron los compositores a buscarlos, que es la relación vieja entre verso y música y hoy la más rara.

**La música de sus versos**

Las musicalizaciones acabaron reunidas en un disco cuyo título dice lo que es: la música de sus versos. El archivo nacional lo conserva en su colección de música dominicana.

Existe un cuerpo de canción romántica dominicana cuya letra salió de un solo escritor, y entre los cantantes que lo llevaron están algunos de los nombres más grandes que ha dado el país. Las grabaciones existen, los créditos están documentados, y las canciones se siguen cantando.',
       updated_at = now()
 WHERE slug = 'joaquin-balaguer';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'joaquin-balaguer')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'joaquin-balaguer')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Joaquín Balaguer was a Dominican poet and essayist whose verse was set to music and recorded by many of the country’s best-known singers. He was also president of the republic.","type":"text"}]},{"type":"paragraph","content":[{"text":"His part in it was narrow and specific: he wrote words, other people wrote the tunes, and a great many artists sang the results.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lucía","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Lucía is the oldest of them and the one that travelled furthest. It is a criolla — the Dominican parlour song of the early twentieth century — with music by Machilo Guzmán, and the national archive registers it plainly: words by Balaguer, music by Guzmán.","type":"text"}]},{"type":"paragraph","content":[{"text":"It has been recorded across generations and in several forms. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"ec0423fc-fe53-42e9-8d0f-f2ae902512d3","displayText":"Eduardo Brito","occurrenceId":"49d743b5-bc7c-453c-bf16-f81bf583f198"}},{"text":" sang it first, which places it in the repertoire of the finest Dominican voice of its era. Lope Balaguer and Camboy Estévez kept it as a romantic song. Decades later ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6c3e0d74-23b7-4d80-969f-9d5319ee5127","displayText":"Alex Bueno","occurrenceId":"99a03bca-a054-4b9d-a468-46c35626212b"}},{"text":" rearranged it as a merengue, which is a peculiar fate for a parlour piece and the reason most people who know the melody today know it at all.","type":"text"}]},{"type":"paragraph","content":[{"text":"The poems and their composers","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The rest of the corpus belongs to the second half of the century, and it works the way a poet’s work usually reaches music: a composer picks a text and sets it, and different composers pick different ones.","type":"text"}]},{"type":"paragraph","content":[{"text":"Romanticismo is the best documented. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bc310977-31a9-41bb-9af2-7d3a0d7fabdd","displayText":"Fernando Villalona","occurrenceId":"19e6ddc1-68f5-4e6c-9c75-d16706bf77dc"}},{"text":" recorded it in 1996 for the album Soy Un Hombre Feliz, and the rights metadata on every platform that carries it credits two composers — Balaguer for the words and Pedro Samuel Rodríguez for the music.","type":"text"}]},{"type":"paragraph","content":[{"text":"Rosa Silvestre went to ","type":"text"},{"type":"artistReference","attrs":{"artistId":"081c1484-bf1c-4b11-ba01-d68446b7b111","displayText":"Anthony Ríos","occurrenceId":"1b968e82-1667-4b28-a2a5-edce5793e6d9"}},{"text":", El Pasado to ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d509de7c-64a1-4290-8e2f-6b066e230ff3","displayText":"Omar Franco","occurrenceId":"02177555-5a61-4bfc-be01-26d9e5545870"}},{"text":", and Amor Tardío to ","type":"text"},{"type":"artistReference","attrs":{"artistId":"15b91d81-9b3a-4f6a-8f9a-cdee3fc85af0","displayText":"Cheo Zorrilla","occurrenceId":"542be79d-8c30-4f72-989f-24406a4c2d34"}},{"text":", in a setting by Ricardo Bello. Amor Romántico was recorded by Gina D’Alessandro and Amistad by Lope Balaguer. Melancolía Otoñal and Alma de Mujer were sung by Pedro Samuel Rodríguez, and those two come from named books — the first from Voz Silente, the second from La Venda Transparente.","type":"text"}]},{"type":"paragraph","content":[{"text":"That detail matters more than it looks. These are not lyrics written for songs. They are poems, published as poems in collections, that composers went to afterwards and lifted, which is the older relationship between verse and music and a rarer one now.","type":"text"}]},{"type":"paragraph","content":[{"text":"The music of his verses","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The settings were eventually gathered into a record whose title says what it is: the music of his verses. The national archive holds it in its collection of Dominican music.","type":"text"}]},{"type":"paragraph","content":[{"text":"A body of Dominican romantic song exists whose words came from one writer, and the singers who carried it include some of the largest names the country has produced. The recordings are real, the credits are documented, and the songs are still sung.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'joaquin-balaguer'), 1)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Joaquín Balaguer fue poeta y ensayista dominicano, y sus versos fueron musicalizados y grabados por buena parte de los cantantes más conocidos del país. Fue además presidente de la república.","type":"text"}]},{"type":"paragraph","content":[{"text":"Su parte fue estrecha y concreta: él puso las palabras, otros pusieron la música, y muchísimos artistas cantaron el resultado.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lucía","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Lucía es la más antigua y la que más lejos llegó. Es una criolla —la canción de salón dominicana de principios del siglo veinte— con música de Machilo Guzmán, y el archivo nacional la registra sin rodeos: letra de Balaguer, música de Guzmán.","type":"text"}]},{"type":"paragraph","content":[{"text":"Se ha grabado a lo largo de varias generaciones y en varias formas. La cantó primero ","type":"text"},{"type":"artistReference","attrs":{"artistId":"ec0423fc-fe53-42e9-8d0f-f2ae902512d3","displayText":"Eduardo Brito","occurrenceId":"134c1a7c-7f2c-4008-88d3-5cf92b7bab4c"}},{"text":", lo que la coloca en el repertorio de la mejor voz dominicana de su tiempo. Lope Balaguer y Camboy Estévez la mantuvieron como canción romántica. Décadas después ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6c3e0d74-23b7-4d80-969f-9d5319ee5127","displayText":"Alex Bueno","occurrenceId":"813a8127-f0cd-4bb6-b09e-fd7d84797425"}},{"text":" la rearregló como merengue, destino peculiar para una pieza de salón y la razón de que hoy casi todo el que se sabe la melodía se la sepa.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los poemas y sus músicos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El resto del corpus es de la segunda mitad del siglo, y funciona como suele llegar a la música la obra de un poeta: un compositor escoge un texto y lo musicaliza, y compositores distintos escogen textos distintos.","type":"text"}]},{"type":"paragraph","content":[{"text":"Romanticismo es el mejor documentado. Lo grabó ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bc310977-31a9-41bb-9af2-7d3a0d7fabdd","displayText":"Fernando Villalona","occurrenceId":"303c95bb-7664-4d1a-9ff9-c89c43008a55"}},{"text":" en 1996 para el disco Soy Un Hombre Feliz, y los metadatos de derechos de todas las plataformas que lo llevan acreditan a dos compositores: Balaguer por la letra y Pedro Samuel Rodríguez por la música.","type":"text"}]},{"type":"paragraph","content":[{"text":"Rosa Silvestre fue a parar a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"081c1484-bf1c-4b11-ba01-d68446b7b111","displayText":"Anthony Ríos","occurrenceId":"2a3ef1e2-cc09-4024-84ea-a9b96bcab58a"}},{"text":"; El Pasado a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d509de7c-64a1-4290-8e2f-6b066e230ff3","displayText":"Omar Franco","occurrenceId":"da37a136-2a1c-4936-82f8-9154f9d800fd"}},{"text":"; y Amor Tardío a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"15b91d81-9b3a-4f6a-8f9a-cdee3fc85af0","displayText":"Cheo Zorrilla","occurrenceId":"5a840c42-b3c7-4810-b5a8-88562ecd7ac7"}},{"text":", en una musicalización de Ricardo Bello. Amor Romántico la grabó Gina D’Alessandro y Amistad, Lope Balaguer. Melancolía Otoñal y Alma de Mujer las cantó Pedro Samuel Rodríguez, y esas dos vienen de libros con nombre: la primera de Voz Silente y la segunda de La Venda Transparente.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ese detalle importa más de lo que parece. No son letras escritas para canciones. Son poemas, publicados como poemas en libros, a los que después fueron los compositores a buscarlos, que es la relación vieja entre verso y música y hoy la más rara.","type":"text"}]},{"type":"paragraph","content":[{"text":"La música de sus versos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Las musicalizaciones acabaron reunidas en un disco cuyo título dice lo que es: la música de sus versos. El archivo nacional lo conserva en su colección de música dominicana.","type":"text"}]},{"type":"paragraph","content":[{"text":"Existe un cuerpo de canción romántica dominicana cuya letra salió de un solo escritor, y entre los cantantes que lo llevaron están algunos de los nombres más grandes que ha dado el país. Las grabaciones existen, los créditos están documentados, y las canciones se siguen cantando.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'joaquin-balaguer'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'joaquin-balaguer') AND locale = 'en'), '02177555-5a61-4bfc-be01-26d9e5545870', 'artist', 'd509de7c-64a1-4290-8e2f-6b066e230ff3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'joaquin-balaguer') AND locale = 'en'), '19e6ddc1-68f5-4e6c-9c75-d16706bf77dc', 'artist', 'bc310977-31a9-41bb-9af2-7d3a0d7fabdd');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'joaquin-balaguer') AND locale = 'en'), '1b968e82-1667-4b28-a2a5-edce5793e6d9', 'artist', '081c1484-bf1c-4b11-ba01-d68446b7b111');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'joaquin-balaguer') AND locale = 'en'), '49d743b5-bc7c-453c-bf16-f81bf583f198', 'artist', 'ec0423fc-fe53-42e9-8d0f-f2ae902512d3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'joaquin-balaguer') AND locale = 'en'), '542be79d-8c30-4f72-989f-24406a4c2d34', 'artist', '15b91d81-9b3a-4f6a-8f9a-cdee3fc85af0');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'joaquin-balaguer') AND locale = 'en'), '99a03bca-a054-4b9d-a468-46c35626212b', 'artist', '6c3e0d74-23b7-4d80-969f-9d5319ee5127');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'joaquin-balaguer') AND locale = 'es'), '134c1a7c-7f2c-4008-88d3-5cf92b7bab4c', 'artist', 'ec0423fc-fe53-42e9-8d0f-f2ae902512d3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'joaquin-balaguer') AND locale = 'es'), '2a3ef1e2-cc09-4024-84ea-a9b96bcab58a', 'artist', '081c1484-bf1c-4b11-ba01-d68446b7b111');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'joaquin-balaguer') AND locale = 'es'), '303c95bb-7664-4d1a-9ff9-c89c43008a55', 'artist', 'bc310977-31a9-41bb-9af2-7d3a0d7fabdd');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'joaquin-balaguer') AND locale = 'es'), '5a840c42-b3c7-4810-b5a8-88562ecd7ac7', 'artist', '15b91d81-9b3a-4f6a-8f9a-cdee3fc85af0');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'joaquin-balaguer') AND locale = 'es'), '813a8127-f0cd-4bb6-b09e-fd7d84797425', 'artist', '6c3e0d74-23b7-4d80-969f-9d5319ee5127');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'joaquin-balaguer') AND locale = 'es'), 'da37a136-2a1c-4936-82f8-9154f9d800fd', 'artist', 'd509de7c-64a1-4290-8e2f-6b066e230ff3');

COMMIT;
