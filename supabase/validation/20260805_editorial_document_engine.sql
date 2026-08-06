-- Production-safe Phase 1 verification.
-- Uses only dedicated test artists and always rolls back every test mutation.
BEGIN;

DO $$
BEGIN
  IF to_regclass('public.editorial_documents') IS NULL
     OR to_regclass('public.editorial_entity_references') IS NULL THEN
    RAISE EXCEPTION 'Editorial tables do not exist.';
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint c
    JOIN pg_class source_table ON source_table.oid = c.conrelid
    JOIN pg_class target_table ON target_table.oid = c.confrelid
    WHERE source_table.relname = 'editorial_documents'
      AND target_table.relname = 'artists' AND c.contype = 'f' AND c.confdeltype = 'c'
  ) THEN RAISE EXCEPTION 'Owner artist cascade foreign key is missing.'; END IF;

  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint c
    JOIN pg_class source_table ON source_table.oid = c.conrelid
    JOIN pg_class target_table ON target_table.oid = c.confrelid
    WHERE source_table.relname = 'editorial_entity_references'
      AND target_table.relname = 'editorial_documents' AND c.contype = 'f' AND c.confdeltype = 'c'
  ) THEN RAISE EXCEPTION 'Reference document cascade foreign key is missing.'; END IF;

  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint c
    JOIN pg_class source_table ON source_table.oid = c.conrelid
    JOIN pg_class target_table ON target_table.oid = c.confrelid
    WHERE source_table.relname = 'editorial_entity_references'
      AND target_table.relname = 'artists' AND c.contype = 'f' AND c.confdeltype = 'r'
  ) THEN RAISE EXCEPTION 'Target artist restrict foreign key is missing.'; END IF;

  IF NOT EXISTS (
    SELECT 1 FROM pg_indexes WHERE schemaname = 'public'
      AND indexname = 'editorial_documents_artist_biography_locale_uidx'
  ) THEN RAISE EXCEPTION 'Biography owner/locale unique index is missing.'; END IF;

  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint c JOIN pg_class t ON t.oid = c.conrelid
    WHERE t.relname = 'editorial_entity_references' AND c.contype = 'u'
      AND pg_get_constraintdef(c.oid) = 'UNIQUE (editorial_document_id, occurrence_id)'
  ) THEN RAISE EXCEPTION 'Reference occurrence uniqueness constraint is missing.'; END IF;

  IF NOT EXISTS (
    SELECT 1 FROM pg_trigger WHERE not tgisinternal
      AND tgname = 'editorial_documents_updated_at'
  ) OR NOT EXISTS (
    SELECT 1 FROM pg_trigger WHERE not tgisinternal
      AND tgname = 'editorial_entity_references_updated_at'
  ) THEN RAISE EXCEPTION 'Editorial timestamp trigger is missing.'; END IF;

  IF NOT EXISTS (
    SELECT 1 FROM pg_policy WHERE polname = 'editorial_documents_service_role_all'
  ) OR NOT EXISTS (
    SELECT 1 FROM pg_policy WHERE polname = 'editorial_entity_references_service_role_all'
  ) THEN RAISE EXCEPTION 'Editorial service-role policy is missing.'; END IF;
END;
$$;

INSERT INTO public.artists (id, name, slug)
VALUES
  ('00000000-0000-4000-8000-202608050001', '__CODEX_PHASE1_TEMP_OWNER_ROLLBACK_ONLY__', '__codex-phase1-temp-owner-rollback-only__'),
  ('00000000-0000-4000-8000-202608050002', '__CODEX_PHASE1_TEMP_TARGET_ROLLBACK_ONLY__', '__codex-phase1-temp-target-rollback-only__');

-- Exercise the intended service-role server path with the canonical empty document.
SET LOCAL ROLE service_role;
SELECT id, revision FROM public.upsert_editorial_document(
  'artist_biography',
  '00000000-0000-4000-8000-202608050001',
  'en', 1, 'draft',
  '{"type":"doc","content":[{"type":"paragraph"}]}'::jsonb,
  0
);
RESET ROLE;

DO $$
DECLARE
  v_owner constant uuid := '00000000-0000-4000-8000-202608050001';
  v_target constant uuid := '00000000-0000-4000-8000-202608050002';
  v_missing constant uuid := '00000000-0000-4000-8000-202608059999';
  v_document_id uuid;
  v_revision integer;
  v_before_documents bigint;
  v_before_references bigint;
  v_rejected boolean;
  v_reference_document jsonb;
  v_duplicate_document jsonb;
  v_missing_target_document jsonb;
BEGIN
  -- Canonical empty was accepted through service_role; zero-block must fail.
  SELECT id, revision INTO v_document_id, v_revision
  FROM public.editorial_documents
  WHERE document_type = 'artist_biography' AND owner_artist_id = v_owner AND locale = 'en';
  IF v_document_id IS NULL OR v_revision <> 1 THEN
    RAISE EXCEPTION 'Canonical empty document service-role create failed.';
  END IF;

  v_rejected := false;
  BEGIN
    PERFORM public.validate_editorial_document_v1('{"type":"doc","content":[]}'::jsonb);
  EXCEPTION WHEN invalid_parameter_value THEN v_rejected := true;
  END;
  IF NOT v_rejected THEN RAISE EXCEPTION 'Zero-block document was accepted.'; END IF;

  -- English and Spanish documents may coexist for the same owner.
  PERFORM public.upsert_editorial_document(
    'artist_biography', v_owner, 'es', 1, 'draft',
    '{"type":"doc","content":[{"type":"paragraph"}]}'::jsonb, 0
  );
  IF (SELECT count(*) FROM public.editorial_documents WHERE owner_artist_id = v_owner) <> 2 THEN
    RAISE EXCEPTION 'English and Spanish biographies did not coexist.';
  END IF;

  -- The same artist may be referenced by multiple distinct occurrences.
  v_reference_document := jsonb_build_object(
    'type', 'doc', 'content', jsonb_build_array(jsonb_build_object(
      'type', 'paragraph', 'content', jsonb_build_array(
        jsonb_build_object('type', 'text', 'text', 'Worked with '),
        jsonb_build_object('type', 'artistReference', 'attrs', jsonb_build_object(
          'occurrenceId', '10000000-0000-4000-8000-202608050001',
          'artistId', v_target::text, 'displayText', 'Temporary Target'
        )),
        jsonb_build_object('type', 'text', 'text', ' and later '),
        jsonb_build_object('type', 'artistReference', 'attrs', jsonb_build_object(
          'occurrenceId', '10000000-0000-4000-8000-202608050002',
          'artistId', v_target::text, 'displayText', 'the same temporary target'
        ))
      )
    ))
  );

  SELECT result.id, result.revision INTO v_document_id, v_revision
  FROM public.upsert_editorial_document(
    'artist_biography', v_owner, 'en', 1, 'draft', v_reference_document, 1
  ) result;
  IF v_revision <> 2 THEN RAISE EXCEPTION 'Matching revision did not increment exactly once.'; END IF;
  IF (SELECT count(*) FROM public.editorial_entity_references WHERE editorial_document_id = v_document_id) <> 2 THEN
    RAISE EXCEPTION 'Reference rows were not derived for both occurrences.';
  END IF;
  IF (SELECT count(DISTINCT target_artist_id) FROM public.editorial_entity_references WHERE editorial_document_id = v_document_id) <> 1 THEN
    RAISE EXCEPTION 'Repeated target artist references were not preserved.';
  END IF;
  IF (SELECT count(*) FROM public.editorial_entity_references WHERE target_artist_id = v_target) <> 2 THEN
    RAISE EXCEPTION 'Reverse-reference lookup failed.';
  END IF;

  -- The partial unique index enforces one biography per owner/locale.
  v_rejected := false;
  BEGIN
    INSERT INTO public.editorial_documents (
      document_type, locale, schema_version, document, status, owner_artist_id
    ) VALUES (
      'artist_biography', 'en', 1,
      '{"type":"doc","content":[{"type":"paragraph"}]}'::jsonb, 'draft', v_owner
    );
  EXCEPTION WHEN unique_violation THEN v_rejected := true;
  END;
  IF NOT v_rejected THEN RAISE EXCEPTION 'Duplicate owner/locale biography was accepted.'; END IF;

  -- Duplicate occurrence IDs fail without changing the saved revision or relations.
  v_duplicate_document := jsonb_build_object(
    'type', 'doc', 'content', jsonb_build_array(jsonb_build_object(
      'type', 'paragraph', 'content', jsonb_build_array(
        jsonb_build_object('type', 'artistReference', 'attrs', jsonb_build_object(
          'occurrenceId', '20000000-0000-4000-8000-202608050001',
          'artistId', v_target::text, 'displayText', 'Temporary Target'
        )),
        jsonb_build_object('type', 'artistReference', 'attrs', jsonb_build_object(
          'occurrenceId', '20000000-0000-4000-8000-202608050001',
          'artistId', v_target::text, 'displayText', 'Temporary Target Again'
        ))
      )
    ))
  );
  SELECT count(*) INTO v_before_documents FROM public.editorial_documents;
  SELECT count(*) INTO v_before_references FROM public.editorial_entity_references;
  v_rejected := false;
  BEGIN
    PERFORM public.upsert_editorial_document('artist_biography', v_owner, 'en', 1, 'draft', v_duplicate_document, 2);
  EXCEPTION WHEN unique_violation THEN v_rejected := true;
  END;
  IF NOT v_rejected THEN RAISE EXCEPTION 'Duplicate occurrence UUID was accepted.'; END IF;
  IF (SELECT count(*) FROM public.editorial_documents) <> v_before_documents
     OR (SELECT count(*) FROM public.editorial_entity_references) <> v_before_references
     OR (SELECT revision FROM public.editorial_documents WHERE id = v_document_id) <> 2 THEN
    RAISE EXCEPTION 'Duplicate-occurrence failure left partial state.';
  END IF;

  -- A missing target fails atomically.
  v_missing_target_document := jsonb_build_object(
    'type', 'doc', 'content', jsonb_build_array(jsonb_build_object(
      'type', 'paragraph', 'content', jsonb_build_array(
        jsonb_build_object('type', 'artistReference', 'attrs', jsonb_build_object(
          'occurrenceId', '30000000-0000-4000-8000-202608050001',
          'artistId', v_missing::text, 'displayText', 'Missing Target'
        ))
      )
    ))
  );
  v_rejected := false;
  BEGIN
    PERFORM public.upsert_editorial_document('artist_biography', v_owner, 'en', 1, 'draft', v_missing_target_document, 2);
  EXCEPTION WHEN foreign_key_violation THEN v_rejected := true;
  END;
  IF NOT v_rejected THEN RAISE EXCEPTION 'Missing target artist was accepted.'; END IF;
  IF (SELECT count(*) FROM public.editorial_entity_references WHERE editorial_document_id = v_document_id) <> 2
     OR (SELECT revision FROM public.editorial_documents WHERE id = v_document_id) <> 2 THEN
    RAISE EXCEPTION 'Missing-target failure left partial state.';
  END IF;

  -- Matching update succeeds; stale update fails without another increment.
  SELECT result.revision INTO v_revision
  FROM public.upsert_editorial_document(
    'artist_biography', v_owner, 'en', 1, 'draft', v_reference_document, 2
  ) result;
  IF v_revision <> 3 THEN RAISE EXCEPTION 'Successful update did not increment revision once.'; END IF;
  v_rejected := false;
  BEGIN
    PERFORM public.upsert_editorial_document('artist_biography', v_owner, 'en', 1, 'draft', v_reference_document, 2);
  EXCEPTION WHEN serialization_failure THEN v_rejected := true;
  END;
  IF NOT v_rejected OR (SELECT revision FROM public.editorial_documents WHERE id = v_document_id) <> 3 THEN
    RAISE EXCEPTION 'Stale revision was accepted or changed the revision.';
  END IF;

  -- Referenced target deletion is restricted while the owner and relations exist.
  v_rejected := false;
  BEGIN
    DELETE FROM public.artists WHERE id = v_target;
  EXCEPTION WHEN foreign_key_violation THEN v_rejected := true;
  END;
  IF NOT v_rejected THEN RAISE EXCEPTION 'Referenced target artist deletion was not restricted.'; END IF;

  -- Owner deletion cascades both locale documents and every relation.
  DELETE FROM public.artists WHERE id = v_owner;
  IF EXISTS (SELECT 1 FROM public.editorial_documents WHERE owner_artist_id = v_owner)
     OR EXISTS (SELECT 1 FROM public.editorial_entity_references WHERE target_artist_id = v_target) THEN
    RAISE EXCEPTION 'Owner deletion did not cascade editorial data.';
  END IF;
  DELETE FROM public.artists WHERE id = v_target;
  IF EXISTS (SELECT 1 FROM public.artists WHERE id IN (v_owner, v_target)) THEN
    RAISE EXCEPTION 'Temporary test artists remain inside verification transaction.';
  END IF;
END;
$$;

DO $$
BEGIN
  IF has_table_privilege('anon', 'public.editorial_documents', 'SELECT')
     OR has_table_privilege('anon', 'public.editorial_documents', 'INSERT')
     OR has_table_privilege('authenticated', 'public.editorial_documents', 'SELECT')
     OR has_table_privilege('authenticated', 'public.editorial_documents', 'INSERT')
     OR has_table_privilege('authenticated', 'public.editorial_documents', 'UPDATE')
     OR has_table_privilege('authenticated', 'public.editorial_documents', 'DELETE') THEN
    RAISE EXCEPTION 'Direct editorial document privileges are too broad.';
  END IF;
  IF has_table_privilege('anon', 'public.editorial_entity_references', 'SELECT')
     OR has_table_privilege('authenticated', 'public.editorial_entity_references', 'INSERT') THEN
    RAISE EXCEPTION 'Direct editorial reference privileges are too broad.';
  END IF;
  IF has_function_privilege('anon', 'public.upsert_editorial_document(text,uuid,text,integer,text,jsonb,integer)', 'EXECUTE')
     OR has_function_privilege('authenticated', 'public.upsert_editorial_document(text,uuid,text,integer,text,jsonb,integer)', 'EXECUTE') THEN
    RAISE EXCEPTION 'Anon or authenticated can execute guarded editorial RPC.';
  END IF;
  IF NOT has_function_privilege('service_role', 'public.upsert_editorial_document(text,uuid,text,integer,text,jsonb,integer)', 'EXECUTE')
     OR NOT has_table_privilege('service_role', 'public.editorial_documents', 'SELECT,INSERT,UPDATE,DELETE') THEN
    RAISE EXCEPTION 'Intended service-role path lacks required privileges.';
  END IF;
END;
$$;

ROLLBACK;

