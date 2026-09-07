BEGIN;

-- Reverts 20260906001600_merge_duplicate_premio_lo_nuestro.sql.
--
-- Recreates the duplicate award row with its original id and created_at, moves
-- its two categories back, and returns the two Wilfrido Vargas rows to it.
-- Reverse order of the merge: the award has to exist again before anything can
-- point at it.

INSERT INTO awards (id, name, created_at)
VALUES ('80d6c813-821b-4f3c-9f64-3f2de71ed86c'::uuid,
        'Premio Lo Nuestro',
        '2026-08-02T16:21:04.018Z'::timestamptz)
ON CONFLICT (id) DO NOTHING;

UPDATE award_categories
   SET award_id = '80d6c813-821b-4f3c-9f64-3f2de71ed86c'::uuid
 WHERE id IN ('1f8163a1-7151-4f19-a9c6-f1c5753b7403'::uuid,
              '287e8c6a-57f8-4f67-ab26-7f51c04b2a48'::uuid);

UPDATE artist_awards
   SET award_id = '80d6c813-821b-4f3c-9f64-3f2de71ed86c'::uuid,
       updated_at = now()
 WHERE id IN ('c3b2c4a6-d9d7-4325-afe6-61e5957b8b25'::uuid,
              '1a9e4cf2-c345-402b-a549-32e35f7be74c'::uuid);

COMMIT;
