BEGIN;

-- Rewrite the catalogue entry for Chiky Bombom La Pantera.
--
-- Chiky Bombom La Pantera. Filler in English, nothing in Spanish, no gender, no
-- dates, no name parts.
--
-- ADDED: legal name Lissette Eduardo Cleto, date of birth 21 April 1988,
-- gender female, aliases, and the diaspora tag -- she has lived in New York
-- since she was eight.
--
-- LEFT ALONE AND FLAGGED: birth_place "Santiago de los Caballeros" and province
-- "Santiago". No source found says anything more precise than "Republica
-- Dominicana" -- not Wikipedia, not Revista Que Tal, not BuenaMusica, not
-- Forbes RD. The value is not contradicted either, and it does not look like
-- the importer's default, which elsewhere is "Santo Domingo", so it is left
-- standing rather than thrown away. Worth confirming.
--
-- LEFT ALONE, editor's call: primary_genre urbano. Chupable and Cacamancoa are
-- dembow records and urban-dembow would be defensible; urbano is not wrong.
--
-- SOURCES: Spanish Wikipedia, which gives the legal name Lissette Eduardo
-- Cleto, the birth date of 21 April 1988 in the Dominican Republic, the move to
-- New York at eight, the start of her Facebook content in 2015 under the name
-- Chiky Bombom, the People en Espanol listing among the 25 most influential
-- women, the E! panel show Ojos de Mujer in 2021, Top Chef VIP in 2022 and her
-- arrival as a host of Telemundo's Hoy Dia in December 2022 alongside Adamari
-- Lopez, Penelope Menchaca and Andrea Meza, plus her part in the Dominican film
-- No es lo que parece. MusicBrainz, which records the legal name Lissette
-- Eduardo and the artist name Chiky Bom Bom "La Pantera". Revista Que Tal, 6
-- August 2021, and BuenaMusica for the same birth date. El Dia and MasVip, 12
-- November 2021, on Chupable. Spotify, Apple Music, Deezer, Shazam,
-- Soundcharts and her own YouTube channel for the releases: Tengo La
-- Personalidad and Pelo Peluca Pelucazo in 2017, Cacamancoa with Guelo Furia on
-- 9 June 2018, Buenas Buenas, and Chupable in 2021, on which she is a credited
-- artist and not only a face in the video.
--
-- NOT USED: BuenaMusica's claims that she recorded Frutas with Thalia in 2016
-- and Perra with J Balvin in 2021. Neither is corroborated anywhere and Perra
-- is a J Balvin and Tokischa record.
--
-- NOT WRITTEN: her depression and her family, both of which she discusses
-- openly in interviews and neither of which is musical work.
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
       name = 'Chiky Bombom La Pantera',
       sort_name = 'Chiky Bombom La Pantera',
       type = 'solo_artist',
       status = 'needs_review',
       gender = 'female',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'urbano',
       date_of_birth = '1988-04-21',
       birth_year = 1988,
       date_of_death = NULL,
       birth_place = 'Santiago de los Caballeros',
       province = 'Santiago',
       first_name = 'Lissette',
       middle_name = NULL,
       last_name = 'Eduardo',
       second_last_name = 'Cleto',
       stage_name = 'Chiky Bombom',
       aliases = ARRAY['Chiky Bom Bom "La Pantera"', 'Chikybombom La Pantera', 'La Pantera', 'Lissette Eduardo Cleto']::text[],
       occupations = '["television_host"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular', 'diaspora']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = 'chikybombomreal',
       disambiguation = 'Dominican singer and television host based in New York; born Lissette Eduardo Cleto',
       bio_en = 'Chiky Bombom La Pantera is a Dominican singer and television host, born Lissette Eduardo Cleto on 21 April 1988. She moved to New York with her family at eight and has lived there since.

**Buenas, buenas**

She started posting to Facebook in 2015 under the name Chiky Bombom, and what she was selling was a voice and a phrase. Buenas, buenas is how she opens; tengo la personalidad is how she describes herself. By 2020 those two lines had carried her to millions of people on TikTok and Instagram, and People en Español had put her among the twenty-five most influential women.

The music came out of the same instinct. Tengo La Personalidad and Pelo Peluca Pelucazo arrived in 2017, catchphrase first and song built around it, and Cacamancoa with Guelo Furia followed in June 2018. They are dembow records made by somebody who already knew exactly what a hook sounds like when it works.

**Chupable**

In 2021 El Alfa put her on Chupable with the Colombian Ryan Castro. She is a credited artist on it, not a cameo, and it is by a distance the most heard thing with her name on it.

It is an unusual route into the genre. Most people record first and build an audience afterwards; she built the audience talking and then had the biggest name in dembow come to her.

**Television**

She sat on the panel of Ojos de Mujer for E! in 2021, competed on the first season of Telemundo’s Top Chef VIP in 2022, and in December of that year became a host of Hoy Día alongside Adamari López, Penélope Menchaca and Andrea Meza. She also appeared in the Dominican film No es lo que parece.

The recordings are a small part of what she does and the largest part of why the catalogue holds her: she is one of the Dominican voices of the diaspora that the country hears every morning.',
       bio_es = 'Chiky Bombom La Pantera es una cantante y presentadora de televisión dominicana, nacida Lissette Eduardo Cleto el 21 de abril de 1988. Se mudó a Nueva York con su familia a los ocho años y allí vive desde entonces.

**Buenas, buenas**

Empezó a publicar en Facebook en 2015 con el nombre de Chiky Bombom, y lo que vendía era una voz y una frase. Buenas, buenas es como abre; tengo la personalidad es como se describe. Para 2020 esas dos líneas la habían llevado a millones de personas en TikTok y en Instagram, y People en Español la había puesto entre las veinticinco mujeres más influyentes.

La música salió del mismo instinto. Tengo La Personalidad y Pelo Peluca Pelucazo salieron en 2017 —primero el dicho y después la canción armada encima— y Cacamancoa, con Guelo Furia, en junio de 2018. Son discos de dembow hechos por alguien que ya sabía exactamente cómo suena un gancho cuando funciona.

**Chupable**

En 2021 El Alfa la puso en Chupable junto al colombiano Ryan Castro. Está acreditada como artista, no como aparición, y es con diferencia lo más escuchado que lleva su nombre.

Es una entrada rara al género. Casi todo el mundo graba primero y construye público después; ella construyó el público hablando y después vino a buscarla el nombre más grande del dembow.

**Televisión**

Fue panelista de Ojos de Mujer para E! en 2021, compitió en la primera temporada de Top Chef VIP de Telemundo en 2022 y en diciembre de ese año entró como conductora de Hoy Día junto a Adamari López, Penélope Menchaca y Andrea Meza. También apareció en la película dominicana No es lo que parece.

Las grabaciones son una parte pequeña de lo que hace y la parte más grande de por qué el catálogo la guarda: es una de las voces dominicanas de la diáspora que el país oye todas las mañanas.',
       updated_at = now()
 WHERE slug = 'chiky-bombom-la-pantera';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'chiky-bombom-la-pantera')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'chiky-bombom-la-pantera')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Chiky Bombom La Pantera is a Dominican singer and television host, born Lissette Eduardo Cleto on 21 April 1988. She moved to New York with her family at eight and has lived there since.","type":"text"}]},{"type":"paragraph","content":[{"text":"Buenas, buenas","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"She started posting to Facebook in 2015 under the name Chiky Bombom, and what she was selling was a voice and a phrase. Buenas, buenas is how she opens; tengo la personalidad is how she describes herself. By 2020 those two lines had carried her to millions of people on TikTok and Instagram, and People en Español had put her among the twenty-five most influential women.","type":"text"}]},{"type":"paragraph","content":[{"text":"The music came out of the same instinct. Tengo La Personalidad and Pelo Peluca Pelucazo arrived in 2017, catchphrase first and song built around it, and Cacamancoa with Guelo Furia followed in June 2018. They are dembow records made by somebody who already knew exactly what a hook sounds like when it works.","type":"text"}]},{"type":"paragraph","content":[{"text":"Chupable","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In 2021 ","type":"text"},{"type":"artistReference","attrs":{"artistId":"559f2ed4-8831-483b-bc00-7cb4f340ad92","displayText":"El Alfa","occurrenceId":"9c0c4277-ef81-4056-b994-2c69e4c78f41"}},{"text":" put her on Chupable with the Colombian Ryan Castro. She is a credited artist on it, not a cameo, and it is by a distance the most heard thing with her name on it.","type":"text"}]},{"type":"paragraph","content":[{"text":"It is an unusual route into the genre. Most people record first and build an audience afterwards; she built the audience talking and then had the biggest name in dembow come to her.","type":"text"}]},{"type":"paragraph","content":[{"text":"Television","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"She sat on the panel of Ojos de Mujer for E! in 2021, competed on the first season of Telemundo’s Top Chef VIP in 2022, and in December of that year became a host of Hoy Día alongside Adamari López, Penélope Menchaca and Andrea Meza. She also appeared in the Dominican film No es lo que parece.","type":"text"}]},{"type":"paragraph","content":[{"text":"The recordings are a small part of what she does and the largest part of why the catalogue holds her: she is one of the Dominican voices of the diaspora that the country hears every morning.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'chiky-bombom-la-pantera'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Chiky Bombom La Pantera es una cantante y presentadora de televisión dominicana, nacida Lissette Eduardo Cleto el 21 de abril de 1988. Se mudó a Nueva York con su familia a los ocho años y allí vive desde entonces.","type":"text"}]},{"type":"paragraph","content":[{"text":"Buenas, buenas","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Empezó a publicar en Facebook en 2015 con el nombre de Chiky Bombom, y lo que vendía era una voz y una frase. Buenas, buenas es como abre; tengo la personalidad es como se describe. Para 2020 esas dos líneas la habían llevado a millones de personas en TikTok y en Instagram, y People en Español la había puesto entre las veinticinco mujeres más influyentes.","type":"text"}]},{"type":"paragraph","content":[{"text":"La música salió del mismo instinto. Tengo La Personalidad y Pelo Peluca Pelucazo salieron en 2017 —primero el dicho y después la canción armada encima— y Cacamancoa, con Guelo Furia, en junio de 2018. Son discos de dembow hechos por alguien que ya sabía exactamente cómo suena un gancho cuando funciona.","type":"text"}]},{"type":"paragraph","content":[{"text":"Chupable","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En 2021 ","type":"text"},{"type":"artistReference","attrs":{"artistId":"559f2ed4-8831-483b-bc00-7cb4f340ad92","displayText":"El Alfa","occurrenceId":"486e83ef-71a4-4b35-a96f-6d2e07e43bf2"}},{"text":" la puso en Chupable junto al colombiano Ryan Castro. Está acreditada como artista, no como aparición, y es con diferencia lo más escuchado que lleva su nombre.","type":"text"}]},{"type":"paragraph","content":[{"text":"Es una entrada rara al género. Casi todo el mundo graba primero y construye público después; ella construyó el público hablando y después vino a buscarla el nombre más grande del dembow.","type":"text"}]},{"type":"paragraph","content":[{"text":"Televisión","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Fue panelista de Ojos de Mujer para E! en 2021, compitió en la primera temporada de Top Chef VIP de Telemundo en 2022 y en diciembre de ese año entró como conductora de Hoy Día junto a Adamari López, Penélope Menchaca y Andrea Meza. También apareció en la película dominicana No es lo que parece.","type":"text"}]},{"type":"paragraph","content":[{"text":"Las grabaciones son una parte pequeña de lo que hace y la parte más grande de por qué el catálogo la guarda: es una de las voces dominicanas de la diáspora que el país oye todas las mañanas.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'chiky-bombom-la-pantera'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'chiky-bombom-la-pantera') AND locale = 'en'), '9c0c4277-ef81-4056-b994-2c69e4c78f41', 'artist', '559f2ed4-8831-483b-bc00-7cb4f340ad92');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'chiky-bombom-la-pantera') AND locale = 'es'), '486e83ef-71a4-4b35-a96f-6d2e07e43bf2', 'artist', '559f2ed4-8831-483b-bc00-7cb4f340ad92');

COMMIT;
