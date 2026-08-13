BEGIN;

-- Tighten the cascade exception: a profile delete bypasses the governed flag
-- only after its owning Recording is already absent in an FK cascade.
CREATE OR REPLACE FUNCTION public.enforce_governed_recording_version_profile()
RETURNS trigger LANGUAGE plpgsql SET search_path='' AS $$
BEGIN
  IF TG_OP='DELETE' AND NOT EXISTS (
    SELECT 1 FROM public.recordings WHERE id=OLD.recording_id
  ) THEN RETURN OLD; END IF;
  IF current_setting('app.governed_recording_version_profile',true) IS DISTINCT FROM 'on' THEN
    RAISE EXCEPTION 'recording_version_profiles must use governed editorial workflow';
  END IF;
  RETURN CASE WHEN TG_OP='DELETE' THEN OLD ELSE NEW END;
END$$;

REVOKE ALL ON FUNCTION public.enforce_governed_recording_version_profile() FROM PUBLIC,anon,authenticated;

COMMIT;
