BEGIN;

-- Rewrite the catalogue entry for Jhoni The Voice.
--
-- Jhoni The Voice. Filler in English, nothing in Spanish, no disambiguation --
-- and the filler paragraph said he was "connected to Nueva York" over a row that
-- says Santiago de los Caballeros. Both are half right, and the entry is the
-- explanation.
--
-- A ROC NATION ARTIST. His label's own page is the best source here and it opens
-- "Born Johnathan Ramos in Santiago, Dominican Republic, Jhoni The Voice is a
-- singer, songwriter, and multi-instrumentalist (piano, guitar) who now resides
-- in Miami, FL." That confirms the birthplace, the instruments the row already
-- held, and where he lives now.
--
-- THE FIRST NAME GAINS AN H. The row had "Jonathan". Roc Nation's page and a
-- full press biography both spell it **Johnathan**. Changed on those two, and
-- flagged rather than treated as settled -- it is one letter and no official
-- document was seen.
--
-- THE DISPLAY NAME IS RESTYLED. The row read "Jhoni the Voice" with a lower-case
-- "the". His YouTube channel, his Instagram, Roc Nation, Spotify and Apple all
-- write "Jhoni The Voice". name, sort_name and stage_name all take the capital.
--
-- THE ALIAS WAS A FRAGMENT. aliases held ["Jonathan"], which is just his first
-- name, already in first_name. Replaced with "Jhoni", which is what his own
-- Instagram display name reads.
--
-- date_of_birth 1990-10-22 was already stored and Rate Your Music gives 22
-- October 1990. Not touched. province Santiago and birth_place Santiago de los
-- Caballeros are confirmed by Roc Nation and not touched either.
--
-- THE FACEBOOK FIELD IS KEPT, AND THAT IS A DELIBERATE DEPARTURE FROM THE
-- PREVIOUS TWO ENTRIES. The page his own channel links,
-- facebook.com/officialjhonithevoice, is gone -- "este contenido no está
-- disponible". What the row stores, facebook.com/jhonithevoice, is a personal
-- profile, which is the same situation that got the field cleared on Fritz
-- Abreu. The difference is what the profile is doing: 1,500 friends, and he
-- posts his releases on it, most recently a record called CRUZ with Oliver Kid.
-- It functions as his artist presence, so it stays. Fritz Abreu's had 144
-- friends and cover photos. Same principle, opposite answers.
--
-- ADDED: occupations producer and engineer beside composer. The engineer is not
-- a guess -- he holds a Bachelor's in Recording Arts from Full Sail University,
-- class of 2011, which his own Facebook education field confirms independently
-- of the press biography, and Roc Nation describes him as "known for his
-- expertise in vocal production". genres gains urban-trap. disambiguation.
--
-- A CREDIT VERIFIED PROPERLY. English Wikipedia's Henry Santos article says an
-- album of his featured Jhoni The Voice. Which one it does not say. Chasing it
-- down: "Hasta En Tus Sueños (feat. Jhoni the Voice)", track 8 of Henry The
-- Third (Deluxe), released 4 March 2016 -- confirmed on Spotify, Apple Music,
-- Amazon, Beatport and Shazam. Linked.
--
-- SOURCES: rocnation.com's artist page. His own YouTube channel -- thirty video
-- titles and the About panel with eleven outbound links. His own Instagram and
-- Facebook. A long press biography published by LURP on 23 March 2021, which is
-- artist-supplied and is the only source for most of the early career; it is
-- used for facts and its claims are attributed where they cannot be checked.
-- Rate Your Music for the birth date. Shazam and Apple Music for the recent
-- releases and their label. Genius for the Palms and Waves track list.
--
-- NOT USED. The LURP biography leads with stream counts, view counts, iTunes
-- chart positions and playlist placements. None of it is here. It also claims a
-- "Best Original Idea" prize at the 2016 Video Clip Awards in the Dominican
-- Republic for the video El Narrador; no independent record of that award was
-- found, so it is written as what his own biography says and NO awards row is
-- created -- the same treatment Gabriel Pagán's four self-declared Soberanos got.
--
-- NOT WRITTEN: his marriage, which his Facebook profile displays.
--
-- NOT LINKED. Bachata Gang has an entry but it is needs_review, so Sabanas
-- Mojadas is named without a link -- publishing that row would make the link
-- work. Feid, Juan Magán, Kevin Roldán, Nicky Jam, De La Ghetto, Fuego, Don
-- Omar, Daddy Yankee, Juanes, Thalía, 3BallMTY, Los Rakas, King Los and Breakfast
-- N Vegas are not Dominican. Romeo Santos has no entry, which is the third time
-- in this run. Lito Kirino, Mel Granda, Motiff, Gino Mella, SNOVA, Nueva Vista,
-- Macotea, Oliver Kid and the duo LD & Jhoni have no entries.
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
       name = 'Jhoni The Voice',
       sort_name = 'Jhoni The Voice',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'bachata',
       date_of_birth = '1990-10-22',
       birth_year = 1990,
       date_of_death = NULL,
       birth_place = 'Santiago de los Caballeros',
       province = 'Santiago',
       first_name = 'Johnathan',
       middle_name = NULL,
       last_name = 'Ramos',
       second_last_name = NULL,
       stage_name = 'Jhoni The Voice',
       aliases = ARRAY['Jhoni']::text[],
       occupations = '["composer","producer","engineer"]'::jsonb,
       instruments = ARRAY['voice', 'piano', 'guitar']::text[],
       genres = ARRAY['urbano', 'urban-trap']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@JhoniTheVoice',
       facebook = 'jhonithevoice',
       instagram = 'jhonithevoice',
       disambiguation = 'Singer, songwriter and producer signed to Roc Nation Latin; works out of Miami',
       bio_en = 'Jhoni The Voice, born Johnathan Ramos, is a Dominican singer, songwriter, producer and recording engineer. He was born in Santiago, raised in New York from the age of six, and works now out of Miami, signed to Roc Nation Latin.

**Learning the room, then the desk**

He was singing for family before he was old enough to know it was a skill, and by eleven he was writing and producing his own material. The unusual part is what came next: instead of pursuing a record deal he went to Orlando and took a degree in recording arts.

That is a rare route for a Dominican singer and it shows in what he is hired for. His label describes him as known for vocal production, which is a specific craft — deciding how a voice should sit in a record, how many takes to stack, where the emotion actually lives in a performance.

He is a multi-instrumentalist on piano and guitar, and he is a self-taught singer. The engineering is the part he was formally trained in.

**Opening acts and features**

The early years were spent as the other name on the poster. He opened for Romeo Santos, Don Omar, Daddy Yankee, Juanes and Juan Luis Guerra 4.40 — five acts that between them cover most of what Latin music was selling that decade — and half of one of a duo, LD & Jhoni, before going solo.

Hasta En Tus Sueños, with Henry Santos, is the clearest Dominican credit he has: a bachata on the deluxe edition of an album by a founding member of the group that rebuilt the genre for an American audience. He has also cut records with Poeta Callejero and Messiah.

**The catalogue under his own name**

His first EP arrived under his own name and the singles kept coming: Bonita, Heroé, Farolito, Dime, El Narrador, Frágiles — the last with a Colombian guest on the remix. Heroé turned up on the soundtrack of an American television drama, which is the kind of placement that pays a songwriter properly.

He works in English too. Look at You and Can’t Get Enough Of You are his, and he has debuted singles on American radio in both languages. Sin Escaleras, U Found Me, Se Supone and Desnúdate are more recent.

**Palms N Wavs**

The imprint on his current releases is his own: Palms N Wavs. Sabanas Mojadas came out on it with the group Bachata Gang, and MORENA, from the JTV EP, is filed as afrobeat — a Dominican in Miami making West African-derived pop in Spanish, which is where a lot of Caribbean music is currently heading.

His own summary of what he does is one word: kingmaker. It is a producer’s word rather than a singer’s, and it is the honest description of a career spent making other people’s records sound like themselves.',
       bio_es = 'Jhoni The Voice, de nombre Johnathan Ramos, es cantante, compositor, productor e ingeniero de grabación dominicano. Nació en Santiago, se crió en Nueva York desde los seis años, y hoy trabaja desde Miami, firmado con Roc Nation Latin.

**Primero la sala, después la consola**

Cantaba para la familia antes de tener edad para saber que eso era una destreza, y a los once ya componía y producía lo suyo. Lo raro es lo que vino después: en vez de salir a buscar un contrato se fue a Orlando y sacó un título en artes de la grabación.

Es una ruta poco común para un cantante dominicano y se le nota en lo que lo contratan. Su sello lo describe como especialista en producción vocal, que es un oficio concreto: decidir cómo se sienta una voz dentro de un disco, cuántas tomas apilar, dónde está de verdad la emoción de una interpretación.

Toca piano y guitarra, y cantar lo aprendió solo. Lo único que estudió formalmente es la ingeniería.

**Telonero y artista invitado**

Los primeros años los pasó siendo el otro nombre del afiche. Le abrió a Romeo Santos, a Don Omar, a Daddy Yankee, a Juanes y a Juan Luis Guerra 4.40 —cinco actos que entre todos cubren casi todo lo que vendía la música latina esa década— y fue la mitad de un dúo, LD & Jhoni, antes de irse solo.

Hasta En Tus Sueños, con Henry Santos, es el crédito dominicano más claro que tiene: una bachata en la edición deluxe del disco de un miembro fundador del grupo que le rearmó el género a un público estadounidense. También ha grabado con Poeta Callejero y con Messiah.

**El catálogo con su nombre**

Su primer EP salió con su propio nombre y los sencillos no pararon: Bonita, Heroé, Farolito, Dime, El Narrador, Frágiles, esta última con un invitado colombiano en el remix. Heroé apareció en la banda sonora de una serie dramática estadounidense, que es la clase de colocación que le paga bien a un autor.

También trabaja en inglés. Look at You y Can’t Get Enough Of You son suyas, y ha estrenado sencillos en radio estadounidense en los dos idiomas. Sin Escaleras, U Found Me, Se Supone y Desnúdate son más recientes.

**Palms N Wavs**

El sello de sus lanzamientos actuales es suyo: Palms N Wavs. Por ahí salió Sabanas Mojadas, con el grupo Bachata Gang, y MORENA, del EP JTV, está fichada como afrobeat: un dominicano en Miami haciendo pop de raíz africana occidental en español, que es hacia donde va buena parte de la música caribeña ahora mismo.

El resumen que él hace de su oficio es una sola palabra: kingmaker, el que hace reyes. Es palabra de productor y no de cantante, y describe con honestidad una carrera dedicada a que los discos de otros suenen a lo que esos otros son.',
       updated_at = now()
 WHERE slug = 'jhoni-the-voice';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jhoni-the-voice')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jhoni-the-voice')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Jhoni The Voice, born Johnathan Ramos, is a Dominican singer, songwriter, producer and recording engineer. He was born in Santiago, raised in New York from the age of six, and works now out of Miami, signed to Roc Nation Latin.","type":"text"}]},{"type":"paragraph","content":[{"text":"Learning the room, then the desk","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He was singing for family before he was old enough to know it was a skill, and by eleven he was writing and producing his own material. The unusual part is what came next: instead of pursuing a record deal he went to Orlando and took a degree in recording arts.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is a rare route for a Dominican singer and it shows in what he is hired for. His label describes him as known for vocal production, which is a specific craft — deciding how a voice should sit in a record, how many takes to stack, where the emotion actually lives in a performance.","type":"text"}]},{"type":"paragraph","content":[{"text":"He is a multi-instrumentalist on piano and guitar, and he is a self-taught singer. The engineering is the part he was formally trained in.","type":"text"}]},{"type":"paragraph","content":[{"text":"Opening acts and features","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The early years were spent as the other name on the poster. He opened for Romeo Santos, Don Omar, Daddy Yankee, Juanes and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"10034596-47cb-46ba-9e80-9ea319a2c0df","displayText":"Juan Luis Guerra 4.40","occurrenceId":"d7a9b34f-4225-479f-93ea-05af1ac5c837"}},{"text":" — five acts that between them cover most of what Latin music was selling that decade — and half of one of a duo, LD & Jhoni, before going solo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Hasta En Tus Sueños, with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8dcfc4e1-9af4-4378-9e19-52573af429a7","displayText":"Henry Santos","occurrenceId":"9783ae3b-0500-4130-b43b-b195818ef3f0"}},{"text":", is the clearest Dominican credit he has: a bachata on the deluxe edition of an album by a founding member of the group that rebuilt the genre for an American audience. He has also cut records with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cea4b00e-cabe-48a8-9e1b-13b72a92d10a","displayText":"Poeta Callejero","occurrenceId":"fe74b1a9-fc8f-4963-a1f9-9be6fa118b23"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"73cac635-71c3-407f-b9f5-02a705d6956b","displayText":"Messiah","occurrenceId":"a3a769b6-760f-4728-aa73-e6e091143792"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"The catalogue under his own name","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"His first EP arrived under his own name and the singles kept coming: Bonita, Heroé, Farolito, Dime, El Narrador, Frágiles — the last with a Colombian guest on the remix. Heroé turned up on the soundtrack of an American television drama, which is the kind of placement that pays a songwriter properly.","type":"text"}]},{"type":"paragraph","content":[{"text":"He works in English too. Look at You and Can’t Get Enough Of You are his, and he has debuted singles on American radio in both languages. Sin Escaleras, U Found Me, Se Supone and Desnúdate are more recent.","type":"text"}]},{"type":"paragraph","content":[{"text":"Palms N Wavs","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The imprint on his current releases is his own: Palms N Wavs. Sabanas Mojadas came out on it with the group Bachata Gang, and MORENA, from the JTV EP, is filed as afrobeat — a Dominican in Miami making West African-derived pop in Spanish, which is where a lot of Caribbean music is currently heading.","type":"text"}]},{"type":"paragraph","content":[{"text":"His own summary of what he does is one word: kingmaker. It is a producer’s word rather than a singer’s, and it is the honest description of a career spent making other people’s records sound like themselves.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'jhoni-the-voice'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Jhoni The Voice, de nombre Johnathan Ramos, es cantante, compositor, productor e ingeniero de grabación dominicano. Nació en Santiago, se crió en Nueva York desde los seis años, y hoy trabaja desde Miami, firmado con Roc Nation Latin.","type":"text"}]},{"type":"paragraph","content":[{"text":"Primero la sala, después la consola","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Cantaba para la familia antes de tener edad para saber que eso era una destreza, y a los once ya componía y producía lo suyo. Lo raro es lo que vino después: en vez de salir a buscar un contrato se fue a Orlando y sacó un título en artes de la grabación.","type":"text"}]},{"type":"paragraph","content":[{"text":"Es una ruta poco común para un cantante dominicano y se le nota en lo que lo contratan. Su sello lo describe como especialista en producción vocal, que es un oficio concreto: decidir cómo se sienta una voz dentro de un disco, cuántas tomas apilar, dónde está de verdad la emoción de una interpretación.","type":"text"}]},{"type":"paragraph","content":[{"text":"Toca piano y guitarra, y cantar lo aprendió solo. Lo único que estudió formalmente es la ingeniería.","type":"text"}]},{"type":"paragraph","content":[{"text":"Telonero y artista invitado","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Los primeros años los pasó siendo el otro nombre del afiche. Le abrió a Romeo Santos, a Don Omar, a Daddy Yankee, a Juanes y a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"10034596-47cb-46ba-9e80-9ea319a2c0df","displayText":"Juan Luis Guerra 4.40","occurrenceId":"b2f2f8fd-7d7b-4342-ad4c-154d2d6cfa02"}},{"text":" —cinco actos que entre todos cubren casi todo lo que vendía la música latina esa década— y fue la mitad de un dúo, LD & Jhoni, antes de irse solo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Hasta En Tus Sueños, con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"8dcfc4e1-9af4-4378-9e19-52573af429a7","displayText":"Henry Santos","occurrenceId":"fb224578-055c-4b27-8d4a-50b0223f87e8"}},{"text":", es el crédito dominicano más claro que tiene: una bachata en la edición deluxe del disco de un miembro fundador del grupo que le rearmó el género a un público estadounidense. También ha grabado con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cea4b00e-cabe-48a8-9e1b-13b72a92d10a","displayText":"Poeta Callejero","occurrenceId":"340f6da4-d65f-4856-8e57-9599c01f135e"}},{"text":" y con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"73cac635-71c3-407f-b9f5-02a705d6956b","displayText":"Messiah","occurrenceId":"9ee69089-053c-4db0-ba4b-3e9c9296efc6"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"El catálogo con su nombre","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Su primer EP salió con su propio nombre y los sencillos no pararon: Bonita, Heroé, Farolito, Dime, El Narrador, Frágiles, esta última con un invitado colombiano en el remix. Heroé apareció en la banda sonora de una serie dramática estadounidense, que es la clase de colocación que le paga bien a un autor.","type":"text"}]},{"type":"paragraph","content":[{"text":"También trabaja en inglés. Look at You y Can’t Get Enough Of You son suyas, y ha estrenado sencillos en radio estadounidense en los dos idiomas. Sin Escaleras, U Found Me, Se Supone y Desnúdate son más recientes.","type":"text"}]},{"type":"paragraph","content":[{"text":"Palms N Wavs","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El sello de sus lanzamientos actuales es suyo: Palms N Wavs. Por ahí salió Sabanas Mojadas, con el grupo Bachata Gang, y MORENA, del EP JTV, está fichada como afrobeat: un dominicano en Miami haciendo pop de raíz africana occidental en español, que es hacia donde va buena parte de la música caribeña ahora mismo.","type":"text"}]},{"type":"paragraph","content":[{"text":"El resumen que él hace de su oficio es una sola palabra: kingmaker, el que hace reyes. Es palabra de productor y no de cantante, y describe con honestidad una carrera dedicada a que los discos de otros suenen a lo que esos otros son.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'jhoni-the-voice'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jhoni-the-voice') AND locale = 'en'), '9783ae3b-0500-4130-b43b-b195818ef3f0', 'artist', '8dcfc4e1-9af4-4378-9e19-52573af429a7');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jhoni-the-voice') AND locale = 'en'), 'a3a769b6-760f-4728-aa73-e6e091143792', 'artist', '73cac635-71c3-407f-b9f5-02a705d6956b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jhoni-the-voice') AND locale = 'en'), 'd7a9b34f-4225-479f-93ea-05af1ac5c837', 'artist', '10034596-47cb-46ba-9e80-9ea319a2c0df');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jhoni-the-voice') AND locale = 'en'), 'fe74b1a9-fc8f-4963-a1f9-9be6fa118b23', 'artist', 'cea4b00e-cabe-48a8-9e1b-13b72a92d10a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jhoni-the-voice') AND locale = 'es'), '340f6da4-d65f-4856-8e57-9599c01f135e', 'artist', 'cea4b00e-cabe-48a8-9e1b-13b72a92d10a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jhoni-the-voice') AND locale = 'es'), '9ee69089-053c-4db0-ba4b-3e9c9296efc6', 'artist', '73cac635-71c3-407f-b9f5-02a705d6956b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jhoni-the-voice') AND locale = 'es'), 'b2f2f8fd-7d7b-4342-ad4c-154d2d6cfa02', 'artist', '10034596-47cb-46ba-9e80-9ea319a2c0df');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jhoni-the-voice') AND locale = 'es'), 'fb224578-055c-4b27-8d4a-50b0223f87e8', 'artist', '8dcfc4e1-9af4-4378-9e19-52573af429a7');

COMMIT;
