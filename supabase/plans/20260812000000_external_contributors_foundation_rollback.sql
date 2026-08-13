BEGIN;
DROP FUNCTION IF EXISTS public.get_public_recording_credits(uuid);
DROP FUNCTION IF EXISTS public.get_external_contributor_public(uuid);
DROP FUNCTION IF EXISTS public.create_external_work_credit(uuid,uuid,uuid,uuid,uuid,text,text,integer,uuid[],text);
DROP FUNCTION IF EXISTS public.create_external_contributor(uuid,uuid,text,text,text,text,uuid[],text);
ALTER TABLE public.recording_credits DROP CONSTRAINT IF EXISTS recording_credits_exactly_one_contributor, DROP COLUMN IF EXISTS external_contributor_id;
ALTER TABLE public.work_credits DROP CONSTRAINT IF EXISTS work_credits_exactly_one_contributor, DROP COLUMN IF EXISTS external_contributor_id;
ALTER TABLE public.work_credits ALTER COLUMN artist_id SET NOT NULL;
DROP TABLE IF EXISTS public.editorial_assertion_external_contributors;
DROP TABLE IF EXISTS public.external_contributors;
CREATE OR REPLACE FUNCTION public.validate_assertion_subject() RETURNS trigger LANGUAGE plpgsql SET search_path='' AS $$
DECLARE n integer;
BEGIN
  SELECT
    (SELECT count(*) FROM public.editorial_assertion_works WHERE assertion_id=NEW.id)+
    (SELECT count(*) FROM public.editorial_assertion_recordings WHERE assertion_id=NEW.id)+
    (SELECT count(*) FROM public.editorial_assertion_work_credits WHERE assertion_id=NEW.id)+
    (SELECT count(*) FROM public.editorial_assertion_recording_credits WHERE assertion_id=NEW.id)+
    (SELECT count(*) FROM public.editorial_assertion_isrcs WHERE assertion_id=NEW.id)+
    (SELECT count(*) FROM public.editorial_assertion_recording_work_targets WHERE assertion_id=NEW.id)
  INTO n;
  IF n<>1 THEN RAISE EXCEPTION 'assertion % must have exactly one typed subject/target (found %)',NEW.id,n; END IF;
  RETURN NEW;
END$$;
DELETE FROM public.editorial_role_capabilities WHERE capability IN ('external_contributor.create','external_contributor.edit');
DELETE FROM public.editorial_capabilities WHERE capability IN ('external_contributor.create','external_contributor.edit');
NOTIFY pgrst,'reload schema';
COMMIT;
