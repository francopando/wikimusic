BEGIN;

-- Rewrite the catalogue entry for Zawezo.
--
-- Zawezo. Filler in English, nothing in Spanish, no occupations, no genres --
-- and a genre, a name and a whole second career that the row had no idea about.
--
-- NAME CHANGED, AND THE EDITOR SHOULD CONFIRM IT. The row read "Zawezo Del
-- 'Patio", with a stray space before the apostrophe. He has dropped the suffix:
-- his YouTube channel, his website and his Instagram all bill him simply as
-- Zawezo. The display name becomes Zawezo and both older spellings go into
-- aliases. The slug is untouched, so nothing routing to zawezo-del-patio
-- breaks.
--
-- GENRE CORRECTED: primary_genre urban-dembow -> urban-rap-hip-hop. This is not
-- a fine distinction. What he releases now is conceptual rap with Latin and
-- astronomical titles -- Codex Eternum, Caecvs, Sirius, Orion, LaelliouL -- and
-- a serialised project called Snake Tongue whose instalments are lettered A, B,
-- C, D and onward. There is no dembow anywhere in it. primary_role singer ->
-- rapper.
--
-- ADDED: occupations composer, genres, aliases, disambiguation, the diaspora
-- tag.
--
-- LEFT ALONE: province and birth_place San Cristóbal, and first_name Alex /
-- last_name García, all already stored. The name is corroborated: the fifteenth
-- Latin Grammy ballot entry list of 2014 credits "Alex Garcia" as a songwriter
-- on an entry filed under Zawezo Del'patio. One video essay about him calls him
-- Alexis García; the ballot list is the harder document and the stored form is
-- kept.
--
-- SOURCES: his own YouTube channel, which has two hundred and ninety videos and
-- is where the current work lives -- Snake Tongue and its lettered instalments,
-- Codex Eternum, Caecvs, O.D.D.S, Aves, Bait, Mentiras, Sirius, R.A.P and
-- Críticas, the last credited to K.O el Más Completo as engineer and to AMD
-- Music as label. His site, zawezo.online, which lists a New York and New
-- Jersey address, sells a physical album called Orion credited to Zawezo, K.O
-- and Jazz, and is operated as ZAWEZO LLC. His Instagram, where the profile
-- reads "Cantante / Rap / Consciencia / Researcher / La verdad no es para
-- todos". MusicBrainz for the early catalogue: the album El Circo and the
-- singles Remember Me and Voy a Mi, all 2011, and Como Tú No Hay Nadie, 2012,
-- with the CD Baby, Beatport and iTunes listings that go with them. The
-- Alofoke Radio Show interview of about eleven years ago, whose subject is the
-- terms on which he would record with Sensato again. The fifteenth Latin
-- Grammy ballot entry list of 2014.
--
-- A CAREFUL DISTINCTION. Being on a Latin Grammy ballot entry list is not a
-- nomination -- the list is every record submitted for consideration that year.
-- It is recorded here as what it is and no award row is created.
--
-- NOT WRITTEN: subscriber and view counts. Nothing about what the "verdad
-- oculta" videos made about him claim; they are other people's speculation.
--
-- NOT LINKED: Sensato, K.O el Más Completo and Jazz are Dominican and have no
-- entries. Sensato in particular is a gap.
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
       name = 'Zawezo',
       sort_name = 'Zawezo',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'rapper',
       primary_genre = 'urban-rap-hip-hop',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'San Cristóbal',
       province = 'San Cristóbal',
       first_name = 'Alex',
       middle_name = NULL,
       last_name = 'García',
       second_last_name = NULL,
       stage_name = 'Zawezo',
       aliases = ARRAY['Zawezo Del''Patio', 'Zawezo Delpatio', 'Zawezo Del Patio']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'urban-dembow']::text[],
       artist_tags = ARRAY['secular', 'diaspora']::text[],
       website = 'https://www.zawezo.online',
       youtube = '@Zawezo',
       facebook = 'ZAWEZODP',
       instagram = 'zawezo',
       disambiguation = 'Rapper from San Cristóbal working out of New York; the Snake Tongue series',
       bio_en = 'Zawezo, born Alex García in San Cristóbal, is a Dominican rapper and songwriter. He recorded for years as Zawezo Del’Patio, dropped the suffix, and has spent the last stretch of his career making something almost nobody else in Dominican music is making.

**Del’Patio**

The early records are the ones the catalogue knew about: the album El Circo and the singles Remember Me and Voy a Mi in 2011, Como Tú No Hay Nadie the year after, released through the independent distributors an artist used before streaming — CD Baby, Beatport, iTunes.

He was inside the Dominican urban scene of that moment and worked with Sensato, and an interview from about eleven years ago is entirely about the terms on which he would work with him again. In 2014 a song of his went onto the Latin Grammy ballot list, with his legal name in the songwriting credits alongside two American writers. That is not a nomination — the ballot list is everything submitted — but it means the paperwork was being done properly.

**Snake Tongue**

What he does now has almost no relation to that. Snake Tongue is a serialised project released letter by letter — A, then B, subtitled Babylon, then C, D, E, F, G. Around it sit Codex Eternum, Caecvs, LaelliouL, O.D.D.S, Aves and Sirius, and the physical album Orion, made with K.O and Jazz.

The titles are Latin, astronomical or invented, the delivery is unhurried, and he describes himself on his own profile as a researcher before he describes himself as a singer. A track called simply R.A.P., made with K.O el Más Completo, is the one place he states the position plainly.

**An audience for a difficult record**

He works from New York and New Jersey and runs his own company, sells physical copies at a moment when almost nobody does, and holds an audience of a hundred and sixty thousand on his channel without a hit, without radio and without a label behind him.

That is an unusual thing for a Dominican rapper to have built. The genre at home runs on the single that works this season; his catalogue is designed to be followed rather than sampled, and enough people are following it.',
       bio_es = 'Zawezo, de nombre Alex García y nacido en San Cristóbal, es rapero y compositor dominicano. Grabó durante años como Zawezo Del’Patio, se quitó el apellido, y ha pasado el último tramo de su carrera haciendo algo que casi nadie más hace en la música dominicana.

**Del’Patio**

Los discos tempranos son los que la base conocía: el álbum El Circo y los sencillos Remember Me y Voy a Mi en 2011, Como Tú No Hay Nadie al año siguiente, publicados por los distribuidores independientes que usaba un artista antes del streaming: CD Baby, Beatport, iTunes.

Estaba dentro de la escena urbana dominicana de ese momento y trabajó con Sensato, y una entrevista de hace unos once años trata enteramente sobre las condiciones bajo las cuales volvería a trabajar con él. En 2014 una canción suya entró a la lista de participantes del Latin Grammy, con su nombre legal en los créditos de autoría junto a dos escritores estadounidenses. Eso no es una nominación —la lista es todo lo que se somete— pero significa que el papeleo se estaba haciendo bien.

**Snake Tongue**

Lo que hace ahora casi no tiene relación con aquello. Snake Tongue es un proyecto por entregas publicado letra por letra: A, después B, subtitulada Babylon, después C, D, E, F, G. Alrededor están Codex Eternum, Caecvs, LaelliouL, O.D.D.S, Aves y Sirius, y el álbum físico Orion, hecho con K.O y Jazz.

Los títulos son latinos, astronómicos o inventados, la entrega va sin apuro, y en su propio perfil se describe como investigador antes que como cantante. Un tema llamado simplemente R.A.P., hecho con K.O el Más Completo, es el único sitio donde formula la posición sin rodeos.

**Público para un disco difícil**

Trabaja desde Nueva York y Nueva Jersey y maneja su propia compañía, vende copias físicas en un momento en que casi nadie lo hace, y sostiene un público de ciento sesenta mil personas en su canal sin un éxito, sin radio y sin sello detrás.

Eso es una cosa rara de haber construido para un rapero dominicano. El género en casa funciona con el sencillo que sirve esta temporada; su catálogo está hecho para seguirse y no para picotearse, y hay bastante gente siguiéndolo.',
       updated_at = now()
 WHERE slug = 'zawezo-del-patio';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'zawezo-del-patio')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'zawezo-del-patio')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Zawezo, born Alex García in San Cristóbal, is a Dominican rapper and songwriter. He recorded for years as Zawezo Del’Patio, dropped the suffix, and has spent the last stretch of his career making something almost nobody else in Dominican music is making.","type":"text"}]},{"type":"paragraph","content":[{"text":"Del’Patio","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The early records are the ones the catalogue knew about: the album El Circo and the singles Remember Me and Voy a Mi in 2011, Como Tú No Hay Nadie the year after, released through the independent distributors an artist used before streaming — CD Baby, Beatport, iTunes.","type":"text"}]},{"type":"paragraph","content":[{"text":"He was inside the Dominican urban scene of that moment and worked with Sensato, and an interview from about eleven years ago is entirely about the terms on which he would work with him again. In 2014 a song of his went onto the Latin Grammy ballot list, with his legal name in the songwriting credits alongside two American writers. That is not a nomination — the ballot list is everything submitted — but it means the paperwork was being done properly.","type":"text"}]},{"type":"paragraph","content":[{"text":"Snake Tongue","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"What he does now has almost no relation to that. Snake Tongue is a serialised project released letter by letter — A, then B, subtitled Babylon, then C, D, E, F, G. Around it sit Codex Eternum, Caecvs, LaelliouL, O.D.D.S, Aves and Sirius, and the physical album Orion, made with K.O and Jazz.","type":"text"}]},{"type":"paragraph","content":[{"text":"The titles are Latin, astronomical or invented, the delivery is unhurried, and he describes himself on his own profile as a researcher before he describes himself as a singer. A track called simply R.A.P., made with K.O el Más Completo, is the one place he states the position plainly.","type":"text"}]},{"type":"paragraph","content":[{"text":"An audience for a difficult record","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He works from New York and New Jersey and runs his own company, sells physical copies at a moment when almost nobody does, and holds an audience of a hundred and sixty thousand on his channel without a hit, without radio and without a label behind him.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is an unusual thing for a Dominican rapper to have built. The genre at home runs on the single that works this season; his catalogue is designed to be followed rather than sampled, and enough people are following it.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'zawezo-del-patio'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Zawezo, de nombre Alex García y nacido en San Cristóbal, es rapero y compositor dominicano. Grabó durante años como Zawezo Del’Patio, se quitó el apellido, y ha pasado el último tramo de su carrera haciendo algo que casi nadie más hace en la música dominicana.","type":"text"}]},{"type":"paragraph","content":[{"text":"Del’Patio","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Los discos tempranos son los que la base conocía: el álbum El Circo y los sencillos Remember Me y Voy a Mi en 2011, Como Tú No Hay Nadie al año siguiente, publicados por los distribuidores independientes que usaba un artista antes del streaming: CD Baby, Beatport, iTunes.","type":"text"}]},{"type":"paragraph","content":[{"text":"Estaba dentro de la escena urbana dominicana de ese momento y trabajó con Sensato, y una entrevista de hace unos once años trata enteramente sobre las condiciones bajo las cuales volvería a trabajar con él. En 2014 una canción suya entró a la lista de participantes del Latin Grammy, con su nombre legal en los créditos de autoría junto a dos escritores estadounidenses. Eso no es una nominación —la lista es todo lo que se somete— pero significa que el papeleo se estaba haciendo bien.","type":"text"}]},{"type":"paragraph","content":[{"text":"Snake Tongue","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Lo que hace ahora casi no tiene relación con aquello. Snake Tongue es un proyecto por entregas publicado letra por letra: A, después B, subtitulada Babylon, después C, D, E, F, G. Alrededor están Codex Eternum, Caecvs, LaelliouL, O.D.D.S, Aves y Sirius, y el álbum físico Orion, hecho con K.O y Jazz.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los títulos son latinos, astronómicos o inventados, la entrega va sin apuro, y en su propio perfil se describe como investigador antes que como cantante. Un tema llamado simplemente R.A.P., hecho con K.O el Más Completo, es el único sitio donde formula la posición sin rodeos.","type":"text"}]},{"type":"paragraph","content":[{"text":"Público para un disco difícil","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Trabaja desde Nueva York y Nueva Jersey y maneja su propia compañía, vende copias físicas en un momento en que casi nadie lo hace, y sostiene un público de ciento sesenta mil personas en su canal sin un éxito, sin radio y sin sello detrás.","type":"text"}]},{"type":"paragraph","content":[{"text":"Eso es una cosa rara de haber construido para un rapero dominicano. El género en casa funciona con el sencillo que sirve esta temporada; su catálogo está hecho para seguirse y no para picotearse, y hay bastante gente siguiéndolo.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'zawezo-del-patio'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
