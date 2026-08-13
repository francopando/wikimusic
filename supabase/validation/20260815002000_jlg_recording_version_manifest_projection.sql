\set ON_ERROR_STOP on
BEGIN;

DO $$
DECLARE
  jlg uuid := '10034596-47cb-46ba-9e80-9ea319a2c0df';
  collaborator uuid;
  performer_role uuid;
BEGIN
  SELECT id INTO collaborator FROM public.artists WHERE id<>jlg ORDER BY id LIMIT 1;
  SELECT id INTO performer_role FROM public.credit_roles WHERE code='featured_performer';
  INSERT INTO public.recordings(id,title,artist_id,slug) VALUES
   ('10000000-0000-4000-8000-000000000001','Projection original',jlg,'projection-original'),
   ('10000000-0000-4000-8000-000000000002','Projection original',jlg,'projection-live-one'),
   ('10000000-0000-4000-8000-000000000003','Projection original',jlg,'projection-live-two'),
   ('10000000-0000-4000-8000-000000000004','Projection Portuguese',jlg,'projection-portuguese'),
   ('10000000-0000-4000-8000-000000000005','Projection remix',jlg,'projection-remix'),
   ('10000000-0000-4000-8000-000000000006','Projection live edit',jlg,'projection-live-edit'),
   ('10000000-0000-4000-8000-000000000007','Projection Privé',jlg,'projection-prive'),
   ('10000000-0000-4000-8000-000000000008','Projection collaboration',jlg,'projection-collaboration'),
   ('10000000-0000-4000-8000-000000000009','Projection arrangement hold',jlg,'projection-arrangement-hold');

  PERFORM set_config('app.governed_recording_version_profile','on',true);
  INSERT INTO public.recording_version_profiles(recording_id,performance_kind,performance_date,performance_date_precision,performance_context) VALUES
   ('10000000-0000-4000-8000-000000000002','live',DATE '2005-01-01','year','Estadio Olímpico, Santo Domingo'),
   ('10000000-0000-4000-8000-000000000003','live',DATE '2021-01-01','year','Entre Mar y Palmeras');
  INSERT INTO public.recording_version_profiles(recording_id,performance_kind,derivation_kind,language_code,performance_context) VALUES
   ('10000000-0000-4000-8000-000000000004','studio','rerecording','pt','Romance Rosa'),
   ('10000000-0000-4000-8000-000000000007','studio','rerecording',NULL,'Privé');
  INSERT INTO public.recording_version_profiles(recording_id,derivation_kind) VALUES
   ('10000000-0000-4000-8000-000000000005','remix');
  INSERT INTO public.recording_version_profiles(recording_id,performance_kind,derivation_kind,performance_context) VALUES
   ('10000000-0000-4000-8000-000000000006','live','edit','Asondeguerra Tour'),
   ('10000000-0000-4000-8000-000000000008','live',NULL,'Encuentro');
  PERFORM set_config('app.governed_recording_version_profile','off',true);

  INSERT INTO public.recording_relationships(recording_id,related_recording_id,relationship_type)
  VALUES('10000000-0000-4000-8000-000000000006','10000000-0000-4000-8000-000000000002','edit_of');

  PERFORM set_config('app.governed_credit','on',true);
  INSERT INTO public.recording_credits(recording_id,artist_id,role,role_id,credited_as)
  VALUES('10000000-0000-4000-8000-000000000008',collaborator,'featured_performer',performer_role,'Projection Collaborator');
  PERFORM set_config('app.governed_credit','off',true);

  IF EXISTS(SELECT 1 FROM public.recording_version_profiles WHERE recording_id IN('10000000-0000-4000-8000-000000000001','10000000-0000-4000-8000-000000000009')) THEN RAISE EXCEPTION 'original/Arrangement-only rows incorrectly require a profile'; END IF;
  IF (SELECT count(*) FROM public.recording_identity_summary WHERE recording_id IN('10000000-0000-4000-8000-000000000002','10000000-0000-4000-8000-000000000003') AND performance_kind='live' AND performance_context IS NOT NULL)<>2 THEN RAISE EXCEPTION 'multiple live projection failed'; END IF;
  IF NOT EXISTS(SELECT 1 FROM public.recording_identity_summary WHERE recording_id='10000000-0000-4000-8000-000000000004' AND performance_kind='studio' AND derivation_kind='rerecording' AND language_code='pt') THEN RAISE EXCEPTION 'Portuguese rerecording projection failed'; END IF;
  IF NOT EXISTS(SELECT 1 FROM public.recording_identity_summary WHERE recording_id='10000000-0000-4000-8000-000000000005' AND derivation_kind='remix') THEN RAISE EXCEPTION 'remix projection failed'; END IF;
  IF NOT EXISTS(SELECT 1 FROM public.recording_identity_summary WHERE recording_id='10000000-0000-4000-8000-000000000006' AND performance_kind='live' AND derivation_kind='edit') THEN RAISE EXCEPTION 'live-edit projection failed'; END IF;
  IF NOT EXISTS(SELECT 1 FROM public.recording_identity_summary WHERE recording_id='10000000-0000-4000-8000-000000000007' AND performance_context='Privé') THEN RAISE EXCEPTION 'Privé projection failed'; END IF;
  IF NOT EXISTS(SELECT 1 FROM public.recording_identity_summary WHERE recording_id='10000000-0000-4000-8000-000000000008' AND jsonb_array_length(performers)=1 AND performers @> jsonb_build_array(jsonb_build_object('artist_id',collaborator))) THEN RAISE EXCEPTION 'credit-derived collaboration projection failed'; END IF;
END$$;

SELECT canonical_title,performance_kind,derivation_kind,language_code,performance_date_precision,performance_context,jsonb_array_length(performers) performer_count,has_structured_version_profile
FROM public.recording_identity_summary WHERE recording_id::text LIKE '10000000-0000-4000-8000-%' ORDER BY recording_id;

ROLLBACK;
SELECT count(*) AS residual_projection_fixtures FROM public.recordings WHERE id::text LIKE '10000000-0000-4000-8000-%';
