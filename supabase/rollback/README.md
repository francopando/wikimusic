# Rollback artifacts

Nothing in this directory runs automatically. The Supabase CLI applies
`supabase/migrations/` only; this folder is deliberately a sibling so it is
never picked up as a migration.

## Why it exists

Migrations record a change as its **final state**, which makes it reproducible
but not reversible — replaying one cannot tell you what a column held before.
For a destructive pass, the original values have to be kept separately or they
are gone. These are those values.

## 2026-08-22 — artist genre normalisation

`20260822_revert_artist_genre_pass.sql` restores `artists.primary_genre` (131
artists) and `artists.genres` (316 artists) to the values they held before the
pass. Verified: applying it reproduces the pre-change fingerprint exactly.

Reverting reintroduces 501 values that match no row in `genres`, including 131
`genres[]` entries dropped as outside a Dominican-specialised catalogue. That is
the point of the file, but it undoes the reason the pass happened.

It reverts by `slug`, not by id, and only where the current value differs, so it
is safe to run twice — but it will also discard any genre edits made after
2026-08-22.

### Forward migrations this reverses

- `20260822010000_normalize_artist_primary_genre.sql`
- `20260822020000_normalize_artist_genres_array.sql`

Not covered: `20260822000000_add_salve_folklore_subgenre.sql` (additive — drop
the `folklore-salve` row and clear it from the two artists to undo) and
`20260822030000_artist_record_corrections.sql` (individually researched factual
fixes, including a wrong surname; reverting those would reintroduce known errors).

### snapshots-20260822/

Raw per-artist captures taken immediately before each step, in order:

| File | Captured before |
|---|---|
| `genre-rollback.json` | remapping invalid `primary_genre` values |
| `pop-rollback.json` | classifying the `pop` bucket |
| `final-three-rollback.json` | the last three `pop`/`other` decisions |
| `genres-array-rollback.json` | any `genres[]` work — **the true original** |
| `genres-drop-rollback.json` | dropping non-taxonomy `genres[]` values |

`genres-array-rollback.json` is the one to trust for original `genres[]`;
`genres-drop-rollback.json` already reflects the normalisation.
