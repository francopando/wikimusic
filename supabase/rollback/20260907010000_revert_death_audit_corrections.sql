BEGIN;

-- Reverts 20260907010000_death_audit_corrections.sql.
--
-- Restores the five rows to exactly the state the audit found them in:
-- Guandulito, Eddie Bastián and Eladio Romero Santos with no death data and
-- ended false; Ricardo Rico with a death date but no death year; Mélida
-- Rodríguez with no birth year, birthplace or province.

UPDATE artists
   SET date_of_death = NULL,
       death_year    = NULL,
       ended         = false,
       updated_at    = now()
 WHERE slug IN ('guandulito', 'eddie-bastian', 'eladio-romero-santos');

UPDATE artists
   SET death_year = NULL,
       updated_at = now()
 WHERE slug = 'ricardo-rico';

UPDATE artists
   SET birth_year  = NULL,
       birth_place = NULL,
       province    = NULL,
       updated_at  = now()
 WHERE slug = 'melida-rodriguez';

COMMIT;
