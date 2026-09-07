BEGIN;

-- Load Yailin La Más Viral's award record.
--
-- Runs after the awards tables were normalised, so it adds rows to a clean
-- vocabulary rather than to a duplicated one. Two of the four awarding bodies
-- already existed; Premios Heat did not and is created here, along with six
-- categories.
--
-- CATEGORY NAMING. The table has no single language policy -- Premios Juventud
-- and Premios Tu Musica Urbano are recorded entirely in English, Premios
-- Soberano mostly in Spanish -- so each new category is written the way its own
-- awarding body announces it. The note left in 20260906002000 still stands:
-- unifying the language across the table is an open editorial decision.
--
-- WHAT IS RECORDED, from Spanish Wikipedia's award section and the Dominican
-- coverage it cites:
--
--   Premios Juventud 2023          Mejor Colaboración Dembow   nominated
--                                  with Farina and La Insuperable, for the
--                                  remix of "Soy Mama"
--   Premios Soberano 2024          Colaboración del Año        nominated
--                                  with Shadow Blow, for "Sólo Tú y Yo"
--   Premios Heat 2025              Urbano Dominicano           WON
--   Premios Heat 2025              Fandom del Año              WON
--                                  for Team Chivirikas
--   Premios Heat 2025              Canción Viral               nominated
--                                  for "Bing Bong"
--   Premios Tu Música Urbano 2025  Artista Dembow              WON
--   Premios Tu Música Urbano 2025  Canción Dembow              WON
--                                  for "Bing Bong"
--
-- Her Premio Lo Nuestro 2026 nomination for "Bing Bong" is already in the table
-- against Puyalo Pantera, who is credited on the record beside her. It is added
-- here for her as well, because the nomination named them both.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

INSERT INTO awards (id, name)
VALUES ('8cda1620-8b37-487d-9491-0c4108e133a4'::uuid, 'Premios Heat')
ON CONFLICT (name) DO NOTHING;

INSERT INTO award_categories (id, award_id, name) VALUES
  ('ef5e0c39-06ae-4510-8bdb-8eb75cf5e21d'::uuid, '8304c63b-ff51-40ed-80bb-ea7c4079ca6f'::uuid, 'Mejor Colaboración Dembow'),
  ('ea2b8a92-90c7-4a79-a1fa-b8da8fa9d155'::uuid, '8cda1620-8b37-487d-9491-0c4108e133a4'::uuid, 'Urbano Dominicano'),
  ('7b4c5217-4575-41d3-817d-66b37d72f31b'::uuid, '8cda1620-8b37-487d-9491-0c4108e133a4'::uuid, 'Fandom del Año'),
  ('8ae40648-288e-4b63-b867-eb246bd83fe9'::uuid, '8cda1620-8b37-487d-9491-0c4108e133a4'::uuid, 'Canción Viral'),
  ('96cd0802-d976-4d4b-8ff2-cc17bcd6a2ae'::uuid, '32d73576-29be-40c4-b529-a7ce943fe2ec'::uuid, 'Artista Dembow'),
  ('d9382354-9c4b-499d-b6d5-742d121d1ea2'::uuid, '32d73576-29be-40c4-b529-a7ce943fe2ec'::uuid, 'Canción Dembow')
ON CONFLICT (award_id, name) DO NOTHING;

INSERT INTO artist_awards (artist_id, award_id, category_id, year, work, won, source)
SELECT a.id, v.award_id, v.category_id, v.year, v.work, v.won, v.source
  FROM artists a,
       (VALUES
         ('8304c63b-ff51-40ed-80bb-ea7c4079ca6f'::uuid, 'ef5e0c39-06ae-4510-8bdb-8eb75cf5e21d'::uuid, 2023, 'Soy Mama (remix)', false, 'Premios Juventud 2023 nominees'),
         ('dec5d9e2-427b-414a-975f-41580488a7fd'::uuid, 'b7661f5a-b7e9-4667-a590-d56284151e93'::uuid, 2024, 'Solo Tu y Yo',      false, 'Premios Soberano 2024 nominees (Diario Libre, 5 February 2024)'),
         ('8cda1620-8b37-487d-9491-0c4108e133a4'::uuid, 'ea2b8a92-90c7-4a79-a1fa-b8da8fa9d155'::uuid, 2025, NULL,                true,  'Premios Heat 2025'),
         ('8cda1620-8b37-487d-9491-0c4108e133a4'::uuid, '7b4c5217-4575-41d3-817d-66b37d72f31b'::uuid, 2025, 'Team Chivirikas',   true,  'Premios Heat 2025'),
         ('8cda1620-8b37-487d-9491-0c4108e133a4'::uuid, '8ae40648-288e-4b63-b867-eb246bd83fe9'::uuid, 2025, 'Bing Bong',         false, 'Premios Heat 2025'),
         ('32d73576-29be-40c4-b529-a7ce943fe2ec'::uuid, '96cd0802-d976-4d4b-8ff2-cc17bcd6a2ae'::uuid, 2025, NULL,                true,  'Premios Tu Musica Urbano 2025'),
         ('32d73576-29be-40c4-b529-a7ce943fe2ec'::uuid, 'd9382354-9c4b-499d-b6d5-742d121d1ea2'::uuid, 2025, 'Bing Bong',         true,  'Premios Tu Musica Urbano 2025'),
         ('f289c627-bc9e-48c5-8da3-d8fe3e9b0f60'::uuid, '56e93427-0c55-4eb6-b539-43e981a3f3cf'::uuid, 2026, 'Bing Bong',         false, 'Premio Lo Nuestro 2026 nominees (Univision, Billboard, Us Weekly)')
       ) AS v(award_id, category_id, year, work, won, source)
 WHERE a.slug = 'yailin-la-mas-viral'
   AND NOT EXISTS (
       SELECT 1 FROM artist_awards x
        WHERE x.artist_id = a.id
          AND x.award_id = v.award_id
          AND x.category_id = v.category_id
          AND x.year = v.year);

COMMIT;
