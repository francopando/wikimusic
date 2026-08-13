BEGIN;

-- Mangulina Music Ontology, Phase 1.
-- Additive only: no recording identity, track, release, or existing credit is
-- rewritten. External identifiers are evidence around Mangulina-owned UUIDs.

CREATE TABLE public.works (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  preferred_title text NOT NULL,
  slug text,
  language text,
  composition_year integer,
  publication_year integer,
  status text NOT NULL DEFAULT 'draft',
  editorial_notes text,
  metadata jsonb NOT NULL DEFAULT '{}'::jsonb,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT works_preferred_title_nonempty CHECK (btrim(preferred_title) <> ''),
  CONSTRAINT works_slug_nonempty CHECK (slug IS NULL OR btrim(slug) <> ''),
  CONSTRAINT works_language_nonempty CHECK (language IS NULL OR btrim(language) <> ''),
  CONSTRAINT works_composition_year_valid CHECK (composition_year IS NULL OR composition_year BETWEEN 1 AND 9999),
  CONSTRAINT works_publication_year_valid CHECK (publication_year IS NULL OR publication_year BETWEEN 1 AND 9999),
  CONSTRAINT works_status_valid CHECK (status IN ('draft', 'published', 'hidden', 'needs_review', 'duplicate', 'archived')),
  CONSTRAINT works_metadata_object CHECK (jsonb_typeof(metadata) = 'object')
);

CREATE UNIQUE INDEX works_slug_unique ON public.works (slug) WHERE slug IS NOT NULL;
CREATE INDEX works_preferred_title_idx ON public.works (preferred_title);
CREATE INDEX works_status_idx ON public.works (status);

COMMENT ON TABLE public.works IS
  'Mangulina-owned musical composition identities. Titles and external identifiers are evidence, never identity keys.';
COMMENT ON COLUMN public.works.preferred_title IS
  'Current editorial display title; equality does not establish Work identity. Alternate and translated titles belong in a future work_titles relation.';
COMMENT ON COLUMN public.works.composition_year IS
  'Nullable known composition year. Uncertain or disputed dates remain in evidence/editorial notes until a richer date assertion model is approved.';

ALTER TABLE public.recordings
  ADD CONSTRAINT recordings_work_id_fkey
  FOREIGN KEY (work_id) REFERENCES public.works(id) ON DELETE RESTRICT
  NOT VALID;

ALTER TABLE public.recordings VALIDATE CONSTRAINT recordings_work_id_fkey;
CREATE INDEX IF NOT EXISTS recordings_work_id_idx ON public.recordings (work_id);

CREATE TABLE public.work_credits (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  work_id uuid NOT NULL REFERENCES public.works(id) ON DELETE RESTRICT,
  artist_id uuid NOT NULL REFERENCES public.artists(id) ON DELETE RESTRICT,
  role text NOT NULL,
  credited_as text,
  credit_detail text,
  sequence integer,
  verification_status text NOT NULL DEFAULT 'unverified',
  notes text,
  metadata jsonb NOT NULL DEFAULT '{}'::jsonb,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT work_credits_role_nonempty CHECK (btrim(role) <> ''),
  CONSTRAINT work_credits_credited_as_nonempty CHECK (credited_as IS NULL OR btrim(credited_as) <> ''),
  CONSTRAINT work_credits_sequence_nonnegative CHECK (sequence IS NULL OR sequence >= 0),
  CONSTRAINT work_credits_verification_status_valid CHECK (verification_status IN ('unverified', 'verified', 'disputed', 'superseded')),
  CONSTRAINT work_credits_metadata_object CHECK (jsonb_typeof(metadata) = 'object'),
  CONSTRAINT work_credits_semantic_unique UNIQUE (work_id, artist_id, role)
);

CREATE INDEX work_credits_artist_id_idx ON public.work_credits (artist_id);
CREATE INDEX work_credits_work_role_idx ON public.work_credits (work_id, role);
CREATE INDEX work_credits_artist_role_idx ON public.work_credits (artist_id, role);

COMMENT ON TABLE public.work_credits IS
  'Credits attributable to a musical Work. Role and semantic scope are independent; recording- and release-level contributions remain in their scoped tables.';

CREATE TABLE public.work_credit_sources (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  work_credit_id uuid NOT NULL REFERENCES public.work_credits(id) ON DELETE CASCADE,
  source_type text NOT NULL,
  source_name text,
  source_reference text,
  assertion_status text NOT NULL DEFAULT 'supports',
  verification_status text NOT NULL DEFAULT 'unverified',
  notes text,
  metadata jsonb NOT NULL DEFAULT '{}'::jsonb,
  observed_at timestamptz,
  verified_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT work_credit_sources_type_nonempty CHECK (btrim(source_type) <> ''),
  CONSTRAINT work_credit_sources_assertion_status_valid CHECK (assertion_status IN ('supports', 'disputes', 'supersedes')),
  CONSTRAINT work_credit_sources_verification_status_valid CHECK (verification_status IN ('unverified', 'verified', 'rejected')),
  CONSTRAINT work_credit_sources_metadata_object CHECK (jsonb_typeof(metadata) = 'object')
);

CREATE INDEX work_credit_sources_credit_idx ON public.work_credit_sources (work_credit_id);

CREATE TABLE public.recording_isrcs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  recording_id uuid NOT NULL REFERENCES public.recordings(id) ON DELETE RESTRICT,
  isrc text NOT NULL,
  verification_status text NOT NULL DEFAULT 'unverified',
  first_observed_at timestamptz,
  last_verified_at timestamptz,
  notes text,
  metadata jsonb NOT NULL DEFAULT '{}'::jsonb,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT recording_isrcs_canonical_format CHECK (isrc ~ '^[A-Z]{2}[A-Z0-9]{3}[0-9]{7}$'),
  CONSTRAINT recording_isrcs_verification_status_valid CHECK (verification_status IN ('unverified', 'verified', 'disputed', 'superseded')),
  CONSTRAINT recording_isrcs_metadata_object CHECK (jsonb_typeof(metadata) = 'object'),
  CONSTRAINT recording_isrcs_recording_isrc_unique UNIQUE (recording_id, isrc)
);

CREATE INDEX recording_isrcs_isrc_idx ON public.recording_isrcs (isrc);
CREATE INDEX recording_isrcs_recording_idx ON public.recording_isrcs (recording_id);

COMMENT ON TABLE public.recording_isrcs IS
  'Normalized ISRC assignments to Mangulina Recordings. ISRC is not globally unique because conflicting historical claims must remain representable.';

CREATE TABLE public.recording_isrc_sources (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  recording_isrc_id uuid NOT NULL REFERENCES public.recording_isrcs(id) ON DELETE CASCADE,
  source_type text NOT NULL,
  source_name text,
  source_reference text,
  raw_isrc text,
  assertion_status text NOT NULL DEFAULT 'supports',
  verification_status text NOT NULL DEFAULT 'unverified',
  territory text,
  notes text,
  metadata jsonb NOT NULL DEFAULT '{}'::jsonb,
  observed_at timestamptz,
  verified_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT recording_isrc_sources_type_nonempty CHECK (btrim(source_type) <> ''),
  CONSTRAINT recording_isrc_sources_raw_nonempty CHECK (raw_isrc IS NULL OR btrim(raw_isrc) <> ''),
  CONSTRAINT recording_isrc_sources_assertion_status_valid CHECK (assertion_status IN ('supports', 'disputes', 'supersedes')),
  CONSTRAINT recording_isrc_sources_verification_status_valid CHECK (verification_status IN ('unverified', 'verified', 'rejected')),
  CONSTRAINT recording_isrc_sources_metadata_object CHECK (jsonb_typeof(metadata) = 'object')
);

CREATE INDEX recording_isrc_sources_assignment_idx ON public.recording_isrc_sources (recording_isrc_id);
CREATE INDEX recording_isrc_sources_reference_idx ON public.recording_isrc_sources (source_type, source_name);

CREATE OR REPLACE FUNCTION public.music_ontology_set_updated_at()
RETURNS trigger
LANGUAGE plpgsql
SET search_path = ''
AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;

CREATE TRIGGER works_updated_at BEFORE UPDATE ON public.works
  FOR EACH ROW EXECUTE FUNCTION public.music_ontology_set_updated_at();
CREATE TRIGGER work_credits_updated_at BEFORE UPDATE ON public.work_credits
  FOR EACH ROW EXECUTE FUNCTION public.music_ontology_set_updated_at();
CREATE TRIGGER work_credit_sources_updated_at BEFORE UPDATE ON public.work_credit_sources
  FOR EACH ROW EXECUTE FUNCTION public.music_ontology_set_updated_at();
CREATE TRIGGER recording_isrcs_updated_at BEFORE UPDATE ON public.recording_isrcs
  FOR EACH ROW EXECUTE FUNCTION public.music_ontology_set_updated_at();
CREATE TRIGGER recording_isrc_sources_updated_at BEFORE UPDATE ON public.recording_isrc_sources
  FOR EACH ROW EXECUTE FUNCTION public.music_ontology_set_updated_at();

REVOKE ALL ON FUNCTION public.music_ontology_set_updated_at() FROM PUBLIC, anon, authenticated;

-- Backfill only valid normalized values. Formatting punctuation is removed;
-- malformed source values remain untouched in compatibility columns and are
-- exposed by the verification view below. No Recording is created or merged.
WITH legacy_values AS (
  SELECT
    r.id AS recording_id,
    r.mbid,
    value.raw_isrc,
    upper(regexp_replace(btrim(value.raw_isrc), '[^A-Za-z0-9]', '', 'g')) AS normalized_isrc
  FROM public.recordings r
  CROSS JOIN LATERAL unnest(coalesce(r.isrcs, ARRAY[]::text[])) AS value(raw_isrc)
), valid_values AS (
  SELECT DISTINCT recording_id, mbid, raw_isrc, normalized_isrc
  FROM legacy_values
  WHERE normalized_isrc ~ '^[A-Z]{2}[A-Z0-9]{3}[0-9]{7}$'
)
INSERT INTO public.recording_isrcs (recording_id, isrc, verification_status)
SELECT DISTINCT recording_id, normalized_isrc, 'unverified'
FROM valid_values
ON CONFLICT (recording_id, isrc) DO NOTHING;

WITH legacy_values AS (
  SELECT
    r.id AS recording_id,
    r.mbid,
    value.raw_isrc,
    upper(regexp_replace(btrim(value.raw_isrc), '[^A-Za-z0-9]', '', 'g')) AS normalized_isrc
  FROM public.recordings r
  CROSS JOIN LATERAL unnest(coalesce(r.isrcs, ARRAY[]::text[])) AS value(raw_isrc)
), valid_values AS (
  SELECT DISTINCT recording_id, mbid, raw_isrc, normalized_isrc
  FROM legacy_values
  WHERE normalized_isrc ~ '^[A-Z]{2}[A-Z0-9]{3}[0-9]{7}$'
)
INSERT INTO public.recording_isrc_sources (
  recording_isrc_id,
  source_type,
  source_name,
  source_reference,
  raw_isrc,
  assertion_status,
  verification_status,
  observed_at
)
SELECT
  assignment.id,
  'legacy_catalog_backfill',
  'recordings.isrcs',
  valid.mbid::text,
  valid.raw_isrc,
  'supports',
  'unverified',
  now()
FROM valid_values valid
JOIN public.recording_isrcs assignment
  ON assignment.recording_id = valid.recording_id
 AND assignment.isrc = valid.normalized_isrc;

CREATE VIEW public.recording_isrc_backfill_issues
WITH (security_invoker = true)
AS
SELECT
  r.id AS recording_id,
  value.raw_isrc,
  upper(regexp_replace(btrim(value.raw_isrc), '[^A-Za-z0-9]', '', 'g')) AS normalized_candidate,
  'malformed_isrc'::text AS issue_type
FROM public.recordings r
CROSS JOIN LATERAL unnest(coalesce(r.isrcs, ARRAY[]::text[])) AS value(raw_isrc)
WHERE upper(regexp_replace(btrim(value.raw_isrc), '[^A-Za-z0-9]', '', 'g')) !~ '^[A-Z]{2}[A-Z0-9]{3}[0-9]{7}$';

CREATE VIEW public.recording_isrc_conflicts
WITH (security_invoker = true)
AS
SELECT
  isrc,
  count(DISTINCT recording_id) AS recording_count,
  array_agg(DISTINCT recording_id ORDER BY recording_id) AS recording_ids
FROM public.recording_isrcs
GROUP BY isrc
HAVING count(DISTINCT recording_id) > 1;

ALTER TABLE public.works ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.work_credits ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.work_credit_sources ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.recording_isrcs ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.recording_isrc_sources ENABLE ROW LEVEL SECURITY;

CREATE POLICY works_public_select ON public.works FOR SELECT TO anon, authenticated USING (status = 'published');
CREATE POLICY work_credits_public_select ON public.work_credits FOR SELECT TO anon, authenticated
  USING (EXISTS (SELECT 1 FROM public.works w WHERE w.id = work_id AND w.status = 'published'));
CREATE POLICY work_credit_sources_public_select ON public.work_credit_sources FOR SELECT TO anon, authenticated
  USING (EXISTS (
    SELECT 1 FROM public.work_credits wc
    JOIN public.works w ON w.id = wc.work_id
    WHERE wc.id = work_credit_id AND w.status = 'published'
  ));
CREATE POLICY recording_isrcs_public_select ON public.recording_isrcs FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY recording_isrc_sources_public_select ON public.recording_isrc_sources FOR SELECT TO anon, authenticated USING (true);

REVOKE ALL ON TABLE
  public.works,
  public.work_credits,
  public.work_credit_sources,
  public.recording_isrcs,
  public.recording_isrc_sources,
  public.recording_isrc_backfill_issues,
  public.recording_isrc_conflicts
FROM PUBLIC, anon, authenticated;

GRANT SELECT ON TABLE
  public.works,
  public.work_credits,
  public.work_credit_sources,
  public.recording_isrcs,
  public.recording_isrc_sources
TO anon, authenticated;

GRANT ALL ON TABLE
  public.works,
  public.work_credits,
  public.work_credit_sources,
  public.recording_isrcs,
  public.recording_isrc_sources
TO service_role;

GRANT SELECT ON TABLE
  public.recording_isrc_backfill_issues,
  public.recording_isrc_conflicts
TO service_role;

COMMENT ON VIEW public.recording_isrc_backfill_issues IS
  'Service-role verification report of malformed legacy ISRC values that were preserved but not normalized into recording_isrcs.';
COMMENT ON VIEW public.recording_isrc_conflicts IS
  'Service-role verification report of one normalized ISRC asserted for more than one Mangulina Recording; conflicts never merge identity.';

NOTIFY pgrst, 'reload schema';

COMMIT;
