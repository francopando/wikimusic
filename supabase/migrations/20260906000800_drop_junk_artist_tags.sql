BEGIN;

-- Remove three values from artist_tags that do not belong to it.
--
-- artist_tags is a closed classification vocabulary. The admin form offers two
-- groups and nothing else -- religiousTagOptions ["christian","secular"] and
-- careerStageTagOptions ["legend","emerging"] -- and the public routes that read
-- the column are /christian, /artists/legends and /artists/emerging, with
-- ArtistDirectory typing the filter as "legend" | "emerging". Three values in
-- the data are outside that vocabulary and came in with the original import:
--
--   "urban"        on El Cherry Scom  -- a genre word in a classification field
--   "dembow"       on El Cherry Scom  -- the same
--   "needs_review" on DJ Plano        -- duplicates the status column, which
--                                        already says needs_review
--
-- Nothing reads any of them and no route can surface them. No information is
-- lost: El Cherry Scom's genre is carried by primary_genre "urbano" and genres
-- ["urban-reggaeton"], and DJ Plano's review state is carried by status.
--
-- FLAGGED FOR THE EDITOR, and deliberately not done here: El Cherry Scom is a
-- dembow artist and "urban-dembow" is arguably missing from his genres array.
-- That is a genre decision and genre decisions are the editor's, so this
-- migration only removes what was in the wrong column.
--
-- The tag "diaspora" is also outside the vocabulary but is left in place: it is
-- under discussion and may become a real facet once it has been defined.
--
-- Applied directly over DATABASE_URL. No Vercel function ran and nothing was
-- revalidated.

UPDATE artists
   SET artist_tags = array_remove(
                       array_remove(
                         array_remove(artist_tags, 'urban'),
                       'dembow'),
                     'needs_review'),
       updated_at = now()
 WHERE artist_tags && ARRAY['urban', 'dembow', 'needs_review'];

COMMIT;
