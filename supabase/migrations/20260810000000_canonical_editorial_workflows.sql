BEGIN;

CREATE TABLE public.credit_roles (
 id uuid PRIMARY KEY DEFAULT gen_random_uuid(), code text NOT NULL UNIQUE,
 display_name_en text NOT NULL, display_name_es text NOT NULL, description text NOT NULL,
 role_family text NOT NULL, normal_scope text NOT NULL, status text NOT NULL DEFAULT 'active',
 display_order integer NOT NULL DEFAULT 0, metadata jsonb NOT NULL DEFAULT '{}'::jsonb,
 created_at timestamptz NOT NULL DEFAULT now(), updated_at timestamptz NOT NULL DEFAULT now(),
 CONSTRAINT credit_roles_code_valid CHECK(code ~ '^[a-z][a-z0-9_]*$'),
 CONSTRAINT credit_roles_family_valid CHECK(role_family IN ('composition','performance','production','arrangement','engineering','direction')),
 CONSTRAINT credit_roles_scope_valid CHECK(normal_scope IN ('work','recording','release','track')),
 CONSTRAINT credit_roles_status_valid CHECK(status IN ('active','deprecated')),
 CONSTRAINT credit_roles_metadata_object CHECK(jsonb_typeof(metadata)='object')
);
CREATE TABLE public.credit_role_scopes (
 role_id uuid REFERENCES public.credit_roles(id) ON DELETE CASCADE,
 scope text NOT NULL CHECK(scope IN ('work','recording','release','track')),
 PRIMARY KEY(role_id,scope)
);
CREATE TABLE public.credit_role_aliases (
 id uuid PRIMARY KEY DEFAULT gen_random_uuid(), role_id uuid NOT NULL REFERENCES public.credit_roles(id) ON DELETE RESTRICT,
 alias text NOT NULL, mapping_status text NOT NULL DEFAULT 'deterministic', notes text,
 created_at timestamptz NOT NULL DEFAULT now(),
 CONSTRAINT credit_role_aliases_nonempty CHECK(btrim(alias)<>''),
 CONSTRAINT credit_role_aliases_status CHECK(mapping_status IN ('deterministic','ambiguous','obsolete','needs_editorial_review'))
);
CREATE UNIQUE INDEX credit_role_aliases_normalized_uidx ON public.credit_role_aliases(lower(btrim(alias)));

INSERT INTO public.credit_roles(code,display_name_en,display_name_es,description,role_family,normal_scope,display_order) VALUES
('composer','Composer','Compositor','Creates the musical composition.','composition','work',10),
('songwriter','Songwriter','Autor de canciones','Creates music and/or lyrics as a songwriting contribution.','composition','work',20),
('lyricist','Lyricist','Letrista','Writes lyrics.','composition','work',30),
('arranger','Arranger','Arreglista','Creates or adapts an arrangement; evidence determines Work or Recording scope.','arrangement','recording',40),
('lead_performer','Lead performer','Intérprete principal','Principal featured performance on a Recording.','performance','recording',50),
('featured_performer','Featured performer','Intérprete invitado','Explicitly featured performance on a Recording.','performance','recording',60),
('performer','Performer','Intérprete','General performance contribution to a Recording.','performance','recording',70),
('instrumentalist','Instrumentalist','Instrumentista','Instrumental performance when the instrument is not canonically specified.','performance','recording',80),
('pianist','Pianist','Pianista','Piano performance on a Recording.','performance','recording',81),
('producer','Producer','Productor','Creative and technical production of a Recording or Release.','production','recording',90),
('co_producer','Co-producer','Coproductor','Shared production credit explicitly billed as co-producer.','production','recording',91),
('executive_producer','Executive producer','Productor ejecutivo','Executive oversight or financing credit, normally Release-scoped.','production','release',92),
('beat_programmer','Beat programmer','Programador de ritmos','Programs rhythmic or beat elements for a Recording.','production','recording',100),
('recording_engineer','Recording engineer','Ingeniero de grabación','Engineering responsibility for recording.','engineering','recording',110),
('mixing_engineer','Mixing engineer','Ingeniero de mezcla','Engineering responsibility for mixing.','engineering','recording',120),
('mastering_engineer','Mastering engineer','Ingeniero de masterización','Engineering responsibility for mastering.','engineering','recording',130),
('conductor','Conductor','Director de orquesta','Conducts performers for a Recording.','direction','recording',140),
('musical_director','Musical director','Director musical','Provides musical direction; evidence determines Recording or Release scope.','direction','recording',150);

INSERT INTO public.credit_role_scopes(role_id,scope)
SELECT id,normal_scope FROM public.credit_roles;
INSERT INTO public.credit_role_scopes(role_id,scope) SELECT id,'work' FROM public.credit_roles WHERE code='arranger';
INSERT INTO public.credit_role_scopes(role_id,scope) SELECT id,'release' FROM public.credit_roles WHERE code IN ('producer','musical_director');

INSERT INTO public.credit_role_aliases(role_id,alias,mapping_status,notes)
SELECT r.id,v.alias,v.status,v.notes FROM (VALUES
 ('composer','composer','deterministic',null),('composer','Composer','deterministic',null),
 ('lead_performer','lead_performer','deterministic',null),('performer','performer','deterministic',null),('performer','Performer','deterministic',null),
 ('pianist','piano','deterministic','Instrument-specific historical role.'),('producer','producer','deterministic',null),('producer','Producer','deterministic',null),
 ('arranger','arranger','deterministic',null),('arranger','Arranger','deterministic',null),
 ('beat_programmer','Beat Programmer','deterministic',null),('co_producer','Co-Producer','deterministic',null),
 ('executive_producer','Executive Producer','deterministic',null),('lyricist','Lyricist','deterministic',null),
 ('mastering_engineer','Mastering Engineer','deterministic',null),('mixing_engineer','Mix Engineer','deterministic',null)
) v(code,alias,status,notes) JOIN public.credit_roles r ON r.code=v.code
ON CONFLICT (lower(btrim(alias))) DO NOTHING;

ALTER TABLE public.work_credits ADD COLUMN role_id uuid REFERENCES public.credit_roles(id) ON DELETE RESTRICT;
ALTER TABLE public.recording_credits ADD COLUMN role_id uuid REFERENCES public.credit_roles(id) ON DELETE RESTRICT;
ALTER TABLE public.credited_work_credits ADD COLUMN role_id uuid REFERENCES public.credit_roles(id) ON DELETE RESTRICT;
ALTER TABLE public.credited_works ADD COLUMN work_id uuid REFERENCES public.works(id) ON DELETE RESTRICT;
ALTER TABLE public.credited_works ADD COLUMN recording_id uuid REFERENCES public.recordings(id) ON DELETE RESTRICT;
ALTER TABLE public.credited_works ADD CONSTRAINT credited_works_authoritative_target_exclusive CHECK(num_nonnulls(work_id,recording_id)<=1);
CREATE UNIQUE INDEX work_credits_role_id_semantic_uidx ON public.work_credits(work_id,artist_id,role_id) WHERE role_id IS NOT NULL;
CREATE INDEX recording_credits_role_id_idx ON public.recording_credits(role_id);
CREATE INDEX credited_work_credits_role_id_idx ON public.credited_work_credits(role_id);
CREATE INDEX credited_works_work_id_idx ON public.credited_works(work_id) WHERE work_id IS NOT NULL;
CREATE INDEX credited_works_recording_id_idx ON public.credited_works(recording_id) WHERE recording_id IS NOT NULL;

CREATE TABLE public.editorial_idempotency_keys (
 actor_user_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE RESTRICT,
 operation text NOT NULL, idempotency_key uuid NOT NULL, result jsonb NOT NULL,
 created_at timestamptz NOT NULL DEFAULT now(), PRIMARY KEY(actor_user_id,operation,idempotency_key),
 CONSTRAINT editorial_idempotency_result_object CHECK(jsonb_typeof(result)='object')
);

CREATE OR REPLACE FUNCTION public.user_has_editorial_capability(actor uuid, requested_capability text)
RETURNS boolean LANGUAGE sql STABLE SECURITY DEFINER SET search_path='' AS $$
 SELECT EXISTS(SELECT 1 FROM public.admin_members m JOIN public.editorial_role_capabilities rc ON rc.role=m.role
 WHERE m.user_id=actor AND m.status='active' AND rc.capability=requested_capability);
$$;

CREATE OR REPLACE FUNCTION public.require_editorial_capability(actor uuid, requested_capability text)
RETURNS void LANGUAGE plpgsql STABLE SECURITY DEFINER SET search_path='' AS $$
BEGIN IF actor IS NULL OR NOT public.user_has_editorial_capability(actor,requested_capability) THEN RAISE EXCEPTION 'missing editorial capability: %',requested_capability USING ERRCODE='42501'; END IF; END; $$;

CREATE OR REPLACE FUNCTION public.editorial_idempotent_result(actor uuid,operation_name text,key uuid)
RETURNS jsonb LANGUAGE sql STABLE SECURITY DEFINER SET search_path='' AS $$
 SELECT result FROM public.editorial_idempotency_keys WHERE actor_user_id=actor AND operation=operation_name AND idempotency_key=key;
$$;

CREATE OR REPLACE FUNCTION public.create_editorial_source(actor uuid,key uuid,source_type_value text,title_value text,visibility_value text DEFAULT 'internal',url_value text DEFAULT NULL,archive_value text DEFAULT NULL,citation_value text DEFAULT NULL,rights_value text DEFAULT NULL,internal_notes_value text DEFAULT NULL)
RETURNS jsonb LANGUAGE plpgsql SECURITY DEFINER SET search_path='' AS $$
DECLARE cached jsonb; source_uuid uuid; result_value jsonb;
BEGIN
 PERFORM public.require_editorial_capability(actor,'source.create'); PERFORM pg_advisory_xact_lock(hashtextextended(actor::text||key::text,0));
 cached:=public.editorial_idempotent_result(actor,'source.create',key); IF cached IS NOT NULL THEN RETURN cached; END IF;
 INSERT INTO public.editorial_sources(source_type,title,visibility,url,archive_reference,citation_text,rights_notes,internal_notes,created_by)
 VALUES(btrim(source_type_value),btrim(title_value),visibility_value,nullif(btrim(url_value),''),nullif(btrim(archive_value),''),nullif(btrim(citation_value),''),nullif(btrim(rights_value),''),nullif(btrim(internal_notes_value),''),actor) RETURNING id INTO source_uuid;
 result_value:=jsonb_build_object('source_id',source_uuid); INSERT INTO public.editorial_idempotency_keys VALUES(actor,'source.create',key,result_value,now()); RETURN result_value;
END; $$;

CREATE OR REPLACE FUNCTION public.create_editorial_work(actor uuid,key uuid,title_value text,language_value text DEFAULT NULL,composition_year_value integer DEFAULT NULL,publication_year_value integer DEFAULT NULL,source_ids uuid[] DEFAULT ARRAY[]::uuid[],internal_notes_value text DEFAULT NULL)
RETURNS jsonb LANGUAGE plpgsql SECURITY DEFINER SET search_path='' AS $$
DECLARE cached jsonb; work_uuid uuid; assertion_uuid uuid; decision_uuid uuid; source_uuid uuid; result_value jsonb;
BEGIN
 PERFORM public.require_editorial_capability(actor,'work.create'); PERFORM pg_advisory_xact_lock(hashtextextended(actor::text||key::text,0));
 cached:=public.editorial_idempotent_result(actor,'work.create',key); IF cached IS NOT NULL THEN RETURN cached; END IF;
 IF btrim(coalesce(title_value,''))='' THEN RAISE EXCEPTION 'preferred title is required'; END IF;
 INSERT INTO public.works(preferred_title,language,composition_year,publication_year,status,editorial_notes) VALUES(btrim(title_value),nullif(btrim(language_value),''),composition_year_value,publication_year_value,'draft',internal_notes_value) RETURNING id INTO work_uuid;
 INSERT INTO public.editorial_assertions(assertion_type,predicate,asserted_value,verification_status,canonical_status,internal_notes,created_by,reviewed_by,reviewed_at)
 VALUES('work_identity','work.exists',jsonb_build_object('work_id',work_uuid,'preferred_title',btrim(title_value)),'verified','accepted',internal_notes_value,actor,actor,now()) RETURNING id INTO assertion_uuid;
 INSERT INTO public.editorial_assertion_works VALUES(assertion_uuid,work_uuid);
 FOREACH source_uuid IN ARRAY coalesce(source_ids,ARRAY[]::uuid[]) LOOP INSERT INTO public.editorial_assertion_evidence(assertion_id,source_id,relationship,created_by) VALUES(assertion_uuid,source_uuid,'supports',actor) ON CONFLICT DO NOTHING; END LOOP;
 INSERT INTO public.editorial_decisions(decision_type,status,reason,requested_by,decided_by,previous_canonical_state,resulting_canonical_state,requested_at,decided_at)
 VALUES('create_work','executed','Create authoritative Work in draft state',actor,actor,'{}',jsonb_build_object('work_id',work_uuid),now(),now()) RETURNING id INTO decision_uuid;
 INSERT INTO public.editorial_decision_assertions VALUES(decision_uuid,assertion_uuid,'accepted');
 INSERT INTO public.editorial_audit_events(event_type,actor_type,actor_user_id,decision_id,table_name,row_id,after_state,reason) VALUES('work.created','human_editor',actor,decision_uuid,'works',work_uuid,jsonb_build_object('status','draft','preferred_title',btrim(title_value)),'Governed Work creation');
 result_value:=jsonb_build_object('work_id',work_uuid,'assertion_id',assertion_uuid,'decision_id',decision_uuid,'possible_title_matches',(SELECT count(*)-1 FROM public.works WHERE lower(preferred_title)=lower(btrim(title_value))));
 INSERT INTO public.editorial_idempotency_keys VALUES(actor,'work.create',key,result_value,now()); RETURN result_value;
END; $$;

CREATE OR REPLACE FUNCTION public.create_recording_work_assertion(actor uuid,key uuid,recording_uuid uuid,work_uuid uuid,source_ids uuid[] DEFAULT ARRAY[]::uuid[],internal_notes_value text DEFAULT NULL)
RETURNS jsonb LANGUAGE plpgsql SECURITY DEFINER SET search_path='' AS $$
DECLARE cached jsonb; assertion_uuid uuid; source_uuid uuid; result_value jsonb;
BEGIN
 PERFORM public.require_editorial_capability(actor,'assertion.create'); PERFORM pg_advisory_xact_lock(hashtextextended(actor::text||key::text,0));
 cached:=public.editorial_idempotent_result(actor,'recording_work.assert',key); IF cached IS NOT NULL THEN RETURN cached; END IF;
 PERFORM 1 FROM public.recordings WHERE id=recording_uuid; IF NOT FOUND THEN RAISE EXCEPTION 'recording not found'; END IF;
 PERFORM 1 FROM public.works WHERE id=work_uuid; IF NOT FOUND THEN RAISE EXCEPTION 'work not found'; END IF;
 INSERT INTO public.editorial_assertions(assertion_type,predicate,asserted_value,verification_status,canonical_status,internal_notes,created_by)
 VALUES('recording_work_relationship','recording.work_id',jsonb_build_object('recording_id',recording_uuid,'work_id',work_uuid),'under_review','unresolved',internal_notes_value,actor) RETURNING id INTO assertion_uuid;
 INSERT INTO public.editorial_assertion_recording_work_targets VALUES(assertion_uuid,recording_uuid,work_uuid);
 FOREACH source_uuid IN ARRAY coalesce(source_ids,ARRAY[]::uuid[]) LOOP INSERT INTO public.editorial_assertion_evidence VALUES(assertion_uuid,source_uuid,'supports',NULL,NULL,actor,now()) ON CONFLICT DO NOTHING; END LOOP;
 result_value:=jsonb_build_object('assertion_id',assertion_uuid); INSERT INTO public.editorial_idempotency_keys VALUES(actor,'recording_work.assert',key,result_value,now()); RETURN result_value;
END; $$;

CREATE OR REPLACE FUNCTION public.select_recording_work_assertion(actor uuid,key uuid,assertion_uuid uuid,reason_value text)
RETURNS jsonb LANGUAGE plpgsql SECURITY DEFINER SET search_path='' AS $$
DECLARE cached jsonb; target record; current_work uuid; decision_uuid uuid; result_value jsonb;
BEGIN
 PERFORM public.require_editorial_capability(actor,'work.link_recording'); PERFORM pg_advisory_xact_lock(hashtextextended(actor::text||key::text,0));
 cached:=public.editorial_idempotent_result(actor,'recording_work.select',key); IF cached IS NOT NULL THEN RETURN cached; END IF;
 SELECT t.recording_id,t.work_id,a.verification_status INTO target FROM public.editorial_assertion_recording_work_targets t JOIN public.editorial_assertions a ON a.id=t.assertion_id WHERE t.assertion_id=assertion_uuid FOR UPDATE OF a;
 IF NOT FOUND THEN RAISE EXCEPTION 'typed Recording to Work assertion not found'; END IF;
 SELECT work_id INTO current_work FROM public.recordings WHERE id=target.recording_id FOR UPDATE;
 IF current_work IS NOT NULL AND current_work<>target.work_id THEN
   INSERT INTO public.editorial_decisions(decision_type,status,reason,requested_by,requires_independent_approval,previous_canonical_state,resulting_canonical_state)
   VALUES('change_recording_work','requested',btrim(reason_value),actor,true,jsonb_build_object('recording_id',target.recording_id,'work_id',current_work),jsonb_build_object('recording_id',target.recording_id,'work_id',target.work_id)) RETURNING id INTO decision_uuid;
   INSERT INTO public.editorial_decision_assertions VALUES(decision_uuid,assertion_uuid,'considered'); result_value:=jsonb_build_object('status','approval_required','decision_id',decision_uuid,'assertion_id',assertion_uuid);
 ELSE
   PERFORM set_config('app.governed_work_link','on',true); PERFORM set_config('app.editorial_reason',btrim(reason_value),true);
   UPDATE public.editorial_assertions SET verification_status='verified',canonical_status='accepted',reviewed_by=actor,reviewed_at=now() WHERE id=assertion_uuid;
   UPDATE public.editorial_assertions a SET canonical_status='superseded',verification_status=CASE WHEN verification_status='verified' THEN 'superseded' ELSE verification_status END
    FROM public.editorial_assertion_recording_work_targets t WHERE a.id=t.assertion_id AND t.recording_id=target.recording_id AND a.id<>assertion_uuid AND a.canonical_status='accepted';
   UPDATE public.recordings SET work_id=target.work_id WHERE id=target.recording_id AND work_id IS DISTINCT FROM target.work_id;
   INSERT INTO public.editorial_decisions(decision_type,status,reason,requested_by,decided_by,previous_canonical_state,resulting_canonical_state,decided_at)
   VALUES('select_recording_work','executed',btrim(reason_value),actor,actor,jsonb_build_object('recording_id',target.recording_id,'work_id',current_work),jsonb_build_object('recording_id',target.recording_id,'work_id',target.work_id),now()) RETURNING id INTO decision_uuid;
   INSERT INTO public.editorial_decision_assertions VALUES(decision_uuid,assertion_uuid,'accepted'); PERFORM set_config('app.governed_work_link','off',true); result_value:=jsonb_build_object('status','executed','decision_id',decision_uuid,'recording_id',target.recording_id,'work_id',target.work_id);
 END IF;
 INSERT INTO public.editorial_idempotency_keys VALUES(actor,'recording_work.select',key,result_value,now()); RETURN result_value;
END; $$;

CREATE OR REPLACE FUNCTION public.create_editorial_work_credit(actor uuid,key uuid,work_uuid uuid,artist_uuid uuid,role_uuid uuid,credited_as_value text DEFAULT NULL,detail_value text DEFAULT NULL,sequence_value integer DEFAULT NULL,source_ids uuid[] DEFAULT ARRAY[]::uuid[],internal_notes_value text DEFAULT NULL)
RETURNS jsonb LANGUAGE plpgsql SECURITY DEFINER SET search_path='' AS $$
DECLARE cached jsonb; credit_uuid uuid; assertion_uuid uuid; decision_uuid uuid; role_code text; source_uuid uuid; result_value jsonb;
BEGIN
 PERFORM public.require_editorial_capability(actor,'credit.create'); PERFORM pg_advisory_xact_lock(hashtextextended(actor::text||key::text,0));
 cached:=public.editorial_idempotent_result(actor,'work_credit.create',key); IF cached IS NOT NULL THEN RETURN cached; END IF;
 SELECT r.code INTO role_code FROM public.credit_roles r JOIN public.credit_role_scopes s ON s.role_id=r.id AND s.scope='work' WHERE r.id=role_uuid AND r.status='active'; IF NOT FOUND THEN RAISE EXCEPTION 'role is not allowed at Work scope'; END IF;
 PERFORM set_config('app.governed_credit','on',true);
 INSERT INTO public.work_credits(work_id,artist_id,role,role_id,credited_as,credit_detail,sequence,verification_status,notes)
 VALUES(work_uuid,artist_uuid,role_code,role_uuid,nullif(btrim(credited_as_value),''),nullif(btrim(detail_value),''),sequence_value,'unverified',internal_notes_value)
 ON CONFLICT(work_id,artist_id,role) DO UPDATE SET role_id=EXCLUDED.role_id RETURNING id INTO credit_uuid;
 INSERT INTO public.editorial_assertions(assertion_type,predicate,asserted_value,verification_status,canonical_status,internal_notes,created_by)
 VALUES('work_credit','work.credit',jsonb_build_object('work_credit_id',credit_uuid,'work_id',work_uuid,'artist_id',artist_uuid,'role_id',role_uuid,'credited_as',credited_as_value),'unverified','unresolved',internal_notes_value,actor) RETURNING id INTO assertion_uuid;
 INSERT INTO public.editorial_assertion_work_credits VALUES(assertion_uuid,credit_uuid);
 FOREACH source_uuid IN ARRAY coalesce(source_ids,ARRAY[]::uuid[]) LOOP INSERT INTO public.editorial_assertion_evidence VALUES(assertion_uuid,source_uuid,'supports',NULL,NULL,actor,now()) ON CONFLICT DO NOTHING; END LOOP;
 INSERT INTO public.editorial_decisions(decision_type,status,reason,requested_by,decided_by,resulting_canonical_state,decided_at) VALUES('create_unverified_work_credit','executed','Create unverified Work credit',actor,actor,jsonb_build_object('work_credit_id',credit_uuid),now()) RETURNING id INTO decision_uuid;
 INSERT INTO public.editorial_decision_assertions VALUES(decision_uuid,assertion_uuid,'considered');
 PERFORM set_config('app.governed_credit','off',true); result_value:=jsonb_build_object('work_credit_id',credit_uuid,'assertion_id',assertion_uuid,'decision_id',decision_uuid); INSERT INTO public.editorial_idempotency_keys VALUES(actor,'work_credit.create',key,result_value,now()); RETURN result_value;
END; $$;

CREATE OR REPLACE FUNCTION public.verify_editorial_work_credit(actor uuid,key uuid,assertion_uuid uuid,reason_value text)
RETURNS jsonb LANGUAGE plpgsql SECURITY DEFINER SET search_path='' AS $$
DECLARE cached jsonb; credit_uuid uuid; decision_uuid uuid; result_value jsonb;
BEGIN
 PERFORM public.require_editorial_capability(actor,'credit.verify'); PERFORM public.require_editorial_capability(actor,'assertion.verify'); PERFORM pg_advisory_xact_lock(hashtextextended(actor::text||key::text,0));
 cached:=public.editorial_idempotent_result(actor,'work_credit.verify',key); IF cached IS NOT NULL THEN RETURN cached; END IF;
 SELECT work_credit_id INTO credit_uuid FROM public.editorial_assertion_work_credits WHERE assertion_id=assertion_uuid; IF NOT FOUND THEN RAISE EXCEPTION 'Work Credit assertion not found'; END IF;
 PERFORM set_config('app.governed_credit','on',true); UPDATE public.editorial_assertions SET verification_status='verified',canonical_status='accepted',reviewed_by=actor,reviewed_at=now() WHERE id=assertion_uuid AND verification_status IN ('unverified','under_review','disputed'); IF NOT FOUND THEN RAISE EXCEPTION 'assertion cannot be verified from current state'; END IF;
 UPDATE public.work_credits SET verification_status='verified' WHERE id=credit_uuid;
 INSERT INTO public.editorial_decisions(decision_type,status,reason,requested_by,decided_by,resulting_canonical_state,decided_at) VALUES('verify_work_credit','executed',btrim(reason_value),actor,actor,jsonb_build_object('work_credit_id',credit_uuid,'assertion_id',assertion_uuid),now()) RETURNING id INTO decision_uuid;
 INSERT INTO public.editorial_decision_assertions VALUES(decision_uuid,assertion_uuid,'accepted'); PERFORM set_config('app.governed_credit','off',true); result_value:=jsonb_build_object('work_credit_id',credit_uuid,'assertion_id',assertion_uuid,'decision_id',decision_uuid,'status','verified');
 INSERT INTO public.editorial_idempotency_keys VALUES(actor,'work_credit.verify',key,result_value,now()); RETURN result_value;
END; $$;

CREATE OR REPLACE FUNCTION public.enforce_governed_work_link() RETURNS trigger LANGUAGE plpgsql SET search_path='' AS $$
BEGIN IF OLD.work_id IS DISTINCT FROM NEW.work_id AND current_setting('app.governed_work_link',true) IS DISTINCT FROM 'on' THEN RAISE EXCEPTION 'recordings.work_id must use governed editorial workflow'; END IF; RETURN NEW; END; $$;
CREATE TRIGGER recordings_governed_work_link BEFORE UPDATE OF work_id ON public.recordings FOR EACH ROW EXECUTE FUNCTION public.enforce_governed_work_link();
CREATE OR REPLACE FUNCTION public.enforce_governed_work_credit() RETURNS trigger LANGUAGE plpgsql SET search_path='' AS $$
BEGIN IF current_setting('app.governed_credit',true) IS DISTINCT FROM 'on' THEN RAISE EXCEPTION 'work_credits must use governed editorial workflow'; END IF; RETURN COALESCE(NEW,OLD); END; $$;
CREATE TRIGGER work_credits_governed_writes BEFORE INSERT OR UPDATE OR DELETE ON public.work_credits FOR EACH ROW EXECUTE FUNCTION public.enforce_governed_work_credit();

UPDATE public.editorial_capabilities SET high_impact=false WHERE capability='work.link_recording';
INSERT INTO public.editorial_role_capabilities(role,capability) VALUES('editor','work.link_recording') ON CONFLICT DO NOTHING;

DROP POLICY IF EXISTS work_credit_sources_public_select ON public.work_credit_sources;
DROP POLICY IF EXISTS recording_isrc_sources_public_select ON public.recording_isrc_sources;
REVOKE SELECT ON public.work_credit_sources,public.recording_isrc_sources FROM anon,authenticated;

ALTER TABLE public.credit_roles ENABLE ROW LEVEL SECURITY; ALTER TABLE public.credit_role_scopes ENABLE ROW LEVEL SECURITY; ALTER TABLE public.credit_role_aliases ENABLE ROW LEVEL SECURITY; ALTER TABLE public.editorial_idempotency_keys ENABLE ROW LEVEL SECURITY;
CREATE POLICY credit_roles_public_select ON public.credit_roles FOR SELECT TO anon,authenticated USING(status='active');
CREATE POLICY credit_role_scopes_public_select ON public.credit_role_scopes FOR SELECT TO anon,authenticated USING(true);
CREATE POLICY credit_role_aliases_public_select ON public.credit_role_aliases FOR SELECT TO anon,authenticated USING(true);
REVOKE ALL ON public.credit_roles,public.credit_role_scopes,public.credit_role_aliases,public.editorial_idempotency_keys FROM PUBLIC,anon,authenticated;
GRANT SELECT ON public.credit_roles,public.credit_role_scopes,public.credit_role_aliases TO anon,authenticated;
GRANT ALL ON public.credit_roles,public.credit_role_scopes,public.credit_role_aliases,public.editorial_idempotency_keys TO service_role;

REVOKE ALL ON FUNCTION public.user_has_editorial_capability(uuid,text),public.require_editorial_capability(uuid,text),public.editorial_idempotent_result(uuid,text,uuid),public.create_editorial_source(uuid,uuid,text,text,text,text,text,text,text,text),public.create_editorial_work(uuid,uuid,text,text,integer,integer,uuid[],text),public.create_recording_work_assertion(uuid,uuid,uuid,uuid,uuid[],text),public.select_recording_work_assertion(uuid,uuid,uuid,text),public.create_editorial_work_credit(uuid,uuid,uuid,uuid,uuid,text,text,integer,uuid[],text),public.verify_editorial_work_credit(uuid,uuid,uuid,text) FROM PUBLIC,anon,authenticated;
GRANT EXECUTE ON FUNCTION public.create_editorial_source(uuid,uuid,text,text,text,text,text,text,text,text),public.create_editorial_work(uuid,uuid,text,text,integer,integer,uuid[],text),public.create_recording_work_assertion(uuid,uuid,uuid,uuid,uuid[],text),public.select_recording_work_assertion(uuid,uuid,uuid,text),public.create_editorial_work_credit(uuid,uuid,uuid,uuid,uuid,text,text,integer,uuid[],text),public.verify_editorial_work_credit(uuid,uuid,uuid,text) TO service_role;
REVOKE ALL ON FUNCTION public.enforce_governed_work_link(),public.enforce_governed_work_credit() FROM PUBLIC,anon,authenticated;

COMMENT ON TABLE public.credit_roles IS 'Canonical contribution-role identities. Labels and aliases do not replace historical credited_as or legacy role text.';
COMMENT ON COLUMN public.credited_works.work_id IS 'Optional archival-to-authoritative Work reference; null preserves unresolved archive-only material.';
COMMENT ON COLUMN public.credited_works.recording_id IS 'Optional archival-to-authoritative Recording reference; mutually exclusive with work_id.';
NOTIFY pgrst,'reload schema';
COMMIT;
