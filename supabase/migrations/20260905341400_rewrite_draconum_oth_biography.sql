BEGIN;

-- Rewrite the catalogue entry for Draconum Oth.
--
-- Draconum Oth. Filler in English, nothing in Spanish, no real name, no dates
-- -- and filed as a singer. He is a drummer, and he does not sing.
--
-- primary_role changed from singer to instrumentalist.
--
-- SOURCES: his Encyclopaedia Metallum artist entry, which gives the legal name
-- Frank Sanchez, the birth on 7 September 1990, the Dominican Republic as place
-- of birth, and the full band list. Apofis Imn's entry for the years -- bass
-- from 2010 to 2012, drums from 2012 -- and for the band itself: Dominican
-- black metal formed in 2010 out of Amon, which had run since 2001, based in
-- Santo Domingo early and in Buenos Aires later. His credits on Apofis Imn's
-- EPs "La palabra de Satan" (2015) and "Traicionado por Dios" (2019), both on
-- drums. Exsanguination Throne's entry for drums since 2016. Diablastador's
-- album "Regnum Nefario", released 18 June 2023, where he plays drums alongside
-- Agus and Gletus on guitars and Franco Fuentes on bass; the band describes
-- itself as being from the Dominican Republic and Argentina.
--
-- FLAGGED: the genre. There is no metal in the taxonomy, so this keeps the
-- rock the row already had.
-- FLAGGED: status. Left at needs_review; no image on the row.
--
-- Applied directly over DATABASE_URL as part of an editorial pass. No Vercel
-- function ran and nothing was revalidated; the profile reaches the public site
-- on its own within the seven-day ISR fallback, or sooner if a batch sweep is
-- run at the end of the pass.
--
-- This file reproduces the change from the pre-pass state. Both it and its
-- rollback were generated from state captured live either side of the write,
-- not reconstructed afterwards.

UPDATE artists SET
       name = 'Draconum Oth',
       sort_name = 'Sánchez, Frank',
       type = 'solo_artist',
       status = 'needs_review',
       gender = 'male',
       ended = FALSE,
       primary_role = 'instrumentalist',
       primary_genre = 'rock',
       date_of_birth = '1990-09-07',
       birth_year = 1990,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Frank',
       middle_name = NULL,
       last_name = 'Sánchez',
       second_last_name = NULL,
       stage_name = 'Draconum Oth',
       aliases = ARRAY['Draconum Oth Neghor', 'Frank Sánchez']::text[],
       occupations = '["drummer","bassist"]'::jsonb,
       instruments = ARRAY['drums', 'bass']::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Dominican metal drummer born 1990; Apofis Imn, Exsanguination Throne and Diablastador',
       bio_en = 'Draconum Oth — Frank Sánchez, born on 7 September 1990 — is a Dominican metal drummer. He records as Draconum Oth Neghor, and he plays bass as well.

**Apofis Imn**

He joined Apofis Imn on bass in 2010 and moved to the drum stool in 2012, where he has stayed. The band is Dominican black metal, formed that same year out of Amon, which had been running since 2001; it started in Santo Domingo and later worked out of Buenos Aires.

He plays on their EPs La Palabra de Satán, from 2015, and Traicionado por Dios, from 2019.

**Three bands at once**

Dominican metal is small enough that its players hold several bands simultaneously, and he holds more than most. He has been on drums in Exsanguination Throne since 2016, and he played on Diablastador’s album Regnum Nefario, released in June 2023, with Agus and Gletus on guitars and Franco Fuentes on bass.

Diablastador describes itself as coming from the Dominican Republic and Argentina at once, which is the same axis Apofis Imn moved along. Between Santo Domingo and Buenos Aires there is a working circuit that has never had anything to do with the Caribbean music the island is known for.

Lesa Humanidad, Razgos and Devast came earlier. What that adds up to is a session drummer’s career inside a scene with no sessions to be paid for — he plays because the bands need somebody who can, and there are not many.',
       bio_es = 'Draconum Oth —Frank Sánchez, nacido el 7 de septiembre de 1990— es un baterista de metal dominicano. Graba como Draconum Oth Neghor, y toca también el bajo.

**Apofis Imn**

Entró a Apofis Imn en el bajo en 2010 y se pasó a la batería en 2012, donde se quedó. La banda es black metal dominicano, formada ese mismo año a partir de Amon, que venía desde 2001; empezó en Santo Domingo y después trabajó desde Buenos Aires.

Toca en sus EP La Palabra de Satán, de 2015, y Traicionado por Dios, de 2019.

**Tres bandas a la vez**

El metal dominicano es lo bastante pequeño como para que sus músicos sostengan varias bandas al mismo tiempo, y él sostiene más que casi nadie. Está en la batería de Exsanguination Throne desde 2016, y tocó en el disco de Diablastador Regnum Nefario, salido en junio de 2023, con Agus y Gletus en las guitarras y Franco Fuentes en el bajo.

Diablastador se describe a sí misma como de la República Dominicana y de Argentina a la vez, que es el mismo eje por el que se movió Apofis Imn. Entre Santo Domingo y Buenos Aires hay un circuito de trabajo que nunca ha tenido nada que ver con la música caribeña por la que se conoce a la isla.

Lesa Humanidad, Razgos y Devast vinieron antes. Lo que suma todo eso es una carrera de baterista de sesión dentro de una escena donde no hay sesiones que pagar: toca porque las bandas necesitan a alguien que pueda, y no hay muchos.',
       updated_at = now()
 WHERE slug = 'draconum-oth';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'draconum-oth')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'draconum-oth')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Draconum Oth — Frank Sánchez, born on 7 September 1990 — is a Dominican metal drummer. He records as Draconum Oth Neghor, and he plays bass as well.","type":"text"}]},{"type":"paragraph","content":[{"text":"Apofis Imn","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He joined Apofis Imn on bass in 2010 and moved to the drum stool in 2012, where he has stayed. The band is Dominican black metal, formed that same year out of Amon, which had been running since 2001; it started in Santo Domingo and later worked out of Buenos Aires.","type":"text"}]},{"type":"paragraph","content":[{"text":"He plays on their EPs La Palabra de Satán, from 2015, and Traicionado por Dios, from 2019.","type":"text"}]},{"type":"paragraph","content":[{"text":"Three bands at once","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dominican metal is small enough that its players hold several bands simultaneously, and he holds more than most. He has been on drums in Exsanguination Throne since 2016, and he played on Diablastador’s album Regnum Nefario, released in June 2023, with Agus and Gletus on guitars and Franco Fuentes on bass.","type":"text"}]},{"type":"paragraph","content":[{"text":"Diablastador describes itself as coming from the Dominican Republic and Argentina at once, which is the same axis Apofis Imn moved along. Between Santo Domingo and Buenos Aires there is a working circuit that has never had anything to do with the Caribbean music the island is known for.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lesa Humanidad, Razgos and Devast came earlier. What that adds up to is a session drummer’s career inside a scene with no sessions to be paid for — he plays because the bands need somebody who can, and there are not many.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'draconum-oth'), 2)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Draconum Oth —Frank Sánchez, nacido el 7 de septiembre de 1990— es un baterista de metal dominicano. Graba como Draconum Oth Neghor, y toca también el bajo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Apofis Imn","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Entró a Apofis Imn en el bajo en 2010 y se pasó a la batería en 2012, donde se quedó. La banda es black metal dominicano, formada ese mismo año a partir de Amon, que venía desde 2001; empezó en Santo Domingo y después trabajó desde Buenos Aires.","type":"text"}]},{"type":"paragraph","content":[{"text":"Toca en sus EP La Palabra de Satán, de 2015, y Traicionado por Dios, de 2019.","type":"text"}]},{"type":"paragraph","content":[{"text":"Tres bandas a la vez","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El metal dominicano es lo bastante pequeño como para que sus músicos sostengan varias bandas al mismo tiempo, y él sostiene más que casi nadie. Está en la batería de Exsanguination Throne desde 2016, y tocó en el disco de Diablastador Regnum Nefario, salido en junio de 2023, con Agus y Gletus en las guitarras y Franco Fuentes en el bajo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Diablastador se describe a sí misma como de la República Dominicana y de Argentina a la vez, que es el mismo eje por el que se movió Apofis Imn. Entre Santo Domingo y Buenos Aires hay un circuito de trabajo que nunca ha tenido nada que ver con la música caribeña por la que se conoce a la isla.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lesa Humanidad, Razgos y Devast vinieron antes. Lo que suma todo eso es una carrera de baterista de sesión dentro de una escena donde no hay sesiones que pagar: toca porque las bandas necesitan a alguien que pueda, y no hay muchos.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'draconum-oth'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
