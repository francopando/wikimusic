BEGIN;

-- Reverts 20260907001700_rewrite_dj_mari_d_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'DJ Mari D',
       sort_name = 'Mari D, DJ',
       type = 'solo_artist',
       status = 'published',
       gender = 'female',
       ended = TRUE,
       primary_role = 'dj',
       primary_genre = NULL,
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'El Bronx',
       province = 'Nacido en el Exterior',
       first_name = 'Mariani',
       middle_name = NULL,
       last_name = 'Diplan',
       second_last_name = NULL,
       stage_name = 'DJ Mari D',
       aliases = ARRAY['DJ Mari', 'DJ Mari D', 'Mari D', 'Mariani Diplan', 'Marid.ny']::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY['turntables']::text[],
       genres = ARRAY['urban-rap-hip-hop']::text[],
       artist_tags = ARRAY['secular', 'emerging']::text[],
       website = 'https://marid.world/',
       youtube = 'https://youtu.be/9N1-ocnQODE',
       facebook = NULL,
       instagram = 'https://www.instagram.com/marid.ny/',
       disambiguation = 'Dominican-American DJ and artist from the Bronx, also known as Mari D',
       bio_en = 'Known online as @marid.ny, Mari D is a Dominican-American DJ carving out her own lane in New York City''s increasingly diverse and genre-fluid nightlife scene. Born and raised in the Bronx, she proudly carries her Caribbean heritage into everything she does — from the way she curates her sets to the communities she chooses to show up for.

As the daughter of Dominican immigrants, her cultural identity has never been a footnote — it''s the foundation. She openly and enthusiastically describes herself as a Dominican girl from the Bronx, and that pride is woven into the fabric of her artistic persona. In a city where DJs often chase broad, genre-neutral appeal, Mari D leans in the opposite direction, making her roots the centerpiece of her brand.

Her most recognizable platform has been Dominican Nights, one of New York City''s celebrated parties dedicated to the sounds of the island. As a recurring face behind the decks at these events, she delivers sets built entirely around dembow and Dominican music, giving the diaspora community a space to connect with the rhythms they grew up hearing. It''s the kind of cultural stewardship that goes beyond entertainment — it''s an act of preservation and pride.

But Mari D is not a one-genre artist. What makes her stand out in the broader New York DJ circuit is her ability to blend the pulse of Caribbean music with the global sounds that have taken over dance floors worldwide. Her sets weave dembow together with Amapiano, Afrobeat, and R&B — a combination that speaks to the multilingual, multicultural energy of the city she calls home. The result is a sonic identity that feels both rooted and forward-looking, honoring where she comes from while staying fluent in what''s happening now.

Active across social platforms including TikTok and Instagram, she describes herself simply as "a DJ that does many things" — a fitting summary for someone whose artistry resists easy categorization. With a growing following and a presence in some of New York''s most culturally vibrant spaces, Mari D represents a new generation of Latina DJs who are redefining what Caribbean music sounds like on the world stage.',
       bio_es = NULL,
       updated_at = now()
 WHERE slug = 'dj-mari-d';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dj-mari-d')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'dj-mari-d')
   AND locale NOT IN ('en');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Known online as @marid.ny, Mari D is a Dominican-American DJ carving out her own lane in New York City''s increasingly diverse and genre-fluid nightlife scene. Born and raised in the Bronx, she proudly carries her Caribbean heritage into everything she does — from the way she curates her sets to the communities she chooses to show up for.","type":"text"}]},{"type":"paragraph","content":[{"text":"As the daughter of Dominican immigrants, her cultural identity has never been a footnote — it''s the foundation. She openly and enthusiastically describes herself as a Dominican girl from the Bronx, and that pride is woven into the fabric of her artistic persona. In a city where DJs often chase broad, genre-neutral appeal, Mari D leans in the opposite direction, making her roots the centerpiece of her brand.","type":"text"}]},{"type":"paragraph","content":[{"text":"Her most recognizable platform has been Dominican Nights, one of New York City''s celebrated parties dedicated to the sounds of the island. As a recurring face behind the decks at these events, she delivers sets built entirely around dembow and Dominican music, giving the diaspora community a space to connect with the rhythms they grew up hearing. It''s the kind of cultural stewardship that goes beyond entertainment — it''s an act of preservation and pride.","type":"text"}]},{"type":"paragraph","content":[{"text":"But Mari D is not a one-genre artist. What makes her stand out in the broader New York DJ circuit is her ability to blend the pulse of Caribbean music with the global sounds that have taken over dance floors worldwide. Her sets weave dembow together with Amapiano, Afrobeat, and R&B — a combination that speaks to the multilingual, multicultural energy of the city she calls home. The result is a sonic identity that feels both rooted and forward-looking, honoring where she comes from while staying fluent in what''s happening now.","type":"text"}]},{"type":"paragraph","content":[{"text":"Active across social platforms including TikTok and Instagram, she describes herself simply as \"a DJ that does many things\" — a fitting summary for someone whose artistry resists easy categorization. With a growing following and a presence in some of New York''s most culturally vibrant spaces, Mari D represents a new generation of Latina DJs who are redefining what Caribbean music sounds like on the world stage.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'dj-mari-d'), 2)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
