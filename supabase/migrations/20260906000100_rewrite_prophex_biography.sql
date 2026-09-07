BEGIN;

-- Rewrite the catalogue entry for Prophex.
--
-- Prophex. Filler in English, nothing in Spanish, no occupations -- on a man a
-- serious outlet has called the ambassador of an entire Dominican sub-genre.
--
-- CORRECTED: primary_role singer -> producer, with singer and composer kept in
-- occupations. He sings on his own records, but his own billing is
-- "International Bachata Producer and Artist" and the coverage of him is about
-- what he does to the arrangements.
--
-- ADDED: urban-trap and urbano to genres, which is what trapchata is made of.
--
-- LEFT ALONE AND FLAGGED: province "Distrito Nacional" and birth_place "Santo
-- Domingo", the importer's default. His posts geotag Santo Domingo and Bachata
-- Gang's do too, which supports the city but is not a statement about where he
-- was born.
--
-- SOURCES: Radio Gladys Palmera, "La nueva musica dominicana" by Jose Fajardo,
-- 29 April 2020, a survey of the whole new Dominican scene, which names him
-- directly: "hablaremos tambien de la trapchata urbana y su embajador Prophex,
-- responsable de modernizar los ritmos de baile autoctonos con las tendencias
-- actuales del mercado". His own Instagram billing, "International Bachata
-- Producer and Artist", posted from Santo Domingo. Spotify for the catalogue --
-- Baile Privado, Tanta Locura, El Cuero Mambo (Remix), Dejalo Caer, Morir
-- Sonando, Caderas de Fuego, Dance the Pain Away, Reparar (Amoureux De Toi),
-- Una Mala with Amarfis y La Banda de Atakke, Hola Bebe with Fulanito,
-- Celebracion, and Obsesion and Problemon with Oscar Dominic. Bachata Gang's
-- own posts, including the instrumental Bachata Passion credited to Bachata
-- Gang and Prophex, and the Bachaton Music Fest at the Grand Sierra Resort. A
-- Zumba instructors' listing and a Japanese Zumba song index that carry his
-- tracks, which is how this music actually circulates. Announcements of his
-- work with DJ Tronky and DJ Tiguere, and with Ekoss on a bachata reading of I
-- Want It That Way.
--
-- NOT WRITTEN: a real name and a birth date. Neither is published anywhere
-- found.
--
-- NOT LINKED: Fulanito is a New York group and should not have an entry here;
-- Bachata Gang has one but is still needs_review; DJ Tronky is Italian. The
-- catalogue holds both "Amarfis" (needs_review) and "Amarfis y La Banda de
-- Atakke" (published) -- the credit on Una Mala names the band, so the band is
-- the one referenced.
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
       name = 'Prophex',
       sort_name = 'Prophex',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'producer',
       primary_genre = 'bachata',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = 'Prophex',
       aliases = ARRAY[]::text[],
       occupations = '["singer","composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urban-trap', 'urbano']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = 'https://linktr.ee/Prophex',
       youtube = '@Prophex',
       facebook = 'PROPHEX',
       instagram = 'prophex',
       disambiguation = 'Dominican bachata producer and singer; named the ambassador of trapchata',
       bio_en = 'Prophex is a Dominican bachata producer, singer and writer. Radio Gladys Palmera, surveying the new Dominican scene in 2020, called him the ambassador of urban trapchata and credited him with modernising the country’s own dance rhythms against what the market was doing.

**What trapchata is**

It is bachata built with the tools of trap: the guitar figure and the bongó are still there, but the low end, the programming and the vocal cadence come from somewhere else entirely. Naming a hybrid is usually a critic’s habit; in this case the artists got there first and the word stuck.

The same collision turns up higher on the charts — El Alfa reached for it on La Romana with Bad Bunny — but Prophex works the bachata side of it rather than the trap side, and that is the difference between a crossover and a genre.

**The catalogue**

Baile Privado, Tanta Locura, Morir Soñando, Caderas de Fuego, Déjalo Caer, El Cuero Mambo. Una Mala came with Amarfis y La Banda de Atakke; Hola Bebé with the New York group Fulanito; Obsesión and Problemón with Oscar Dominic.

Several titles are in English or French — Dance the Pain Away, Reparar (Amoureux De Toi) — which is not affectation. He works for an audience that is largely outside the Dominican Republic and does not necessarily speak Spanish, and the songs are labelled for the room they will be played in.

**Music for a floor**

He records with the Bachata Gang collective and has played the Bachatón Music Fest in Reno. His tracks turn up in Zumba class listings, including a Japanese index of routine music.

That is a strange afterlife for a Dominican genre and a completely real one. Bachata now has an international dance circuit with its own festivals, instructors and appetite for new material, and a producer who can feed it is doing something that the bachateros of the cabaret era would not have recognised as the same trade at all.',
       bio_es = 'Prophex es un productor, cantante y compositor de bachata dominicano. Radio Gladys Palmera, repasando la nueva escena dominicana en 2020, lo llamó el embajador de la trapchata urbana y le atribuyó el haber modernizado los ritmos de baile autóctonos con las tendencias del mercado.

**Qué es la trapchata**

Es bachata armada con las herramientas del trap: la figura de guitarra y el bongó siguen ahí, pero los graves, la programación y la cadencia de la voz vienen de otro sitio por completo. Ponerle nombre a un híbrido suele ser manía de crítico; en este caso llegaron primero los artistas y la palabra se quedó.

El mismo choque aparece más arriba en las listas —El Alfa fue a buscarlo en La Romana con Bad Bunny—, pero Prophex trabaja el lado de la bachata y no el del trap, y esa es la diferencia entre un cruce y un género.

**El catálogo**

Baile Privado, Tanta Locura, Morir Soñando, Caderas de Fuego, Déjalo Caer, El Cuero Mambo. Una Mala salió con Amarfis y La Banda de Atakke; Hola Bebé con el grupo neoyorquino Fulanito; Obsesión y Problemón con Oscar Dominic.

Varios títulos están en inglés o en francés —Dance the Pain Away, Reparar (Amoureux De Toi)— y no es pose. Trabaja para un público que está en buena medida fuera de República Dominicana y que no necesariamente habla español, y las canciones están rotuladas para el salón en el que van a sonar.

**Música para una pista**

Graba con el colectivo Bachata Gang y ha tocado en el Bachatón Music Fest de Reno. Sus temas aparecen en listas de clases de Zumba, incluido un índice japonés de música de rutinas.

Es una vida ulterior extraña para un género dominicano y completamente real. La bachata tiene hoy un circuito internacional de baile con sus festivales, sus instructores y su hambre de material nuevo, y un productor capaz de alimentarlo está haciendo algo que los bachateros de la era del cabaret no habrían reconocido como el mismo oficio.',
       updated_at = now()
 WHERE slug = 'prophex';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'prophex')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'prophex')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Prophex is a Dominican bachata producer, singer and writer. Radio Gladys Palmera, surveying the new Dominican scene in 2020, called him the ambassador of urban trapchata and credited him with modernising the country’s own dance rhythms against what the market was doing.","type":"text"}]},{"type":"paragraph","content":[{"text":"What trapchata is","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"It is bachata built with the tools of trap: the guitar figure and the bongó are still there, but the low end, the programming and the vocal cadence come from somewhere else entirely. Naming a hybrid is usually a critic’s habit; in this case the artists got there first and the word stuck.","type":"text"}]},{"type":"paragraph","content":[{"text":"The same collision turns up higher on the charts — ","type":"text"},{"type":"artistReference","attrs":{"artistId":"559f2ed4-8831-483b-bc00-7cb4f340ad92","displayText":"El Alfa","occurrenceId":"74ceda61-4766-4711-8091-4c9b90bbb151"}},{"text":" reached for it on La Romana with Bad Bunny — but Prophex works the bachata side of it rather than the trap side, and that is the difference between a crossover and a genre.","type":"text"}]},{"type":"paragraph","content":[{"text":"The catalogue","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Baile Privado, Tanta Locura, Morir Soñando, Caderas de Fuego, Déjalo Caer, El Cuero Mambo. Una Mala came with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f0e81576-728d-4c68-b416-b2df67101496","displayText":"Amarfis y La Banda de Atakke","occurrenceId":"61100e47-61c4-41ea-abed-fb6fe1a0e6a8"}},{"text":"; Hola Bebé with the New York group Fulanito; Obsesión and Problemón with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"b1c6099c-d348-4003-90fb-d2c4f889034b","displayText":"Oscar Dominic","occurrenceId":"7e910ddb-a295-4404-b4b3-4ef8ce09c629"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Several titles are in English or French — Dance the Pain Away, Reparar (Amoureux De Toi) — which is not affectation. He works for an audience that is largely outside the Dominican Republic and does not necessarily speak Spanish, and the songs are labelled for the room they will be played in.","type":"text"}]},{"type":"paragraph","content":[{"text":"Music for a floor","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He records with the Bachata Gang collective and has played the Bachatón Music Fest in Reno. His tracks turn up in Zumba class listings, including a Japanese index of routine music.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is a strange afterlife for a Dominican genre and a completely real one. Bachata now has an international dance circuit with its own festivals, instructors and appetite for new material, and a producer who can feed it is doing something that the bachateros of the cabaret era would not have recognised as the same trade at all.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'prophex'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Prophex es un productor, cantante y compositor de bachata dominicano. Radio Gladys Palmera, repasando la nueva escena dominicana en 2020, lo llamó el embajador de la trapchata urbana y le atribuyó el haber modernizado los ritmos de baile autóctonos con las tendencias del mercado.","type":"text"}]},{"type":"paragraph","content":[{"text":"Qué es la trapchata","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Es bachata armada con las herramientas del trap: la figura de guitarra y el bongó siguen ahí, pero los graves, la programación y la cadencia de la voz vienen de otro sitio por completo. Ponerle nombre a un híbrido suele ser manía de crítico; en este caso llegaron primero los artistas y la palabra se quedó.","type":"text"}]},{"type":"paragraph","content":[{"text":"El mismo choque aparece más arriba en las listas —","type":"text"},{"type":"artistReference","attrs":{"artistId":"559f2ed4-8831-483b-bc00-7cb4f340ad92","displayText":"El Alfa","occurrenceId":"725354ed-70c8-4d74-a842-d613f7644272"}},{"text":" fue a buscarlo en La Romana con Bad Bunny—, pero Prophex trabaja el lado de la bachata y no el del trap, y esa es la diferencia entre un cruce y un género.","type":"text"}]},{"type":"paragraph","content":[{"text":"El catálogo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Baile Privado, Tanta Locura, Morir Soñando, Caderas de Fuego, Déjalo Caer, El Cuero Mambo. Una Mala salió con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"f0e81576-728d-4c68-b416-b2df67101496","displayText":"Amarfis y La Banda de Atakke","occurrenceId":"d0f94e78-06fa-4757-a456-01790d3dda85"}},{"text":"; Hola Bebé con el grupo neoyorquino Fulanito; Obsesión y Problemón con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"b1c6099c-d348-4003-90fb-d2c4f889034b","displayText":"Oscar Dominic","occurrenceId":"9d58d7db-7638-491b-8fed-92148704aeaf"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Varios títulos están en inglés o en francés —Dance the Pain Away, Reparar (Amoureux De Toi)— y no es pose. Trabaja para un público que está en buena medida fuera de República Dominicana y que no necesariamente habla español, y las canciones están rotuladas para el salón en el que van a sonar.","type":"text"}]},{"type":"paragraph","content":[{"text":"Música para una pista","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Graba con el colectivo Bachata Gang y ha tocado en el Bachatón Music Fest de Reno. Sus temas aparecen en listas de clases de Zumba, incluido un índice japonés de música de rutinas.","type":"text"}]},{"type":"paragraph","content":[{"text":"Es una vida ulterior extraña para un género dominicano y completamente real. La bachata tiene hoy un circuito internacional de baile con sus festivales, sus instructores y su hambre de material nuevo, y un productor capaz de alimentarlo está haciendo algo que los bachateros de la era del cabaret no habrían reconocido como el mismo oficio.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'prophex'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'prophex') AND locale = 'en'), '61100e47-61c4-41ea-abed-fb6fe1a0e6a8', 'artist', 'f0e81576-728d-4c68-b416-b2df67101496');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'prophex') AND locale = 'en'), '74ceda61-4766-4711-8091-4c9b90bbb151', 'artist', '559f2ed4-8831-483b-bc00-7cb4f340ad92');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'prophex') AND locale = 'en'), '7e910ddb-a295-4404-b4b3-4ef8ce09c629', 'artist', 'b1c6099c-d348-4003-90fb-d2c4f889034b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'prophex') AND locale = 'es'), '725354ed-70c8-4d74-a842-d613f7644272', 'artist', '559f2ed4-8831-483b-bc00-7cb4f340ad92');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'prophex') AND locale = 'es'), '9d58d7db-7638-491b-8fed-92148704aeaf', 'artist', 'b1c6099c-d348-4003-90fb-d2c4f889034b');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'prophex') AND locale = 'es'), 'd0f94e78-06fa-4757-a456-01790d3dda85', 'artist', 'f0e81576-728d-4c68-b416-b2df67101496');

COMMIT;
