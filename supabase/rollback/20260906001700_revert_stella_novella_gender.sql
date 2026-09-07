BEGIN;

-- Reverts 20260906001700_stella_novella_gender.sql, returning the column to the
-- NULL that 20260906001200 had set.

UPDATE artists
   SET gender = NULL,
       updated_at = now()
 WHERE slug = 'stella-novella';

COMMIT;
