BEGIN;

-- Rewrite the catalogue entry for Sandro Reyes.
--
-- Sandro Reyes. Filler in English, nothing in Spanish -- on a bachatero who has
-- put out something like twenty-five singles in a decade.
--
-- CONFLATION WARNING, and it made the research slow: he is not Sandy Reyes, the
-- merengue singer whose entry was written the day before this one. Dominican
-- social media mixes the two constantly, and several of the pages that surfaced
-- under his name are about Sandy. Everything used here names Sandro.
--
-- LEFT ALONE AND FLAGGED: province "Distrito Nacional" and birth_place "Santo
-- Domingo". A comment repeated across many Dominican pages calls him "un musico
-- de nuestro pueblo de Los Rios", and Los Rios is a sector of the Distrito
-- Nacional, so the stored province is consistent. The sector itself is not
-- written into birth_place because the only source for it is recycled social
-- media text, and no date of birth is published anywhere found.
--
-- ADDED: composer in occupations. He writes what he sings.
--
-- A RELATIONSHIP NOT ASSERTED, and this is the careful part: "Te Voy A Tener
-- Que Bloquear" was produced by Edilio Armando Paredes at Imperio Nano Music,
-- who announced it himself. He is NOT necessarily Edilio Paredes, the requinto
-- player in this catalogue. A commenter on his own page asks him "Usted es hijo
-- de la vieja leyenda Edilio Paredes??" and the question is not answered there,
-- and the same page posts about "la leyenda Edilio Paredes" in the third
-- person. The two are therefore treated as different people, the catalogue's
-- Edilio Paredes is not referenced for this credit, and the producer is named
-- in prose. Worth resolving.
--
-- ALSO NOT ASSERTED: his own page captions a photograph with Teodoro Reyes
-- "padre e hijo musicalmente hablando". That phrase means musically speaking --
-- a teacher and a follower, not a family. No family relationship is claimed here
-- and none is added to artist_family_relationships.
--
-- SOURCES: MusicBrainz, which files him as a bachata singer with country DO and
-- carries the singles run -- La Carcel (2012), Mi Hijo Debe Nacer and Mi
-- Guitarra (2016), El Amor de su Vida, Me Enamore de Ti, Mala Esposa, No Conoce
-- el Amor and Ya Tengo un Nuevo Amor (2017), Culpa de los Dos (2018), Se Me
-- Complico el Asunto, Nada Es Mas Bello Que Tu, Buscate Otra Pa' Que La
-- Olvides, Enamorados de la Misma Mujer, No Es Pa Competir con Nadie, Ya Te
-- Olvide and Te Quite la Mujer (2019), A Lo Mejor, A Beber y a Gozar, Dejenme
-- Beber and Mi Sexto Sentido Eres Tu (2020), Me Abandonaste and Tu Carnaval
-- Paso (2021), Tu Papel de Padre and Quiero Romo (2022), Me Desperte (2023) --
-- and his own site, sandroreyes.com. Edilio Armando Paredes's own announcement
-- of the production of Te Voy A Tener Que Bloquear. His own page, on the public
-- reconciliation with Frank Reyes and on the photograph with Teodoro Reyes.
--
-- NOT WRITTEN: the recording titled Cristo Me Limpio, which sits among his
-- secular singles. Naming it would invite a conversion narrative, and the
-- catalogue does not carry those.
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
       name = 'Sandro Reyes',
       sort_name = 'Reyes, Sandro',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'bachata',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Sandro',
       middle_name = NULL,
       last_name = 'Reyes',
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY[]::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@sandrobachata',
       facebook = 'SandroReyesBachata',
       instagram = 'sandroreyesoficial',
       disambiguation = 'Dominican bachata singer and songwriter; not Sandy Reyes',
       bio_en = 'Sandro Reyes is a Dominican bachata singer and songwriter. Dominican listeners place him in Los Ríos, and he has released something close to twenty-five singles since 2012.

**The singles economy**

There is no album in his catalogue. There is a single, and then another one, and then another — La Cárcel, Mi Guitarra, Mala Esposa, Culpa de los Dos, Búscate Otra Pa’ Que La Olvides, Ya Te Olvidé, Te Quité la Mujer, Déjenme Beber, Me Abandonaste, Quiero Romo, Me Desperté. In some years there are four or five.

That is how bachata is now made and it is a real change. The genre used to run on LPs, and a singer had one good record every two or three years. A modern bachatero releases continuously because the platforms reward presence over event, and a song that does not catch costs almost nothing to have made.

**What he writes about**

The titles are the argument. Mala Esposa, Enamorados de la Misma Mujer, No Es Pa Competir con Nadie, Te Quité la Mujer, Se Me Complicó el Asunto. Bachata has been telling the same story for sixty years — somebody else has her, and the singer is going to say so out loud — and he tells it without dressing it up.

Two of them step outside that. Mi Hijo Debe Nacer and Tu Papel de Padre are about fathers, and they are the songs his own audience quotes back at him.

**Inside the trade**

Te Voy A Tener Que Bloquear was produced by Edilio Armando Paredes at Imperio Nano Music — a title only possible in this decade, since blocking somebody is a modern way of ending it and bachata has always taken its images from whatever ending is available.

He works inside the guitar-bachata world rather than beside it. He has been photographed with Teodoro Reyes, and he and Frank Reyes made a public point of settling a quarrel. That world runs on exactly this: who is playing on your record, who will stand next to you, and who is not speaking to you this year.

The line he belongs to runs back through Luis Segura — the amargue sung straight, with a requinto over it and no apology for what it is about.',
       bio_es = 'Sandro Reyes es un cantante y compositor de bachata dominicano. Los oyentes dominicanos lo ubican en Los Ríos, y desde 2012 lleva publicados cerca de veinticinco sencillos.

**La economía del sencillo**

En su catálogo no hay álbum. Hay un sencillo, y después otro, y después otro: La Cárcel, Mi Guitarra, Mala Esposa, Culpa de los Dos, Búscate Otra Pa’ Que La Olvides, Ya Te Olvidé, Te Quité la Mujer, Déjenme Beber, Me Abandonaste, Quiero Romo, Me Desperté. Hay años con cuatro o cinco.

Así se hace hoy la bachata y es un cambio de verdad. El género funcionaba con elepés, y un cantante sacaba un buen disco cada dos o tres años. Un bachatero moderno publica sin parar porque las plataformas premian la presencia antes que el acontecimiento, y una canción que no pega casi no cuesta nada haberla hecho.

**De qué escribe**

Los títulos son el argumento. Mala Esposa, Enamorados de la Misma Mujer, No Es Pa Competir con Nadie, Te Quité la Mujer, Se Me Complicó el Asunto. La bachata lleva sesenta años contando la misma historia —la tiene otro, y el cantante lo va a decir en voz alta— y él la cuenta sin vestirla.

Dos se salen de ahí. Mi Hijo Debe Nacer y Tu Papel de Padre hablan de padres, y son las canciones que su propio público le devuelve citadas.

**Dentro del oficio**

Te Voy A Tener Que Bloquear la produjo Edilio Armando Paredes en Imperio Nano Music: un título que solo era posible en esta década, porque bloquear a alguien es una manera moderna de terminar y la bachata siempre ha sacado sus imágenes del final que tenga a mano.

Trabaja dentro del mundo de la bachata de guitarra y no al lado. Se ha fotografiado con Teodoro Reyes, y él y Frank Reyes hicieron público que arreglaron una pelea. Ese mundo funciona exactamente con eso: quién toca en tu disco, quién se para a tu lado y quién no te habla este año.

La línea a la que pertenece viene de atrás, de Luis Segura; el amargue cantado derecho, con un requinto encima y sin pedirle disculpas a nadie por el asunto.',
       updated_at = now()
 WHERE slug = 'sandro-reyes';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'sandro-reyes')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'sandro-reyes')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Sandro Reyes is a Dominican bachata singer and songwriter. Dominican listeners place him in Los Ríos, and he has released something close to twenty-five singles since 2012.","type":"text"}]},{"type":"paragraph","content":[{"text":"The singles economy","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"There is no album in his catalogue. There is a single, and then another one, and then another — La Cárcel, Mi Guitarra, Mala Esposa, Culpa de los Dos, Búscate Otra Pa’ Que La Olvides, Ya Te Olvidé, Te Quité la Mujer, Déjenme Beber, Me Abandonaste, Quiero Romo, Me Desperté. In some years there are four or five.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is how bachata is now made and it is a real change. The genre used to run on LPs, and a singer had one good record every two or three years. A modern bachatero releases continuously because the platforms reward presence over event, and a song that does not catch costs almost nothing to have made.","type":"text"}]},{"type":"paragraph","content":[{"text":"What he writes about","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The titles are the argument. Mala Esposa, Enamorados de la Misma Mujer, No Es Pa Competir con Nadie, Te Quité la Mujer, Se Me Complicó el Asunto. Bachata has been telling the same story for sixty years — somebody else has her, and the singer is going to say so out loud — and he tells it without dressing it up.","type":"text"}]},{"type":"paragraph","content":[{"text":"Two of them step outside that. Mi Hijo Debe Nacer and Tu Papel de Padre are about fathers, and they are the songs his own audience quotes back at him.","type":"text"}]},{"type":"paragraph","content":[{"text":"Inside the trade","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Te Voy A Tener Que Bloquear was produced by Edilio Armando Paredes at Imperio Nano Music — a title only possible in this decade, since blocking somebody is a modern way of ending it and bachata has always taken its images from whatever ending is available.","type":"text"}]},{"type":"paragraph","content":[{"text":"He works inside the guitar-bachata world rather than beside it. He has been photographed with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"97aba7a6-2428-4540-8ddd-79ea8c487e36","displayText":"Teodoro Reyes","occurrenceId":"f43effbb-faf8-4768-8118-b0d2ea85f674"}},{"text":", and he and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3dd83e6b-2058-4d04-ac68-38e11d9348a9","displayText":"Frank Reyes","occurrenceId":"ead4fa59-a6c7-4559-94f9-e1b5d3f03d57"}},{"text":" made a public point of settling a quarrel. That world runs on exactly this: who is playing on your record, who will stand next to you, and who is not speaking to you this year.","type":"text"}]},{"type":"paragraph","content":[{"text":"The line he belongs to runs back through ","type":"text"},{"type":"artistReference","attrs":{"artistId":"5ceceef0-765d-4e01-8017-85422a263357","displayText":"Luis Segura","occurrenceId":"eff6c112-d67f-4e6d-92f7-82baf3303038"}},{"text":" — the amargue sung straight, with a requinto over it and no apology for what it is about.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'sandro-reyes'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Sandro Reyes es un cantante y compositor de bachata dominicano. Los oyentes dominicanos lo ubican en Los Ríos, y desde 2012 lleva publicados cerca de veinticinco sencillos.","type":"text"}]},{"type":"paragraph","content":[{"text":"La economía del sencillo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En su catálogo no hay álbum. Hay un sencillo, y después otro, y después otro: La Cárcel, Mi Guitarra, Mala Esposa, Culpa de los Dos, Búscate Otra Pa’ Que La Olvides, Ya Te Olvidé, Te Quité la Mujer, Déjenme Beber, Me Abandonaste, Quiero Romo, Me Desperté. Hay años con cuatro o cinco.","type":"text"}]},{"type":"paragraph","content":[{"text":"Así se hace hoy la bachata y es un cambio de verdad. El género funcionaba con elepés, y un cantante sacaba un buen disco cada dos o tres años. Un bachatero moderno publica sin parar porque las plataformas premian la presencia antes que el acontecimiento, y una canción que no pega casi no cuesta nada haberla hecho.","type":"text"}]},{"type":"paragraph","content":[{"text":"De qué escribe","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Los títulos son el argumento. Mala Esposa, Enamorados de la Misma Mujer, No Es Pa Competir con Nadie, Te Quité la Mujer, Se Me Complicó el Asunto. La bachata lleva sesenta años contando la misma historia —la tiene otro, y el cantante lo va a decir en voz alta— y él la cuenta sin vestirla.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dos se salen de ahí. Mi Hijo Debe Nacer y Tu Papel de Padre hablan de padres, y son las canciones que su propio público le devuelve citadas.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dentro del oficio","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Te Voy A Tener Que Bloquear la produjo Edilio Armando Paredes en Imperio Nano Music: un título que solo era posible en esta década, porque bloquear a alguien es una manera moderna de terminar y la bachata siempre ha sacado sus imágenes del final que tenga a mano.","type":"text"}]},{"type":"paragraph","content":[{"text":"Trabaja dentro del mundo de la bachata de guitarra y no al lado. Se ha fotografiado con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"97aba7a6-2428-4540-8ddd-79ea8c487e36","displayText":"Teodoro Reyes","occurrenceId":"ca1b637a-678e-445e-b633-15dcb2632c16"}},{"text":", y él y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3dd83e6b-2058-4d04-ac68-38e11d9348a9","displayText":"Frank Reyes","occurrenceId":"48637801-d55f-4647-aea6-b73192f4c961"}},{"text":" hicieron público que arreglaron una pelea. Ese mundo funciona exactamente con eso: quién toca en tu disco, quién se para a tu lado y quién no te habla este año.","type":"text"}]},{"type":"paragraph","content":[{"text":"La línea a la que pertenece viene de atrás, de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"5ceceef0-765d-4e01-8017-85422a263357","displayText":"Luis Segura","occurrenceId":"a71924b5-050e-4f41-b701-bd4773953f05"}},{"text":"; el amargue cantado derecho, con un requinto encima y sin pedirle disculpas a nadie por el asunto.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'sandro-reyes'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'sandro-reyes') AND locale = 'en'), 'ead4fa59-a6c7-4559-94f9-e1b5d3f03d57', 'artist', '3dd83e6b-2058-4d04-ac68-38e11d9348a9');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'sandro-reyes') AND locale = 'en'), 'eff6c112-d67f-4e6d-92f7-82baf3303038', 'artist', '5ceceef0-765d-4e01-8017-85422a263357');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'sandro-reyes') AND locale = 'en'), 'f43effbb-faf8-4768-8118-b0d2ea85f674', 'artist', '97aba7a6-2428-4540-8ddd-79ea8c487e36');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'sandro-reyes') AND locale = 'es'), '48637801-d55f-4647-aea6-b73192f4c961', 'artist', '3dd83e6b-2058-4d04-ac68-38e11d9348a9');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'sandro-reyes') AND locale = 'es'), 'a71924b5-050e-4f41-b701-bd4773953f05', 'artist', '5ceceef0-765d-4e01-8017-85422a263357');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'sandro-reyes') AND locale = 'es'), 'ca1b637a-678e-445e-b633-15dcb2632c16', 'artist', '97aba7a6-2428-4540-8ddd-79ea8c487e36');

COMMIT;
