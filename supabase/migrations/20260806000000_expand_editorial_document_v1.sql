-- Expand the curated version-1 editorial JSON grammar without permitting raw HTML or style attributes.

CREATE OR REPLACE FUNCTION public.editorial_document_v1_nodes(p_document jsonb)
RETURNS TABLE(node jsonb, parent_type text, depth integer)
LANGUAGE sql
IMMUTABLE
SET search_path = pg_catalog
AS $$
  WITH RECURSIVE nodes(node, parent_type, depth) AS (
    SELECT value, 'doc'::text, 0
    FROM jsonb_array_elements(COALESCE(p_document->'content', '[]'::jsonb))
    UNION ALL
    SELECT child.value, nodes.node->>'type', nodes.depth + 1
    FROM nodes
    CROSS JOIN LATERAL jsonb_array_elements(COALESCE(nodes.node->'content', '[]'::jsonb)) child
    WHERE nodes.node->>'type' IN ('blockquote', 'bulletList', 'orderedList', 'listItem')
      AND nodes.depth < 13
  )
  SELECT * FROM nodes;
$$;

CREATE OR REPLACE FUNCTION public.validate_editorial_document_v1(p_document jsonb)
RETURNS void
LANGUAGE plpgsql
IMMUTABLE
SET search_path = pg_catalog, public
AS $$
DECLARE
  v_record record;
  v_inline jsonb;
  v_mark jsonb;
  v_href text;
BEGIN
  IF jsonb_typeof(p_document) <> 'object'
     OR (SELECT array_agg(key ORDER BY key) FROM jsonb_object_keys(p_document) key) IS DISTINCT FROM ARRAY['content', 'type']::text[]
     OR p_document->>'type' <> 'doc'
     OR jsonb_typeof(p_document->'content') <> 'array'
     OR jsonb_array_length(p_document->'content') = 0 THEN
    RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Invalid version-1 editorial document root.';
  END IF;

  FOR v_record IN SELECT * FROM public.editorial_document_v1_nodes(p_document) LOOP
    IF jsonb_typeof(v_record.node) <> 'object' OR v_record.depth > 12 THEN
      RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Invalid or excessively nested editorial node.';
    END IF;

    IF v_record.parent_type = 'doc' AND v_record.node->>'type' NOT IN ('paragraph', 'heading', 'blockquote', 'bulletList', 'orderedList', 'horizontalRule')
       OR v_record.parent_type IN ('bulletList', 'orderedList') AND v_record.node->>'type' <> 'listItem'
       OR v_record.parent_type = 'listItem' AND v_record.node->>'type' NOT IN ('paragraph', 'heading', 'blockquote', 'bulletList', 'orderedList', 'horizontalRule')
       OR v_record.parent_type = 'blockquote' AND v_record.node->>'type' NOT IN ('paragraph', 'heading', 'blockquote', 'bulletList', 'orderedList', 'horizontalRule') THEN
      RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Invalid editorial node nesting.';
    END IF;

    CASE v_record.node->>'type'
      WHEN 'paragraph' THEN
        IF EXISTS (SELECT 1 FROM jsonb_object_keys(v_record.node) key WHERE key NOT IN ('type', 'content')) THEN RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Invalid paragraph node.'; END IF;
      WHEN 'heading' THEN
        IF EXISTS (SELECT 1 FROM jsonb_object_keys(v_record.node) key WHERE key NOT IN ('type', 'attrs', 'content'))
           OR jsonb_typeof(v_record.node->'attrs') <> 'object'
           OR (SELECT array_agg(key ORDER BY key) FROM jsonb_object_keys(v_record.node->'attrs') key) IS DISTINCT FROM ARRAY['level']::text[]
           OR (v_record.node->'attrs'->>'level')::integer NOT IN (2, 3, 4) THEN RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Invalid heading node.'; END IF;
      WHEN 'horizontalRule' THEN
        IF (SELECT array_agg(key ORDER BY key) FROM jsonb_object_keys(v_record.node) key) IS DISTINCT FROM ARRAY['type']::text[] THEN RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Invalid horizontal rule.'; END IF;
      WHEN 'blockquote' THEN
        IF EXISTS (SELECT 1 FROM jsonb_object_keys(v_record.node) key WHERE key NOT IN ('type', 'content')) OR jsonb_typeof(v_record.node->'content') <> 'array' OR jsonb_array_length(v_record.node->'content') = 0 THEN RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Invalid blockquote.'; END IF;
      WHEN 'bulletList' THEN
        IF EXISTS (SELECT 1 FROM jsonb_object_keys(v_record.node) key WHERE key NOT IN ('type', 'content')) OR jsonb_typeof(v_record.node->'content') <> 'array' OR jsonb_array_length(v_record.node->'content') = 0 THEN RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Invalid bullet list.'; END IF;
      WHEN 'orderedList' THEN
        IF EXISTS (SELECT 1 FROM jsonb_object_keys(v_record.node) key WHERE key NOT IN ('type', 'attrs', 'content')) OR jsonb_typeof(v_record.node->'content') <> 'array' OR jsonb_array_length(v_record.node->'content') = 0 OR (v_record.node ? 'attrs' AND (jsonb_typeof(v_record.node->'attrs') <> 'object' OR EXISTS (SELECT 1 FROM jsonb_object_keys(v_record.node->'attrs') key WHERE key <> 'start') OR COALESCE((v_record.node->'attrs'->>'start')::integer, 1) < 1)) THEN RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Invalid ordered list.'; END IF;
      WHEN 'listItem' THEN
        IF EXISTS (SELECT 1 FROM jsonb_object_keys(v_record.node) key WHERE key NOT IN ('type', 'content')) OR jsonb_typeof(v_record.node->'content') <> 'array' OR jsonb_array_length(v_record.node->'content') = 0 OR v_record.node->'content'->0->>'type' <> 'paragraph' THEN RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Invalid list item.'; END IF;
      ELSE
        RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Unsupported version-1 block node.';
    END CASE;

    IF v_record.node->>'type' IN ('paragraph', 'heading') THEN
      IF v_record.node ? 'content' AND jsonb_typeof(v_record.node->'content') <> 'array' THEN RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Invalid text-block content.'; END IF;
      FOR v_inline IN SELECT value FROM jsonb_array_elements(COALESCE(v_record.node->'content', '[]'::jsonb)) LOOP
        CASE v_inline->>'type'
          WHEN 'text' THEN
            IF EXISTS (SELECT 1 FROM jsonb_object_keys(v_inline) key WHERE key NOT IN ('type', 'text', 'marks')) OR jsonb_typeof(v_inline->'text') <> 'string' OR v_inline->>'text' = '' THEN RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Invalid text node.'; END IF;
            FOR v_mark IN SELECT value FROM jsonb_array_elements(COALESCE(v_inline->'marks', '[]'::jsonb)) LOOP
              IF v_mark->>'type' IN ('bold', 'italic') THEN
                IF (SELECT array_agg(key ORDER BY key) FROM jsonb_object_keys(v_mark) key) IS DISTINCT FROM ARRAY['type']::text[] THEN RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Invalid inline mark.'; END IF;
              ELSIF v_mark->>'type' = 'link' THEN
                v_href := v_mark->'attrs'->>'href';
                IF EXISTS (SELECT 1 FROM jsonb_object_keys(v_mark) key WHERE key NOT IN ('type', 'attrs')) OR jsonb_typeof(v_mark->'attrs') <> 'object' OR EXISTS (SELECT 1 FROM jsonb_object_keys(v_mark->'attrs') key WHERE key NOT IN ('href', 'target', 'rel', 'class')) OR v_href !~* '^https?://[^[:space:]]+$' THEN RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Invalid or unsafe link mark.'; END IF;
              ELSE RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Unsupported editorial text mark.';
              END IF;
            END LOOP;
            IF (SELECT count(*) FROM jsonb_array_elements(COALESCE(v_inline->'marks', '[]'::jsonb))) <>
               (SELECT count(DISTINCT value->>'type') FROM jsonb_array_elements(COALESCE(v_inline->'marks', '[]'::jsonb))) THEN
              RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Duplicate editorial text mark.';
            END IF;
          WHEN 'hardBreak' THEN
            IF (SELECT array_agg(key ORDER BY key) FROM jsonb_object_keys(v_inline) key) IS DISTINCT FROM ARRAY['type']::text[] THEN RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Invalid hard break.'; END IF;
          WHEN 'artistReference' THEN
            IF (SELECT array_agg(key ORDER BY key) FROM jsonb_object_keys(v_inline) key) IS DISTINCT FROM ARRAY['attrs', 'type']::text[] OR jsonb_typeof(v_inline->'attrs') <> 'object' OR (SELECT array_agg(key ORDER BY key) FROM jsonb_object_keys(v_inline->'attrs') key) IS DISTINCT FROM ARRAY['artistId', 'displayText', 'occurrenceId']::text[] OR btrim(v_inline->'attrs'->>'displayText') = '' THEN RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Invalid artist reference.'; END IF;
            PERFORM (v_inline->'attrs'->>'artistId')::uuid;
            PERFORM (v_inline->'attrs'->>'occurrenceId')::uuid;
          ELSE RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Unsupported inline node.';
        END CASE;
      END LOOP;
    END IF;
  END LOOP;

  IF (SELECT count(*) FROM public.editorial_document_v1_nodes(p_document) n, LATERAL jsonb_array_elements(COALESCE(n.node->'content', '[]'::jsonb)) i WHERE n.node->>'type' IN ('paragraph', 'heading') AND i->>'type' = 'artistReference') <>
     (SELECT count(DISTINCT i->'attrs'->>'occurrenceId') FROM public.editorial_document_v1_nodes(p_document) n, LATERAL jsonb_array_elements(COALESCE(n.node->'content', '[]'::jsonb)) i WHERE n.node->>'type' IN ('paragraph', 'heading') AND i->>'type' = 'artistReference') THEN
    RAISE EXCEPTION USING ERRCODE = '23505', MESSAGE = 'Duplicate artist reference occurrence ID.';
  END IF;
END;
$$;

CREATE OR REPLACE FUNCTION public.editorial_document_v1_references(p_document jsonb)
RETURNS TABLE(inline_node jsonb)
LANGUAGE sql
IMMUTABLE
SET search_path = pg_catalog, public
AS $$
  SELECT inline.value
  FROM public.editorial_document_v1_nodes(p_document) node
  CROSS JOIN LATERAL jsonb_array_elements(COALESCE(node.node->'content', '[]'::jsonb)) inline
  WHERE node.node->>'type' IN ('paragraph', 'heading') AND inline.value->>'type' = 'artistReference';
$$;

CREATE OR REPLACE FUNCTION public.upsert_editorial_document(
  p_document_type text, p_owner_artist_id uuid, p_locale text, p_schema_version integer,
  p_status text, p_document jsonb, p_expected_revision integer
)
RETURNS TABLE (id uuid, document_type text, owner_artist_id uuid, locale text, schema_version integer, status text, revision integer, updated_at timestamptz)
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
  IF p_document_type IS DISTINCT FROM 'artist_biography' OR p_locale NOT IN ('en', 'es') OR p_schema_version IS DISTINCT FROM 1 OR p_status NOT IN ('draft', 'published') THEN
    RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Unsupported editorial document parameters.';
  END IF;
  IF p_expected_revision IS NULL OR p_expected_revision < 0 THEN
    RAISE EXCEPTION USING ERRCODE = '22023', MESSAGE = 'Expected revision must be zero for create or positive for update.';
  END IF;
  IF NOT EXISTS (SELECT 1 FROM public.artists WHERE artists.id = p_owner_artist_id) THEN
    RAISE EXCEPTION USING ERRCODE = '23503', MESSAGE = 'Editorial owner artist does not exist.';
  END IF;

  PERFORM public.validate_editorial_document_v1(p_document);
  FOR v_reference IN SELECT inline_node FROM public.editorial_document_v1_references(p_document) LOOP
    v_target := (v_reference->'attrs'->>'artistId')::uuid;
    IF NOT EXISTS (SELECT 1 FROM public.artists WHERE artists.id = v_target) THEN
      RAISE EXCEPTION USING ERRCODE = '23503', MESSAGE = 'Referenced artist does not exist.';
    END IF;
  END LOOP;

  SELECT * INTO v_existing FROM public.editorial_documents d
  WHERE d.document_type = p_document_type AND d.owner_artist_id = p_owner_artist_id AND d.locale = p_locale
  FOR UPDATE;

  IF FOUND THEN
    IF p_expected_revision = 0 OR v_existing.revision <> p_expected_revision THEN
      RAISE EXCEPTION USING ERRCODE = '40001', MESSAGE = 'Editorial document revision conflict.';
    END IF;
    UPDATE public.editorial_documents d
    SET schema_version = p_schema_version, document = p_document, status = p_status, revision = d.revision + 1
    WHERE d.id = v_existing.id RETURNING d.id INTO v_document_id;
  ELSE
    IF p_expected_revision <> 0 THEN RAISE EXCEPTION USING ERRCODE = '40001', MESSAGE = 'Editorial document revision conflict.'; END IF;
    INSERT INTO public.editorial_documents (document_type, owner_artist_id, locale, schema_version, document, status)
    VALUES (p_document_type, p_owner_artist_id, p_locale, p_schema_version, p_document, p_status)
    RETURNING editorial_documents.id INTO v_document_id;
  END IF;

  DELETE FROM public.editorial_entity_references r WHERE r.editorial_document_id = v_document_id;
  INSERT INTO public.editorial_entity_references (editorial_document_id, occurrence_id, entity_type, target_artist_id)
  SELECT v_document_id, (inline_node->'attrs'->>'occurrenceId')::uuid, 'artist', (inline_node->'attrs'->>'artistId')::uuid
  FROM public.editorial_document_v1_references(p_document);

  RETURN QUERY SELECT d.id, d.document_type, d.owner_artist_id, d.locale, d.schema_version, d.status, d.revision, d.updated_at
  FROM public.editorial_documents d WHERE d.id = v_document_id;
END;
$$;

REVOKE ALL ON FUNCTION public.editorial_document_v1_nodes(jsonb) FROM PUBLIC, anon, authenticated;
REVOKE ALL ON FUNCTION public.editorial_document_v1_references(jsonb) FROM PUBLIC, anon, authenticated;
GRANT EXECUTE ON FUNCTION public.editorial_document_v1_nodes(jsonb) TO service_role;
GRANT EXECUTE ON FUNCTION public.editorial_document_v1_references(jsonb) TO service_role;

COMMENT ON FUNCTION public.validate_editorial_document_v1(jsonb) IS
  'Validates curated semantic version-1 editorial JSON: paragraphs, H2-H4, lists, blockquotes, horizontal rules, safe HTTP(S) links, and artist references.';
