CREATE TABLE public.artist_family_relationships (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  artist_id uuid NOT NULL REFERENCES public.artists(id) ON DELETE CASCADE,
  related_artist_id uuid NOT NULL REFERENCES public.artists(id) ON DELETE CASCADE,
  relationship_type text NOT NULL,
  relationship_status text,
  pair_low uuid GENERATED ALWAYS AS (least(artist_id, related_artist_id)) STORED,
  pair_high uuid GENERATED ALWAYS AS (greatest(artist_id, related_artist_id)) STORED,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT artist_family_relationships_no_self CHECK (artist_id <> related_artist_id),
  CONSTRAINT artist_family_relationships_type CHECK (
    relationship_type IN ('parent', 'sibling', 'cousin', 'spouse', 'grandparent', 'uncle_aunt', 'great_uncle_aunt')
  ),
  CONSTRAINT artist_family_relationships_status CHECK (
    (relationship_type = 'spouse' AND relationship_status IN ('current', 'former', 'ended_by_death'))
    OR (relationship_type <> 'spouse' AND relationship_status IS NULL)
  ),
  CONSTRAINT artist_family_relationships_one_pair UNIQUE (pair_low, pair_high)
);

CREATE INDEX artist_family_relationships_artist_idx ON public.artist_family_relationships (artist_id);
CREATE INDEX artist_family_relationships_related_artist_idx ON public.artist_family_relationships (related_artist_id);

CREATE OR REPLACE FUNCTION public.touch_artist_family_relationship_updated_at()
RETURNS trigger LANGUAGE plpgsql SET search_path = public AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;

CREATE TRIGGER artist_family_relationships_touch_updated_at
BEFORE UPDATE ON public.artist_family_relationships
FOR EACH ROW EXECUTE FUNCTION public.touch_artist_family_relationship_updated_at();

ALTER TABLE public.artist_family_relationships ENABLE ROW LEVEL SECURITY;
CREATE POLICY artist_family_relationships_public_select
ON public.artist_family_relationships FOR SELECT TO anon, authenticated USING (true);

GRANT SELECT ON public.artist_family_relationships TO anon, authenticated;
REVOKE INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER
ON public.artist_family_relationships FROM anon, authenticated;
REVOKE ALL ON FUNCTION public.touch_artist_family_relationship_updated_at() FROM PUBLIC, anon, authenticated;
