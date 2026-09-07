BEGIN;

-- Reverts 20260905160000_rewrite_fefita_la_grande_biography.sql.
--
-- Caveat, stated plainly: the pre-pass English document was not captured as
-- JSON before it was overwritten. It is reconstructed here from the legacy
-- markdown mirror recorded at the time — three plain paragraphs, no marks and
-- no references, which is exactly the shape of the 3-block document that was
-- stored. The text is verbatim; the node structure is inferred.
--
-- Note that restoring this reinstates the false birth name "Doña Josefa Mateo"
-- and the unsupported sort_name, which is what a faithful revert means here.

UPDATE editorial_documents
SET document = $json${"type":"doc","content":[{"type":"paragraph","content":[{"type":"text","text":"Fefita la Grande, born Doña Josefa Mateo in 1943 in San Ignacio de Sabaneta in the Santiago Rodríguez province, is a towering figure in Dominican merengue típico and a national cultural icon. She began playing the accordion as a child in an era when it was virtually unheard of for a woman to play the instrument professionally, and she not only mastered it but became one of its greatest exponents, earning a title — la Grande — that is entirely without irony."}]},{"type":"paragraph","content":[{"type":"text","text":"Her playing is explosive, technically formidable, and suffused with an earthy vitality that comes from a lifetime of deep connection to the music of the Dominican countryside. For decades she was the most prominent female voice in merengue típico, performing in a space that was socially and professionally hostile to women and prevailing through sheer talent, determination, and personality."}]},{"type":"paragraph","content":[{"type":"text","text":"Fefita la Grande has been the subject of documentaries, cultural honors, and academic studies, and the Dominican state has recognized her as a living national treasure. She has performed across the world, bringing the accordion music of the Cibao region to audiences who understand, upon hearing her play, that they are in the presence of something genuinely extraordinary. At an age when most performers have long since retired, she continues to perform with undiminished fire, a reminder that great artistry is ageless."}]}]}$json$::jsonb,
    revision = 1,
    updated_at = now()
WHERE id = 'c835c1bd-68e7-4663-8506-af619a5cfe3c';

DELETE FROM editorial_entity_references WHERE editorial_document_id = 'c835c1bd-68e7-4663-8506-af619a5cfe3c';

-- The Spanish document did not exist before this pass; its references go with
-- it through the ON DELETE CASCADE on editorial_document_id.
DELETE FROM editorial_documents WHERE id = 'd73e9a09-a134-4a15-800b-365224ffee51';

UPDATE artists
SET bio_en = $sql$Fefita la Grande, born Doña Josefa Mateo in 1943 in San Ignacio de Sabaneta in the Santiago Rodríguez province, is a towering figure in Dominican merengue típico and a national cultural icon. She began playing the accordion as a child in an era when it was virtually unheard of for a woman to play the instrument professionally, and she not only mastered it but became one of its greatest exponents, earning a title — la Grande — that is entirely without irony.

Her playing is explosive, technically formidable, and suffused with an earthy vitality that comes from a lifetime of deep connection to the music of the Dominican countryside. For decades she was the most prominent female voice in merengue típico, performing in a space that was socially and professionally hostile to women and prevailing through sheer talent, determination, and personality.

Fefita la Grande has been the subject of documentaries, cultural honors, and academic studies, and the Dominican state has recognized her as a living national treasure. She has performed across the world, bringing the accordion music of the Cibao region to audiences who understand, upon hearing her play, that they are in the presence of something genuinely extraordinary. At an age when most performers have long since retired, she continues to perform with undiminished fire, a reminder that great artistry is ageless.$sql$,
    bio_es = NULL,
    sort_name = 'García Ramírez, Manuela Josefa',
    occupations = '["musician","vocalist","bandleader","composer"]'::jsonb,
    updated_at = now()
WHERE id = '9333da06-ad03-44eb-9b81-c21d0ccdd0ea';

-- Restores the miscapitalised form in the six documents this pass corrected.
UPDATE editorial_documents SET document = (replace(document::text, 'Fefita la Grande', 'Fefita La Grande'))::jsonb, updated_at = now() WHERE id = '4f8112db-8d99-409e-9373-cd7b0ba4f578';  -- La Fiera Típica (en)
UPDATE editorial_documents SET document = (replace(document::text, 'Fefita la Grande', 'Fefita La Grande'))::jsonb, updated_at = now() WHERE id = '1294b6d7-9df8-44c9-9afa-046c26941721';  -- La Fiera Típica (es)
UPDATE editorial_documents SET document = (replace(document::text, 'Fefita la Grande', 'Fefita La Grande'))::jsonb, updated_at = now() WHERE id = 'be9e8ccf-0032-4189-be7f-717282da1dd4';  -- Maridalia Hernández (en)
UPDATE editorial_documents SET document = (replace(document::text, 'Fefita la Grande', 'Fefita La Grande'))::jsonb, updated_at = now() WHERE id = 'a441f11a-7746-413f-a598-9793c9f43c1e';  -- Maridalia Hernández (es)
UPDATE editorial_documents SET document = (replace(document::text, 'Fefita la Grande', 'Fefita La Grande'))::jsonb, updated_at = now() WHERE id = '1dfef766-76e8-480d-9822-62d241cbdc31';  -- Shino Aguakate (en)
UPDATE editorial_documents SET document = (replace(document::text, 'Fefita la Grande', 'Fefita La Grande'))::jsonb, updated_at = now() WHERE id = '447cb75f-4aa8-4ffd-8f44-2a141bb86583';  -- Shino Aguakate (es)

UPDATE artists a
SET bio_en = replace(a.bio_en, 'Fefita la Grande', 'Fefita La Grande'),
    bio_es = replace(a.bio_es, 'Fefita la Grande', 'Fefita La Grande'),
    updated_at = now()
FROM editorial_documents d
WHERE d.owner_artist_id = a.id
  AND d.id IN ('4f8112db-8d99-409e-9373-cd7b0ba4f578', '1294b6d7-9df8-44c9-9afa-046c26941721', 'be9e8ccf-0032-4189-be7f-717282da1dd4', 'a441f11a-7746-413f-a598-9793c9f43c1e', '1dfef766-76e8-480d-9822-62d241cbdc31', '447cb75f-4aa8-4ffd-8f44-2a141bb86583');

COMMIT;
