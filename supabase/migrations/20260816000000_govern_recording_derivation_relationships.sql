BEGIN;

CREATE OR REPLACE FUNCTION public.enforce_governed_recording_relationship()
RETURNS trigger LANGUAGE plpgsql SET search_path='' AS $$
DECLARE child_id uuid:=coalesce(NEW.recording_id,OLD.recording_id); parent_id uuid:=coalesce(NEW.related_recording_id,OLD.related_recording_id);
BEGIN
  IF TG_OP='DELETE' AND (NOT EXISTS(SELECT 1 FROM public.recordings WHERE id=child_id) OR NOT EXISTS(SELECT 1 FROM public.recordings WHERE id=parent_id)) THEN RETURN OLD; END IF;
  IF current_setting('app.governed_recording_relationship',true) IS DISTINCT FROM 'on' THEN RAISE EXCEPTION 'recording_relationships must use governed editorial workflow'; END IF;
  RETURN CASE WHEN TG_OP='DELETE' THEN OLD ELSE NEW END;
END$$;

CREATE TRIGGER recording_relationships_governed_write BEFORE INSERT OR UPDATE OR DELETE ON public.recording_relationships FOR EACH ROW EXECUTE FUNCTION public.enforce_governed_recording_relationship();
REVOKE ALL ON FUNCTION public.enforce_governed_recording_relationship() FROM PUBLIC,anon,authenticated;

CREATE OR REPLACE FUNCTION public.save_recording_derivation_relationship(actor uuid,key uuid,recording_uuid uuid,related_recording_uuid uuid,relationship_type_value text,source_ids uuid[] DEFAULT ARRAY[]::uuid[],internal_notes_value text DEFAULT NULL)
RETURNS jsonb LANGUAGE plpgsql SECURITY DEFINER SET search_path='' AS $$
DECLARE cached jsonb; relationship_uuid uuid; assertion_uuid uuid; decision_uuid uuid; source_uuid uuid; result_value jsonb;
BEGIN
  PERFORM public.require_editorial_capability(actor,'recording.version_manage');
  PERFORM pg_advisory_xact_lock(hashtextextended(actor::text||key::text,0));
  cached:=public.editorial_idempotent_result(actor,'recording_derivation_relationship.save',key); IF cached IS NOT NULL THEN RETURN cached; END IF;
  IF recording_uuid=related_recording_uuid THEN RAISE EXCEPTION 'recording relationship cannot be self-referential'; END IF;
  IF relationship_type_value NOT IN('edit_of','remix_of','rerecording_of','alternate_take_of','derived_from') THEN RAISE EXCEPTION 'unsupported recording relationship type'; END IF;
  PERFORM 1 FROM public.recordings WHERE id=recording_uuid FOR UPDATE; IF NOT FOUND THEN RAISE EXCEPTION 'recording not found'; END IF;
  PERFORM 1 FROM public.recordings WHERE id=related_recording_uuid FOR UPDATE; IF NOT FOUND THEN RAISE EXCEPTION 'related recording not found'; END IF;
  PERFORM set_config('app.governed_recording_relationship','on',true);
  INSERT INTO public.recording_relationships(recording_id,related_recording_id,relationship_type,notes)
  VALUES(recording_uuid,related_recording_uuid,relationship_type_value,nullif(btrim(internal_notes_value),''))
  ON CONFLICT(recording_id,related_recording_id,relationship_type) DO UPDATE SET notes=coalesce(public.recording_relationships.notes,EXCLUDED.notes)
  RETURNING id INTO relationship_uuid;
  PERFORM set_config('app.governed_recording_relationship','off',true);
  INSERT INTO public.editorial_assertions(assertion_type,predicate,asserted_value,verification_status,canonical_status,internal_notes,created_by,reviewed_by,reviewed_at)
  VALUES('recording_derivation_relationship','recording.derivation',jsonb_build_object('relationship_id',relationship_uuid,'recording_id',recording_uuid,'related_recording_id',related_recording_uuid,'relationship_type',relationship_type_value),'verified','accepted',internal_notes_value,actor,actor,now()) RETURNING id INTO assertion_uuid;
  INSERT INTO public.editorial_assertion_recordings(assertion_id,recording_id) VALUES(assertion_uuid,recording_uuid);
  FOREACH source_uuid IN ARRAY coalesce(source_ids,ARRAY[]::uuid[]) LOOP INSERT INTO public.editorial_assertion_evidence(assertion_id,source_id,relationship,created_by) VALUES(assertion_uuid,source_uuid,'supports',actor) ON CONFLICT DO NOTHING; END LOOP;
  INSERT INTO public.editorial_decisions(decision_type,status,reason,requested_by,decided_by,resulting_canonical_state,decided_at)
  VALUES('set_recording_derivation_relationship','executed','Governed Recording derivation relationship save',actor,actor,jsonb_build_object('relationship_id',relationship_uuid,'recording_id',recording_uuid,'related_recording_id',related_recording_uuid,'relationship_type',relationship_type_value),now()) RETURNING id INTO decision_uuid;
  INSERT INTO public.editorial_decision_assertions(decision_id,assertion_id,relationship) VALUES(decision_uuid,assertion_uuid,'accepted');
  INSERT INTO public.editorial_audit_events(event_type,actor_type,actor_user_id,decision_id,table_name,row_id,after_state,reason)
  VALUES('recording_derivation_relationship.saved','human_editor',actor,decision_uuid,'recording_relationships',relationship_uuid,jsonb_build_object('recording_id',recording_uuid,'related_recording_id',related_recording_uuid,'relationship_type',relationship_type_value),'Governed Recording derivation relationship save');
  result_value:=jsonb_build_object('relationship_id',relationship_uuid,'assertion_id',assertion_uuid,'decision_id',decision_uuid);
  INSERT INTO public.editorial_idempotency_keys(actor_user_id,operation,idempotency_key,result) VALUES(actor,'recording_derivation_relationship.save',key,result_value); RETURN result_value;
END$$;

CREATE OR REPLACE FUNCTION public.clear_recording_derivation_relationship(actor uuid,key uuid,recording_uuid uuid,related_recording_uuid uuid,relationship_type_value text,source_ids uuid[] DEFAULT ARRAY[]::uuid[],internal_notes_value text DEFAULT NULL)
RETURNS jsonb LANGUAGE plpgsql SECURITY DEFINER SET search_path='' AS $$
DECLARE cached jsonb; relationship_uuid uuid; assertion_uuid uuid; decision_uuid uuid; source_uuid uuid; before_value jsonb; result_value jsonb;
BEGIN
  PERFORM public.require_editorial_capability(actor,'recording.version_manage'); PERFORM pg_advisory_xact_lock(hashtextextended(actor::text||key::text,0));
  cached:=public.editorial_idempotent_result(actor,'recording_derivation_relationship.clear',key); IF cached IS NOT NULL THEN RETURN cached; END IF;
  SELECT id,to_jsonb(r) INTO relationship_uuid,before_value FROM public.recording_relationships r WHERE recording_id=recording_uuid AND related_recording_id=related_recording_uuid AND relationship_type=relationship_type_value FOR UPDATE;
  IF relationship_uuid IS NULL THEN RAISE EXCEPTION 'recording relationship not found'; END IF;
  PERFORM set_config('app.governed_recording_relationship','on',true); DELETE FROM public.recording_relationships WHERE id=relationship_uuid; PERFORM set_config('app.governed_recording_relationship','off',true);
  INSERT INTO public.editorial_assertions(assertion_type,predicate,asserted_value,verification_status,canonical_status,internal_notes,created_by,reviewed_by,reviewed_at) VALUES('recording_derivation_relationship','recording.derivation',jsonb_build_object('relationship_id',relationship_uuid,'cleared',true),'verified','accepted',internal_notes_value,actor,actor,now()) RETURNING id INTO assertion_uuid;
  INSERT INTO public.editorial_assertion_recordings VALUES(assertion_uuid,recording_uuid);
  FOREACH source_uuid IN ARRAY coalesce(source_ids,ARRAY[]::uuid[]) LOOP INSERT INTO public.editorial_assertion_evidence(assertion_id,source_id,relationship,created_by) VALUES(assertion_uuid,source_uuid,'supports',actor) ON CONFLICT DO NOTHING; END LOOP;
  INSERT INTO public.editorial_decisions(decision_type,status,reason,requested_by,decided_by,previous_canonical_state,resulting_canonical_state,decided_at) VALUES('clear_recording_derivation_relationship','executed','Governed Recording derivation relationship clear',actor,actor,before_value,jsonb_build_object('relationship_id',relationship_uuid,'cleared',true),now()) RETURNING id INTO decision_uuid;
  INSERT INTO public.editorial_decision_assertions VALUES(decision_uuid,assertion_uuid,'accepted');
  INSERT INTO public.editorial_audit_events(event_type,actor_type,actor_user_id,decision_id,table_name,row_id,before_state,reason) VALUES('recording_derivation_relationship.cleared','human_editor',actor,decision_uuid,'recording_relationships',relationship_uuid,before_value,'Governed Recording derivation relationship clear');
  result_value:=jsonb_build_object('relationship_id',relationship_uuid,'assertion_id',assertion_uuid,'decision_id',decision_uuid,'cleared',true); INSERT INTO public.editorial_idempotency_keys VALUES(actor,'recording_derivation_relationship.clear',key,result_value,now()); RETURN result_value;
END$$;

REVOKE ALL ON FUNCTION public.save_recording_derivation_relationship(uuid,uuid,uuid,uuid,text,uuid[],text),public.clear_recording_derivation_relationship(uuid,uuid,uuid,uuid,text,uuid[],text) FROM PUBLIC,anon,authenticated;
GRANT EXECUTE ON FUNCTION public.save_recording_derivation_relationship(uuid,uuid,uuid,uuid,text,uuid[],text),public.clear_recording_derivation_relationship(uuid,uuid,uuid,uuid,text,uuid[],text) TO service_role;
NOTIFY pgrst,'reload schema';
COMMIT;
