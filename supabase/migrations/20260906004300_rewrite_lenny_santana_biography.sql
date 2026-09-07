BEGIN;

-- Rewrite the catalogue entry for Lenny Santana.
--
-- Lenny Santana. Filler in English, nothing in Spanish, no genres, no place.
--
-- ADDED: occupations composer beside the musician already stored, genres,
-- disambiguation, the diaspora tag, and the website field left as it was.
-- primary_role singer and primary_genre bachata were already right.
--
-- LEFT EMPTY AND FLAGGED: province and birth_place stay NULL. He is Dominican
-- -- MusicBrainz gives country DO, his own profile text opens "artista y
-- compositor dominicano", and his posts tag República Dominicana -- but no
-- source names the town he comes from, and Gijón, where he lives, is not it.
-- Writing Gijón into birth_place would put a Spanish city in a column that
-- means origin.
--
-- SOURCES: his Spotify artist profile, which is text he supplies himself and is
-- treated here as self-description rather than as reporting: the base in Gijón,
-- Asturias; the start in urbano and reggaetón before bachata; the description of
-- the style as bachata romántica with urban touches; and Estrellita and Vuelve
-- Junto a Mí, the latter with Sandro Reyes. MusicBrainz for Vuelve junto a mi,
-- 2022, and the country. His own Facebook and Instagram, located in Gijón, for
-- the Sandro Reyes sessions of August 2024 and for Gijón del Alma, released
-- October 2025. Spotify's release list for A Primera Vista, Dama de Otro and
-- the bachata version of Señora de las Cuatro Décadas.
--
-- A JUDGEMENT ABOUT THE SOURCE. The profile text carries the marks of having
-- been generated: emoji section headings, "puente cultural", "nueva ola". The
-- claims taken from it are only the ones the discography independently confirms
-- -- Gijón, the collaborator, the song titles, the genre. The self-praise is not
-- used.
--
-- NOT WRITTEN: listener counts.
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
       name = 'Lenny Santana',
       sort_name = 'Santana, Lenny',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'bachata',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = NULL,
       province = NULL,
       first_name = 'Lenny',
       middle_name = NULL,
       last_name = 'Santana',
       second_last_name = NULL,
       stage_name = 'Lenny Santana',
       aliases = ARRAY[]::text[],
       occupations = '["musician","composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'ballads-romantic']::text[],
       artist_tags = ARRAY['secular', 'diaspora']::text[],
       website = NULL,
       youtube = '@lennysantanaoficial',
       facebook = 'alanromers',
       instagram = 'lennysantanaoficial',
       disambiguation = 'Dominican bachata singer working out of Gijón, Asturias',
       bio_en = 'Lenny Santana is a Dominican bachata singer and songwriter who works out of Gijón, in Asturias. He began in urbano and reggaetón and moved to bachata, which is the less usual direction of travel.

**Bachata from the north of Spain**

Asturias is not where anyone expects to find a Dominican bachatero. It is a cold, green, industrial corner of Spain with a long history of receiving migrants rather than sending them, and the Dominican community there is small enough that a working singer has to make his living partly outside it.

That shows in the material. He wrote Gijón del Alma and cut it as a bachata — a song for the Spanish city, in a Dominican rhythm, which is a fairly precise description of the position he occupies.

**The records**

Estrellita is the one his own audience asks for. Vuelve Junto a Mí, from 2022, was made with Sandro Reyes, another Dominican bachatero who works the same European circuit; the two of them have kept turning up on each other’s sessions since.

A Primera Vista and Dama de Otro followed, along with a bachata reading of Señora de las Cuatro Décadas. Covering a Ricardo Montaner ballad as a bachata is standard practice in the genre and always has been: bachata has absorbed the Latin American romantic songbook for fifty years and given it back with a requinto on top.

Nothing else about him is documented — no date of birth, and no town in the Dominican Republic, only the country.',
       bio_es = 'Lenny Santana es un cantante y compositor dominicano de bachata que trabaja desde Gijón, en Asturias. Empezó en el urbano y el reguetón y se pasó a la bachata, que es la dirección menos habitual del recorrido.

**Bachata desde el norte de España**

Asturias no es donde nadie espera encontrar un bachatero dominicano. Es un rincón frío, verde e industrial de España con una historia larga de recibir migrantes más que de mandarlos, y la comunidad dominicana de allí es lo bastante pequeña como para que un cantante de oficio tenga que ganarse la vida en parte fuera de ella.

Eso se le nota en el material. Escribió Gijón del Alma y la grabó como bachata: una canción para la ciudad española, en ritmo dominicano, que es una descripción bastante exacta del lugar que ocupa.

**Los discos**

Estrellita es la que le pide su público. Vuelve Junto a Mí, de 2022, la hizo con Sandro Reyes, otro bachatero dominicano que trabaja el mismo circuito europeo; desde entonces los dos siguen apareciendo en las sesiones del otro.

Detrás vinieron A Primera Vista y Dama de Otro, y una lectura en bachata de Señora de las Cuatro Décadas. Versionar una balada de Ricardo Montaner en bachata es práctica corriente del género y siempre lo ha sido: la bachata lleva cincuenta años absorbiendo el cancionero romántico latinoamericano y devolviéndolo con un requinto encima.

De él no hay nada más documentado: ni fecha de nacimiento, ni pueblo en la República Dominicana, solo el país.',
       updated_at = now()
 WHERE slug = 'lenny-santana';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'lenny-santana')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'lenny-santana')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Lenny Santana is a Dominican bachata singer and songwriter who works out of Gijón, in Asturias. He began in urbano and reggaetón and moved to bachata, which is the less usual direction of travel.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bachata from the north of Spain","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Asturias is not where anyone expects to find a Dominican bachatero. It is a cold, green, industrial corner of Spain with a long history of receiving migrants rather than sending them, and the Dominican community there is small enough that a working singer has to make his living partly outside it.","type":"text"}]},{"type":"paragraph","content":[{"text":"That shows in the material. He wrote Gijón del Alma and cut it as a bachata — a song for the Spanish city, in a Dominican rhythm, which is a fairly precise description of the position he occupies.","type":"text"}]},{"type":"paragraph","content":[{"text":"The records","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Estrellita is the one his own audience asks for. Vuelve Junto a Mí, from 2022, was made with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"1ffa8278-8997-457a-9f93-8e6ec608e68f","displayText":"Sandro Reyes","occurrenceId":"862c6504-4aec-4989-af82-9e4ed17b4dd0"}},{"text":", another Dominican bachatero who works the same European circuit; the two of them have kept turning up on each other’s sessions since.","type":"text"}]},{"type":"paragraph","content":[{"text":"A Primera Vista and Dama de Otro followed, along with a bachata reading of Señora de las Cuatro Décadas. Covering a Ricardo Montaner ballad as a bachata is standard practice in the genre and always has been: bachata has absorbed the Latin American romantic songbook for fifty years and given it back with a requinto on top.","type":"text"}]},{"type":"paragraph","content":[{"text":"Nothing else about him is documented — no date of birth, and no town in the Dominican Republic, only the country.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'lenny-santana'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Lenny Santana es un cantante y compositor dominicano de bachata que trabaja desde Gijón, en Asturias. Empezó en el urbano y el reguetón y se pasó a la bachata, que es la dirección menos habitual del recorrido.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bachata desde el norte de España","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Asturias no es donde nadie espera encontrar un bachatero dominicano. Es un rincón frío, verde e industrial de España con una historia larga de recibir migrantes más que de mandarlos, y la comunidad dominicana de allí es lo bastante pequeña como para que un cantante de oficio tenga que ganarse la vida en parte fuera de ella.","type":"text"}]},{"type":"paragraph","content":[{"text":"Eso se le nota en el material. Escribió Gijón del Alma y la grabó como bachata: una canción para la ciudad española, en ritmo dominicano, que es una descripción bastante exacta del lugar que ocupa.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los discos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Estrellita es la que le pide su público. Vuelve Junto a Mí, de 2022, la hizo con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"1ffa8278-8997-457a-9f93-8e6ec608e68f","displayText":"Sandro Reyes","occurrenceId":"246ecbdb-eab6-4fe8-87df-4b84ce6d7b62"}},{"text":", otro bachatero dominicano que trabaja el mismo circuito europeo; desde entonces los dos siguen apareciendo en las sesiones del otro.","type":"text"}]},{"type":"paragraph","content":[{"text":"Detrás vinieron A Primera Vista y Dama de Otro, y una lectura en bachata de Señora de las Cuatro Décadas. Versionar una balada de Ricardo Montaner en bachata es práctica corriente del género y siempre lo ha sido: la bachata lleva cincuenta años absorbiendo el cancionero romántico latinoamericano y devolviéndolo con un requinto encima.","type":"text"}]},{"type":"paragraph","content":[{"text":"De él no hay nada más documentado: ni fecha de nacimiento, ni pueblo en la República Dominicana, solo el país.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'lenny-santana'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'lenny-santana') AND locale = 'en'), '862c6504-4aec-4989-af82-9e4ed17b4dd0', 'artist', '1ffa8278-8997-457a-9f93-8e6ec608e68f');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'lenny-santana') AND locale = 'es'), '246ecbdb-eab6-4fe8-87df-4b84ce6d7b62', 'artist', '1ffa8278-8997-457a-9f93-8e6ec608e68f');

COMMIT;
