BEGIN;

-- Merge the two "Premio Lo Nuestro" rows in `awards` into one.
--
-- The table held the same award twice:
--
--   f289c627-bc9e-48c5-8da3-d8fe3e9b0f60  created 2026-05-26  6 artist_awards
--   80d6c813-821b-4f3c-9f64-3f2de71ed86c  created 2026-08-02  2 artist_awards
--
-- The older id is kept as canonical. The younger one carried two categories --
-- "Canción Tropical del Año" and "Grupo Tropical del Año" -- and two rows, both
-- of Wilfrido Vargas's 1994 wins, sourced to Univision.
--
-- ORDER MATTERS HERE. `award_categories.award_id` is ON DELETE CASCADE from
-- `awards`, while `artist_awards.category_id` is NO ACTION. Deleting the
-- duplicate award first would take its two categories with it and leave the
-- Wilfrido Vargas rows pointing at categories that no longer exist. So the
-- categories are repointed first, then the artist_awards rows, and the award
-- row is removed last, by which time nothing depends on it.
--
-- Neither moved category name collides with one already under the canonical
-- award, so no category merging is required and no artist_awards row changes
-- its category.
--
-- STILL OUTSTANDING, and deliberately not touched here: the category table has
-- its own duplicates under the canonical award. "Artista Tropical del Año"
-- appears twice (64510423-… with two uses, 5f0b2bd3-… with none), and
-- "Canción Tropical del Año" and "Tropical Song of the Year" are the same
-- category written in two languages, as are "Premio a la Excelencia" and
-- "Premio Lo Nuestro a la Excelencia". Resolving those means deciding which
-- language the category names are stored in, which is an editorial choice.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

UPDATE award_categories
   SET award_id = 'f289c627-bc9e-48c5-8da3-d8fe3e9b0f60'::uuid
 WHERE award_id = '80d6c813-821b-4f3c-9f64-3f2de71ed86c'::uuid;

UPDATE artist_awards
   SET award_id = 'f289c627-bc9e-48c5-8da3-d8fe3e9b0f60'::uuid,
       updated_at = now()
 WHERE award_id = '80d6c813-821b-4f3c-9f64-3f2de71ed86c'::uuid;

DELETE FROM awards
 WHERE id = '80d6c813-821b-4f3c-9f64-3f2de71ed86c'::uuid;

COMMIT;
