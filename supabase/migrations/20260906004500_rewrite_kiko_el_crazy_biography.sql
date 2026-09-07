BEGIN;

-- Rewrite the catalogue entry for Kiko el Crazy.
--
-- Kiko el Crazy. Filler in English, nothing in Spanish, no date, no real name
-- -- on one of the two or three most exported Dominican artists of the decade.
-- This is the largest gap the audit has turned up in a while.
--
-- FILLED: legal name José Alberto Rojas Peralta, date_of_birth 27 September
-- 1990.
--
-- CORRECTED: first_name "Kiko" / last_name "El Crazy" were the stage name split
-- across the legal-name columns, which is wrong; they now hold the legal name
-- and the stage name goes in stage_name and aliases. Province "Distrito
-- Nacional" -> "Santo Domingo" and birth_place "Santo Domingo" -> "Los Mina,
-- Santo Domingo Este". Los Mina is in Santo Domingo Este, which is Santo
-- Domingo province, not the Distrito Nacional. primary_role singer -> rapper:
-- he is filed as a rapper first in every source, including his own.
--
-- ADDED: aliases, occupations producer beside composer, urban-rap-hip-hop in
-- genres, disambiguation.
--
-- SOURCES: Spanish Wikipedia, which is unusually well referenced on him and is
-- the spine of the chronology -- the birth in Los Mina on 27 September 1990,
-- instruments at ten and guitar lessons at twelve, the influence of Monkey
-- Black, Un To Pa To in 2009, the 2011 Casandra nomination as composer for
-- Prende la Hookah performed by Tulile, Trucho with Rochy RD and the Bajé con
-- Trenza remix with Ozuna and El Cherry Scom in 2019, the singles of 2019 and
-- 2020, Llegó el Domi in 2022 and Pila'e Teteo in 2023 with their guest lists,
-- and the New York Fashion Week appearance of February 2023. EcuRed for the
-- early signing to Lápiz Conciente's label. Diario Libre, 29 August 2021, "El
-- artista detrás del personaje". Remezcla, 25 November 2019, on his use of
-- Dominican street vocabulary. El Nuevo Diario and El Caribe, March 2022, on
-- the release of Llegó el Domi; El Nuevo Diario, 8 September 2022, on Latina
-- with will.i.am; Listín Diario, Hoy and El Día, April 2023, on Pila'e Teteo,
-- which Pitchfork also reviewed. English Wikipedia's 2023 Premios Juventud
-- article and Billboard's 15 June 2023 list for the award outcomes.
--
-- A CLAIM CORRECTED. Spanish Wikipedia's lead says he "fue galardonado" at
-- Premios Juventud 2023, Premios Heat 2022 and Premios Tu Música Urbano. The
-- nominee lists say otherwise: at Premios Juventud 2023 he was nominated twice
-- and won neither -- Best Dembow Song went to Natti Natasha's To' Esto Es Tuyo
-- and Best Dembow Collaboration to Delincuente -- and at Premios Tu Música
-- Urbano 2023 the dembow artist award went to El Alfa. The contemporaneous
-- Dominican coverage says "nominado", not "ganador". The award rows and the
-- prose follow the nominee lists. The Premios Heat 2022 claim is not recorded
-- at all, because no list was found to check it against.
--
-- NOT WRITTEN: view counts, which Wikipedia gives for almost every single;
-- anything about his private life; and the recent public apology, which is
-- about a missed appearance and not about the music.
--
-- NOT LINKED: Ozuna, Farruko, Arcángel, Zion y Lennox, Jowell y Randy, Ñengo
-- Flow, Darell, Noriel, Lary Over, Luar la L, Lenny Tavárez, Amenazzy, Jon Z,
-- will.i.am, CJ and Mala Rodríguez are not Dominican. La Manta, El Pope, Omy de
-- Oro, Braulio Fogón, Yaisel LM, El Fother, El Yala, Treintisiete and Nicole
-- Franco are Dominican and have no entries.
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
       name = 'Kiko el Crazy',
       sort_name = 'Kiko el Crazy',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'rapper',
       primary_genre = 'urban-dembow',
       date_of_birth = '1990-09-27',
       birth_year = 1990,
       date_of_death = NULL,
       birth_place = 'Los Mina, Santo Domingo Este',
       province = 'Santo Domingo',
       first_name = 'José',
       middle_name = 'Alberto',
       last_name = 'Rojas',
       second_last_name = 'Peralta',
       stage_name = 'Kiko el Crazy',
       aliases = ARRAY['Kiko El Crazy', 'Kiko El Creizy']::text[],
       occupations = '["composer","producer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'urban-rap-hip-hop']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@KikoElCrazylm',
       facebook = 'kikoelcrazy',
       instagram = 'kikoelcrazylm',
       disambiguation = 'Dominican dembow artist from Los Mina; Llegó el Domi, Pila’e Teteo',
       bio_en = 'Kiko el Crazy, born José Alberto Rojas Peralta, is a Dominican rapper, singer and composer from Los Mina. He is one of the artists who carried dembow out of the Dominican barrio and onto records made in Los Angeles, and he did it without changing how he talks.

**Los Mina**

He started around music at ten, learning to play a little of several instruments, and took guitar lessons at twelve. Monkey Black was the rapper who marked him. Un To Pa To, in 2009, was popular in his own neighbourhood and nowhere else, which is where a dembow career normally begins and usually ends.

The first professional recognition came for writing rather than performing: in 2011 he was nominated at the Premios Casandra as a composer, for Prende la Hookah, which Tulile recorded. He was also on Lápiz Conciente’s label early on.

**The year everything moved**

2019 is the hinge. Trucho, with Rochy RD; the Bajé con Trenza remix, where Ozuna put him and El Cherry Scom on a Puerto Rican record; then Bájale, La Pampara, Asicalao, Tic Toc, Popi, Fue Por Ti, Yo Doy Nota, and Sube la Bocina, which gathered Shelow Shaq, La Manta, El Cherry Scom, El Pope and Lolo en el Micrófono on one track.

The Popi remix in 2020 added El Alfa and Farruko. Se Acabó la Cuarentena, with Jowell y Randy, went to number one on Spotify — a Dominican dembow record about the end of lockdown, arriving exactly when the audience needed it.

**The albums**

Llegó el Domi, in 2022, is the debut album, and its guest list reads like an argument about where dembow belongs: Ñengo Flow, Farruko, Darell, Arcángel, Zion y Lennox, Jowell y Randy, will.i.am. Latina, the track with will.i.am, is the clearest statement of it.

Pila’e Teteo followed in 2023 and turned the other way, filling the record with the Dominican field itself — Bulin 47, El Alfa, Flow 28, Angel Dior, El Fother, Chimbala, Mala Rodríguez, Braulio Fogón, Yomel el Meloso. Pitchfork reviewed it, which for a dembow album made in Santo Domingo was not routine.

At the Premios Juventud that year he was nominated twice, for Cuca and for Pichirry with El Alfa, and won neither; he was nominated as dembow artist of the year at the Premios Tu Música Urbano in the same season.

**The character**

Part of what he sells is a persona — the loud clothes, the runway appearance at New York Fashion Week in 2023, the deliberate excess. Underneath it is a writer who has been putting Dominican street vocabulary into records for fifteen years and refusing to translate any of it.',
       bio_es = 'Kiko el Crazy, de nombre José Alberto Rojas Peralta, es un rapero, cantante y compositor dominicano de Los Mina. Es uno de los artistas que sacaron el dembow del barrio dominicano y lo metieron en discos hechos en Los Ángeles, y lo hizo sin cambiar la manera de hablar.

**Los Mina**

Empezó cerca de la música a los diez años, aprendiendo un poco de varios instrumentos, y a los doce tomó clases de guitarra. Monkey Black fue el rapero que lo marcó. Un To Pa To, en 2009, se hizo popular en su propio barrio y en ninguna otra parte, que es donde suele empezar y donde suele quedarse una carrera de dembow.

El primer reconocimiento profesional le llegó por escribir y no por cantar: en 2011 fue nominado en los Premios Casandra como compositor, por Prende la Hookah, que grabó Tulile. También estuvo temprano en el sello de Lápiz Conciente.

**El año en que se movió todo**

2019 es la bisagra. Trucho, con Rochy RD; el remix de Bajé con Trenza, donde Ozuna lo puso a él y a El Cherry Scom en un disco puertorriqueño; y después Bájale, La Pampara, Asicalao, Tic Toc, Popi, Fue Por Ti, Yo Doy Nota, y Sube la Bocina, que juntó a Shelow Shaq, La Manta, El Cherry Scom, El Pope y Lolo en el Micrófono en un solo tema.

El remix de Popi, en 2020, sumó a El Alfa y a Farruko. Se Acabó la Cuarentena, con Jowell y Randy, llegó al número uno de Spotify: un disco de dembow dominicano sobre el fin del encierro, llegando exactamente cuando el público lo necesitaba.

**Los álbumes**

Llegó el Domi, de 2022, es el álbum de debut, y su lista de invitados se lee como una discusión sobre dónde pertenece el dembow: Ñengo Flow, Farruko, Darell, Arcángel, Zion y Lennox, Jowell y Randy, will.i.am. Latina, el tema con will.i.am, es la formulación más clara de eso.

Pila’e Teteo llegó en 2023 y giró para el otro lado, llenando el disco con el campo dominicano mismo: Bulin 47, El Alfa, Flow 28, Angel Dior, El Fother, Chimbala, Mala Rodríguez, Braulio Fogón, Yomel el Meloso. Pitchfork lo reseñó, cosa que para un álbum de dembow hecho en Santo Domingo no era rutina.

En los Premios Juventud de ese año quedó nominado dos veces, por Cuca y por Pichirry con El Alfa, y no ganó ninguna; en la misma temporada quedó nominado como artista dembow del año en los Premios Tu Música Urbano.

**El personaje**

Parte de lo que vende es un personaje: la ropa a gritos, la pasarela del New York Fashion Week en 2023, el exceso deliberado. Debajo hay un escritor que lleva quince años metiendo vocabulario de calle dominicano en los discos y negándose a traducir nada de eso.',
       updated_at = now()
 WHERE slug = 'kiko-el-crazy';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Kiko el Crazy, born José Alberto Rojas Peralta, is a Dominican rapper, singer and composer from Los Mina. He is one of the artists who carried dembow out of the Dominican barrio and onto records made in Los Angeles, and he did it without changing how he talks.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los Mina","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He started around music at ten, learning to play a little of several instruments, and took guitar lessons at twelve. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8af29e3a-6ae7-4a2d-9389-8ec927790901","displayText":"Monkey Black","occurrenceId":"aa339494-a712-4933-8556-57fa582f9be1"}},{"text":" was the rapper who marked him. Un To Pa To, in 2009, was popular in his own neighbourhood and nowhere else, which is where a dembow career normally begins and usually ends.","type":"text"}]},{"type":"paragraph","content":[{"text":"The first professional recognition came for writing rather than performing: in 2011 he was nominated at the Premios Casandra as a composer, for Prende la Hookah, which ","type":"text"},{"type":"artistReference","attrs":{"artistId":"a9377ef8-237f-462a-bcb0-6013fd6ac76b","displayText":"Tulile","occurrenceId":"08ee8270-9488-43f1-9a81-4219896e359c"}},{"text":" recorded. He was also on ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"d2b13f30-875f-4297-882e-6d2b45694e05"}},{"text":"’s label early on.","type":"text"}]},{"type":"paragraph","content":[{"text":"The year everything moved","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"2019 is the hinge. Trucho, with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"71ebd02b-8ba4-4cd7-b7e4-a990a9c3c3bb","displayText":"Rochy RD","occurrenceId":"a08b4e00-0a02-4156-9221-3b130d51116b"}},{"text":"; the Bajé con Trenza remix, where Ozuna put him and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0b2e1a39-b265-42d6-95d5-85ad930eee84","displayText":"El Cherry Scom","occurrenceId":"6bc339c6-e0cc-4097-b691-b34144f31f0a"}},{"text":" on a Puerto Rican record; then Bájale, La Pampara, Asicalao, Tic Toc, Popi, Fue Por Ti, Yo Doy Nota, and Sube la Bocina, which gathered ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cadebd75-4af4-4519-9599-6ec606694a36","displayText":"Shelow Shaq","occurrenceId":"22acf29f-82bf-4510-bd38-aedfe19ae9c1"}},{"text":", La Manta, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0b2e1a39-b265-42d6-95d5-85ad930eee84","displayText":"El Cherry Scom","occurrenceId":"6337d7ca-39b5-42e3-8294-22ebcab1e141"}},{"text":", El Pope and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8a0f2603-fc00-48a1-a50a-deefa0f661fd","displayText":"Lolo en el Micrófono","occurrenceId":"2c50ee63-a9cd-4380-a8bb-b45f8f78b07a"}},{"text":" on one track.","type":"text"}]},{"type":"paragraph","content":[{"text":"The Popi remix in 2020 added ","type":"text"},{"type":"artistReference","attrs":{"artistId":"559f2ed4-8831-483b-bc00-7cb4f340ad92","displayText":"El Alfa","occurrenceId":"add27f28-8939-4669-92a4-4282dbd6567b"}},{"text":" and Farruko. Se Acabó la Cuarentena, with Jowell y Randy, went to number one on Spotify — a Dominican dembow record about the end of lockdown, arriving exactly when the audience needed it.","type":"text"}]},{"type":"paragraph","content":[{"text":"The albums","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Llegó el Domi, in 2022, is the debut album, and its guest list reads like an argument about where dembow belongs: Ñengo Flow, Farruko, Darell, Arcángel, Zion y Lennox, Jowell y Randy, will.i.am. Latina, the track with will.i.am, is the clearest statement of it.","type":"text"}]},{"type":"paragraph","content":[{"text":"Pila’e Teteo followed in 2023 and turned the other way, filling the record with the Dominican field itself — ","type":"text"},{"type":"artistReference","attrs":{"artistId":"550df3b5-6488-4aec-a476-a5d28d52ceea","displayText":"Bulin 47","occurrenceId":"d078c770-f0c6-4f48-803b-a06baed677fe"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"559f2ed4-8831-483b-bc00-7cb4f340ad92","displayText":"El Alfa","occurrenceId":"965dd061-5af3-4de8-b91d-7037c800fb6e"}},{"text":", Flow 28, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"b8f26dfb-06b1-43de-8117-ef1c60b2e206","displayText":"Angel Dior","occurrenceId":"f4b1867c-bbe3-481d-a538-5c17da83abf2"}},{"text":", El Fother, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cf438c62-e0b8-4ba9-8e4b-f328ddce0c9b","displayText":"Chimbala","occurrenceId":"e52bf4d9-219a-4a20-9b8e-5509820ae95c"}},{"text":", Mala Rodríguez, Braulio Fogón, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bb07dcb8-444f-4a68-a668-21e9e038f335","displayText":"Yomel el Meloso","occurrenceId":"5cd72b61-43bf-477e-8a37-1d52b183bdfd"}},{"text":". Pitchfork reviewed it, which for a dembow album made in Santo Domingo was not routine.","type":"text"}]},{"type":"paragraph","content":[{"text":"At the Premios Juventud that year he was nominated twice, for Cuca and for Pichirry with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"559f2ed4-8831-483b-bc00-7cb4f340ad92","displayText":"El Alfa","occurrenceId":"c0c78bcc-8e18-4a98-be1e-ca50ceebc0d0"}},{"text":", and won neither; he was nominated as dembow artist of the year at the Premios Tu Música Urbano in the same season.","type":"text"}]},{"type":"paragraph","content":[{"text":"The character","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Part of what he sells is a persona — the loud clothes, the runway appearance at New York Fashion Week in 2023, the deliberate excess. Underneath it is a writer who has been putting Dominican street vocabulary into records for fifteen years and refusing to translate any of it.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'kiko-el-crazy'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Kiko el Crazy, de nombre José Alberto Rojas Peralta, es un rapero, cantante y compositor dominicano de Los Mina. Es uno de los artistas que sacaron el dembow del barrio dominicano y lo metieron en discos hechos en Los Ángeles, y lo hizo sin cambiar la manera de hablar.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los Mina","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Empezó cerca de la música a los diez años, aprendiendo un poco de varios instrumentos, y a los doce tomó clases de guitarra. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8af29e3a-6ae7-4a2d-9389-8ec927790901","displayText":"Monkey Black","occurrenceId":"86f1e117-314e-4f95-a2bf-3a71ccf5ae6d"}},{"text":" fue el rapero que lo marcó. Un To Pa To, en 2009, se hizo popular en su propio barrio y en ninguna otra parte, que es donde suele empezar y donde suele quedarse una carrera de dembow.","type":"text"}]},{"type":"paragraph","content":[{"text":"El primer reconocimiento profesional le llegó por escribir y no por cantar: en 2011 fue nominado en los Premios Casandra como compositor, por Prende la Hookah, que grabó ","type":"text"},{"type":"artistReference","attrs":{"artistId":"a9377ef8-237f-462a-bcb0-6013fd6ac76b","displayText":"Tulile","occurrenceId":"443fcbde-5989-4675-837b-df4be51be2c4"}},{"text":". También estuvo temprano en el sello de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"151034f8-c7b9-47b9-88ae-5e9d9b2c56ba"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"El año en que se movió todo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"2019 es la bisagra. Trucho, con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"71ebd02b-8ba4-4cd7-b7e4-a990a9c3c3bb","displayText":"Rochy RD","occurrenceId":"f409863a-e43d-4a14-8d2e-68d4e47962d4"}},{"text":"; el remix de Bajé con Trenza, donde Ozuna lo puso a él y a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0b2e1a39-b265-42d6-95d5-85ad930eee84","displayText":"El Cherry Scom","occurrenceId":"816278fa-326c-4290-b807-8827556af3af"}},{"text":" en un disco puertorriqueño; y después Bájale, La Pampara, Asicalao, Tic Toc, Popi, Fue Por Ti, Yo Doy Nota, y Sube la Bocina, que juntó a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cadebd75-4af4-4519-9599-6ec606694a36","displayText":"Shelow Shaq","occurrenceId":"2cea7a5a-3dd3-4272-91bb-c3bfba5a3f22"}},{"text":", La Manta, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0b2e1a39-b265-42d6-95d5-85ad930eee84","displayText":"El Cherry Scom","occurrenceId":"2e6dbe2c-76a2-4267-8709-f07afcaede71"}},{"text":", El Pope y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8a0f2603-fc00-48a1-a50a-deefa0f661fd","displayText":"Lolo en el Micrófono","occurrenceId":"f4663886-e1f2-46cb-bc2a-68b812b53ea5"}},{"text":" en un solo tema.","type":"text"}]},{"type":"paragraph","content":[{"text":"El remix de Popi, en 2020, sumó a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"559f2ed4-8831-483b-bc00-7cb4f340ad92","displayText":"El Alfa","occurrenceId":"c9088671-890f-46ff-997a-07a9445d6a4d"}},{"text":" y a Farruko. Se Acabó la Cuarentena, con Jowell y Randy, llegó al número uno de Spotify: un disco de dembow dominicano sobre el fin del encierro, llegando exactamente cuando el público lo necesitaba.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los álbumes","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Llegó el Domi, de 2022, es el álbum de debut, y su lista de invitados se lee como una discusión sobre dónde pertenece el dembow: Ñengo Flow, Farruko, Darell, Arcángel, Zion y Lennox, Jowell y Randy, will.i.am. Latina, el tema con will.i.am, es la formulación más clara de eso.","type":"text"}]},{"type":"paragraph","content":[{"text":"Pila’e Teteo llegó en 2023 y giró para el otro lado, llenando el disco con el campo dominicano mismo: ","type":"text"},{"type":"artistReference","attrs":{"artistId":"550df3b5-6488-4aec-a476-a5d28d52ceea","displayText":"Bulin 47","occurrenceId":"8ab55636-a9d4-4c77-9aee-9112c22dcfc1"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"559f2ed4-8831-483b-bc00-7cb4f340ad92","displayText":"El Alfa","occurrenceId":"b002a4fe-ed7c-457d-aad3-6fc7c2ca57e9"}},{"text":", Flow 28, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"b8f26dfb-06b1-43de-8117-ef1c60b2e206","displayText":"Angel Dior","occurrenceId":"058e4749-f9cf-4ec8-99d5-b0be381d7cb1"}},{"text":", El Fother, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cf438c62-e0b8-4ba9-8e4b-f328ddce0c9b","displayText":"Chimbala","occurrenceId":"b19ae449-d035-4b0a-8f07-22448d356596"}},{"text":", Mala Rodríguez, Braulio Fogón, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bb07dcb8-444f-4a68-a668-21e9e038f335","displayText":"Yomel el Meloso","occurrenceId":"c8c92ab4-4a3f-497a-b657-1410ffd8cf23"}},{"text":". Pitchfork lo reseñó, cosa que para un álbum de dembow hecho en Santo Domingo no era rutina.","type":"text"}]},{"type":"paragraph","content":[{"text":"En los Premios Juventud de ese año quedó nominado dos veces, por Cuca y por Pichirry con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"559f2ed4-8831-483b-bc00-7cb4f340ad92","displayText":"El Alfa","occurrenceId":"79385ebf-0ef4-40ad-9947-8cba126bb1da"}},{"text":", y no ganó ninguna; en la misma temporada quedó nominado como artista dembow del año en los Premios Tu Música Urbano.","type":"text"}]},{"type":"paragraph","content":[{"text":"El personaje","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Parte de lo que vende es un personaje: la ropa a gritos, la pasarela del New York Fashion Week en 2023, el exceso deliberado. Debajo hay un escritor que lleva quince años metiendo vocabulario de calle dominicano en los discos y negándose a traducir nada de eso.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'kiko-el-crazy'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'en'), '08ee8270-9488-43f1-9a81-4219896e359c', 'artist', 'a9377ef8-237f-462a-bcb0-6013fd6ac76b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'en'), '22acf29f-82bf-4510-bd38-aedfe19ae9c1', 'artist', 'cadebd75-4af4-4519-9599-6ec606694a36');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'en'), '2c50ee63-a9cd-4380-a8bb-b45f8f78b07a', 'artist', '8a0f2603-fc00-48a1-a50a-deefa0f661fd');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'en'), '5cd72b61-43bf-477e-8a37-1d52b183bdfd', 'artist', 'bb07dcb8-444f-4a68-a668-21e9e038f335');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'en'), '6337d7ca-39b5-42e3-8294-22ebcab1e141', 'artist', '0b2e1a39-b265-42d6-95d5-85ad930eee84');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'en'), '6bc339c6-e0cc-4097-b691-b34144f31f0a', 'artist', '0b2e1a39-b265-42d6-95d5-85ad930eee84');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'en'), '965dd061-5af3-4de8-b91d-7037c800fb6e', 'artist', '559f2ed4-8831-483b-bc00-7cb4f340ad92');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'en'), 'a08b4e00-0a02-4156-9221-3b130d51116b', 'artist', '71ebd02b-8ba4-4cd7-b7e4-a990a9c3c3bb');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'en'), 'aa339494-a712-4933-8556-57fa582f9be1', 'artist', '8af29e3a-6ae7-4a2d-9389-8ec927790901');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'en'), 'add27f28-8939-4669-92a4-4282dbd6567b', 'artist', '559f2ed4-8831-483b-bc00-7cb4f340ad92');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'en'), 'c0c78bcc-8e18-4a98-be1e-ca50ceebc0d0', 'artist', '559f2ed4-8831-483b-bc00-7cb4f340ad92');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'en'), 'd078c770-f0c6-4f48-803b-a06baed677fe', 'artist', '550df3b5-6488-4aec-a476-a5d28d52ceea');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'en'), 'd2b13f30-875f-4297-882e-6d2b45694e05', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'en'), 'e52bf4d9-219a-4a20-9b8e-5509820ae95c', 'artist', 'cf438c62-e0b8-4ba9-8e4b-f328ddce0c9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'en'), 'f4b1867c-bbe3-481d-a538-5c17da83abf2', 'artist', 'b8f26dfb-06b1-43de-8117-ef1c60b2e206');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'es'), '058e4749-f9cf-4ec8-99d5-b0be381d7cb1', 'artist', 'b8f26dfb-06b1-43de-8117-ef1c60b2e206');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'es'), '151034f8-c7b9-47b9-88ae-5e9d9b2c56ba', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'es'), '2cea7a5a-3dd3-4272-91bb-c3bfba5a3f22', 'artist', 'cadebd75-4af4-4519-9599-6ec606694a36');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'es'), '2e6dbe2c-76a2-4267-8709-f07afcaede71', 'artist', '0b2e1a39-b265-42d6-95d5-85ad930eee84');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'es'), '443fcbde-5989-4675-837b-df4be51be2c4', 'artist', 'a9377ef8-237f-462a-bcb0-6013fd6ac76b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'es'), '79385ebf-0ef4-40ad-9947-8cba126bb1da', 'artist', '559f2ed4-8831-483b-bc00-7cb4f340ad92');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'es'), '816278fa-326c-4290-b807-8827556af3af', 'artist', '0b2e1a39-b265-42d6-95d5-85ad930eee84');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'es'), '86f1e117-314e-4f95-a2bf-3a71ccf5ae6d', 'artist', '8af29e3a-6ae7-4a2d-9389-8ec927790901');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'es'), '8ab55636-a9d4-4c77-9aee-9112c22dcfc1', 'artist', '550df3b5-6488-4aec-a476-a5d28d52ceea');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'es'), 'b002a4fe-ed7c-457d-aad3-6fc7c2ca57e9', 'artist', '559f2ed4-8831-483b-bc00-7cb4f340ad92');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'es'), 'b19ae449-d035-4b0a-8f07-22448d356596', 'artist', 'cf438c62-e0b8-4ba9-8e4b-f328ddce0c9b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'es'), 'c8c92ab4-4a3f-497a-b657-1410ffd8cf23', 'artist', 'bb07dcb8-444f-4a68-a668-21e9e038f335');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'es'), 'c9088671-890f-46ff-997a-07a9445d6a4d', 'artist', '559f2ed4-8831-483b-bc00-7cb4f340ad92');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'es'), 'f409863a-e43d-4a14-8d2e-68d4e47962d4', 'artist', '71ebd02b-8ba4-4cd7-b7e4-a990a9c3c3bb');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'kiko-el-crazy') AND locale = 'es'), 'f4663886-e1f2-46cb-bc2a-68b812b53ea5', 'artist', '8a0f2603-fc00-48a1-a50a-deefa0f661fd');

COMMIT;
