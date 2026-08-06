-- Phase 4 destructive cutover. Run only after the TypeScript migration and integrity scan pass.
BEGIN;

UPDATE public.artists
SET bio_en = bio
WHERE (bio_en IS NULL OR btrim(bio_en) = '')
  AND bio IS NOT NULL
  AND btrim(bio) <> '';

DO $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM public.artists
    WHERE bio IS NOT NULL AND btrim(bio) <> ''
      AND (bio_en IS NULL OR btrim(bio_en) = '')
  ) THEN
    RAISE EXCEPTION 'Cannot drop artists.bio: populated bio remains without bio_en.';
  END IF;

  IF EXISTS (
    SELECT 1 FROM public.artists a
    WHERE a.bio_en IS NOT NULL AND btrim(a.bio_en) <> ''
      AND NOT EXISTS (
        SELECT 1 FROM public.editorial_documents d
        WHERE d.document_type = 'artist_biography'
          AND d.owner_artist_id = a.id AND d.locale = 'en'
          AND d.status = 'published' AND d.schema_version = 1
      )
  ) THEN
    RAISE EXCEPTION 'Cannot drop artists.bio: eligible English biography lacks a published structured document.';
  END IF;

  IF EXISTS (
    SELECT 1 FROM public.artists a
    WHERE a.bio_es IS NOT NULL AND btrim(a.bio_es) <> ''
      AND NOT EXISTS (
        SELECT 1 FROM public.editorial_documents d
        WHERE d.document_type = 'artist_biography'
          AND d.owner_artist_id = a.id AND d.locale = 'es'
          AND d.status = 'published' AND d.schema_version = 1
      )
  ) THEN
    RAISE EXCEPTION 'Cannot drop artists.bio: eligible Spanish biography lacks a published structured document.';
  END IF;
END;
$$;

ALTER TABLE public.artists DROP COLUMN bio;

COMMIT;
