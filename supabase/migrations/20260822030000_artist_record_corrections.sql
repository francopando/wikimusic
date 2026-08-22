BEGIN;

-- Record-level corrections found while researching these artists' biographies.
-- Kept separate from the genre passes because each is a distinct factual fix,
-- not part of a systematic normalisation.

-- Her surname was recorded as 'Merced'. Wikidata (Q5976436), English Wikipedia
-- and BuenaMúsica all give the full name as Liliana Goodman Meregildo. The
-- occupations list carried 'vocalist', which restates primary_role 'singer';
-- she is a songwriter, composer and, since La realidad de un Sueño (2012), an
-- author.
UPDATE artists
SET second_last_name = 'Meregildo',
    occupations = '["songwriter", "composer", "writer"]'::jsonb,
    disambiguation = 'Dominican Christian singer-songwriter',
    updated_at = now()
WHERE slug = 'lilly-goodman'
  AND (second_last_name IS DISTINCT FROM 'Meregildo'
       OR occupations IS DISTINCT FROM '["songwriter", "composer", "writer"]'::jsonb
       OR disambiguation IS DISTINCT FROM 'Dominican Christian singer-songwriter');

-- 'vocalist' duplicated primary_role 'singer'. Her birthplace is already
-- correct in the record (Gaspar Hernández, Espaillat); it was the biography
-- text that wrongly said Santo Domingo, repeating an error also present in the
-- cached MusicBrainz begin-area.
UPDATE artists
SET occupations = '["songwriter"]'::jsonb,
    disambiguation = 'Dominican worship singer and songwriter',
    updated_at = now()
WHERE slug = 'averly-morillo'
  AND (occupations IS DISTINCT FROM '["songwriter"]'::jsonb
       OR disambiguation IS DISTINCT FROM 'Dominican worship singer and songwriter');

-- The stored YouTube handle ended in U+2069 (POP DIRECTIONAL ISOLATE), an
-- invisible character that made the handle unresolvable. 'vocal coach' and
-- 'music educator' are new artist-level occupations documented in
-- docs/ROLE_DICTIONARY.md; she founded the largest singing academy in the
-- country, and neither term existed in the vocabulary before.
UPDATE artists
SET occupations = '["songwriter", "vocal coach", "music educator"]'::jsonb,
    youtube = '@LorensSalcedoOficial',
    disambiguation = 'Dominican worship singer and vocal coach',
    updated_at = now()
WHERE slug = 'lorens-salcedo'
  AND (occupations IS DISTINCT FROM '["songwriter", "vocal coach", "music educator"]'::jsonb
       OR youtube IS DISTINCT FROM '@LorensSalcedoOficial'
       OR disambiguation IS DISTINCT FROM 'Dominican worship singer and vocal coach');

-- She is a Catholic singer-songwriter, not a generically Christian one, and
-- released her first album under the name Seliné while signed to BMG US Latin,
-- before the 2006 conversion that ended that career.
UPDATE artists
SET occupations = '["songwriter"]'::jsonb,
    aliases = ARRAY['Seliné']::text[],
    disambiguation = 'Dominican Catholic singer-songwriter and missionary',
    updated_at = now()
WHERE slug = 'celines-diaz'
  AND (occupations IS DISTINCT FROM '["songwriter"]'::jsonb
       OR aliases IS DISTINCT FROM ARRAY['Seliné']::text[]
       OR disambiguation IS DISTINCT FROM 'Dominican Catholic singer-songwriter and missionary');

-- Her origin was unrecorded. Dominican press consistently identifies her with
-- El Tamarindo. Her birth date remains unset: it is not publicly documented and
-- is deliberately not guessed.
UPDATE artists
SET birth_place = 'El Tamarindo',
    province = 'Santo Domingo',
    disambiguation = 'Dominican worship singer, Dominicana''s Got Talent finalist',
    updated_at = now()
WHERE slug = 'rocio-arias'
  AND (birth_place IS DISTINCT FROM 'El Tamarindo'
       OR province IS DISTINCT FROM 'Santo Domingo'
       OR disambiguation IS DISTINCT FROM 'Dominican worship singer, Dominicana''s Got Talent finalist');

COMMIT;
