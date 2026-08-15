CREATE OR REPLACE FUNCTION public.get_archive_year_counts(
  p_start_year integer DEFAULT NULL,
  p_end_year integer DEFAULT NULL
)
RETURNS TABLE (year integer, count bigint)
LANGUAGE sql
STABLE
SECURITY INVOKER
SET search_path = ''
AS $$
  SELECT release.release_year::integer AS year, count(*)::bigint AS count
  FROM public.recordings AS recording
  JOIN public.releases AS release ON release.id = recording.release_id
  LEFT JOIN public.artists AS artist ON artist.id = release.release_artist_id
  WHERE release.release_year IS NOT NULL
    AND (p_start_year IS NULL OR release.release_year >= p_start_year)
    AND (p_end_year IS NULL OR release.release_year <= p_end_year)
    AND (release.release_artist_id IS NULL OR artist.status = 'published')
  GROUP BY release.release_year
  ORDER BY year ASC;
$$;

COMMENT ON FUNCTION public.get_archive_year_counts(integer, integer)
IS 'Returns public archive recording counts grouped by release year, with optional inclusive year bounds.';

GRANT EXECUTE ON FUNCTION public.get_archive_year_counts(integer, integer)
TO anon, authenticated, service_role;
