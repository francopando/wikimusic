BEGIN;

-- Rewrite the catalogue entry for La Insuperable.
--
-- La Insuperable. Filler in English, nothing in Spanish -- on the most
-- established woman in Dominican urban music.
--
-- FILLED: date_of_birth 6 July 1985 (birth_year 1985 was already stored and
-- matches); second_last_name Guzmán, which El Nuevo Diario and several other
-- outlets give and which the row was missing; aliases; genres; disambiguation;
-- the legend tag.
--
-- BIRTH_PLACE DELIBERATELY NOT CHANGED. She was born in Santo Domingo and
-- raised in Cristo Rey; the sources are careful about the difference and so is
-- this. Cristo Rey is in the Distrito Nacional, so the stored province is
-- right either way. The barrio is in the prose, not in the column.
--
-- CORRECTED: primary_genre urbano -> urban-dembow, which was already sitting in
-- genres. She works across dembow, reggaetón, trap, merengue, mambo, salsa and
-- bachata, and those go into genres instead.
--
-- SOURCES: BuenaMusica, which carries the fullest career account: the birth
-- date, the upbringing in Cristo Rey, the 2007 event where Toxic Crow first
-- pushed her to record, the 2011 debut Cero Gogas that she wrote herself, the
-- singles year by year from Contigo Quiero Estar through Bandida and Presión,
-- the Complot Records affiliation, the Soy Mamá remix with Cardi B, Farina and
-- Yailin la Más Viral, and the October 2025 Latin Billboard debut with the
-- Dominican tribute segment alongside Elvis Crespo and Toño Rosario. English
-- Wikipedia's 2023 Premios Juventud article and Univision's nominee list of 13
-- June 2023 for the Best Dembow Collaboration nomination. Instagram and
-- Facebook accounts including El Nuevo Diario's for the fuller legal name and
-- the nickname Mami Luna.
--
-- AWARD LOADED SEPARATELY: Premios Juventud 2023, Mejor Colaboración Dembow,
-- "Soy Mamá Remix", nominated, not won -- the category went to Delincuente. The
-- same category and year as Kiko el Crazy's Pichirry, already in the table.
--
-- WHAT IS DELIBERATELY LEFT OUT, AND IT IS A LOT. The source devotes long
-- passages to a seventeen-year relationship, the names and ages of three
-- daughters, a separation, what she has said about herself since, and a tattoo.
-- None of it is here. The 2007 encounter with Toxic Crow IS included, because
-- it is documented as the reason she started recording at all and because it is
-- a professional fact -- somebody heard her and insisted she use the voice she
-- did not like. Where the source turns from that to the marriage, this entry
-- stops.
--
-- NOT WRITTEN: play counts, which the source gives for almost every single.
--
-- NOT LINKED: Cardi B, Farina and Elvis Crespo are not Dominican. N-Fasis and
-- Leo RD Produciendo are Dominican and have no entries.
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
       name = 'La Insuperable',
       sort_name = 'Luna Guzmán, Indhira Ircania',
       type = 'solo_artist',
       status = 'published',
       gender = 'female',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urban-dembow',
       date_of_birth = '1985-07-06',
       birth_year = 1985,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Indhira',
       middle_name = 'Ircania',
       last_name = 'Luna',
       second_last_name = 'Guzmán',
       stage_name = 'La Insuperable',
       aliases = ARRAY['La Mami del Swagger', 'Mami Luna']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'urban-reggaeton', 'urban-trap', 'merengue-mambo']::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = 'https://www.youtube.com/@lainsuperable',
       facebook = 'LaInsuperableHD',
       instagram = 'lainsuperable',
       disambiguation = 'Dembow singer from Cristo Rey; Que Me Den Banda, Soy Mamá',
       bio_en = 'La Insuperable, born Indhira Ircania Luna Guzmán, is a Dominican singer and songwriter. She was raised in Cristo Rey, she has been at the front of the genre for fifteen years, and for most of that time she was the only woman there.

**Cero Gogas**

She did not set out to record. At an event at the end of 2007 somebody heard her, told her that her image and her carriage were too strong to waste, and pushed her into a studio. Her own objection was that she did not like her voice.

Cero Gogas came out in 2011, a mambo written by her, and it moved the day it appeared. She has written her own material since.

**Que Me Den Banda**

The singles run in an unbroken line: Contigo Quiero Estar, Ojos Que No Ven Corazón Que No Siente, Nota Jamaiquina and Siempre Regia Nunca Camu in 2014, Escondió, No Me Niegue, La Que Ta Buena Soy Yo, then Que Me Den Banda and Cuál Es La Vaina in 2016, Me Subo Arriba in 2017, Cama Vacía in 2018, and Salao, Yo Soy Esa, Su Favorita and Tengo Derecho in 2019.

The subject is nearly always the same and it is worth naming: money of her own, an answer to whoever is talking, and the refusal to be handled. In a genre whose women were usually singing a chorus on somebody else’s record, she was the one making the statement and paying for the video.

**Soy Mamá**

Soy Mamá, in 2022, produced by Leo RD, was remixed with Cardi B, Farina and Yailin la Más Viral — three women from three countries on a Dominican dembow record, which had not happened before at that level.

It was nominated for best dembow collaboration at the Premios Juventud of 2023, in a category it did not win.

**The Billboard stage**

In October 2025 she performed at the Latin Billboard awards in Miami for the first time, in a segment built as a tribute to Dominican music, singing Borrón y Cuenta Nueva beside Elvis Crespo and Toño Rosario.

Putting a dembowsera from Cristo Rey on that stage next to two merengue institutions is a piece of framing that would have been unthinkable a decade earlier, and it is a reasonable measure of what she has changed.

The recent work — La Hoja Se Volteó, Dominguito, Ilusionada, Me Liberé, Ou Ou, Bandida, Presión, and Yo Lo Quiero with N-Fasis — keeps arriving, and the touring runs across the Dominican Republic, the United States and Europe.',
       bio_es = 'La Insuperable, de nombre Indhira Ircania Luna Guzmán, es cantante y compositora dominicana. Se crió en Cristo Rey, lleva quince años al frente del género, y durante buena parte de ese tiempo fue la única mujer que estaba ahí.

**Cero Gogas**

No salió a grabar por su cuenta. En un evento a finales de 2007 alguien la oyó, le dijo que su imagen y su porte eran demasiado fuertes para desperdiciarlos, y la empujó a un estudio. Su propia objeción era que no le gustaba su voz.

Cero Gogas salió en 2011, un mambo escrito por ella, y se movió el mismo día que apareció. Desde entonces escribe su material.

**Que Me Den Banda**

Los sencillos van en línea sin cortes: Contigo Quiero Estar, Ojos Que No Ven Corazón Que No Siente, Nota Jamaiquina y Siempre Regia Nunca Camu en 2014, Escondió, No Me Niegue, La Que Ta Buena Soy Yo, después Que Me Den Banda y Cuál Es La Vaina en 2016, Me Subo Arriba en 2017, Cama Vacía en 2018, y Salao, Yo Soy Esa, Su Favorita y Tengo Derecho en 2019.

El asunto es casi siempre el mismo y vale nombrarlo: dinero propio, respuesta a quien esté hablando, y la negativa a dejarse manejar. En un género cuyas mujeres solían estar cantando el coro del disco de otro, ella era la que hacía la declaración y pagaba el video.

**Soy Mamá**

Soy Mamá, de 2022, producida por Leo RD, se remezcló con Cardi B, Farina y Yailin la Más Viral: tres mujeres de tres países sobre un disco de dembow dominicano, cosa que a ese nivel no había pasado.

Quedó nominada a mejor colaboración de dembow en los Premios Juventud de 2023, en un renglón que no ganó.

**La tarima de Billboard**

En octubre de 2025 se presentó por primera vez en los premios Latin Billboard de Miami, en un segmento armado como homenaje a la música dominicana, cantando Borrón y Cuenta Nueva al lado de Elvis Crespo y Toño Rosario.

Poner a una dembowsera de Cristo Rey en esa tarima junto a dos instituciones del merengue es un encuadre que una década antes habría sido impensable, y es una medida razonable de lo que ella ha cambiado.

El trabajo reciente —La Hoja Se Volteó, Dominguito, Ilusionada, Me Liberé, Ou Ou, Bandida, Presión, y Yo Lo Quiero con N-Fasis— sigue llegando, y las giras cruzan República Dominicana, Estados Unidos y Europa.',
       updated_at = now()
 WHERE slug = 'la-insuperable';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'la-insuperable')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'la-insuperable')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"La Insuperable, born Indhira Ircania Luna Guzmán, is a Dominican singer and songwriter. She was raised in Cristo Rey, she has been at the front of the genre for fifteen years, and for most of that time she was the only woman there.","type":"text"}]},{"type":"paragraph","content":[{"text":"Cero Gogas","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"She did not set out to record. At an event at the end of 2007 somebody heard her, told her that her image and her carriage were too strong to waste, and pushed her into a studio. Her own objection was that she did not like her voice.","type":"text"}]},{"type":"paragraph","content":[{"text":"Cero Gogas came out in 2011, a mambo written by her, and it moved the day it appeared. She has written her own material since.","type":"text"}]},{"type":"paragraph","content":[{"text":"Que Me Den Banda","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The singles run in an unbroken line: Contigo Quiero Estar, Ojos Que No Ven Corazón Que No Siente, Nota Jamaiquina and Siempre Regia Nunca Camu in 2014, Escondió, No Me Niegue, La Que Ta Buena Soy Yo, then Que Me Den Banda and Cuál Es La Vaina in 2016, Me Subo Arriba in 2017, Cama Vacía in 2018, and Salao, Yo Soy Esa, Su Favorita and Tengo Derecho in 2019.","type":"text"}]},{"type":"paragraph","content":[{"text":"The subject is nearly always the same and it is worth naming: money of her own, an answer to whoever is talking, and the refusal to be handled. In a genre whose women were usually singing a chorus on somebody else’s record, she was the one making the statement and paying for the video.","type":"text"}]},{"type":"paragraph","content":[{"text":"Soy Mamá","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Soy Mamá, in 2022, produced by Leo RD, was remixed with Cardi B, Farina and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"439bbc6c-f06e-447f-a1fa-b2130b885457","displayText":"Yailin la Más Viral","occurrenceId":"0868e33f-8c3a-4070-bbb2-1a5b7ab02e2a"}},{"text":" — three women from three countries on a Dominican dembow record, which had not happened before at that level.","type":"text"}]},{"type":"paragraph","content":[{"text":"It was nominated for best dembow collaboration at the Premios Juventud of 2023, in a category it did not win.","type":"text"}]},{"type":"paragraph","content":[{"text":"The Billboard stage","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In October 2025 she performed at the Latin Billboard awards in Miami for the first time, in a segment built as a tribute to Dominican music, singing Borrón y Cuenta Nueva beside Elvis Crespo and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6fc762d4-96b8-4ecf-aca8-fdf52936658e","displayText":"Toño Rosario","occurrenceId":"db055583-0705-4cad-845f-cd83d7dbbe46"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Putting a dembowsera from Cristo Rey on that stage next to two merengue institutions is a piece of framing that would have been unthinkable a decade earlier, and it is a reasonable measure of what she has changed.","type":"text"}]},{"type":"paragraph","content":[{"text":"The recent work — La Hoja Se Volteó, Dominguito, Ilusionada, Me Liberé, Ou Ou, Bandida, Presión, and Yo Lo Quiero with N-Fasis — keeps arriving, and the touring runs across the Dominican Republic, the United States and Europe.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'la-insuperable'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"La Insuperable, de nombre Indhira Ircania Luna Guzmán, es cantante y compositora dominicana. Se crió en Cristo Rey, lleva quince años al frente del género, y durante buena parte de ese tiempo fue la única mujer que estaba ahí.","type":"text"}]},{"type":"paragraph","content":[{"text":"Cero Gogas","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"No salió a grabar por su cuenta. En un evento a finales de 2007 alguien la oyó, le dijo que su imagen y su porte eran demasiado fuertes para desperdiciarlos, y la empujó a un estudio. Su propia objeción era que no le gustaba su voz.","type":"text"}]},{"type":"paragraph","content":[{"text":"Cero Gogas salió en 2011, un mambo escrito por ella, y se movió el mismo día que apareció. Desde entonces escribe su material.","type":"text"}]},{"type":"paragraph","content":[{"text":"Que Me Den Banda","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Los sencillos van en línea sin cortes: Contigo Quiero Estar, Ojos Que No Ven Corazón Que No Siente, Nota Jamaiquina y Siempre Regia Nunca Camu en 2014, Escondió, No Me Niegue, La Que Ta Buena Soy Yo, después Que Me Den Banda y Cuál Es La Vaina en 2016, Me Subo Arriba en 2017, Cama Vacía en 2018, y Salao, Yo Soy Esa, Su Favorita y Tengo Derecho en 2019.","type":"text"}]},{"type":"paragraph","content":[{"text":"El asunto es casi siempre el mismo y vale nombrarlo: dinero propio, respuesta a quien esté hablando, y la negativa a dejarse manejar. En un género cuyas mujeres solían estar cantando el coro del disco de otro, ella era la que hacía la declaración y pagaba el video.","type":"text"}]},{"type":"paragraph","content":[{"text":"Soy Mamá","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Soy Mamá, de 2022, producida por Leo RD, se remezcló con Cardi B, Farina y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"439bbc6c-f06e-447f-a1fa-b2130b885457","displayText":"Yailin la Más Viral","occurrenceId":"aa85d6a2-8ae7-4e7e-b792-bed2718769ac"}},{"text":": tres mujeres de tres países sobre un disco de dembow dominicano, cosa que a ese nivel no había pasado.","type":"text"}]},{"type":"paragraph","content":[{"text":"Quedó nominada a mejor colaboración de dembow en los Premios Juventud de 2023, en un renglón que no ganó.","type":"text"}]},{"type":"paragraph","content":[{"text":"La tarima de Billboard","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En octubre de 2025 se presentó por primera vez en los premios Latin Billboard de Miami, en un segmento armado como homenaje a la música dominicana, cantando Borrón y Cuenta Nueva al lado de Elvis Crespo y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6fc762d4-96b8-4ecf-aca8-fdf52936658e","displayText":"Toño Rosario","occurrenceId":"3e92e66f-2a2c-4593-a7ac-55e4e67963f0"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Poner a una dembowsera de Cristo Rey en esa tarima junto a dos instituciones del merengue es un encuadre que una década antes habría sido impensable, y es una medida razonable de lo que ella ha cambiado.","type":"text"}]},{"type":"paragraph","content":[{"text":"El trabajo reciente —La Hoja Se Volteó, Dominguito, Ilusionada, Me Liberé, Ou Ou, Bandida, Presión, y Yo Lo Quiero con N-Fasis— sigue llegando, y las giras cruzan República Dominicana, Estados Unidos y Europa.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'la-insuperable'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'la-insuperable') AND locale = 'en'), '0868e33f-8c3a-4070-bbb2-1a5b7ab02e2a', 'artist', '439bbc6c-f06e-447f-a1fa-b2130b885457');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'la-insuperable') AND locale = 'en'), 'db055583-0705-4cad-845f-cd83d7dbbe46', 'artist', '6fc762d4-96b8-4ecf-aca8-fdf52936658e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'la-insuperable') AND locale = 'es'), '3e92e66f-2a2c-4593-a7ac-55e4e67963f0', 'artist', '6fc762d4-96b8-4ecf-aca8-fdf52936658e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'la-insuperable') AND locale = 'es'), 'aa85d6a2-8ae7-4e7e-b792-bed2718769ac', 'artist', '439bbc6c-f06e-447f-a1fa-b2130b885457');

COMMIT;
