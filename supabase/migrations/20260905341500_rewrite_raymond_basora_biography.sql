BEGIN;

-- Rewrite the catalogue entry for Raymond Basora.
--
-- Raymond Basora. A 133-character filler biography in English, nothing in
-- Spanish, no gender, no genre, no real name -- for an artist the catalogue was
-- already holding under two entries' worth of identity without joining them.
--
-- SOURCES: MusicBrainz, which files him as a rapper, singer and songwriter from
-- the Dominican Republic, male, and which links him to the artist Reign with an
-- "is person" relationship -- that is, Reign is his stage name, not a separate
-- act. Discogs, whose entry for Reign gives the real name Raymond Basora and
-- the same one-line description, and lists the aliases Raymond Basora and
-- Raymond "Reign" Basora. The releases held under both names: "Indestructible"
-- and "Live For The Love".
--
-- NOT WRITTEN: dates, a birthplace, or where he worked. None is documented, and
-- the row's Santo Domingo is the import's default. The prose says Dominican and
-- stops there.
-- FLAGGED: status. Left at needs_review; no image on the row.
-- FLAGGED FOR YOU: if Reign is ever added as a separate entry, it should not be
-- -- it is this same man. The two names belong on one record, which is what the
-- aliases here now say.
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
       name = 'Raymond Basora',
       sort_name = 'Basora, Raymond',
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
       first_name = 'Raymond',
       middle_name = NULL,
       last_name = 'Basora',
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY['Reign', 'Raymond "Reign" Basora']::text[],
       occupations = '["songwriter","composer"]'::jsonb,
       instruments = ARRAY['voice']::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Dominican rapper and songwriter who also records as Reign',
       bio_en = 'Raymond Basora is a Dominican rapper, singer and songwriter. He also records under the name Reign, and the two are the same man rather than two acts.

**Two names, one catalogue**

His work is filed under both billings, which is how a small catalogue ends up looking like two smaller ones. Indestructible and Live For The Love are the records that carry it.

That split matters more than it sounds. An artist whose releases are divided between a legal name and a stage name loses half of whatever a listener or a rights body can find, and the two halves never add up on their own.

**What is not on record**

Nothing about when he was born, where, or which scene he came up in is documented anywhere. What survives is the description — rapper, singer and songwriter — and the two titles.',
       bio_es = 'Raymond Basora es un rapero, cantante y compositor dominicano. Graba también con el nombre de Reign, y los dos son el mismo hombre y no dos artistas.

**Dos nombres, un catálogo**

Su obra está archivada bajo los dos rótulos, que es la manera en que un catálogo pequeño termina pareciendo dos más pequeños todavía. Indestructible y Live For The Love son los discos que lo cargan.

Esa división importa más de lo que suena. Un artista cuyos lanzamientos se reparten entre el nombre legal y el artístico pierde la mitad de lo que puedan encontrar un oyente o una sociedad de derechos, y las dos mitades nunca se suman solas.

**Lo que no está registrado**

No hay nada documentado sobre cuándo nació, dónde, ni de qué escena salió. Lo que sobrevive es la descripción —rapero, cantante y compositor— y los dos títulos.',
       updated_at = now()
 WHERE slug = 'raymond-basora';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'raymond-basora')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'raymond-basora')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Raymond Basora is a Dominican rapper, singer and songwriter. He also records under the name Reign, and the two are the same man rather than two acts.","type":"text"}]},{"type":"paragraph","content":[{"text":"Two names, one catalogue","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"His work is filed under both billings, which is how a small catalogue ends up looking like two smaller ones. Indestructible and Live For The Love are the records that carry it.","type":"text"}]},{"type":"paragraph","content":[{"text":"That split matters more than it sounds. An artist whose releases are divided between a legal name and a stage name loses half of whatever a listener or a rights body can find, and the two halves never add up on their own.","type":"text"}]},{"type":"paragraph","content":[{"text":"What is not on record","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Nothing about when he was born, where, or which scene he came up in is documented anywhere. What survives is the description — rapper, singer and songwriter — and the two titles.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'raymond-basora'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Raymond Basora es un rapero, cantante y compositor dominicano. Graba también con el nombre de Reign, y los dos son el mismo hombre y no dos artistas.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dos nombres, un catálogo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Su obra está archivada bajo los dos rótulos, que es la manera en que un catálogo pequeño termina pareciendo dos más pequeños todavía. Indestructible y Live For The Love son los discos que lo cargan.","type":"text"}]},{"type":"paragraph","content":[{"text":"Esa división importa más de lo que suena. Un artista cuyos lanzamientos se reparten entre el nombre legal y el artístico pierde la mitad de lo que puedan encontrar un oyente o una sociedad de derechos, y las dos mitades nunca se suman solas.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que no está registrado","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"No hay nada documentado sobre cuándo nació, dónde, ni de qué escena salió. Lo que sobrevive es la descripción —rapero, cantante y compositor— y los dos títulos.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'raymond-basora'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
