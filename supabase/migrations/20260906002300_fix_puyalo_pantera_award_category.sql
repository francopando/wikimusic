BEGIN;

-- Repair an artist_awards row whose category belongs to a different award.
--
-- Migration 20260906001500 recorded Puyalo Pantera's Premio Lo Nuestro 2026
-- nomination for "Bing Bong" against the category "Best Dembow Song"
-- (d7ec9884-…). That category belongs to Premios Juventud, not to Premio Lo
-- Nuestro, so the row claimed one award and pointed at another's category. It
-- was the only such row in the table.
--
-- The fix is a proper category under Premio Lo Nuestro. The award announces it
-- in Spanish as "Mejor Canción Dembow", and that is the name used, matching the
-- other Spanish-named Lo Nuestro categories.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

INSERT INTO award_categories (id, award_id, name)
VALUES ('56e93427-0c55-4eb6-b539-43e981a3f3cf'::uuid,
        'f289c627-bc9e-48c5-8da3-d8fe3e9b0f60'::uuid,
        'Mejor Canción Dembow')
ON CONFLICT (id) DO NOTHING;

UPDATE artist_awards
   SET category_id = '56e93427-0c55-4eb6-b539-43e981a3f3cf'::uuid,
       updated_at = now()
 WHERE artist_id = (SELECT id FROM artists WHERE slug = 'puyalo-pantera')
   AND award_id = 'f289c627-bc9e-48c5-8da3-d8fe3e9b0f60'::uuid
   AND year = 2026;

COMMIT;
