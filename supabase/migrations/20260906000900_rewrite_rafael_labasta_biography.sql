BEGIN;

-- Rewrite the catalogue entry for Rafael Labasta.
--
-- Rafael Labasta. Filler in English, nothing in Spanish, no instrument, and a
-- birthplace that was the importer's default -- on a Dominican who played
-- trumpet for Tito Puente and Machito and then built his own orchestra in
-- Panama.
--
-- OVERWRITTEN: province "Distrito Nacional" -> "San Pedro de Macoris" and
-- birth_place "Santo Domingo" -> "San Pedro de Macoris". Every source says San
-- Pedro, and MusicBrainz gives it as his begin-area. The old pair was the
-- import default.
--
-- CORRECTED: primary_role musician -> instrumentalist, with trumpeter, arranger
-- and bandleader in occupations and trumpet in instruments. He is known first
-- as a trumpet player -- "El Mago de la Trompeta" -- and second as a director.
--
-- NOT WRITTEN, and it is a real loss: his date of birth. Every source gives the
-- day and the month, 22 October, and none gives the year. date_of_birth cannot
-- hold a partial date here -- birth_day and birth_month are generated columns
-- and the entry gate requires birth_year alongside a full date -- so the day is
-- recorded in the prose instead and the column is left empty. Worth filling in
-- if a year can be found.
--
-- SOURCES: Herencia Latina's page on him -- "el Maestro Rafael Labasta, de
-- origen dominicano, un profeta fuera de su tierra, el cual hizo carrera en la
-- hermana Republica de Panama", which he took as his second country. The
-- standing biography carried by Last.fm and reproduced by several salsa history
-- pages, including Ruben Blades's own: "RAFAEL LABASTA nace en San Pedro de
-- Macoris, Republica Dominicana. Ha sido trompetista de las orquestas de Tito
-- Rodriguez, Tito Puente, Machito, Cortijo y su combo entre otras. En la
-- actualidad tiene su Big Band". Historia Salsera and Los Mejores Salseros del
-- Mundo for the birthday, 22 October. El Rincon del Viejo Use and SALSARD for
-- the Panamanian orchestra, formed there in 1971, and for the version of No
-- Volvere -- a ranchera by the Mexican composer and actor Manuel Esperon --
-- which is the recording he is best known by. MusicBrainz for the albums: En
-- "Vivo" en el Rancho Grande (1972), Labasta llego (1972) and Con su salsa... y
-- basta (1974), and for the titles Asi Soy Yo, Bello Amanecer, Chaleco,
-- Curacao, De Repente, El Rey de los Pollos, El Ultimo Acto, Esta Noche la Paso
-- Contigo, Grande Grande and Guanguaco Bongo. Salseando Con Walo's transfer of
-- Zum Zum Ba Ba E from Labasta Llego. Radio Gladys Palmera, "Buscando una
-- orquesta fantasma", 20 March 2023, on his arrival in Panama, the super
-- orchestra he consolidated there and Monchi Bustamante joining it as singer
-- and corista. APEDE Chiriqui and the Camara de Comercio de Chiriqui on the
-- tribute evening they staged for him in Panama.
--
-- NOT LINKED: Tito Rodriguez, Tito Puente, Machito, Cortijo and Monchi
-- Bustamante are Puerto Rican, Cuban and Panamanian and have no entries here,
-- correctly.
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
       name = 'Rafael Labasta',
       sort_name = 'Labasta, Rafael',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'instrumentalist',
       primary_genre = 'salsa',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'San Pedro de Macorís',
       province = 'San Pedro de Macorís',
       first_name = 'Rafael',
       middle_name = NULL,
       last_name = 'Labasta',
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY['El Mago de la Trompeta', 'Rafael Labasta y su Orquesta']::text[],
       occupations = '["trumpeter","arranger","bandleader"]'::jsonb,
       instruments = ARRAY['trumpet']::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = 'rafaelabastamusic',
       disambiguation = 'Dominican trumpeter, arranger and bandleader from San Pedro de Macorís; built his orchestra in Panama',
       bio_en = 'Rafael Labasta is a Dominican trumpeter, arranger and orchestra leader, born in San Pedro de Macorís on the twenty-second of October. Salsa people call him el Mago de la Trompeta, and he made the whole of his career outside the country.

**The sideman years**

Before he had an orchestra of his own he played trumpet in the bands of Tito Rodríguez, Tito Puente, Machito and Cortijo y su Combo. That is four of the founding orchestras of the New York and Puerto Rican Latin scene, and a Dominican holding a chair in all of them is not a small fact.

Trumpet in that music is exposed work. The section carries the mambo, the solos are short and public, and there is no hiding in a band that size. Getting hired by Puente and by Machito is a technical verdict as much as a musical one.

**Panama**

He arrived in Panama and stayed. In 1971 he put his own orchestra together there, and Panama became what a salsa historian calls his second country — the place that transformed his life, and where he is remembered as a national figure rather than a visiting one.

The records came fast. En Vivo en el Rancho Grande and Labasta Llegó are both from 1972, Con su Salsa… y Basta from 1974. Zum Zum Ba Ba É, Guanguacó Bongó, El Rey de los Pollos, Grande Grande, Esta Noche la Paso Contigo.

The one people ask for is No Volveré — a Mexican ranchera by Manuel Esperón, taken apart and rebuilt as salsa. Doing that to a ranchera was the sort of move the seventies rewarded: the melody was already in everybody’s ear, and hearing it come back with a horn section and a bongó was the joke and the point at once.

**A prophet outside his own country**

Herencia Latina calls him exactly that. He is one of the Dominican musicians whose work is documented, honoured and taught somewhere other than the Dominican Republic — Panama has held tribute evenings for him in Chiriquí — while at home he is a name most people would not recognise.

He has kept a big band. The instrument, the arranging and the stand in front of the orchestra have been the same job for fifty years.',
       bio_es = 'Rafael Labasta es un trompetista, arreglista y director de orquesta dominicano, nacido en San Pedro de Macorís un veintidós de octubre. En la salsa le dicen el Mago de la Trompeta, e hizo toda su carrera fuera del país.

**Los años de músico acompañante**

Antes de tener orquesta propia tocó la trompeta en las bandas de Tito Rodríguez, Tito Puente, Machito y Cortijo y su Combo. Son cuatro de las orquestas fundadoras de la escena latina de Nueva York y Puerto Rico, y que un dominicano ocupara una silla en todas ellas no es dato menor.

La trompeta en esa música es un trabajo al descubierto. La sección carga el mambo, los solos son cortos y públicos, y en una banda de ese tamaño no hay dónde esconderse. Que lo contrataran Puente y Machito es un veredicto técnico tanto como musical.

**Panamá**

Llegó a Panamá y se quedó. En 1971 armó allí su propia orquesta, y Panamá se convirtió en lo que un historiador de la salsa llama su segunda patria: el lugar que le transformó la vida, y donde se le recuerda como figura propia y no como visitante.

Los discos vinieron rápido. En Vivo en el Rancho Grande y Labasta Llegó son los dos de 1972, Con su Salsa… y Basta de 1974. Zum Zum Ba Ba É, Guanguacó Bongó, El Rey de los Pollos, Grande Grande, Esta Noche la Paso Contigo.

El que la gente pide es No Volveré: una ranchera mexicana de Manuel Esperón, desarmada y vuelta a armar como salsa. Hacerle eso a una ranchera era la clase de jugada que premiaban los setenta: la melodía ya estaba en el oído de todos, y oírla volver con sección de metales y bongó era a la vez el chiste y el asunto.

**Profeta fuera de su tierra**

Herencia Latina lo llama exactamente así. Es uno de esos músicos dominicanos cuyo trabajo está documentado, homenajeado y enseñado en otra parte y no en República Dominicana —Panamá le ha montado noches de homenaje en Chiriquí— mientras que en su país es un nombre que casi nadie reconocería.

Ha mantenido una big band. El instrumento, los arreglos y el atril delante de la orquesta han sido el mismo oficio durante cincuenta años.',
       updated_at = now()
 WHERE slug = 'rafael-labasta';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rafael-labasta')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rafael-labasta')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Rafael Labasta is a Dominican trumpeter, arranger and orchestra leader, born in San Pedro de Macorís on the twenty-second of October. Salsa people call him el Mago de la Trompeta, and he made the whole of his career outside the country.","type":"text"}]},{"type":"paragraph","content":[{"text":"The sideman years","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Before he had an orchestra of his own he played trumpet in the bands of Tito Rodríguez, Tito Puente, Machito and Cortijo y su Combo. That is four of the founding orchestras of the New York and Puerto Rican Latin scene, and a Dominican holding a chair in all of them is not a small fact.","type":"text"}]},{"type":"paragraph","content":[{"text":"Trumpet in that music is exposed work. The section carries the mambo, the solos are short and public, and there is no hiding in a band that size. Getting hired by Puente and by Machito is a technical verdict as much as a musical one.","type":"text"}]},{"type":"paragraph","content":[{"text":"Panama","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He arrived in Panama and stayed. In 1971 he put his own orchestra together there, and Panama became what a salsa historian calls his second country — the place that transformed his life, and where he is remembered as a national figure rather than a visiting one.","type":"text"}]},{"type":"paragraph","content":[{"text":"The records came fast. En Vivo en el Rancho Grande and Labasta Llegó are both from 1972, Con su Salsa… y Basta from 1974. Zum Zum Ba Ba É, Guanguacó Bongó, El Rey de los Pollos, Grande Grande, Esta Noche la Paso Contigo.","type":"text"}]},{"type":"paragraph","content":[{"text":"The one people ask for is No Volveré — a Mexican ranchera by Manuel Esperón, taken apart and rebuilt as salsa. Doing that to a ranchera was the sort of move the seventies rewarded: the melody was already in everybody’s ear, and hearing it come back with a horn section and a bongó was the joke and the point at once.","type":"text"}]},{"type":"paragraph","content":[{"text":"A prophet outside his own country","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Herencia Latina calls him exactly that. He is one of the Dominican musicians whose work is documented, honoured and taught somewhere other than the Dominican Republic — Panama has held tribute evenings for him in Chiriquí — while at home he is a name most people would not recognise.","type":"text"}]},{"type":"paragraph","content":[{"text":"He has kept a big band. The instrument, the arranging and the stand in front of the orchestra have been the same job for fifty years.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'rafael-labasta'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Rafael Labasta es un trompetista, arreglista y director de orquesta dominicano, nacido en San Pedro de Macorís un veintidós de octubre. En la salsa le dicen el Mago de la Trompeta, e hizo toda su carrera fuera del país.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los años de músico acompañante","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Antes de tener orquesta propia tocó la trompeta en las bandas de Tito Rodríguez, Tito Puente, Machito y Cortijo y su Combo. Son cuatro de las orquestas fundadoras de la escena latina de Nueva York y Puerto Rico, y que un dominicano ocupara una silla en todas ellas no es dato menor.","type":"text"}]},{"type":"paragraph","content":[{"text":"La trompeta en esa música es un trabajo al descubierto. La sección carga el mambo, los solos son cortos y públicos, y en una banda de ese tamaño no hay dónde esconderse. Que lo contrataran Puente y Machito es un veredicto técnico tanto como musical.","type":"text"}]},{"type":"paragraph","content":[{"text":"Panamá","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Llegó a Panamá y se quedó. En 1971 armó allí su propia orquesta, y Panamá se convirtió en lo que un historiador de la salsa llama su segunda patria: el lugar que le transformó la vida, y donde se le recuerda como figura propia y no como visitante.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los discos vinieron rápido. En Vivo en el Rancho Grande y Labasta Llegó son los dos de 1972, Con su Salsa… y Basta de 1974. Zum Zum Ba Ba É, Guanguacó Bongó, El Rey de los Pollos, Grande Grande, Esta Noche la Paso Contigo.","type":"text"}]},{"type":"paragraph","content":[{"text":"El que la gente pide es No Volveré: una ranchera mexicana de Manuel Esperón, desarmada y vuelta a armar como salsa. Hacerle eso a una ranchera era la clase de jugada que premiaban los setenta: la melodía ya estaba en el oído de todos, y oírla volver con sección de metales y bongó era a la vez el chiste y el asunto.","type":"text"}]},{"type":"paragraph","content":[{"text":"Profeta fuera de su tierra","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Herencia Latina lo llama exactamente así. Es uno de esos músicos dominicanos cuyo trabajo está documentado, homenajeado y enseñado en otra parte y no en República Dominicana —Panamá le ha montado noches de homenaje en Chiriquí— mientras que en su país es un nombre que casi nadie reconocería.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ha mantenido una big band. El instrumento, los arreglos y el atril delante de la orquesta han sido el mismo oficio durante cincuenta años.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'rafael-labasta'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
