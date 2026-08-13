ALTER TABLE public.artist_family_relationships
  DROP CONSTRAINT IF EXISTS artist_family_relationships_type;

ALTER TABLE public.artist_family_relationships
  ADD CONSTRAINT artist_family_relationships_type CHECK (
    relationship_type IN (
      'parent',
      'sibling',
      'cousin',
      'spouse',
      'grandparent',
      'uncle_aunt',
      'great_uncle_aunt'
    )
  );
