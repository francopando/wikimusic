BEGIN;

-- Rewrite the catalogue entry for Jhonny Evidence.
--
-- Jhonny Evidence. Filler in English, nothing in Spanish, no aliases, no
-- genres, no disambiguation -- and a last_name field that read "Evidence",
-- which is not his surname and is not anybody's surname.
--
-- THE NAME FIELDS WERE HOLDING THE STAGE NAME. The row had first_name "Jhonny"
-- and last_name "Evidence". His legal name is Jhonny Alberto Henríquez Guerrero,
-- which he states himself in the biography on his own YouTube channel and which
-- PromoMusicBCN, a Barcelona outlet, printed independently in February 2021:
-- "Jhonny Alberto Henriquez Guerrero, mas conocido en todo el mundo como Jhonny
-- Evidence". Corrected across all four name fields.
--
-- sort_name CHANGES TOO, AND FOR A REASON WORTH STATING. It read "Evidence,
-- Jhonny", which sorts him under E as though Evidence were a surname. It is a
-- word he chose. The whole stage name goes in instead, so he sorts under J,
-- where anyone looking for him would look. This is the opposite call from Frank
-- Reyes and Kiko Rodríguez, who sort under their stage surname because in both
-- those cases the stage surname is a real second surname.
--
-- LEFT ALONE, ALL CONFIRMED BEFORE WRITING: date_of_birth 1987-01-14, which his
-- own biography gives as "a los 14 días del mes de enero del año 1987"; province
-- La Altagracia and birth_place Salvaleón de Higüey, which his Facebook profile
-- confirms twice over ("Vive en Higüey, La Altagracia" and "De Higüey, La
-- Altagracia"); gender, primary_role and primary_genre.
--
-- THE STORED FACEBOOK HANDLE IS RIGHT AND THE ONE ON HIS CHANNEL IS DEAD. The
-- row holds "bachata.time.5", which looks like nothing and is in fact his public
-- creator profile -- 3,800 followers, listed as from Higüey, and with an
-- employment entry reading "Eqs musica, Vocal Artist, desde el 15 mar. 2023".
-- The page his own channel links, id 107514011171730, returns "este contenido no
-- está disponible". Third time in this run that an artist's own outbound link
-- has gone stale while the row's odd-looking value turned out to be correct.
--
-- THAT EMPLOYMENT LINE IS ALSO THE DATE FOR THE LABEL. EQS Música describes
-- itself as a bachata label operating across the Americas, Europe and parts of
-- Asia. His Facebook says he has been its vocal artist since March 2023, which
-- dates the whole current phase of his career and is better evidence than any
-- press release.
--
-- genres IS LEFT EMPTY. Every bachata subgenre slug in the table is inactive --
-- the same wall hit on Kiko Rodríguez and Delfín Tu Salsero -- and nothing else
-- active describes him.
--
-- website IS NOT FILLED. His channel lists eqsmusica.com under "Website", but
-- that is his label's site, not his. A label URL in an artist's website field
-- would be wrong.
--
-- A CREDIT READ CAREFULLY RATHER THAN GUESSED. The video "Brujería" is billed
-- "Jhonny Evidence X DerekVinci X Luis & Andrea", which looks like a
-- three-artist record. The press release says otherwise: it is "Jhonny Evidence
-- y DerekVinci, acompañados por El Tiguere y los destacados BAILARINES Luis y
-- Andrea". Luis y Andrea are a dance couple, not vocalists. They are described
-- here as what they are.
--
-- SOURCES: his own YouTube channel -- the biography in the About panel, which is
-- the only account of his early life that exists, and thirty video titles. His
-- own Instagram, for the booking contacts, and his own Facebook, for the
-- birthplace and the EQS start date. PromoMusicBCN, February 2021, for the legal
-- name. eqsmusica.com for what the label is. EQS press releases carried by
-- Faranduleando ERVP, Diario Más Noticias and Máxima FM for Brujería, Sube el
-- Telón, Si No Te Amara and Muriendo Solo.
--
-- NOT WRITTEN: no follower counts. His biography says his father wanted him to
-- study law and that he later did; that is education and career, not private
-- life, and it stays. Nothing about family beyond that.
--
-- NOT LINKED: DerekVinci, who produces essentially everything he releases and is
-- the single largest gap this entry opens. Also Eri Rey, Milena, Joel Santos, DJ
-- Khalid, El Tiguere, Bachata Sweet, Laura Alcoba and the group Evolution.
-- Luis y Andrea are dancers, not recording artists, and are not added.
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
       name = 'Jhonny Evidence',
       sort_name = 'Jhonny Evidence',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'bachata',
       date_of_birth = '1987-01-14',
       birth_year = 1987,
       date_of_death = NULL,
       birth_place = 'Salvaleón de Higüey',
       province = 'La Altagracia',
       first_name = 'Jhonny',
       middle_name = 'Alberto',
       last_name = 'Henríquez',
       second_last_name = 'Guerrero',
       stage_name = 'Jhonny Evidence',
       aliases = ARRAY[]::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@jhonnyevidence',
       facebook = 'bachata.time.5',
       instagram = 'jhonnyevidenceofficial',
       disambiguation = 'Bachata singer from Higüey on the EQS Música label; works the European dance circuit',
       bio_en = 'Jhonny Evidence, born Jhonny Alberto Henríquez Guerrero, is a Dominican bachata singer from Higüey. He has a law degree he does not use and a catalogue of records made for dancers on the other side of the Atlantic.

**The wooden guitar**

By his own account he was the quiet one at school with the music going on inside, and at some point as a child he built himself a small guitar out of wood and strung it with nylon.

His father wanted a lawyer, and he did eventually take the degree — which is a very ordinary Dominican story and the reason a lot of good musicians are found in offices. He did both.

At sixteen he joined a bachata group called Evolution and recorded on their album Sentimientos. On it he sang a duet with Ramón Orlando, which is an extraordinary first credit: one of the most decorated arrangers and bandleaders in Dominican music, on a teenager’s first record.

**EQS Música**

Since 2023 he has been the vocal artist of EQS Música, a label built entirely around bachata and around getting it out of the country — the Americas, Europe, and as far as parts of Asia. His bookings run through an agency in Spain.

That is a completely different business from Dominican bachata radio. The audience is dance schools and festivals, the records are chosen for what a couple can do on a floor, and a song succeeds in Milan or Warsaw without ever being played in Santo Domingo.

**The producer on every record**

Almost everything he has released is billed with DerekVinci, who produces it: Muriendo Solo, Las Penas, Condéname, Salvaje, Sube El Telón, Coleccionando Heridas, Así Es El Amor, Se Murió Cupido, Infiel, Pa Que Me Digas, Se Acabó El Amor. Perdido, Cantinero and La Pastilla are his alone.

A singer who puts his producer’s name in the title of every release is doing something deliberate. In a genre where the arranger is usually invisible, this is a partnership presented as one.

**The dancers in the credits**

Brujería was released with a dance couple, Luis y Andrea, named in the billing alongside the singers. That is worth pausing on: in the international bachata scene the dancers are not illustration, they are why the record travels, and a label crediting them on the front of a release is being accurate about who does the work.

The songs themselves stay where bachata has always been — cheating, drinking, being left, being the one who left. Coleccionando Heridas, collecting wounds, is a good title for the whole catalogue.',
       bio_es = 'Jhonny Evidence, de nombre Jhonny Alberto Henríquez Guerrero, es cantante de bachata dominicano, de Higüey. Tiene un título de abogado que no usa y un catálogo de discos hechos para bailadores del otro lado del Atlántico.

**La guitarra de madera**

Según él mismo cuenta, era el callado del curso con la música por dentro, y en algún momento de niño se fabricó una guitarrita de madera y le puso cuerdas de nylon.

Su padre quería un abogado, y con los años él cursó la carrera; que es una historia dominicana de lo más corriente y la razón por la que hay muy buenos músicos metidos en oficinas. Hizo las dos cosas.

A los dieciséis entró a un grupo de bachata llamado Evolution y grabó en su disco Sentimientos. Ahí cantó a dúo con Ramón Orlando, que es un primer crédito extraordinario: uno de los arreglistas y directores más premiados de la música dominicana, en el primer disco de un adolescente.

**EQS Música**

Desde 2023 es el artista vocal de EQS Música, un sello armado enteramente alrededor de la bachata y de sacarla del país: las Américas, Europa y hasta partes de Asia. Sus contrataciones pasan por una agencia en España.

Ese es un negocio completamente distinto al de la radio bachatera dominicana. El público son escuelas de baile y festivales, los discos se escogen por lo que una pareja puede hacerles en una pista, y una canción pega en Milán o en Varsovia sin que la pongan nunca en Santo Domingo.

**El productor en todos los discos**

Casi todo lo que ha sacado va anunciado junto a DerekVinci, que se lo produce: Muriendo Solo, Las Penas, Condéname, Salvaje, Sube El Telón, Coleccionando Heridas, Así Es El Amor, Se Murió Cupido, Infiel, Pa Que Me Digas, Se Acabó El Amor. Perdido, Cantinero y La Pastilla son suyas solas.

Un cantante que le mete el nombre del productor al título de cada lanzamiento está haciendo algo a propósito. En un género donde el arreglista suele ser invisible, esto es una sociedad presentada como tal.

**Los bailarines en los créditos**

Brujería salió con una pareja de baile, Luis y Andrea, nombrada en el anuncio al lado de los cantantes. Vale detenerse ahí: en la escena internacional de la bachata los bailarines no son ilustración, son la razón por la que el disco viaja, y un sello que los acredita al frente de un lanzamiento está siendo exacto sobre quién hace el trabajo.

Las canciones se quedan donde siempre ha estado la bachata: la infidelidad, el trago, el que se queda, el que se fue. Coleccionando Heridas es un buen título para el catálogo entero.',
       updated_at = now()
 WHERE slug = 'jhonny-evidence';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jhonny-evidence')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jhonny-evidence')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Jhonny Evidence, born Jhonny Alberto Henríquez Guerrero, is a Dominican bachata singer from Higüey. He has a law degree he does not use and a catalogue of records made for dancers on the other side of the Atlantic.","type":"text"}]},{"type":"paragraph","content":[{"text":"The wooden guitar","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"By his own account he was the quiet one at school with the music going on inside, and at some point as a child he built himself a small guitar out of wood and strung it with nylon.","type":"text"}]},{"type":"paragraph","content":[{"text":"His father wanted a lawyer, and he did eventually take the degree — which is a very ordinary Dominican story and the reason a lot of good musicians are found in offices. He did both.","type":"text"}]},{"type":"paragraph","content":[{"text":"At sixteen he joined a bachata group called Evolution and recorded on their album Sentimientos. On it he sang a duet with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"63cfeda9-4df8-49cd-b46c-3f2361a1e801"}},{"text":", which is an extraordinary first credit: one of the most decorated arrangers and bandleaders in Dominican music, on a teenager’s first record.","type":"text"}]},{"type":"paragraph","content":[{"text":"EQS Música","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Since 2023 he has been the vocal artist of EQS Música, a label built entirely around bachata and around getting it out of the country — the Americas, Europe, and as far as parts of Asia. His bookings run through an agency in Spain.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is a completely different business from Dominican bachata radio. The audience is dance schools and festivals, the records are chosen for what a couple can do on a floor, and a song succeeds in Milan or Warsaw without ever being played in Santo Domingo.","type":"text"}]},{"type":"paragraph","content":[{"text":"The producer on every record","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Almost everything he has released is billed with DerekVinci, who produces it: Muriendo Solo, Las Penas, Condéname, Salvaje, Sube El Telón, Coleccionando Heridas, Así Es El Amor, Se Murió Cupido, Infiel, Pa Que Me Digas, Se Acabó El Amor. Perdido, Cantinero and La Pastilla are his alone.","type":"text"}]},{"type":"paragraph","content":[{"text":"A singer who puts his producer’s name in the title of every release is doing something deliberate. In a genre where the arranger is usually invisible, this is a partnership presented as one.","type":"text"}]},{"type":"paragraph","content":[{"text":"The dancers in the credits","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Brujería was released with a dance couple, Luis y Andrea, named in the billing alongside the singers. That is worth pausing on: in the international bachata scene the dancers are not illustration, they are why the record travels, and a label crediting them on the front of a release is being accurate about who does the work.","type":"text"}]},{"type":"paragraph","content":[{"text":"The songs themselves stay where bachata has always been — cheating, drinking, being left, being the one who left. Coleccionando Heridas, collecting wounds, is a good title for the whole catalogue.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'jhonny-evidence'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Jhonny Evidence, de nombre Jhonny Alberto Henríquez Guerrero, es cantante de bachata dominicano, de Higüey. Tiene un título de abogado que no usa y un catálogo de discos hechos para bailadores del otro lado del Atlántico.","type":"text"}]},{"type":"paragraph","content":[{"text":"La guitarra de madera","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Según él mismo cuenta, era el callado del curso con la música por dentro, y en algún momento de niño se fabricó una guitarrita de madera y le puso cuerdas de nylon.","type":"text"}]},{"type":"paragraph","content":[{"text":"Su padre quería un abogado, y con los años él cursó la carrera; que es una historia dominicana de lo más corriente y la razón por la que hay muy buenos músicos metidos en oficinas. Hizo las dos cosas.","type":"text"}]},{"type":"paragraph","content":[{"text":"A los dieciséis entró a un grupo de bachata llamado Evolution y grabó en su disco Sentimientos. Ahí cantó a dúo con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"02f23257-1cf6-4a4c-8df1-1f9aa630a2c3","displayText":"Ramón Orlando","occurrenceId":"7d7a8d18-99a6-411e-94ac-c781e97337d9"}},{"text":", que es un primer crédito extraordinario: uno de los arreglistas y directores más premiados de la música dominicana, en el primer disco de un adolescente.","type":"text"}]},{"type":"paragraph","content":[{"text":"EQS Música","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Desde 2023 es el artista vocal de EQS Música, un sello armado enteramente alrededor de la bachata y de sacarla del país: las Américas, Europa y hasta partes de Asia. Sus contrataciones pasan por una agencia en España.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ese es un negocio completamente distinto al de la radio bachatera dominicana. El público son escuelas de baile y festivales, los discos se escogen por lo que una pareja puede hacerles en una pista, y una canción pega en Milán o en Varsovia sin que la pongan nunca en Santo Domingo.","type":"text"}]},{"type":"paragraph","content":[{"text":"El productor en todos los discos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Casi todo lo que ha sacado va anunciado junto a DerekVinci, que se lo produce: Muriendo Solo, Las Penas, Condéname, Salvaje, Sube El Telón, Coleccionando Heridas, Así Es El Amor, Se Murió Cupido, Infiel, Pa Que Me Digas, Se Acabó El Amor. Perdido, Cantinero y La Pastilla son suyas solas.","type":"text"}]},{"type":"paragraph","content":[{"text":"Un cantante que le mete el nombre del productor al título de cada lanzamiento está haciendo algo a propósito. En un género donde el arreglista suele ser invisible, esto es una sociedad presentada como tal.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los bailarines en los créditos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Brujería salió con una pareja de baile, Luis y Andrea, nombrada en el anuncio al lado de los cantantes. Vale detenerse ahí: en la escena internacional de la bachata los bailarines no son ilustración, son la razón por la que el disco viaja, y un sello que los acredita al frente de un lanzamiento está siendo exacto sobre quién hace el trabajo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Las canciones se quedan donde siempre ha estado la bachata: la infidelidad, el trago, el que se queda, el que se fue. Coleccionando Heridas es un buen título para el catálogo entero.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'jhonny-evidence'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jhonny-evidence') AND locale = 'en'), '63cfeda9-4df8-49cd-b46c-3f2361a1e801', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'jhonny-evidence') AND locale = 'es'), '7d7a8d18-99a6-411e-94ac-c781e97337d9', 'artist', '02f23257-1cf6-4a4c-8df1-1f9aa630a2c3');

COMMIT;
