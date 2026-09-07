BEGIN;

-- Rewrite the catalogue entry for Fritz Abreu.
--
-- Fritz Abreu. Filler in English, nothing in Spanish, no aliases, no
-- disambiguation -- on a singer-songwriter with a forty-eight-video catalogue
-- and effectively no press coverage anywhere.
--
-- THE FACEBOOK FIELD IS CLEARED, AND THIS IS A JUDGEMENT CALL TO REVIEW. The row
-- stored facebook "61557577526118". Opening it: it is a personal Facebook
-- profile with 144 friends, a cover photo and check-ins. It is him, and it is
-- not an artist page -- there is no artist page. A public catalogue entry that
-- links a private individual's personal profile sends readers somewhere they
-- have no business being, so the field is emptied rather than kept. TO REVERT:
-- put `facebook: '61557577526118',` back in the row block below. The youtube and
-- instagram handles are both his and both stay; the Instagram is dormant, with
-- no posts, and is kept because it is a real artist account and costs nothing.
--
-- EVERY TRACK IS HIS, AND THAT IS FROM RIGHTS METADATA. His releases are
-- distributed through DistroKid, so each video carries an auto-generated credit
-- line in the form `Track · Artist · Composer`. On all sixteen checked, the
-- composer field reads Fritz Abreu. occupations gains composer beside the
-- musician already stored.
--
-- THE IMPRINT CHANGES NAME TWICE AND IS ALWAYS HIM. The ℗ line runs: "Fritz
-- Abreu" on the 2015 and 2016 releases, "La Pared Negra Studios @ WaterBarer
-- Music" on 2017 and 2020, and "WaBar Music" on everything from 2024 -- WaBar
-- being a contraction of WaterBarer. None of the three names appears anywhere
-- else on the internet, which is the point: it is one man's label for one man's
-- records.
--
-- THE DATES, WHICH ARE THE SPINE OF THE ENTRY. Taken from the release lines:
-- 2015-06-30, 2016-01-25, 2017-01-19, 2017-10-07, 2020-02-21, 2022-05-31, then
-- 2024-01-06, 2024-08-30, 2024-10-15, 2024-10-30, 2024-12-25, and across 2025
-- and 2026 roughly one a month -- 2025-01-01, 01-08, 01-25, 02-10, 02-28,
-- 03-15, 03-30, 09-18, 11-30, 12-01, then 2026-01-01, 01-19, 02-14, 03-01,
-- 03-25, 04-19, 04-30 and 07-25. Two of the 2025 items are remasters of his own
-- older songs.
--
-- LEFT ALONE: primary_genre fusion-tropical and genres fusion. No source
-- classifies him at all -- the only third-party mention found anywhere calls him
-- "cantautor" and nothing more -- and the titles run from a very Dominican
-- Aguacate & Guineos to an English My Heart Will Follow You to a piece subtitled
-- in Latin. Without hearing the records there is no basis to reclassify, and
-- guessing at a genre is worse than leaving the editor's existing value.
--
-- date_of_birth 1982-01-25 is left exactly as stored. Nothing found corroborates
-- it and nothing contradicts it; MusicBrainz has no life-span for his MBID. It
-- is not touched and it is not treated as verified.
--
-- NOT WRITTEN. The entire About section of his YouTube channel reads "El papá de
-- Lucía." It is the warmest thing in the research and it names a child, so it
-- stays out.
--
-- SOURCES: his own YouTube channel -- forty-eight videos and their
-- auto-generated DistroKid credit lines, which carry composer, imprint and
-- release date. His own Instagram and Facebook. Spotify, for the Efegrafía EP,
-- for the popular tracks and for two titles the channel does not show, De Paseo
-- and My Heart Will Follow You. accionverde.com, 28 April 2010, which is the
-- single independent mention found: a listing for Tu Día Verde at Parque La Lira
-- on 2 May 2010, billing him as cantautor alongside Giordano Morel. MusicBrainz.
--
-- NOT LINKED: Giordano Morel has no entry and goes on the missing list.
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
       name = 'Fritz Abreu',
       sort_name = 'Abreu, Fritz',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'fusion-tropical',
       date_of_birth = '1982-01-25',
       birth_year = 1982,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Fritz',
       middle_name = NULL,
       last_name = 'Abreu',
       second_last_name = NULL,
       stage_name = 'Fritz Abreu',
       aliases = ARRAY[]::text[],
       occupations = '["musician","composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['fusion']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@FritzAbreu',
       facebook = NULL,
       instagram = 'fritzabreumusic',
       disambiguation = 'Singer-songwriter releasing through his own WaBar Music imprint',
       bio_en = 'Fritz Abreu is a Dominican singer-songwriter from Santo Domingo. He writes the songs, records them, puts them out under a label he owns, and has done it that way for more than a decade without a single newspaper noticing.

**Writing all of it**

The distribution credits on his releases carry a composer field, and on every one of them the name in it is his. That is not a small claim about a catalogue this size: there are no outside writers, no covers he is fronting, no producer whose record he happens to sing on.

The songs run in several directions. Aguacate & Guineos is about as Dominican as a title gets. My Heart Will Follow You is in English. One early piece is subtitled in Latin. Carta de Despedida, Perro Herido, La Herida Final, Cuando Nos Olvide El Dolor — the recurring subject is damage and what comes after it.

**WaBar Music**

The imprint on the records has changed name twice and has always been him. The earliest releases carry his own name where a label would go. Then it becomes La Pared Negra Studios at WaterBarer Music. Then, from a few years ago, simply WaBar Music.

None of those three names exists anywhere else — no roster, no other artists, no address. Independence in Dominican music is usually described as a stage on the way somewhere; here it is the whole arrangement, and it has outlasted most of the labels that would have signed him.

**The productive stretch**

The catalogue starts a decade back and comes out in bursts, with years between some of them. What is happening now is different: he has been releasing at close to one song a month for two years straight, and remastering the older material as he goes.

An artist going back to remaster his own decade-old songs is doing something specific. He is treating a body of work that nobody asked for as worth maintaining, which is either stubbornness or a long view, and after ten years the distinction stops mattering.

**Almost no footprint**

One mention exists outside his own channels: a listing for an environmental event at Parque La Lira in Santo Domingo, where he is billed as a singer-songwriter beside Giordano Morel. That is the extent of the public record.

There is no shortage of Dominican musicians in this position — a real catalogue, a real practice, and nothing written about either. The songs are the evidence, and he has kept making sure there are more of them.',
       bio_es = 'Fritz Abreu es cantautor dominicano, de Santo Domingo. Escribe las canciones, las graba, las saca por un sello que es suyo, y lleva más de una década haciéndolo sin que se lo haya reseñado un solo periódico.

**Todo lo escribe él**

Los créditos de distribución de sus lanzamientos traen un campo de compositor, y en todos el nombre que aparece es el suyo. Para un catálogo de este tamaño no es poca cosa: no hay autores ajenos, no hay versiones que él esté cantando, no hay un productor a cuyo disco él le puso la voz.

Las canciones van para varios lados. Aguacate & Guineos es más o menos lo más dominicano que puede ser un título. My Heart Will Follow You está en inglés. Una pieza temprana lleva subtítulo en latín. Carta de Despedida, Perro Herido, La Herida Final, Cuando Nos Olvide El Dolor: el tema que vuelve es el daño y lo que viene después.

**WaBar Music**

El sello de los discos ha cambiado de nombre dos veces y siempre ha sido él. Los primeros lanzamientos llevan su propio nombre donde iría una disquera. Después se vuelve La Pared Negra Studios en WaterBarer Music. Y desde hace unos años, simplemente WaBar Music.

Ninguno de esos tres nombres existe en ningún otro lugar: no hay catálogo, no hay otros artistas, no hay dirección. En la música dominicana la independencia suele contarse como una etapa camino a otra parte; aquí es el arreglo completo, y le ha sobrevivido a casi todos los sellos que lo habrían firmado.

**La racha**

El catálogo empieza hace una década y sale a tirones, con años de por medio entre algunos. Lo que pasa ahora es otra cosa: lleva dos años seguidos publicando casi una canción al mes, y remasterizando el material viejo sobre la marcha.

Un artista que vuelve a remasterizar sus propias canciones de hace diez años está haciendo algo concreto. Está tratando como digna de mantenimiento una obra que nadie le pidió, lo cual es terquedad o es mirada larga, y a los diez años la diferencia deja de importar.

**Casi sin rastro**

Fuera de sus propios canales existe una sola mención: el aviso de una actividad ambiental en el Parque La Lira de Santo Domingo, donde aparece anunciado como cantautor al lado de Giordano Morel. Eso es todo el registro público.

Músicos dominicanos en esta situación sobran: una obra de verdad, un oficio de verdad, y nada escrito sobre ninguno de los dos. La prueba son las canciones, y él se ha ocupado de que haya más.',
       updated_at = now()
 WHERE slug = 'fritz-abreu';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'fritz-abreu')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'fritz-abreu')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Fritz Abreu is a Dominican singer-songwriter from Santo Domingo. He writes the songs, records them, puts them out under a label he owns, and has done it that way for more than a decade without a single newspaper noticing.","type":"text"}]},{"type":"paragraph","content":[{"text":"Writing all of it","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The distribution credits on his releases carry a composer field, and on every one of them the name in it is his. That is not a small claim about a catalogue this size: there are no outside writers, no covers he is fronting, no producer whose record he happens to sing on.","type":"text"}]},{"type":"paragraph","content":[{"text":"The songs run in several directions. Aguacate & Guineos is about as Dominican as a title gets. My Heart Will Follow You is in English. One early piece is subtitled in Latin. Carta de Despedida, Perro Herido, La Herida Final, Cuando Nos Olvide El Dolor — the recurring subject is damage and what comes after it.","type":"text"}]},{"type":"paragraph","content":[{"text":"WaBar Music","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The imprint on the records has changed name twice and has always been him. The earliest releases carry his own name where a label would go. Then it becomes La Pared Negra Studios at WaterBarer Music. Then, from a few years ago, simply WaBar Music.","type":"text"}]},{"type":"paragraph","content":[{"text":"None of those three names exists anywhere else — no roster, no other artists, no address. Independence in Dominican music is usually described as a stage on the way somewhere; here it is the whole arrangement, and it has outlasted most of the labels that would have signed him.","type":"text"}]},{"type":"paragraph","content":[{"text":"The productive stretch","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The catalogue starts a decade back and comes out in bursts, with years between some of them. What is happening now is different: he has been releasing at close to one song a month for two years straight, and remastering the older material as he goes.","type":"text"}]},{"type":"paragraph","content":[{"text":"An artist going back to remaster his own decade-old songs is doing something specific. He is treating a body of work that nobody asked for as worth maintaining, which is either stubbornness or a long view, and after ten years the distinction stops mattering.","type":"text"}]},{"type":"paragraph","content":[{"text":"Almost no footprint","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"One mention exists outside his own channels: a listing for an environmental event at Parque La Lira in Santo Domingo, where he is billed as a singer-songwriter beside Giordano Morel. That is the extent of the public record.","type":"text"}]},{"type":"paragraph","content":[{"text":"There is no shortage of Dominican musicians in this position — a real catalogue, a real practice, and nothing written about either. The songs are the evidence, and he has kept making sure there are more of them.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'fritz-abreu'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Fritz Abreu es cantautor dominicano, de Santo Domingo. Escribe las canciones, las graba, las saca por un sello que es suyo, y lleva más de una década haciéndolo sin que se lo haya reseñado un solo periódico.","type":"text"}]},{"type":"paragraph","content":[{"text":"Todo lo escribe él","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Los créditos de distribución de sus lanzamientos traen un campo de compositor, y en todos el nombre que aparece es el suyo. Para un catálogo de este tamaño no es poca cosa: no hay autores ajenos, no hay versiones que él esté cantando, no hay un productor a cuyo disco él le puso la voz.","type":"text"}]},{"type":"paragraph","content":[{"text":"Las canciones van para varios lados. Aguacate & Guineos es más o menos lo más dominicano que puede ser un título. My Heart Will Follow You está en inglés. Una pieza temprana lleva subtítulo en latín. Carta de Despedida, Perro Herido, La Herida Final, Cuando Nos Olvide El Dolor: el tema que vuelve es el daño y lo que viene después.","type":"text"}]},{"type":"paragraph","content":[{"text":"WaBar Music","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El sello de los discos ha cambiado de nombre dos veces y siempre ha sido él. Los primeros lanzamientos llevan su propio nombre donde iría una disquera. Después se vuelve La Pared Negra Studios en WaterBarer Music. Y desde hace unos años, simplemente WaBar Music.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ninguno de esos tres nombres existe en ningún otro lugar: no hay catálogo, no hay otros artistas, no hay dirección. En la música dominicana la independencia suele contarse como una etapa camino a otra parte; aquí es el arreglo completo, y le ha sobrevivido a casi todos los sellos que lo habrían firmado.","type":"text"}]},{"type":"paragraph","content":[{"text":"La racha","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El catálogo empieza hace una década y sale a tirones, con años de por medio entre algunos. Lo que pasa ahora es otra cosa: lleva dos años seguidos publicando casi una canción al mes, y remasterizando el material viejo sobre la marcha.","type":"text"}]},{"type":"paragraph","content":[{"text":"Un artista que vuelve a remasterizar sus propias canciones de hace diez años está haciendo algo concreto. Está tratando como digna de mantenimiento una obra que nadie le pidió, lo cual es terquedad o es mirada larga, y a los diez años la diferencia deja de importar.","type":"text"}]},{"type":"paragraph","content":[{"text":"Casi sin rastro","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Fuera de sus propios canales existe una sola mención: el aviso de una actividad ambiental en el Parque La Lira de Santo Domingo, donde aparece anunciado como cantautor al lado de Giordano Morel. Eso es todo el registro público.","type":"text"}]},{"type":"paragraph","content":[{"text":"Músicos dominicanos en esta situación sobran: una obra de verdad, un oficio de verdad, y nada escrito sobre ninguno de los dos. La prueba son las canciones, y él se ha ocupado de que haya más.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'fritz-abreu'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
