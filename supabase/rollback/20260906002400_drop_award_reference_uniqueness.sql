BEGIN;

-- Reverts 20260906002400_award_reference_uniqueness.sql.

ALTER TABLE award_categories DROP CONSTRAINT IF EXISTS award_categories_award_id_name_key;
ALTER TABLE awards DROP CONSTRAINT IF EXISTS awards_name_key;

COMMIT;
