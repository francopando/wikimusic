-- Normalise the capitalisation of artists.aliases at write time.
--
-- WHY THIS EXISTS
-- 145 of the 334 artist rows that carry aliases had at least one stored entirely
-- in lowercase ("el ruiseñor de la sierra", "ringo martínez"), while others on
-- the same row were correct ("Rey del Merengue Electrónico"). The Ficha Técnica
-- renders aliases verbatim -- ArtistFactsCard passes them straight to
-- InlineList with no transform -- so the lowercase reached the public page.
-- Aliases are written directly to this table with no application layer in
-- between, so the guard belongs in the database.
--
-- WHY A TRIGGER AND NOT A CHECK CONSTRAINT
-- A CHECK would reject writes, and some artists are styled lowercase on purpose
-- (mamajuana, mediopicky, Adriel.sfx). Rejecting those would be wrong. This
-- normalises instead, and only where it is safe to.
--
-- IT FOLLOWS THE EXISTING PATTERN IN THIS TABLE. artists_slug_trigger already
-- normalises on BEFORE INSERT OR UPDATE, and it is deliberately conservative --
-- set_artist_slug only fills the slug when it is null or empty and never
-- overwrites a hand-set one. This trigger is conservative in the same spirit:
--   * an alias that already contains an uppercase letter is left exactly alone,
--     because someone wrote it that way on purpose;
--   * an artist whose own name is styled lowercase keeps lowercase aliases;
--   * Spanish minor words stay lowercase unless they open the alias, so it
--     produces "El Ruiseñor de la Sierra" and not "El Ruiseñor De La Sierra".
--
-- KNOWN LIMITATION: this does not consult the artist's own name word by word, so
-- it cannot restore an accent or an internal capital that the alias omits
-- ("adriel sfx" beside a name of "Adriel.sfx" is handled by the whole-name rule
-- above, but a mixed case like "juan LUIS guerra" would not be). The one-off
-- backfill script did that; this is the ongoing floor, not a replacement for
-- editorial care.
--
-- Reversible: see supabase/rollback/20260826_revert_normalize_artist_aliases.sql

create or replace function public.title_case_alias(input text)
returns text
language plpgsql
immutable
set search_path to 'public'
as $function$
declare
  minor constant text[] := array['de','del','la','las','el','los','y','e','con',
                                 'en','a','al','por','para','un','una','lo',
                                 'su','sus','mi','mis','tu','tus','sin','que',
                                 'o','u','ni','se','le','les'];
  words   text[];
  w       text;
  bare    text;
  result  text[] := '{}';
  idx     int := 0;
  pos     int;
begin
  if input is null or input = '' then
    return input;
  end if;

  words := regexp_split_to_array(input, '\s+');

  foreach w in array words loop
    idx  := idx + 1;
    bare := lower(regexp_replace(w, '[^[:alpha:]]', '', 'g'));

    if w <> lower(w) then
      -- Already carries a capital. Deliberate; leave it.
      result := result || w;
    elsif idx > 1 and bare = any(minor) then
      -- A Spanish minor word inside the alias stays lowercase.
      result := result || w;
    else
      -- Uppercase the first alphabetic character, wherever it sits.
      pos := 1;
      while pos <= length(w) and substring(w from pos for 1) !~ '[[:alpha:]]' loop
        pos := pos + 1;
      end loop;
      if pos <= length(w) then
        result := result || (substring(w from 1 for pos - 1)
                             || upper(substring(w from pos for 1))
                             || substring(w from pos + 1));
      else
        result := result || w;
      end if;
    end if;
  end loop;

  return array_to_string(result, ' ');
end;
$function$;

comment on function public.title_case_alias(text) is
  'Title-cases a Spanish artist alias, keeping minor words lowercase inside the phrase and leaving any token that already has a capital untouched.';

create or replace function public.normalize_artist_aliases()
returns trigger
language plpgsql
set search_path to 'public'
as $function$
declare
  result text[] := '{}';
  a      text;
begin
  if NEW.aliases is null or cardinality(NEW.aliases) = 0 then
    return NEW;
  end if;

  -- Artists styled lowercase keep lowercase aliases: mamajuana, mediopicky.
  if NEW.name is not null and NEW.name = lower(NEW.name) then
    return NEW;
  end if;

  foreach a in array NEW.aliases loop
    if a is null or a = '' or a <> lower(a) then
      result := result || a;
    else
      result := result || public.title_case_alias(a);
    end if;
  end loop;

  NEW.aliases := result;
  return NEW;
end;
$function$;

comment on function public.normalize_artist_aliases() is
  'BEFORE INSERT OR UPDATE OF aliases on artists: capitalises aliases stored entirely in lowercase, unless the artist name is itself styled lowercase.';

drop trigger if exists artists_normalize_aliases on public.artists;

create trigger artists_normalize_aliases
  before insert or update of aliases on public.artists
  for each row execute function public.normalize_artist_aliases();
