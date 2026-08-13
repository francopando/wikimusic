BEGIN;

CREATE OR REPLACE FUNCTION public.record_recording_identity_review(
  actor uuid,
  key uuid,
  candidate_key_value text,
  candidate_type_value text,
  title_value text,
  recording_ids uuid[],
  decision_value text,
  reason_value text,
  source_ids uuid[] DEFAULT ARRAY[]::uuid[]
) RETURNS jsonb LANGUAGE plpgsql SECURITY DEFINER SET search_path='' AS $$
DECLARE cached jsonb; case_uuid uuid; decision_uuid uuid; assertion_uuid uuid; recording_uuid uuid; source_uuid uuid; result_value jsonb; case_status text; decision_status text;
BEGIN
  PERFORM public.require_editorial_capability(actor,'conflict.review');
  IF candidate_type_value NOT IN ('probable_duplicate_recording','different_recordings_shared_isrc','insufficient_evidence') THEN RAISE EXCEPTION 'invalid candidate type'; END IF;
  IF decision_value NOT IN ('keep_separate','needs_research','request_merge_review','request_split_review','unable_to_determine') THEN RAISE EXCEPTION 'invalid review decision'; END IF;
  IF cardinality(recording_ids)<2 OR nullif(btrim(reason_value),'') IS NULL OR nullif(btrim(candidate_key_value),'') IS NULL THEN RAISE EXCEPTION 'candidate, recordings, and reason are required'; END IF;
  PERFORM pg_advisory_xact_lock(hashtextextended(actor::text||key::text,0));
  cached:=public.editorial_idempotent_result(actor,'recording_identity.review',key); IF cached IS NOT NULL THEN RETURN cached; END IF;
  SELECT id INTO case_uuid FROM public.editorial_cases WHERE case_type='recording_identity_review' AND metadata->>'candidate_key'=candidate_key_value ORDER BY opened_at DESC LIMIT 1 FOR UPDATE;
  case_status:=CASE WHEN decision_value='keep_separate' THEN 'resolved' WHEN decision_value IN('request_merge_review','request_split_review') THEN 'triage' ELSE 'under_review' END;
  IF case_uuid IS NULL THEN
    INSERT INTO public.editorial_cases(case_type,status,title,summary,opened_by,resolved_by,resolution,resolved_at,metadata)
    VALUES('recording_identity_review',case_status,btrim(title_value),btrim(reason_value),actor,CASE WHEN case_status='resolved' THEN actor END,CASE WHEN case_status='resolved' THEN decision_value END,CASE WHEN case_status='resolved' THEN now() END,jsonb_build_object('candidate_key',candidate_key_value,'candidate_type',candidate_type_value)) RETURNING id INTO case_uuid;
  ELSE
    UPDATE public.editorial_cases SET status=case_status,summary=btrim(reason_value),resolved_by=CASE WHEN case_status='resolved' THEN actor ELSE NULL END,resolution=CASE WHEN case_status='resolved' THEN decision_value ELSE NULL END,resolved_at=CASE WHEN case_status='resolved' THEN now() ELSE NULL END WHERE id=case_uuid;
  END IF;
  FOREACH recording_uuid IN ARRAY recording_ids LOOP
    INSERT INTO public.editorial_case_recordings(case_id,recording_id) VALUES(case_uuid,recording_uuid) ON CONFLICT DO NOTHING;
    INSERT INTO public.editorial_assertions(assertion_type,predicate,asserted_value,verification_status,canonical_status,internal_notes,created_by)
    VALUES('recording_identity_review','recording.identity_assessment',jsonb_build_object('case_id',case_uuid,'recording_id',recording_uuid,'candidate_type',candidate_type_value,'decision',decision_value),'under_review','unresolved',btrim(reason_value),actor) RETURNING id INTO assertion_uuid;
    INSERT INTO public.editorial_assertion_recordings VALUES(assertion_uuid,recording_uuid);
    INSERT INTO public.editorial_case_assertions VALUES(case_uuid,assertion_uuid);
    FOREACH source_uuid IN ARRAY coalesce(source_ids,ARRAY[]::uuid[]) LOOP INSERT INTO public.editorial_assertion_evidence(assertion_id,source_id,relationship,created_by) VALUES(assertion_uuid,source_uuid,'supports',actor) ON CONFLICT DO NOTHING; END LOOP;
  END LOOP;
  decision_status:=CASE WHEN decision_value IN('request_merge_review','request_split_review') THEN 'requested' ELSE 'executed' END;
  INSERT INTO public.editorial_decisions(decision_type,status,reason,requested_by,decided_by,requires_independent_approval,resulting_canonical_state,metadata,decided_at)
  VALUES('recording_identity_review',decision_status,btrim(reason_value),actor,CASE WHEN decision_status='executed' THEN actor END,false,jsonb_build_object('case_id',case_uuid,'decision',decision_value,'recording_ids',recording_ids),jsonb_build_object('candidate_key',candidate_key_value,'candidate_type',candidate_type_value,'non_mutating',true),CASE WHEN decision_status='executed' THEN now() END) RETURNING id INTO decision_uuid;
  INSERT INTO public.editorial_decision_assertions(decision_id,assertion_id,relationship) SELECT decision_uuid,assertion_id,'considered' FROM public.editorial_case_assertions WHERE case_id=case_uuid ON CONFLICT DO NOTHING;
  INSERT INTO public.editorial_audit_events(event_type,actor_type,actor_user_id,decision_id,table_name,row_id,after_state,reason) VALUES('recording_identity.review_recorded','human_editor',actor,decision_uuid,'editorial_cases',case_uuid,jsonb_build_object('decision',decision_value,'recording_ids',recording_ids),'Non-mutating Recording identity review');
  result_value:=jsonb_build_object('case_id',case_uuid,'decision_id',decision_uuid,'status',case_status,'decision',decision_value);
  INSERT INTO public.editorial_idempotency_keys VALUES(actor,'recording_identity.review',key,result_value,now()); RETURN result_value;
END$$;

REVOKE ALL ON FUNCTION public.record_recording_identity_review(uuid,uuid,text,text,text,uuid[],text,text,uuid[]) FROM PUBLIC,anon,authenticated;
GRANT EXECUTE ON FUNCTION public.record_recording_identity_review(uuid,uuid,text,text,text,uuid[],text,text,uuid[]) TO service_role;
COMMENT ON FUNCTION public.record_recording_identity_review(uuid,uuid,text,text,text,uuid[],text,text,uuid[]) IS 'Records a non-mutating Recording identity review using existing cases, assertions, evidence, decisions, audit, and idempotency.';

COMMIT;
