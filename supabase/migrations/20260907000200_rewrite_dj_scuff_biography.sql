BEGIN;

-- Rewrite the catalogue entry for DJ Scuff.
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
       name = 'DJ Scuff',
       sort_name = 'Walther Jiménez, William Jr.',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'dj',
       primary_genre = 'electronic',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'William',
       middle_name = 'Jr.',
       last_name = 'Walther',
       second_last_name = 'Jiménez',
       stage_name = 'DJ Scuff',
       aliases = ARRAY['DJ Scuff', 'Scuff Selecta', 'Ma Que Kracha']::text[],
       occupations = '["producer","singer"]'::jsonb,
       instruments = ARRAY['turntables', 'synthesizer']::text[],
       genres = ARRAY['urban-rap-hip-hop', 'urban-dembow', 'urban-reggaeton', 'urban-trap']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = 'https://www.youtube.com/@djscuff',
       facebook = 'https://www.facebook.com/djscuff',
       instagram = 'https://www.instagram.com/djscuff/',
       disambiguation = 'Dominican DJ, producer, and urban music media personality born William Jr. Walther Jiménez',
       bio_en = 'Born William Jr. Walther Jiménez in Santo Domingo, Dominican Republic, DJ Scuff — also known by his aliases Scuff Selecta and Ma Que Kracha — is a DJ and producer whose musical roots trace back to the hip-hop sounds of the 1990s, drawing early inspiration from artists like Snoop Dogg and Lords of the Underground.

By the early 2000s, he had acquired his own turntables and set up a home studio, taking his passion for music from a hobby to a craft. He went on to join a DJ collective known as Los Decepticons, with whom he released Solida Alianza, a project that blended urban, international, and Dominican sounds.

His trajectory shifted significantly in 2009, when he released Dembow de Mafu, a record that achieved international reach and took him on tour through Europe and the United States. That momentum helped cement his reputation not just as a mixer, but as a tastemaker capable of shaping the direction of Dominican urban music.

Over the course of his career, DJ Scuff has become one of the most respected figures in the Dominican Republic''s hip-hop and dembow scenes. A major part of his legacy lies in championing freestyle culture; he is widely credited with building platforms that gave emerging local rappers the visibility they needed to grow their audiences, turning freestyle sessions and rap battles into a genuine cultural movement within the country.

As a producer, his work extends well beyond the DJ booth. His 2021 project Instrumentales en la Cabina Vol. 2 showcased his range as a beatmaker, featuring a variety of instrumental tracks that underline his studio capabilities. He has collaborated with both established names in urban Latin music and a younger wave of artists, consistently pushing the tempo and energy of his productions forward.

Recent output such as Freestyle Empaquetate, Dale, and A Tento A Mi Freestyle — all released in 2023 — reflect his ability to stay current while maintaining the raw, street-level energy that built his following. Notably, he has also worked alongside artists like Tokischa and J Noa in his ongoing live session series, bringing a collaborative and organic feel to his creative output.

On the digital front, his YouTube channel offers instrumentals, live freestyle sessions, and curated mixes. His presence on TikTok further expands that reach, making him one of the more digitally active figures in the Dominican music world.

Spanning nearly three decades, DJ Scuff''s career stands as a testament to consistency, community-building, and an unwavering commitment to the culture that shaped him.',
       bio_es = NULL,
       updated_at = now()
 WHERE slug = 'dj-scuff';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dj-scuff')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dj-scuff')
   AND locale NOT IN ('en');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Born William Jr. Walther Jiménez in Santo Domingo, Dominican Republic, DJ Scuff — also known by his aliases Scuff Selecta and Ma Que Kracha — is a DJ and producer whose musical roots trace back to the hip-hop sounds of the 1990s, drawing early inspiration from artists like Snoop Dogg and Lords of the Underground.","type":"text"}]},{"type":"paragraph","content":[{"text":"By the early 2000s, he had acquired his own turntables and set up a home studio, taking his passion for music from a hobby to a craft. He went on to join a DJ collective known as Los Decepticons, with whom he released Solida Alianza, a project that blended urban, international, and Dominican sounds.","type":"text"}]},{"type":"paragraph","content":[{"text":"His trajectory shifted significantly in 2009, when he released Dembow de Mafu, a record that achieved international reach and took him on tour through Europe and the United States. That momentum helped cement his reputation not just as a mixer, but as a tastemaker capable of shaping the direction of Dominican urban music.","type":"text"}]},{"type":"paragraph","content":[{"text":"Over the course of his career, DJ Scuff has become one of the most respected figures in the Dominican Republic''s hip-hop and dembow scenes. A major part of his legacy lies in championing freestyle culture; he is widely credited with building platforms that gave emerging local rappers the visibility they needed to grow their audiences, turning freestyle sessions and rap battles into a genuine cultural movement within the country.","type":"text"}]},{"type":"paragraph","content":[{"text":"As a producer, his work extends well beyond the DJ booth. His 2021 project Instrumentales en la Cabina Vol. 2 showcased his range as a beatmaker, featuring a variety of instrumental tracks that underline his studio capabilities. He has collaborated with both established names in urban Latin music and a younger wave of artists, consistently pushing the tempo and energy of his productions forward.","type":"text"}]},{"type":"paragraph","content":[{"text":"Recent output such as Freestyle Empaquetate, Dale, and A Tento A Mi Freestyle — all released in 2023 — reflect his ability to stay current while maintaining the raw, street-level energy that built his following. Notably, he has also worked alongside artists like Tokischa and J Noa in his ongoing live session series, bringing a collaborative and organic feel to his creative output.","type":"text"}]},{"type":"paragraph","content":[{"text":"On the digital front, his YouTube channel offers instrumentals, live freestyle sessions, and curated mixes. His presence on TikTok further expands that reach, making him one of the more digitally active figures in the Dominican music world.","type":"text"}]},{"type":"paragraph","content":[{"text":"Spanning nearly three decades, DJ Scuff''s career stands as a testament to consistency, community-building, and an unwavering commitment to the culture that shaped him.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'dj-scuff'), 3)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
