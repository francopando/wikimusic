BEGIN;

-- Reverts 20260905300000_correct_polonia_fefita_magdalena_fields.sql.
-- Restores Polonia's incorrect 'accordionist' occupation, empties Fefita's
-- instruments array, and puts Magdalena Delgado back on the non-dictionary
-- 'teacher' value.

UPDATE artists
SET occupations = '["accordionist","composer"]'::jsonb,
    updated_at = now()
WHERE id = '3b6f60a1-2baa-4e2c-acec-452c5b026397';

UPDATE artists
SET instruments = ARRAY[]::text[],
    updated_at = now()
WHERE id = '9333da06-ad03-44eb-9b81-c21d0ccdd0ea';

UPDATE artists
SET occupations = '["vocalist","teacher"]'::jsonb,
    updated_at = now()
WHERE name = 'Magdalena Delgado';

COMMIT;
