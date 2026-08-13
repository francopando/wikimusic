BEGIN;

CREATE OR REPLACE FUNCTION public.current_staff_role()
RETURNS text
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = ''
AS $$
  SELECT member.role
  FROM public.admin_members AS member
  WHERE member.user_id = auth.uid()
    AND member.status = 'active'
    AND member.role IN ('owner', 'admin', 'editor')
  LIMIT 1;
$$;

CREATE OR REPLACE FUNCTION public.has_staff_role(minimum_role text DEFAULT 'editor')
RETURNS boolean
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = ''
AS $$
  SELECT COALESCE(
    CASE public.current_staff_role()
      WHEN 'owner' THEN 3
      WHEN 'admin' THEN 2
      WHEN 'editor' THEN 1
      ELSE 0
    END >= CASE minimum_role
      WHEN 'owner' THEN 3
      WHEN 'admin' THEN 2
      WHEN 'editor' THEN 1
      ELSE 2147483647
    END,
    false
  );
$$;

COMMENT ON FUNCTION public.current_staff_role() IS
  'Returns the active Mangulina staff role linked to auth.uid(), or null.';
COMMENT ON FUNCTION public.has_staff_role(text) IS
  'Checks the active owner/admin/editor hierarchy without trusting JWT metadata.';

REVOKE ALL ON FUNCTION public.current_staff_role() FROM PUBLIC, anon;
REVOKE ALL ON FUNCTION public.has_staff_role(text) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.current_staff_role() TO authenticated, service_role;
GRANT EXECUTE ON FUNCTION public.has_staff_role(text) TO authenticated, service_role;

-- All catalog mutations cross guarded server APIs and execute with service_role.
DROP POLICY IF EXISTS "Allow authenticated insert artists" ON public.artists;
DROP POLICY IF EXISTS "Allow authenticated write featured artist" ON public.featured_artist;
DROP POLICY IF EXISTS release_artists_manage_admin ON public.release_artists;

-- Consolidate duplicate read policies without changing public visibility.
DROP POLICY IF EXISTS "Allow public read" ON public.artists;
DROP POLICY IF EXISTS "Allow read artists" ON public.artists;
DROP POLICY IF EXISTS "Public artists are viewable" ON public.artists;
CREATE POLICY artists_public_select ON public.artists
  FOR SELECT TO anon, authenticated USING (true);

DROP POLICY IF EXISTS "Allow public read access" ON public.featured_artist;
DROP POLICY IF EXISTS "Allow public read featured artist" ON public.featured_artist;
CREATE POLICY featured_artist_public_select ON public.featured_artist
  FOR SELECT TO anon, authenticated USING (true);

DROP POLICY IF EXISTS "Allow public read" ON public.recordings;
DROP POLICY IF EXISTS "Allow public read access" ON public.recordings;
DROP POLICY IF EXISTS "Public read recordings" ON public.recordings;
CREATE POLICY recordings_public_select ON public.recordings
  FOR SELECT TO anon, authenticated USING (true);

DROP POLICY IF EXISTS "Allow public read" ON public.releases;
DROP POLICY IF EXISTS "Public read releases" ON public.releases;
CREATE POLICY releases_public_select ON public.releases
  FOR SELECT TO anon, authenticated USING (true);

-- Published release credits remain public. Authenticated clients receive no
-- broader view and no direct mutation path.
DROP POLICY IF EXISTS release_artists_select_authenticated ON public.release_artists;

-- SQL grants are a second boundary. Remove every client mutation capability,
-- including from views that may become updatable later. Existing SELECT grants
-- remain subject to RLS.
REVOKE INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER
  ON ALL TABLES IN SCHEMA public FROM anon, authenticated;

-- Sensitive/internal data is not client-readable even if a future policy is
-- added accidentally. Trusted application paths use service_role.
REVOKE ALL ON TABLE
  public.admin_members,
  public.admin_invites,
  public.editorial_documents,
  public.editorial_entity_references,
  public.artist_view_events,
  public.recording_view_events,
  public.release_view_events,
  public.genre_view_events,
  public.search_events,
  public.platform_click_events,
  public.page_view_events,
  public.analytics_rollup_status,
  public.apple_recording_candidates,
  public.cover_art_ingest_log,
  public.genre_import_mapping,
  public.imported_reference_table,
  public.odesli_batch_progress,
  public.recording_classification_review,
  public.wikidata_raw
FROM anon, authenticated;

REVOKE ALL ON ALL SEQUENCES IN SCHEMA public FROM anon, authenticated;

-- Browser Storage writes are replaced by guarded, decoding/re-encoding APIs.
DROP POLICY IF EXISTS "Admins can read artist image objects" ON storage.objects;
DROP POLICY IF EXISTS "Admins can upload artist image objects" ON storage.objects;
DROP POLICY IF EXISTS "Admins can update artist image objects" ON storage.objects;
DROP POLICY IF EXISTS "Admins can delete artist image objects" ON storage.objects;
DROP POLICY IF EXISTS "Admins can read contributor image objects" ON storage.objects;
DROP POLICY IF EXISTS "Admins can upload contributor image objects" ON storage.objects;
DROP POLICY IF EXISTS "Admins can update contributor image objects" ON storage.objects;

-- Public delivery uses /object/public URLs and does not require object-listing
-- policies. Limit the two interactive image buckets to controlled WebP output.
UPDATE storage.buckets
SET file_size_limit = 2097152,
    allowed_mime_types = ARRAY['image/webp']::text[]
WHERE id = 'artists-images';

UPDATE storage.buckets
SET file_size_limit = 4194304,
    allowed_mime_types = ARRAY['image/webp']::text[]
WHERE id = 'contributors-images';

DROP FUNCTION IF EXISTS public.is_valid_admin_storage_path(text, text);
DROP FUNCTION IF EXISTS public.is_active_storage_admin();

NOTIFY pgrst, 'reload schema';

COMMIT;
