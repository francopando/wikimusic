BEGIN;

-- Rewrite the catalogue entry for El Fecho RD.
--
-- El Fecho RD. Filler in English, nothing in Spanish, no genres -- on the
-- singer who is on the remix that put the word "teteo" into everyday Dominican
-- Spanish.
--
-- AGAIN THE CHANNEL DESCRIPTION HAD WHAT THE ROW WAS MISSING. His YouTube
-- channel opens: "ROBERT CASTILLO NIN, MEJOR CONOCIDO COMO EL FECHO RD, NACIÓ
-- EL 25 DE FEBRERO DEL 1998 NATIVO DEL SECTOR DE VILLA DUARTE". That is a birth
-- date and a barrio, neither of which was on the row, and both confirmed
-- against the stored legal name and birth_year 1998.
--
-- CORRECTED: province "Distrito Nacional" -> "Santo Domingo" and birth_place
-- "Santo Domingo" -> "Villa Duarte, Santo Domingo Este". Villa Duarte is in
-- Santo Domingo Este, not the Distrito Nacional -- the same import-time error
-- already corrected today for Kiko el Crazy, Inka, Lismar and Toxic Crow, and
-- it is beginning to look systematic rather than incidental. primary_genre
-- urbano -> urban-dembow.
--
-- FILLED: date_of_birth 25 February 1998.
--
-- ADDED: genres, occupations composer stays as stored, disambiguation.
--
-- SOURCES: El Caribe, 7 January 2021, "La música urbana impacta en el habla del
-- dominicano", by José Nova, which is the substantial source and gives: the
-- legal name, roughly six years in music as of that date, the start doing
-- freestyle on social media in Villa Duarte, the earlier hit La Vuelta with
-- Secreto and Nino Freestyle, and the whole account of how Teteo spread -- You R
-- released it in February 2020, the October remix with El Fecho RD is what made
-- it explode, and a second part followed with Bulín 47, Químico Ultra Mega and
-- Shadow Blow. His own YouTube channel for the description and for the released
-- work: Plátano Power, Prende El Pachuche, Muévete Jevy with El Alfa, Peligro,
-- Se Ve Chula, No Son De Na with JaydmRD, La Aplico, Capea El Dough 2024
-- produced by Linkon and Triggah, El Grajo Del Bajo Mundo, El Poloche Cocolo
-- with Lil Plakel and Tauro.9, Míralo with El Fother, A Terror with Jey One, La
-- Popola de Mi Loca with Tivi Gunz and Químico Ultra Mega, Pepa Pila de Pepa
-- with Darlyn Nay, Malón with July Queen, Ula Ula with Braulio Fogón, Gatillo
-- Alegre with Yomel el Meloso, and the Nunca Choche remix with Bulín 47 and
-- Shadow Blow. MusicBrainz for Teteo (Remix), 2020.
--
-- NOT WRITTEN: subscriber and view counts. Nothing about the private matters a
-- Facebook post touches on.
--
-- NOT LINKED: You R (Melvin Rosario Viloria), JaydmRD, Lil Plakel, Tauro.9, El
-- Fother, Jey One, Darlyn Nay, July Queen, Braulio Fogón, Verified, Jizyee and
-- the producers Linkon and Triggah are Dominican and have no entries. You R is
-- the notable gap -- he wrote and first released Teteo, and he is from the same
-- barrio.
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
       name = 'El Fecho RD',
       sort_name = 'El Fecho RD',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urban-dembow',
       date_of_birth = '1998-02-25',
       birth_year = 1998,
       date_of_death = NULL,
       birth_place = 'Villa Duarte, Santo Domingo Este',
       province = 'Santo Domingo',
       first_name = 'Robert',
       middle_name = NULL,
       last_name = 'Castillo',
       second_last_name = 'Nin',
       stage_name = 'El Fecho RD',
       aliases = ARRAY['El Fecho']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'urban-rap-hip-hop']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@elfechord',
       facebook = '61569813702845',
       instagram = 'elfechotrotiao',
       disambiguation = 'Dembow singer from Villa Duarte; the Teteo remix',
       bio_en = 'El Fecho RD, born Robert Castillo Nin in Villa Duarte, is a Dominican dembow singer and songwriter. He is on the record that gave the country a word it now uses every day.

**Freestyle in Villa Duarte**

He made his name posting freestyles from his own barrio, which by the middle of the last decade had become the entry route into Dominican urban music: no label, no studio, a phone and whoever was standing around.

The first record that carried him further was La Vuelta, a song by Secreto “El Famoso Biberón” that also brought in Nino Freestyle. Being pulled onto a Secreto record is a form of promotion nobody can buy.

**Teteo**

You R released Teteo in February 2020. It did reasonably. In October a remix arrived with El Fecho RD on it, and that is the version that broke — El Caribe traced the whole path in a piece about how urban music reshapes Dominican speech, and Teteo was its central example. A second part followed with Bulin 47, Químico Ultra Mega and Shadow Blow.

The word came out of the song and into the language. It describes the state of being several drinks past sensible and still out on the street at an hour when you should not be, and it arrived in the middle of a lockdown, which is exactly why it stuck. A dembow record naming a feeling that a whole country was not allowed to have is a fairly precise piece of timing.

That is what this genre does that almost nothing else in Dominican music does now. Merengue named dances; dembow names conditions, and the naming travels faster than the record.

**The catalogue**

The titles are half the work: Prende El Pachuche, Capea El Dough, Nunca Choche, Cui Cui Cua Cua, Se Siente Vacano, El Grajo Del Bajo Mundo, Guillao De. Each is a phrase built to be repeated before it is understood.

The credits run through the whole field — Muévete Jevy with El Alfa; La Popola de Mi Loca with Tivi Gunz and Químico Ultra Mega; Gatillo Alegre with Yomel el Meloso; the Nunca Choche remix with Bulin 47 and Shadow Blow; Míralo with El Fother; A Terror with Jey One.

Plátano Power is the one that says out loud what the rest implies.',
       bio_es = 'El Fecho RD, de nombre Robert Castillo Nin y nacido en Villa Duarte, es cantante y compositor de dembow dominicano. Está en el disco que le dio al país una palabra que hoy usa todos los días.

**Freestyle en Villa Duarte**

Se hizo el nombre colgando freestyles desde su propio barrio, que para mediados de la década pasada ya era la vía de entrada a la música urbana dominicana: sin sello, sin estudio, un teléfono y quien estuviera alrededor.

El primer disco que lo llevó más lejos fue La Vuelta, un tema de Secreto “El Famoso Biberón” que también metió a Nino Freestyle. Que te jalen a un disco de Secreto es una promoción que no se compra.

**Teteo**

You R sacó Teteo en febrero de 2020. Anduvo razonablemente. En octubre salió un remix con El Fecho RD adentro, y esa es la versión que rompió: El Caribe reconstruyó el recorrido completo en un reportaje sobre cómo la música urbana le cambia el habla al dominicano, y Teteo era el ejemplo central. Después vino una segunda parte con Bulin 47, Químico Ultra Mega y Shadow Blow.

La palabra salió de la canción y se metió en el idioma. Describe el estado de andar varios tragos pasado de la cuenta y todavía en la calle a una hora en la que no deberías, y llegó en medio de un confinamiento, que es exactamente por qué se quedó. Un disco de dembow que le pone nombre a una sensación que un país entero tenía prohibida es una puntería bastante fina.

Eso es lo que hace este género y ya casi no hace nada más en la música dominicana. El merengue le ponía nombre a los bailes; el dembow le pone nombre a los estados, y el nombre viaja más rápido que el disco.

**El catálogo**

Los títulos son la mitad del trabajo: Prende El Pachuche, Capea El Dough, Nunca Choche, Cui Cui Cua Cua, Se Siente Vacano, El Grajo Del Bajo Mundo, Guillao De. Cada uno es una frase hecha para repetirse antes de entenderse.

Los créditos cruzan todo el campo: Muévete Jevy con El Alfa; La Popola de Mi Loca con Tivi Gunz y Químico Ultra Mega; Gatillo Alegre con Yomel el Meloso; el remix de Nunca Choche con Bulin 47 y Shadow Blow; Míralo con El Fother; A Terror con Jey One.

Plátano Power es el que dice en voz alta lo que los demás dan por dicho.',
       updated_at = now()
 WHERE slug = 'el-fecho-rd';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-fecho-rd')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-fecho-rd')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"El Fecho RD, born Robert Castillo Nin in Villa Duarte, is a Dominican dembow singer and songwriter. He is on the record that gave the country a word it now uses every day.","type":"text"}]},{"type":"paragraph","content":[{"text":"Freestyle in Villa Duarte","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He made his name posting freestyles from his own barrio, which by the middle of the last decade had become the entry route into Dominican urban music: no label, no studio, a phone and whoever was standing around.","type":"text"}]},{"type":"paragraph","content":[{"text":"The first record that carried him further was La Vuelta, a song by ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f57eb2e7-9ca7-463d-baee-8b3ea1800e6b","displayText":"Secreto “El Famoso Biberón”","occurrenceId":"2ad2ff07-35f0-49e2-9db2-014707ceeec0"}},{"text":" that also brought in ","type":"text"},{"type":"artistReference","attrs":{"artistId":"270ba4bb-287a-401d-b672-818fbe9477d3","displayText":"Nino Freestyle","occurrenceId":"11278377-4491-4fe1-9f3f-e9061a56a011"}},{"text":". Being pulled onto a Secreto record is a form of promotion nobody can buy.","type":"text"}]},{"type":"paragraph","content":[{"text":"Teteo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"You R released Teteo in February 2020. It did reasonably. In October a remix arrived with El Fecho RD on it, and that is the version that broke — El Caribe traced the whole path in a piece about how urban music reshapes Dominican speech, and Teteo was its central example. A second part followed with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"550df3b5-6488-4aec-a476-a5d28d52ceea","displayText":"Bulin 47","occurrenceId":"ab168f9f-9552-4292-ae68-d1e1a18708dd"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"de562eb7-a0fb-49c2-a3c8-db97a4be80e3","displayText":"Químico Ultra Mega","occurrenceId":"d5da9b31-118d-40f3-b204-4dac45c799fe"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"b3841446-0bdb-48f5-9ace-b492db7d9be2","displayText":"Shadow Blow","occurrenceId":"b8777403-dc08-4bc6-ab68-0cdd3bb5910e"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"The word came out of the song and into the language. It describes the state of being several drinks past sensible and still out on the street at an hour when you should not be, and it arrived in the middle of a lockdown, which is exactly why it stuck. A dembow record naming a feeling that a whole country was not allowed to have is a fairly precise piece of timing.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is what this genre does that almost nothing else in Dominican music does now. Merengue named dances; dembow names conditions, and the naming travels faster than the record.","type":"text"}]},{"type":"paragraph","content":[{"text":"The catalogue","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The titles are half the work: Prende El Pachuche, Capea El Dough, Nunca Choche, Cui Cui Cua Cua, Se Siente Vacano, El Grajo Del Bajo Mundo, Guillao De. Each is a phrase built to be repeated before it is understood.","type":"text"}]},{"type":"paragraph","content":[{"text":"The credits run through the whole field — Muévete Jevy with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"559f2ed4-8831-483b-bc00-7cb4f340ad92","displayText":"El Alfa","occurrenceId":"c80fdd7a-6974-45e8-b90c-8b3090a97bca"}},{"text":"; La Popola de Mi Loca with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"95e181f1-58e5-4537-a5e8-75a9f60c6aca","displayText":"Tivi Gunz","occurrenceId":"5d3e6ac2-56f6-4017-aae5-536d780c2ae3"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"de562eb7-a0fb-49c2-a3c8-db97a4be80e3","displayText":"Químico Ultra Mega","occurrenceId":"d8921797-0e27-450c-bc31-7c5a1e2dbfd8"}},{"text":"; Gatillo Alegre with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bb07dcb8-444f-4a68-a668-21e9e038f335","displayText":"Yomel el Meloso","occurrenceId":"1b3c5e79-2d90-44fe-8c42-38491979be25"}},{"text":"; the Nunca Choche remix with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"550df3b5-6488-4aec-a476-a5d28d52ceea","displayText":"Bulin 47","occurrenceId":"1daea115-15e2-40db-af1f-e53d68715664"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"b3841446-0bdb-48f5-9ace-b492db7d9be2","displayText":"Shadow Blow","occurrenceId":"0d7bb8f8-5573-4370-8923-3ce4296f5be3"}},{"text":"; Míralo with El Fother; A Terror with Jey One.","type":"text"}]},{"type":"paragraph","content":[{"text":"Plátano Power is the one that says out loud what the rest implies.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'el-fecho-rd'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"El Fecho RD, de nombre Robert Castillo Nin y nacido en Villa Duarte, es cantante y compositor de dembow dominicano. Está en el disco que le dio al país una palabra que hoy usa todos los días.","type":"text"}]},{"type":"paragraph","content":[{"text":"Freestyle en Villa Duarte","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Se hizo el nombre colgando freestyles desde su propio barrio, que para mediados de la década pasada ya era la vía de entrada a la música urbana dominicana: sin sello, sin estudio, un teléfono y quien estuviera alrededor.","type":"text"}]},{"type":"paragraph","content":[{"text":"El primer disco que lo llevó más lejos fue La Vuelta, un tema de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f57eb2e7-9ca7-463d-baee-8b3ea1800e6b","displayText":"Secreto “El Famoso Biberón”","occurrenceId":"868ac193-208e-4dfb-bc88-dc4bd6a0d31a"}},{"text":" que también metió a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"270ba4bb-287a-401d-b672-818fbe9477d3","displayText":"Nino Freestyle","occurrenceId":"15b535b1-7065-49df-a32b-9465653dad04"}},{"text":". Que te jalen a un disco de Secreto es una promoción que no se compra.","type":"text"}]},{"type":"paragraph","content":[{"text":"Teteo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"You R sacó Teteo en febrero de 2020. Anduvo razonablemente. En octubre salió un remix con El Fecho RD adentro, y esa es la versión que rompió: El Caribe reconstruyó el recorrido completo en un reportaje sobre cómo la música urbana le cambia el habla al dominicano, y Teteo era el ejemplo central. Después vino una segunda parte con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"550df3b5-6488-4aec-a476-a5d28d52ceea","displayText":"Bulin 47","occurrenceId":"9f47be72-b8e2-49d0-96c6-ce1dee40bd76"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"de562eb7-a0fb-49c2-a3c8-db97a4be80e3","displayText":"Químico Ultra Mega","occurrenceId":"72b4f0ad-6cb0-4da7-b430-94ef24af8f32"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"b3841446-0bdb-48f5-9ace-b492db7d9be2","displayText":"Shadow Blow","occurrenceId":"73313336-dadc-4e60-b3e8-6cab1b337905"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"La palabra salió de la canción y se metió en el idioma. Describe el estado de andar varios tragos pasado de la cuenta y todavía en la calle a una hora en la que no deberías, y llegó en medio de un confinamiento, que es exactamente por qué se quedó. Un disco de dembow que le pone nombre a una sensación que un país entero tenía prohibida es una puntería bastante fina.","type":"text"}]},{"type":"paragraph","content":[{"text":"Eso es lo que hace este género y ya casi no hace nada más en la música dominicana. El merengue le ponía nombre a los bailes; el dembow le pone nombre a los estados, y el nombre viaja más rápido que el disco.","type":"text"}]},{"type":"paragraph","content":[{"text":"El catálogo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Los títulos son la mitad del trabajo: Prende El Pachuche, Capea El Dough, Nunca Choche, Cui Cui Cua Cua, Se Siente Vacano, El Grajo Del Bajo Mundo, Guillao De. Cada uno es una frase hecha para repetirse antes de entenderse.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los créditos cruzan todo el campo: Muévete Jevy con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"559f2ed4-8831-483b-bc00-7cb4f340ad92","displayText":"El Alfa","occurrenceId":"a988dd66-34ad-423a-8a50-274ec9b0e2e2"}},{"text":"; La Popola de Mi Loca con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"95e181f1-58e5-4537-a5e8-75a9f60c6aca","displayText":"Tivi Gunz","occurrenceId":"db31220d-a021-4126-985e-52a6264c72da"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"de562eb7-a0fb-49c2-a3c8-db97a4be80e3","displayText":"Químico Ultra Mega","occurrenceId":"e27f0383-72b8-4058-a289-060bd9b6634b"}},{"text":"; Gatillo Alegre con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bb07dcb8-444f-4a68-a668-21e9e038f335","displayText":"Yomel el Meloso","occurrenceId":"79639094-8b28-42e3-8686-a7c658b293c9"}},{"text":"; el remix de Nunca Choche con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"550df3b5-6488-4aec-a476-a5d28d52ceea","displayText":"Bulin 47","occurrenceId":"39a56248-915f-444b-a0fa-922e94144425"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"b3841446-0bdb-48f5-9ace-b492db7d9be2","displayText":"Shadow Blow","occurrenceId":"d69aafa7-784d-4e38-80b7-999f068df27a"}},{"text":"; Míralo con El Fother; A Terror con Jey One.","type":"text"}]},{"type":"paragraph","content":[{"text":"Plátano Power es el que dice en voz alta lo que los demás dan por dicho.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'el-fecho-rd'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-fecho-rd') AND locale = 'en'), '0d7bb8f8-5573-4370-8923-3ce4296f5be3', 'artist', 'b3841446-0bdb-48f5-9ace-b492db7d9be2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-fecho-rd') AND locale = 'en'), '11278377-4491-4fe1-9f3f-e9061a56a011', 'artist', '270ba4bb-287a-401d-b672-818fbe9477d3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-fecho-rd') AND locale = 'en'), '1b3c5e79-2d90-44fe-8c42-38491979be25', 'artist', 'bb07dcb8-444f-4a68-a668-21e9e038f335');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-fecho-rd') AND locale = 'en'), '1daea115-15e2-40db-af1f-e53d68715664', 'artist', '550df3b5-6488-4aec-a476-a5d28d52ceea');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-fecho-rd') AND locale = 'en'), '2ad2ff07-35f0-49e2-9db2-014707ceeec0', 'artist', 'f57eb2e7-9ca7-463d-baee-8b3ea1800e6b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-fecho-rd') AND locale = 'en'), '5d3e6ac2-56f6-4017-aae5-536d780c2ae3', 'artist', '95e181f1-58e5-4537-a5e8-75a9f60c6aca');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-fecho-rd') AND locale = 'en'), 'ab168f9f-9552-4292-ae68-d1e1a18708dd', 'artist', '550df3b5-6488-4aec-a476-a5d28d52ceea');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-fecho-rd') AND locale = 'en'), 'b8777403-dc08-4bc6-ab68-0cdd3bb5910e', 'artist', 'b3841446-0bdb-48f5-9ace-b492db7d9be2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-fecho-rd') AND locale = 'en'), 'c80fdd7a-6974-45e8-b90c-8b3090a97bca', 'artist', '559f2ed4-8831-483b-bc00-7cb4f340ad92');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-fecho-rd') AND locale = 'en'), 'd5da9b31-118d-40f3-b204-4dac45c799fe', 'artist', 'de562eb7-a0fb-49c2-a3c8-db97a4be80e3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-fecho-rd') AND locale = 'en'), 'd8921797-0e27-450c-bc31-7c5a1e2dbfd8', 'artist', 'de562eb7-a0fb-49c2-a3c8-db97a4be80e3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-fecho-rd') AND locale = 'es'), '15b535b1-7065-49df-a32b-9465653dad04', 'artist', '270ba4bb-287a-401d-b672-818fbe9477d3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-fecho-rd') AND locale = 'es'), '39a56248-915f-444b-a0fa-922e94144425', 'artist', '550df3b5-6488-4aec-a476-a5d28d52ceea');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-fecho-rd') AND locale = 'es'), '72b4f0ad-6cb0-4da7-b430-94ef24af8f32', 'artist', 'de562eb7-a0fb-49c2-a3c8-db97a4be80e3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-fecho-rd') AND locale = 'es'), '73313336-dadc-4e60-b3e8-6cab1b337905', 'artist', 'b3841446-0bdb-48f5-9ace-b492db7d9be2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-fecho-rd') AND locale = 'es'), '79639094-8b28-42e3-8686-a7c658b293c9', 'artist', 'bb07dcb8-444f-4a68-a668-21e9e038f335');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-fecho-rd') AND locale = 'es'), '868ac193-208e-4dfb-bc88-dc4bd6a0d31a', 'artist', 'f57eb2e7-9ca7-463d-baee-8b3ea1800e6b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-fecho-rd') AND locale = 'es'), '9f47be72-b8e2-49d0-96c6-ce1dee40bd76', 'artist', '550df3b5-6488-4aec-a476-a5d28d52ceea');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-fecho-rd') AND locale = 'es'), 'a988dd66-34ad-423a-8a50-274ec9b0e2e2', 'artist', '559f2ed4-8831-483b-bc00-7cb4f340ad92');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-fecho-rd') AND locale = 'es'), 'd69aafa7-784d-4e38-80b7-999f068df27a', 'artist', 'b3841446-0bdb-48f5-9ace-b492db7d9be2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-fecho-rd') AND locale = 'es'), 'db31220d-a021-4126-985e-52a6264c72da', 'artist', '95e181f1-58e5-4537-a5e8-75a9f60c6aca');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'el-fecho-rd') AND locale = 'es'), 'e27f0383-72b8-4058-a289-060bd9b6634b', 'artist', 'de562eb7-a0fb-49c2-a3c8-db97a4be80e3');

COMMIT;
