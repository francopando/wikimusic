BEGIN;

-- Reverts 20260905240000_rewrite_alfredo_polonia_biography.sql.
-- Restores the prior English document and legacy mirror, drops the Spanish
-- document that did not exist before, and puts birth_place and genres back.
-- This reinstates the earlier text's factual errors: Santiago as his birthplace,
-- ninety-five as his age at death, and no mention of plena at all.

UPDATE editorial_documents SET document = $json${"type":"doc","content":[{"type":"paragraph","content":[{"text":"Alfredo Polonia was a Dominican musician born in 1929 in Santiago whose career as a practitioner and keeper of merengue típico — the traditional accordion-driven style of merengue rooted in the Cibao region — made him one of the genre's most important guardians. Merengue típico, also called perico ripiao, is the oldest and most folkloric form of merengue, built around the accordion, the tambora drum, and the güira, and it represents the rural Dominican musical tradition in its most unadorned and powerful form.","type":"text"}]},{"type":"paragraph","content":[{"text":"Polonia devoted his career to this style at a time when orchestrated and electrified merengue was increasingly dominant in urban markets, helping to ensure that the traditional sound retained its vitality and its audience. His recordings documented a form of music that might otherwise have been pushed to the margins of commercial indifference, and his performances kept alive the connection between merengue and the agricultural communities of the Cibao where it originated.","type":"text"}]},{"type":"paragraph","content":[{"text":"Polonia passed away in 2025 at the age of ninety-five, having spent nearly a century as a living link to Dominican musical roots.","type":"text"}]}]}$json$::jsonb, revision = 1, updated_at = now() WHERE id = 'cd183864-5634-49f9-baf5-40d897db2abb';

DELETE FROM editorial_documents WHERE id = 'd0ac595a-cf64-4ef2-95e7-8e2d6f384e07';

UPDATE artists
SET bio_en = $sql$Alfredo Polonia was a Dominican musician born in 1929 in Santiago whose career as a practitioner and keeper of merengue típico — the traditional accordion-driven style of merengue rooted in the Cibao region — made him one of the genre's most important guardians. Merengue típico, also called perico ripiao, is the oldest and most folkloric form of merengue, built around the accordion, the tambora drum, and the güira, and it represents the rural Dominican musical tradition in its most unadorned and powerful form.

Polonia devoted his career to this style at a time when orchestrated and electrified merengue was increasingly dominant in urban markets, helping to ensure that the traditional sound retained its vitality and its audience. His recordings documented a form of music that might otherwise have been pushed to the margins of commercial indifference, and his performances kept alive the connection between merengue and the agricultural communities of the Cibao where it originated.

Polonia passed away in 2025 at the age of ninety-five, having spent nearly a century as a living link to Dominican musical roots.$sql$,
    bio_es = NULL,
    birth_place = $sql$Bonao$sql$,
    genres = ARRAY['folklore']::text[],
    updated_at = now()
WHERE id = '3b6f60a1-2baa-4e2c-acec-452c5b026397';

COMMIT;
