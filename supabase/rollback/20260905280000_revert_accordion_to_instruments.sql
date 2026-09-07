BEGIN;

-- Reverts 20260905280000_move_accordion_to_instruments.sql.
-- Restores 'accordionist' in occupations for the three records, empties
-- El Prodigio's instruments array again, and puts Rafaelito Román back on
-- the non-dictionary 'teacher' value.

UPDATE artists
SET occupations = '["accordionist","bandleader","composer","musician"]'::jsonb,
    updated_at = now()
WHERE name = 'Ángel Viloria y su Conjunto Típico Cibaeño';

UPDATE artists
SET occupations = '["accordionist","bandleader","composer","musician"]'::jsonb,
    instruments = ARRAY[]::text[],
    updated_at = now()
WHERE name = 'El Prodigio';

UPDATE artists
SET occupations = '["accordionist","composer","arranger","bandleader","teacher","musician"]'::jsonb,
    updated_at = now()
WHERE name = 'Rafaelito Román';

COMMIT;
