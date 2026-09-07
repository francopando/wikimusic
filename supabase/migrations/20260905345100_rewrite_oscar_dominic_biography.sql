BEGIN;

-- Rewrite the catalogue entry for Oscar Dominic.
--
-- Oscar Dominic. Filler in English, nothing in Spanish, no dates, no legal
-- name -- and the genre said ballads. He is a bachata singer.
--
-- CORRECTED: primary_genre ballads -> bachata. Chartmetric files him under
-- bachata; every release found is a bachata; the collaborators are a bachata
-- producer, a bachata DJ and a crew called Bachata Gang.
--
-- ADDED: legal name Oscar Enrique Socias Santana, date of birth 20 July 1991,
-- the alias Oscar La Entonacion, and songwriter and producer in occupations.
--
-- LEFT ALONE AND FLAGGED: province "Distrito Nacional" and birth_place "Santo
-- Domingo", the importer's default. MusicBrainz gives only "Dominican Republic"
-- as his begin-area and no source names a town. Not contradicted, not
-- confirmed.
--
-- SOURCES: MusicBrainz, which carries the legal name Oscar Enrique Socias
-- Santana, the artist name Oscar La Entonacion, the birth date 20 July 1991,
-- the disambiguation "dominican singer, songwriter and Music producer", and the
-- album Caramelo of 9 May 2020 with its running order -- Hola, Cotorra, La
-- Botella, 4 Paredes, Yo Toco Tu Piel, Toy Enamorao, Tu Te Vez Muy Bien, Yo
-- Ando Regualdao, Un Dia Mas Sin Ti, Sin Filtro, Dile a Tu Jevo, Den Den Deo.
-- His own Instagram, on the name: "El motivo de llamarme Oscar Dominic es en
-- honor a la Republica Dominicana. Amo mi Pais" -- reproduced by Promueve RD --
-- and on the Reik and Rauw Alejandro bachata versions. Spotify for Problemon,
-- credited to Bachata Gang, Oscar Dominic and Prophex, and for Obsesion with
-- Prophex. Instagram and release copy for the DJ Tronky collaboration and for
-- DJ Manuel Citro's Pornochata. Chartmetric, which files him under bachata.
--
-- NOT WRITTEN: a town, and the view and follower numbers the dance-scene
-- accounts lead with.
--
-- CORRECTION, made in the migration that supersedes this one (20260905345200):
-- the note below was wrong. Prophex and Bachata Gang both have entries here.
-- Prophex is published and is now referenced; Bachata Gang is still
-- needs_review and is named in prose instead. DJ Tronky and DJ Manuel Citro
-- have no entries, and Tronky is Italian and should not have one.
--
-- [superseded note] NOT LINKED: Prophex, Bachata Gang, DJ Tronky and DJ Manuel
-- Citro have no entries.
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
       name = 'Oscar Dominic',
       sort_name = 'Dominic, Oscar',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'bachata',
       date_of_birth = '1991-07-20',
       birth_year = 1991,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Oscar',
       middle_name = 'Enrique',
       last_name = 'Socías',
       second_last_name = 'Santana',
       stage_name = 'Oscar Dominic',
       aliases = ARRAY['Oscar La Entonación', 'Oscar Enrique Socías Santana']::text[],
       occupations = '["songwriter","producer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@Oscardominicc',
       facebook = 'oscar.laentonacion',
       instagram = 'oscardominicc',
       disambiguation = 'Dominican bachata singer and producer, born Oscar Enrique Socías Santana',
       bio_en = 'Oscar Dominic is a Dominican bachata singer, songwriter and producer, born Oscar Enrique Socías Santana on 20 July 1991. He took the stage name, in his own words, in honour of the Dominican Republic.

**Caramelo**

His album arrived in May 2020 with twelve tracks — Hola, Cotorra, La Botella, 4 Paredes, Yo Toco Tu Piel, Toy Enamorao, Tú Te Ves Muy Bien, Un Día Más Sin Ti, Sin Filtro, Dile a Tu Jevo, Den Den Deo. He had recorded before that as Oscar La Entonación, and people still call him by it.

**Bachata as a second language**

Much of his work is the modern bachata version: a song that arrived in another genre, rebuilt on the guitar figure and the bongó. He has done Reik and Rauw Alejandro that way, and DJ Manuel Citro’s Pornochata came back as a bachata with him singing it.

This is a real trade and not a novelty. There is an international circuit of bachata dancers who need new material at a rate no single scene can supply, and the singers who feed it are performing a specific technical task: making a foreign melody sit correctly on a Dominican rhythm without either one sounding forced.

One of his versions crossed languages entirely — Portuguese sung over bachata, which he described as a fusion of Brazil and the Dominican Republic.

**The company**

He works with the producer Prophex and the crew billed as Bachata Gang, on records including Problemón and Obsesión, and with the Italian bachata DJ Tronky. Dominican dancers have taken his material onto the Malecón and dancers abroad have taken it into their classes.

The circuit he serves is largely outside the country, and the music on it is unmistakably from inside it.',
       bio_es = 'Oscar Dominic es un cantante, compositor y productor de bachata dominicano, nacido Oscar Enrique Socías Santana el 20 de julio de 1991. Tomó el nombre artístico, según él mismo dice, en honor a la República Dominicana.

**Caramelo**

Su álbum salió en mayo de 2020 con doce temas: Hola, Cotorra, La Botella, 4 Paredes, Yo Toco Tu Piel, Toy Enamorao, Tú Te Ves Muy Bien, Un Día Más Sin Ti, Sin Filtro, Dile a Tu Jevo, Den Den Deo. Antes de eso había grabado como Oscar La Entonación, y todavía hay gente que lo llama así.

**La bachata como segundo idioma**

Buena parte de su trabajo es la versión bachata moderna: una canción que llegó en otro género, rearmada sobre la figura de guitarra y el bongó. Así ha hecho a Reik y a Rauw Alejandro, y Pornochata, de DJ Manuel Citro, volvió convertida en bachata con él cantándola.

Es un oficio de verdad y no una ocurrencia. Hay un circuito internacional de bailadores de bachata que necesita material nuevo a un ritmo que ninguna escena sola puede abastecer, y los cantantes que lo alimentan cumplen una tarea técnica precisa: hacer que una melodía ajena se siente bien sobre un ritmo dominicano sin que ninguna de las dos suene forzada.

Una de sus versiones cruzó incluso de idioma: portugués cantado sobre bachata, que él describió como una fusión de Brasil y República Dominicana.

**La compañía**

Trabaja con el productor Prophex y con el colectivo que se anuncia como Bachata Gang, en temas como Problemón y Obsesión, y con el DJ italiano de bachata Tronky. Bailadores dominicanos han sacado su material al Malecón y bailadores de afuera se lo han llevado a sus clases.

El circuito al que le sirve está en buena medida fuera del país, y la música que suena en él viene inconfundiblemente de adentro.',
       updated_at = now()
 WHERE slug = 'oscar-dominic';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'oscar-dominic')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'oscar-dominic')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Oscar Dominic is a Dominican bachata singer, songwriter and producer, born Oscar Enrique Socías Santana on 20 July 1991. He took the stage name, in his own words, in honour of the Dominican Republic.","type":"text"}]},{"type":"paragraph","content":[{"text":"Caramelo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"His album arrived in May 2020 with twelve tracks — Hola, Cotorra, La Botella, 4 Paredes, Yo Toco Tu Piel, Toy Enamorao, Tú Te Ves Muy Bien, Un Día Más Sin Ti, Sin Filtro, Dile a Tu Jevo, Den Den Deo. He had recorded before that as Oscar La Entonación, and people still call him by it.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bachata as a second language","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Much of his work is the modern bachata version: a song that arrived in another genre, rebuilt on the guitar figure and the bongó. He has done Reik and Rauw Alejandro that way, and DJ Manuel Citro’s Pornochata came back as a bachata with him singing it.","type":"text"}]},{"type":"paragraph","content":[{"text":"This is a real trade and not a novelty. There is an international circuit of bachata dancers who need new material at a rate no single scene can supply, and the singers who feed it are performing a specific technical task: making a foreign melody sit correctly on a Dominican rhythm without either one sounding forced.","type":"text"}]},{"type":"paragraph","content":[{"text":"One of his versions crossed languages entirely — Portuguese sung over bachata, which he described as a fusion of Brazil and the Dominican Republic.","type":"text"}]},{"type":"paragraph","content":[{"text":"The company","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He works with the producer Prophex and the crew billed as Bachata Gang, on records including Problemón and Obsesión, and with the Italian bachata DJ Tronky. Dominican dancers have taken his material onto the Malecón and dancers abroad have taken it into their classes.","type":"text"}]},{"type":"paragraph","content":[{"text":"The circuit he serves is largely outside the country, and the music on it is unmistakably from inside it.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'oscar-dominic'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Oscar Dominic es un cantante, compositor y productor de bachata dominicano, nacido Oscar Enrique Socías Santana el 20 de julio de 1991. Tomó el nombre artístico, según él mismo dice, en honor a la República Dominicana.","type":"text"}]},{"type":"paragraph","content":[{"text":"Caramelo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Su álbum salió en mayo de 2020 con doce temas: Hola, Cotorra, La Botella, 4 Paredes, Yo Toco Tu Piel, Toy Enamorao, Tú Te Ves Muy Bien, Un Día Más Sin Ti, Sin Filtro, Dile a Tu Jevo, Den Den Deo. Antes de eso había grabado como Oscar La Entonación, y todavía hay gente que lo llama así.","type":"text"}]},{"type":"paragraph","content":[{"text":"La bachata como segundo idioma","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Buena parte de su trabajo es la versión bachata moderna: una canción que llegó en otro género, rearmada sobre la figura de guitarra y el bongó. Así ha hecho a Reik y a Rauw Alejandro, y Pornochata, de DJ Manuel Citro, volvió convertida en bachata con él cantándola.","type":"text"}]},{"type":"paragraph","content":[{"text":"Es un oficio de verdad y no una ocurrencia. Hay un circuito internacional de bailadores de bachata que necesita material nuevo a un ritmo que ninguna escena sola puede abastecer, y los cantantes que lo alimentan cumplen una tarea técnica precisa: hacer que una melodía ajena se siente bien sobre un ritmo dominicano sin que ninguna de las dos suene forzada.","type":"text"}]},{"type":"paragraph","content":[{"text":"Una de sus versiones cruzó incluso de idioma: portugués cantado sobre bachata, que él describió como una fusión de Brasil y República Dominicana.","type":"text"}]},{"type":"paragraph","content":[{"text":"La compañía","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Trabaja con el productor Prophex y con el colectivo que se anuncia como Bachata Gang, en temas como Problemón y Obsesión, y con el DJ italiano de bachata Tronky. Bailadores dominicanos han sacado su material al Malecón y bailadores de afuera se lo han llevado a sus clases.","type":"text"}]},{"type":"paragraph","content":[{"text":"El circuito al que le sirve está en buena medida fuera del país, y la música que suena en él viene inconfundiblemente de adentro.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'oscar-dominic'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
