BEGIN;

-- Kiko el Crazy's awards. Four nominations, no wins, all against published
-- nominee lists rather than against a press release or an encyclopedia lead.
--
--   Premios Casandra    2011  Compositor del Año         "Prende la Hookah"
--       The earliest and, for this catalogue, the most interesting: he was
--       nominated as the writer of a song somebody else recorded -- Tulile --
--       eight years before he had a hit of his own. Source: Spanish Wikipedia's
--       article, citing Diario Libre's profile of 29 August 2021.
--
--   Premios Juventud    2023  Best Dembow Song           "Cuca"
--   Premios Juventud    2023  Mejor Colaboración Dembow  "Pichirry"
--       Both nominations, both lost. Best Dembow Song went to Natti Natasha's
--       "To' Esto Es Tuyo"; Best Dembow Collaboration went to "Delincuente" by
--       Tokischa, Anuel AA and Ñengo Flow. Source: the nominee lists in English
--       Wikipedia's 2023 Premios Juventud article, in Univision's own list of
--       13 June 2023, and in Billboard's winners list of 20 July 2023.
--
--   Premios Tu Musica Urbano  2023  Artista Dembow
--       Nomination. The award went to El Alfa. Source: Billboard's complete
--       list of 15 June 2023 and the ceremony's own site of 16 June 2023.
--
-- WHY A CLAIM IS BEING LEFT OUT. Spanish Wikipedia's lead says he "fue
-- galardonado" at Premios Juventud 2023, Premios Heat 2022 and Premios Tu
-- Música Urbano. Two of those three are contradicted by the published lists
-- above, and the Dominican coverage from the time says "nominado". The Premios
-- Heat 2022 claim is not recorded here either way, because no list was found
-- against which to check it. It is a gap, not a denial.
--
-- The two Premios Juventud categories are stored one in English and one in
-- Spanish because that is how they already exist in award_categories. That
-- inconsistency is real and is on the list of cross-language category pairs
-- still awaiting an editorial decision; it is not resolved here, because
-- resolving it means renaming rows that other artists' awards point at.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

INSERT INTO artist_awards (artist_id, award_id, category_id, year, work, won, source)
VALUES
  ('9be0ed08-6eb6-4ca0-bb68-d5126190aeb1',
   'ead83dcf-9e2c-4f69-a557-dad604716a5e',
   '7e32c2ae-1b52-4624-b03e-0d4934cc6fee', 2011, 'Prende la Hookah', false,
   'Wikipedia en español, citando Diario Libre del 29 de agosto de 2021'),
  ('9be0ed08-6eb6-4ca0-bb68-d5126190aeb1',
   '8304c63b-ff51-40ed-80bb-ea7c4079ca6f',
   'd7ec9884-2cdc-4b77-b794-1f7e88aa3cf7', 2023, 'Cuca', false,
   'Lista de nominados de Univision, 13 de junio de 2023'),
  ('9be0ed08-6eb6-4ca0-bb68-d5126190aeb1',
   '8304c63b-ff51-40ed-80bb-ea7c4079ca6f',
   'ef5e0c39-06ae-4510-8bdb-8eb75cf5e21d', 2023, 'Pichirry', false,
   'Lista de nominados de Univision, 13 de junio de 2023'),
  ('9be0ed08-6eb6-4ca0-bb68-d5126190aeb1',
   '32d73576-29be-40c4-b529-a7ce943fe2ec',
   '96cd0802-d976-4d4b-8ff2-cc17bcd6a2ae', 2023, NULL, false,
   'Billboard, 15 de junio de 2023');

COMMIT;
