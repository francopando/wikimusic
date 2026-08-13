BEGIN;

-- Music Knowledge Model Phase 1.75. Additive governance infrastructure only.

CREATE TABLE public.editorial_sources (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  source_type text NOT NULL,
  title text NOT NULL,
  organization text,
  author text,
  publication_date date,
  url text,
  archive_reference text,
  citation_text text,
  language text,
  visibility text NOT NULL DEFAULT 'internal',
  status text NOT NULL DEFAULT 'active',
  rights_notes text,
  internal_notes text,
  public_notes text,
  metadata jsonb NOT NULL DEFAULT '{}'::jsonb,
  created_by uuid REFERENCES auth.users(id) ON DELETE RESTRICT,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT editorial_sources_type_nonempty CHECK (btrim(source_type) <> ''),
  CONSTRAINT editorial_sources_title_nonempty CHECK (btrim(title) <> ''),
  CONSTRAINT editorial_sources_url_nonempty CHECK (url IS NULL OR btrim(url) <> ''),
  CONSTRAINT editorial_sources_visibility_valid CHECK (visibility IN ('public','internal','restricted')),
  CONSTRAINT editorial_sources_status_valid CHECK (status IN ('active','deprecated','withdrawn')),
  CONSTRAINT editorial_sources_metadata_object CHECK (jsonb_typeof(metadata) = 'object')
);

CREATE TABLE public.editorial_assertions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  assertion_type text NOT NULL,
  predicate text NOT NULL,
  asserted_value jsonb NOT NULL DEFAULT '{}'::jsonb,
  verification_status text NOT NULL DEFAULT 'unverified',
  canonical_status text NOT NULL DEFAULT 'unresolved',
  internal_notes text,
  public_notes text,
  metadata jsonb NOT NULL DEFAULT '{}'::jsonb,
  created_by uuid REFERENCES auth.users(id) ON DELETE RESTRICT,
  reviewed_by uuid REFERENCES auth.users(id) ON DELETE RESTRICT,
  reviewed_at timestamptz,
  supersedes_assertion_id uuid REFERENCES public.editorial_assertions(id) ON DELETE RESTRICT,
  created_at timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT editorial_assertions_type_nonempty CHECK (btrim(assertion_type) <> ''),
  CONSTRAINT editorial_assertions_predicate_nonempty CHECK (btrim(predicate) <> ''),
  CONSTRAINT editorial_assertions_verification_valid CHECK (verification_status IN ('unverified','under_review','verified','disputed','rejected','superseded')),
  CONSTRAINT editorial_assertions_canonical_valid CHECK (canonical_status IN ('unresolved','accepted','disputed','withheld','superseded')),
  CONSTRAINT editorial_assertions_value_object CHECK (jsonb_typeof(asserted_value) = 'object'),
  CONSTRAINT editorial_assertions_metadata_object CHECK (jsonb_typeof(metadata) = 'object'),
  CONSTRAINT editorial_assertions_no_self_supersession CHECK (supersedes_assertion_id IS NULL OR supersedes_assertion_id <> id),
  CONSTRAINT editorial_assertions_review_consistent CHECK ((reviewed_by IS NULL AND reviewed_at IS NULL) OR (reviewed_by IS NOT NULL AND reviewed_at IS NOT NULL))
);

-- Typed assertion subjects and targets preserve real relational integrity.
CREATE TABLE public.editorial_assertion_works (
  assertion_id uuid PRIMARY KEY REFERENCES public.editorial_assertions(id) ON DELETE CASCADE,
  work_id uuid NOT NULL REFERENCES public.works(id) ON DELETE RESTRICT
);
CREATE TABLE public.editorial_assertion_recordings (
  assertion_id uuid PRIMARY KEY REFERENCES public.editorial_assertions(id) ON DELETE CASCADE,
  recording_id uuid NOT NULL REFERENCES public.recordings(id) ON DELETE RESTRICT
);
CREATE TABLE public.editorial_assertion_work_credits (
  assertion_id uuid PRIMARY KEY REFERENCES public.editorial_assertions(id) ON DELETE CASCADE,
  work_credit_id uuid NOT NULL REFERENCES public.work_credits(id) ON DELETE RESTRICT
);
CREATE TABLE public.editorial_assertion_recording_credits (
  assertion_id uuid PRIMARY KEY REFERENCES public.editorial_assertions(id) ON DELETE CASCADE,
  recording_credit_id uuid NOT NULL REFERENCES public.recording_credits(id) ON DELETE RESTRICT
);
CREATE TABLE public.editorial_assertion_isrcs (
  assertion_id uuid PRIMARY KEY REFERENCES public.editorial_assertions(id) ON DELETE CASCADE,
  recording_isrc_id uuid NOT NULL REFERENCES public.recording_isrcs(id) ON DELETE RESTRICT
);
CREATE TABLE public.editorial_assertion_recording_work_targets (
  assertion_id uuid PRIMARY KEY REFERENCES public.editorial_assertions(id) ON DELETE CASCADE,
  recording_id uuid NOT NULL REFERENCES public.recordings(id) ON DELETE RESTRICT,
  work_id uuid NOT NULL REFERENCES public.works(id) ON DELETE RESTRICT
);

CREATE TABLE public.editorial_assertion_evidence (
  assertion_id uuid NOT NULL REFERENCES public.editorial_assertions(id) ON DELETE RESTRICT,
  source_id uuid NOT NULL REFERENCES public.editorial_sources(id) ON DELETE RESTRICT,
  relationship text NOT NULL,
  locator text,
  notes text,
  created_by uuid REFERENCES auth.users(id) ON DELETE RESTRICT,
  created_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY (assertion_id, source_id, relationship),
  CONSTRAINT editorial_assertion_evidence_relationship_valid CHECK (relationship IN ('supports','disputes','contextualizes'))
);

-- Legacy provenance remains authoritative during transition; shared source is optional.
ALTER TABLE public.work_credit_sources ADD COLUMN source_id uuid REFERENCES public.editorial_sources(id) ON DELETE RESTRICT;
ALTER TABLE public.recording_isrc_sources ADD COLUMN source_id uuid REFERENCES public.editorial_sources(id) ON DELETE RESTRICT;

CREATE TABLE public.editorial_decisions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  decision_type text NOT NULL,
  status text NOT NULL DEFAULT 'requested',
  reason text NOT NULL,
  requested_by uuid REFERENCES auth.users(id) ON DELETE RESTRICT,
  approved_by uuid REFERENCES auth.users(id) ON DELETE RESTRICT,
  decided_by uuid REFERENCES auth.users(id) ON DELETE RESTRICT,
  requires_independent_approval boolean NOT NULL DEFAULT false,
  previous_canonical_state jsonb,
  resulting_canonical_state jsonb,
  internal_notes text,
  public_notes text,
  metadata jsonb NOT NULL DEFAULT '{}'::jsonb,
  reverses_decision_id uuid REFERENCES public.editorial_decisions(id) ON DELETE RESTRICT,
  requested_at timestamptz NOT NULL DEFAULT now(),
  decided_at timestamptz,
  CONSTRAINT editorial_decisions_type_nonempty CHECK (btrim(decision_type) <> ''),
  CONSTRAINT editorial_decisions_reason_nonempty CHECK (btrim(reason) <> ''),
  CONSTRAINT editorial_decisions_status_valid CHECK (status IN ('requested','approved','rejected','executed','reversed','cancelled')),
  CONSTRAINT editorial_decisions_independent CHECK (approved_by IS NULL OR requested_by IS NULL OR approved_by <> requested_by),
  CONSTRAINT editorial_decisions_required_approval CHECK (NOT requires_independent_approval OR status IN ('requested','rejected','cancelled') OR approved_by IS NOT NULL),
  CONSTRAINT editorial_decisions_previous_object CHECK (previous_canonical_state IS NULL OR jsonb_typeof(previous_canonical_state) = 'object'),
  CONSTRAINT editorial_decisions_result_object CHECK (resulting_canonical_state IS NULL OR jsonb_typeof(resulting_canonical_state) = 'object'),
  CONSTRAINT editorial_decisions_metadata_object CHECK (jsonb_typeof(metadata) = 'object'),
  CONSTRAINT editorial_decisions_no_self_reversal CHECK (reverses_decision_id IS NULL OR reverses_decision_id <> id)
);
CREATE TABLE public.editorial_decision_assertions (
  decision_id uuid NOT NULL REFERENCES public.editorial_decisions(id) ON DELETE RESTRICT,
  assertion_id uuid NOT NULL REFERENCES public.editorial_assertions(id) ON DELETE RESTRICT,
  relationship text NOT NULL DEFAULT 'considered',
  PRIMARY KEY (decision_id, assertion_id),
  CONSTRAINT editorial_decision_assertions_relationship_valid CHECK (relationship IN ('considered','accepted','rejected','disputed','superseded'))
);

CREATE TABLE public.editorial_capabilities (
  capability text PRIMARY KEY,
  description text NOT NULL,
  high_impact boolean NOT NULL DEFAULT false,
  CONSTRAINT editorial_capabilities_name_valid CHECK (capability ~ '^[a-z][a-z0-9_]*\.[a-z][a-z0-9_]*$')
);
CREATE TABLE public.editorial_role_capabilities (
  role text NOT NULL,
  capability text NOT NULL REFERENCES public.editorial_capabilities(capability) ON DELETE RESTRICT,
  PRIMARY KEY (role, capability),
  CONSTRAINT editorial_role_capabilities_role_valid CHECK (role IN ('owner','admin','editor'))
);

INSERT INTO public.editorial_capabilities (capability, description, high_impact) VALUES
 ('source.create','Create evidence sources',false), ('source.edit','Edit active source metadata',false),
 ('assertion.create','Create editorial assertions',false), ('assertion.review','Begin assertion review',false),
 ('assertion.verify','Verify assertions',false), ('assertion.reject','Reject assertions',false),
 ('work.create','Create Works under governance policy',false), ('work.edit','Edit Works',false),
 ('work.link_recording','Select a Recording to Work canonical link',true),
 ('credit.create','Create scoped credits',false), ('credit.verify','Verify credits',false), ('credit.dispute','Dispute credits',true),
 ('conflict.review','Review editorial conflicts',false), ('conflict.resolve','Resolve editorial conflicts',true),
 ('identity.merge','Merge canonical identities',true), ('identity.split','Split canonical identities',true),
 ('decision.approve','Independently approve consequential decisions',true);

INSERT INTO public.editorial_role_capabilities (role, capability)
SELECT 'owner', capability FROM public.editorial_capabilities
UNION ALL SELECT 'admin', capability FROM public.editorial_capabilities
UNION ALL SELECT 'editor', capability FROM public.editorial_capabilities WHERE capability IN
 ('source.create','source.edit','assertion.create','assertion.review','assertion.verify','assertion.reject','work.create','work.edit','credit.create','credit.verify','conflict.review');

CREATE OR REPLACE FUNCTION public.has_editorial_capability(requested_capability text)
RETURNS boolean LANGUAGE sql STABLE SECURITY DEFINER SET search_path = '' AS $$
 SELECT EXISTS (
   SELECT 1 FROM public.editorial_role_capabilities rc
   WHERE rc.role = public.current_staff_role() AND rc.capability = requested_capability
 );
$$;
REVOKE ALL ON FUNCTION public.has_editorial_capability(text) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.has_editorial_capability(text) TO authenticated, service_role;

CREATE TABLE public.editorial_cases (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  case_type text NOT NULL,
  status text NOT NULL DEFAULT 'open',
  priority text NOT NULL DEFAULT 'normal',
  title text NOT NULL,
  summary text,
  internal_notes text,
  public_notes text,
  assigned_to uuid REFERENCES auth.users(id) ON DELETE RESTRICT,
  opened_by uuid REFERENCES auth.users(id) ON DELETE RESTRICT,
  resolved_by uuid REFERENCES auth.users(id) ON DELETE RESTRICT,
  resolution text,
  metadata jsonb NOT NULL DEFAULT '{}'::jsonb,
  opened_at timestamptz NOT NULL DEFAULT now(),
  resolved_at timestamptz,
  CONSTRAINT editorial_cases_type_nonempty CHECK (btrim(case_type) <> ''),
  CONSTRAINT editorial_cases_title_nonempty CHECK (btrim(title) <> ''),
  CONSTRAINT editorial_cases_status_valid CHECK (status IN ('open','triage','under_review','blocked','resolved','closed')),
  CONSTRAINT editorial_cases_priority_valid CHECK (priority IN ('low','normal','high','urgent')),
  CONSTRAINT editorial_cases_metadata_object CHECK (jsonb_typeof(metadata) = 'object'),
  CONSTRAINT editorial_cases_resolution_consistent CHECK ((resolved_at IS NULL AND resolved_by IS NULL) OR (resolved_at IS NOT NULL AND resolved_by IS NOT NULL))
);
CREATE TABLE public.editorial_case_recordings (case_id uuid REFERENCES public.editorial_cases(id) ON DELETE CASCADE, recording_id uuid REFERENCES public.recordings(id) ON DELETE RESTRICT, PRIMARY KEY(case_id,recording_id));
CREATE TABLE public.editorial_case_works (case_id uuid REFERENCES public.editorial_cases(id) ON DELETE CASCADE, work_id uuid REFERENCES public.works(id) ON DELETE RESTRICT, PRIMARY KEY(case_id,work_id));
CREATE TABLE public.editorial_case_assertions (case_id uuid REFERENCES public.editorial_cases(id) ON DELETE CASCADE, assertion_id uuid REFERENCES public.editorial_assertions(id) ON DELETE RESTRICT, PRIMARY KEY(case_id,assertion_id));
CREATE TABLE public.editorial_case_isrcs (case_id uuid REFERENCES public.editorial_cases(id) ON DELETE CASCADE, recording_isrc_id uuid REFERENCES public.recording_isrcs(id) ON DELETE RESTRICT, PRIMARY KEY(case_id,recording_isrc_id));
CREATE TABLE public.editorial_isrc_findings (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  case_id uuid NOT NULL REFERENCES public.editorial_cases(id) ON DELETE CASCADE,
  isrc text NOT NULL,
  finding text NOT NULL,
  rationale text,
  metadata jsonb NOT NULL DEFAULT '{}'::jsonb,
  created_by uuid REFERENCES auth.users(id) ON DELETE RESTRICT,
  created_at timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT editorial_isrc_findings_format CHECK (isrc ~ '^[A-Z]{2}[A-Z0-9]{3}[0-9]{7}$'),
  CONSTRAINT editorial_isrc_findings_value CHECK (finding IN ('probable_duplicate_recording','different_recordings_shared_isrc','insufficient_evidence')),
  CONSTRAINT editorial_isrc_findings_unique UNIQUE(case_id,isrc),
  CONSTRAINT editorial_isrc_findings_metadata_object CHECK (jsonb_typeof(metadata) = 'object')
);

CREATE TABLE public.artist_redirects (
  old_artist_id uuid PRIMARY KEY REFERENCES public.artists(id) ON DELETE RESTRICT,
  canonical_artist_id uuid NOT NULL REFERENCES public.artists(id) ON DELETE RESTRICT,
  decision_id uuid NOT NULL REFERENCES public.editorial_decisions(id) ON DELETE RESTRICT,
  reason text NOT NULL, created_at timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT artist_redirects_not_self CHECK(old_artist_id <> canonical_artist_id)
);
CREATE TABLE public.work_redirects (
  old_work_id uuid PRIMARY KEY REFERENCES public.works(id) ON DELETE RESTRICT,
  canonical_work_id uuid NOT NULL REFERENCES public.works(id) ON DELETE RESTRICT,
  decision_id uuid NOT NULL REFERENCES public.editorial_decisions(id) ON DELETE RESTRICT,
  reason text NOT NULL, created_at timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT work_redirects_not_self CHECK(old_work_id <> canonical_work_id)
);
CREATE TABLE public.recording_redirects (
  old_recording_id uuid PRIMARY KEY REFERENCES public.recordings(id) ON DELETE RESTRICT,
  canonical_recording_id uuid NOT NULL REFERENCES public.recordings(id) ON DELETE RESTRICT,
  decision_id uuid NOT NULL REFERENCES public.editorial_decisions(id) ON DELETE RESTRICT,
  reason text NOT NULL, created_at timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT recording_redirects_not_self CHECK(old_recording_id <> canonical_recording_id)
);

CREATE OR REPLACE FUNCTION public.prevent_identity_redirect_cycle()
RETURNS trigger LANGUAGE plpgsql SET search_path = '' AS $$
DECLARE cycle_found boolean;
BEGIN
 IF TG_TABLE_NAME = 'artist_redirects' THEN
   WITH RECURSIVE chain(id) AS (SELECT NEW.canonical_artist_id UNION SELECT r.canonical_artist_id FROM public.artist_redirects r JOIN chain c ON r.old_artist_id=c.id)
   SELECT EXISTS(SELECT 1 FROM chain WHERE id=NEW.old_artist_id) INTO cycle_found;
 ELSIF TG_TABLE_NAME = 'work_redirects' THEN
   WITH RECURSIVE chain(id) AS (SELECT NEW.canonical_work_id UNION SELECT r.canonical_work_id FROM public.work_redirects r JOIN chain c ON r.old_work_id=c.id)
   SELECT EXISTS(SELECT 1 FROM chain WHERE id=NEW.old_work_id) INTO cycle_found;
 ELSE
   WITH RECURSIVE chain(id) AS (SELECT NEW.canonical_recording_id UNION SELECT r.canonical_recording_id FROM public.recording_redirects r JOIN chain c ON r.old_recording_id=c.id)
   SELECT EXISTS(SELECT 1 FROM chain WHERE id=NEW.old_recording_id) INTO cycle_found;
 END IF;
 IF cycle_found THEN RAISE EXCEPTION 'identity redirect cycle is not allowed'; END IF;
 RETURN NEW;
END; $$;
CREATE TRIGGER artist_redirect_cycle BEFORE INSERT OR UPDATE ON public.artist_redirects FOR EACH ROW EXECUTE FUNCTION public.prevent_identity_redirect_cycle();
CREATE TRIGGER work_redirect_cycle BEFORE INSERT OR UPDATE ON public.work_redirects FOR EACH ROW EXECUTE FUNCTION public.prevent_identity_redirect_cycle();
CREATE TRIGGER recording_redirect_cycle BEFORE INSERT OR UPDATE ON public.recording_redirects FOR EACH ROW EXECUTE FUNCTION public.prevent_identity_redirect_cycle();

CREATE TABLE public.editorial_audit_events (
  id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  event_type text NOT NULL,
  actor_type text NOT NULL,
  actor_user_id uuid REFERENCES auth.users(id) ON DELETE RESTRICT,
  correlation_id uuid NOT NULL DEFAULT gen_random_uuid(),
  decision_id uuid REFERENCES public.editorial_decisions(id) ON DELETE RESTRICT,
  table_name text,
  row_id uuid,
  before_state jsonb,
  after_state jsonb,
  reason text,
  metadata jsonb NOT NULL DEFAULT '{}'::jsonb,
  occurred_at timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT editorial_audit_actor_type_valid CHECK(actor_type IN ('human_editor','system_import','migration','service_process')),
  CONSTRAINT editorial_audit_human_actor CHECK(actor_type <> 'human_editor' OR actor_user_id IS NOT NULL),
  CONSTRAINT editorial_audit_metadata_object CHECK(jsonb_typeof(metadata)='object')
);

CREATE OR REPLACE FUNCTION public.protect_append_only_governance()
RETURNS trigger LANGUAGE plpgsql SET search_path='' AS $$ BEGIN RAISE EXCEPTION '% is append-only', TG_TABLE_NAME; END; $$;
CREATE TRIGGER editorial_decisions_no_delete BEFORE DELETE ON public.editorial_decisions FOR EACH ROW EXECUTE FUNCTION public.protect_append_only_governance();
CREATE TRIGGER editorial_audit_events_append_only BEFORE UPDATE OR DELETE ON public.editorial_audit_events FOR EACH ROW EXECUTE FUNCTION public.protect_append_only_governance();

CREATE OR REPLACE FUNCTION public.validate_assertion_subject()
RETURNS trigger LANGUAGE plpgsql SET search_path='' AS $$
DECLARE subject_count integer;
BEGIN
 SELECT
   (SELECT count(*) FROM public.editorial_assertion_works WHERE assertion_id=NEW.id) +
   (SELECT count(*) FROM public.editorial_assertion_recordings WHERE assertion_id=NEW.id) +
   (SELECT count(*) FROM public.editorial_assertion_work_credits WHERE assertion_id=NEW.id) +
   (SELECT count(*) FROM public.editorial_assertion_recording_credits WHERE assertion_id=NEW.id) +
   (SELECT count(*) FROM public.editorial_assertion_isrcs WHERE assertion_id=NEW.id) +
   (SELECT count(*) FROM public.editorial_assertion_recording_work_targets WHERE assertion_id=NEW.id)
 INTO subject_count;
 IF subject_count <> 1 THEN RAISE EXCEPTION 'assertion % must have exactly one typed subject/target (found %)',NEW.id,subject_count; END IF;
 RETURN NEW;
END; $$;
CREATE CONSTRAINT TRIGGER editorial_assertions_one_subject AFTER INSERT OR UPDATE ON public.editorial_assertions DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION public.validate_assertion_subject();

CREATE OR REPLACE FUNCTION public.approve_editorial_decision(decision_uuid uuid)
RETURNS public.editorial_decisions LANGUAGE plpgsql SECURITY DEFINER SET search_path='' AS $$
DECLARE decision public.editorial_decisions;
BEGIN
 IF auth.uid() IS NULL OR NOT public.has_editorial_capability('decision.approve') THEN RAISE EXCEPTION 'not authorized to approve editorial decisions'; END IF;
 SELECT * INTO decision FROM public.editorial_decisions WHERE id=decision_uuid FOR UPDATE;
 IF NOT FOUND THEN RAISE EXCEPTION 'editorial decision not found'; END IF;
 IF decision.status='approved' AND decision.approved_by=auth.uid() THEN RETURN decision; END IF;
 IF decision.status <> 'requested' THEN RAISE EXCEPTION 'decision is not awaiting approval'; END IF;
 IF decision.requested_by=auth.uid() THEN RAISE EXCEPTION 'independent self-approval is not allowed'; END IF;
 UPDATE public.editorial_decisions SET status='approved',approved_by=auth.uid(),decided_by=auth.uid(),decided_at=now() WHERE id=decision_uuid RETURNING * INTO decision;
 INSERT INTO public.editorial_audit_events(event_type,actor_type,actor_user_id,decision_id,reason) VALUES('editorial_decision.approved','human_editor',auth.uid(),decision.id,decision.reason);
 RETURN decision;
END; $$;
REVOKE ALL ON FUNCTION public.approve_editorial_decision(uuid) FROM PUBLIC,anon;
GRANT EXECUTE ON FUNCTION public.approve_editorial_decision(uuid) TO authenticated,service_role;

CREATE OR REPLACE FUNCTION public.audit_canonical_mutation()
RETURNS trigger LANGUAGE plpgsql SECURITY DEFINER SET search_path='' AS $$
DECLARE actor uuid := auth.uid(); changed_id uuid; correlation uuid;
BEGIN
 changed_id := COALESCE(NEW.id,OLD.id);
 BEGIN correlation := nullif(current_setting('app.correlation_id',true),'')::uuid; EXCEPTION WHEN invalid_text_representation THEN correlation := NULL; END;
 INSERT INTO public.editorial_audit_events(event_type,actor_type,actor_user_id,correlation_id,table_name,row_id,before_state,after_state,reason)
 VALUES('canonical_projection.mutated',CASE WHEN actor IS NULL THEN 'service_process' ELSE 'human_editor' END,actor,COALESCE(correlation,gen_random_uuid()),TG_TABLE_NAME,changed_id,to_jsonb(OLD),to_jsonb(NEW),nullif(current_setting('app.editorial_reason',true),''));
 RETURN NEW;
END; $$;
CREATE TRIGGER recordings_work_projection_audit AFTER UPDATE OF work_id ON public.recordings FOR EACH ROW WHEN (OLD.work_id IS DISTINCT FROM NEW.work_id) EXECUTE FUNCTION public.audit_canonical_mutation();
CREATE TRIGGER work_credits_mutation_audit AFTER INSERT OR UPDATE OR DELETE ON public.work_credits FOR EACH ROW EXECUTE FUNCTION public.audit_canonical_mutation();
CREATE TRIGGER recording_isrcs_mutation_audit AFTER INSERT OR UPDATE OR DELETE ON public.recording_isrcs FOR EACH ROW EXECUTE FUNCTION public.audit_canonical_mutation();

CREATE INDEX editorial_sources_type_status_idx ON public.editorial_sources(source_type,status);
CREATE INDEX editorial_sources_visibility_idx ON public.editorial_sources(visibility);
CREATE INDEX editorial_assertions_status_idx ON public.editorial_assertions(verification_status,canonical_status,created_at);
CREATE INDEX editorial_assertions_predicate_idx ON public.editorial_assertions(predicate);
CREATE INDEX editorial_assertion_evidence_source_idx ON public.editorial_assertion_evidence(source_id);
CREATE INDEX editorial_assertion_works_entity_idx ON public.editorial_assertion_works(work_id);
CREATE INDEX editorial_assertion_recordings_entity_idx ON public.editorial_assertion_recordings(recording_id);
CREATE INDEX editorial_assertion_work_targets_idx ON public.editorial_assertion_recording_work_targets(recording_id,work_id);
CREATE INDEX editorial_decisions_status_idx ON public.editorial_decisions(status,requested_at);
CREATE INDEX editorial_cases_queue_idx ON public.editorial_cases(status,priority,assigned_to,opened_at);
CREATE INDEX editorial_isrc_findings_value_idx ON public.editorial_isrc_findings(finding,isrc);
CREATE INDEX editorial_audit_events_time_idx ON public.editorial_audit_events(occurred_at);
CREATE INDEX editorial_audit_events_correlation_idx ON public.editorial_audit_events(correlation_id);

-- All governance relations are private and server-administered in Phase 1.75.
DO $$ DECLARE t text; BEGIN FOREACH t IN ARRAY ARRAY[
 'editorial_sources','editorial_assertions','editorial_assertion_works','editorial_assertion_recordings',
 'editorial_assertion_work_credits','editorial_assertion_recording_credits','editorial_assertion_isrcs',
 'editorial_assertion_recording_work_targets','editorial_assertion_evidence','editorial_decisions',
 'editorial_decision_assertions','editorial_capabilities','editorial_role_capabilities','editorial_cases',
 'editorial_case_recordings','editorial_case_works','editorial_case_assertions','editorial_case_isrcs',
 'editorial_isrc_findings','artist_redirects','work_redirects','recording_redirects','editorial_audit_events'
 ] LOOP EXECUTE format('ALTER TABLE public.%I ENABLE ROW LEVEL SECURITY',t); EXECUTE format('REVOKE ALL ON TABLE public.%I FROM PUBLIC, anon, authenticated',t); EXECUTE format('GRANT ALL ON TABLE public.%I TO service_role',t); END LOOP; END $$;
REVOKE ALL ON FUNCTION public.prevent_identity_redirect_cycle() FROM PUBLIC,anon,authenticated;
REVOKE ALL ON FUNCTION public.protect_append_only_governance() FROM PUBLIC,anon,authenticated;
REVOKE ALL ON FUNCTION public.validate_assertion_subject() FROM PUBLIC,anon,authenticated;
REVOKE ALL ON FUNCTION public.audit_canonical_mutation() FROM PUBLIC,anon,authenticated;
GRANT USAGE,SELECT ON SEQUENCE public.editorial_audit_events_id_seq TO service_role;

COMMENT ON TABLE public.editorial_assertions IS 'Common assertion envelope; typed relation tables provide entity FKs. Canonical fields remain efficient projections.';
COMMENT ON COLUMN public.editorial_sources.internal_notes IS 'Restricted research notes; never part of the public query contract.';
COMMENT ON COLUMN public.editorial_sources.public_notes IS 'Text eligible for public use only after an explicit future publication decision.';
COMMENT ON TABLE public.editorial_audit_events IS 'Append-only semantic/mutation event foundation. Retention is indefinite until a separately approved archival policy exists.';
COMMENT ON TABLE public.artist_redirects IS 'Canonical Artist identity redirects; distinct from URL/slug redirects and aliases.';

NOTIFY pgrst, 'reload schema';
COMMIT;
