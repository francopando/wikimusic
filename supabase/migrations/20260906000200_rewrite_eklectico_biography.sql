BEGIN;

-- Rewrite the catalogue entry for Eklectico.
--
-- Eklectico. Filler in English, nothing in Spanish, no aliases -- on a rapper
-- with two albums and a following, whose entry said nothing at all.
--
-- ADDED: the aliases he actually uses, primary_role singer -> rapper, and
-- composer alongside producer in occupations.
--
-- LEFT ALONE AND FLAGGED: province "Distrito Nacional" and birth_place "Santo
-- Domingo", the importer's default. Nothing found names a town or a barrio.
--
-- LEFT ALONE, editor's call: primary_genre urban-rap-hip-hop with urban-dembow
-- beside it. That was right for the older material; Larga Vida al Rey moves
-- deliberately toward tropical rhythms, and if a third value is wanted, urbano
-- would be the one.
--
-- SOURCES: Taino Libre, 14 November 2025, and Rumbeo the same day, on the album
-- Larga Vida al Rey: "Son 25 canciones que exponen los siete pecados capitales
-- con ritmos tropicales", released after a pause from social media, with
-- "colores mas tropicales y versatiles con el objetivo de conectar con el
-- mercado internacional". La Central X and the album's press conference notice:
-- twenty-five songs produced by Franyer Beatz, four of them collaborations,
-- including Soy Yo with El Don Fortyfive. Spotify, Apple Music and Audiomack
-- for the running order -- Gano El 4rt3, Guayetea, Tekata with Geraldg, Miro Al
-- Cielo, Toa -- and for the album's date and length. His own YouTube channel
-- for the videos Cyber Girl, Redes, Amigos, Discimula, Intenso, Amaneci, Kacha2
-- and Me Persiguen, and for the EP Mas Triste Que Nunca and its deluxe edition,
-- of which Intenso is the opening track. MusicBrainz for the single Prendela,
-- 12 December 2023. His own accounts for the billing "El Rey Del Cielo", for
-- the second handle @eklecticodiablo, for the collective Los Excluidos, and for
-- the executive production credit to Lobo Money Corp. A live billing pairing
-- him with DJ Scuff.
--
-- NOT WRITTEN: a real name and a birth date. Neither is published anywhere
-- found, and follower counts, which the coverage leads with.
--
-- NOT LINKED: El Don Fortyfive, Geraldg, Franyer Beatz, Tito Flow and Los
-- Excluidos have no entries.
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
       name = 'Eklectico',
       sort_name = 'Eklectico',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'rapper',
       primary_genre = 'urban-rap-hip-hop',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = 'Eklectico',
       aliases = ARRAY['Eklectico Diablo', 'El Rey del Cielo']::text[],
       occupations = '["producer","composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urban-dembow', 'urbano']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@Eklectico',
       facebook = 'eklecticolobo',
       instagram = 'eklectico',
       disambiguation = 'Dominican rapper; author of the album Larga Vida al Rey',
       bio_en = 'Eklectico is a Dominican rapper who bills himself as el Rey del Cielo and records under a second name, Eklectico Diablo. He belongs to the Los Excluidos collective.

**Más Triste Que Nunca**

The earlier record is exactly what its title says. Intenso opens it and Amanecí sits inside it, and the mode is Dominican street rap at close range — short tracks, dry production, no reaching for a chorus.

Me Persiguen, Kacha2 and Prendela come from the same stretch, and Como Ali paired him with Amenazzy. He has also shared a stage with DJ Scuff, which in Dominican rap is a kind of credential in itself.

**Larga Vida al Rey**

In November 2025, after stepping away from the platforms for a while, he came back with twenty-five songs and a stated concept: the seven deadly sins, one idea per track. Franyer Beatz produced all of it. Four songs are collaborations, among them Soy Yo with El Don Fortyfive and Tekata with Geraldg.

The Dominican press treated it as a break with what he had been doing, and it is. The rhythms are tropical where the rap was dry, and he said plainly that the point was to reach outside the country.

Gano El 4rt3, Guayetea, Miro Al Cielo, Toa, Cyber Girl, Redes, Amigos, Discímula. Twenty-five tracks in under an hour is a specific choice — each one is short enough to be a fragment, and the album works as an accumulation rather than as a sequence.

**A concept album in a genre that does not make them**

Dominican rap and dembow are singles businesses. Records are made to be extracted from, and the album as a form is largely a container. Building one around the seven deadly sins, announcing it at a press conference and asking listeners to hear it whole is a bet against how the music is normally consumed.

Whether it works is not settled. That he tried it is the reason the record is worth naming.',
       bio_es = 'Eklectico es un rapero dominicano que se anuncia como el Rey del Cielo y graba también bajo un segundo nombre, Eklectico Diablo. Pertenece al colectivo Los Excluidos.

**Más Triste Que Nunca**

El disco anterior es exactamente lo que dice su título. Intenso lo abre y Amanecí está adentro, y el registro es rap de calle dominicano de cerca: temas cortos, producción seca, sin buscarle el coro.

Me Persiguen, Kacha2 y Préndela vienen del mismo tramo, y Como Ali lo juntó con Amenazzy. También ha compartido tarima con DJ Scuff, que en el rap dominicano es una credencial por sí sola.

**Larga Vida al Rey**

En noviembre de 2025, después de apartarse un tiempo de las plataformas, volvió con veinticinco canciones y un concepto declarado: los siete pecados capitales, una idea por tema. Franyer Beatz lo produjo entero. Cuatro canciones son colaboraciones, entre ellas Soy Yo con El Don Fortyfive y Tekata con Geraldg.

La prensa dominicana lo trató como un corte con lo que venía haciendo, y lo es. Los ritmos son tropicales donde el rap era seco, y él dijo sin rodeos que la intención era llegar fuera del país.

Gano El 4rt3, Guayetea, Miro Al Cielo, Toa, Cyber Girl, Redes, Amigos, Discímula. Veinticinco temas en menos de una hora es una decisión concreta: cada uno es lo bastante corto como para ser un fragmento, y el álbum funciona por acumulación y no como secuencia.

**Un disco conceptual en un género que no los hace**

El rap y el dembow dominicanos son negocios de sencillos. Los discos se hacen para sacarles temas, y el álbum como forma es sobre todo un envase. Armar uno alrededor de los siete pecados capitales, anunciarlo en rueda de prensa y pedirle al oyente que lo oiga entero es apostar contra la manera en que se consume esta música.

Si funciona o no está por verse. Que lo haya intentado es la razón por la que vale la pena nombrar el disco.',
       updated_at = now()
 WHERE slug = 'eklectico';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'eklectico')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'eklectico')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Eklectico is a Dominican rapper who bills himself as el Rey del Cielo and records under a second name, Eklectico Diablo. He belongs to the Los Excluidos collective.","type":"text"}]},{"type":"paragraph","content":[{"text":"Más Triste Que Nunca","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The earlier record is exactly what its title says. Intenso opens it and Amanecí sits inside it, and the mode is Dominican street rap at close range — short tracks, dry production, no reaching for a chorus.","type":"text"}]},{"type":"paragraph","content":[{"text":"Me Persiguen, Kacha2 and Prendela come from the same stretch, and Como Ali paired him with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"5fb12fee-64fe-4887-b87e-28f28a15c4f9","displayText":"Amenazzy","occurrenceId":"a8c1c783-fd99-4075-b302-31cde59fe096"}},{"text":". He has also shared a stage with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9bf41d47-c5ab-45e3-b048-7bb7886b0912","displayText":"DJ Scuff","occurrenceId":"31a2f653-2f3e-4023-8a73-ec16f9b7f4be"}},{"text":", which in Dominican rap is a kind of credential in itself.","type":"text"}]},{"type":"paragraph","content":[{"text":"Larga Vida al Rey","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In November 2025, after stepping away from the platforms for a while, he came back with twenty-five songs and a stated concept: the seven deadly sins, one idea per track. Franyer Beatz produced all of it. Four songs are collaborations, among them Soy Yo with El Don Fortyfive and Tekata with Geraldg.","type":"text"}]},{"type":"paragraph","content":[{"text":"The Dominican press treated it as a break with what he had been doing, and it is. The rhythms are tropical where the rap was dry, and he said plainly that the point was to reach outside the country.","type":"text"}]},{"type":"paragraph","content":[{"text":"Gano El 4rt3, Guayetea, Miro Al Cielo, Toa, Cyber Girl, Redes, Amigos, Discímula. Twenty-five tracks in under an hour is a specific choice — each one is short enough to be a fragment, and the album works as an accumulation rather than as a sequence.","type":"text"}]},{"type":"paragraph","content":[{"text":"A concept album in a genre that does not make them","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dominican rap and dembow are singles businesses. Records are made to be extracted from, and the album as a form is largely a container. Building one around the seven deadly sins, announcing it at a press conference and asking listeners to hear it whole is a bet against how the music is normally consumed.","type":"text"}]},{"type":"paragraph","content":[{"text":"Whether it works is not settled. That he tried it is the reason the record is worth naming.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'eklectico'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Eklectico es un rapero dominicano que se anuncia como el Rey del Cielo y graba también bajo un segundo nombre, Eklectico Diablo. Pertenece al colectivo Los Excluidos.","type":"text"}]},{"type":"paragraph","content":[{"text":"Más Triste Que Nunca","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El disco anterior es exactamente lo que dice su título. Intenso lo abre y Amanecí está adentro, y el registro es rap de calle dominicano de cerca: temas cortos, producción seca, sin buscarle el coro.","type":"text"}]},{"type":"paragraph","content":[{"text":"Me Persiguen, Kacha2 y Préndela vienen del mismo tramo, y Como Ali lo juntó con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"5fb12fee-64fe-4887-b87e-28f28a15c4f9","displayText":"Amenazzy","occurrenceId":"85b33e0c-1673-4691-be48-27389c3bfc77"}},{"text":". También ha compartido tarima con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9bf41d47-c5ab-45e3-b048-7bb7886b0912","displayText":"DJ Scuff","occurrenceId":"b45d05f7-ee7c-4f04-8ca9-48ff3c22f0ce"}},{"text":", que en el rap dominicano es una credencial por sí sola.","type":"text"}]},{"type":"paragraph","content":[{"text":"Larga Vida al Rey","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En noviembre de 2025, después de apartarse un tiempo de las plataformas, volvió con veinticinco canciones y un concepto declarado: los siete pecados capitales, una idea por tema. Franyer Beatz lo produjo entero. Cuatro canciones son colaboraciones, entre ellas Soy Yo con El Don Fortyfive y Tekata con Geraldg.","type":"text"}]},{"type":"paragraph","content":[{"text":"La prensa dominicana lo trató como un corte con lo que venía haciendo, y lo es. Los ritmos son tropicales donde el rap era seco, y él dijo sin rodeos que la intención era llegar fuera del país.","type":"text"}]},{"type":"paragraph","content":[{"text":"Gano El 4rt3, Guayetea, Miro Al Cielo, Toa, Cyber Girl, Redes, Amigos, Discímula. Veinticinco temas en menos de una hora es una decisión concreta: cada uno es lo bastante corto como para ser un fragmento, y el álbum funciona por acumulación y no como secuencia.","type":"text"}]},{"type":"paragraph","content":[{"text":"Un disco conceptual en un género que no los hace","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El rap y el dembow dominicanos son negocios de sencillos. Los discos se hacen para sacarles temas, y el álbum como forma es sobre todo un envase. Armar uno alrededor de los siete pecados capitales, anunciarlo en rueda de prensa y pedirle al oyente que lo oiga entero es apostar contra la manera en que se consume esta música.","type":"text"}]},{"type":"paragraph","content":[{"text":"Si funciona o no está por verse. Que lo haya intentado es la razón por la que vale la pena nombrar el disco.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'eklectico'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'eklectico') AND locale = 'en'), '31a2f653-2f3e-4023-8a73-ec16f9b7f4be', 'artist', '9bf41d47-c5ab-45e3-b048-7bb7886b0912');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'eklectico') AND locale = 'en'), 'a8c1c783-fd99-4075-b302-31cde59fe096', 'artist', '5fb12fee-64fe-4887-b87e-28f28a15c4f9');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'eklectico') AND locale = 'es'), '85b33e0c-1673-4691-be48-27389c3bfc77', 'artist', '5fb12fee-64fe-4887-b87e-28f28a15c4f9');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'eklectico') AND locale = 'es'), 'b45d05f7-ee7c-4f04-8ca9-48ff3c22f0ce', 'artist', '9bf41d47-c5ab-45e3-b048-7bb7886b0912');

COMMIT;
