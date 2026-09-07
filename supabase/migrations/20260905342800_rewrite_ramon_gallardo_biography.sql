BEGIN;

-- Rewrite the catalogue entry for Ramón Gallardo.
--
-- Ramon Gallardo. Filler in English, nothing in Spanish, no occupations, no
-- instruments -- and the wrong primary role. He was filed as a singer. He was a
-- pianist, and the singing in his combo was done by somebody else.
--
-- CORRECTED: primary_role singer -> musical_director. Jose del Castillo
-- Pichardo calls him a pianist and calls the group "el combo del pianista
-- puertoplateno Ramon Gallardo"; every recording that names a voice names
-- Rafelito Martinez, not him. Added occupations pianist / bandleader /
-- composer, instruments piano, and the sort_name the row lacked.
--
-- LEFT ALONE: primary_genre merengue. A six-piece combo working a dance hall in
-- the sixties played merengue and bolero both, so merengue-orquesta is arguable,
-- but the genre is the editor's call and the stored value is not wrong.
--
-- SOURCES: Jose del Castillo Pichardo, "El Bolero de la Feria", Diario Libre,
-- 21 May 2011, reprinted by AlMomento and carried in Historia del Bolero
-- Dominicano: the dance hall Tipico Najayo opened in 1957 and was renamed
-- Tipico Quisqueyano after the assassination of Trujillo, because the old name
-- pointed at the dictator's home ground; "En el Tipico Quisqueyano reinaba el
-- combo del pianista puertoplateno Ramon Gallardo"; and Rafelito Martinez is
-- given there as Santiago, 1925. Los Archivos de Americo Mejia: the combo was
-- six musicians. Instagram's mashistoriaderd on Rafelito Martinez, born 2 May
-- 1925 in Los Pepines, Santiago, sixteen years as the voice of Ramon Gallardo y
-- su Combo, with La Miseria, Muchachos, Canto de Hacha, Catarey and Amores
-- Escondidos among the titles. Rafael Martinez's son, writing publicly, calls
-- his father and Gallardo "uno de los mejores binomios". Discogs and Spotify
-- for the records: Merengueando (1965), En El Tipico Quisqueyano Najayo (1966),
-- Ahora Si! Gallardo "Merengueando" (1967), Gallardo en Navidad (1971), Los
-- mejores 25 exitos (1975), with La Mulatona, Chanflin, Taxi Driver, El Pajaro
-- Chogui and the Mosaicos. elpachineo's transfers of La Miseria and Chanflin,
-- both credited on screen to Rafelito Martinez as vocalist. Efemerides
-- Barahoneras for Medio Millon, popularised by "el conocido conjunto del
-- maestro Ramon Gallardo".
--
-- NOT WRITTEN: birth and death dates. Neither is published.
--
-- NOT LINKED: Rafelito Martinez, who has no entry and plainly deserves one.
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
       name = 'Ramón Gallardo',
       sort_name = 'Gallardo, Ramón',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'musical_director',
       primary_genre = 'merengue',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Puerto Plata',
       province = 'Puerto Plata',
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY[]::text[],
       occupations = '["pianist","bandleader","composer"]'::jsonb,
       instruments = ARRAY['piano']::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Dominican pianist and bandleader; led Ramón Gallardo y su Combo at the Típico Quisqueyano',
       bio_en = 'Ramón Gallardo was a Dominican pianist and bandleader from Puerto Plata. His six-piece group, Ramón Gallardo y su Combo, held the stand at the Típico Quisqueyano, the big dance hall of the Feria de la Paz, and made the merengue records that a generation of Santo Domingo dancers grew up on.

**The hall and its name**

The ballroom opened in 1957 as the Típico Najayo. After Trujillo was killed the name had to go — it pointed at ground the dictator owned — and it reopened as the Típico Quisqueyano. Gallardo’s combo ruled it. The historian José del Castillo Pichardo, remembering the room, describes the pianist from Puerto Plata as a heavyset, big-headed man with tired eyes and a seductive moustache, and it is his combo he names first.

Six musicians is a small band for a hall that size. What it means is that everybody is audible and nobody can coast, and it is why those recordings sound spare next to the big orchestras of the same years.

**Gallardo and Rafelito**

The voice was Rafelito Martínez, born in Los Pepines, Santiago, in 1925, who stayed sixteen years. His son calls the pair one of the best two-man teams merengue produced, and the recordings bear it out: La Miseria, Chanflín, Muchachos, Canto de Hacha, Catarey, Amores Escondidos. Every one of those labels says Ramón Gallardo y su Combo, canta Rafelito Martínez.

La Miseria is the one that survived hardest. It is a merengue about being broke, sung without self-pity and at speed, and it still turns up on Dominican playlists sixty years later.

**The records**

Merengueando came first, then En El Típico Quisqueyano Najayo, which carries the hall’s two names on the same sleeve, and Taxi Driver with it. Ahora Sí! Gallardo followed, then Gallardo en Navidad, and a twenty-five track retrospective after that. La Mulatona was big enough to be recycled into mosaicos twice over.

The combo also cut El Pájaro Chogüí, the Paraguayan song that Wilfrido Vargas would later turn into a merengue standard with Sandy Reyes singing it. Gallardo got there first, which is a thing his listeners still point out.

He wrote as well as played. Medio Millón was popularised by his group, and Dominican singers of the period took songs of his into their own repertoires.',
       bio_es = 'Ramón Gallardo fue un pianista y director de conjunto dominicano, de Puerto Plata. Su grupo de seis músicos, Ramón Gallardo y su Combo, tenía la plaza del Típico Quisqueyano, el gran salón de baile de la Feria de la Paz, y grabó los merengues con los que creció una generación de bailadores de Santo Domingo.

**El salón y su nombre**

El salón abrió en 1957 como Típico Najayo. Después de que mataran a Trujillo el nombre tuvo que irse —señalaba a un terreno del dictador— y reabrió como Típico Quisqueyano. El combo de Gallardo lo dominaba. El historiador José del Castillo Pichardo, recordando aquel salón, describe al pianista puertoplateño como un fornido cabezón de ojos cansados y bigotes seductores, y es su combo el primero que nombra.

Seis músicos son pocos para un salón de ese tamaño. Lo que eso significa es que todo el mundo se oye y nadie puede esconderse, y por eso aquellas grabaciones suenan escuetas al lado de las grandes orquestas de los mismos años.

**Gallardo y Rafelito**

La voz era Rafelito Martínez, nacido en Los Pepines, Santiago, en 1925, que se quedó dieciséis años. Su hijo llama a los dos uno de los mejores binomios que dio el merengue, y las grabaciones lo confirman: La Miseria, Chanflín, Muchachos, Canto de Hacha, Catarey, Amores Escondidos. Todas esas etiquetas dicen Ramón Gallardo y su Combo, canta Rafelito Martínez.

La Miseria es la que más duro sobrevivió. Es un merengue sobre estar pelado, cantado sin lástima de sí mismo y a toda velocidad, y todavía aparece en las listas dominicanas sesenta años después.

**Los discos**

Primero vino Merengueando, después En El Típico Quisqueyano Najayo, que lleva los dos nombres del salón en la misma portada, y con él Taxi Driver. Detrás, Ahora Sí! Gallardo, luego Gallardo en Navidad, y más tarde una retrospectiva de veinticinco temas. La Mulatona pegó lo suficiente como para ser reciclada en mosaicos dos veces.

El combo también grabó El Pájaro Chogüí, la canción paraguaya que después Wilfrido Vargas convertiría en un clásico del merengue con Sandy Reyes cantándola. Gallardo llegó primero, y eso es algo que sus oyentes todavía señalan.

Componía además de tocar. Medio Millón lo popularizó su conjunto, y cantantes dominicanos de la época se llevaron temas suyos a sus propios repertorios.',
       updated_at = now()
 WHERE slug = 'ramon-gallardo';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ramon-gallardo')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ramon-gallardo')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Ramón Gallardo was a Dominican pianist and bandleader from Puerto Plata. His six-piece group, Ramón Gallardo y su Combo, held the stand at the Típico Quisqueyano, the big dance hall of the Feria de la Paz, and made the merengue records that a generation of Santo Domingo dancers grew up on.","type":"text"}]},{"type":"paragraph","content":[{"text":"The hall and its name","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The ballroom opened in 1957 as the Típico Najayo. After Trujillo was killed the name had to go — it pointed at ground the dictator owned — and it reopened as the Típico Quisqueyano. Gallardo’s combo ruled it. The historian José del Castillo Pichardo, remembering the room, describes the pianist from Puerto Plata as a heavyset, big-headed man with tired eyes and a seductive moustache, and it is his combo he names first.","type":"text"}]},{"type":"paragraph","content":[{"text":"Six musicians is a small band for a hall that size. What it means is that everybody is audible and nobody can coast, and it is why those recordings sound spare next to the big orchestras of the same years.","type":"text"}]},{"type":"paragraph","content":[{"text":"Gallardo and Rafelito","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The voice was Rafelito Martínez, born in Los Pepines, Santiago, in 1925, who stayed sixteen years. His son calls the pair one of the best two-man teams merengue produced, and the recordings bear it out: La Miseria, Chanflín, Muchachos, Canto de Hacha, Catarey, Amores Escondidos. Every one of those labels says Ramón Gallardo y su Combo, canta Rafelito Martínez.","type":"text"}]},{"type":"paragraph","content":[{"text":"La Miseria is the one that survived hardest. It is a merengue about being broke, sung without self-pity and at speed, and it still turns up on Dominican playlists sixty years later.","type":"text"}]},{"type":"paragraph","content":[{"text":"The records","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Merengueando came first, then En El Típico Quisqueyano Najayo, which carries the hall’s two names on the same sleeve, and Taxi Driver with it. Ahora Sí! Gallardo followed, then Gallardo en Navidad, and a twenty-five track retrospective after that. La Mulatona was big enough to be recycled into mosaicos twice over.","type":"text"}]},{"type":"paragraph","content":[{"text":"The combo also cut El Pájaro Chogüí, the Paraguayan song that ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"f7df2984-5edb-4d1e-b1f4-e51fdb9d9846"}},{"text":" would later turn into a merengue standard with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"49f8aae7-e066-4b01-a836-126082163c52","displayText":"Sandy Reyes","occurrenceId":"c1940eb1-dab3-4a82-adad-0b53336704a9"}},{"text":" singing it. Gallardo got there first, which is a thing his listeners still point out.","type":"text"}]},{"type":"paragraph","content":[{"text":"He wrote as well as played. Medio Millón was popularised by his group, and Dominican singers of the period took songs of his into their own repertoires.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'ramon-gallardo'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Ramón Gallardo fue un pianista y director de conjunto dominicano, de Puerto Plata. Su grupo de seis músicos, Ramón Gallardo y su Combo, tenía la plaza del Típico Quisqueyano, el gran salón de baile de la Feria de la Paz, y grabó los merengues con los que creció una generación de bailadores de Santo Domingo.","type":"text"}]},{"type":"paragraph","content":[{"text":"El salón y su nombre","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El salón abrió en 1957 como Típico Najayo. Después de que mataran a Trujillo el nombre tuvo que irse —señalaba a un terreno del dictador— y reabrió como Típico Quisqueyano. El combo de Gallardo lo dominaba. El historiador José del Castillo Pichardo, recordando aquel salón, describe al pianista puertoplateño como un fornido cabezón de ojos cansados y bigotes seductores, y es su combo el primero que nombra.","type":"text"}]},{"type":"paragraph","content":[{"text":"Seis músicos son pocos para un salón de ese tamaño. Lo que eso significa es que todo el mundo se oye y nadie puede esconderse, y por eso aquellas grabaciones suenan escuetas al lado de las grandes orquestas de los mismos años.","type":"text"}]},{"type":"paragraph","content":[{"text":"Gallardo y Rafelito","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La voz era Rafelito Martínez, nacido en Los Pepines, Santiago, en 1925, que se quedó dieciséis años. Su hijo llama a los dos uno de los mejores binomios que dio el merengue, y las grabaciones lo confirman: La Miseria, Chanflín, Muchachos, Canto de Hacha, Catarey, Amores Escondidos. Todas esas etiquetas dicen Ramón Gallardo y su Combo, canta Rafelito Martínez.","type":"text"}]},{"type":"paragraph","content":[{"text":"La Miseria es la que más duro sobrevivió. Es un merengue sobre estar pelado, cantado sin lástima de sí mismo y a toda velocidad, y todavía aparece en las listas dominicanas sesenta años después.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los discos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Primero vino Merengueando, después En El Típico Quisqueyano Najayo, que lleva los dos nombres del salón en la misma portada, y con él Taxi Driver. Detrás, Ahora Sí! Gallardo, luego Gallardo en Navidad, y más tarde una retrospectiva de veinticinco temas. La Mulatona pegó lo suficiente como para ser reciclada en mosaicos dos veces.","type":"text"}]},{"type":"paragraph","content":[{"text":"El combo también grabó El Pájaro Chogüí, la canción paraguaya que después ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"155a00b3-d558-4399-af0c-a9722af867dd"}},{"text":" convertiría en un clásico del merengue con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"49f8aae7-e066-4b01-a836-126082163c52","displayText":"Sandy Reyes","occurrenceId":"ccdc53b7-6a7b-4769-a26e-63ebd948fab5"}},{"text":" cantándola. Gallardo llegó primero, y eso es algo que sus oyentes todavía señalan.","type":"text"}]},{"type":"paragraph","content":[{"text":"Componía además de tocar. Medio Millón lo popularizó su conjunto, y cantantes dominicanos de la época se llevaron temas suyos a sus propios repertorios.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'ramon-gallardo'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ramon-gallardo') AND locale = 'en'), 'c1940eb1-dab3-4a82-adad-0b53336704a9', 'artist', '49f8aae7-e066-4b01-a836-126082163c52');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ramon-gallardo') AND locale = 'en'), 'f7df2984-5edb-4d1e-b1f4-e51fdb9d9846', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ramon-gallardo') AND locale = 'es'), '155a00b3-d558-4399-af0c-a9722af867dd', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ramon-gallardo') AND locale = 'es'), 'ccdc53b7-6a7b-4769-a26e-63ebd948fab5', 'artist', '49f8aae7-e066-4b01-a836-126082163c52');

COMMIT;
