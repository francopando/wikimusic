BEGIN;

-- Rewrite the catalogue entry for Topo la Máskara.
--
-- Topo la Máskara. Filler in English -- two sentences, and it said Santo Domingo
-- over a row that reads San Pedro de Macorís -- with no sort_name, no
-- stage_name, no aliases, no occupations, no genres, no disambiguation. He made
-- the bass line that ended up inside a worldwide hit, and then sued over it.
--
-- THE AUTHORSHIP CASE IS THE ENTRY, AND IT IS FULLY CORROBORATED. In January
-- 2018 DJ Kass released "Scooby Doo Pa Pa", which became a global record with a
-- Pitbull remix. Shelow Shaq and Topo la Máskara said its bass line came from
-- "Tu Maldita Madre", Shelow Shaq's 2017 record, which Topo produced. Five
-- independent sources, not one:
--
--   - English Wikipedia's DJ Kass article: "...Shaq and his producer, Topo, who
--     note that 'Scooby Doo Pa Pa' samples the bass line from Shelow Shaq's song
--     'Tu Maldita Madre'"
--   - Genius lists the sample relationship outright: Scooby-Doo Pa Pa samples Tu
--     Maldita Madre, Shelow Shaq, 2017
--   - Central de Radios, 22 February 2018, reporting that the two of them had
--     sued and that the record had come off Spotify
--   - Audiomack's credit panel for Scooby Doo Pa Pa, which now carries both
--     their names
--   - BuenaMusica's biography of DJ Kass, which describes the suit from the
--     other side
--
-- THE STANDING RULE SAYS A CREDITS AND ROYALTIES DISPUTE BELONGS HERE, because
-- authorship is what this record keeps. This is the clearest example the run has
-- produced: a Dominican producer's work inside a hit that was not credited to
-- him, a suit, a takedown, and credits that now name him.
--
-- WHAT IS NOT CLAIMED. No source found states the final outcome of the
-- litigation. The entry says the record was pulled and that the credits now
-- carry their names, both of which are observable, and does not assert a verdict.
--
-- LEFT ALONE AND CORRECT: province and birth_place San Pedro de Macorís, which
-- the discarded filler paragraph contradicted by saying Santo Domingo;
-- date_of_birth 1987-01-05; the legal name Juan José Brito Castillo; gender;
-- primary_role; primary_genre urban-dembow.
--
-- FILLED: sort_name and stage_name, both null. aliases Topo, which is how
-- English Wikipedia refers to him. occupations producer and composer -- the
-- producing is the whole reason he is notable, and his own Instagram bio reads
-- "Artist• Singer•Producer". genres urbano and electronic: his recent catalogue
-- is guaracha, tribal house and cumbia as much as dembow, and one release is
-- labelled Tribal House outright. disambiguation.
--
-- A LOOP WORTH RECORDING. WhoSampled lists "Panda Pon", his 2019 record with the
-- Brazilian MC Fioti, as sampling "Scooby Doo Pa Pa" -- the record that had
-- sampled him. He also cut "Frío Caliente" with the same artist.
--
-- NO NUMBERS. His Instagram bio claims two multi-platinum and two diamond
-- certifications. No certifying body is named and none was found, so the claim is
-- not written and no numbers appear.
--
-- SOURCES: his own YouTube channel -- thirty video titles -- and his own
-- Instagram. English Wikipedia's DJ Kass article. Genius and WhoSampled for the
-- sample relationships. Central de Radios, 22 February 2018. BuenaMusica's DJ
-- Kass biography. Audiomack and Deezer for credits.
--
-- NOT LINKED: DJ Kass is Dominican-American and has no entry; MC Fioti is
-- Brazilian. Diamond El Papaupa, Vadi, Kadam, David Dluna, Hizo_888,
-- Xibibrothers, Kairo La Sinfonía, Alemy, Christian López, Jean Then and Hugo
-- Taveraz have no entries. Crazy Design, whose catalogue page carries one of
-- Topo's releases, is already on the missing list from Luigui Bleand's entry.
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
       name = 'Topo la Máskara',
       sort_name = 'Topo la Máskara',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urban-dembow',
       date_of_birth = '1987-01-05',
       birth_year = 1987,
       date_of_death = NULL,
       birth_place = 'San Pedro de Macorís',
       province = 'San Pedro de Macorís',
       first_name = 'Juan',
       middle_name = 'José',
       last_name = 'Brito',
       second_last_name = 'Castillo',
       stage_name = 'Topo la Máskara',
       aliases = ARRAY['Topo']::text[],
       occupations = '["producer","composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'electronic']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@TopoLaMaskara',
       facebook = 'topolamaskara',
       instagram = 'topolamaskara',
       disambiguation = 'Dembow producer and singer from San Pedro de Macorís; produced Tu Maldita Madre',
       bio_en = 'Topo la Máskara, born Juan José Brito Castillo, is a Dominican dembow producer and singer from San Pedro de Macorís. He is better known inside the industry than outside it, for a reason that has to do with who gets named on a record.

**The bass line**

He produced Tu Maldita Madre for Shelow Shaq. A year later a record called Scooby Doo Pa Pa was released by another Dominican artist, became a worldwide hit, got a Pitbull remix and turned into a dance craze filmed in a dozen countries.

Shelow Shaq and Topo said the bass line under it was theirs. They sued, and the record came off Spotify while the claim was live. The sites that track samples now list the relationship as a matter of record, and the credit panels on the streaming services carry both their names.

That sequence is the most consequential thing in his career and it is the kind of thing a discography cannot show. A dembow instrumental is made in a bedroom by one person, circulates without paperwork, and reappears under somebody else’s name; whether the maker is ever named again depends entirely on whether he is willing to go to court about it.

There is a coda. In 2019 he cut a record with a Brazilian artist that sampled Scooby Doo Pa Pa — the track that had sampled him. Dembow eats itself and keeps moving, and he has never pretended otherwise.

**Producer first**

He sings his own records too. La 9 is the one he brands himself with, and Hey Yo, Rehab, Muévelo, Trumpets, Sola, Cumbia, Playa y Sol, Me Gusta, Mejor Sin Ti, Joseando and Me La Sube are all his.

What is striking about the catalogue is how far outside dembow it goes. There is guaracha on it, and cumbia, and a record filed as tribal house. The Dominican producers of his generation are working the same electronic dance circuit as everyone else in Latin America, and the genre labels stopped being useful some time ago.

**San Pedro**

San Pedro de Macorís is not a dembow town in the way the Santo Domingo barrios are. It is a sugar town and a baseball town, and its musical export has historically been the guloya drums of the cocolo community rather than anything urban.

That he came out of there and ended up with his work inside a record playing in Miami and Madrid says something about how the genre actually spreads: not through a scene or a label, but through a file that travels faster than the person who made it.',
       bio_es = 'Topo la Máskara, de nombre Juan José Brito Castillo, es productor y cantante de dembow dominicano, de San Pedro de Macorís. Se le conoce más dentro de la industria que fuera de ella, por una razón que tiene que ver con quién aparece nombrado en un disco.

**La línea de bajo**

Él produjo Tu Maldita Madre para Shelow Shaq. Un año después otro artista dominicano sacó un tema llamado Scooby Doo Pa Pa, que se volvió un éxito mundial, tuvo remix con Pitbull y se convirtió en un baile filmado en una docena de países.

Shelow Shaq y Topo dijeron que la línea de bajo de abajo era suya. Demandaron, y el disco salió de Spotify mientras la reclamación estaba viva. Los sitios que rastrean samples registran hoy esa relación como un hecho, y los créditos de las plataformas llevan los dos nombres.

Esa secuencia es lo más consecuente de su carrera y es justo lo que una discografía no puede mostrar. Una pista de dembow la hace una sola persona en un cuarto, circula sin papeles, y reaparece con el nombre de otro; que al autor se le vuelva a nombrar depende por completo de si está dispuesto a ir a un tribunal por eso.

Hay una coda. En 2019 grabó con un artista brasileño un tema que sampleaba Scooby Doo Pa Pa, el disco que lo había sampleado a él. El dembow se come a sí mismo y sigue andando, y él nunca ha fingido lo contrario.

**Productor antes que nada**

También canta lo suyo. La 9 es el tema con el que se marca, y Hey Yo, Rehab, Muévelo, Trumpets, Sola, Cumbia, Playa y Sol, Me Gusta, Mejor Sin Ti, Joseando y Me La Sube son suyos.

Lo llamativo del catálogo es lo lejos del dembow que se va. Hay guaracha, hay cumbia, y hay un disco fichado directamente como tribal house. Los productores dominicanos de su generación están trabajando el mismo circuito de música electrónica bailable que el resto de América Latina, y las etiquetas de género dejaron de servir hace rato.

**San Pedro**

San Pedro de Macorís no es un pueblo de dembow como lo son los barrios de Santo Domingo. Es un pueblo de azúcar y de pelota, y su exportación musical ha sido históricamente los tambores de los guloyas de la comunidad cocola, no nada urbano.

Que haya salido de ahí y haya terminado con su trabajo dentro de un disco que sonaba en Miami y en Madrid dice algo de cómo se propaga de verdad el género: no por una escena ni por un sello, sino por un archivo que viaja más rápido que quien lo hizo.',
       updated_at = now()
 WHERE slug = 'topo-la-maskara';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'topo-la-maskara')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'topo-la-maskara')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Topo la Máskara, born Juan José Brito Castillo, is a Dominican dembow producer and singer from San Pedro de Macorís. He is better known inside the industry than outside it, for a reason that has to do with who gets named on a record.","type":"text"}]},{"type":"paragraph","content":[{"text":"The bass line","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He produced Tu Maldita Madre for ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cadebd75-4af4-4519-9599-6ec606694a36","displayText":"Shelow Shaq","occurrenceId":"a7dcdef5-8b85-4f77-9b47-73cd8703f7ba"}},{"text":". A year later a record called Scooby Doo Pa Pa was released by another Dominican artist, became a worldwide hit, got a Pitbull remix and turned into a dance craze filmed in a dozen countries.","type":"text"}]},{"type":"paragraph","content":[{"text":"Shelow Shaq and Topo said the bass line under it was theirs. They sued, and the record came off Spotify while the claim was live. The sites that track samples now list the relationship as a matter of record, and the credit panels on the streaming services carry both their names.","type":"text"}]},{"type":"paragraph","content":[{"text":"That sequence is the most consequential thing in his career and it is the kind of thing a discography cannot show. A dembow instrumental is made in a bedroom by one person, circulates without paperwork, and reappears under somebody else’s name; whether the maker is ever named again depends entirely on whether he is willing to go to court about it.","type":"text"}]},{"type":"paragraph","content":[{"text":"There is a coda. In 2019 he cut a record with a Brazilian artist that sampled Scooby Doo Pa Pa — the track that had sampled him. Dembow eats itself and keeps moving, and he has never pretended otherwise.","type":"text"}]},{"type":"paragraph","content":[{"text":"Producer first","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He sings his own records too. La 9 is the one he brands himself with, and Hey Yo, Rehab, Muévelo, Trumpets, Sola, Cumbia, Playa y Sol, Me Gusta, Mejor Sin Ti, Joseando and Me La Sube are all his.","type":"text"}]},{"type":"paragraph","content":[{"text":"What is striking about the catalogue is how far outside dembow it goes. There is guaracha on it, and cumbia, and a record filed as tribal house. The Dominican producers of his generation are working the same electronic dance circuit as everyone else in Latin America, and the genre labels stopped being useful some time ago.","type":"text"}]},{"type":"paragraph","content":[{"text":"San Pedro","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"San Pedro de Macorís is not a dembow town in the way the Santo Domingo barrios are. It is a sugar town and a baseball town, and its musical export has historically been the guloya drums of the cocolo community rather than anything urban.","type":"text"}]},{"type":"paragraph","content":[{"text":"That he came out of there and ended up with his work inside a record playing in Miami and Madrid says something about how the genre actually spreads: not through a scene or a label, but through a file that travels faster than the person who made it.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'topo-la-maskara'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Topo la Máskara, de nombre Juan José Brito Castillo, es productor y cantante de dembow dominicano, de San Pedro de Macorís. Se le conoce más dentro de la industria que fuera de ella, por una razón que tiene que ver con quién aparece nombrado en un disco.","type":"text"}]},{"type":"paragraph","content":[{"text":"La línea de bajo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Él produjo Tu Maldita Madre para ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cadebd75-4af4-4519-9599-6ec606694a36","displayText":"Shelow Shaq","occurrenceId":"67a062d8-529a-4d26-b21e-a1f1a494c6fa"}},{"text":". Un año después otro artista dominicano sacó un tema llamado Scooby Doo Pa Pa, que se volvió un éxito mundial, tuvo remix con Pitbull y se convirtió en un baile filmado en una docena de países.","type":"text"}]},{"type":"paragraph","content":[{"text":"Shelow Shaq y Topo dijeron que la línea de bajo de abajo era suya. Demandaron, y el disco salió de Spotify mientras la reclamación estaba viva. Los sitios que rastrean samples registran hoy esa relación como un hecho, y los créditos de las plataformas llevan los dos nombres.","type":"text"}]},{"type":"paragraph","content":[{"text":"Esa secuencia es lo más consecuente de su carrera y es justo lo que una discografía no puede mostrar. Una pista de dembow la hace una sola persona en un cuarto, circula sin papeles, y reaparece con el nombre de otro; que al autor se le vuelva a nombrar depende por completo de si está dispuesto a ir a un tribunal por eso.","type":"text"}]},{"type":"paragraph","content":[{"text":"Hay una coda. En 2019 grabó con un artista brasileño un tema que sampleaba Scooby Doo Pa Pa, el disco que lo había sampleado a él. El dembow se come a sí mismo y sigue andando, y él nunca ha fingido lo contrario.","type":"text"}]},{"type":"paragraph","content":[{"text":"Productor antes que nada","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"También canta lo suyo. La 9 es el tema con el que se marca, y Hey Yo, Rehab, Muévelo, Trumpets, Sola, Cumbia, Playa y Sol, Me Gusta, Mejor Sin Ti, Joseando y Me La Sube son suyos.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo llamativo del catálogo es lo lejos del dembow que se va. Hay guaracha, hay cumbia, y hay un disco fichado directamente como tribal house. Los productores dominicanos de su generación están trabajando el mismo circuito de música electrónica bailable que el resto de América Latina, y las etiquetas de género dejaron de servir hace rato.","type":"text"}]},{"type":"paragraph","content":[{"text":"San Pedro","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"San Pedro de Macorís no es un pueblo de dembow como lo son los barrios de Santo Domingo. Es un pueblo de azúcar y de pelota, y su exportación musical ha sido históricamente los tambores de los guloyas de la comunidad cocola, no nada urbano.","type":"text"}]},{"type":"paragraph","content":[{"text":"Que haya salido de ahí y haya terminado con su trabajo dentro de un disco que sonaba en Miami y en Madrid dice algo de cómo se propaga de verdad el género: no por una escena ni por un sello, sino por un archivo que viaja más rápido que quien lo hizo.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'topo-la-maskara'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'topo-la-maskara') AND locale = 'en'), 'a7dcdef5-8b85-4f77-9b47-73cd8703f7ba', 'artist', 'cadebd75-4af4-4519-9599-6ec606694a36');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'topo-la-maskara') AND locale = 'es'), '67a062d8-529a-4d26-b21e-a1f1a494c6fa', 'artist', 'cadebd75-4af4-4519-9599-6ec606694a36');

COMMIT;
