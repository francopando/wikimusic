BEGIN;

-- Rewrite the catalogue entry for Skeem.
--
-- Skeem. A 133-character filler biography in English, nothing in Spanish, no
-- genre, no gender, no real name.
--
-- SOURCES: MusicBrainz, which files him as Dominican rap, male. His SoundCloud
-- as Skeem El Conde: "Lenin Arias, mejor conocido en el genero urbano y de los
-- reales del hip hop dominicano como Skeem. Es un emcee poco comun como lo
-- denominan muchos." ReverbNation, which gives the same legal name and adds
-- that he grew up in New York. His own uploads for "El Caribe Te Llama", for
-- "El Fuetazo" with Sanchez Family, and for "Deportado", first released in
-- 2008. Dominican hip hop uploads from 2008 and 2011 for "Lo Ma" with Shelow
-- Shaq and for the posse cut "Chiri Bang" alongside Anerap, Raulin 45 and
-- Bigtury Flow. R1 la Esencia's "Street Life", 2020, which features him with DJ
-- Scuff.
--
-- NOT CONFUSED WITH: Skeme, the American rapper from Inglewood, or the South
-- African Skeem. Both dominate a search for the name and neither is this
-- artist.
--
-- NO BIRTHPLACE ASSERTED IN THE PROSE. The row says Santo Domingo, which is the
-- import's default; no source names a town, and the only geography on record is
-- that he grew up in New York. The field is left as it stands rather than
-- guessed at in either direction.
-- FLAGGED: status. Left at needs_review; no image on the row.
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
       name = 'Skeem',
       sort_name = 'Arias, Lenin',
       type = 'solo_artist',
       status = 'needs_review',
       gender = 'male',
       ended = FALSE,
       primary_role = 'rapper',
       primary_genre = 'urban-rap-hip-hop',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Lenin',
       middle_name = NULL,
       last_name = 'Arias',
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY['Skeem El Conde', 'Lenin Arias']::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY['voice']::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Dominican rapper who works as Skeem El Conde; “Deportado”, 2008',
       bio_en = 'Skeem — Lenin Arias, who also bills himself Skeem El Conde — is a Dominican rapper. He grew up in New York and works in Dominican hip hop.

**Deportado**

The record people name first is Deportado, which he put out in 2008. A Dominican rapper raised in New York writing under that title is not choosing a metaphor: deportation is the single most common way a Dominican life in New York ends, and the returned are a recognised class in Santo Domingo with their own English and their own reputation.

El Caribe Te Llama and El Fuetazo, made with the Sánchez Family, belong to the same run.

**The scene he worked in**

He cut Lo Ma with Shelow Shaq in 2008, and turned up on the posse record Chiri Bang alongside Anerap, Raulín 45 and Bigtury Flow. In 2020 he appeared on Street Life by R1 la Esencia, with DJ Scuff.

That list is what a working Dominican rapper’s catalogue looks like: not albums but features, spread across a decade and a scene that documents itself on other people’s uploads.

Those who follow the music call him an unusual emcee. Little else about him has been written down.',
       bio_es = 'Skeem —Lenin Arias, que también se anuncia como Skeem El Conde— es un rapero dominicano. Se crió en Nueva York y trabaja en el hip hop dominicano.

**Deportado**

El disco que la gente nombra primero es Deportado, que sacó en 2008. Un rapero dominicano criado en Nueva York que escribe bajo ese título no está escogiendo una metáfora: la deportación es la manera más común en que se acaba una vida dominicana en Nueva York, y los devueltos son una clase reconocible en Santo Domingo, con su propio inglés y su propia fama.

El Caribe Te Llama y El Fuetazo, hecha con la Sánchez Family, son del mismo tramo.

**La escena en la que trabajó**

Grabó Lo Ma con Shelow Shaq en 2008, y apareció en el tema colectivo Chiri Bang junto a Anerap, Raulín 45 y Bigtury Flow. En 2020 salió en Street Life, de R1 la Esencia, con DJ Scuff.

Esa lista es lo que parece el catálogo de un rapero dominicano que trabaja: no álbumes sino colaboraciones, repartidas a lo largo de una década y de una escena que se documenta a sí misma en las subidas de otros.

Quienes siguen la música lo llaman un emcee poco común. De él no se ha escrito mucho más.',
       updated_at = now()
 WHERE slug = 'skeem';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'skeem')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'skeem')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Skeem — Lenin Arias, who also bills himself Skeem El Conde — is a Dominican rapper. He grew up in New York and works in Dominican hip hop.","type":"text"}]},{"type":"paragraph","content":[{"text":"Deportado","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The record people name first is Deportado, which he put out in 2008. A Dominican rapper raised in New York writing under that title is not choosing a metaphor: deportation is the single most common way a Dominican life in New York ends, and the returned are a recognised class in Santo Domingo with their own English and their own reputation.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Caribe Te Llama and El Fuetazo, made with the Sánchez Family, belong to the same run.","type":"text"}]},{"type":"paragraph","content":[{"text":"The scene he worked in","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He cut Lo Ma with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cadebd75-4af4-4519-9599-6ec606694a36","displayText":"Shelow Shaq","occurrenceId":"443b8ece-0831-4f7e-b60d-4121f14e9fb9"}},{"text":" in 2008, and turned up on the posse record Chiri Bang alongside Anerap, Raulín 45 and Bigtury Flow. In 2020 he appeared on Street Life by ","type":"text"},{"type":"artistReference","attrs":{"artistId":"af23b96d-fe2a-4712-8d6a-972dac1fdb9e","displayText":"R1 la Esencia","occurrenceId":"b4c5c3bb-7832-4b56-88ab-0fe4c83362cd"}},{"text":", with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9bf41d47-c5ab-45e3-b048-7bb7886b0912","displayText":"DJ Scuff","occurrenceId":"1969a68c-96e5-4338-8fea-457d8019c894"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"That list is what a working Dominican rapper’s catalogue looks like: not albums but features, spread across a decade and a scene that documents itself on other people’s uploads.","type":"text"}]},{"type":"paragraph","content":[{"text":"Those who follow the music call him an unusual emcee. Little else about him has been written down.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'skeem'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Skeem —Lenin Arias, que también se anuncia como Skeem El Conde— es un rapero dominicano. Se crió en Nueva York y trabaja en el hip hop dominicano.","type":"text"}]},{"type":"paragraph","content":[{"text":"Deportado","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El disco que la gente nombra primero es Deportado, que sacó en 2008. Un rapero dominicano criado en Nueva York que escribe bajo ese título no está escogiendo una metáfora: la deportación es la manera más común en que se acaba una vida dominicana en Nueva York, y los devueltos son una clase reconocible en Santo Domingo, con su propio inglés y su propia fama.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Caribe Te Llama y El Fuetazo, hecha con la Sánchez Family, son del mismo tramo.","type":"text"}]},{"type":"paragraph","content":[{"text":"La escena en la que trabajó","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Grabó Lo Ma con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"cadebd75-4af4-4519-9599-6ec606694a36","displayText":"Shelow Shaq","occurrenceId":"ead5ffb6-a916-46e4-9910-64e3bf38bc0e"}},{"text":" en 2008, y apareció en el tema colectivo Chiri Bang junto a Anerap, Raulín 45 y Bigtury Flow. En 2020 salió en Street Life, de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"af23b96d-fe2a-4712-8d6a-972dac1fdb9e","displayText":"R1 la Esencia","occurrenceId":"162e48b1-44ff-4b65-aa48-444b129416c2"}},{"text":", con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9bf41d47-c5ab-45e3-b048-7bb7886b0912","displayText":"DJ Scuff","occurrenceId":"99687166-37d5-459a-8b4e-45001943b1b7"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Esa lista es lo que parece el catálogo de un rapero dominicano que trabaja: no álbumes sino colaboraciones, repartidas a lo largo de una década y de una escena que se documenta a sí misma en las subidas de otros.","type":"text"}]},{"type":"paragraph","content":[{"text":"Quienes siguen la música lo llaman un emcee poco común. De él no se ha escrito mucho más.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'skeem'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'skeem') AND locale = 'en'), '1969a68c-96e5-4338-8fea-457d8019c894', 'artist', '9bf41d47-c5ab-45e3-b048-7bb7886b0912');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'skeem') AND locale = 'en'), '443b8ece-0831-4f7e-b60d-4121f14e9fb9', 'artist', 'cadebd75-4af4-4519-9599-6ec606694a36');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'skeem') AND locale = 'en'), 'b4c5c3bb-7832-4b56-88ab-0fe4c83362cd', 'artist', 'af23b96d-fe2a-4712-8d6a-972dac1fdb9e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'skeem') AND locale = 'es'), '162e48b1-44ff-4b65-aa48-444b129416c2', 'artist', 'af23b96d-fe2a-4712-8d6a-972dac1fdb9e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'skeem') AND locale = 'es'), '99687166-37d5-459a-8b4e-45001943b1b7', 'artist', '9bf41d47-c5ab-45e3-b048-7bb7886b0912');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'skeem') AND locale = 'es'), 'ead5ffb6-a916-46e4-9910-64e3bf38bc0e', 'artist', 'cadebd75-4af4-4519-9599-6ec606694a36');

COMMIT;
