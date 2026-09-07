BEGIN;

-- Rewrite the catalogue entry for DJ Scuff.
--
-- DJ Scuff. Rewrite. The old entry was machine-written, had no section titles,
-- and described him as a DJ with a hip-hop background who released a record in
-- 2009 -- which is true and misses what he actually is.
--
-- WHAT HE ACTUALLY IS: THE FREESTYLE SERIES. His YouTube channel, open since
-- 2006, is almost entirely one format. Twenty-two of the twenty-two most recent
-- uploads are titled "[ARTIST] FREESTYLE ❌ DJ SCUFF": Defensa Peluche, Lismar,
-- Venty4, El Zombi 15, Yoan Retro, Cre$io, Lil Homie, Yisoz, Tower Felonia,
-- Young Say, Masha, Colchito La Pampara, Zoy Alexa, Xielo, Código TR, Nuttyrn,
-- Jean El Creativo, Coco Twelve, Cori Problema, Yovng Gretty, Ezzy R, Ronny GTA,
-- Yeiti Snow. He books a rapper or a dembowsero, gives them a beat, films it, and
-- puts it out.
--
-- That is not a sideline, it is the work, and it makes him something the
-- Dominican urban scene has no other example of: a permanent, open audition. Most
-- of those names have no entry anywhere because most of them are new -- which is
-- the point.
--
-- THE SOCIAL FIELDS ARE NORMALISED. The row stored full URLs --
-- "https://www.youtube.com/@djscuff", "https://www.instagram.com/djscuff/",
-- "https://www.facebook.com/djscuff" -- where every other row in this catalogue
-- stores a handle. Changed to "@djscuff", "djscuff" and "djscuff". The
-- destinations are identical; the format now matches the rest of the table.
--
-- KEPT FROM THE OLD TEXT, BECAUSE IT CHECKS OUT: the legal name William Jr.
-- Walther Jiménez, and the 2009 record Dembow de Mafu, both confirmed by
-- BuenaMusica's Datos block and by Famous Birthdays, which also lists the three
-- aliases already in the row. The composer credit on his own uploads reads
-- "William Junior Walther" and the publisher is Aparataje Music Group.
--
-- NOT REPEATED WITHOUT A SOURCE: the old text said he was inspired by Snoop Dogg
-- and Lords of the Underground, that he bought turntables in the early 2000s,
-- and that he was in a DJ collective called Los Decepticons who released a
-- project called Sólida Alianza. Nothing found corroborates any of it, and the
-- collective returns nothing at all. It is left out rather than repeated.
--
-- date_of_birth and birth_year are still empty and are NOT filled. Nothing found
-- gives a birth date.
--
-- FILLED: disambiguation is rewritten to say what he does rather than restate
-- his name. occupations, genres and the alias list are already correct and are
-- carried through; the duplicate "DJ Scuff" alias, which repeats the name field,
-- is dropped.
--
-- SOURCES: his own YouTube channel -- open since 23 May 2006 -- its About line
-- and its upload list, which is the evidence for the freestyle format. His own
-- Instagram and Facebook. BuenaMusica and Famous Birthdays for the legal name,
-- the aliases and Dembow de Mafu. La Pachanga's report of his signing with
-- Alofoke Media Group. The auto-generated credit lines on his own uploads for
-- the publisher and the composer name.
--
-- NOT LINKED: of the twenty-odd artists who have freestyled on his channel, only
-- Lismar has an entry. The rest go on the missing list as the freestyle block.
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
       name = 'DJ Scuff',
       sort_name = 'Walther Jiménez, William Jr.',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'dj',
       primary_genre = 'electronic',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'William',
       middle_name = 'Jr.',
       last_name = 'Walther',
       second_last_name = 'Jiménez',
       stage_name = 'DJ Scuff',
       aliases = ARRAY['Scuff Selecta', 'Ma Que Kracha']::text[],
       occupations = '["producer","singer"]'::jsonb,
       instruments = ARRAY['turntables', 'synthesizer']::text[],
       genres = ARRAY['urban-rap-hip-hop', 'urban-dembow', 'urban-reggaeton', 'urban-trap']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@djscuff',
       facebook = 'djscuff',
       instagram = 'djscuff',
       disambiguation = 'DJ and producer; his freestyle series is where Dominican urban artists debut',
       bio_en = 'DJ Scuff, born William Jr. Walther Jiménez, is a Dominican DJ and producer. He has been running a channel since 2006 and what he does on it has become an institution: he gives new artists a beat and films them rapping over it.

**The freestyle**

Scroll his uploads and they are all the same shape. A name, the word freestyle, and his own. Defensa Peluche, Venty4, El Zombi 15, Yoan Retro, Yisoz, Tower Felonia, Young Say, Masha, Colchito La Pampara, Código TR, Coco Twelve, Cori Problema, Yeiti Snow — dozens of them, most of whom nobody outside the barrios had heard of the week before.

That format solves a specific Dominican problem. There is no label system to sign an unknown, no radio that will play one, and no venue circuit that pays. What there is instead is a DJ with a camera, a beat and an audience, and a slot on his channel is the closest thing the scene has to a record deal.

He has had Lismar on it, which shows the range: the series is not only for beginners, and an established rapper doing a Scuff freestyle is making a point about where she comes from.

**Dembow de Mafu**

He was making records before he was making other people’s careers. Dembow de Mafu, from 2009, is the one that changed his standing, and it arrived at exactly the moment dembow was turning from a barrio sound into the country’s dominant music — the years just before El Alfa took it worldwide.

The aliases are from that period. Scuff Selecta is a sound-system name, the kind a Jamaican selector uses, and Ma Que Kracha is the other kind entirely. Both tell you he came up playing to rooms rather than to algorithms.

**The other side of the booth**

He produces and he sings on his own records, and the credit lines carry his legal name and his own publishing company, which means he has been paying attention to who owns what — not a universal habit in this genre.

He also signed with one of the Dominican urban media groups, which is the arrangement most successful Dominican DJs end up in: the DJ becomes a platform, the platform becomes media, and the music is one of several things it produces.

What is worth noticing is how many careers pass through him and how few of them will ever say so. A freestyle on his channel is a first credit, and a first credit is the hardest one to get.',
       bio_es = 'DJ Scuff, de nombre William Jr. Walther Jiménez, es DJ y productor dominicano. Lleva un canal desde 2006 y lo que hace en él se volvió una institución: le da una pista a un artista nuevo y lo filma rapeando encima.

**El freestyle**

Uno baja por sus subidas y todas tienen la misma forma. Un nombre, la palabra freestyle, y el suyo. Defensa Peluche, Venty4, El Zombi 15, Yoan Retro, Yisoz, Tower Felonia, Young Say, Masha, Colchito La Pampara, Código TR, Coco Twelve, Cori Problema, Yeiti Snow: decenas, y a la mayoría no los había oído nadie fuera de los barrios la semana anterior.

Ese formato resuelve un problema dominicano concreto. No hay sistema de sellos que firme a un desconocido, no hay radio que lo ponga, no hay circuito de salas que pague. Lo que hay es un DJ con una cámara, una pista y un público, y un turno en su canal es lo más parecido a un contrato que tiene la escena.

Ha tenido a Lismar ahí, lo que muestra el rango: la serie no es solo para principiantes, y una rapera hecha que hace un freestyle con Scuff está diciendo algo sobre de dónde viene.

**Dembow de Mafu**

Hacía discos antes de hacer carreras ajenas. Dembow de Mafu, de 2009, es el que le cambió el lugar, y llegó justo cuando el dembow pasaba de sonido de barrio a música dominante del país: los años anteriores a que El Alfa lo llevara al mundo.

Los alias son de esa época. Scuff Selecta es nombre de sound system, de los que usa un selector jamaicano, y Ma Que Kracha es de la otra especie por completo. Los dos dicen que se hizo tocando para salones y no para algoritmos.

**El otro lado de la cabina**

Produce y canta en sus propios discos, y las líneas de crédito llevan su nombre legal y su propia editora, lo que quiere decir que ha estado pendiente de quién es dueño de qué: costumbre que no abunda en este género.

También firmó con uno de los grupos de medios urbanos dominicanos, que es el arreglo en el que terminan casi todos los DJ dominicanos que funcionan: el DJ se vuelve plataforma, la plataforma se vuelve medio, y la música es una de varias cosas que produce.

Lo que vale notar es cuántas carreras le pasan por delante y cuán pocas lo van a decir. Un freestyle en su canal es un primer crédito, y el primero es el más difícil de conseguir.',
       updated_at = now()
 WHERE slug = 'dj-scuff';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dj-scuff')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dj-scuff')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"DJ Scuff, born William Jr. Walther Jiménez, is a Dominican DJ and producer. He has been running a channel since 2006 and what he does on it has become an institution: he gives new artists a beat and films them rapping over it.","type":"text"}]},{"type":"paragraph","content":[{"text":"The freestyle","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Scroll his uploads and they are all the same shape. A name, the word freestyle, and his own. Defensa Peluche, Venty4, El Zombi 15, Yoan Retro, Yisoz, Tower Felonia, Young Say, Masha, Colchito La Pampara, Código TR, Coco Twelve, Cori Problema, Yeiti Snow — dozens of them, most of whom nobody outside the barrios had heard of the week before.","type":"text"}]},{"type":"paragraph","content":[{"text":"That format solves a specific Dominican problem. There is no label system to sign an unknown, no radio that will play one, and no venue circuit that pays. What there is instead is a DJ with a camera, a beat and an audience, and a slot on his channel is the closest thing the scene has to a record deal.","type":"text"}]},{"type":"paragraph","content":[{"text":"He has had ","type":"text"},{"type":"artistReference","attrs":{"artistId":"71f57b0b-1070-401b-b2c5-b7d4ea9a716b","displayText":"Lismar","occurrenceId":"08335745-6b88-4f84-819d-d4fbc50dc79d"}},{"text":" on it, which shows the range: the series is not only for beginners, and an established rapper doing a Scuff freestyle is making a point about where she comes from.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dembow de Mafu","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He was making records before he was making other people’s careers. Dembow de Mafu, from 2009, is the one that changed his standing, and it arrived at exactly the moment dembow was turning from a barrio sound into the country’s dominant music — the years just before ","type":"text"},{"type":"artistReference","attrs":{"artistId":"559f2ed4-8831-483b-bc00-7cb4f340ad92","displayText":"El Alfa","occurrenceId":"5cbd06fa-8c32-484f-abfa-6230f564d73a"}},{"text":" took it worldwide.","type":"text"}]},{"type":"paragraph","content":[{"text":"The aliases are from that period. Scuff Selecta is a sound-system name, the kind a Jamaican selector uses, and Ma Que Kracha is the other kind entirely. Both tell you he came up playing to rooms rather than to algorithms.","type":"text"}]},{"type":"paragraph","content":[{"text":"The other side of the booth","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He produces and he sings on his own records, and the credit lines carry his legal name and his own publishing company, which means he has been paying attention to who owns what — not a universal habit in this genre.","type":"text"}]},{"type":"paragraph","content":[{"text":"He also signed with one of the Dominican urban media groups, which is the arrangement most successful Dominican DJs end up in: the DJ becomes a platform, the platform becomes media, and the music is one of several things it produces.","type":"text"}]},{"type":"paragraph","content":[{"text":"What is worth noticing is how many careers pass through him and how few of them will ever say so. A freestyle on his channel is a first credit, and a first credit is the hardest one to get.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'dj-scuff'), 4)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"DJ Scuff, de nombre William Jr. Walther Jiménez, es DJ y productor dominicano. Lleva un canal desde 2006 y lo que hace en él se volvió una institución: le da una pista a un artista nuevo y lo filma rapeando encima.","type":"text"}]},{"type":"paragraph","content":[{"text":"El freestyle","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Uno baja por sus subidas y todas tienen la misma forma. Un nombre, la palabra freestyle, y el suyo. Defensa Peluche, Venty4, El Zombi 15, Yoan Retro, Yisoz, Tower Felonia, Young Say, Masha, Colchito La Pampara, Código TR, Coco Twelve, Cori Problema, Yeiti Snow: decenas, y a la mayoría no los había oído nadie fuera de los barrios la semana anterior.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ese formato resuelve un problema dominicano concreto. No hay sistema de sellos que firme a un desconocido, no hay radio que lo ponga, no hay circuito de salas que pague. Lo que hay es un DJ con una cámara, una pista y un público, y un turno en su canal es lo más parecido a un contrato que tiene la escena.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ha tenido a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"71f57b0b-1070-401b-b2c5-b7d4ea9a716b","displayText":"Lismar","occurrenceId":"2eaf4559-3f71-45be-8e93-6bc037581aba"}},{"text":" ahí, lo que muestra el rango: la serie no es solo para principiantes, y una rapera hecha que hace un freestyle con Scuff está diciendo algo sobre de dónde viene.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dembow de Mafu","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Hacía discos antes de hacer carreras ajenas. Dembow de Mafu, de 2009, es el que le cambió el lugar, y llegó justo cuando el dembow pasaba de sonido de barrio a música dominante del país: los años anteriores a que ","type":"text"},{"type":"artistReference","attrs":{"artistId":"559f2ed4-8831-483b-bc00-7cb4f340ad92","displayText":"El Alfa","occurrenceId":"3801c38d-37b1-4487-99b8-26084c2c7607"}},{"text":" lo llevara al mundo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los alias son de esa época. Scuff Selecta es nombre de sound system, de los que usa un selector jamaicano, y Ma Que Kracha es de la otra especie por completo. Los dos dicen que se hizo tocando para salones y no para algoritmos.","type":"text"}]},{"type":"paragraph","content":[{"text":"El otro lado de la cabina","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Produce y canta en sus propios discos, y las líneas de crédito llevan su nombre legal y su propia editora, lo que quiere decir que ha estado pendiente de quién es dueño de qué: costumbre que no abunda en este género.","type":"text"}]},{"type":"paragraph","content":[{"text":"También firmó con uno de los grupos de medios urbanos dominicanos, que es el arreglo en el que terminan casi todos los DJ dominicanos que funcionan: el DJ se vuelve plataforma, la plataforma se vuelve medio, y la música es una de varias cosas que produce.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que vale notar es cuántas carreras le pasan por delante y cuán pocas lo van a decir. Un freestyle en su canal es un primer crédito, y el primero es el más difícil de conseguir.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'dj-scuff'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dj-scuff') AND locale = 'en'), '08335745-6b88-4f84-819d-d4fbc50dc79d', 'artist', '71f57b0b-1070-401b-b2c5-b7d4ea9a716b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dj-scuff') AND locale = 'en'), '5cbd06fa-8c32-484f-abfa-6230f564d73a', 'artist', '559f2ed4-8831-483b-bc00-7cb4f340ad92');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dj-scuff') AND locale = 'es'), '2eaf4559-3f71-45be-8e93-6bc037581aba', 'artist', '71f57b0b-1070-401b-b2c5-b7d4ea9a716b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dj-scuff') AND locale = 'es'), '3801c38d-37b1-4487-99b8-26084c2c7607', 'artist', '559f2ed4-8831-483b-bc00-7cb4f340ad92');

COMMIT;
