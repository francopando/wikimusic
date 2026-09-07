BEGIN;

-- Crispín Fernández: the English and Spanish biographies are on the wrong
-- locales.
--
-- Found while checking a report that Pirou Pérez's Spanish page was showing
-- English. Pirou's documents are correct in the database. This row is the one
-- that actually has the fault, and it is the only one: a sweep of all 419
-- Spanish editorial documents, scoring English function words against Spanish
-- ones inside every text node, returns exactly one hit.
--
--   editorial_documents locale 'en'  ->  holds the SPANISH text
--   editorial_documents locale 'es'  ->  holds the ENGLISH text
--   artists.bio_en                   ->  holds the SPANISH markdown
--   artists.bio_es                   ->  holds the ENGLISH markdown
--
-- WHY THE CONTENT IS SWAPPED AND NOT THE LOCALE LABEL. The obvious fix is to
-- exchange the two locale values, but the partial unique index
-- editorial_documents_artist_biography_locale_uidx on (document_type,
-- owner_artist_id, locale) makes a two-row swap of that column collide, and the
-- locale CHECK constraint allows only 'en' and 'es', so there is no third value
-- to pivot through.
--
-- The documents cannot simply have their JSON exchanged either:
-- editorial_entity_references.occurrence_id refers to an id that appears inside
-- the document JSON -- verified, every occurrence_id in this artist's nine
-- reference rows per locale is present in its own document's text. So the
-- reference rows have to travel with the text they point into.
--
-- This migration therefore swaps BOTH: the document JSON between the two rows,
-- and editorial_document_id on every reference row belonging to this artist.
-- Each locale ends up holding the right language with its own references intact.
-- artists.bio_en and artists.bio_es are swapped to match.
--
-- WHAT THIS DOES NOT FIX. Both documents contain raw markdown pasted into text
-- nodes -- "**Crispín Fernández Minaya**" and "## **Primeros años y formación**"
-- as literal characters inside paragraphs rather than as a section title block.
-- That renders as visible asterisks and hashes and it breaks the rule that bold
-- is for section titles only. Eight other published artists have the same fault:
-- dalvin-la-melodia, dioni-fernandez-y-el-equipo, frank-cruz, julito-deschamps,
-- peter-cruz, dj-mari-d, dj-scuff and dominic. Fixing that means rebuilding each
-- document through the editorial pipeline, which is a separate pass and an
-- editor's decision. This migration only puts the two languages the right way
-- round.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

CREATE TEMP TABLE crispin_swap ON COMMIT DROP AS
SELECT
  (SELECT id FROM editorial_documents
     WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez')
       AND locale = 'en') AS id_en,
  (SELECT id FROM editorial_documents
     WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'crispin-fernandez')
       AND locale = 'es') AS id_es;

CREATE TEMP TABLE crispin_docs ON COMMIT DROP AS
SELECT d.id, d.document
  FROM editorial_documents d, crispin_swap s
 WHERE d.id IN (s.id_en, s.id_es);

-- 1. Exchange the document JSON between the two rows.
UPDATE editorial_documents d
   SET document = cd.document, updated_at = now()
  FROM crispin_swap s, crispin_docs cd
 WHERE d.id IN (s.id_en, s.id_es)
   AND cd.id = CASE WHEN d.id = s.id_en THEN s.id_es ELSE s.id_en END;

-- 2. Move the reference rows with the text they point into.
UPDATE editorial_entity_references er
   SET editorial_document_id = CASE WHEN er.editorial_document_id = s.id_en
                                    THEN s.id_es ELSE s.id_en END,
       updated_at = now()
  FROM crispin_swap s
 WHERE er.editorial_document_id IN (s.id_en, s.id_es);

-- 3. Swap the markdown mirror columns.
UPDATE artists
   SET bio_en = bio_es, bio_es = bio_en, updated_at = now()
 WHERE slug = 'crispin-fernandez';

COMMIT;
