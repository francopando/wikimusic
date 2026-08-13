BEGIN;

CREATE TABLE public.instruments (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  code text NOT NULL UNIQUE CHECK (code ~ '^[a-z][a-z0-9_]*$'),
  display_name_en text NOT NULL CHECK (btrim(display_name_en) <> ''),
  display_name_es text NOT NULL CHECK (btrim(display_name_es) <> ''),
  status text NOT NULL DEFAULT 'active' CHECK (status IN ('active','deprecated')),
  metadata jsonb NOT NULL DEFAULT '{}'::jsonb CHECK (jsonb_typeof(metadata)='object'),
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

INSERT INTO public.instruments(code,display_name_en,display_name_es)
VALUES ('piano','Piano','Piano');

CREATE TABLE public.recording_credit_instruments (
  recording_credit_id uuid NOT NULL REFERENCES public.recording_credits(id) ON DELETE CASCADE,
  instrument_id uuid NOT NULL REFERENCES public.instruments(id) ON DELETE RESTRICT,
  sequence integer NOT NULL DEFAULT 0 CHECK(sequence>=0),
  created_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY(recording_credit_id,instrument_id)
);
CREATE INDEX recording_credit_instruments_instrument_idx ON public.recording_credit_instruments(instrument_id,recording_credit_id);

CREATE UNIQUE INDEX recording_credits_artist_role_semantic_uidx
ON public.recording_credits(recording_id,artist_id,role_id)
WHERE artist_id IS NOT NULL AND role_id IS NOT NULL;
CREATE UNIQUE INDEX recording_credits_external_role_semantic_uidx
ON public.recording_credits(recording_id,external_contributor_id,role_id)
WHERE external_contributor_id IS NOT NULL AND role_id IS NOT NULL;

CREATE OR REPLACE FUNCTION public.save_editorial_recording_credit(
  actor uuid,key uuid,recording_uuid uuid,credit_uuid uuid,artist_uuid uuid,external_uuid uuid,
  role_uuid uuid,credited_as_value text DEFAULT NULL,detail_value text DEFAULT NULL,
  display_order_value integer DEFAULT 0,instrument_ids uuid[] DEFAULT ARRAY[]::uuid[],
  source_ids uuid[] DEFAULT ARRAY[]::uuid[],internal_notes_value text DEFAULT NULL
) RETURNS jsonb LANGUAGE plpgsql SECURITY DEFINER SET search_path='' AS $$
DECLARE cached jsonb; role_code text; role_family_value text; assertion_uuid uuid; decision_uuid uuid;
 source_uuid uuid; instrument_uuid uuid; result_value jsonb; before_value jsonb; is_new boolean:=credit_uuid IS NULL;
BEGIN
 PERFORM public.require_editorial_capability(actor,'credit.create');
 PERFORM pg_advisory_xact_lock(hashtextextended(actor::text||key::text,0));
 cached:=public.editorial_idempotent_result(actor,'recording_credit.save',key); IF cached IS NOT NULL THEN RETURN cached; END IF;
 IF num_nonnulls(artist_uuid,external_uuid)<>1 THEN RAISE EXCEPTION 'exactly one contributor identity is required'; END IF;
 IF display_order_value IS NULL OR display_order_value<0 THEN RAISE EXCEPTION 'display order must be nonnegative'; END IF;
 PERFORM 1 FROM public.recordings WHERE id=recording_uuid; IF NOT FOUND THEN RAISE EXCEPTION 'recording not found'; END IF;
 SELECT r.code,r.role_family INTO role_code,role_family_value FROM public.credit_roles r JOIN public.credit_role_scopes s ON s.role_id=r.id AND s.scope='recording' WHERE r.id=role_uuid AND r.status='active';
 IF NOT FOUND THEN RAISE EXCEPTION 'role is not allowed at Recording scope'; END IF;
 IF is_new AND role_code='pianist' THEN RAISE EXCEPTION 'new pianist credits use instrumentalist plus the piano instrument'; END IF;
 IF coalesce(cardinality(instrument_ids),0)>0 AND role_code<>'instrumentalist' THEN RAISE EXCEPTION 'instrument relationships require the instrumentalist role'; END IF;
 IF artist_uuid IS NOT NULL THEN PERFORM 1 FROM public.artists WHERE id=artist_uuid; ELSE PERFORM 1 FROM public.external_contributors WHERE id=external_uuid AND status<>'archived'; END IF;
 IF NOT FOUND THEN RAISE EXCEPTION 'contributor identity unavailable'; END IF;
 FOREACH instrument_uuid IN ARRAY coalesce(instrument_ids,ARRAY[]::uuid[]) LOOP PERFORM 1 FROM public.instruments WHERE id=instrument_uuid AND status='active'; IF NOT FOUND THEN RAISE EXCEPTION 'instrument unavailable'; END IF; END LOOP;
 PERFORM set_config('app.governed_recording_credit','on',true);
 IF is_new THEN
  INSERT INTO public.recording_credits(recording_id,artist_id,external_contributor_id,role,role_id,credited_as,display_order,position,metadata)
  VALUES(recording_uuid,artist_uuid,external_uuid,role_code,role_uuid,nullif(btrim(credited_as_value),''),display_order_value,display_order_value,
    CASE WHEN nullif(btrim(detail_value),'') IS NULL THEN '{}'::jsonb ELSE jsonb_build_object('credit_detail',btrim(detail_value)) END)
  RETURNING id INTO credit_uuid;
 ELSE
  SELECT to_jsonb(c) INTO before_value FROM public.recording_credits c WHERE c.id=credit_uuid AND c.recording_id=recording_uuid FOR UPDATE;
  IF NOT FOUND THEN RAISE EXCEPTION 'recording credit not found'; END IF;
  UPDATE public.recording_credits SET artist_id=artist_uuid,external_contributor_id=external_uuid,role=role_code,role_id=role_uuid,
    credited_as=nullif(btrim(credited_as_value),''),display_order=display_order_value,position=display_order_value,
    metadata=(coalesce(metadata,'{}'::jsonb)-'credit_detail')||CASE WHEN nullif(btrim(detail_value),'') IS NULL THEN '{}'::jsonb ELSE jsonb_build_object('credit_detail',btrim(detail_value)) END
  WHERE id=credit_uuid;
  DELETE FROM public.recording_credit_instruments WHERE recording_credit_id=credit_uuid;
 END IF;
 FOREACH instrument_uuid IN ARRAY coalesce(instrument_ids,ARRAY[]::uuid[]) LOOP INSERT INTO public.recording_credit_instruments(recording_credit_id,instrument_id,sequence) VALUES(credit_uuid,instrument_uuid,array_position(instrument_ids,instrument_uuid)-1); END LOOP;
 PERFORM set_config('app.governed_recording_credit','off',true);
 INSERT INTO public.editorial_assertions(assertion_type,predicate,asserted_value,verification_status,canonical_status,internal_notes,created_by)
 VALUES('recording_credit','recording.credit',jsonb_build_object('recording_credit_id',credit_uuid,'recording_id',recording_uuid,'artist_id',artist_uuid,'external_contributor_id',external_uuid,'role_id',role_uuid,'credited_as',credited_as_value,'instrument_ids',instrument_ids),'unverified','unresolved',internal_notes_value,actor) RETURNING id INTO assertion_uuid;
 INSERT INTO public.editorial_assertion_recording_credits(assertion_id,recording_credit_id) VALUES(assertion_uuid,credit_uuid);
 FOREACH source_uuid IN ARRAY coalesce(source_ids,ARRAY[]::uuid[]) LOOP INSERT INTO public.editorial_assertion_evidence(assertion_id,source_id,relationship,created_by) VALUES(assertion_uuid,source_uuid,'supports',actor) ON CONFLICT DO NOTHING; END LOOP;
 INSERT INTO public.editorial_decisions(decision_type,status,reason,requested_by,decided_by,resulting_canonical_state,decided_at)
 VALUES(CASE WHEN is_new THEN 'create_recording_credit' ELSE 'update_recording_credit' END,'executed','Governed Recording Credit save',actor,actor,jsonb_build_object('recording_credit_id',credit_uuid,'assertion_id',assertion_uuid),now()) RETURNING id INTO decision_uuid;
 INSERT INTO public.editorial_decision_assertions(decision_id,assertion_id,relationship) VALUES(decision_uuid,assertion_uuid,'considered');
 INSERT INTO public.editorial_audit_events(event_type,actor_type,actor_user_id,decision_id,table_name,row_id,before_state,after_state,reason)
 SELECT CASE WHEN is_new THEN 'recording_credit.created' ELSE 'recording_credit.updated' END,'human_editor',actor,decision_uuid,'recording_credits',credit_uuid,before_value,to_jsonb(c),'Governed Recording Credit save' FROM public.recording_credits c WHERE c.id=credit_uuid;
 result_value:=jsonb_build_object('recording_credit_id',credit_uuid,'assertion_id',assertion_uuid,'decision_id',decision_uuid);
 INSERT INTO public.editorial_idempotency_keys VALUES(actor,'recording_credit.save',key,result_value,now()); RETURN result_value;
END$$;

ALTER TABLE public.instruments ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.recording_credit_instruments ENABLE ROW LEVEL SECURITY;
REVOKE ALL ON public.instruments,public.recording_credit_instruments FROM PUBLIC,anon,authenticated;
GRANT ALL ON public.instruments,public.recording_credit_instruments TO service_role;
REVOKE ALL ON FUNCTION public.save_editorial_recording_credit(uuid,uuid,uuid,uuid,uuid,uuid,uuid,text,text,integer,uuid[],uuid[],text) FROM PUBLIC,anon,authenticated;
GRANT EXECUTE ON FUNCTION public.save_editorial_recording_credit(uuid,uuid,uuid,uuid,uuid,uuid,uuid,text,text,integer,uuid[],uuid[],text) TO service_role;

COMMENT ON TABLE public.instruments IS 'Controlled instrument identities. Seed narrowly as editorial requirements are evidenced; not a role vocabulary.';
COMMENT ON TABLE public.recording_credit_instruments IS 'Many-to-many instruments performed within one canonical Recording Credit; supports multi-instrument contributions without role proliferation.';
NOTIFY pgrst,'reload schema';
COMMIT;
