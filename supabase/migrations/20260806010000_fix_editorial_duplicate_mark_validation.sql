-- Fix a false positive when separate inline nodes have identical JSON and marks.
-- The expansion migration grouped nodes by JSON value instead of checking each node independently.
DO $migration$
DECLARE
  v_definition text;
  v_corrected text;
BEGIN
  SELECT pg_get_functiondef('public.validate_editorial_document_v1(jsonb)'::regprocedure)
  INTO v_definition;

  IF strpos(v_definition, 'COALESCE(v_inline->''marks'', ''[]''::jsonb))) <>') > 0 THEN
    RAISE NOTICE 'Duplicate-mark validation is already scoped per inline node.';
    RETURN;
  END IF;

  v_corrected := regexp_replace(
    v_definition,
    'IF EXISTS \(\s*SELECT 1 FROM jsonb_array_elements\(COALESCE\(v_record\.node->''content'', ''\[\]''::jsonb\)\) inline_node\s*CROSS JOIN LATERAL jsonb_array_elements\(COALESCE\(inline_node->''marks'', ''\[\]''::jsonb\)\) mark\s*GROUP BY inline_node\s*HAVING count\(\*\) <> count\(DISTINCT mark->>''type''\)\s*\) THEN RAISE EXCEPTION USING ERRCODE = ''22023'', MESSAGE = ''Duplicate editorial text mark\.''; END IF;',
    'IF EXISTS (
        SELECT 1
        FROM jsonb_array_elements(COALESCE(v_record.node->''content'', ''[]''::jsonb)) inline_node
        WHERE (SELECT count(*) FROM jsonb_array_elements(COALESCE(inline_node->''marks'', ''[]''::jsonb))) <>
              (SELECT count(DISTINCT value->>''type'') FROM jsonb_array_elements(COALESCE(inline_node->''marks'', ''[]''::jsonb)))
      ) THEN RAISE EXCEPTION USING ERRCODE = ''22023'', MESSAGE = ''Duplicate editorial text mark.''; END IF;',
    'n'
  );

  IF v_corrected = v_definition THEN
    RAISE EXCEPTION 'Expected duplicate-mark validator block was not found; refusing a partial hotfix.';
  END IF;

  EXECUTE v_corrected;
END;
$migration$;

COMMENT ON FUNCTION public.validate_editorial_document_v1(jsonb) IS
  'Validates curated semantic version-1 editorial JSON and checks duplicate marks independently per inline node.';
