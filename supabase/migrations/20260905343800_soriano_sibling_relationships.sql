BEGIN;

-- Record that the Sorianos are siblings.
--
-- Joan Soriano is the seventh of the fifteen children of Candelario Soriano.
-- Two of his brothers and sisters have entries in the catalogue -- Fernando and
-- Griselda -- and until now nothing in the data said they were related, which
-- is the single most important fact about either of them. All three played in
-- the children's band the neighbourhood called Los Candes, and all three are on
-- La Familia Soriano (iASO Records, April 2012).
--
-- MusicBrainz records the sibling relationships directly, in both directions,
-- and adds a fourth sibling, Nelly Soriano, who has no entry here yet. The
-- Kennedy Center's page for Joan says he "returned to his roots, re-forming the
-- family band with his brother Fernando and sister Griselda". Amazon's listing
-- for the album calls it "the recording debut of Joan's three siblings: his
-- brother Fernando and sisters Nelly and Griselda".
--
-- Three rows, one per pair. The table stores each relationship once: pair_low
-- and pair_high are generated from artist_id and related_artist_id, and a
-- unique constraint on that ordered pair rejects the mirror row, so writing the
-- relationship from both sides is neither possible nor needed.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

WITH s AS (
  SELECT
    (SELECT id FROM artists WHERE slug = 'joan-soriano')     AS joan,
    (SELECT id FROM artists WHERE slug = 'fernando-soriano') AS fernando,
    (SELECT id FROM artists WHERE slug = 'griselda-soriano') AS griselda
), pairs AS (
  SELECT joan AS a, fernando AS b FROM s
  UNION ALL SELECT joan, griselda FROM s
  UNION ALL SELECT fernando, griselda FROM s
)
INSERT INTO artist_family_relationships
       (artist_id, related_artist_id, relationship_type)
SELECT p.a, p.b, 'sibling'
  FROM pairs p
 WHERE NOT EXISTS (
     SELECT 1 FROM artist_family_relationships x
      WHERE x.pair_low = LEAST(p.a, p.b)
        AND x.pair_high = GREATEST(p.a, p.b));

COMMIT;
