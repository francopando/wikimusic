BEGIN;

-- Storage objects in public buckets are fetched through /object/public URLs.
-- SELECT policies govern Storage API metadata access (including list) and are
-- only retained for active admins because browser-side upsert needs SELECT.

CREATE OR REPLACE FUNCTION public.is_active_storage_admin()
RETURNS boolean
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = ''
AS $$
  SELECT EXISTS (
    SELECT 1
    FROM public.admin_members AS member
    WHERE member.user_id = auth.uid()
      AND member.status = 'active'
  );
$$;

COMMENT ON FUNCTION public.is_active_storage_admin() IS
  'RLS predicate for authenticated Storage mutations. Reads admin_members without exposing that table to clients.';

REVOKE ALL ON FUNCTION public.is_active_storage_admin() FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.is_active_storage_admin() TO authenticated, service_role;

CREATE OR REPLACE FUNCTION public.is_valid_admin_storage_path(
  target_bucket text,
  target_name text
)
RETURNS boolean
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = ''
AS $$
  SELECT CASE target_bucket
    WHEN 'artists-images' THEN EXISTS (
      SELECT 1
      FROM public.artists AS artist
      WHERE target_name = artist.id::text || '.webp'
    )
    WHEN 'contributors-images' THEN EXISTS (
      SELECT 1
      FROM public.contributors AS contributor
      WHERE target_name = contributor.id::text || '.webp'
    )
    ELSE false
  END;
$$;

COMMENT ON FUNCTION public.is_valid_admin_storage_path(text, text) IS
  'Restricts browser-managed Storage objects to an existing entity UUID plus the canonical .webp extension.';

REVOKE ALL ON FUNCTION public.is_valid_admin_storage_path(text, text) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.is_valid_admin_storage_path(text, text) TO authenticated, service_role;

-- Broad/legacy public and authenticated policies confirmed in production.
DROP POLICY IF EXISTS "Public can read artist images" ON storage.objects;
DROP POLICY IF EXISTS "Allow anon upload to artist images" ON storage.objects;
DROP POLICY IF EXISTS "Allow anon update to artist images" ON storage.objects;
DROP POLICY IF EXISTS "Allow authenticated upload to artist images" ON storage.objects;
DROP POLICY IF EXISTS "Allow authenticated update to artist images" ON storage.objects;
DROP POLICY IF EXISTS "Allow authenticated users to upload artist images" ON storage.objects;
DROP POLICY IF EXISTS "Allow authenticated users to update artist images" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can upload contributor images" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can update contributor images" ON storage.objects;

-- Replace the existing admin policies so bucket and canonical entity path are
-- both checked. SELECT is required for Storage upsert/replacement.
DROP POLICY IF EXISTS "Admins can read artist images" ON storage.objects;
DROP POLICY IF EXISTS "Admins can upload artist images" ON storage.objects;
DROP POLICY IF EXISTS "Admins can update artist images" ON storage.objects;
DROP POLICY IF EXISTS "Admins can delete artist images" ON storage.objects;

CREATE POLICY "Admins can read artist image objects"
ON storage.objects
FOR SELECT
TO authenticated
USING (
  bucket_id = 'artists-images'
  AND public.is_active_storage_admin()
  AND public.is_valid_admin_storage_path(bucket_id, name)
);

CREATE POLICY "Admins can upload artist image objects"
ON storage.objects
FOR INSERT
TO authenticated
WITH CHECK (
  bucket_id = 'artists-images'
  AND public.is_active_storage_admin()
  AND public.is_valid_admin_storage_path(bucket_id, name)
);

CREATE POLICY "Admins can update artist image objects"
ON storage.objects
FOR UPDATE
TO authenticated
USING (
  bucket_id = 'artists-images'
  AND public.is_active_storage_admin()
  AND public.is_valid_admin_storage_path(bucket_id, name)
)
WITH CHECK (
  bucket_id = 'artists-images'
  AND public.is_active_storage_admin()
  AND public.is_valid_admin_storage_path(bucket_id, name)
);

CREATE POLICY "Admins can delete artist image objects"
ON storage.objects
FOR DELETE
TO authenticated
USING (
  bucket_id = 'artists-images'
  AND public.is_active_storage_admin()
  AND public.is_valid_admin_storage_path(bucket_id, name)
);

DROP POLICY IF EXISTS "Admins can read contributor images" ON storage.objects;
DROP POLICY IF EXISTS "Admins can upload contributor images" ON storage.objects;
DROP POLICY IF EXISTS "Admins can update contributor images" ON storage.objects;

CREATE POLICY "Admins can read contributor image objects"
ON storage.objects
FOR SELECT
TO authenticated
USING (
  bucket_id = 'contributors-images'
  AND public.is_active_storage_admin()
  AND public.is_valid_admin_storage_path(bucket_id, name)
);

CREATE POLICY "Admins can upload contributor image objects"
ON storage.objects
FOR INSERT
TO authenticated
WITH CHECK (
  bucket_id = 'contributors-images'
  AND public.is_active_storage_admin()
  AND public.is_valid_admin_storage_path(bucket_id, name)
);

CREATE POLICY "Admins can update contributor image objects"
ON storage.objects
FOR UPDATE
TO authenticated
USING (
  bucket_id = 'contributors-images'
  AND public.is_active_storage_admin()
  AND public.is_valid_admin_storage_path(bucket_id, name)
)
WITH CHECK (
  bucket_id = 'contributors-images'
  AND public.is_active_storage_admin()
  AND public.is_valid_admin_storage_path(bucket_id, name)
);

-- service_role has BYPASSRLS; explicit service policies are redundant and can
-- mislead future audits into treating them as required authorization controls.
DROP POLICY IF EXISTS "Admin Access" ON storage.objects;
DROP POLICY IF EXISTS "Sync Script Admin" ON storage.objects;

NOTIFY pgrst, 'reload schema';

COMMIT;
