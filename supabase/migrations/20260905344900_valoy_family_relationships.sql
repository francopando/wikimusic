BEGIN;

-- Put Cristopher Valoy into the Valoy family tree.
--
-- The catalogue already models the family: Cuco Valoy is recorded as the parent
-- of Ramón Orlando and the grandparent of Jura Valoy, Martín Valoy as Cuco's
-- brother and Ramón Orlando's uncle. Cristopher was missing from all of it,
-- although he is the voice on El Venao and his brother wrote it.
--
-- MusicBrainz records his father as Cuco Valoy and his sibling as Ramón Orlando
-- directly. República Merengue states the same and explains the arrangement:
-- "Los Cantantes fue un proyecto de merengue ideado por Ramón Orlando Valoy que
-- tenía como figura principal a su hermano Christopher."
--
-- Four rows. Two are documented -- Cuco as his parent, Ramón Orlando as his
-- brother. The other two follow from those with no further evidence needed and
-- are the same inferences the table already carries for Martín Valoy: Martín is
-- his uncle because Martín is Cuco's brother, and he is Jura Valoy's uncle
-- because Jura is Ramón Orlando's child. The direction convention here matches
-- the existing rows: for parent, uncle_aunt and grandparent, artist_id is the
-- elder and related_artist_id the younger.
--
-- pair_low and pair_high are generated columns; the unique constraint on that
-- ordered pair means each relationship is stored once and cannot be mirrored.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

WITH v AS (
  SELECT
    (SELECT id FROM artists WHERE slug = 'cuco-valoy')        AS cuco,
    (SELECT id FROM artists WHERE slug = 'ramon-orlando')     AS nano,
    (SELECT id FROM artists WHERE slug = 'martin-valoy')      AS martin,
    (SELECT id FROM artists WHERE slug = 'jura-valoy')        AS jura,
    (SELECT id FROM artists WHERE slug = 'cristopher-valoy')  AS cris
), rows AS (
  SELECT cuco   AS a, cris AS b, 'parent'::text     AS kind FROM v
  UNION ALL SELECT cris,   nano, 'sibling'          FROM v
  UNION ALL SELECT martin, cris, 'uncle_aunt'       FROM v
  UNION ALL SELECT cris,   jura, 'uncle_aunt'       FROM v
)
INSERT INTO artist_family_relationships (artist_id, related_artist_id, relationship_type)
SELECT r.a, r.b, r.kind
  FROM rows r
 WHERE NOT EXISTS (
     SELECT 1 FROM artist_family_relationships x
      WHERE x.pair_low  = LEAST(r.a, r.b)
        AND x.pair_high = GREATEST(r.a, r.b));

COMMIT;
