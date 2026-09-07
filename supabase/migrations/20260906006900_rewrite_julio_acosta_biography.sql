BEGIN;

-- Rewrite the catalogue entry for Julio Acosta.
--
-- Julio Acosta. Filler in English, nothing in Spanish, and a primary genre that
-- his only album contradicts outright.
--
-- I DEFERRED THIS ENTRY AND I WAS WRONG TO. Earlier today I put him in
-- EXTRANJEROS.md as an unresolved nationality and refused to write him up,
-- because no article said he was Dominican. The editor pointed at an Instagram
-- post of his from 30 August 2024 showing the Dominican flag. Going back to the
-- account, the grid also carries a post captioned "En la iglesia en boca chica
-- rd #rd #god #dios" -- he posts from Boca Chica and tags the country -- and
-- another titled "Con lo toro", which is Dominican slang. MusicBrainz already
-- gave country DO and area Dominican Republic, and the row already stored a
-- Dominican legal name.
--
-- That is the same evidentiary standard I accepted a few entries earlier for
-- King Streetz, where MusicBrainz plus a Santo Domingo page location plus
-- Dominican song subjects were enough. Applying a stricter test here was
-- inconsistent, not careful. He is Dominican and he stays.
--
-- GENRE CORRECTED: primary_genre merengue -> urban-reggaeton. His one album is
-- filed by Discogs as Hip Hop / Latin, style Reggaeton, and the guests are the
-- Puerto Rican reggaetón acts of that exact moment. There is no merengue
-- anywhere in the record. urban-rap-hip-hop goes into genres. primary_role
-- singer stays.
--
-- ADDED: aliases; occupations composer and musician were already stored and
-- stay; disambiguation.
--
-- TAG DELIBERATELY NOT ADDED. The album was made and released in the United
-- States, which would ordinarily argue for the diaspora tag, but he is posting
-- from Boca Chica now and the definition of that tag is still an open question
-- in ADR-002. It is left off rather than guessed at.
--
-- LEFT ALONE AND FLAGGED: province "Distrito Nacional" and birth_place "Santo
-- Domingo", the importer's default, and no date of birth. The only place his
-- own account names is Boca Chica, which is in Santo Domingo province and is
-- where he posts from rather than where he says he is from.
--
-- SOURCES: Discogs, for the master release -- La Verdad / The Truth, 2004,
-- Universal Music Latino, released in the United States in two editions, an
-- Enhanced CD (176 160 209-2) and a Clean one (176 160 281-2) -- and for the
-- full tracklist. MusicBrainz for the same album and for the country. eBay
-- listings that bill the record as "Julio Jules Acosta" and name the personnel:
-- Don Dinero, Biz, Batista, Panamasta. Facebook reggaetón archive pages for the
-- credit on Atrás De Mi, also circulated as Cuando Todo Va Mal, with Baby Rasta
-- y Gringo, Cheka and Tazmania. His own Instagram, for the Boca Chica post, the
-- Dominican flag video of 30 August 2024, the DistroKid link re-releasing Atrás
-- De Mi, and the recent titles Malo, Ya No Te Quiero, Con Lo Toro and a version
-- of It's Over Now. His Facebook page, which describes the work only as "urban
-- latin music".
--
-- NOT WRITTEN: follower counts. Nothing about the religious posts beyond the
-- fact that the Boca Chica one is what establishes where he is; belief is
-- private life and this catalogue leaves it alone.
--
-- A NAME THAT DEFEATS SEARCH. "Julio Acosta" returns Dominican Facebook
-- commenters by the hundred and a Costa Rican president. Almost everything
-- findable about him comes from the record itself and from his own accounts,
-- which is why the first pass came back empty-handed.
--
-- NOT LINKED: Baby Rasta y Gringo, Cheka and Tazmania are Puerto Rican, Don
-- Dinero is Cuban-American. Biz, Batista and Panamasta are unidentified.
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
       name = 'Julio Acosta',
       sort_name = 'Acosta Navarro, Julio Alejandro',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urban-reggaeton',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Julio',
       middle_name = 'Alejandro',
       last_name = 'Acosta',
       second_last_name = 'Navarro',
       stage_name = 'Julio Acosta',
       aliases = ARRAY['Julio Jules Acosta', 'Jules Acosta']::text[],
       occupations = '["composer","musician"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urban-rap-hip-hop']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = 'julioacostamusic',
       instagram = 'julio_acosta_official',
       disambiguation = 'Dominican reggaetón singer; the 2004 Universal album La Verdad / The Truth',
       bio_en = 'Julio Acosta is a Dominican singer and songwriter who was signed to a major label at the exact moment reggaetón broke, and who is releasing again, on his own, twenty years later.

**La Verdad**

Universal Music Latino put out La Verdad / The Truth in 2004. It came in two editions, an enhanced disc with a video on it and a clean one for the retail chains, which is what a label does when it thinks a record is going to sell in supermarkets.

The timing is the whole point. In 2004 reggaetón crossed from a Puerto Rican genre into an American commercial format, and the majors signed everyone they could reach. Almost all of the people they reached were Puerto Rican. A Dominican on that roster, in that year, is a rarer thing than the record’s obscurity suggests.

The guests say the same. Atrás De Mi, which also travelled as Cuando Todo Va Mal, was cut with Baby Rasta y Gringo, Cheka and Tazmania — three of the acts that defined the moment — and Don Dinero, Biz, Batista and Panamasta are elsewhere on the record.

**The album itself**

Un Ladrón, Tú No Me Conoces, Quiero Una Mami, Papá, Pensando En Ti, Es Increíble, Getting Paypa. Half the titles are the standard vocabulary of that year and half are not: Papá and Un Ladrón are not party records, and Tú No Me Conoces was the one they made a video for.

Then nothing, for a long time.

**Boca Chica**

He is back at it now, releasing independently through a distributor rather than a label, and posting from Boca Chica. Malo and Ya No Te Quiero are recent; he has cut a version of It’s Over Now, the R&B ballad, which is a long way from 2004; and Atrás De Mi has gone back up on the platforms, twenty years after it was first pressed.

Nothing else about him is documented — no date of birth, no town, no interview in any outlet. Almost every trace of him is either the record or something he posted himself, which is the ordinary situation for a Dominican artist whose one commercial moment happened abroad.',
       bio_es = 'Julio Acosta es un cantante y compositor dominicano que firmó con una disquera grande justo en el momento en que el reguetón rompió, y que veinte años después vuelve a publicar, ahora por su cuenta.

**La Verdad**

Universal Music Latino sacó La Verdad / The Truth en 2004. Salió en dos ediciones, un disco enhanced con un video adentro y una versión limpia para las cadenas de tiendas, que es lo que hace un sello cuando cree que un disco va a venderse en supermercados.

El momento es todo el asunto. En 2004 el reguetón pasó de ser un género puertorriqueño a ser un formato comercial estadounidense, y las disqueras grandes firmaron a todo el que pudieron alcanzar. Casi todos los que alcanzaron eran puertorriqueños. Un dominicano en esa nómina, ese año, es algo más raro de lo que sugiere la oscuridad del disco.

Los invitados dicen lo mismo. Atrás De Mi, que también circuló como Cuando Todo Va Mal, la grabó con Baby Rasta y Gringo, Cheka y Tazmania —tres de los actos que definieron el momento— y en el resto del disco están Don Dinero, Biz, Batista y Panamasta.

**El disco por dentro**

Un Ladrón, Tú No Me Conoces, Quiero Una Mami, Papá, Pensando En Ti, Es Increíble, Getting Paypa. La mitad de los títulos son el vocabulario corriente de ese año y la otra mitad no: Papá y Un Ladrón no son temas de fiesta, y a Tú No Me Conoces fue a la que le hicieron video.

Después, nada, durante mucho tiempo.

**Boca Chica**

Ahora está otra vez en eso, publicando de manera independiente por un distribuidor y no por un sello, y posteando desde Boca Chica. Malo y Ya No Te Quiero son recientes; grabó una versión de It’s Over Now, la balada de R&B, que queda bien lejos de 2004; y Atrás De Mi volvió a subir a las plataformas, veinte años después de prensarse.

De él no hay nada más documentado: ni fecha de nacimiento, ni pueblo, ni una entrevista en ningún medio. Casi todo rastro suyo es o el disco o algo que publicó él mismo, que es la situación corriente de un artista dominicano cuyo único momento comercial ocurrió afuera.',
       updated_at = now()
 WHERE slug = 'julio-acosta';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'julio-acosta')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'julio-acosta')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Julio Acosta is a Dominican singer and songwriter who was signed to a major label at the exact moment reggaetón broke, and who is releasing again, on his own, twenty years later.","type":"text"}]},{"type":"paragraph","content":[{"text":"La Verdad","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Universal Music Latino put out La Verdad / The Truth in 2004. It came in two editions, an enhanced disc with a video on it and a clean one for the retail chains, which is what a label does when it thinks a record is going to sell in supermarkets.","type":"text"}]},{"type":"paragraph","content":[{"text":"The timing is the whole point. In 2004 reggaetón crossed from a Puerto Rican genre into an American commercial format, and the majors signed everyone they could reach. Almost all of the people they reached were Puerto Rican. A Dominican on that roster, in that year, is a rarer thing than the record’s obscurity suggests.","type":"text"}]},{"type":"paragraph","content":[{"text":"The guests say the same. Atrás De Mi, which also travelled as Cuando Todo Va Mal, was cut with Baby Rasta y Gringo, Cheka and Tazmania — three of the acts that defined the moment — and Don Dinero, Biz, Batista and Panamasta are elsewhere on the record.","type":"text"}]},{"type":"paragraph","content":[{"text":"The album itself","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Un Ladrón, Tú No Me Conoces, Quiero Una Mami, Papá, Pensando En Ti, Es Increíble, Getting Paypa. Half the titles are the standard vocabulary of that year and half are not: Papá and Un Ladrón are not party records, and Tú No Me Conoces was the one they made a video for.","type":"text"}]},{"type":"paragraph","content":[{"text":"Then nothing, for a long time.","type":"text"}]},{"type":"paragraph","content":[{"text":"Boca Chica","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He is back at it now, releasing independently through a distributor rather than a label, and posting from Boca Chica. Malo and Ya No Te Quiero are recent; he has cut a version of It’s Over Now, the R&B ballad, which is a long way from 2004; and Atrás De Mi has gone back up on the platforms, twenty years after it was first pressed.","type":"text"}]},{"type":"paragraph","content":[{"text":"Nothing else about him is documented — no date of birth, no town, no interview in any outlet. Almost every trace of him is either the record or something he posted himself, which is the ordinary situation for a Dominican artist whose one commercial moment happened abroad.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'julio-acosta'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Julio Acosta es un cantante y compositor dominicano que firmó con una disquera grande justo en el momento en que el reguetón rompió, y que veinte años después vuelve a publicar, ahora por su cuenta.","type":"text"}]},{"type":"paragraph","content":[{"text":"La Verdad","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Universal Music Latino sacó La Verdad / The Truth en 2004. Salió en dos ediciones, un disco enhanced con un video adentro y una versión limpia para las cadenas de tiendas, que es lo que hace un sello cuando cree que un disco va a venderse en supermercados.","type":"text"}]},{"type":"paragraph","content":[{"text":"El momento es todo el asunto. En 2004 el reguetón pasó de ser un género puertorriqueño a ser un formato comercial estadounidense, y las disqueras grandes firmaron a todo el que pudieron alcanzar. Casi todos los que alcanzaron eran puertorriqueños. Un dominicano en esa nómina, ese año, es algo más raro de lo que sugiere la oscuridad del disco.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los invitados dicen lo mismo. Atrás De Mi, que también circuló como Cuando Todo Va Mal, la grabó con Baby Rasta y Gringo, Cheka y Tazmania —tres de los actos que definieron el momento— y en el resto del disco están Don Dinero, Biz, Batista y Panamasta.","type":"text"}]},{"type":"paragraph","content":[{"text":"El disco por dentro","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Un Ladrón, Tú No Me Conoces, Quiero Una Mami, Papá, Pensando En Ti, Es Increíble, Getting Paypa. La mitad de los títulos son el vocabulario corriente de ese año y la otra mitad no: Papá y Un Ladrón no son temas de fiesta, y a Tú No Me Conoces fue a la que le hicieron video.","type":"text"}]},{"type":"paragraph","content":[{"text":"Después, nada, durante mucho tiempo.","type":"text"}]},{"type":"paragraph","content":[{"text":"Boca Chica","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Ahora está otra vez en eso, publicando de manera independiente por un distribuidor y no por un sello, y posteando desde Boca Chica. Malo y Ya No Te Quiero son recientes; grabó una versión de It’s Over Now, la balada de R&B, que queda bien lejos de 2004; y Atrás De Mi volvió a subir a las plataformas, veinte años después de prensarse.","type":"text"}]},{"type":"paragraph","content":[{"text":"De él no hay nada más documentado: ni fecha de nacimiento, ni pueblo, ni una entrevista en ningún medio. Casi todo rastro suyo es o el disco o algo que publicó él mismo, que es la situación corriente de un artista dominicano cuyo único momento comercial ocurrió afuera.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'julio-acosta'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
