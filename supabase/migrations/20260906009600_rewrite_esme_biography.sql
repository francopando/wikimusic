BEGIN;

-- Rewrite the catalogue entry for Esme.
--
-- Esme. Filler in English, nothing in Spanish, no genres, no instruments, no
-- disambiguation -- and an Instagram handle pointing at a Mexican television
-- presenter.
--
-- THE INSTAGRAM HANDLE WAS THE WRONG PERSON. The row stored instagram
-- "esmeoficial". That account is Esmeralda Ugalde, presenter of Venga la
-- Alegría, "Conductora, actriz y cantante" -- a Mexican TV host with no
-- connection to this artist at all. His own YouTube About panel links
-- instagram.com/esmemusic, and that account reads "ESME | BACHATA". Corrected.
-- This is the most consequential single-field error found in the run so far:
-- the profile page was sending readers to a stranger.
--
-- The other two handles check out. facebook "esmemusica" and youtube
-- "@EstyleKiDo" are both linked from his own channel, and @EstyleKiDo is a
-- legacy handle on a channel titled EsmeMusic, not a wrong record.
--
-- LEFT ALONE, CHECKED FIRST: date_of_birth 1994-06-24 and birth_year 1994, both
-- confirmed by MusicBrainz's life-span; province La Vega and birth_place
-- Constanza, confirmed by MusicBrainz's begin-area La Vega; the legal name
-- Elmer Abreu Suriel, which Hoy printed on 2 June 2017 and which Apple Music
-- carries as the composer credit on Amantes; primary_role singer and
-- primary_genre bachata. The discarded filler paragraph said 1993 and it was
-- wrong.
--
-- ADDED: occupations producer beside the composer already stored -- and this is
-- from rights metadata, not from a bio. The distribution credit on No Te Quiero
-- Ver reads "Producer: Elmer \"Esme\" Abreu Suriel", with him and Edgar Gabriel
-- Frías as lyricists and composers. instruments guitar. disambiguation.
--
-- genres LEFT EMPTY ON PURPOSE. What he plays outside straight bachata is Latin
-- pop, R&B and one kizomba record, and none of those three has an active slug in
-- the genres table. Adding an approximation would be worse than an empty array.
-- Same situation as the bachateros of the previous entries, and the reason is
-- the same: the active vocabulary has no room below `bachata`.
--
-- A CLAIM NOT USED. EverybodyWiki's page on him -- which is a Wikipedia draft
-- that was rejected and rehosted, and reads as self-written -- says he won
-- Telemundo's Premios Viva La Juventud as best new artist for Perteneces a
-- Nadie. Nothing else found says so, and the page cites no source for it. It is
-- not in the entry and no awards row is created. The same page is the only
-- source for his influences and for the Italian chart placings, and neither of
-- those is used either.
--
-- NO NUMBERS. Hoy's 2017 piece leads with a Spotify play count and the video
-- figures are large. None of it appears here.
--
-- FAMILY LEFT OUT. The EverybodyWiki page builds his whole origin story around
-- his mother. The move from Constanza to Queens at eight is geography and it is
-- the single most important fact about what kind of bachatero he is, so it
-- stays; the family circumstances do not.
--
-- SOURCES: his own YouTube channel -- the About panel, the thirty video titles,
-- and the auto-generated distribution credits, which carry the label, the
-- release dates and the production credit. His own Instagram and Facebook. Hoy,
-- 2 June 2017, an independent Dominican newspaper, for the legal name and the
-- debut single. Apple Music's credit panel on Amantes, for Elmer Abreu Suriel as
-- composer and SP Polanco as producer. MusicBrainz for the birth date, the
-- begin-area and the release list. go&dance's listing for the Malta date of the
-- 2025 world tour. SoundCloud and Apple Music for the album track lists and the
-- 17 November 2025 date of Game Over (On The Run).
--
-- NOT LINKED: Romeo Santos still has no entry, which is the second time in this
-- run that his absence has cost a link. Pedro "sP" Polanco, TutuSonido, Akai
-- Rojas, Ari Xo, Jae Camilo, Savi Rodríguez, Frías, Wilven Bello, J Melaza,
-- Relleo and DJ Zero NYC have no entries; they go on the missing list, which is
-- where the Sangre Nueva roster mostly lives.
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
       name = 'Esme',
       sort_name = 'Esme',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'bachata',
       date_of_birth = '1994-06-24',
       birth_year = 1994,
       date_of_death = NULL,
       birth_place = 'Constanza',
       province = 'La Vega',
       first_name = 'Elmer',
       middle_name = NULL,
       last_name = 'Abreu',
       second_last_name = 'Suriel',
       stage_name = 'Esme',
       aliases = ARRAY['Elmer Abreu Suriel']::text[],
       occupations = '["composer","producer"]'::jsonb,
       instruments = ARRAY['guitar']::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@EstyleKiDo',
       facebook = 'esmemusica',
       instagram = 'esmemusic',
       disambiguation = 'Bachata singer, songwriter and producer working out of New York; Amantes, Game Over',
       bio_en = 'Esme, born Elmer Abreu Suriel, is a Dominican bachata singer, songwriter and record producer. He writes what he sings, produces most of it, and has built an audience that is only partly Dominican.

**Constanza to Queens**

He is from Constanza, high in the mountains of La Vega — the coldest town in the country, a place of vegetable farms and strawberry fields, and about as far from a bachata scene as the Dominican Republic gets.

He left for Queens at eight. That makes him a New York bachatero, which is now a recognisable kind of artist rather than an exception: the genre has had a second capital in the outer boroughs for thirty years, and the records made there answer to a different audience than the ones made in Santiago.

**Perteneces a Nadie**

His first single arrived in 2017, and a Dominican newspaper was writing about the video within weeks of it going up. The first album was produced by Pedro Polanco, who works as sP, and something happened during those sessions that is the wrong way round: he bought his first guitar while making the record, and discovered he could write.

Most singers learn the instrument and then find the songs. Doing it in that order tends to produce a writer who thinks in melody and arrangement rather than in chord shapes, which is audible in what came next.

Amantes, in 2018, is the one that travelled. He put it out himself, and only afterwards did the album iluso come through a label. Perteneces a Nadie and Amantes were both re-released on it.

**The dance floor circuit**

Bachata has an international audience that has nothing to do with Dominican radio: a circuit of dance schools, congresses and festivals running through Italy, Spain, eastern Europe and the American cities with a Latin dance scene. Records get chosen there for what a couple can do to them.

Amantes was picked up by that circuit, and it took him to the Chicago International Salsa Congress with a live band, and later to Malta on a world tour. It is a career shape almost invisible from Santo Domingo and entirely real.

**Game Over**

The album Game Over, subtitled Bachata’s Most Wanted, arrived with ten more songs — Te Burlaste De Mi, Calor, Tiempo, Te Felicito, Botella, Triste, Tu Y Yo, Dilema, Bachata Pegao and one simply called República Dominicana. Doble Vida, with Karlos Rosé, came out of the same period.

The sequel, Game Over (On The Run), was launched in character: his own page announced that the singer had been declared missing, and the record turned up instead. Bachata does not usually go in for that sort of thing, and the fact that he does is the point — the fugitive framing is the closest a bachatero has come to running an album campaign like a rapper.

**Sangre Nueva**

Sangre Nueva, subtitled Freshmen Year, is the more interesting project. It is an album built almost entirely out of duets with bachateros nobody had heard of, released through his label with him producing, and the naming — a freshman year, with a sophomore year to follow — says exactly what it is for.

An established singer handing half of each track to a newcomer is a form of patronage the genre has always run on and rarely admits to. He has made it the format. The second volume is already releasing singles.

His own channel has him on a Dominican stage with Prince Royce and Romeo Santos, which is the other kind of endorsement — the one where the two biggest names in modern bachata call you up to sing.',
       bio_es = 'Esme, de nombre Elmer Abreu Suriel, es cantante, compositor y productor de bachata dominicano. Escribe lo que canta, produce casi todo, y se armó un público que solo en parte es dominicano.

**De Constanza a Queens**

Es de Constanza, en lo alto de las montañas de La Vega: el pueblo más frío del país, de conucos de hortalizas y fresas, y más o menos lo más lejos que se puede estar de una escena bachatera dentro de la República Dominicana.

Se fue a Queens a los ocho años. Eso lo hace un bachatero de Nueva York, que a estas alturas es una clase de artista reconocible y no una excepción: el género tiene una segunda capital en los condados de afuera desde hace treinta años, y los discos que se hacen allá le responden a otro público que los que se hacen en Santiago.

**Perteneces a Nadie**

Su primer sencillo salió en 2017, y a las pocas semanas de subir el video ya escribía sobre él un periódico dominicano. El primer álbum lo produjo Pedro Polanco, que firma como sP, y en esas sesiones pasó algo que va al revés: compró su primera guitarra mientras grababa el disco, y descubrió que sabía componer.

Casi todos los cantantes aprenden el instrumento y después encuentran las canciones. Hacerlo en ese orden suele producir un autor que piensa en melodía y en arreglo antes que en posiciones de acordes, y eso se oye en lo que vino después.

Amantes, de 2018, es la que viajó. La sacó él mismo, y solo después llegó el álbum iluso por un sello. Perteneces a Nadie y Amantes se reeditaron ahí dentro.

**El circuito de las pistas**

La bachata tiene un público internacional que no tiene nada que ver con la radio dominicana: un circuito de escuelas de baile, congresos y festivales que corre por Italia, España, Europa del este y las ciudades norteamericanas con movida latina. Ahí los discos se escogen por lo que una pareja puede hacerles encima.

Amantes la agarró ese circuito, y de ahí salió el Chicago International Salsa Congress con banda en vivo, y más adelante Malta en una gira mundial. Es una forma de carrera casi invisible desde Santo Domingo y completamente real.

**Game Over**

El álbum Game Over, subtitulado Bachata’s Most Wanted, trajo diez canciones más: Te Burlaste De Mi, Calor, Tiempo, Te Felicito, Botella, Triste, Tu Y Yo, Dilema, Bachata Pegao y una llamada simplemente República Dominicana. Doble Vida, con Karlos Rosé, salió de ese mismo tramo.

La segunda parte, Game Over (On The Run), la lanzó metido en el personaje: su propia página anunció que el cantante había sido declarado desaparecido, y lo que apareció fue el disco. La bachata no suele hacer esas cosas, y que él sí las haga es justamente el punto: lo del prófugo es lo más cerca que ha estado un bachatero de montar una campaña de disco como la monta un rapero.

**Sangre Nueva**

Sangre Nueva, subtitulado Freshmen Year, es el proyecto más interesante. Es un álbum armado casi entero con dúos con bachateros que nadie había oído, sacado por su sello y producido por él, y el nombre —un año de novatos, con un año de segundo detrás— dice exactamente para qué es.

Que un cantante hecho le entregue media canción a un debutante es una forma de padrinazgo con la que el género siempre ha funcionado y que casi nunca se reconoce. Él la convirtió en formato. El segundo volumen ya está sacando sencillos.

En su propio canal aparece en una tarima dominicana con Prince Royce y Romeo Santos, que es el otro tipo de respaldo: aquel en que los dos nombres más grandes de la bachata moderna lo suben a cantar.',
       updated_at = now()
 WHERE slug = 'esme';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'esme')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'esme')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Esme, born Elmer Abreu Suriel, is a Dominican bachata singer, songwriter and record producer. He writes what he sings, produces most of it, and has built an audience that is only partly Dominican.","type":"text"}]},{"type":"paragraph","content":[{"text":"Constanza to Queens","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He is from Constanza, high in the mountains of La Vega — the coldest town in the country, a place of vegetable farms and strawberry fields, and about as far from a bachata scene as the Dominican Republic gets.","type":"text"}]},{"type":"paragraph","content":[{"text":"He left for Queens at eight. That makes him a New York bachatero, which is now a recognisable kind of artist rather than an exception: the genre has had a second capital in the outer boroughs for thirty years, and the records made there answer to a different audience than the ones made in Santiago.","type":"text"}]},{"type":"paragraph","content":[{"text":"Perteneces a Nadie","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"His first single arrived in 2017, and a Dominican newspaper was writing about the video within weeks of it going up. The first album was produced by Pedro Polanco, who works as sP, and something happened during those sessions that is the wrong way round: he bought his first guitar while making the record, and discovered he could write.","type":"text"}]},{"type":"paragraph","content":[{"text":"Most singers learn the instrument and then find the songs. Doing it in that order tends to produce a writer who thinks in melody and arrangement rather than in chord shapes, which is audible in what came next.","type":"text"}]},{"type":"paragraph","content":[{"text":"Amantes, in 2018, is the one that travelled. He put it out himself, and only afterwards did the album iluso come through a label. Perteneces a Nadie and Amantes were both re-released on it.","type":"text"}]},{"type":"paragraph","content":[{"text":"The dance floor circuit","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Bachata has an international audience that has nothing to do with Dominican radio: a circuit of dance schools, congresses and festivals running through Italy, Spain, eastern Europe and the American cities with a Latin dance scene. Records get chosen there for what a couple can do to them.","type":"text"}]},{"type":"paragraph","content":[{"text":"Amantes was picked up by that circuit, and it took him to the Chicago International Salsa Congress with a live band, and later to Malta on a world tour. It is a career shape almost invisible from Santo Domingo and entirely real.","type":"text"}]},{"type":"paragraph","content":[{"text":"Game Over","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The album Game Over, subtitled Bachata’s Most Wanted, arrived with ten more songs — Te Burlaste De Mi, Calor, Tiempo, Te Felicito, Botella, Triste, Tu Y Yo, Dilema, Bachata Pegao and one simply called República Dominicana. Doble Vida, with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"63d21eeb-86d7-447b-9ddc-b764046880dc","displayText":"Karlos Rosé","occurrenceId":"52fe09b4-9f18-44b1-8eb7-1a3f92c33e74"}},{"text":", came out of the same period.","type":"text"}]},{"type":"paragraph","content":[{"text":"The sequel, Game Over (On The Run), was launched in character: his own page announced that the singer had been declared missing, and the record turned up instead. Bachata does not usually go in for that sort of thing, and the fact that he does is the point — the fugitive framing is the closest a bachatero has come to running an album campaign like a rapper.","type":"text"}]},{"type":"paragraph","content":[{"text":"Sangre Nueva","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Sangre Nueva, subtitled Freshmen Year, is the more interesting project. It is an album built almost entirely out of duets with bachateros nobody had heard of, released through his label with him producing, and the naming — a freshman year, with a sophomore year to follow — says exactly what it is for.","type":"text"}]},{"type":"paragraph","content":[{"text":"An established singer handing half of each track to a newcomer is a form of patronage the genre has always run on and rarely admits to. He has made it the format. The second volume is already releasing singles.","type":"text"}]},{"type":"paragraph","content":[{"text":"His own channel has him on a Dominican stage with ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9c02d1a1-952e-4855-9b60-c0266236378d","displayText":"Prince Royce","occurrenceId":"6a0c0a36-3b12-472c-aba9-c6ca1aceaf37"}},{"text":" and Romeo Santos, which is the other kind of endorsement — the one where the two biggest names in modern bachata call you up to sing.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'esme'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Esme, de nombre Elmer Abreu Suriel, es cantante, compositor y productor de bachata dominicano. Escribe lo que canta, produce casi todo, y se armó un público que solo en parte es dominicano.","type":"text"}]},{"type":"paragraph","content":[{"text":"De Constanza a Queens","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Es de Constanza, en lo alto de las montañas de La Vega: el pueblo más frío del país, de conucos de hortalizas y fresas, y más o menos lo más lejos que se puede estar de una escena bachatera dentro de la República Dominicana.","type":"text"}]},{"type":"paragraph","content":[{"text":"Se fue a Queens a los ocho años. Eso lo hace un bachatero de Nueva York, que a estas alturas es una clase de artista reconocible y no una excepción: el género tiene una segunda capital en los condados de afuera desde hace treinta años, y los discos que se hacen allá le responden a otro público que los que se hacen en Santiago.","type":"text"}]},{"type":"paragraph","content":[{"text":"Perteneces a Nadie","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Su primer sencillo salió en 2017, y a las pocas semanas de subir el video ya escribía sobre él un periódico dominicano. El primer álbum lo produjo Pedro Polanco, que firma como sP, y en esas sesiones pasó algo que va al revés: compró su primera guitarra mientras grababa el disco, y descubrió que sabía componer.","type":"text"}]},{"type":"paragraph","content":[{"text":"Casi todos los cantantes aprenden el instrumento y después encuentran las canciones. Hacerlo en ese orden suele producir un autor que piensa en melodía y en arreglo antes que en posiciones de acordes, y eso se oye en lo que vino después.","type":"text"}]},{"type":"paragraph","content":[{"text":"Amantes, de 2018, es la que viajó. La sacó él mismo, y solo después llegó el álbum iluso por un sello. Perteneces a Nadie y Amantes se reeditaron ahí dentro.","type":"text"}]},{"type":"paragraph","content":[{"text":"El circuito de las pistas","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La bachata tiene un público internacional que no tiene nada que ver con la radio dominicana: un circuito de escuelas de baile, congresos y festivales que corre por Italia, España, Europa del este y las ciudades norteamericanas con movida latina. Ahí los discos se escogen por lo que una pareja puede hacerles encima.","type":"text"}]},{"type":"paragraph","content":[{"text":"Amantes la agarró ese circuito, y de ahí salió el Chicago International Salsa Congress con banda en vivo, y más adelante Malta en una gira mundial. Es una forma de carrera casi invisible desde Santo Domingo y completamente real.","type":"text"}]},{"type":"paragraph","content":[{"text":"Game Over","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El álbum Game Over, subtitulado Bachata’s Most Wanted, trajo diez canciones más: Te Burlaste De Mi, Calor, Tiempo, Te Felicito, Botella, Triste, Tu Y Yo, Dilema, Bachata Pegao y una llamada simplemente República Dominicana. Doble Vida, con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"63d21eeb-86d7-447b-9ddc-b764046880dc","displayText":"Karlos Rosé","occurrenceId":"2b54c430-34b9-4aad-8138-f96555b63c04"}},{"text":", salió de ese mismo tramo.","type":"text"}]},{"type":"paragraph","content":[{"text":"La segunda parte, Game Over (On The Run), la lanzó metido en el personaje: su propia página anunció que el cantante había sido declarado desaparecido, y lo que apareció fue el disco. La bachata no suele hacer esas cosas, y que él sí las haga es justamente el punto: lo del prófugo es lo más cerca que ha estado un bachatero de montar una campaña de disco como la monta un rapero.","type":"text"}]},{"type":"paragraph","content":[{"text":"Sangre Nueva","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Sangre Nueva, subtitulado Freshmen Year, es el proyecto más interesante. Es un álbum armado casi entero con dúos con bachateros que nadie había oído, sacado por su sello y producido por él, y el nombre —un año de novatos, con un año de segundo detrás— dice exactamente para qué es.","type":"text"}]},{"type":"paragraph","content":[{"text":"Que un cantante hecho le entregue media canción a un debutante es una forma de padrinazgo con la que el género siempre ha funcionado y que casi nunca se reconoce. Él la convirtió en formato. El segundo volumen ya está sacando sencillos.","type":"text"}]},{"type":"paragraph","content":[{"text":"En su propio canal aparece en una tarima dominicana con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9c02d1a1-952e-4855-9b60-c0266236378d","displayText":"Prince Royce","occurrenceId":"04c671b5-d142-4e20-aa73-b93f935064be"}},{"text":" y Romeo Santos, que es el otro tipo de respaldo: aquel en que los dos nombres más grandes de la bachata moderna lo suben a cantar.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'esme'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'esme') AND locale = 'en'), '52fe09b4-9f18-44b1-8eb7-1a3f92c33e74', 'artist', '63d21eeb-86d7-447b-9ddc-b764046880dc');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'esme') AND locale = 'en'), '6a0c0a36-3b12-472c-aba9-c6ca1aceaf37', 'artist', '9c02d1a1-952e-4855-9b60-c0266236378d');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'esme') AND locale = 'es'), '04c671b5-d142-4e20-aa73-b93f935064be', 'artist', '9c02d1a1-952e-4855-9b60-c0266236378d');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'esme') AND locale = 'es'), '2b54c430-34b9-4aad-8138-f96555b63c04', 'artist', '63d21eeb-86d7-447b-9ddc-b764046880dc');

COMMIT;
