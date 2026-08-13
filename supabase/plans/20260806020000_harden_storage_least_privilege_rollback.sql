-- EMERGENCY ROLLBACK ONLY.
-- This restores the pre-audit production policies, including known anonymous
-- write and listing exposure. Prefer fixing a narrow policy defect instead.

BEGIN;

DROP POLICY IF EXISTS "Admins can read artist image objects" ON storage.objects;
DROP POLICY IF EXISTS "Admins can upload artist image objects" ON storage.objects;
DROP POLICY IF EXISTS "Admins can update artist image objects" ON storage.objects;
DROP POLICY IF EXISTS "Admins can delete artist image objects" ON storage.objects;
DROP POLICY IF EXISTS "Admins can read contributor image objects" ON storage.objects;
DROP POLICY IF EXISTS "Admins can upload contributor image objects" ON storage.objects;
DROP POLICY IF EXISTS "Admins can update contributor image objects" ON storage.objects;

CREATE POLICY "Public can read artist images" ON storage.objects FOR SELECT TO PUBLIC
USING (bucket_id = 'artists-images');
CREATE POLICY "Allow anon upload to artist images" ON storage.objects FOR INSERT TO anon
WITH CHECK (bucket_id = 'artists-images');
CREATE POLICY "Allow anon update to artist images" ON storage.objects FOR UPDATE TO anon
USING (bucket_id = 'artists-images') WITH CHECK (bucket_id = 'artists-images');
CREATE POLICY "Allow authenticated upload to artist images" ON storage.objects FOR INSERT TO authenticated
WITH CHECK (bucket_id = 'artists-images');
CREATE POLICY "Allow authenticated update to artist images" ON storage.objects FOR UPDATE TO authenticated
USING (bucket_id = 'artists-images') WITH CHECK (bucket_id = 'artists-images');
CREATE POLICY "Allow authenticated users to upload artist images" ON storage.objects FOR INSERT TO authenticated
WITH CHECK (bucket_id = 'artists-images');
CREATE POLICY "Allow authenticated users to update artist images" ON storage.objects FOR UPDATE TO authenticated
USING (bucket_id = 'artists-images') WITH CHECK (bucket_id = 'artists-images');
CREATE POLICY "Authenticated users can upload contributor images" ON storage.objects FOR INSERT TO authenticated
WITH CHECK (bucket_id = 'contributors-images');
CREATE POLICY "Authenticated users can update contributor images" ON storage.objects FOR UPDATE TO authenticated
USING (bucket_id = 'contributors-images') WITH CHECK (bucket_id = 'contributors-images');
CREATE POLICY "Admins can upload artist images" ON storage.objects FOR INSERT TO authenticated
WITH CHECK (bucket_id = 'artists-images' AND public.is_active_storage_admin());
CREATE POLICY "Admins can update artist images" ON storage.objects FOR UPDATE TO authenticated
USING (bucket_id = 'artists-images' AND public.is_active_storage_admin())
WITH CHECK (bucket_id = 'artists-images' AND public.is_active_storage_admin());
CREATE POLICY "Admins can delete artist images" ON storage.objects FOR DELETE TO authenticated
USING (bucket_id = 'artists-images' AND public.is_active_storage_admin());
CREATE POLICY "Admin Access" ON storage.objects FOR ALL TO service_role USING (true) WITH CHECK (true);
CREATE POLICY "Sync Script Admin" ON storage.objects FOR ALL TO service_role
USING (bucket_id = 'artists-images') WITH CHECK (bucket_id = 'artists-images');

COMMIT;
