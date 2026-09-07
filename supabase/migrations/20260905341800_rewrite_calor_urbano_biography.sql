BEGIN;

-- Rewrite the catalogue entry for Calor Urbano.
--
-- Calor Urbano. Filler in English, nothing in Spanish, no dates, no members --
-- for the band Vicente Garcia came out of.
--
-- GENRE changed from urbano to rock. Spanish Wikipedia files them under rock,
-- funk, disco and hip-hop, they were nominated in the Casandra pop-rock
-- category and they won it; "urbano" in the Dominican sense means dembow and
-- reggaeton, which is not what they made.
--
-- SOURCES: Spanish Wikipedia's article on the band, which carries the whole
-- history: the founding late in 2002, the line-up, the three singles of 2003
-- and 2004 and their production credits, the "Premio del Pueblo" nomination
-- from Teleantillas, the album "Transmision Groove" and where it was recorded,
-- mixed and mastered, the guest players and engineers, "Pa Que No Pienses" and
-- its Tabare Blanchard video, the Hard Rock Cafe launches, the Presidente and
-- Brugal campaigns, the Cabarete show with Cultura Profetica, the two Casandra
-- nominations of 2007 and the win in 2008, the Ricky Martin support slot, the
-- Barquisimeto date opening for Juan Luis Guerra, the 2008 world tour as his
-- opening act with him producing their next record, and Vicente Garcia's
-- departure in August 2010 to sign with Capitol.
--
-- NOT WRITTEN: the attendance and sales figures the article gives. They are
-- real, but the standing rule here keeps counts out of biographies, so the same
-- facts are stated as records and firsts rather than as numbers.
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
       name = 'Calor Urbano',
       sort_name = 'Calor Urbano',
       type = 'group',
       status = 'published',
       gender = NULL,
       ended = TRUE,
       primary_role = 'musician',
       primary_genre = 'rock',
       date_of_birth = NULL,
       birth_year = 2002,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY[]::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Dominican rock and funk band, 2002–2010; the band Vicente García came from',
       bio_en = 'Calor Urbano were a Dominican band from Santo Domingo, working from late 2002 until 2010. Vicente García sang, Adolfo Guerrero was the MC, Joel Berrido played bass and Carlos Chapuseaux guitars.

**What they were making**

They pulled soul, funk, disco, hip hop, neo-soul and nu-jazz together with light Caribbean touches — a combination with no Dominican precedent and no obvious audience, in a country whose radio ran on merengue and bachata.

The first single, Calor Urbano, went out to Dominican radio in 2003, produced and engineered by Mike Rodríguez and José A. Bordas, and it charted immediately in its format. Vértigo followed the same year and To Soul at the end of 2004, and by then Teleantillas had nominated them best pop-rock band at its Premio del Pueblo.

**Transmisión Groove**

The album was cut in Miami and Santo Domingo and mastered at Fuller Sound. Carlo Magno Araya, who plays percussion for Rubén Blades, and the Dominican saxophonist Sandy Gabriel both appear on it.

The engineering list explains the ambition better than the credits do. Allan Leschorn, who had worked with Juan Luis Guerra 4.40 and Chichi Peralta; Mario García Haya and Bolívar Gómez, both Grammy winners; and Juan Cristóbal Losada, who had engineered Gilberto Santa Rosa, David Bisbal and Carlos Santana. A Dominican alternative band was buying the same room the region’s biggest records were made in.

Pa’ Que No Pienses came out of it in 2006 and reached number one in its format inside two weeks. Tabaré Blanchard directed the video, and its editing and effects were unlike anything Dominican music video had produced.

**The rooms they filled**

They launched the album at the Hard Rock Café in Santo Domingo and set the venue’s attendance record, then filled it again the following year with people left outside. Presidente and Brugal put them on their campaigns. They played Cabarete beach with Cultura Profética.

Two Casandra nominations came in 2007, for group of the year and for the video, and they won the pop-rock award in 2008. They opened for Ricky Martin on his Blanco y Negro tour, and in September 2007 they opened for Juan Luis Guerra at the Feria Internacional de Barquisimeto in Venezuela.

From July 2008 they toured as Guerra’s opening act, and he was producing their next record.

**The end of it**

In August 2010 Vicente García left to work alone, and signed with Capitol. The band stopped there.

What it left behind is the harder thing to measure. Dominican alternative music had no industry, and Calor Urbano proved a band could sell out rooms and reach a Casandra without playing merengue — and it produced a singer who has since become one of the most important artists the country has.',
       bio_es = 'Calor Urbano fue una banda dominicana de Santo Domingo que trabajó desde finales de 2002 hasta 2010. Vicente García cantaba, Adolfo Guerrero era el MC, Joel Berrido tocaba el bajo y Carlos Chapuseaux las guitarras.

**Lo que hacían**

Juntaban soul, funk, disco, hip hop, neo-soul y nu-jazz con toques caribeños ligeros: una combinación sin precedente dominicano y sin público evidente, en un país cuya radio funcionaba con merengue y bachata.

El primer sencillo, Calor Urbano, salió a la radio dominicana en 2003, producido y grabado por Mike Rodríguez y José A. Bordas, y entró en listas de su género de inmediato. Vértigo vino ese mismo año y To Soul a finales de 2004, y para entonces Teleantillas ya los había nominado a mejor banda pop-rock en su Premio del Pueblo.

**Transmisión Groove**

El disco se grabó en Miami y en Santo Domingo y se masterizó en Fuller Sound. Aparecen en él Carlo Magno Araya, percusionista de Rubén Blades, y el saxofonista dominicano Sandy Gabriel.

La lista de ingenieros explica la ambición mejor que los créditos. Allan Leschorn, que había trabajado con Juan Luis Guerra 4.40 y con Chichi Peralta; Mario García Haya y Bolívar Gómez, los dos ganadores de Grammy; y Juan Cristóbal Losada, que había grabado a Gilberto Santa Rosa, a David Bisbal y a Carlos Santana. Una banda alternativa dominicana estaba comprando el mismo cuarto donde se hacían los discos más grandes de la región.

De ahí salió Pa’ Que No Pienses en 2006, que llegó al número uno de su género en dos semanas. Tabaré Blanchard dirigió el video, y su edición y sus efectos no se parecían a nada que hubiera producido el video musical dominicano.

**Los salones que llenaron**

Lanzaron el disco en el Hard Rock Café de Santo Domingo y batieron el récord de asistencia del local, y al año siguiente lo volvieron a llenar dejando gente afuera. Presidente y Brugal los pusieron en sus campañas. Tocaron en la playa de Cabarete con Cultura Profética.

En 2007 les llegaron dos nominaciones al Casandra, a grupo del año y a video, y en 2008 ganaron el de pop-rock. Abrieron para Ricky Martin en su gira Blanco y Negro, y en septiembre de 2007 abrieron para Juan Luis Guerra en la Feria Internacional de Barquisimeto, en Venezuela.

Desde julio de 2008 salieron de gira como teloneros de Guerra, que además estaba produciéndoles el disco siguiente.

**El final**

En agosto de 2010 Vicente García se fue a trabajar solo, y firmó con Capitol. La banda se acabó ahí.

Lo que dejó es lo más difícil de medir. La música alternativa dominicana no tenía industria, y Calor Urbano demostró que una banda podía llenar salones y llegar a un Casandra sin tocar merengue, y sacó de ahí a un cantante que desde entonces se ha vuelto uno de los artistas más importantes que tiene el país.',
       updated_at = now()
 WHERE slug = 'calor-urbano';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'calor-urbano')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'calor-urbano')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Calor Urbano were a Dominican band from Santo Domingo, working from late 2002 until 2010. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"4968d375-0833-49e2-8442-633cbaa39404","displayText":"Vicente García","occurrenceId":"4cde1964-7e6b-4283-8daf-cfd4de7e17f1"}},{"text":" sang, Adolfo Guerrero was the MC, Joel Berrido played bass and Carlos Chapuseaux guitars.","type":"text"}]},{"type":"paragraph","content":[{"text":"What they were making","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"They pulled soul, funk, disco, hip hop, neo-soul and nu-jazz together with light Caribbean touches — a combination with no Dominican precedent and no obvious audience, in a country whose radio ran on merengue and bachata.","type":"text"}]},{"type":"paragraph","content":[{"text":"The first single, Calor Urbano, went out to Dominican radio in 2003, produced and engineered by Mike Rodríguez and José A. Bordas, and it charted immediately in its format. Vértigo followed the same year and To Soul at the end of 2004, and by then Teleantillas had nominated them best pop-rock band at its Premio del Pueblo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Transmisión Groove","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The album was cut in Miami and Santo Domingo and mastered at Fuller Sound. Carlo Magno Araya, who plays percussion for Rubén Blades, and the Dominican saxophonist ","type":"text"},{"type":"artistReference","attrs":{"artistId":"58fef0f7-b2a4-42bb-ac8c-462dd66609e4","displayText":"Sandy Gabriel","occurrenceId":"11c8ebec-cbc4-4886-8e6c-6208cc24f333"}},{"text":" both appear on it.","type":"text"}]},{"type":"paragraph","content":[{"text":"The engineering list explains the ambition better than the credits do. Allan Leschorn, who had worked with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"10034596-47cb-46ba-9e80-9ea319a2c0df","displayText":"Juan Luis Guerra 4.40","occurrenceId":"5b322a09-19b5-4cdc-8732-70be065e5d21"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0337dec9-fe9d-485f-be56-a9120b92fbe8","displayText":"Chichi Peralta","occurrenceId":"40cad65e-bcf1-4c8f-86b1-d764757f2064"}},{"text":"; Mario García Haya and Bolívar Gómez, both Grammy winners; and Juan Cristóbal Losada, who had engineered Gilberto Santa Rosa, David Bisbal and Carlos Santana. A Dominican alternative band was buying the same room the region’s biggest records were made in.","type":"text"}]},{"type":"paragraph","content":[{"text":"Pa’ Que No Pienses came out of it in 2006 and reached number one in its format inside two weeks. Tabaré Blanchard directed the video, and its editing and effects were unlike anything Dominican music video had produced.","type":"text"}]},{"type":"paragraph","content":[{"text":"The rooms they filled","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"They launched the album at the Hard Rock Café in Santo Domingo and set the venue’s attendance record, then filled it again the following year with people left outside. Presidente and Brugal put them on their campaigns. They played Cabarete beach with Cultura Profética.","type":"text"}]},{"type":"paragraph","content":[{"text":"Two Casandra nominations came in 2007, for group of the year and for the video, and they won the pop-rock award in 2008. They opened for Ricky Martin on his Blanco y Negro tour, and in September 2007 they opened for Juan Luis Guerra at the Feria Internacional de Barquisimeto in Venezuela.","type":"text"}]},{"type":"paragraph","content":[{"text":"From July 2008 they toured as Guerra’s opening act, and he was producing their next record.","type":"text"}]},{"type":"paragraph","content":[{"text":"The end of it","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In August 2010 Vicente García left to work alone, and signed with Capitol. The band stopped there.","type":"text"}]},{"type":"paragraph","content":[{"text":"What it left behind is the harder thing to measure. Dominican alternative music had no industry, and Calor Urbano proved a band could sell out rooms and reach a Casandra without playing merengue — and it produced a singer who has since become one of the most important artists the country has.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'calor-urbano'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Calor Urbano fue una banda dominicana de Santo Domingo que trabajó desde finales de 2002 hasta 2010. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"4968d375-0833-49e2-8442-633cbaa39404","displayText":"Vicente García","occurrenceId":"0f0ee4a1-f6fc-485d-9abe-ce811d92bcd2"}},{"text":" cantaba, Adolfo Guerrero era el MC, Joel Berrido tocaba el bajo y Carlos Chapuseaux las guitarras.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que hacían","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Juntaban soul, funk, disco, hip hop, neo-soul y nu-jazz con toques caribeños ligeros: una combinación sin precedente dominicano y sin público evidente, en un país cuya radio funcionaba con merengue y bachata.","type":"text"}]},{"type":"paragraph","content":[{"text":"El primer sencillo, Calor Urbano, salió a la radio dominicana en 2003, producido y grabado por Mike Rodríguez y José A. Bordas, y entró en listas de su género de inmediato. Vértigo vino ese mismo año y To Soul a finales de 2004, y para entonces Teleantillas ya los había nominado a mejor banda pop-rock en su Premio del Pueblo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Transmisión Groove","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El disco se grabó en Miami y en Santo Domingo y se masterizó en Fuller Sound. Aparecen en él Carlo Magno Araya, percusionista de Rubén Blades, y el saxofonista dominicano ","type":"text"},{"type":"artistReference","attrs":{"artistId":"58fef0f7-b2a4-42bb-ac8c-462dd66609e4","displayText":"Sandy Gabriel","occurrenceId":"0dbba065-2182-4dbe-857f-7e88cdad9e5f"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"La lista de ingenieros explica la ambición mejor que los créditos. Allan Leschorn, que había trabajado con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"10034596-47cb-46ba-9e80-9ea319a2c0df","displayText":"Juan Luis Guerra 4.40","occurrenceId":"398a3a3e-43ea-4591-92e0-c5845bcc2ed6"}},{"text":" y con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0337dec9-fe9d-485f-be56-a9120b92fbe8","displayText":"Chichi Peralta","occurrenceId":"6fbc19bf-9324-47a1-b73b-b4ae6823d280"}},{"text":"; Mario García Haya y Bolívar Gómez, los dos ganadores de Grammy; y Juan Cristóbal Losada, que había grabado a Gilberto Santa Rosa, a David Bisbal y a Carlos Santana. Una banda alternativa dominicana estaba comprando el mismo cuarto donde se hacían los discos más grandes de la región.","type":"text"}]},{"type":"paragraph","content":[{"text":"De ahí salió Pa’ Que No Pienses en 2006, que llegó al número uno de su género en dos semanas. Tabaré Blanchard dirigió el video, y su edición y sus efectos no se parecían a nada que hubiera producido el video musical dominicano.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los salones que llenaron","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Lanzaron el disco en el Hard Rock Café de Santo Domingo y batieron el récord de asistencia del local, y al año siguiente lo volvieron a llenar dejando gente afuera. Presidente y Brugal los pusieron en sus campañas. Tocaron en la playa de Cabarete con Cultura Profética.","type":"text"}]},{"type":"paragraph","content":[{"text":"En 2007 les llegaron dos nominaciones al Casandra, a grupo del año y a video, y en 2008 ganaron el de pop-rock. Abrieron para Ricky Martin en su gira Blanco y Negro, y en septiembre de 2007 abrieron para Juan Luis Guerra en la Feria Internacional de Barquisimeto, en Venezuela.","type":"text"}]},{"type":"paragraph","content":[{"text":"Desde julio de 2008 salieron de gira como teloneros de Guerra, que además estaba produciéndoles el disco siguiente.","type":"text"}]},{"type":"paragraph","content":[{"text":"El final","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En agosto de 2010 Vicente García se fue a trabajar solo, y firmó con Capitol. La banda se acabó ahí.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que dejó es lo más difícil de medir. La música alternativa dominicana no tenía industria, y Calor Urbano demostró que una banda podía llenar salones y llegar a un Casandra sin tocar merengue, y sacó de ahí a un cantante que desde entonces se ha vuelto uno de los artistas más importantes que tiene el país.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'calor-urbano'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'calor-urbano') AND locale = 'en'), '11c8ebec-cbc4-4886-8e6c-6208cc24f333', 'artist', '58fef0f7-b2a4-42bb-ac8c-462dd66609e4');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'calor-urbano') AND locale = 'en'), '40cad65e-bcf1-4c8f-86b1-d764757f2064', 'artist', '0337dec9-fe9d-485f-be56-a9120b92fbe8');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'calor-urbano') AND locale = 'en'), '4cde1964-7e6b-4283-8daf-cfd4de7e17f1', 'artist', '4968d375-0833-49e2-8442-633cbaa39404');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'calor-urbano') AND locale = 'en'), '5b322a09-19b5-4cdc-8732-70be065e5d21', 'artist', '10034596-47cb-46ba-9e80-9ea319a2c0df');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'calor-urbano') AND locale = 'es'), '0dbba065-2182-4dbe-857f-7e88cdad9e5f', 'artist', '58fef0f7-b2a4-42bb-ac8c-462dd66609e4');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'calor-urbano') AND locale = 'es'), '0f0ee4a1-f6fc-485d-9abe-ce811d92bcd2', 'artist', '4968d375-0833-49e2-8442-633cbaa39404');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'calor-urbano') AND locale = 'es'), '398a3a3e-43ea-4591-92e0-c5845bcc2ed6', 'artist', '10034596-47cb-46ba-9e80-9ea319a2c0df');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'calor-urbano') AND locale = 'es'), '6fbc19bf-9324-47a1-b73b-b4ae6823d280', 'artist', '0337dec9-fe9d-485f-be56-a9120b92fbe8');

COMMIT;
