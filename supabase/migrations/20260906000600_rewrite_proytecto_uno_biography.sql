BEGIN;

-- Rewrite the catalogue entry for Proyecto Uno.
--
-- Proyecto Uno. Filler in English, nothing in Spanish, no founding year, no
-- members, no genre that means anything -- on the group that invented
-- merenhouse.
--
-- CORRECTED: primary_genre urban-rap-hip-hop -> merengue-house. The taxonomy
-- already has the exact slug for what they made, and they are the reason it
-- exists. urban-rap-hip-hop and merengue-urbano move into genres.
--
-- CORRECTED: province "Distrito Nacional" -> "Born Abroad". The row already
-- said birth_place "New York City, New York, USA" and then contradicted itself
-- with a Dominican province. They are a New York group of Dominican musicians,
-- which is what the Born Abroad sentinel and the diaspora tag are for; both are
-- applied.
--
-- ADDED: birth_year 1989, the founding year, and composer and producer in
-- occupations.
--
-- SLUG DEFECT, NOT FIXED -- FOR THE EDITOR: the slug is "proytecto-uno", a
-- typo. Correcting it to "proyecto-uno" would change a live public URL, and
-- there is no slug-level redirect machinery in the application: artist_redirects
-- maps old artist ids to canonical ones for merges, not old slugs to new ones,
-- and nothing in src/ reads it for routing. Renaming without that would break
-- every inbound link to the page, which the project's own rules forbid. Left
-- alone deliberately.
--
-- SOURCES: Spanish Wikipedia's article, which carries the formation -- founded
-- in 1989 by Nelson Zapata, first line-up Nelson Zapata and Ricky Echeverria,
-- first producers Nelson Zapata and Pavel de Jesus, first manager Porfirio
-- "Popi" Pina -- the current members Nelson Zapata, Kid G and Paolo Tondo, the
-- former members Ricky Echeverria, Magic Juan, Erick Morales, Johnny Salgado,
-- Josue Cedeno, Anthony Galindo and Jose Medina, the discography from Brinca
-- (1990) to Back in Da House (2025), the awards, and the claim that they were
-- the first group to commit fully to fusing merengue and hip hop, with the
-- qualification that Wilfrido Vargas's orchestra had already made merengue-rap
-- in the eighties. The same article notes El Tiburon at number 28 on VH1
-- Latino's "100 of the 90's" and the Colombian version of Esta Pega'o made for
-- the national team ahead of the 1994 World Cup. El Tiempo of Bogota, "El
-- tiburon con el que Proyecto Uno trasgredio las leyes del merengue".
--
-- NOT ADDED: the awards as artist_awards rows. Wikipedia lists Billboard Latin
-- Awards, Premios Lo Nuestro, ACE, Estrella and an Emmy, but the article carries
-- a references warning and the years and categories are inconsistently written.
-- They belong in the table once a primary source can be checked.
--
-- NOT LINKED: Fulanito, Sandy y Papo, Zona 7, Nelson Zapata and Magic Juan have
-- no entries; several of them plainly should.
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
       name = 'Proyecto Uno',
       sort_name = 'Proyecto Uno',
       type = 'group',
       status = 'published',
       gender = 'group',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'merengue-house',
       date_of_birth = NULL,
       birth_year = 1989,
       date_of_death = NULL,
       birth_place = 'New York City, New York, USA',
       province = 'Born Abroad',
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY[]::text[],
       occupations = '["composer","producer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['merengue-urbano', 'urban-rap-hip-hop']::text[],
       artist_tags = ARRAY['secular', 'diaspora', 'legend']::text[],
       website = NULL,
       youtube = '@proyectouno',
       facebook = 'proyectouno',
       instagram = 'proyectouno',
       disambiguation = 'Dominican-American group founded in New York in 1989; originators of merenhouse',
       bio_en = 'Proyecto Uno is a group of Dominican musicians founded in New York in 1989 by Nelson Zapata. They are the group that made merenhouse — merengue built on house and hip-hop production — into a genre, and El Tiburón is the record that carried it around the world.

**What they did to the merengue**

They were not the first to put a rap over a merengue: Wilfrido Vargas had been doing that with his orchestra through the eighties. What Proyecto Uno did was give the whole thing over to it. The horns went, the drum machine came in, the tempo locked to a dance floor rather than to a band, and the vocals became a chant traded between voices.

A Bogotá newspaper put it plainly years later: this is the record with which Proyecto Uno broke the laws of merengue. It was made by Dominicans who had grown up in New York, and it sounds like both places at once.

Everything that came after runs through them — Sandy y Papo, Fulanito, Ilegales, Zona 7. Merengue urbano and, later, dembow are downstream of what they built.

**The records**

Brinca came in 1990 and Todo el Mundo the year after. In Da House followed in 1994 and is the one that established them; New Era, 4, Pura Gozadera, Evolution, Original, Orgánico, Aniversario and Back in Da House take the story to the present.

El Tiburón, 25 Horas, Latinos, Está Pega’o, Another Night. They cut a dance record with Reel 2 Reel, which is how far outside the Latin market they were operating.

In Colombia, Está Pega’o was rewritten for the national football team on its way to the 1994 World Cup — the point at which a Dominican song stops being Dominican property and becomes somebody else’s anthem.

**Thirty-five years**

The line-up has turned over many times. Ricky Echeverría was there at the start; Magic Juan, Erick Morales, Johnny Salgado, Josué Cedeño, Anthony Galindo and José Medina passed through. Zapata is still there, now with Kid G and Paolo Tondo.

They have played Spain, Puerto Rico, Chile, Argentina, the Dominican Republic, Colombia, Venezuela, Mexico, Peru, Ecuador, Costa Rica, and further out than that — Japan, Australia, Thailand, Jerusalem. Billboard, Premios Lo Nuestro and an Emmy for original music composition are among the recognitions, and VH1 Latino placed El Tiburón in its hundred songs of the nineties.',
       bio_es = 'Proyecto Uno es un grupo de músicos dominicanos fundado en Nueva York en 1989 por Nelson Zapata. Son el grupo que convirtió el merenhouse —merengue montado sobre producción de house y de hip hop— en un género, y El Tiburón es el disco que lo llevó por el mundo.

**Lo que le hicieron al merengue**

No fueron los primeros en poner un rap sobre un merengue: Wilfrido Vargas llevaba haciéndolo con su orquesta desde los ochenta. Lo que hizo Proyecto Uno fue entregarle el disco entero. Se fueron los metales, entró la caja de ritmos, el tempo se amarró a una pista de baile y no a una banda, y la voz se volvió un cántico repartido entre varios.

Un periódico bogotano lo dijo sin rodeos años después: este es el disco con el que Proyecto Uno transgredió las leyes del merengue. Lo hicieron dominicanos criados en Nueva York, y suena a los dos sitios a la vez.

Todo lo que vino después pasa por ellos: Sandy y Papo, Fulanito, Ilegales, Zona 7. El merengue urbano y, más adelante, el dembow están río abajo de lo que ellos montaron.

**Los discos**

Brinca salió en 1990 y Todo el Mundo al año siguiente. In Da House vino en 1994 y es el que los estableció; New Era, 4, Pura Gozadera, Evolution, Original, Orgánico, Aniversario y Back in Da House traen la historia hasta hoy.

El Tiburón, 25 Horas, Latinos, Está Pega’o, Another Night. Grabaron un tema de pista con Reel 2 Reel, que da la medida de cuán lejos del mercado latino estaban operando.

En Colombia, Está Pega’o se rescribió para la selección de fútbol camino al Mundial de 1994: el punto en que una canción dominicana deja de ser propiedad dominicana y pasa a ser el himno de otro.

**Treinta y cinco años**

La formación ha rotado muchas veces. Ricky Echeverría estuvo desde el principio; por ahí pasaron Magic Juan, Erick Morales, Johnny Salgado, Josué Cedeño, Anthony Galindo y José Medina. Zapata sigue ahí, ahora con Kid G y Paolo Tondo.

Han tocado en España, Puerto Rico, Chile, Argentina, República Dominicana, Colombia, Venezuela, México, Perú, Ecuador y Costa Rica, y más lejos todavía: Japón, Australia, Tailandia, Jerusalén. Entre los reconocimientos hay Billboard, Premios Lo Nuestro y un Emmy de composición musical original, y VH1 Latino puso El Tiburón entre sus cien canciones de los noventa.',
       updated_at = now()
 WHERE slug = 'proytecto-uno';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'proytecto-uno')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'proytecto-uno')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Proyecto Uno is a group of Dominican musicians founded in New York in 1989 by Nelson Zapata. They are the group that made merenhouse — merengue built on house and hip-hop production — into a genre, and El Tiburón is the record that carried it around the world.","type":"text"}]},{"type":"paragraph","content":[{"text":"What they did to the merengue","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"They were not the first to put a rap over a merengue: ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"d4205306-e9eb-417d-8dd2-ad6d665e9aaa"}},{"text":" had been doing that with his orchestra through the eighties. What Proyecto Uno did was give the whole thing over to it. The horns went, the drum machine came in, the tempo locked to a dance floor rather than to a band, and the vocals became a chant traded between voices.","type":"text"}]},{"type":"paragraph","content":[{"text":"A Bogotá newspaper put it plainly years later: this is the record with which Proyecto Uno broke the laws of merengue. It was made by Dominicans who had grown up in New York, and it sounds like both places at once.","type":"text"}]},{"type":"paragraph","content":[{"text":"Everything that came after runs through them — Sandy y Papo, Fulanito, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"1cd11a22-573a-43b4-8f54-fbd08329a4e2","displayText":"Ilegales","occurrenceId":"729077a6-68d1-4b51-a379-e3f1bb2de55b"}},{"text":", Zona 7. Merengue urbano and, later, dembow are downstream of what they built.","type":"text"}]},{"type":"paragraph","content":[{"text":"The records","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Brinca came in 1990 and Todo el Mundo the year after. In Da House followed in 1994 and is the one that established them; New Era, 4, Pura Gozadera, Evolution, Original, Orgánico, Aniversario and Back in Da House take the story to the present.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Tiburón, 25 Horas, Latinos, Está Pega’o, Another Night. They cut a dance record with Reel 2 Reel, which is how far outside the Latin market they were operating.","type":"text"}]},{"type":"paragraph","content":[{"text":"In Colombia, Está Pega’o was rewritten for the national football team on its way to the 1994 World Cup — the point at which a Dominican song stops being Dominican property and becomes somebody else’s anthem.","type":"text"}]},{"type":"paragraph","content":[{"text":"Thirty-five years","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The line-up has turned over many times. Ricky Echeverría was there at the start; Magic Juan, Erick Morales, Johnny Salgado, Josué Cedeño, Anthony Galindo and José Medina passed through. Zapata is still there, now with Kid G and Paolo Tondo.","type":"text"}]},{"type":"paragraph","content":[{"text":"They have played Spain, Puerto Rico, Chile, Argentina, the Dominican Republic, Colombia, Venezuela, Mexico, Peru, Ecuador, Costa Rica, and further out than that — Japan, Australia, Thailand, Jerusalem. Billboard, Premios Lo Nuestro and an Emmy for original music composition are among the recognitions, and VH1 Latino placed El Tiburón in its hundred songs of the nineties.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'proytecto-uno'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Proyecto Uno es un grupo de músicos dominicanos fundado en Nueva York en 1989 por Nelson Zapata. Son el grupo que convirtió el merenhouse —merengue montado sobre producción de house y de hip hop— en un género, y El Tiburón es el disco que lo llevó por el mundo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que le hicieron al merengue","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"No fueron los primeros en poner un rap sobre un merengue: ","type":"text"},{"type":"artistReference","attrs":{"artistId":"2bc36959-dcce-4e10-9ecf-2cd418eaa489","displayText":"Wilfrido Vargas","occurrenceId":"f7733bbe-99fa-4bf3-a5e7-aef134871938"}},{"text":" llevaba haciéndolo con su orquesta desde los ochenta. Lo que hizo Proyecto Uno fue entregarle el disco entero. Se fueron los metales, entró la caja de ritmos, el tempo se amarró a una pista de baile y no a una banda, y la voz se volvió un cántico repartido entre varios.","type":"text"}]},{"type":"paragraph","content":[{"text":"Un periódico bogotano lo dijo sin rodeos años después: este es el disco con el que Proyecto Uno transgredió las leyes del merengue. Lo hicieron dominicanos criados en Nueva York, y suena a los dos sitios a la vez.","type":"text"}]},{"type":"paragraph","content":[{"text":"Todo lo que vino después pasa por ellos: Sandy y Papo, Fulanito, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"1cd11a22-573a-43b4-8f54-fbd08329a4e2","displayText":"Ilegales","occurrenceId":"488df8b6-fd52-4ccd-858c-f5291c947018"}},{"text":", Zona 7. El merengue urbano y, más adelante, el dembow están río abajo de lo que ellos montaron.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los discos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Brinca salió en 1990 y Todo el Mundo al año siguiente. In Da House vino en 1994 y es el que los estableció; New Era, 4, Pura Gozadera, Evolution, Original, Orgánico, Aniversario y Back in Da House traen la historia hasta hoy.","type":"text"}]},{"type":"paragraph","content":[{"text":"El Tiburón, 25 Horas, Latinos, Está Pega’o, Another Night. Grabaron un tema de pista con Reel 2 Reel, que da la medida de cuán lejos del mercado latino estaban operando.","type":"text"}]},{"type":"paragraph","content":[{"text":"En Colombia, Está Pega’o se rescribió para la selección de fútbol camino al Mundial de 1994: el punto en que una canción dominicana deja de ser propiedad dominicana y pasa a ser el himno de otro.","type":"text"}]},{"type":"paragraph","content":[{"text":"Treinta y cinco años","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La formación ha rotado muchas veces. Ricky Echeverría estuvo desde el principio; por ahí pasaron Magic Juan, Erick Morales, Johnny Salgado, Josué Cedeño, Anthony Galindo y José Medina. Zapata sigue ahí, ahora con Kid G y Paolo Tondo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Han tocado en España, Puerto Rico, Chile, Argentina, República Dominicana, Colombia, Venezuela, México, Perú, Ecuador y Costa Rica, y más lejos todavía: Japón, Australia, Tailandia, Jerusalén. Entre los reconocimientos hay Billboard, Premios Lo Nuestro y un Emmy de composición musical original, y VH1 Latino puso El Tiburón entre sus cien canciones de los noventa.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'proytecto-uno'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'proytecto-uno') AND locale = 'en'), '729077a6-68d1-4b51-a379-e3f1bb2de55b', 'artist', '1cd11a22-573a-43b4-8f54-fbd08329a4e2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'proytecto-uno') AND locale = 'en'), 'd4205306-e9eb-417d-8dd2-ad6d665e9aaa', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'proytecto-uno') AND locale = 'es'), '488df8b6-fd52-4ccd-858c-f5291c947018', 'artist', '1cd11a22-573a-43b4-8f54-fbd08329a4e2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'proytecto-uno') AND locale = 'es'), 'f7733bbe-99fa-4bf3-a5e7-aef134871938', 'artist', '2bc36959-dcce-4e10-9ecf-2cd418eaa489');

COMMIT;
