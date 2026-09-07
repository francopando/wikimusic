BEGIN;

-- Rewrite the catalogue entry for Dominic.
--
-- Repair the editorial documents that carry raw markdown inside their text
-- nodes, without rewriting a word of the prose.
--
-- THE FAULT. Nine published artists have biographies whose paragraphs contain
-- literal markdown: "**Francisco Cruz Osuna**" and "## **Early Life**" as
-- characters inside a text node rather than as a section-title block and plain
-- prose, and bullet lists written as "- item" separated by hardBreak nodes
-- inside a single paragraph. The reader sees the asterisks, the hashes and the
-- hyphens. It also breaks the rule that bold is reserved for section titles: a
-- sweep of all eighteen documents found ZERO text nodes carrying an actual bold
-- mark, so these entries have no section titles at all.
--
-- WHAT THIS DOES. It parses each stored document back into the authoring blocks
-- that editorial.cjs uses, applying four transformations and no others:
--
--   1. Each paragraph's inline run is split on hardBreak into lines.
--   2. A line of the form "## Title" or "## **Title**" becomes a sectionTitle,
--      and so does a first line of the form "**Title**" when more lines follow
--      it in the same paragraph -- which is how dioni-fernandez-y-el-equipo has
--      its headings, glued to the body text by a line break.
--   3. A paragraph whose lines ALL begin with "- " becomes a bulletList, with
--      the marker stripped from each item.
--   4. Every remaining text node has its "**" pairs removed. Any other line
--      becomes its own paragraph.
--
-- Then it hands the blocks to run() from mk.cjs -- the same pipeline every entry
-- in this catalogue goes through. It rebuilds the document, deletes and
-- reinserts the reference rows with fresh occurrence ids, mirrors the markdown
-- into bio_en and bio_es, runs the editorial gates and emits a migration with a
-- rollback.
--
-- WHAT THIS DOES NOT DO. Not one word of prose is changed, added or removed. No
-- field on the artists row is touched -- run() is called with an empty row
-- block. The 45 artistReference nodes across these documents are carried through
-- with their artistId and displayText intact; only their occurrence ids are
-- regenerated, which is what the pipeline does on every rewrite.
--
-- HEADINGS THAT SURVIVE AND ARE WORTH A LOOK LATER: peter-cruz has "Later Years
-- and Health" / "Salud y vida reciente" and dalvin-la-melodia has "Personal
-- Context" / "Contexto social" -- section titles pointing at material the
-- catalogue's rules would normally keep out. They are NOT touched here. This
-- pass fixes structure; it does not make editorial cuts.
--
-- Uso: node md-arreglar.cjs [--dry] slug [slug...]
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
       name = 'Dominic',
       sort_name = 'Dominic',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = TRUE,
       primary_role = 'singer',
       primary_genre = 'salsa',
       date_of_birth = NULL,
       birth_year = 1975,
       date_of_death = '2020-08-15',
       birth_place = 'Mayagüez',
       province = 'Nacido en el Exterior',
       first_name = 'Domingo',
       middle_name = 'Isaías',
       last_name = 'Díaz',
       second_last_name = NULL,
       stage_name = 'Dominic',
       aliases = ARRAY['La Voz Sublime De La Salsa']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = NULL,
       bio_en = 'Dominic (born Domingo Isaías Díaz) was a prominent tropical and romantic salsa artist whose music deeply resonated with the contemporary mainstream of Caribbean popular music for a younger generation during the late 1990s and early 2000s. While he was born in 1975 in Mayagüez, Puerto Rico, his family relocated to Santo Domingo, Dominican Republic, when he was just three years old.

Raised in the popular neighborhood of Villa Consuelo, Dominic always openly stated in promotional interviews that he felt entirely Dominican at heart, a profound cultural identity that ultimately inspired his artistic name.Growing up in Santo Domingo during a golden era for Dominican musical expression, Dominic developed within an environment rich in local folklore and vibrant international influences. However, instead of pursuing local genres like merengue or bachata, he drew inspiration from those traditions to forge a distinct space within the salsa romántica scene.

After migrating to New York City in the mid-1990s, he successfully blended the raw emotion and romantic intimacy of Caribbean storytelling with high-caliber Latin urban production.

Dominic achieved massive commercial success and critical acclaim with his iconic 1998 studio album Niégalo Todo, released under Sky Records. The title track became a timeless anthem across tropical radio stations, solidifying his reputation as "La Voz Sublime de la Salsa." He followed this triumph with his sophomore album, Mi Gran Sueño, in October 2000. Through these productions, Dominic bridged the gap between traditional tropical arrangements and a broader, modern Latin appeal.

His promising career was cut short when he tragically passed away on August 15, 2020, in New York at the age of 45, yet his musical legacy continues to be celebrated by salsa enthusiasts worldwide.',
       bio_es = NULL,
       updated_at = now()
 WHERE slug = 'dominic';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dominic')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dominic')
   AND locale NOT IN ('en');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Dominic (born Domingo Isaías Díaz) was a prominent tropical and romantic salsa artist whose music deeply resonated with the contemporary mainstream of Caribbean popular music for a younger generation during the late 1990s and early 2000s. While he was born in 1975 in Mayagüez, Puerto Rico, his family relocated to Santo Domingo, Dominican Republic, when he was just three years old.","type":"text"}]},{"type":"paragraph","content":[{"text":"Raised in the popular neighborhood of Villa Consuelo, Dominic always openly stated in promotional interviews that he felt entirely Dominican at heart, a profound cultural identity that ultimately inspired his artistic name.Growing up in Santo Domingo during a golden era for Dominican musical expression, Dominic developed within an environment rich in local folklore and vibrant international influences. However, instead of pursuing local genres like merengue or bachata, he drew inspiration from those traditions to forge a distinct space within the salsa romántica scene.","type":"text"}]},{"type":"paragraph","content":[{"text":"After migrating to New York City in the mid-1990s, he successfully blended the raw emotion and romantic intimacy of Caribbean storytelling with high-caliber Latin urban production.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dominic achieved massive commercial success and critical acclaim with his iconic 1998 studio album Niégalo Todo, released under Sky Records. The title track became a timeless anthem across tropical radio stations, solidifying his reputation as \"La Voz Sublime de la Salsa.\" He followed this triumph with his sophomore album, Mi Gran Sueño, in October 2000. Through these productions, Dominic bridged the gap between traditional tropical arrangements and a broader, modern Latin appeal.","type":"text"}]},{"type":"paragraph","content":[{"text":"His promising career was cut short when he tragically passed away on August 15, 2020, in New York at the age of 45, yet his musical legacy continues to be celebrated by salsa enthusiasts worldwide.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'dominic'), 2)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
