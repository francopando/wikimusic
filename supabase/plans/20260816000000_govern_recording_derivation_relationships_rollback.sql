BEGIN;
DROP FUNCTION IF EXISTS public.clear_recording_derivation_relationship(uuid,uuid,uuid,uuid,text,uuid[],text);
DROP FUNCTION IF EXISTS public.save_recording_derivation_relationship(uuid,uuid,uuid,uuid,text,uuid[],text);
DROP TRIGGER IF EXISTS recording_relationships_governed_write ON public.recording_relationships;
DROP FUNCTION IF EXISTS public.enforce_governed_recording_relationship();
NOTIFY pgrst,'reload schema';
COMMIT;
