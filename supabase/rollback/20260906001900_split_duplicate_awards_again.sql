BEGIN;

-- Reverts 20260906001900_merge_duplicate_awards.sql.
--
-- Recreates the four removed award rows with their original ids and creation
-- dates, then returns the categories and artist_awards rows that were moved.
-- The award rows have to exist again before anything can point at them.

INSERT INTO awards (id, name, created_at) VALUES
  ('8a6048b0-6324-48fe-9d10-011b9bbb5449'::uuid, 'Latin Grammy',     '2026-08-02'::timestamptz),
  ('4dda4da0-c769-499a-b24f-2a8999f5a9f0'::uuid, 'Premios Soberano', '2026-08-02'::timestamptz),
  ('a25812b4-ef8b-435f-a745-316bf040932d'::uuid, 'Premios Soberano', '2026-08-05'::timestamptz),
  ('fd9277a2-f23e-4885-950b-db8f16feffdc'::uuid, 'Premios Soberano', '2026-08-06'::timestamptz)
ON CONFLICT (id) DO NOTHING;

UPDATE award_categories SET award_id = '8a6048b0-6324-48fe-9d10-011b9bbb5449'::uuid
 WHERE id = 'd2799d5d-a14f-4f49-a317-52199253a8f5'::uuid;
UPDATE artist_awards SET award_id = '8a6048b0-6324-48fe-9d10-011b9bbb5449'::uuid, updated_at = now()
 WHERE category_id = 'd2799d5d-a14f-4f49-a317-52199253a8f5'::uuid;

UPDATE award_categories SET award_id = '4dda4da0-c769-499a-b24f-2a8999f5a9f0'::uuid
 WHERE id IN ('b336bbd9-0dfa-4331-8567-0b3e5a874252'::uuid,
              '7c0225fd-cbe7-4ef9-a579-f50371f5d269'::uuid,
              '902e3ebc-b04f-448c-bdb2-3972addcc71a'::uuid);
UPDATE artist_awards SET award_id = '4dda4da0-c769-499a-b24f-2a8999f5a9f0'::uuid, updated_at = now()
 WHERE category_id IN ('b336bbd9-0dfa-4331-8567-0b3e5a874252'::uuid,
                       '7c0225fd-cbe7-4ef9-a579-f50371f5d269'::uuid,
                       '902e3ebc-b04f-448c-bdb2-3972addcc71a'::uuid);

UPDATE award_categories SET award_id = 'a25812b4-ef8b-435f-a745-316bf040932d'::uuid
 WHERE id = '1a744371-df83-426b-941f-e0b3be82efdc'::uuid;
UPDATE artist_awards SET award_id = 'a25812b4-ef8b-435f-a745-316bf040932d'::uuid, updated_at = now()
 WHERE category_id = '1a744371-df83-426b-941f-e0b3be82efdc'::uuid;

COMMIT;
