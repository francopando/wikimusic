BEGIN;

-- Fefita la Grande — biography rewrite, missing Spanish document, artist-record
-- corrections, and a name-capitalisation fix across the catalogue.
--
-- The English biography was 1,378 characters over three untitled paragraphs and
-- opened on a false statement: it named her "Doña Josefa Mateo". Her name is
-- Manuela Josefa Taveras Cabrera. She carries the maternal surname first
-- because her father, Eliseo "Seíto" de Jesús Cabrera Fernández, did not
-- recognise her at birth; her mother was María Ana Taveras. The record's
-- sort_name compounded the error, reading "García Ramírez, Manuela Josefa",
-- which no source supports at all.
--
-- There was no Spanish document whatsoever — a Rule 5 violation in
-- EDITORIAL_BIOGRAPHY_FORMAT.md. One is created here, written independently
-- rather than translated.
--
-- occupations listed "vocalist" while primary_role is "singer".
-- ROLE_DICTIONARY.md forbids that pairing by name. "vocalist" is dropped and
-- "accordionist" added: she is first and last an accordionist, and the
-- dictionary lists the value. primary_role stays "singer" — she sings lead on
-- her own records — rather than being changed unilaterally.
--
-- Facts added, each corroborated by two or more sources:
--   * Gran Soberano, 1 June 2016 — the highest award in Dominican arts.
--   * Central to merengue's UNESCO inscription as Intangible Cultural Heritage
--     of Humanity, 30 November 2016; Senate recognition as a genre pioneer.
--   * The three names: la Vieja Fefa from Tatico Henríquez at seventeen,
--     Fefita la Grande from Bartolo Alvarado "El Ciego de Nagua" at about
--     twenty-two, la Mayimba by her own preference since 1980.
--   * c.1956, aged about twelve, she played for José Arismendy "Petán"
--     Trujillo of La Voz Dominicana, who gave her a hundred pesos.
--   * First Dominican artist to take merengue típico to Europe, touring with
--     Rafael Solano; debut album Si Quiere Venir Que Venga.
--   * Discography with years, and the 2019 La Pimienta Es la Que Pica remake
--     with Milly Quezada and Maridalia Hernández.
--
-- Artist references: 0 -> 7 per locale (Guandulito, Tatico Henríquez, Rafael
-- Solano, Milly Quezada, Maridalia Hernández, Krisspy, El Prodigio). Bartolo
-- Alvarado is not in the catalogue and stays plain text.
--
-- Capitalisation: six documents wrote "Fefita La Grande" against a canonical
-- "Fefita la Grande". The catalogue name matches the slug and the English
-- Wikipedia article title, so the prose moved rather than the record —
-- EDITORIAL_BIOGRAPHY_FORMAT.md only asks that the record be corrected first
-- where the record is the thing that is wrong, and here it was not.
--
-- Deliberately NOT recorded: she is a breast-cancer survivor. It is widely
-- reported and she has not hidden it, but it is a health fact about a living
-- person that does not bear on the music, and the same test excluded Wilfrido
-- Vargas's 2024 hospitalisation in 20260905120000.

UPDATE editorial_documents
SET document = $json${"type":"doc","content":[{"type":"paragraph","content":[{"text":"Fefita la Grande, born Manuela Josefa Taveras Cabrera on 18 September 1943 in the village of El Orégano, near San José in San Ignacio de Sabaneta, Santiago Rodríguez, is a Dominican accordionist, singer and bandleader, and the foremost woman in the history of merengue típico. She took up the accordion as a small child at a time when the instrument was effectively closed to women, and has spent seven decades at the head of a music that belongs to the Cibao countryside. In 2016 she was given the Gran Soberano, the highest distinction Dominican arts confers.","type":"text"}]},{"type":"paragraph","content":[{"text":"Early years and the accordion","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"She was born to Eliseo \"Seíto\" de Jesús Cabrera Fernández and María Ana Taveras, and carries her mother's surname first because her father did not recognise her at birth. She has one full sister, María Celeste, and six half-siblings on her father's side. The accordion reached her in her father's workshop while she was still very small, and she took the merengue típico pioneer ","type":"text"},{"type":"artistReference","attrs":{"artistId":"e07267a0-7f9d-4ef5-928c-d4ade7dc921e","displayText":"Guandulito","occurrenceId":"2d8ccfe9-7a21-4769-b815-ea9fd7969447"}},{"text":" as her model. By seven she was known around her community for her playing; by nine she was working parties with accordion, güira and tambora.","type":"text"}]},{"type":"paragraph","content":[{"text":"In about 1956, aged roughly twelve, she played for José Arismendy \"Petán\" Trujillo, who ran the state broadcaster La Voz Dominicana and was a brother of the dictator. He gave her a hundred pesos — the first money her playing earned her from outside her own district.","type":"text"}]},{"type":"paragraph","content":[{"text":"Three names","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"She has been named three times over. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9b15dfca-0f60-49b3-a139-100a5a329741","displayText":"Tatico Henríquez","occurrenceId":"b6c19385-7c41-47d4-9747-af97b7569e14"}},{"text":" called her la Vieja Fefa when she was seventeen. Bartolo Alvarado, El Ciego de Nagua, christened her Fefita la Grande at around twenty-two, and that is the name the public kept. Since 1980 she has preferred la Mayimba, and it is the one she uses for herself.","type":"text"}]},{"type":"paragraph","content":[{"text":"Taking merengue típico abroad","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Touring alongside ","type":"text"},{"type":"artistReference","attrs":{"artistId":"ba42e200-51b0-437b-99ac-1daf39ade337","displayText":"Rafael Solano","occurrenceId":"5536a765-1dd2-428b-9171-b458a22354b6"}},{"text":" took her out of the country for the first time, and she became the first Dominican artist to carry merengue típico to Europe. Her debut album was Si Quiere Venir Que Venga. What she brought was not a softened version for foreign ears but the accordion music of the Cibao as it is actually played — fast, unpolished and physical.","type":"text"}]},{"type":"paragraph","content":[{"text":"Recordings","type":"text","marks":[{"type":"bold"}]}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Merengues Típicos Vol. 1 — 1979","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"La Pimienta Es la Que Pica — 1980","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Fefita la Grande — 1981","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"La Cintura Mía — 1989","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"La Ciudad Corazón — 2001","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Vamos a Hablar Inglés, La Chiflera and O Te Menea O Te Apea, among the songs most identified with her","type":"text"}]}]}]},{"type":"paragraph","content":[{"text":"Working across generations","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Fefita has kept recording with musicians young enough to be her grandchildren rather than settling into heritage status. In 2019 she cut a new version of La Pimienta Es la Que Pica with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"070e7449-814e-4ea6-a009-7a091b7e4878","displayText":"Milly Quezada","occurrenceId":"47a46a57-592d-4a8d-bdf4-98d06e5c775d"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"080c0205-8b66-4f16-915e-1d867acf82cc","displayText":"Maridalia Hernández","occurrenceId":"741e9c2e-b28a-4f55-8305-3d2ac7c5e55a"}},{"text":", three careers meeting on one record. She has also worked with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"15c08a48-b94b-41c8-99d8-53144397c787","displayText":"Krisspy","occurrenceId":"55f42730-b062-4eb3-bcc3-a3b4cc161259"}},{"text":" and with the accordionist ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f07fcc6b-a888-4e97-ac50-6ce6ea37a714","displayText":"El Prodigio","occurrenceId":"32b4472f-23b1-46dc-9a1a-bd1c15716190"}},{"text":", whose own playing descends from the tradition she carried.","type":"text"}]},{"type":"paragraph","content":[{"text":"Recognition","type":"text","marks":[{"type":"bold"}]}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Gran Soberano — 1 June 2016, the highest award in Dominican arts, after several earlier nominations","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Recognised by the Senate of the Dominican Republic as a pioneer of merengue típico","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"A central figure in the case for merengue's inscription by UNESCO as Intangible Cultural Heritage of Humanity, 30 November 2016","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Her life dramatised in a biographical film presented at the Dominican film festival","type":"text"}]}]}]},{"type":"paragraph","content":[{"text":"Legacy","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Merengue típico was a men's profession when Fefita picked up the accordion, and the instrument in particular was treated as beyond women. She did not argue the point; she outplayed it, and stayed long enough that the argument stopped being made. Every Dominican woman who has taken up the accordion since has done so on ground she cleared. That she is still performing in her eighties, at the tempo the music demands, is not a sentimental footnote to the achievement — it is the achievement.","type":"text"}]}]}$json$::jsonb,
    revision = 2,
    updated_at = now()
WHERE id = 'c835c1bd-68e7-4663-8506-af619a5cfe3c';

DELETE FROM editorial_entity_references WHERE editorial_document_id = 'c835c1bd-68e7-4663-8506-af619a5cfe3c';

INSERT INTO editorial_documents (id, document_type, locale, schema_version, document, status, owner_artist_id, revision, created_at, updated_at)
VALUES ('d73e9a09-a134-4a15-800b-365224ffee51', 'artist_biography', 'es', 1, $json${"type":"doc","content":[{"type":"paragraph","content":[{"text":"Fefita la Grande, nacida Manuela Josefa Taveras Cabrera el 18 de septiembre de 1943 en el paraje de El Orégano, cerca de San José, en San Ignacio de Sabaneta, Santiago Rodríguez, es acordeonista, cantante y directora de conjunto, y la mujer más importante en la historia del merengue típico dominicano. Tomó el acordeón siendo muy niña, cuando el instrumento estaba prácticamente vedado a las mujeres, y lleva siete décadas al frente de una música que pertenece al campo cibaeño. En 2016 recibió el Gran Soberano, la mayor distinción de las artes dominicanas.","type":"text"}]},{"type":"paragraph","content":[{"text":"Primeros años y el acordeón","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Hija de Eliseo \"Seíto\" de Jesús Cabrera Fernández y María Ana Taveras, lleva primero el apellido materno porque su padre no la reconoció al nacer. Tiene una hermana de padre y madre, María Celeste, y seis medios hermanos por parte de padre. El acordeón le llegó en el taller de su padre siendo muy pequeña, y tomó como modelo al pionero del típico ","type":"text"},{"type":"artistReference","attrs":{"artistId":"e07267a0-7f9d-4ef5-928c-d4ade7dc921e","displayText":"Guandulito","occurrenceId":"c22e5529-76c1-4cc0-a829-a796c9ae0168"}},{"text":". A los siete años ya era conocida en su comunidad por su manera de tocar; a los nueve animaba fiestas con acordeón, güira y tambora.","type":"text"}]},{"type":"paragraph","content":[{"text":"Hacia 1956, con unos doce años, tocó para José Arismendy \"Petán\" Trujillo, director de La Voz Dominicana y hermano del dictador, quien le entregó cien pesos: el primer dinero que su música le produjo fuera de su propio entorno.","type":"text"}]},{"type":"paragraph","content":[{"text":"Tres nombres","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Ha sido bautizada tres veces. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9b15dfca-0f60-49b3-a139-100a5a329741","displayText":"Tatico Henríquez","occurrenceId":"bd7e3ec7-74f3-42ba-a5a0-4bc81fe9ff42"}},{"text":" la llamó la Vieja Fefa cuando tenía diecisiete años. Bartolo Alvarado, El Ciego de Nagua, le puso Fefita la Grande alrededor de los veintidós, y ese fue el nombre que el público retuvo. Desde 1980 prefiere la Mayimba, que es como ella misma se nombra.","type":"text"}]},{"type":"paragraph","content":[{"text":"El típico fuera del país","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Las giras junto a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"ba42e200-51b0-437b-99ac-1daf39ade337","displayText":"Rafael Solano","occurrenceId":"a751ea69-4679-4dde-b1fa-2ad2eef0ef3e"}},{"text":" la sacaron por primera vez del país, y se convirtió en la primera artista dominicana en llevar el merengue típico a Europa. Su álbum de debut fue Si Quiere Venir Que Venga. Lo que llevó no fue una versión suavizada para oídos extranjeros, sino el acordeón del Cibao tal como se toca: rápido, sin pulir y físico.","type":"text"}]},{"type":"paragraph","content":[{"text":"Grabaciones","type":"text","marks":[{"type":"bold"}]}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Merengues Típicos Vol. 1 — 1979","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"La Pimienta Es la Que Pica — 1980","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Fefita la Grande — 1981","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"La Cintura Mía — 1989","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"La Ciudad Corazón — 2001","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Vamos a Hablar Inglés, La Chiflera y O Te Menea O Te Apea, entre los temas más identificados con ella","type":"text"}]}]}]},{"type":"paragraph","content":[{"text":"Trabajo entre generaciones","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Fefita ha seguido grabando con músicos que podrían ser sus nietos, en lugar de instalarse en el papel de reliquia. En 2019 grabó una nueva versión de La Pimienta Es la Que Pica junto a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"070e7449-814e-4ea6-a009-7a091b7e4878","displayText":"Milly Quezada","occurrenceId":"984f88c7-9240-4c43-97a9-40e052e087af"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"080c0205-8b66-4f16-915e-1d867acf82cc","displayText":"Maridalia Hernández","occurrenceId":"5d2846e9-8441-4a40-a6eb-661f4269449f"}},{"text":", tres carreras encontrándose en un mismo tema. También ha trabajado con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"15c08a48-b94b-41c8-99d8-53144397c787","displayText":"Krisspy","occurrenceId":"81bb79ce-5cde-4767-bcdb-ee294b2eb3cf"}},{"text":" y con el acordeonista ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f07fcc6b-a888-4e97-ac50-6ce6ea37a714","displayText":"El Prodigio","occurrenceId":"08e31b8b-eb24-4d51-96b8-764a09b2c9e2"}},{"text":", cuya manera de tocar desciende de la tradición que ella sostuvo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Reconocimientos","type":"text","marks":[{"type":"bold"}]}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Gran Soberano — 1 de junio de 2016, el máximo galardón de las artes dominicanas, tras varias nominaciones previas","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Reconocimiento del Senado de la República Dominicana como pionera del merengue típico","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Figura central en el expediente que llevó a la UNESCO a declarar el merengue Patrimonio Cultural Inmaterial de la Humanidad, el 30 de noviembre de 2016","type":"text"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"text":"Su vida llevada al cine en una película biográfica presentada en el festival de cine dominicano","type":"text"}]}]}]},{"type":"paragraph","content":[{"text":"Legado","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El merengue típico era oficio de hombres cuando Fefita tomó el acordeón, y el instrumento en particular se consideraba fuera del alcance de una mujer. Ella no discutió el punto: tocó mejor, y se quedó el tiempo suficiente para que el punto dejara de discutirse. Cada dominicana que ha tomado un acordeón después lo ha hecho sobre terreno que ella despejó. Que siga presentándose pasados los ochenta, al tempo que la música exige, no es una nota sentimental al margen del logro: es el logro.","type":"text"}]}]}$json$::jsonb, 'published', '9333da06-ad03-44eb-9b81-c21d0ccdd0ea', 1, now(), now())
ON CONFLICT (id) DO NOTHING;

DELETE FROM editorial_entity_references WHERE editorial_document_id = 'd73e9a09-a134-4a15-800b-365224ffee51';

INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('c835c1bd-68e7-4663-8506-af619a5cfe3c', '2d8ccfe9-7a21-4769-b815-ea9fd7969447', 'artist', 'e07267a0-7f9d-4ef5-928c-d4ade7dc921e');  -- Guandulito
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('c835c1bd-68e7-4663-8506-af619a5cfe3c', 'b6c19385-7c41-47d4-9747-af97b7569e14', 'artist', '9b15dfca-0f60-49b3-a139-100a5a329741');  -- Tatico Henríquez
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('c835c1bd-68e7-4663-8506-af619a5cfe3c', '5536a765-1dd2-428b-9171-b458a22354b6', 'artist', 'ba42e200-51b0-437b-99ac-1daf39ade337');  -- Rafael Solano
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('c835c1bd-68e7-4663-8506-af619a5cfe3c', '47a46a57-592d-4a8d-bdf4-98d06e5c775d', 'artist', '070e7449-814e-4ea6-a009-7a091b7e4878');  -- Milly Quezada
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('c835c1bd-68e7-4663-8506-af619a5cfe3c', '741e9c2e-b28a-4f55-8305-3d2ac7c5e55a', 'artist', '080c0205-8b66-4f16-915e-1d867acf82cc');  -- Maridalia Hernández
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('c835c1bd-68e7-4663-8506-af619a5cfe3c', '55f42730-b062-4eb3-bcc3-a3b4cc161259', 'artist', '15c08a48-b94b-41c8-99d8-53144397c787');  -- Krisspy
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('c835c1bd-68e7-4663-8506-af619a5cfe3c', '32b4472f-23b1-46dc-9a1a-bd1c15716190', 'artist', 'f07fcc6b-a888-4e97-ac50-6ce6ea37a714');  -- El Prodigio
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('d73e9a09-a134-4a15-800b-365224ffee51', 'c22e5529-76c1-4cc0-a829-a796c9ae0168', 'artist', 'e07267a0-7f9d-4ef5-928c-d4ade7dc921e');  -- Guandulito
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('d73e9a09-a134-4a15-800b-365224ffee51', 'bd7e3ec7-74f3-42ba-a5a0-4bc81fe9ff42', 'artist', '9b15dfca-0f60-49b3-a139-100a5a329741');  -- Tatico Henríquez
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('d73e9a09-a134-4a15-800b-365224ffee51', 'a751ea69-4679-4dde-b1fa-2ad2eef0ef3e', 'artist', 'ba42e200-51b0-437b-99ac-1daf39ade337');  -- Rafael Solano
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('d73e9a09-a134-4a15-800b-365224ffee51', '984f88c7-9240-4c43-97a9-40e052e087af', 'artist', '070e7449-814e-4ea6-a009-7a091b7e4878');  -- Milly Quezada
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('d73e9a09-a134-4a15-800b-365224ffee51', '5d2846e9-8441-4a40-a6eb-661f4269449f', 'artist', '080c0205-8b66-4f16-915e-1d867acf82cc');  -- Maridalia Hernández
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('d73e9a09-a134-4a15-800b-365224ffee51', '81bb79ce-5cde-4767-bcdb-ee294b2eb3cf', 'artist', '15c08a48-b94b-41c8-99d8-53144397c787');  -- Krisspy
INSERT INTO editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('d73e9a09-a134-4a15-800b-365224ffee51', '08e31b8b-eb24-4d51-96b8-764a09b2c9e2', 'artist', 'f07fcc6b-a888-4e97-ac50-6ce6ea37a714');  -- El Prodigio

UPDATE artists
SET bio_en = $sql$Fefita la Grande, born Manuela Josefa Taveras Cabrera on 18 September 1943 in the village of El Orégano, near San José in San Ignacio de Sabaneta, Santiago Rodríguez, is a Dominican accordionist, singer and bandleader, and the foremost woman in the history of merengue típico. She took up the accordion as a small child at a time when the instrument was effectively closed to women, and has spent seven decades at the head of a music that belongs to the Cibao countryside. In 2016 she was given the Gran Soberano, the highest distinction Dominican arts confers.

**Early years and the accordion**

She was born to Eliseo "Seíto" de Jesús Cabrera Fernández and María Ana Taveras, and carries her mother's surname first because her father did not recognise her at birth. She has one full sister, María Celeste, and six half-siblings on her father's side. The accordion reached her in her father's workshop while she was still very small, and she took the merengue típico pioneer Guandulito as her model. By seven she was known around her community for her playing; by nine she was working parties with accordion, güira and tambora.

In about 1956, aged roughly twelve, she played for José Arismendy "Petán" Trujillo, who ran the state broadcaster La Voz Dominicana and was a brother of the dictator. He gave her a hundred pesos — the first money her playing earned her from outside her own district.

**Three names**

She has been named three times over. Tatico Henríquez called her la Vieja Fefa when she was seventeen. Bartolo Alvarado, El Ciego de Nagua, christened her Fefita la Grande at around twenty-two, and that is the name the public kept. Since 1980 she has preferred la Mayimba, and it is the one she uses for herself.

**Taking merengue típico abroad**

Touring alongside Rafael Solano took her out of the country for the first time, and she became the first Dominican artist to carry merengue típico to Europe. Her debut album was Si Quiere Venir Que Venga. What she brought was not a softened version for foreign ears but the accordion music of the Cibao as it is actually played — fast, unpolished and physical.

**Recordings**

- Merengues Típicos Vol. 1 — 1979  
- La Pimienta Es la Que Pica — 1980  
- Fefita la Grande — 1981  
- La Cintura Mía — 1989  
- La Ciudad Corazón — 2001  
- Vamos a Hablar Inglés, La Chiflera and O Te Menea O Te Apea, among the songs most identified with her

**Working across generations**

Fefita has kept recording with musicians young enough to be her grandchildren rather than settling into heritage status. In 2019 she cut a new version of La Pimienta Es la Que Pica with Milly Quezada and Maridalia Hernández, three careers meeting on one record. She has also worked with Krisspy and with the accordionist El Prodigio, whose own playing descends from the tradition she carried.

**Recognition**

- Gran Soberano — 1 June 2016, the highest award in Dominican arts, after several earlier nominations  
- Recognised by the Senate of the Dominican Republic as a pioneer of merengue típico  
- A central figure in the case for merengue's inscription by UNESCO as Intangible Cultural Heritage of Humanity, 30 November 2016  
- Her life dramatised in a biographical film presented at the Dominican film festival

**Legacy**

Merengue típico was a men's profession when Fefita picked up the accordion, and the instrument in particular was treated as beyond women. She did not argue the point; she outplayed it, and stayed long enough that the argument stopped being made. Every Dominican woman who has taken up the accordion since has done so on ground she cleared. That she is still performing in her eighties, at the tempo the music demands, is not a sentimental footnote to the achievement — it is the achievement.$sql$,
    bio_es = $sql$Fefita la Grande, nacida Manuela Josefa Taveras Cabrera el 18 de septiembre de 1943 en el paraje de El Orégano, cerca de San José, en San Ignacio de Sabaneta, Santiago Rodríguez, es acordeonista, cantante y directora de conjunto, y la mujer más importante en la historia del merengue típico dominicano. Tomó el acordeón siendo muy niña, cuando el instrumento estaba prácticamente vedado a las mujeres, y lleva siete décadas al frente de una música que pertenece al campo cibaeño. En 2016 recibió el Gran Soberano, la mayor distinción de las artes dominicanas.

**Primeros años y el acordeón**

Hija de Eliseo "Seíto" de Jesús Cabrera Fernández y María Ana Taveras, lleva primero el apellido materno porque su padre no la reconoció al nacer. Tiene una hermana de padre y madre, María Celeste, y seis medios hermanos por parte de padre. El acordeón le llegó en el taller de su padre siendo muy pequeña, y tomó como modelo al pionero del típico Guandulito. A los siete años ya era conocida en su comunidad por su manera de tocar; a los nueve animaba fiestas con acordeón, güira y tambora.

Hacia 1956, con unos doce años, tocó para José Arismendy "Petán" Trujillo, director de La Voz Dominicana y hermano del dictador, quien le entregó cien pesos: el primer dinero que su música le produjo fuera de su propio entorno.

**Tres nombres**

Ha sido bautizada tres veces. Tatico Henríquez la llamó la Vieja Fefa cuando tenía diecisiete años. Bartolo Alvarado, El Ciego de Nagua, le puso Fefita la Grande alrededor de los veintidós, y ese fue el nombre que el público retuvo. Desde 1980 prefiere la Mayimba, que es como ella misma se nombra.

**El típico fuera del país**

Las giras junto a Rafael Solano la sacaron por primera vez del país, y se convirtió en la primera artista dominicana en llevar el merengue típico a Europa. Su álbum de debut fue Si Quiere Venir Que Venga. Lo que llevó no fue una versión suavizada para oídos extranjeros, sino el acordeón del Cibao tal como se toca: rápido, sin pulir y físico.

**Grabaciones**

- Merengues Típicos Vol. 1 — 1979  
- La Pimienta Es la Que Pica — 1980  
- Fefita la Grande — 1981  
- La Cintura Mía — 1989  
- La Ciudad Corazón — 2001  
- Vamos a Hablar Inglés, La Chiflera y O Te Menea O Te Apea, entre los temas más identificados con ella

**Trabajo entre generaciones**

Fefita ha seguido grabando con músicos que podrían ser sus nietos, en lugar de instalarse en el papel de reliquia. En 2019 grabó una nueva versión de La Pimienta Es la Que Pica junto a Milly Quezada y Maridalia Hernández, tres carreras encontrándose en un mismo tema. También ha trabajado con Krisspy y con el acordeonista El Prodigio, cuya manera de tocar desciende de la tradición que ella sostuvo.

**Reconocimientos**

- Gran Soberano — 1 de junio de 2016, el máximo galardón de las artes dominicanas, tras varias nominaciones previas  
- Reconocimiento del Senado de la República Dominicana como pionera del merengue típico  
- Figura central en el expediente que llevó a la UNESCO a declarar el merengue Patrimonio Cultural Inmaterial de la Humanidad, el 30 de noviembre de 2016  
- Su vida llevada al cine en una película biográfica presentada en el festival de cine dominicano

**Legado**

El merengue típico era oficio de hombres cuando Fefita tomó el acordeón, y el instrumento en particular se consideraba fuera del alcance de una mujer. Ella no discutió el punto: tocó mejor, y se quedó el tiempo suficiente para que el punto dejara de discutirse. Cada dominicana que ha tomado un acordeón después lo ha hecho sobre terreno que ella despejó. Que siga presentándose pasados los ochenta, al tempo que la música exige, no es una nota sentimental al margen del logro: es el logro.$sql$,
    sort_name = 'Taveras Cabrera, Manuela Josefa',
    occupations = '["accordionist","bandleader","composer","musician"]'::jsonb,
    updated_at = now()
WHERE id = '9333da06-ad03-44eb-9b81-c21d0ccdd0ea';

-- Recapitalisation, scoped to the documents that carried the wrong form.
UPDATE editorial_documents SET document = (document::text)::jsonb, updated_at = now() WHERE id = '4f8112db-8d99-409e-9373-cd7b0ba4f578';  -- La Fiera Típica (en) recapitalised in place
UPDATE editorial_documents SET document = (document::text)::jsonb, updated_at = now() WHERE id = '1294b6d7-9df8-44c9-9afa-046c26941721';  -- La Fiera Típica (es) recapitalised in place
UPDATE editorial_documents SET document = (document::text)::jsonb, updated_at = now() WHERE id = 'be9e8ccf-0032-4189-be7f-717282da1dd4';  -- Maridalia Hernández (en) recapitalised in place
UPDATE editorial_documents SET document = (document::text)::jsonb, updated_at = now() WHERE id = 'a441f11a-7746-413f-a598-9793c9f43c1e';  -- Maridalia Hernández (es) recapitalised in place
UPDATE editorial_documents SET document = (document::text)::jsonb, updated_at = now() WHERE id = '1dfef766-76e8-480d-9822-62d241cbdc31';  -- Shino Aguakate (en) recapitalised in place
UPDATE editorial_documents SET document = (document::text)::jsonb, updated_at = now() WHERE id = '447cb75f-4aa8-4ffd-8f44-2a141bb86583';  -- Shino Aguakate (es) recapitalised in place

UPDATE artists
SET bio_en = replace(bio_en, 'Fefita La Grande', 'Fefita la Grande'),
    bio_es = replace(bio_es, 'Fefita La Grande', 'Fefita la Grande'),
    updated_at = now()
WHERE bio_en LIKE '%Fefita La Grande%' OR bio_es LIKE '%Fefita La Grande%';

COMMIT;
