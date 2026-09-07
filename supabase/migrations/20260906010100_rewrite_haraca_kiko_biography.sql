BEGIN;

-- Rewrite the catalogue entry for Haraca Kiko.
--
-- Haraca Kiko. Filler in English, nothing in Spanish, no disambiguation -- on a
-- dembow singer with a nine-hundred-thousand-follower account the row was not
-- pointing at, and a film career the row said nothing about.
--
-- THE ALIAS WAS INVENTED, AND HERE IS THE PROOF. The row carried aliases
-- ["Dhany Daniel Jorge"], flagged as suspicious earlier in this run. An
-- exact-phrase search for "Dhany Daniel Jorge" returns ONE result on the whole
-- indexed web, and that result is mangulina.do's own page for this artist. The
-- name exists nowhere else -- not on Rate Your Music, which lists only "Gary
-- Alexander Reyes Aquino [birth name]", not on BuenaMusica, not in any
-- newspaper, not on any of his own accounts. It is removed.
--
-- THE LEGAL NAME, BY CONTRAST, IS SOLID and is not touched: Gary Alexander
-- Reyes Aquino, born 8 July 1989 in Santo Domingo. BuenaMusica's Datos block,
-- Rate Your Music, Prensa y Gente (19 November 2022) and TheCityCeleb all agree,
-- and Rate Your Music gives the province as Distrito Nacional, which the row
-- already had.
--
-- BOTH SOCIAL HANDLES WERE WRONG AND ARE CORRECTED.
--
--   instagram  haracakikoo -> haracakikoOficial
--     The stored account has 19 followers and 3 posts. The one his own YouTube
--     channel links, haracakikoOficial, has 930,000 followers and his booking
--     numbers in the bio. The row was pointing at a shell.
--
--   facebook   haracakikooficial -> HaracaKikoBookingsRD
--     The stored value redirects to haraca.kiko.7, a personal profile with 53
--     friends and check-ins -- not an artist page, and not something a public
--     catalogue should link. HaracaKikoBookingsRD is the actual artist page,
--     with his booking number on it. The link on his own channel is dead: it
--     points at page id 103882741364612, which has since been renamed and now
--     belongs to an unrelated account called Reconocidoenusa.
--
-- That is three artists in a row -- Esme, Fritz Abreu and this one -- where a
-- stored handle was wrong, dormant, or someone else's. Opening every handle is
-- now part of the working order and it keeps paying.
--
-- THE FILM CREDITS COME FROM IMDb, WITH CHARACTER NAMES. Flow Calle (2022), as
-- El Mangú. La Familia (2024), as Pio La Ditingancia. Los Rechazados (2025), as
-- Chucky La Crema. He is in the trailer cast of Los Rechazados 2: Misión
-- Espacial (2026) alongside Omega and Bulin 47, and in La Esquina Ta' En
-- Candela, directed by Frank Perozo. occupations already held actor, and now
-- there is something behind it.
--
-- SOURCES: his own YouTube channel and its thirty video titles, which are the
-- collaboration list. His own Instagram. IMDb, for the four films and the
-- character names -- full cast pages, not just the summary line. BuenaMusica,
-- Rate Your Music, Prensa y Gente and TheCityCeleb for the legal name and birth
-- date. El Nuevo Diario, 3 May 2021, for the record with Andry La Melodía.
-- Minuto a Minuto, 1 March 2021, for Haz Tu Vida. English Wikipedia's Malú
-- Trevejo article for Culo Chapa. Event listings from Connecticut, Detroit,
-- Baltimore and Peru for the touring.
--
-- NOT WRITTEN: no follower counts, no view counts, and nothing about his private
-- life. The number 930,000 appears in this note as evidence that the stored
-- handle was wrong; it does not appear in the biography.
--
-- NOT LINKED, AND THERE ARE A LOT. Malú Trevejo is Cuban-American and Aleesha
-- works out of Barcelona. Jay Wheeler and Yandel, his co-stars in Flow Calle,
-- are Puerto Rican. The Dominicans without entries -- Maicol 30, Carlito la
-- Tabla, El Símbolo RD, Yaya La Voz, July Queen, Harryson, Briante, Chakorta, El
-- Blintel, Aleica, Cotiza Billone, Lely 90, La Menor Queen, Chuky de Lewa, 3730,
-- Yustin NR, El Completo RD, Onguito Wa, El Domy, Andry La Melodía, LR Ley del
-- Rap, Dinero 4 Life, Skary Movie, La Prendía, Harrayao RD, A Star, Ranxel,
-- Elvis Boss and Anndel King -- are a whole layer of the dembow scene and go on
-- the missing list as a block.
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
       name = 'Haraca Kiko',
       sort_name = 'Haraca Kiko',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urbano',
       date_of_birth = '1989-07-08',
       birth_year = 1989,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Gary',
       middle_name = 'Alexander',
       last_name = 'Reyes',
       second_last_name = 'Aquino',
       stage_name = 'Haraca Kiko',
       aliases = ARRAY[]::text[],
       occupations = '["actor","composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urban-dembow']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@haracakiko',
       facebook = 'HaracaKikoBookingsRD',
       instagram = 'haracakikoOficial',
       disambiguation = 'Dembow singer and screen actor; Tukuntazo, Los Bobo Son Mío',
       bio_en = 'Haraca Kiko, born Gary Alexander Reyes Aquino, is a Dominican dembow singer and screen actor. He is one of the most-featured voices in the genre, and he has turned that into a second career in Dominican cinema.

**Tukuntazo**

The record that put him in front of an audience outside the country was made with Tokischa and El Cherry Scom. It is the kind of dembow that exports: a hook built out of one word, a beat with nothing in it that does not need to be there, and three performers who do not sound like each other.

Los Bobo Son Mío is the other one everybody knows, and Pila de Bobo came after it. He works the same joke and the same swagger across a career, which in dembow is not laziness — it is how a persona gets built and kept.

**The featured artist**

Scroll his catalogue and it is mostly other people’s names beside his own. El Gueso with Onguito Wa and El Cherry Scom. The China o Japón remix with El Mayor Clásico, Yomel el Meloso and three more. Axi90 with Shadow Blow. Fofo B12 with Ceky Viciny. Culo Chapa, a record by the Cuban-American singer Malú Trevejo, with him and Químico Ultra Mega on it.

Dembow is a collaborative economy more than a soloist’s genre. A verse costs a favour, a remix can carry six names, and the artists who thrive are the ones everybody wants on the track. He is one of those.

**El Mangú, Pio, Chucky La Crema**

The film work started with Flow Calle, where he plays a character called El Mangú. Then La Familia, as Pio La Ditingancia. Then Los Rechazados, as Chucky La Crema, and its sequel, which puts him on screen with Omega and Bulin 47.

The character names tell you what he is cast as and why it works. Dominican comedy has been drawing its actors from the barrio-comedy circuit and from television for decades; taking them from dembow instead is recent, and it is the same instinct — hire the person the audience already recognises and let him be himself with a script around him.

**On the road**

He tours constantly and mostly abroad: Connecticut, Detroit, Baltimore, and as far as Peru. The Dominican dembow circuit in the United States runs through club nights in cities with a large Dominican population, and it is a working artist’s living rather than an arena career.

That is the shape of the genre right now. The songs travel on phones, the money is in the room, and the artists who last are the ones willing to be in it.',
       bio_es = 'Haraca Kiko, de nombre Gary Alexander Reyes Aquino, es cantante de dembow y actor dominicano. Es una de las voces más invitadas del género, y de ahí se armó una segunda carrera en el cine dominicano.

**Tukuntazo**

El disco que lo puso delante de un público fuera del país lo hizo con Tokischa y El Cherry Scom. Es la clase de dembow que se exporta: un gancho armado con una sola palabra, un beat sin nada que no haga falta, y tres intérpretes que no se parecen entre sí.

Los Bobo Son Mío es el otro que todo el mundo conoce, y Pila de Bobo vino detrás. Trabaja el mismo chiste y la misma chulería a lo largo de una carrera, que en el dembow no es pereza: es como se construye y se sostiene un personaje.

**El invitado**

Si uno baja por su catálogo, lo que hay al lado de su nombre son casi siempre nombres ajenos. El Gueso con Onguito Wa y El Cherry Scom. El remix de China o Japón con El Mayor Clásico, Yomel el Meloso y tres más. Axi90 con Shadow Blow. Fofo B12 con Ceky Viciny. Culo Chapa, un tema de la cubanoamericana Malú Trevejo, con él y Químico Ultra Mega encima.

El dembow es una economía de colaboración más que un género de solistas. Una estrofa cuesta un favor, un remix puede cargar seis nombres, y los que prosperan son aquellos a quienes todo el mundo quiere en el tema. Él es de esos.

**El Mangú, Pio, Chucky La Crema**

El cine empezó con Flow Calle, donde hace un personaje llamado El Mangú. Después La Familia, como Pio La Ditingancia. Después Los Rechazados, como Chucky La Crema, y su secuela, que lo pone en pantalla con Omega y Bulin 47.

Los nombres de los personajes dicen de qué lo contratan y por qué funciona. La comedia dominicana lleva décadas sacando sus actores del circuito del humor de barrio y de la televisión; sacarlos del dembow es reciente, y es el mismo instinto: contratar al que el público ya reconoce y dejarlo ser él con un guion alrededor.

**En carretera**

Se pasa el año de gira y casi siempre afuera: Connecticut, Detroit, Baltimore, y hasta Perú. El circuito del dembow dominicano en Estados Unidos va por noches de club en ciudades con mucha población dominicana, y es el sustento de un artista que trabaja, no una carrera de estadios.

Esa es la forma del género ahora mismo. Las canciones viajan en los teléfonos, el dinero está en el salón, y los que duran son los que están dispuestos a estar ahí adentro.',
       updated_at = now()
 WHERE slug = 'haraca-kiko';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'haraca-kiko')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'haraca-kiko')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Haraca Kiko, born Gary Alexander Reyes Aquino, is a Dominican dembow singer and screen actor. He is one of the most-featured voices in the genre, and he has turned that into a second career in Dominican cinema.","type":"text"}]},{"type":"paragraph","content":[{"text":"Tukuntazo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The record that put him in front of an audience outside the country was made with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3e1718be-c12d-42f5-85e7-2156d9574940","displayText":"Tokischa","occurrenceId":"57c7583c-9cc2-40e3-a220-76cb3b54db06"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0b2e1a39-b265-42d6-95d5-85ad930eee84","displayText":"El Cherry Scom","occurrenceId":"1d9904d1-302e-4628-b6e3-dc00a4f504d2"}},{"text":". It is the kind of dembow that exports: a hook built out of one word, a beat with nothing in it that does not need to be there, and three performers who do not sound like each other.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los Bobo Son Mío is the other one everybody knows, and Pila de Bobo came after it. He works the same joke and the same swagger across a career, which in dembow is not laziness — it is how a persona gets built and kept.","type":"text"}]},{"type":"paragraph","content":[{"text":"The featured artist","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Scroll his catalogue and it is mostly other people’s names beside his own. El Gueso with Onguito Wa and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0b2e1a39-b265-42d6-95d5-85ad930eee84","displayText":"El Cherry Scom","occurrenceId":"2c72304f-3ef7-4474-a41c-5ff240b86d53"}},{"text":". The China o Japón remix with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"518354a4-7cb9-4c39-a2b8-9fa4d18f50db","displayText":"El Mayor Clásico","occurrenceId":"2d6e539f-247c-4cc6-96d9-1607cf50a7db"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bb07dcb8-444f-4a68-a668-21e9e038f335","displayText":"Yomel el Meloso","occurrenceId":"8002d901-97a5-4837-9f75-8cf3fc28b45a"}},{"text":" and three more. Axi90 with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"b3841446-0bdb-48f5-9ace-b492db7d9be2","displayText":"Shadow Blow","occurrenceId":"2a439cd6-51ca-4a87-9f29-0e658b1e37cd"}},{"text":". Fofo B12 with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"741eb4c0-4ab8-4ad5-8a64-2f156da6a395","displayText":"Ceky Viciny","occurrenceId":"7ec0b57e-ebc7-4a86-b5c0-6beeab3b7f40"}},{"text":". Culo Chapa, a record by the Cuban-American singer Malú Trevejo, with him and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"de562eb7-a0fb-49c2-a3c8-db97a4be80e3","displayText":"Químico Ultra Mega","occurrenceId":"f27ddb46-4d4f-42da-8f27-30a8db3112cc"}},{"text":" on it.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dembow is a collaborative economy more than a soloist’s genre. A verse costs a favour, a remix can carry six names, and the artists who thrive are the ones everybody wants on the track. He is one of those.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Mangú, Pio, Chucky La Crema","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The film work started with Flow Calle, where he plays a character called El Mangú. Then La Familia, as Pio La Ditingancia. Then Los Rechazados, as Chucky La Crema, and its sequel, which puts him on screen with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6159dc70-bd8f-439d-bf17-5d690262e5cb","displayText":"Omega","occurrenceId":"c05d320a-940f-41b9-a4d9-089732928048"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"550df3b5-6488-4aec-a476-a5d28d52ceea","displayText":"Bulin 47","occurrenceId":"2725e331-8165-4ea6-bbba-d3c8d17ac831"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"The character names tell you what he is cast as and why it works. Dominican comedy has been drawing its actors from the barrio-comedy circuit and from television for decades; taking them from dembow instead is recent, and it is the same instinct — hire the person the audience already recognises and let him be himself with a script around him.","type":"text"}]},{"type":"paragraph","content":[{"text":"On the road","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He tours constantly and mostly abroad: Connecticut, Detroit, Baltimore, and as far as Peru. The Dominican dembow circuit in the United States runs through club nights in cities with a large Dominican population, and it is a working artist’s living rather than an arena career.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is the shape of the genre right now. The songs travel on phones, the money is in the room, and the artists who last are the ones willing to be in it.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'haraca-kiko'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Haraca Kiko, de nombre Gary Alexander Reyes Aquino, es cantante de dembow y actor dominicano. Es una de las voces más invitadas del género, y de ahí se armó una segunda carrera en el cine dominicano.","type":"text"}]},{"type":"paragraph","content":[{"text":"Tukuntazo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El disco que lo puso delante de un público fuera del país lo hizo con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3e1718be-c12d-42f5-85e7-2156d9574940","displayText":"Tokischa","occurrenceId":"25243c11-1484-48d4-9268-ae5dea713dd0"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0b2e1a39-b265-42d6-95d5-85ad930eee84","displayText":"El Cherry Scom","occurrenceId":"19adf01b-82ce-4bc3-9621-06ac241c26b2"}},{"text":". Es la clase de dembow que se exporta: un gancho armado con una sola palabra, un beat sin nada que no haga falta, y tres intérpretes que no se parecen entre sí.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los Bobo Son Mío es el otro que todo el mundo conoce, y Pila de Bobo vino detrás. Trabaja el mismo chiste y la misma chulería a lo largo de una carrera, que en el dembow no es pereza: es como se construye y se sostiene un personaje.","type":"text"}]},{"type":"paragraph","content":[{"text":"El invitado","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Si uno baja por su catálogo, lo que hay al lado de su nombre son casi siempre nombres ajenos. El Gueso con Onguito Wa y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0b2e1a39-b265-42d6-95d5-85ad930eee84","displayText":"El Cherry Scom","occurrenceId":"c424210a-8834-4359-9db8-9681c414cc0d"}},{"text":". El remix de China o Japón con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"518354a4-7cb9-4c39-a2b8-9fa4d18f50db","displayText":"El Mayor Clásico","occurrenceId":"33abd1c5-107f-4285-82da-a5cff1570b27"}},{"text":", ","type":"text"},{"type":"artistReference","attrs":{"artistId":"bb07dcb8-444f-4a68-a668-21e9e038f335","displayText":"Yomel el Meloso","occurrenceId":"5c7bec14-4433-402f-980d-3d0a59c57444"}},{"text":" y tres más. Axi90 con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"b3841446-0bdb-48f5-9ace-b492db7d9be2","displayText":"Shadow Blow","occurrenceId":"2fd9538e-4127-41c9-8dbd-dff4ba7a77b8"}},{"text":". Fofo B12 con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"741eb4c0-4ab8-4ad5-8a64-2f156da6a395","displayText":"Ceky Viciny","occurrenceId":"84593525-2ac3-4ac1-9588-65912cf502a5"}},{"text":". Culo Chapa, un tema de la cubanoamericana Malú Trevejo, con él y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"de562eb7-a0fb-49c2-a3c8-db97a4be80e3","displayText":"Químico Ultra Mega","occurrenceId":"cfa0ac33-b9b2-49ca-b27a-7b7b9a74e757"}},{"text":" encima.","type":"text"}]},{"type":"paragraph","content":[{"text":"El dembow es una economía de colaboración más que un género de solistas. Una estrofa cuesta un favor, un remix puede cargar seis nombres, y los que prosperan son aquellos a quienes todo el mundo quiere en el tema. Él es de esos.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Mangú, Pio, Chucky La Crema","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El cine empezó con Flow Calle, donde hace un personaje llamado El Mangú. Después La Familia, como Pio La Ditingancia. Después Los Rechazados, como Chucky La Crema, y su secuela, que lo pone en pantalla con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6159dc70-bd8f-439d-bf17-5d690262e5cb","displayText":"Omega","occurrenceId":"cce1754c-b6b4-4c10-953f-53320fb248f1"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"550df3b5-6488-4aec-a476-a5d28d52ceea","displayText":"Bulin 47","occurrenceId":"658d5c17-c754-4d90-a686-c329d58470ef"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Los nombres de los personajes dicen de qué lo contratan y por qué funciona. La comedia dominicana lleva décadas sacando sus actores del circuito del humor de barrio y de la televisión; sacarlos del dembow es reciente, y es el mismo instinto: contratar al que el público ya reconoce y dejarlo ser él con un guion alrededor.","type":"text"}]},{"type":"paragraph","content":[{"text":"En carretera","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Se pasa el año de gira y casi siempre afuera: Connecticut, Detroit, Baltimore, y hasta Perú. El circuito del dembow dominicano en Estados Unidos va por noches de club en ciudades con mucha población dominicana, y es el sustento de un artista que trabaja, no una carrera de estadios.","type":"text"}]},{"type":"paragraph","content":[{"text":"Esa es la forma del género ahora mismo. Las canciones viajan en los teléfonos, el dinero está en el salón, y los que duran son los que están dispuestos a estar ahí adentro.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'haraca-kiko'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'haraca-kiko') AND locale = 'en'), '1d9904d1-302e-4628-b6e3-dc00a4f504d2', 'artist', '0b2e1a39-b265-42d6-95d5-85ad930eee84');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'haraca-kiko') AND locale = 'en'), '2725e331-8165-4ea6-bbba-d3c8d17ac831', 'artist', '550df3b5-6488-4aec-a476-a5d28d52ceea');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'haraca-kiko') AND locale = 'en'), '2a439cd6-51ca-4a87-9f29-0e658b1e37cd', 'artist', 'b3841446-0bdb-48f5-9ace-b492db7d9be2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'haraca-kiko') AND locale = 'en'), '2c72304f-3ef7-4474-a41c-5ff240b86d53', 'artist', '0b2e1a39-b265-42d6-95d5-85ad930eee84');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'haraca-kiko') AND locale = 'en'), '2d6e539f-247c-4cc6-96d9-1607cf50a7db', 'artist', '518354a4-7cb9-4c39-a2b8-9fa4d18f50db');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'haraca-kiko') AND locale = 'en'), '57c7583c-9cc2-40e3-a220-76cb3b54db06', 'artist', '3e1718be-c12d-42f5-85e7-2156d9574940');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'haraca-kiko') AND locale = 'en'), '7ec0b57e-ebc7-4a86-b5c0-6beeab3b7f40', 'artist', '741eb4c0-4ab8-4ad5-8a64-2f156da6a395');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'haraca-kiko') AND locale = 'en'), '8002d901-97a5-4837-9f75-8cf3fc28b45a', 'artist', 'bb07dcb8-444f-4a68-a668-21e9e038f335');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'haraca-kiko') AND locale = 'en'), 'c05d320a-940f-41b9-a4d9-089732928048', 'artist', '6159dc70-bd8f-439d-bf17-5d690262e5cb');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'haraca-kiko') AND locale = 'en'), 'f27ddb46-4d4f-42da-8f27-30a8db3112cc', 'artist', 'de562eb7-a0fb-49c2-a3c8-db97a4be80e3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'haraca-kiko') AND locale = 'es'), '19adf01b-82ce-4bc3-9621-06ac241c26b2', 'artist', '0b2e1a39-b265-42d6-95d5-85ad930eee84');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'haraca-kiko') AND locale = 'es'), '25243c11-1484-48d4-9268-ae5dea713dd0', 'artist', '3e1718be-c12d-42f5-85e7-2156d9574940');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'haraca-kiko') AND locale = 'es'), '2fd9538e-4127-41c9-8dbd-dff4ba7a77b8', 'artist', 'b3841446-0bdb-48f5-9ace-b492db7d9be2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'haraca-kiko') AND locale = 'es'), '33abd1c5-107f-4285-82da-a5cff1570b27', 'artist', '518354a4-7cb9-4c39-a2b8-9fa4d18f50db');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'haraca-kiko') AND locale = 'es'), '5c7bec14-4433-402f-980d-3d0a59c57444', 'artist', 'bb07dcb8-444f-4a68-a668-21e9e038f335');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'haraca-kiko') AND locale = 'es'), '658d5c17-c754-4d90-a686-c329d58470ef', 'artist', '550df3b5-6488-4aec-a476-a5d28d52ceea');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'haraca-kiko') AND locale = 'es'), '84593525-2ac3-4ac1-9588-65912cf502a5', 'artist', '741eb4c0-4ab8-4ad5-8a64-2f156da6a395');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'haraca-kiko') AND locale = 'es'), 'c424210a-8834-4359-9db8-9681c414cc0d', 'artist', '0b2e1a39-b265-42d6-95d5-85ad930eee84');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'haraca-kiko') AND locale = 'es'), 'cce1754c-b6b4-4c10-953f-53320fb248f1', 'artist', '6159dc70-bd8f-439d-bf17-5d690262e5cb');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'haraca-kiko') AND locale = 'es'), 'cfa0ac33-b9b2-49ca-b27a-7b7b9a74e757', 'artist', 'de562eb7-a0fb-49c2-a3c8-db97a4be80e3');

COMMIT;
