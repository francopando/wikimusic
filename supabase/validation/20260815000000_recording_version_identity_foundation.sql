\set ON_ERROR_STOP on

BEGIN;

DO $$
DECLARE
  actor uuid;
  source_uuid uuid;
  artist_uuid uuid;
  recording_uuid uuid := gen_random_uuid();
  parent_uuid uuid := gen_random_uuid();
  child_uuid uuid := gen_random_uuid();
  second_live_uuid uuid := gen_random_uuid();
  remix_uuid uuid := gen_random_uuid();
  save_key uuid := gen_random_uuid();
  first_result jsonb;
  repeat_result jsonb;
  evidence_count integer;
  audit_count integer;
BEGIN
  SELECT m.user_id INTO actor
  FROM public.admin_members m
  WHERE m.status = 'active' AND m.role IN ('owner','admin','editor')
  ORDER BY CASE m.role WHEN 'owner' THEN 1 WHEN 'admin' THEN 2 ELSE 3 END
  LIMIT 1;
  SELECT id INTO source_uuid FROM public.editorial_sources ORDER BY created_at LIMIT 1;
  SELECT id INTO artist_uuid FROM public.artists ORDER BY id LIMIT 1;
  IF actor IS NULL OR source_uuid IS NULL OR artist_uuid IS NULL THEN
    RAISE EXCEPTION 'required isolated fixtures are unavailable';
  END IF;

  INSERT INTO public.recordings(id,title,artist_id,slug) VALUES
    (recording_uuid,'Version foundation governed fixture',artist_uuid,'version-foundation-governed-fixture'),
    (parent_uuid,'Version foundation parent fixture',artist_uuid,'version-foundation-parent-fixture'),
    (child_uuid,'Version foundation child fixture',artist_uuid,'version-foundation-child-fixture'),
    (second_live_uuid,'Version foundation parent fixture',artist_uuid,'version-foundation-second-live-fixture'),
    (remix_uuid,'Version foundation remix fixture',artist_uuid,'version-foundation-remix-fixture');

  BEGIN
    INSERT INTO public.recording_version_profiles(recording_id,performance_kind) VALUES(recording_uuid,'live');
    RAISE EXCEPTION 'direct profile insert unexpectedly succeeded';
  EXCEPTION WHEN raise_exception THEN
    IF SQLERRM <> 'recording_version_profiles must use governed editorial workflow' THEN RAISE; END IF;
  END;

  PERFORM set_config('app.governed_recording_version_profile','on',true);
  BEGIN
    INSERT INTO public.recording_version_profiles(recording_id,performance_kind) VALUES(recording_uuid,'concert');
    RAISE EXCEPTION 'invalid performance kind unexpectedly succeeded';
  EXCEPTION WHEN check_violation THEN NULL; END;
  BEGIN
    INSERT INTO public.recording_version_profiles(recording_id) VALUES(recording_uuid);
    RAISE EXCEPTION 'empty profile unexpectedly succeeded';
  EXCEPTION WHEN check_violation THEN NULL; END;
  BEGIN
    INSERT INTO public.recording_version_profiles(recording_id,performance_date) VALUES(recording_uuid,DATE '2024-01-01');
    RAISE EXCEPTION 'date without precision unexpectedly succeeded';
  EXCEPTION WHEN check_violation THEN NULL; END;
  BEGIN
    INSERT INTO public.recording_version_profiles(recording_id,performance_date_precision) VALUES(recording_uuid,'year');
    RAISE EXCEPTION 'precision without date unexpectedly succeeded';
  EXCEPTION WHEN check_violation THEN NULL; END;
  BEGIN
    INSERT INTO public.recording_version_profiles(recording_id,language_code) VALUES(recording_uuid,'Portuguese');
    RAISE EXCEPTION 'invalid language code unexpectedly succeeded';
  EXCEPTION WHEN check_violation THEN NULL; END;
  BEGIN
    INSERT INTO public.recording_version_profiles(recording_id,performance_context) VALUES(recording_uuid,'   ');
    RAISE EXCEPTION 'blank context unexpectedly succeeded';
  EXCEPTION WHEN check_violation THEN NULL; END;
  BEGIN
    INSERT INTO public.recording_version_profiles(recording_id,performance_context) VALUES(recording_uuid,repeat('x',201));
    RAISE EXCEPTION 'oversized context unexpectedly succeeded';
  EXCEPTION WHEN check_violation THEN NULL; END;
  PERFORM set_config('app.governed_recording_version_profile','off',true);

  first_result := public.save_recording_version_profile(
    actor,save_key,recording_uuid,'live','edit','pt',DATE '2024-03-01','day',
    'Version Foundation Test Session',ARRAY[source_uuid],'isolated validation only'
  );
  IF (first_result #>> '{profile,performance_kind}') IS DISTINCT FROM 'live' THEN
    RAISE EXCEPTION 'governed save did not persist the expected profile';
  END IF;

  SELECT count(*) INTO evidence_count
  FROM public.editorial_assertion_evidence e
  WHERE e.assertion_id=(first_result->>'assertion_id')::uuid AND e.source_id=source_uuid;
  IF evidence_count <> 1 THEN RAISE EXCEPTION 'profile assertion evidence was not linked'; END IF;

  SELECT count(*) INTO audit_count FROM public.editorial_audit_events
  WHERE decision_id=(first_result->>'decision_id')::uuid AND row_id=recording_uuid;
  IF audit_count <> 1 THEN RAISE EXCEPTION 'profile save audit event was not written'; END IF;

  BEGIN
    UPDATE public.recording_version_profiles SET performance_kind='demo' WHERE recording_id=recording_uuid;
    RAISE EXCEPTION 'direct profile update unexpectedly succeeded';
  EXCEPTION WHEN raise_exception THEN
    IF SQLERRM <> 'recording_version_profiles must use governed editorial workflow' THEN RAISE; END IF;
  END;
  BEGIN
    DELETE FROM public.recording_version_profiles WHERE recording_id=recording_uuid;
    RAISE EXCEPTION 'direct profile delete unexpectedly succeeded';
  EXCEPTION WHEN raise_exception THEN
    IF SQLERRM <> 'recording_version_profiles must use governed editorial workflow' THEN RAISE; END IF;
  END;

  repeat_result := public.save_recording_version_profile(
    actor,save_key,recording_uuid,'demo',NULL,NULL,NULL,NULL,NULL,
    ARRAY[]::uuid[],'this changed payload must be ignored'
  );
  IF repeat_result IS DISTINCT FROM first_result THEN RAISE EXCEPTION 'idempotency result mismatch'; END IF;

  PERFORM public.clear_recording_version_profile(actor,gen_random_uuid(),recording_uuid,ARRAY[source_uuid],'isolated validation only');
  IF EXISTS(SELECT 1 FROM public.recording_version_profiles WHERE recording_id=recording_uuid) THEN
    RAISE EXCEPTION 'governed clear did not remove profile';
  END IF;

  PERFORM set_config('app.governed_recording_version_profile','on',true);
  INSERT INTO public.recording_version_profiles(recording_id,performance_kind,performance_date,performance_date_precision,performance_context)
  VALUES(parent_uuid,'live',DATE '2013-01-01','year','Isolated Stadium Test');
  INSERT INTO public.recording_version_profiles(recording_id,performance_kind,derivation_kind,language_code,performance_context)
  VALUES(child_uuid,'studio','rerecording','pt','Isolated Session Test');
  INSERT INTO public.recording_version_profiles(recording_id,performance_kind,performance_date,performance_date_precision,performance_context)
  VALUES(second_live_uuid,'live',DATE '2021-01-01','year','Isolated Seaside Test');
  INSERT INTO public.recording_version_profiles(recording_id,derivation_kind)
  VALUES(remix_uuid,'remix');
  PERFORM set_config('app.governed_recording_version_profile','off',true);

  IF NOT EXISTS(SELECT 1 FROM public.recording_identity_summary WHERE recording_id=parent_uuid AND performance_kind='live' AND performance_date_precision='year') THEN
    RAISE EXCEPTION 'live identity summary case failed';
  END IF;
  IF NOT EXISTS(SELECT 1 FROM public.recording_identity_summary WHERE recording_id=child_uuid AND performance_kind='studio' AND derivation_kind='rerecording' AND language_code='pt') THEN
    RAISE EXCEPTION 'Portuguese rerecording identity summary case failed';
  END IF;
  IF (SELECT count(DISTINCT performance_context) FROM public.recording_identity_summary WHERE recording_id IN(parent_uuid,second_live_uuid)) <> 2 THEN
    RAISE EXCEPTION 'multiple live Recording distinction case failed';
  END IF;
  IF NOT EXISTS(SELECT 1 FROM public.recording_identity_summary WHERE recording_id=remix_uuid AND derivation_kind='remix') THEN
    RAISE EXCEPTION 'remix identity summary case failed';
  END IF;
  DELETE FROM public.recordings WHERE id=parent_uuid;
  IF EXISTS(SELECT 1 FROM public.recording_version_profiles WHERE recording_id=parent_uuid) THEN
    RAISE EXCEPTION 'parent delete did not cascade profile';
  END IF;

  INSERT INTO public.recording_relationships(recording_id,related_recording_id,relationship_type)
  VALUES(child_uuid,recording_uuid,'derived_from');
  BEGIN
    INSERT INTO public.recording_relationships(recording_id,related_recording_id,relationship_type)
    VALUES(recording_uuid,child_uuid,'arrangement_of');
    RAISE EXCEPTION 'unapproved relationship type unexpectedly succeeded';
  EXCEPTION WHEN check_violation THEN NULL;
  END;
END$$;

DO $$
BEGIN
  IF (SELECT count(*) FROM public.recording_identity_summary) <> (SELECT count(*) FROM public.recordings) THEN
    RAISE EXCEPTION 'identity summary is not one row per Recording';
  END IF;
  IF EXISTS (
    SELECT 1 FROM public.recording_version_profiles
    WHERE performance_kind NOT IN ('studio','live','demo','rehearsal','other')
       OR derivation_kind NOT IN ('rerecording','remix','edit','alternate_take','medley','other')
  ) THEN RAISE EXCEPTION 'controlled vocabulary violation'; END IF;
  IF NOT EXISTS (
    SELECT 1 FROM public.recording_identity_summary
    WHERE jsonb_array_length(performers) > 0
  ) THEN RAISE EXCEPTION 'collaboration/performer derivation case failed'; END IF;
  IF EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_schema='public' AND table_name='recording_version_profiles'
      AND column_name LIKE '%arrang%'
  ) THEN RAISE EXCEPTION 'Arrangement leaked into version profile'; END IF;
END$$;

ROLLBACK;

SET ROLE anon;
SELECT count(*) AS public_summary_rows FROM public.recording_identity_summary;
RESET ROLE;

SELECT
  (SELECT count(*) FROM public.recording_version_profiles) AS profile_rows,
  (SELECT count(*) FROM public.recording_relationships) AS relationship_rows;
