BEGIN;

-- Reverts 20260905220000_correct_tipico_accordionist_primary_roles.sql.
-- Restores primary_role 'musician' and the exact prior occupations arrays,
-- including the 'vocalist'/'musician' repetitions that were violations.

UPDATE artists SET primary_role = 'musician',
  occupations = '["accordionist","vocalist","bandleader","composer","songwriter","musician"]'::jsonb,
  updated_at = now()
WHERE name = 'Agapito Pascual';

UPDATE artists SET primary_role = 'musician',
  occupations = '["accordionist","composer","musician"]'::jsonb,
  updated_at = now()
WHERE name = 'Alfredo Polonia';

UPDATE artists SET primary_role = 'musician',
  occupations = '["accordionist","singer","composer","bandleader"]'::jsonb,
  updated_at = now()
WHERE name = 'El Rubio Acordeón';

UPDATE artists SET primary_role = 'musician',
  occupations = '["accordionist","vocalist","bandleader","musician"]'::jsonb,
  updated_at = now()
WHERE name = 'Fidelina Pascual';

UPDATE artists SET primary_role = 'musician',
  occupations = '["accordionist","singer","bandleader"]'::jsonb,
  updated_at = now()
WHERE name = 'Kerubanda';

UPDATE artists SET primary_role = 'musician',
  occupations = '["accordionist","singer","bandleader"]'::jsonb,
  updated_at = now()
WHERE name = 'La Fiera Típica';

COMMIT;
