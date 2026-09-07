BEGIN;

-- Death audit. Corrections to five rows.
--
-- WHY THE AUDIT RAN. Frank Cruz was stored as having died on 18 February 2020.
-- He is ninety-nine and still singing, and the error was found by accident. One
-- row wrong in that direction means the field was never swept, so it was swept
-- in both directions: people recorded as dead who are alive, and people
-- recorded as alive who are dead.
--
-- METHOD. Every row carrying a death signal was checked for internal
-- coherence -- died before born, died in the future, age at death outside a
-- plausible range, a date without a year, a year without a date. Then the other
-- side: every soloist over eighty with no death date was verified individually
-- against the press, the Ministry of Culture, and the artist's own accounts.
-- Seventeen fell in that band. Ten are alive and their rows were already right:
-- Frank Cruz, Rafael Solano, Elenita Santos, Julia Javier, Cuco Valoy, Luis
-- Segura, Niní Cáffaro, Francisco Ulloa, José Manuel Calderón, Fefita la
-- Grande, Edilio Paredes, Leonardo Paniagua and Crispín Fernández. Three were
-- dead and are corrected below.
--
-- The recent end was sampled too -- Enerolisa Núñez, Raúl Grisanty, Henry
-- Hierro, Cheo Zorrilla and the 2020s block generally check out against the
-- national press. The errors are all in the old and obscure cohort, which is
-- what one would expect: those rows were filled from reference works that
-- record a birth and go quiet.
--
-- 1. GUANDULITO. Dionisio Mejía, born 23 March 1911, was stored with no death
-- data at all, which had him at a hundred and fifteen. He died in Santo Domingo
-- on 16 JUNE 1979. Four independent sources: Spanish Wikipedia, the Ministry of
-- Culture's own efeméride, Funglode's Diccionario Cultural Dominicano, and the
-- Sociedad Cultural Alianza Cibaeña. CONFLICT NOTED, NOT RESOLVED SILENTLY:
-- iASO Records and one Facebook history page say 1978 instead. The 1979 date
-- carries the Ministry, the encyclopaedia and the cultural dictionary, and it is
-- the one with a day attached, so it is the one stored. The 1978 claim is
-- recorded here rather than discarded.
--
-- 2. EDDIE BASTIÁN. Born 3 September 1936 in Guaymate, La Romana; stored with
-- no death data, which had him at ninety. He died in New York on 18 DECEMBER
-- 1989. The date comes from the salsa efeméride circuit -- Tom Datos carries it
-- explicitly -- and the death itself is independently confirmed by somosalsard,
-- which records that the Fania All Stars paid tribute to him at a concert days
-- afterwards. Every post about him since is retrospective. The catalogue's own
-- biography of him is already written in the past tense, so the prose and the
-- fields were disagreeing with each other.
--
-- 3. ELADIO ROMERO SANTOS. Born 12 February 1937 in Cenoví; stored with no
-- death data, which had him at eighty-nine. He died on 24 APRIL 2001. Spanish
-- Wikipedia, iASO Records, Bachata Republic and a 2026 anniversary post marking
-- twenty-five years since his death all agree, and the anniversary arithmetic is
-- itself a check on the year. He had no biography, so no prose contradicts it.
--
-- 4. RICARDO RICO. Held date_of_death 1979-05-26 with death_year null. The year
-- is simply derived from the date already stored; no new claim is made.
--
-- 5. MÉLIDA RODRÍGUEZ. The first woman to record bachata, stored with a death
-- date of 14 November 1982 but no birth year and no birthplace at all. Born in
-- HATO MAYOR in 1943. Two sources that do not derive from each other: a YouTube
-- memorial from four years ago giving 1943-1982, and a Nación Dominicana wire
-- item of 18 July 2025 giving the year and the town. "Hato Mayor" is an existing
-- province value in this table.
--
-- CAUSE OF DEATH IS NOT RECORDED for any of these, here or in prose. Several of
-- the sources give one. It is outside what this catalogue keeps.
--
-- ended: for a person this table treats ended as meaning dead -- there is not
-- one soloist row with ended true and no death data. The three corrected rows
-- carried ended false and are set true to match.
--
-- Every UPDATE is guarded on the current value, so if a row has moved since the
-- audit the statement affects nothing rather than overwriting it.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

UPDATE artists
   SET date_of_death = DATE '1979-06-16',
       death_year    = 1979,
       ended         = true,
       updated_at    = now()
 WHERE slug = 'guandulito'
   AND date_of_death IS NULL
   AND death_year IS NULL;

UPDATE artists
   SET date_of_death = DATE '1989-12-18',
       death_year    = 1989,
       ended         = true,
       updated_at    = now()
 WHERE slug = 'eddie-bastian'
   AND date_of_death IS NULL
   AND death_year IS NULL;

UPDATE artists
   SET date_of_death = DATE '2001-04-24',
       death_year    = 2001,
       ended         = true,
       updated_at    = now()
 WHERE slug = 'eladio-romero-santos'
   AND date_of_death IS NULL
   AND death_year IS NULL;

UPDATE artists
   SET death_year = 1979,
       updated_at = now()
 WHERE slug = 'ricardo-rico'
   AND death_year IS NULL
   AND date_of_death = DATE '1979-05-26';

UPDATE artists
   SET birth_year  = 1943,
       birth_place = 'Hato Mayor',
       province    = 'Hato Mayor',
       updated_at  = now()
 WHERE slug = 'melida-rodriguez'
   AND birth_year IS NULL
   AND birth_place IS NULL
   AND province IS NULL;

COMMIT;
