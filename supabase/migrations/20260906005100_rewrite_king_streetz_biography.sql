BEGIN;

-- Rewrite the catalogue entry for King Streetz.
--
-- King Streetz. Filler in English, nothing in Spanish, no occupations, no
-- place.
--
-- THIS ENTRY WAS ALSO DEFERRED EARLIER TODAY AND SHOULD NOT HAVE BEEN. The
-- first pass searched the open web, found only unrelated Facebook noise, and
-- concluded there was nothing verifiable. His YouTube channel was on the row
-- and was not opened. It holds fourteen released videos and links out to five
-- more accounts, and the catalogue behind them answers the question the first
-- pass said could not be answered.
--
-- WHAT THE CATALOGUE SETTLES. He records in English, which is why nothing in
-- Spanish comes back about him, but the songs are Dominican in subject and in
-- company: Cocolo, which is a Dominican word before it is anything else;
-- 5AM in Punta Cana; Bilingual; and Zero, made with Tivi Gunz. That is enough
-- for the criterion this catalogue uses -- belonging to Dominican music rather
-- than birthplace. He stays.
--
-- STILL UNRESOLVED, AND KEPT IN EXTRANJEROS.md. Where he was born. MusicBrainz
-- files him as a Dominican Republic hip-hop artist with country DO; his
-- Facebook page is located in Santo Domingo and he posts from Boca Chica; but
-- one of his own captions reads "born in brick city for life", and Brick City
-- is Newark, New Jersey. Nothing reconciles the two, so province and
-- birth_place stay NULL and the prose does not name a birthplace. The diaspora
-- tag is added because the position is not in doubt even if the city is.
--
-- ADDED: primary_role singer -> rapper; occupations composer; genres; aliases;
-- disambiguation; the diaspora tag. primary_genre urban-rap-hip-hop was already
-- right.
--
-- SOURCES: his own YouTube channel, for the fourteen videos and the outbound
-- links -- Trauma, Cocolo, Exotic with MNDFCK Louie, 5AM in Punta Cana,
-- Bilingual, Zero with Tivi Gunz, Family Guy with LightShow, Who Tf Is You,
-- Trendsetters, No Competition, Supa High, 2K15 Takeova, For Life, and a
-- freestyle -- and for the FLMG tag that runs through the early ones. Spotify,
-- for Trauma, Letter From Streetz, X Pill, Spazz and Dope Boy. MusicBrainz, for
-- the disambiguation, the country and the two 2015 releases, the album FACTS
-- and the Humble Beast EP. SoundCloud, for the F.A.C.T.S. intro posted eleven
-- years ago. Facebook and Instagram for the locations and the self-description.
--
-- NOT WRITTEN: follower counts. No legal name, no date of birth and no
-- interview exists anywhere.
--
-- NOT LINKED: the catalogue contains a group called Hollywood, and one of his
-- tracks features somebody billed as Hollywood. There is no reason to think
-- they are the same and the reference is not made. MNDFCK Louie, LightShow and
-- E4rmdacity have no entries and are probably not Dominican.
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
       name = 'King Streetz',
       sort_name = 'King Streetz',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'rapper',
       primary_genre = 'urban-rap-hip-hop',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = NULL,
       province = NULL,
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = 'King Streetz',
       aliases = ARRAY['KingStreetz']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'urban-trap']::text[],
       artist_tags = ARRAY['secular', 'diaspora']::text[],
       website = NULL,
       youtube = 'kingstreetz',
       facebook = 'OfficialKingStreetz',
       instagram = 'KingStreetz',
       disambiguation = 'Dominican rapper who records in English; FACTS, Cocolo, Zero',
       bio_en = 'King Streetz is a Dominican rapper who works in English. That single fact explains most of what is unusual about him and most of why he is hard to find.

**FACTS**

The album FACTS and the Humble Beast EP both came out in 2015, and the videos around them carry the tag FLMG — Trendsetters, No Competition, Supa High, 2K15 Takeova. The sound is American East Coast rap, not dembow and not trap latino, and it was made at a moment when Dominican urban music was moving hard in the opposite direction.

Trauma, Letter From Streetz, X Pill, Spazz and Dope Boy are the tracks that have stayed in circulation since.

**Writing from both sides**

The titles say where he stands better than any biography would. Cocolo is a Dominican word before it is anything else — the name for the English-speaking Afro-Caribbean families who came to cut cane in San Pedro de Macorís, and later a word for a whole way of hearing music. 5AM in Punta Cana places itself. Bilingual says the condition outright.

Zero, made with Tivi Gunz, is the clearest link to the Dominican field he belongs to, and the one record of his that a Dominican listener is most likely to have heard.

**Working without an audience on either side**

A Dominican who raps in English occupies an awkward position twice over. At home the language keeps him off the radio; abroad he is one more independent rapper among thousands. The catalogue is small and the reach is small, and neither of those is a judgement on the records.

Nothing personal about him is documented. No legal name, no date of birth, no interview in any outlet. His pages put him in Santo Domingo and in Boca Chica; a caption of his own claims a New Jersey childhood. Both may be true, and nothing found settles which city he was born in.',
       bio_es = 'King Streetz es un rapero dominicano que trabaja en inglés. Ese solo dato explica casi todo lo raro que tiene y casi todo lo que cuesta encontrarlo.

**FACTS**

El álbum FACTS y el Humble Beast EP salieron los dos en 2015, y los videos de esa época llevan la etiqueta FLMG: Trendsetters, No Competition, Supa High, 2K15 Takeova. El sonido es rap estadounidense de la costa este, no dembow ni trap latino, y se hizo justo cuando la música urbana dominicana iba con fuerza en la dirección contraria.

Trauma, Letter From Streetz, X Pill, Spazz y Dope Boy son los temas suyos que han seguido circulando.

**Escribir desde los dos lados**

Los títulos dicen dónde está parado mejor que cualquier biografía. Cocolo es una palabra dominicana antes que cualquier otra cosa: el nombre de las familias afrocaribeñas de habla inglesa que vinieron a cortar caña a San Pedro de Macorís, y más tarde una palabra para toda una manera de oír música. 5AM in Punta Cana se ubica sola. Bilingual dice la condición sin rodeos.

Zero, hecha con Tivi Gunz, es el vínculo más claro con el campo dominicano al que pertenece, y el disco suyo que un oyente dominicano tiene más probabilidad de haber escuchado.

**Trabajar sin público de ninguno de los dos lados**

Un dominicano que rapea en inglés ocupa una posición incómoda por partida doble. Aquí el idioma lo deja fuera de la radio; allá es un rapero independiente más entre miles. El catálogo es corto y el alcance es corto, y ninguna de las dos cosas es un juicio sobre los discos.

De lo personal no hay nada documentado. Ni nombre legal, ni fecha de nacimiento, ni una entrevista en ningún medio. Sus páginas lo ponen en Santo Domingo y en Boca Chica; un pie de foto suyo reclama una infancia en Nueva Jersey. Las dos cosas pueden ser ciertas, y nada de lo encontrado resuelve en cuál ciudad nació.',
       updated_at = now()
 WHERE slug = 'king-streetz';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'king-streetz')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'king-streetz')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"King Streetz is a Dominican rapper who works in English. That single fact explains most of what is unusual about him and most of why he is hard to find.","type":"text"}]},{"type":"paragraph","content":[{"text":"FACTS","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The album FACTS and the Humble Beast EP both came out in 2015, and the videos around them carry the tag FLMG — Trendsetters, No Competition, Supa High, 2K15 Takeova. The sound is American East Coast rap, not dembow and not trap latino, and it was made at a moment when Dominican urban music was moving hard in the opposite direction.","type":"text"}]},{"type":"paragraph","content":[{"text":"Trauma, Letter From Streetz, X Pill, Spazz and Dope Boy are the tracks that have stayed in circulation since.","type":"text"}]},{"type":"paragraph","content":[{"text":"Writing from both sides","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The titles say where he stands better than any biography would. Cocolo is a Dominican word before it is anything else — the name for the English-speaking Afro-Caribbean families who came to cut cane in San Pedro de Macorís, and later a word for a whole way of hearing music. 5AM in Punta Cana places itself. Bilingual says the condition outright.","type":"text"}]},{"type":"paragraph","content":[{"text":"Zero, made with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"95e181f1-58e5-4537-a5e8-75a9f60c6aca","displayText":"Tivi Gunz","occurrenceId":"ae845c65-23ef-4455-a536-3dd6afeaae32"}},{"text":", is the clearest link to the Dominican field he belongs to, and the one record of his that a Dominican listener is most likely to have heard.","type":"text"}]},{"type":"paragraph","content":[{"text":"Working without an audience on either side","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"A Dominican who raps in English occupies an awkward position twice over. At home the language keeps him off the radio; abroad he is one more independent rapper among thousands. The catalogue is small and the reach is small, and neither of those is a judgement on the records.","type":"text"}]},{"type":"paragraph","content":[{"text":"Nothing personal about him is documented. No legal name, no date of birth, no interview in any outlet. His pages put him in Santo Domingo and in Boca Chica; a caption of his own claims a New Jersey childhood. Both may be true, and nothing found settles which city he was born in.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'king-streetz'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"King Streetz es un rapero dominicano que trabaja en inglés. Ese solo dato explica casi todo lo raro que tiene y casi todo lo que cuesta encontrarlo.","type":"text"}]},{"type":"paragraph","content":[{"text":"FACTS","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El álbum FACTS y el Humble Beast EP salieron los dos en 2015, y los videos de esa época llevan la etiqueta FLMG: Trendsetters, No Competition, Supa High, 2K15 Takeova. El sonido es rap estadounidense de la costa este, no dembow ni trap latino, y se hizo justo cuando la música urbana dominicana iba con fuerza en la dirección contraria.","type":"text"}]},{"type":"paragraph","content":[{"text":"Trauma, Letter From Streetz, X Pill, Spazz y Dope Boy son los temas suyos que han seguido circulando.","type":"text"}]},{"type":"paragraph","content":[{"text":"Escribir desde los dos lados","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Los títulos dicen dónde está parado mejor que cualquier biografía. Cocolo es una palabra dominicana antes que cualquier otra cosa: el nombre de las familias afrocaribeñas de habla inglesa que vinieron a cortar caña a San Pedro de Macorís, y más tarde una palabra para toda una manera de oír música. 5AM in Punta Cana se ubica sola. Bilingual dice la condición sin rodeos.","type":"text"}]},{"type":"paragraph","content":[{"text":"Zero, hecha con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"95e181f1-58e5-4537-a5e8-75a9f60c6aca","displayText":"Tivi Gunz","occurrenceId":"27d1ae7b-91eb-4a3a-bcc2-2caaaecf9f48"}},{"text":", es el vínculo más claro con el campo dominicano al que pertenece, y el disco suyo que un oyente dominicano tiene más probabilidad de haber escuchado.","type":"text"}]},{"type":"paragraph","content":[{"text":"Trabajar sin público de ninguno de los dos lados","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Un dominicano que rapea en inglés ocupa una posición incómoda por partida doble. Aquí el idioma lo deja fuera de la radio; allá es un rapero independiente más entre miles. El catálogo es corto y el alcance es corto, y ninguna de las dos cosas es un juicio sobre los discos.","type":"text"}]},{"type":"paragraph","content":[{"text":"De lo personal no hay nada documentado. Ni nombre legal, ni fecha de nacimiento, ni una entrevista en ningún medio. Sus páginas lo ponen en Santo Domingo y en Boca Chica; un pie de foto suyo reclama una infancia en Nueva Jersey. Las dos cosas pueden ser ciertas, y nada de lo encontrado resuelve en cuál ciudad nació.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'king-streetz'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'king-streetz') AND locale = 'en'), 'ae845c65-23ef-4455-a536-3dd6afeaae32', 'artist', '95e181f1-58e5-4537-a5e8-75a9f60c6aca');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'king-streetz') AND locale = 'es'), '27d1ae7b-91eb-4a3a-bcc2-2caaaecf9f48', 'artist', '95e181f1-58e5-4537-a5e8-75a9f60c6aca');

COMMIT;
