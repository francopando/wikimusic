BEGIN;

-- Rewrite the catalogue entry for Shelow Shaq.
--
-- Shelow Shaq. Filler in English, nothing in Spanish, no gender, no
-- occupations, no genres, no aliases.
--
-- FILLED: gender male; date_of_birth 7 February 1981, given identically by
-- BuenaMusica and Tapedeck. birth_year 1981 was already stored and matches.
--
-- CORRECTED: primary_genre urbano -> urban-rap-hip-hop. He works across
-- reggaetón, dembow and rap, but rap is the claim he makes for himself -- one of
-- his own tracks is titled "Yo Sí Soy Hip Hop" -- and every profile leads with
-- rapero. urbano, urban-dembow and urban-reggaeton go into genres.
--
-- ADDED: occupations composer and actor -- BuenaMusica lists actor and so does
-- his own billing; genres; disambiguation.
--
-- LEFT ALONE: province Santo Domingo, corrected earlier today in
-- 20260906006800, and birth_place Herrera, which is in Santo Domingo Oeste and
-- is consistent with BuenaMusica's plain "Santo Domingo".
--
-- A CONFLICTING SOURCE DISCARDED, AND WORTH NAMING. GalaxyMusicPromo publishes
-- a "Wiki 2026" page giving his real name as "José Miguel Reyes Pérez" and a
-- birth of 25 December. Every other source -- BuenaMusica, Tapedeck, El Nuevo
-- Diario, his own accounts -- gives José Luis Peralta and 7 February 1981. The
-- page reads as machine-generated filler of exactly the kind this catalogue is
-- removing, and none of it is used.
--
-- SOURCES: BuenaMusica for the career chronology, which is the only place it is
-- written out: activity from 2007, the 2010 debut album Lo Hace Fácil with
-- twenty-one tracks, Soy de la Calle with Messiah, the album Rabia por
-- Naturaleza, the singles year by year from Caliéntate Girl in 2015 to Taba
-- Preso in 2021, Knock Out with Noriel and La Manta in 2017, Tu Maldita Madre
-- with Farruko, Químico Ultra Mega and Mozart la Para in 2018, and the Premio
-- Pepsi awarded in Venezuela in 2021 for Cristina with Nacho and J Quiles. His
-- own YouTube channel for the recent work and for the motto it opens with. Its
-- video list for Rap de la Mata with Lápiz Conciente, Detóname with La Perversa,
-- Tiradera Pa Joa, Nota Altera, Chancleta Crocs, Tu Quiere Ser Tíguere and
-- Frene en la Disco. Telemicro, 29 June 2025, on the song he says revived his
-- career. ESENDOM, 7 July 2025, which frames him as the chronicler who put the
-- barrio on record. Kiko el Crazy's Sube la Bocina, on which he appears.
--
-- AWARD NOT LOADED. The Premio Pepsi is a Venezuelan award and does not exist
-- in the awards table. Creating an award for one row is not worth the clutter,
-- and the collaboration it recognises is with two non-Dominicans. It is in the
-- prose.
--
-- NOT WRITTEN: subscriber and view counts.
--
-- NOT LINKED: Noriel, Farruko, Nacho and J Quiles are not Dominican. La Manta,
-- La Perversa, Chyno Nyno, Yiyo Sarante, El Clasicom, Rony Alcamuñekito, DJ
-- Cuffaro and Leo RD Produciendo are Dominican and have no entries.
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
       name = 'Shelow Shaq',
       sort_name = 'Peralta, José Luis',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'rapper',
       primary_genre = 'urban-rap-hip-hop',
       date_of_birth = '1981-02-07',
       birth_year = 1981,
       date_of_death = NULL,
       birth_place = 'Herrera',
       province = 'Santo Domingo',
       first_name = 'José',
       middle_name = 'Luis',
       last_name = 'Peralta',
       second_last_name = NULL,
       stage_name = 'Shelow Shaq',
       aliases = ARRAY['Shelow Shaq HD']::text[],
       occupations = '["composer","actor"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'urban-dembow', 'urban-reggaeton']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@ShelowShaqHD',
       facebook = 'kycshelowshaq',
       instagram = 'shelowshaq_',
       disambiguation = 'Rapper from Herrera; Lo Hace Fácil, Tu Maldita Madre',
       bio_en = 'Shelow Shaq, born José Luis Peralta, is a Dominican rapper, songwriter and actor from Herrera. His own channel introduces him as versatility made flesh, and for once the slogan is accurate: he has spent nearly twenty years moving between rap, reggaetón and dembow without settling.

**Lo Hace Fácil**

He started releasing in 2007 and put out his first album in 2010 — twenty-one tracks, which is a lot of record for a debut in a singles genre. Dame Amor, Desacátate, Perdí la Buena and A Come Caña are on it.

Rabia por Naturaleza followed, and Soy de la Calle was cut with Messiah. The singles then arrive at a rate of three or four a year and do not stop: Caliéntate Girl, Psiquiatra Enamorao, Pesos, El Pikete Lo Tengo Yo, Mi Funeral, Me Metí Una Patilla.

**Who is on the records**

Knock Out, in 2017, put him with Noriel and La Manta. Tu Maldita Madre, the year after, gathered Farruko, Químico Ultra Mega and Mozart la Para on one track and became the biggest thing he had done.

He also cut Rap de la Mata with Lápiz Conciente — a rapper of the older generation lending the title its whole meaning — and has shared stages with Tivi Gunz and El Cherry Scom. More recently he turned up on a salsa urbana record beside La Insuperable, which is where the versatility stops being a slogan and starts being a career decision.

In 2021 a Premio Pepsi came from Venezuela, for Cristina, made with Nacho and J Quiles.

**Yo Sí Soy Hip Hop**

He has a track by that name, and it is a tiradera. That is worth reading as a position rather than a quarrel: he came up when Dominican rap and Dominican dembow were the same room, watched dembow take the market, kept working in both, and periodically states out loud which one he thinks he belongs to.

The titles are the other half of him. Chancleta Crocs, Nota Altera, El Culo Más Lindo del Mundo, To El Lambón Eh Traicionero, Balaguer. Naming a record after a president is a joke with a long fuse, and it is the kind of joke this genre is for.',
       bio_es = 'Shelow Shaq, de nombre José Luis Peralta, es rapero, compositor y actor dominicano, de Herrera. Su propio canal lo presenta como la versatilidad hecha gente, y por una vez la consigna es exacta: lleva casi veinte años moviéndose entre rap, reguetón y dembow sin quedarse quieto.

**Lo Hace Fácil**

Empezó a publicar en 2007 y sacó su primer álbum en 2010: veintiún temas, que es mucho disco para un debut en un género de sencillos. Ahí están Dame Amor, Desacátate, Perdí la Buena y A Come Caña.

Detrás vino Rabia por Naturaleza, y Soy de la Calle la grabó con Messiah. Los sencillos empiezan entonces a salir a razón de tres o cuatro por año y no paran: Caliéntate Girl, Psiquiatra Enamorao, Pesos, El Pikete Lo Tengo Yo, Mi Funeral, Me Metí Una Patilla.

**Quién está en los discos**

Knock Out, en 2017, lo puso con Noriel y La Manta. Tu Maldita Madre, al año siguiente, juntó a Farruko, Químico Ultra Mega y Mozart la Para en un solo tema y se convirtió en lo más grande que había hecho.

También grabó Rap de la Mata con Lápiz Conciente —un rapero de la generación anterior que le da al título todo su sentido— y ha compartido tarima con Tivi Gunz y El Cherry Scom. Más recientemente apareció en un disco de salsa urbana al lado de La Insuperable, que es donde la versatilidad deja de ser consigna y pasa a ser decisión de carrera.

En 2021 le llegó un Premio Pepsi desde Venezuela, por Cristina, hecha con Nacho y J Quiles.

**Yo Sí Soy Hip Hop**

Tiene un tema con ese nombre, y es una tiradera. Vale leerlo como posición y no como pleito: se formó cuando el rap y el dembow dominicanos eran la misma sala, vio al dembow quedarse con el mercado, siguió trabajando los dos, y cada cierto tiempo dice en voz alta a cuál cree que pertenece.

Los títulos son la otra mitad de él. Chancleta Crocs, Nota Altera, El Culo Más Lindo del Mundo, To El Lambón Eh Traicionero, Balaguer. Ponerle a un disco el nombre de un presidente es un chiste de mecha larga, y es la clase de chiste para la que existe este género.',
       updated_at = now()
 WHERE slug = 'shelow-shaq';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shelow-shaq')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shelow-shaq')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Shelow Shaq, born José Luis Peralta, is a Dominican rapper, songwriter and actor from Herrera. His own channel introduces him as versatility made flesh, and for once the slogan is accurate: he has spent nearly twenty years moving between rap, reggaetón and dembow without settling.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo Hace Fácil","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He started releasing in 2007 and put out his first album in 2010 — twenty-one tracks, which is a lot of record for a debut in a singles genre. Dame Amor, Desacátate, Perdí la Buena and A Come Caña are on it.","type":"text"}]},{"type":"paragraph","content":[{"text":"Rabia por Naturaleza followed, and Soy de la Calle was cut with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"73cac635-71c3-407f-b9f5-02a705d6956b","displayText":"Messiah","occurrenceId":"37e2bdb8-d17b-4c69-877d-aa42bb21d74f"}},{"text":". The singles then arrive at a rate of three or four a year and do not stop: Caliéntate Girl, Psiquiatra Enamorao, Pesos, El Pikete Lo Tengo Yo, Mi Funeral, Me Metí Una Patilla.","type":"text"}]},{"type":"paragraph","content":[{"text":"Who is on the records","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Knock Out, in 2017, put him with Noriel and La Manta. Tu Maldita Madre, the year after, gathered Farruko, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"de562eb7-a0fb-49c2-a3c8-db97a4be80e3","displayText":"Químico Ultra Mega","occurrenceId":"d82fac84-08d0-4b58-b89f-2babc7a761b0"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"fa9cc802-28ca-4695-b585-f75aa90a2b6c","displayText":"Mozart la Para","occurrenceId":"1b61ba22-df81-44cd-8619-069af945475e"}},{"text":" on one track and became the biggest thing he had done.","type":"text"}]},{"type":"paragraph","content":[{"text":"He also cut Rap de la Mata with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"c45ef853-1caa-4fbb-b073-32b7596f7686"}},{"text":" — a rapper of the older generation lending the title its whole meaning — and has shared stages with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"95e181f1-58e5-4537-a5e8-75a9f60c6aca","displayText":"Tivi Gunz","occurrenceId":"67199f3b-63df-4829-8b8e-2bf9f9f137bd"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0b2e1a39-b265-42d6-95d5-85ad930eee84","displayText":"El Cherry Scom","occurrenceId":"e0084ec6-7838-4b70-b731-a2fa5d01a7df"}},{"text":". More recently he turned up on a salsa urbana record beside ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d08f2c85-7f47-449e-a486-a19ba3b5841a","displayText":"La Insuperable","occurrenceId":"ca92267b-609c-40d2-85a7-e438fc593fd0"}},{"text":", which is where the versatility stops being a slogan and starts being a career decision.","type":"text"}]},{"type":"paragraph","content":[{"text":"In 2021 a Premio Pepsi came from Venezuela, for Cristina, made with Nacho and J Quiles.","type":"text"}]},{"type":"paragraph","content":[{"text":"Yo Sí Soy Hip Hop","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He has a track by that name, and it is a tiradera. That is worth reading as a position rather than a quarrel: he came up when Dominican rap and Dominican dembow were the same room, watched dembow take the market, kept working in both, and periodically states out loud which one he thinks he belongs to.","type":"text"}]},{"type":"paragraph","content":[{"text":"The titles are the other half of him. Chancleta Crocs, Nota Altera, El Culo Más Lindo del Mundo, To El Lambón Eh Traicionero, Balaguer. Naming a record after a president is a joke with a long fuse, and it is the kind of joke this genre is for.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'shelow-shaq'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Shelow Shaq, de nombre José Luis Peralta, es rapero, compositor y actor dominicano, de Herrera. Su propio canal lo presenta como la versatilidad hecha gente, y por una vez la consigna es exacta: lleva casi veinte años moviéndose entre rap, reguetón y dembow sin quedarse quieto.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo Hace Fácil","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Empezó a publicar en 2007 y sacó su primer álbum en 2010: veintiún temas, que es mucho disco para un debut en un género de sencillos. Ahí están Dame Amor, Desacátate, Perdí la Buena y A Come Caña.","type":"text"}]},{"type":"paragraph","content":[{"text":"Detrás vino Rabia por Naturaleza, y Soy de la Calle la grabó con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"73cac635-71c3-407f-b9f5-02a705d6956b","displayText":"Messiah","occurrenceId":"8066e5e3-4cf4-47b2-98bb-542fd8a8a02a"}},{"text":". Los sencillos empiezan entonces a salir a razón de tres o cuatro por año y no paran: Caliéntate Girl, Psiquiatra Enamorao, Pesos, El Pikete Lo Tengo Yo, Mi Funeral, Me Metí Una Patilla.","type":"text"}]},{"type":"paragraph","content":[{"text":"Quién está en los discos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Knock Out, en 2017, lo puso con Noriel y La Manta. Tu Maldita Madre, al año siguiente, juntó a Farruko, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"de562eb7-a0fb-49c2-a3c8-db97a4be80e3","displayText":"Químico Ultra Mega","occurrenceId":"63d8fae6-4d9f-4461-8a66-f904177ea4fc"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"fa9cc802-28ca-4695-b585-f75aa90a2b6c","displayText":"Mozart la Para","occurrenceId":"9277d7d1-4d2d-4331-a4ef-4f6ae2ac3900"}},{"text":" en un solo tema y se convirtió en lo más grande que había hecho.","type":"text"}]},{"type":"paragraph","content":[{"text":"También grabó Rap de la Mata con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"d80686e5-e4a3-411c-aa6d-b0f9f77871cb"}},{"text":" —un rapero de la generación anterior que le da al título todo su sentido— y ha compartido tarima con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"95e181f1-58e5-4537-a5e8-75a9f60c6aca","displayText":"Tivi Gunz","occurrenceId":"9bca4eb6-4173-4772-ad9a-90e25a85b585"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0b2e1a39-b265-42d6-95d5-85ad930eee84","displayText":"El Cherry Scom","occurrenceId":"686fe29d-988f-4723-ab12-dde78c8703bd"}},{"text":". Más recientemente apareció en un disco de salsa urbana al lado de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"d08f2c85-7f47-449e-a486-a19ba3b5841a","displayText":"La Insuperable","occurrenceId":"684fd256-4a4d-402f-bea0-d5158f32a6ea"}},{"text":", que es donde la versatilidad deja de ser consigna y pasa a ser decisión de carrera.","type":"text"}]},{"type":"paragraph","content":[{"text":"En 2021 le llegó un Premio Pepsi desde Venezuela, por Cristina, hecha con Nacho y J Quiles.","type":"text"}]},{"type":"paragraph","content":[{"text":"Yo Sí Soy Hip Hop","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Tiene un tema con ese nombre, y es una tiradera. Vale leerlo como posición y no como pleito: se formó cuando el rap y el dembow dominicanos eran la misma sala, vio al dembow quedarse con el mercado, siguió trabajando los dos, y cada cierto tiempo dice en voz alta a cuál cree que pertenece.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los títulos son la otra mitad de él. Chancleta Crocs, Nota Altera, El Culo Más Lindo del Mundo, To El Lambón Eh Traicionero, Balaguer. Ponerle a un disco el nombre de un presidente es un chiste de mecha larga, y es la clase de chiste para la que existe este género.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'shelow-shaq'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shelow-shaq') AND locale = 'en'), '1b61ba22-df81-44cd-8619-069af945475e', 'artist', 'fa9cc802-28ca-4695-b585-f75aa90a2b6c');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shelow-shaq') AND locale = 'en'), '37e2bdb8-d17b-4c69-877d-aa42bb21d74f', 'artist', '73cac635-71c3-407f-b9f5-02a705d6956b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shelow-shaq') AND locale = 'en'), '67199f3b-63df-4829-8b8e-2bf9f9f137bd', 'artist', '95e181f1-58e5-4537-a5e8-75a9f60c6aca');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shelow-shaq') AND locale = 'en'), 'c45ef853-1caa-4fbb-b073-32b7596f7686', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shelow-shaq') AND locale = 'en'), 'ca92267b-609c-40d2-85a7-e438fc593fd0', 'artist', 'd08f2c85-7f47-449e-a486-a19ba3b5841a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shelow-shaq') AND locale = 'en'), 'd82fac84-08d0-4b58-b89f-2babc7a761b0', 'artist', 'de562eb7-a0fb-49c2-a3c8-db97a4be80e3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shelow-shaq') AND locale = 'en'), 'e0084ec6-7838-4b70-b731-a2fa5d01a7df', 'artist', '0b2e1a39-b265-42d6-95d5-85ad930eee84');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shelow-shaq') AND locale = 'es'), '63d8fae6-4d9f-4461-8a66-f904177ea4fc', 'artist', 'de562eb7-a0fb-49c2-a3c8-db97a4be80e3');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shelow-shaq') AND locale = 'es'), '684fd256-4a4d-402f-bea0-d5158f32a6ea', 'artist', 'd08f2c85-7f47-449e-a486-a19ba3b5841a');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shelow-shaq') AND locale = 'es'), '686fe29d-988f-4723-ab12-dde78c8703bd', 'artist', '0b2e1a39-b265-42d6-95d5-85ad930eee84');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shelow-shaq') AND locale = 'es'), '8066e5e3-4cf4-47b2-98bb-542fd8a8a02a', 'artist', '73cac635-71c3-407f-b9f5-02a705d6956b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shelow-shaq') AND locale = 'es'), '9277d7d1-4d2d-4331-a4ef-4f6ae2ac3900', 'artist', 'fa9cc802-28ca-4695-b585-f75aa90a2b6c');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shelow-shaq') AND locale = 'es'), '9bca4eb6-4173-4772-ad9a-90e25a85b585', 'artist', '95e181f1-58e5-4537-a5e8-75a9f60c6aca');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'shelow-shaq') AND locale = 'es'), 'd80686e5-e4a3-411c-aa6d-b0f9f77871cb', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

COMMIT;
