BEGIN;

-- Artist publication is a database boundary, not only an application filter.
-- Remove every historical permissive policy name so SELECT policies cannot
-- combine with OR semantics to expose non-published rows.
DROP POLICY IF EXISTS "Allow public read" ON public.artists;
DROP POLICY IF EXISTS "Allow read artists" ON public.artists;
DROP POLICY IF EXISTS "Public artists are viewable" ON public.artists;
DROP POLICY IF EXISTS artists_public_select ON public.artists;

CREATE POLICY artists_public_select
ON public.artists
FOR SELECT
TO anon, authenticated
USING (status = 'published');

-- This raw identity view is evaluated as its owner and can therefore bypass
-- artists RLS. It has no public application consumer; the authorized server
-- identity workspace reads it with service_role.
REVOKE ALL PRIVILEGES ON TABLE public.recording_identity_summary
FROM anon, authenticated;
GRANT SELECT ON TABLE public.recording_identity_summary TO service_role;

DO $$
DECLARE
  select_policy_count integer;
  unexpected_policy_count integer;
BEGIN
  SELECT count(*)::integer,
         count(*) FILTER (
           WHERE policyname <> 'artists_public_select'
              OR roles <> ARRAY['anon', 'authenticated']::name[]
              OR cmd <> 'SELECT'
              OR qual <> '(status = ''published''::text)'
         )::integer
  INTO select_policy_count, unexpected_policy_count
  FROM pg_policies
  WHERE schemaname = 'public'
    AND tablename = 'artists'
    AND cmd = 'SELECT';

  IF select_policy_count <> 1 OR unexpected_policy_count <> 0 THEN
    RAISE EXCEPTION 'Unexpected effective artists SELECT policy set';
  END IF;
END;
$$;

COMMENT ON POLICY artists_public_select ON public.artists IS
  'Anonymous and ordinary authenticated clients may read published artists only. Trusted admin operations use service_role.';

NOTIFY pgrst, 'reload schema';

COMMIT;
