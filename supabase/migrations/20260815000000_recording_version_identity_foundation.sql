BEGIN;

-- Empty authoritative foundation only. Provider/import disambiguation remains
-- provenance and is never promoted automatically into this table.
CREATE TABLE public.recording_version_profiles (
  recording_id uuid PRIMARY KEY REFERENCES public.recordings(id) ON DELETE CASCADE,
  performance_kind text,
  derivation_kind text,
  language_code text,
  performance_date date,
  performance_date_precision text,
  performance_context text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT recording_version_profiles_performance_kind_valid CHECK (performance_kind IS NULL OR performance_kind IN ('studio','live','demo','rehearsal','other')),
  CONSTRAINT recording_version_profiles_derivation_kind_valid CHECK (derivation_kind IS NULL OR derivation_kind IN ('rerecording','remix','edit','alternate_take','medley','other')),
  CONSTRAINT recording_version_profiles_language_valid CHECK (language_code IS NULL OR language_code ~ '^[a-z]{2,3}(-[A-Za-z0-9]{2,8})*$'),
  CONSTRAINT recording_version_profiles_date_precision_valid CHECK (performance_date_precision IS NULL OR performance_date_precision IN ('year','month','day')),
  CONSTRAINT recording_version_profiles_date_pair CHECK ((performance_date IS NULL) = (performance_date_precision IS NULL)),
  CONSTRAINT recording_version_profiles_context_valid CHECK (performance_context IS NULL OR (btrim(performance_context) <> '' AND length(btrim(performance_context)) <= 200)),
  CONSTRAINT recording_version_profiles_nonempty CHECK (num_nonnulls(performance_kind,derivation_kind,language_code,performance_date,performance_context) > 0)
);

COMMENT ON TABLE public.recording_version_profiles IS 'Governed intrinsic version facts for one Recording. Optional; ordinary original studio Recordings need no row.';
COMMENT ON COLUMN public.recording_version_profiles.performance_context IS 'Concise identity-relevant event/session context only. Never credits, Release-display duplication, evidence prose, URLs, importer notes, copyright, genres, or Arrangement/style labels.';
COMMENT ON COLUMN public.recordings.disambiguation IS 'Optional editorial display override and legacy/provider fallback. Not authoritative structured Recording version identity.';

CREATE INDEX recording_version_profiles_kind_idx ON public.recording_version_profiles(performance_kind,derivation_kind);
CREATE INDEX recording_version_profiles_language_idx ON public.recording_version_profiles(language_code) WHERE language_code IS NOT NULL;
CREATE INDEX recording_version_profiles_date_idx ON public.recording_version_profiles(performance_date) WHERE performance_date IS NOT NULL;

CREATE TRIGGER recording_version_profiles_updated_at BEFORE UPDATE ON public.recording_version_profiles
FOR EACH ROW EXECUTE FUNCTION public.music_ontology_set_updated_at();

ALTER TABLE public.recording_version_profiles ENABLE ROW LEVEL SECURITY;
REVOKE ALL ON public.recording_version_profiles FROM PUBLIC,anon,authenticated;
GRANT ALL ON public.recording_version_profiles TO service_role;

CREATE OR REPLACE FUNCTION public.enforce_governed_recording_version_profile()
RETURNS trigger LANGUAGE plpgsql SET search_path='' AS $$
BEGIN
  -- A parent Recording deletion may cascade its profile. Direct profile writes
  -- must use the governed functions and their transaction-local flag.
  IF TG_OP='DELETE' AND NOT EXISTS (
    SELECT 1 FROM public.recordings WHERE id=OLD.recording_id
  ) THEN RETURN OLD; END IF;
  IF current_setting('app.governed_recording_version_profile',true) IS DISTINCT FROM 'on' THEN
    RAISE EXCEPTION 'recording_version_profiles must use governed editorial workflow';
  END IF;
  RETURN CASE WHEN TG_OP='DELETE' THEN OLD ELSE NEW END;
END$$;

CREATE TRIGGER recording_version_profiles_governed_write
BEFORE INSERT OR UPDATE OR DELETE ON public.recording_version_profiles
FOR EACH ROW EXECUTE FUNCTION public.enforce_governed_recording_version_profile();
REVOKE ALL ON FUNCTION public.enforce_governed_recording_version_profile() FROM PUBLIC,anon,authenticated;

INSERT INTO public.editorial_capabilities(capability,description,high_impact)
VALUES('recording.version_manage','Create, update, or clear governed Recording version identity profiles.',false);
INSERT INTO public.editorial_role_capabilities(role,capability)
VALUES('owner','recording.version_manage'),('admin','recording.version_manage'),('editor','recording.version_manage');

CREATE OR REPLACE FUNCTION public.save_recording_version_profile(
  actor uuid,key uuid,recording_uuid uuid,
  performance_kind_value text DEFAULT NULL,derivation_kind_value text DEFAULT NULL,
  language_code_value text DEFAULT NULL,performance_date_value date DEFAULT NULL,
  performance_date_precision_value text DEFAULT NULL,performance_context_value text DEFAULT NULL,
  source_ids uuid[] DEFAULT ARRAY[]::uuid[],internal_notes_value text DEFAULT NULL
) RETURNS jsonb LANGUAGE plpgsql SECURITY DEFINER SET search_path='' AS $$
DECLARE cached jsonb; before_value jsonb; after_value jsonb; assertion_uuid uuid; decision_uuid uuid; source_uuid uuid; result_value jsonb;
BEGIN
  PERFORM public.require_editorial_capability(actor,'recording.version_manage');
  PERFORM pg_advisory_xact_lock(hashtextextended(actor::text||key::text,0));
  cached:=public.editorial_idempotent_result(actor,'recording_version_profile.save',key); IF cached IS NOT NULL THEN RETURN cached; END IF;
  PERFORM 1 FROM public.recordings WHERE id=recording_uuid FOR UPDATE; IF NOT FOUND THEN RAISE EXCEPTION 'recording not found'; END IF;
  SELECT to_jsonb(v) INTO before_value FROM public.recording_version_profiles v WHERE recording_id=recording_uuid;
  PERFORM set_config('app.governed_recording_version_profile','on',true);
  INSERT INTO public.recording_version_profiles(recording_id,performance_kind,derivation_kind,language_code,performance_date,performance_date_precision,performance_context)
  VALUES(recording_uuid,nullif(btrim(performance_kind_value),''),nullif(btrim(derivation_kind_value),''),nullif(btrim(language_code_value),''),performance_date_value,nullif(btrim(performance_date_precision_value),''),nullif(btrim(performance_context_value),''))
  ON CONFLICT(recording_id) DO UPDATE SET performance_kind=EXCLUDED.performance_kind,derivation_kind=EXCLUDED.derivation_kind,language_code=EXCLUDED.language_code,performance_date=EXCLUDED.performance_date,performance_date_precision=EXCLUDED.performance_date_precision,performance_context=EXCLUDED.performance_context;
  PERFORM set_config('app.governed_recording_version_profile','off',true);
  SELECT to_jsonb(v) INTO after_value FROM public.recording_version_profiles v WHERE recording_id=recording_uuid;
  INSERT INTO public.editorial_assertions(assertion_type,predicate,asserted_value,verification_status,canonical_status,internal_notes,created_by,reviewed_by,reviewed_at)
  VALUES('recording_version_profile','recording.version_identity',after_value,'verified','accepted',internal_notes_value,actor,actor,now()) RETURNING id INTO assertion_uuid;
  INSERT INTO public.editorial_assertion_recordings(assertion_id,recording_id) VALUES(assertion_uuid,recording_uuid);
  FOREACH source_uuid IN ARRAY coalesce(source_ids,ARRAY[]::uuid[]) LOOP INSERT INTO public.editorial_assertion_evidence(assertion_id,source_id,relationship,created_by) VALUES(assertion_uuid,source_uuid,'supports',actor) ON CONFLICT DO NOTHING; END LOOP;
  INSERT INTO public.editorial_decisions(decision_type,status,reason,requested_by,decided_by,previous_canonical_state,resulting_canonical_state,decided_at)
  VALUES('set_recording_version_profile','executed','Governed Recording version profile save',actor,actor,before_value,after_value,now()) RETURNING id INTO decision_uuid;
  INSERT INTO public.editorial_decision_assertions(decision_id,assertion_id,relationship) VALUES(decision_uuid,assertion_uuid,'accepted');
  INSERT INTO public.editorial_audit_events(event_type,actor_type,actor_user_id,decision_id,table_name,row_id,before_state,after_state,reason)
  VALUES('recording_version_profile.saved','human_editor',actor,decision_uuid,'recording_version_profiles',recording_uuid,before_value,after_value,'Governed Recording version profile save');
  result_value:=jsonb_build_object('recording_id',recording_uuid,'assertion_id',assertion_uuid,'decision_id',decision_uuid,'profile',after_value);
  INSERT INTO public.editorial_idempotency_keys(actor_user_id,operation,idempotency_key,result) VALUES(actor,'recording_version_profile.save',key,result_value); RETURN result_value;
END$$;

CREATE OR REPLACE FUNCTION public.clear_recording_version_profile(
  actor uuid,key uuid,recording_uuid uuid,source_ids uuid[] DEFAULT ARRAY[]::uuid[],internal_notes_value text DEFAULT NULL
) RETURNS jsonb LANGUAGE plpgsql SECURITY DEFINER SET search_path='' AS $$
DECLARE cached jsonb; before_value jsonb; assertion_uuid uuid; decision_uuid uuid; source_uuid uuid; result_value jsonb;
BEGIN
  PERFORM public.require_editorial_capability(actor,'recording.version_manage');
  PERFORM pg_advisory_xact_lock(hashtextextended(actor::text||key::text,0));
  cached:=public.editorial_idempotent_result(actor,'recording_version_profile.clear',key); IF cached IS NOT NULL THEN RETURN cached; END IF;
  PERFORM 1 FROM public.recordings WHERE id=recording_uuid FOR UPDATE; IF NOT FOUND THEN RAISE EXCEPTION 'recording not found'; END IF;
  SELECT to_jsonb(v) INTO before_value FROM public.recording_version_profiles v WHERE recording_id=recording_uuid;
  IF before_value IS NULL THEN RAISE EXCEPTION 'recording version profile not found'; END IF;
  PERFORM set_config('app.governed_recording_version_profile','on',true); DELETE FROM public.recording_version_profiles WHERE recording_id=recording_uuid; PERFORM set_config('app.governed_recording_version_profile','off',true);
  INSERT INTO public.editorial_assertions(assertion_type,predicate,asserted_value,verification_status,canonical_status,internal_notes,created_by,reviewed_by,reviewed_at)
  VALUES('recording_version_profile','recording.version_identity',jsonb_build_object('recording_id',recording_uuid,'profile',NULL),'verified','accepted',internal_notes_value,actor,actor,now()) RETURNING id INTO assertion_uuid;
  INSERT INTO public.editorial_assertion_recordings(assertion_id,recording_id) VALUES(assertion_uuid,recording_uuid);
  FOREACH source_uuid IN ARRAY coalesce(source_ids,ARRAY[]::uuid[]) LOOP INSERT INTO public.editorial_assertion_evidence(assertion_id,source_id,relationship,created_by) VALUES(assertion_uuid,source_uuid,'supports',actor) ON CONFLICT DO NOTHING; END LOOP;
  INSERT INTO public.editorial_decisions(decision_type,status,reason,requested_by,decided_by,previous_canonical_state,resulting_canonical_state,decided_at)
  VALUES('clear_recording_version_profile','executed','Governed Recording version profile clear',actor,actor,before_value,jsonb_build_object('recording_id',recording_uuid,'profile',NULL),now()) RETURNING id INTO decision_uuid;
  INSERT INTO public.editorial_decision_assertions(decision_id,assertion_id,relationship) VALUES(decision_uuid,assertion_uuid,'accepted');
  INSERT INTO public.editorial_audit_events(event_type,actor_type,actor_user_id,decision_id,table_name,row_id,before_state,after_state,reason)
  VALUES('recording_version_profile.cleared','human_editor',actor,decision_uuid,'recording_version_profiles',recording_uuid,before_value,NULL,'Governed Recording version profile clear');
  result_value:=jsonb_build_object('recording_id',recording_uuid,'assertion_id',assertion_uuid,'decision_id',decision_uuid,'cleared',true);
  INSERT INTO public.editorial_idempotency_keys(actor_user_id,operation,idempotency_key,result) VALUES(actor,'recording_version_profile.clear',key,result_value); RETURN result_value;
END$$;

REVOKE ALL ON FUNCTION public.save_recording_version_profile(uuid,uuid,uuid,text,text,text,date,text,text,uuid[],text),public.clear_recording_version_profile(uuid,uuid,uuid,uuid[],text) FROM PUBLIC,anon,authenticated;
GRANT EXECUTE ON FUNCTION public.save_recording_version_profile(uuid,uuid,uuid,text,text,text,date,text,text,uuid[],text),public.clear_recording_version_profile(uuid,uuid,uuid,uuid[],text) TO service_role;

ALTER TABLE public.recording_relationships ADD CONSTRAINT recording_relationships_type_valid CHECK(relationship_type IN('edit_of','remix_of','rerecording_of','alternate_take_of','derived_from'));
CREATE UNIQUE INDEX recording_relationships_semantic_uidx ON public.recording_relationships(recording_id,related_recording_id,relationship_type);

-- The view is the narrow public read path. Base-table access remains revoked;
-- security_barrier prevents caller predicates from being pushed beneath it.
CREATE VIEW public.recording_identity_summary WITH (security_barrier=true) AS
SELECT r.id recording_id,r.title canonical_title,r.slug,r.artist_id,a.name primary_artist_name,r.work_id,r.disambiguation disambiguation_override,
  v.performance_kind,v.derivation_kind,v.language_code,v.performance_date,v.performance_date_precision,v.performance_context,
  r.recording_year,r.duration,r.release_id representative_release_id,rr.title representative_release_title,
  first_release.release_id first_release_id,first_release.title first_release_title,first_release.release_year first_release_year,
  coalesce(stats.track_appearance_count,0) track_appearance_count,coalesce(stats.release_appearance_count,0) release_appearance_count,
  coalesce(credits.performers,'[]'::jsonb) performers,
  (v.recording_id IS NOT NULL) has_structured_version_profile,
  CASE WHEN nullif(btrim(r.disambiguation),'') IS NOT NULL THEN 'editorial_or_legacy_override' WHEN v.recording_id IS NOT NULL THEN 'structured' ELSE 'none' END descriptor_source
FROM public.recordings r JOIN public.artists a ON a.id=r.artist_id
LEFT JOIN public.recording_version_profiles v ON v.recording_id=r.id LEFT JOIN public.releases rr ON rr.id=r.release_id
LEFT JOIN LATERAL (SELECT rel.id release_id,rel.title,rel.release_year FROM public.tracks t JOIN public.releases rel ON rel.id=t.release_id WHERE t.recording_id=r.id ORDER BY rel.release_year NULLS LAST,rel.id LIMIT 1) first_release ON true
LEFT JOIN LATERAL (SELECT count(*)::int track_appearance_count,count(distinct t.release_id)::int release_appearance_count FROM public.tracks t WHERE t.recording_id=r.id) stats ON true
LEFT JOIN LATERAL (SELECT jsonb_agg(jsonb_build_object('credit_id',rc.id,'artist_id',rc.artist_id,'external_contributor_id',rc.external_contributor_id,'name',coalesce(ca.name,ec.preferred_name),'role',rc.role,'credited_as',rc.credited_as) ORDER BY rc.display_order,rc.id) performers FROM public.recording_credits rc LEFT JOIN public.artists ca ON ca.id=rc.artist_id LEFT JOIN public.external_contributors ec ON ec.id=rc.external_contributor_id WHERE rc.recording_id=r.id) credits ON true;

GRANT SELECT ON public.recording_identity_summary TO anon,authenticated,service_role;
COMMENT ON VIEW public.recording_identity_summary IS 'Reusable raw identity contract. Applications localize/format descriptors; no generated English descriptor is persisted.';

NOTIFY pgrst,'reload schema';
COMMIT;
