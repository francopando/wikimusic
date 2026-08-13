-- **EMERGENCY ONLY** — DO NOT USE AS A NORMAL DOWNGRADE PATH.
-- This restores the pre-Phase-2 policies and broad
-- client grants, including the known authenticated-write vulnerabilities.
-- Prefer a corrective forward migration for every non-catastrophic issue.
BEGIN;

DROP POLICY IF EXISTS artists_public_select ON public.artists;
CREATE POLICY "Allow authenticated insert artists" ON public.artists
  FOR INSERT TO authenticated WITH CHECK (auth.role() = 'authenticated');
CREATE POLICY "Allow public read" ON public.artists FOR SELECT TO PUBLIC USING (true);
CREATE POLICY "Allow read artists" ON public.artists FOR SELECT TO PUBLIC USING (true);
CREATE POLICY "Public artists are viewable" ON public.artists FOR SELECT TO PUBLIC USING (true);

DROP POLICY IF EXISTS featured_artist_public_select ON public.featured_artist;
CREATE POLICY "Allow authenticated write featured artist" ON public.featured_artist
  FOR ALL TO authenticated USING (auth.role() = 'authenticated') WITH CHECK (auth.role() = 'authenticated');
CREATE POLICY "Allow public read access" ON public.featured_artist FOR SELECT TO PUBLIC USING (true);
CREATE POLICY "Allow public read featured artist" ON public.featured_artist FOR SELECT TO anon, authenticated USING (true);

DROP POLICY IF EXISTS recordings_public_select ON public.recordings;
CREATE POLICY "Allow public read" ON public.recordings FOR SELECT TO PUBLIC USING (true);
CREATE POLICY "Allow public read access" ON public.recordings FOR SELECT TO PUBLIC USING (true);
CREATE POLICY "Public read recordings" ON public.recordings FOR SELECT TO PUBLIC USING (true);

DROP POLICY IF EXISTS releases_public_select ON public.releases;
CREATE POLICY "Allow public read" ON public.releases FOR SELECT TO PUBLIC USING (true);
CREATE POLICY "Public read releases" ON public.releases FOR SELECT TO PUBLIC USING (true);

CREATE POLICY release_artists_manage_admin ON public.release_artists FOR ALL TO authenticated
  USING ((auth.jwt() ->> 'role') = 'admin') WITH CHECK ((auth.jwt() ->> 'role') = 'admin');
CREATE POLICY release_artists_select_authenticated ON public.release_artists
  FOR SELECT TO authenticated USING (true);

GRANT ALL ON ALL TABLES IN SCHEMA public TO anon, authenticated;
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO anon, authenticated;

UPDATE storage.buckets SET file_size_limit = NULL, allowed_mime_types = NULL
WHERE id IN ('artists-images', 'contributors-images');

DROP FUNCTION IF EXISTS public.has_staff_role(text);
DROP FUNCTION IF EXISTS public.current_staff_role();

COMMIT;
