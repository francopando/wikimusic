BEGIN;

-- Reverts 20260905180000_correct_fefita_role_and_aliases.sql.
--
-- Restores the record as it stood before that migration: primary_role was
-- already 'singer' and is unchanged, occupations return to the shape left by
-- 20260905160000, and the alias goes back to the reversed surname order.
-- Reinstating that alias puts the record back in contradiction with its own
-- biography and sort_name, which is what a faithful revert means here.

UPDATE artists
SET primary_role = 'singer',
    occupations = '["accordionist","bandleader","composer","musician"]'::jsonb,
    aliases = ARRAY['la Mayimba', 'la Vieja Fefa', 'Manuela Josefa Cabrera Taveras']::text[],
    updated_at = now()
WHERE id = '9333da06-ad03-44eb-9b81-c21d0ccdd0ea';

COMMIT;
