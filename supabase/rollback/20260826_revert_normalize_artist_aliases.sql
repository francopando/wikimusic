-- Revert 20260826000000_normalize_artist_aliases.sql
--
-- Drops the alias-capitalisation trigger and its two functions. The alias VALUES
-- already corrected by the one-off backfill are data, not schema, and are NOT
-- reverted here; dropping the trigger only stops future writes being normalised.

drop trigger if exists artists_normalize_aliases on public.artists;
drop function if exists public.normalize_artist_aliases();
drop function if exists public.title_case_alias(text);
