BEGIN;

-- Rewrite the catalogue entry for Ceky Viciny.
--
-- Ceky Viciny. Filler in English, nothing in Spanish, no gender, no
-- occupations, no genres, no aliases -- and, the reason this row scored where
-- it did, NOT A SINGLE SOCIAL ACCOUNT STORED, on an artist with a
-- million-and-a-half-subscriber channel and three hundred and seventy-nine
-- videos on it.
--
-- FILLED FROM HIS OWN ACCOUNTS: youtube @CekyViciny and instagram cekyviciny,
-- both confirmed by opening them rather than by guessing the handle. His
-- channel is billed "Canal Oficial de Ceky Viciny 'The King Yamaha'", which
-- gives the alias the row was also missing. He distributes through ONErpm.
--
-- CORRECTED: gender null -> male. primary_role singer stays; primary_genre
-- urban-dembow stays and is right.
--
-- ADDED: occupations composer, aliases The King Yamaha and Ceky Bichan, genres,
-- disambiguation.
--
-- LEFT ALONE AND FLAGGED: province "Distrito Nacional" and birth_place "Santo
-- Domingo", the importer's default. No source names a town or a barrio.
--
-- DATE CORROBORATED, NOT CHANGED. The row already held date_of_birth 12
-- December 1992 and birth_year 1992 from an earlier pass. BuenaMusica gives the
-- same day, month and year independently, so the stored date now has a source
-- behind it. Nothing was written.
--
-- SOURCES: MAE Music Group's artist page, which carries the fullest account of
-- the career and is the only place the early years are written down: the legal
-- name Aneurys René Mateo Medina, the mother who danced and the father who was
-- a disc jockey, the start in 2006 with the group The Ghetto, the 2012 duo Ceky
-- Bichan y La Tetera, the 2013 return as a soloist under the new name with the
-- single Bonitillo and its remix with Paramba, the labels Furia Musical Ent and
-- No Al Mareo Musical, and the song list -- El Sonido del 15, El Indio, El
-- Funeral, Muévelo, Cuando Freno, El You, Pa' los Tigueres, Blam Blam. His own
-- YouTube channel for everything since: Cuca with Monchy Cadena, El Punto with
-- Flow 28, De Show with La Perversa, Piedra a la Luna, Dale Que Te Dio, Papolo
-- Sácalo, No Se Tiren, Natural, No Bulto, and the two Casa de Alofoke seasons.
-- MusicBrainz for Domingo and El Cartón, 2019; the La Gente Ta' Loca remix and
-- Te Recordaré, 2020; Koké and the Nataly remix, 2021; Con Sonido, 2024; and
-- Pila de Enemigo, 2026. BuenaMusica for the birth date and the genres.
--
-- NOT WRITTEN: subscriber and view counts. Nothing about the "inconvenientes
-- personales" that MAE says broke up the duo; the source does not say what they
-- were and it is not the catalogue's business either way.
--
-- NOT LINKED: La Perversa, Monchy Cadena, El Shick, Capitán Aloo, El Marciano,
-- La Fruta, Andyyy Flow, Chaki Bley, El Mello 06, Darlyn Nay, Young Maelo, Mr
-- Manyao and Mapa Negro are Dominican and have no entries. Several are already
-- on the missing-artists list.
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
       name = 'Ceky Viciny',
       sort_name = 'Ceky Viciny',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urban-dembow',
       date_of_birth = '1992-12-12',
       birth_year = 1992,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Aneurys',
       middle_name = 'René',
       last_name = 'Mateo',
       second_last_name = 'Medina',
       stage_name = 'Ceky Viciny',
       aliases = ARRAY['The King Yamaha', 'Ceky Bichan']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'urban-rap-hip-hop']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@CekyViciny',
       facebook = NULL,
       instagram = 'cekyviciny',
       disambiguation = 'Dembow singer, born Aneurys René Mateo Medina; The King Yamaha',
       bio_en = 'Ceky Viciny, born Aneurys René Mateo Medina, is a Dominican dembow singer and songwriter. He has been recording since he was a teenager, under three different names, and has been at it long enough that the genre has changed shape twice around him.

**The Ghetto**

The music was in the house before he chose it: his mother danced and his father was a disc jockey. He started in 2006 with a group called The Ghetto, which puts him in the scene several years before dembow had a name anybody outside the barrio would recognise.

In 2012 he formed a duo, Ceky Bichan y La Tetera. It worked with audiences and then broke up.

**Bonitillo**

He came back in 2013 on his own, changed Bichan to Viciny, and cut Bonitillo. It was the first thing of his that travelled, and the remix put Paramba on it.

What followed is the ordinary working life of a dembow artist who lasts: El Sonido del 15, El Indio, El Funeral, Muévelo, Cuando Freno, Pa’ los Tigueres, Blam Blam, then Domingo and El Cartón, then Koké, Con Sonido and Pila de Enemigo. Records arrive, work for a season, and are replaced by the next one.

**The Casa de Alofoke seasons**

Two of his recent records were made inside La Casa de Alofoke, the Dominican reality format that puts artists in a house and films them working. De Show, cut there with La Perversa, was explicitly billed as two generations of dembow meeting; Natural came out of the same house. Puyalo Pantera produced work for him from the same period.

He also cut El Punto with Flow 28, and Cuca with Monchy Cadena.

**The King Yamaha**

The nickname is on his own channel and it is a small piece of Dominican vernacular doing a lot of work: a Yamaha is a motorbike, the motoconcho is how the barrio moves, and calling yourself its king places you exactly.

Nineteen years into the career he is still releasing, still distributing independently, and still working with people half his professional age. Very few dembow artists manage the second decade.',
       bio_es = 'Ceky Viciny, de nombre Aneurys René Mateo Medina, es cantante y compositor de dembow dominicano. Graba desde adolescente, bajo tres nombres distintos, y lleva tanto tiempo en esto que el género ha cambiado de forma dos veces a su alrededor.

**The Ghetto**

La música estaba en la casa antes de que él la escogiera: su madre era bailarina y su padre disc jockey. Empezó en 2006 con un grupo llamado The Ghetto, lo que lo pone en la escena varios años antes de que el dembow tuviera un nombre que alguien fuera del barrio reconociera.

En 2012 armó un dúo, Ceky Bichan y La Tetera. Funcionó con el público y después se rompió.

**Bonitillo**

Volvió en 2013 por su cuenta, le cambió Bichan por Viciny, y grabó Bonitillo. Fue lo primero suyo que viajó, y el remix metió a Paramba adentro.

Lo que vino después es la vida de trabajo corriente de un dembowsero que dura: El Sonido del 15, El Indio, El Funeral, Muévelo, Cuando Freno, Pa’ los Tigueres, Blam Blam, y luego Domingo y El Cartón, y luego Koké, Con Sonido y Pila de Enemigo. Los discos llegan, funcionan una temporada y los reemplaza el siguiente.

**Las temporadas de La Casa de Alofoke**

Dos de sus discos recientes se hicieron dentro de La Casa de Alofoke, el formato dominicano de telerrealidad que mete artistas en una casa y los filma trabajando. De Show, grabada ahí con La Perversa, se anunció explícitamente como el encuentro de dos generaciones del dembow; Natural salió de la misma casa. Puyalo Pantera le produjo material del mismo período.

También grabó El Punto con Flow 28, y Cuca con Monchy Cadena.

**The King Yamaha**

El apodo está en su propio canal y es una pieza pequeña de habla dominicana haciendo mucho trabajo: una Yamaha es una motora, el motoconcho es como se mueve el barrio, y decirse su rey lo ubica a uno con exactitud.

A diecinueve años de carrera sigue publicando, sigue distribuyendo por su cuenta, y sigue grabando con gente que tiene la mitad de su edad profesional. Muy pocos dembowseros aguantan la segunda década.',
       updated_at = now()
 WHERE slug = 'ceky-viciny';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ceky-viciny')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ceky-viciny')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Ceky Viciny, born Aneurys René Mateo Medina, is a Dominican dembow singer and songwriter. He has been recording since he was a teenager, under three different names, and has been at it long enough that the genre has changed shape twice around him.","type":"text"}]},{"type":"paragraph","content":[{"text":"The Ghetto","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The music was in the house before he chose it: his mother danced and his father was a disc jockey. He started in 2006 with a group called The Ghetto, which puts him in the scene several years before dembow had a name anybody outside the barrio would recognise.","type":"text"}]},{"type":"paragraph","content":[{"text":"In 2012 he formed a duo, Ceky Bichan y La Tetera. It worked with audiences and then broke up.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bonitillo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He came back in 2013 on his own, changed Bichan to Viciny, and cut Bonitillo. It was the first thing of his that travelled, and the remix put ","type":"text"},{"type":"artistReference","attrs":{"artistId":"7329c820-e6e3-4e67-874f-69c44dd04cd6","displayText":"Paramba","occurrenceId":"af72f340-c3b0-4074-9822-16e4ab3e48f7"}},{"text":" on it.","type":"text"}]},{"type":"paragraph","content":[{"text":"What followed is the ordinary working life of a dembow artist who lasts: El Sonido del 15, El Indio, El Funeral, Muévelo, Cuando Freno, Pa’ los Tigueres, Blam Blam, then Domingo and El Cartón, then Koké, Con Sonido and Pila de Enemigo. Records arrive, work for a season, and are replaced by the next one.","type":"text"}]},{"type":"paragraph","content":[{"text":"The Casa de Alofoke seasons","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Two of his recent records were made inside La Casa de Alofoke, the Dominican reality format that puts artists in a house and films them working. De Show, cut there with La Perversa, was explicitly billed as two generations of dembow meeting; Natural came out of the same house. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"349e25fa-268a-4036-870f-147e82155f3c","displayText":"Puyalo Pantera","occurrenceId":"b96ba6d6-5819-4684-b666-db98f17ccd5c"}},{"text":" produced work for him from the same period.","type":"text"}]},{"type":"paragraph","content":[{"text":"He also cut El Punto with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"725f7cd5-de62-4e76-b382-0d55c160d51f","displayText":"Flow 28","occurrenceId":"82fa02cf-0e11-4ea9-8136-9beddadef546"}},{"text":", and Cuca with Monchy Cadena.","type":"text"}]},{"type":"paragraph","content":[{"text":"The King Yamaha","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The nickname is on his own channel and it is a small piece of Dominican vernacular doing a lot of work: a Yamaha is a motorbike, the motoconcho is how the barrio moves, and calling yourself its king places you exactly.","type":"text"}]},{"type":"paragraph","content":[{"text":"Nineteen years into the career he is still releasing, still distributing independently, and still working with people half his professional age. Very few dembow artists manage the second decade.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'ceky-viciny'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Ceky Viciny, de nombre Aneurys René Mateo Medina, es cantante y compositor de dembow dominicano. Graba desde adolescente, bajo tres nombres distintos, y lleva tanto tiempo en esto que el género ha cambiado de forma dos veces a su alrededor.","type":"text"}]},{"type":"paragraph","content":[{"text":"The Ghetto","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La música estaba en la casa antes de que él la escogiera: su madre era bailarina y su padre disc jockey. Empezó en 2006 con un grupo llamado The Ghetto, lo que lo pone en la escena varios años antes de que el dembow tuviera un nombre que alguien fuera del barrio reconociera.","type":"text"}]},{"type":"paragraph","content":[{"text":"En 2012 armó un dúo, Ceky Bichan y La Tetera. Funcionó con el público y después se rompió.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bonitillo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Volvió en 2013 por su cuenta, le cambió Bichan por Viciny, y grabó Bonitillo. Fue lo primero suyo que viajó, y el remix metió a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"7329c820-e6e3-4e67-874f-69c44dd04cd6","displayText":"Paramba","occurrenceId":"7d276352-defa-43a1-9ef4-92382076ba17"}},{"text":" adentro.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que vino después es la vida de trabajo corriente de un dembowsero que dura: El Sonido del 15, El Indio, El Funeral, Muévelo, Cuando Freno, Pa’ los Tigueres, Blam Blam, y luego Domingo y El Cartón, y luego Koké, Con Sonido y Pila de Enemigo. Los discos llegan, funcionan una temporada y los reemplaza el siguiente.","type":"text"}]},{"type":"paragraph","content":[{"text":"Las temporadas de La Casa de Alofoke","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dos de sus discos recientes se hicieron dentro de La Casa de Alofoke, el formato dominicano de telerrealidad que mete artistas en una casa y los filma trabajando. De Show, grabada ahí con La Perversa, se anunció explícitamente como el encuentro de dos generaciones del dembow; Natural salió de la misma casa. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"349e25fa-268a-4036-870f-147e82155f3c","displayText":"Puyalo Pantera","occurrenceId":"90782d4a-44e5-4656-a470-2a9e214a7d9d"}},{"text":" le produjo material del mismo período.","type":"text"}]},{"type":"paragraph","content":[{"text":"También grabó El Punto con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"725f7cd5-de62-4e76-b382-0d55c160d51f","displayText":"Flow 28","occurrenceId":"d28ce36d-e40d-4e60-bff6-e756893161c3"}},{"text":", y Cuca con Monchy Cadena.","type":"text"}]},{"type":"paragraph","content":[{"text":"The King Yamaha","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El apodo está en su propio canal y es una pieza pequeña de habla dominicana haciendo mucho trabajo: una Yamaha es una motora, el motoconcho es como se mueve el barrio, y decirse su rey lo ubica a uno con exactitud.","type":"text"}]},{"type":"paragraph","content":[{"text":"A diecinueve años de carrera sigue publicando, sigue distribuyendo por su cuenta, y sigue grabando con gente que tiene la mitad de su edad profesional. Muy pocos dembowseros aguantan la segunda década.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'ceky-viciny'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ceky-viciny') AND locale = 'en'), '82fa02cf-0e11-4ea9-8136-9beddadef546', 'artist', '725f7cd5-de62-4e76-b382-0d55c160d51f');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ceky-viciny') AND locale = 'en'), 'af72f340-c3b0-4074-9822-16e4ab3e48f7', 'artist', '7329c820-e6e3-4e67-874f-69c44dd04cd6');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ceky-viciny') AND locale = 'en'), 'b96ba6d6-5819-4684-b666-db98f17ccd5c', 'artist', '349e25fa-268a-4036-870f-147e82155f3c');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ceky-viciny') AND locale = 'es'), '7d276352-defa-43a1-9ef4-92382076ba17', 'artist', '7329c820-e6e3-4e67-874f-69c44dd04cd6');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ceky-viciny') AND locale = 'es'), '90782d4a-44e5-4656-a470-2a9e214a7d9d', 'artist', '349e25fa-268a-4036-870f-147e82155f3c');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ceky-viciny') AND locale = 'es'), 'd28ce36d-e40d-4e60-bff6-e756893161c3', 'artist', '725f7cd5-de62-4e76-b382-0d55c160d51f');

COMMIT;
