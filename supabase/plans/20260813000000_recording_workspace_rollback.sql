BEGIN;
DROP FUNCTION IF EXISTS public.save_editorial_recording_credit(uuid,uuid,uuid,uuid,uuid,uuid,uuid,text,text,integer,uuid[],uuid[],text);
DROP INDEX IF EXISTS public.recording_credits_external_role_semantic_uidx;
DROP INDEX IF EXISTS public.recording_credits_artist_role_semantic_uidx;
DROP TABLE IF EXISTS public.recording_credit_instruments;
DROP TABLE IF EXISTS public.instruments;
NOTIFY pgrst,'reload schema';
COMMIT;
