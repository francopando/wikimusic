-- Mangulina Editorial Document Engine, Phase 1 (additive foundation only).
-- Legacy artist biography columns and their readers/writers are intentionally untouched.

CREATE TABLE public.editorial_documents (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  document_type text NOT NULL CHECK (document_type IN ('artist_biography')),
  locale text NOT NULL CHECK (locale IN ('en', 'es')),
  schema_version integer NOT NULL DEFAULT 1 CHECK (schema_version = 1),
  document jsonb NOT NULL,
  status text NOT NULL DEFAULT 'draft' CHECK (status IN ('draft', 'published')),
  owner_artist_id uuid REFERENCES public.artists(id) ON DELETE CASCADE,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  revision integer NOT NULL DEFAULT 1 CHECK (revision > 0),
  CONSTRAINT editorial_documents_artist_biography_owner_check CHECK (
    document_type <> 'artist_biography' OR owner_artist_id IS NOT NULL
  )
);

CREATE UNIQUE INDEX editorial_documents_artist_biography_locale_uidx
  ON public.editorial_documents (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography';
CREATE INDEX editorial_documents_type_status_idx
  ON public.editorial_documents (document_type, status);
CREATE INDEX editorial_documents_owner_locale_idx
  ON public.editorial_documents (owner_artist_id, locale);

CREATE TABLE public.editorial_entity_references (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  editorial_document_id uuid NOT NULL
    REFERENCES public.editorial_documents(id) ON DELETE CASCADE,
  occurrence_id uuid NOT NULL,
  entity_type text NOT NULL CHECK (entity_type = 'artist'),
  target_artist_id uuid REFERENCES public.artists(id) ON DELETE RESTRICT,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT editorial_entity_references_artist_target_check CHECK (
    entity_type <> 'artist' OR target_artist_id IS NOT NULL
  ),
  UNIQUE (editorial_document_id, occurrence_id)
);

CREATE INDEX editorial_entity_references_document_idx
  ON public.editorial_entity_references (editorial_document_id);
CREATE INDEX editorial_entity_references_target_artist_idx
  ON public.editorial_entity_references (target_artist_id);
CREATE INDEX editorial_entity_references_type_target_idx
  ON public.editorial_entity_references (entity_type, target_artist_id);

CREATE OR REPLACE FUNCTION public.editorial_set_updated_at()
RETURNS trigger
LANGUAGE plpgsql
SET search_path = pg_catalog
AS $$
BEGIN
  NEW.updated_at := now();
  RETURN NEW;
END;
$$;

CREATE TRIGGER editorial_documents_updated_at
  BEFORE UPDATE ON public.editorial_documents
  FOR EACH ROW EXECUTE FUNCTION public.editorial_set_updated_at();
CREATE TRIGGER editorial_entity_references_updated_at
  BEFORE UPDATE ON public.editorial_entity_references
  FOR EACH ROW EXECUTE FUNCTION public.editorial_set_updated_at();

CREATE OR REPLACE FUNCTION public.validate_editorial_document_v1(p_document jsonb)
RETURNS void
LANGUAGE plpgsql
IMMUTABLE
SET search_path = pg_catalog
AS $$
DECLARE
  v_paragraph jsonb;
  v_inline jsonb;
  v_mark jsonb;
  v_occurrence text;
  v_seen text[] := ARRAY[]::text[];
BEGIN
  IF jsonb_typeof(p_document) <> 'object'
     OR (SELECT array_agg(key ORDER BY key) FROM jsonb_object_keys(p_document) key)
        IS DISTINCT FROM ARRAY['content', 'type']::text[]
     OR p_document->>'type' <> 'doc'
     OR jsonb_typeof(p_document->'content') <> 'array'
     OR jsonb_array_length(p_document->'content') = 0 THEN
    RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Invalid version-1 editorial document root.';
  END IF;

  FOR v_paragraph IN SELECT value FROM jsonb_array_elements(p_document->'content') LOOP
    IF jsonb_typeof(v_paragraph) <> 'object'
       OR NOT (v_paragraph ? 'type')
       OR v_paragraph->>'type' <> 'paragraph'
       OR EXISTS (SELECT 1 FROM jsonb_object_keys(v_paragraph) key WHERE key NOT IN ('type', 'content'))
       OR (v_paragraph ? 'content' AND jsonb_typeof(v_paragraph->'content') <> 'array') THEN
      RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Invalid version-1 paragraph node.';
    END IF;

    FOR v_inline IN SELECT value FROM jsonb_array_elements(COALESCE(v_paragraph->'content', '[]'::jsonb)) LOOP
      IF jsonb_typeof(v_inline) <> 'object' OR NOT (v_inline ? 'type') THEN
        RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Invalid version-1 inline node.';
      END IF;

      CASE v_inline->>'type'
        WHEN 'text' THEN
          IF EXISTS (SELECT 1 FROM jsonb_object_keys(v_inline) key WHERE key NOT IN ('type', 'text', 'marks'))
             OR jsonb_typeof(v_inline->'text') <> 'string'
             OR v_inline->>'text' = ''
             OR (v_inline ? 'marks' AND jsonb_typeof(v_inline->'marks') <> 'array') THEN
            RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Invalid version-1 text node.';
          END IF;
          FOR v_mark IN SELECT value FROM jsonb_array_elements(COALESCE(v_inline->'marks', '[]'::jsonb)) LOOP
            IF jsonb_typeof(v_mark) <> 'object'
               OR (SELECT array_agg(key ORDER BY key) FROM jsonb_object_keys(v_mark) key)
                  IS DISTINCT FROM ARRAY['type']::text[]
               OR v_mark->>'type' NOT IN ('bold', 'italic') THEN
              RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Unsupported editorial text mark.';
            END IF;
          END LOOP;
          IF (SELECT count(*) FROM jsonb_array_elements(COALESCE(v_inline->'marks', '[]'::jsonb))) <>
             (SELECT count(DISTINCT value->>'type') FROM jsonb_array_elements(COALESCE(v_inline->'marks', '[]'::jsonb))) THEN
            RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Duplicate editorial text mark.';
          END IF;
        WHEN 'hardBreak' THEN
          IF (SELECT array_agg(key ORDER BY key) FROM jsonb_object_keys(v_inline) key)
             IS DISTINCT FROM ARRAY['type']::text[] THEN
            RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Invalid version-1 hardBreak node.';
          END IF;
        WHEN 'artistReference' THEN
          IF (SELECT array_agg(key ORDER BY key) FROM jsonb_object_keys(v_inline) key)
             IS DISTINCT FROM ARRAY['attrs', 'type']::text[]
             OR jsonb_typeof(v_inline->'attrs') <> 'object'
             OR (SELECT array_agg(key ORDER BY key) FROM jsonb_object_keys(v_inline->'attrs') key)
                IS DISTINCT FROM ARRAY['artistId', 'displayText', 'occurrenceId']::text[] THEN
            RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Invalid artistReference attributes.';
          END IF;
          BEGIN
            PERFORM (v_inline->'attrs'->>'artistId')::uuid;
            PERFORM (v_inline->'attrs'->>'occurrenceId')::uuid;
          EXCEPTION WHEN invalid_text_representation THEN
            RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Artist reference IDs must be UUIDs.';
          END;
          IF btrim(v_inline->'attrs'->>'displayText') = '' THEN
            RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Artist reference displayText must be nonempty.';
          END IF;
          v_occurrence := v_inline->'attrs'->>'occurrenceId';
          IF v_occurrence = ANY(v_seen) THEN
            RAISE EXCEPTION USING ERRCODE = '23505', MESSAGE = 'Duplicate artist reference occurrence ID.';
          END IF;
          v_seen := array_append(v_seen, v_occurrence);
        ELSE
          RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Unsupported version-1 inline node type.';
      END CASE;
    END LOOP;
  END LOOP;
END;
$$;

CREATE OR REPLACE FUNCTION public.upsert_editorial_document(
  p_document_type text,
  p_owner_artist_id uuid,
  p_locale text,
  p_schema_version integer,
  p_status text,
  p_document jsonb,
  p_expected_revision integer
)
RETURNS TABLE (
  id uuid,
  document_type text,
  owner_artist_id uuid,
  locale text,
  schema_version integer,
  status text,
  revision integer,
  updated_at timestamptz
)
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = pg_catalog, public
AS $$
DECLARE
  v_existing public.editorial_documents%ROWTYPE;
  v_document_id uuid;
  v_reference jsonb;
  v_target uuid;
BEGIN
  IF p_document_type IS DISTINCT FROM 'artist_biography' THEN
    RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Unsupported editorial document type.';
  END IF;
  IF p_locale NOT IN ('en', 'es') THEN
    RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Unsupported editorial locale.';
  END IF;
  IF p_schema_version IS DISTINCT FROM 1 THEN
    RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Unsupported editorial schema version.';
  END IF;
  IF p_status NOT IN ('draft', 'published') THEN
    RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Unsupported editorial status.';
  END IF;
  IF p_expected_revision IS NULL OR p_expected_revision < 0 THEN
    RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Expected revision must be zero for create or positive for update.';
  END IF;
  IF NOT EXISTS (SELECT 1 FROM public.artists WHERE artists.id = p_owner_artist_id) THEN
    RAISE EXCEPTION USING ERRCODE = '23503', MESSAGE = 'Editorial owner artist does not exist.';
  END IF;

  PERFORM public.validate_editorial_document_v1(p_document);

  FOR v_reference IN
    SELECT inline_node
    FROM jsonb_array_elements(p_document->'content') paragraph,
         jsonb_array_elements(COALESCE(paragraph->'content', '[]'::jsonb)) inline_node
    WHERE inline_node->>'type' = 'artistReference'
  LOOP
    v_target := (v_reference->'attrs'->>'artistId')::uuid;
    IF NOT EXISTS (SELECT 1 FROM public.artists WHERE artists.id = v_target) THEN
      RAISE EXCEPTION USING ERRCODE = '23503', MESSAGE = 'Referenced artist does not exist.';
    END IF;
  END LOOP;

  SELECT * INTO v_existing
  FROM public.editorial_documents d
  WHERE d.document_type = p_document_type
    AND d.owner_artist_id = p_owner_artist_id
    AND d.locale = p_locale
  FOR UPDATE;

  IF FOUND THEN
    IF p_expected_revision = 0 OR v_existing.revision <> p_expected_revision THEN
      RAISE EXCEPTION USING ERRCODE = '40001', MESSAGE = 'Editorial document revision conflict.';
    END IF;
    UPDATE public.editorial_documents d
    SET schema_version = p_schema_version,
        document = p_document,
        status = p_status,
        revision = d.revision + 1
    WHERE d.id = v_existing.id
    RETURNING d.id INTO v_document_id;
  ELSE
    IF p_expected_revision <> 0 THEN
      RAISE EXCEPTION USING ERRCODE = '40001', MESSAGE = 'Editorial document revision conflict.';
    END IF;
    INSERT INTO public.editorial_documents (
      document_type, owner_artist_id, locale, schema_version, document, status
    ) VALUES (
      p_document_type, p_owner_artist_id, p_locale, p_schema_version, p_document, p_status
    ) RETURNING editorial_documents.id INTO v_document_id;
  END IF;

  DELETE FROM public.editorial_entity_references r
  WHERE r.editorial_document_id = v_document_id;

  INSERT INTO public.editorial_entity_references (
    editorial_document_id, occurrence_id, entity_type, target_artist_id
  )
  SELECT v_document_id,
         (inline_node->'attrs'->>'occurrenceId')::uuid,
         'artist',
         (inline_node->'attrs'->>'artistId')::uuid
  FROM jsonb_array_elements(p_document->'content') paragraph,
       jsonb_array_elements(COALESCE(paragraph->'content', '[]'::jsonb)) inline_node
  WHERE inline_node->>'type' = 'artistReference';

  RETURN QUERY
  SELECT d.id, d.document_type, d.owner_artist_id, d.locale,
         d.schema_version, d.status, d.revision, d.updated_at
  FROM public.editorial_documents d WHERE d.id = v_document_id;
END;
$$;

ALTER TABLE public.editorial_documents ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.editorial_entity_references ENABLE ROW LEVEL SECURITY;

CREATE POLICY editorial_documents_service_role_all
  ON public.editorial_documents FOR ALL TO service_role
  USING (true) WITH CHECK (true);
CREATE POLICY editorial_entity_references_service_role_all
  ON public.editorial_entity_references FOR ALL TO service_role
  USING (true) WITH CHECK (true);

REVOKE ALL ON public.editorial_documents FROM PUBLIC, anon, authenticated;
REVOKE ALL ON public.editorial_entity_references FROM PUBLIC, anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.editorial_documents TO service_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.editorial_entity_references TO service_role;
REVOKE ALL ON FUNCTION public.validate_editorial_document_v1(jsonb) FROM PUBLIC, anon, authenticated;
GRANT EXECUTE ON FUNCTION public.validate_editorial_document_v1(jsonb) TO service_role;
REVOKE ALL ON FUNCTION public.upsert_editorial_document(text, uuid, text, integer, text, jsonb, integer)
  FROM PUBLIC, anon, authenticated;
GRANT EXECUTE ON FUNCTION public.upsert_editorial_document(text, uuid, text, integer, text, jsonb, integer)
  TO service_role;

COMMENT ON TABLE public.editorial_documents IS
  'Versioned structured editorial prose. Phase 1 supports only artist_biography; no public reader uses it.';
COMMENT ON COLUMN public.editorial_documents.document IS
  'Authoritative Tiptap/ProseMirror-compatible JSON for prose, formatting, visible reference wording, and occurrence placement.';
COMMENT ON TABLE public.editorial_entity_references IS
  'Derived immutable-identity relation set for editorial reference integrity and reverse lookups.';
COMMENT ON FUNCTION public.upsert_editorial_document(text, uuid, text, integer, text, jsonb, integer) IS
  'Service-role-only atomic write. expected_revision=0 creates; a positive exact revision updates and increments.';
