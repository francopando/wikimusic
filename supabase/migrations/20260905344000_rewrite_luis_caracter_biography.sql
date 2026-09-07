BEGIN;

-- Rewrite the catalogue entry for Luis Caracter.
--
-- Luis Caracter. Filler in English, nothing in Spanish -- and a genre that was
-- not merely imprecise but the opposite of right. The record said folklore. He
-- is a rapper and a producer.
--
-- CORRECTED: primary_genre folklore -> urban-rap-hip-hop, and primary_role
-- singer -> rapper. His own channel calls him "productor musical, compositor y
-- artista dominicano"; his Instagram tagline is "Por Rap, Por la Cultura"; the
-- one recording MusicBrainz holds for him is Ella Quiere Sex. Nothing connects
-- him to folklore.
--
-- ADDED: legal name Jorge Luis Mena Reynoso, and producer alongside composer in
-- occupations. Cleared province "No Province" to NULL, which means the same
-- thing and is what the admin form produces; its dropdown offers only "Born
-- Abroad" and the thirty-two provinces.
--
-- SOURCES: his own YouTube channel description -- "Luis Caracter, nombre
-- artistico de Jorge Luis Mena Reynoso, es un productor musical, compositor y
-- artista dominicano". El Pregonero, 17 August 2025, on Lysee's single Baila,
-- whose credits give the producer as "Jorge Luis Mena Reynoso (Luis Caracter)"
-- and the writers as Vicel Pimentel, Jose Caraballo Lapaix and Salvador Amado
-- Gil Cuevas; radar360 carried the same release. MusicBrainz for the recording
-- Ella Quiere Sex and for his Twitter account. Spotify and Apple Music for the
-- releases: Foto Con 2 Peine (2024), Vuelta Por El Mundo (2024), La Cubana
-- (2025), Senorita (2025), Dasela on Bowdem Canino (2025), No La Repito (2026),
-- the PRENDIO EP (2026) and Tu Te Viene (2026). Audiomack and YouTube for the
-- collaborations: Dowel King, Chuki El Cibernetico, Bellota Bow Bow, Pelo Fino,
-- Toro380, La Melodia En La Saca, Pachu What Up, KYCHU on Cimeries in March
-- 2024, 1331 and Even MZ. SoundCloud for his production credit on Frantz Star
-- featuring Jah Nesta, Kekal Manman, and on El Que Mato La Muerte 2.
--
-- NOT WRITTEN: dates, a town, a legal-name birth record. None is published.
--
-- NOT LINKED: none of his collaborators has an entry -- Dowel King, Chuki El
-- Cibernetico, Toro380, KYCHU, Lysee, Pelo Fino, Bellota Bow Bow. Several of
-- them look like they should.
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
       name = 'Luis Caracter',
       sort_name = 'Caracter, Luis',
       type = 'solo_artist',
       status = 'needs_review',
       gender = 'male',
       ended = FALSE,
       primary_role = 'rapper',
       primary_genre = 'urban-rap-hip-hop',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = NULL,
       province = NULL,
       first_name = 'Jorge',
       middle_name = 'Luis',
       last_name = 'Mena',
       second_last_name = 'Reynoso',
       stage_name = 'Luis Caracter',
       aliases = ARRAY['Jorge Luis Mena Reynoso', 'Luis Carácter']::text[],
       occupations = '["producer","composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@LuisCaracter',
       facebook = 'LuisCaracter',
       instagram = 'luiscaracter',
       disambiguation = 'Dominican rapper and music producer, born Jorge Luis Mena Reynoso',
       bio_en = 'Luis Caracter is a Dominican rapper and music producer, born Jorge Luis Mena Reynoso. He works both sides of the glass: he releases records under his own name and produces them for other people.

**Por rap, por la cultura**

That line sits on his own pages, and it is a position rather than a slogan. Dominican rap has always had to argue for itself against merengue and later against dembow, and the people who kept it going through the lean years did so by insisting it was culture and not a passing sound.

His own catalogue runs from Foto Con 2 Peine and Vuelta Por El Mundo through La Cubana, Señorita and Dásela to No La Repito and the PRENDIO EP. Most of it is collaborative — Dowel King, Chuki El Cibernético, Bellota Bow Bow, Pelo Fino, Toro380, La Melodía En La Saca, Pachu What Up, KYCHU on Cimeries, 1331, Even MZ — which is how the Dominican rap scene has always worked: a small circle trading verses across each other’s tracks.

**Behind the board**

The production credits reach further than the rap. He produced Baila for Lysee, a tropical urban-pop single released in August 2025 and written by Vicel Pimentel with Daury Blue and AnderGils — a long way from the street rap he raps.

He has also produced across the language line, on Kekal Manman for Frantz Star with Jah Nesta, sung in Haitian Creole. Santo Domingo studios take that work routinely and it almost never gets written down.

Beyond the recordings and the credits, nothing about him is published.',
       bio_es = 'Luis Caracter es un rapero y productor musical dominicano, nacido Jorge Luis Mena Reynoso. Trabaja de los dos lados del cristal: saca discos con su propio nombre y se los produce a otros.

**Por rap, por la cultura**

Esa línea está en sus propias páginas, y es una postura antes que un lema. El rap dominicano siempre ha tenido que discutir por su existencia, primero contra el merengue y después contra el dembow, y la gente que lo sostuvo en los años flacos lo hizo insistiendo en que era cultura y no un sonido de temporada.

Su catálogo propio va de Foto Con 2 Peine y Vuelta Por El Mundo, pasando por La Cubana, Señorita y Dásela, hasta No La Repito y el EP PRENDIO. Casi todo es en colaboración —Dowel King, Chuki El Cibernético, Bellota Bow Bow, Pelo Fino, Toro380, La Melodía En La Saca, Pachu What Up, KYCHU en Cimeries, 1331, Even MZ—, que es como ha funcionado siempre la escena del rap dominicano: un círculo pequeño intercambiando versos en las pistas de los demás.

**Detrás de la consola**

Los créditos de producción llegan más lejos que el rap. Le produjo Baila a Lysee, un sencillo urbano-tropical salido en agosto de 2025 y escrito por Vicel Pimentel con Daury Blue y AnderGils, que queda bien lejos del rap de calle que él rapea.

También ha producido cruzando la frontera del idioma, en Kekal Manman, de Frantz Star con Jah Nesta, cantada en criollo haitiano. Los estudios de Santo Domingo hacen ese trabajo con regularidad y casi nunca queda anotado.

Fuera de las grabaciones y los créditos, no hay nada publicado sobre él.',
       updated_at = now()
 WHERE slug = 'luis-caracter';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luis-caracter')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'luis-caracter')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Luis Caracter is a Dominican rapper and music producer, born Jorge Luis Mena Reynoso. He works both sides of the glass: he releases records under his own name and produces them for other people.","type":"text"}]},{"type":"paragraph","content":[{"text":"Por rap, por la cultura","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"That line sits on his own pages, and it is a position rather than a slogan. Dominican rap has always had to argue for itself against merengue and later against dembow, and the people who kept it going through the lean years did so by insisting it was culture and not a passing sound.","type":"text"}]},{"type":"paragraph","content":[{"text":"His own catalogue runs from Foto Con 2 Peine and Vuelta Por El Mundo through La Cubana, Señorita and Dásela to No La Repito and the PRENDIO EP. Most of it is collaborative — Dowel King, Chuki El Cibernético, Bellota Bow Bow, Pelo Fino, Toro380, La Melodía En La Saca, Pachu What Up, KYCHU on Cimeries, 1331, Even MZ — which is how the Dominican rap scene has always worked: a small circle trading verses across each other’s tracks.","type":"text"}]},{"type":"paragraph","content":[{"text":"Behind the board","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The production credits reach further than the rap. He produced Baila for Lysee, a tropical urban-pop single released in August 2025 and written by Vicel Pimentel with Daury Blue and AnderGils — a long way from the street rap he raps.","type":"text"}]},{"type":"paragraph","content":[{"text":"He has also produced across the language line, on Kekal Manman for Frantz Star with Jah Nesta, sung in Haitian Creole. Santo Domingo studios take that work routinely and it almost never gets written down.","type":"text"}]},{"type":"paragraph","content":[{"text":"Beyond the recordings and the credits, nothing about him is published.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'luis-caracter'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Luis Caracter es un rapero y productor musical dominicano, nacido Jorge Luis Mena Reynoso. Trabaja de los dos lados del cristal: saca discos con su propio nombre y se los produce a otros.","type":"text"}]},{"type":"paragraph","content":[{"text":"Por rap, por la cultura","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Esa línea está en sus propias páginas, y es una postura antes que un lema. El rap dominicano siempre ha tenido que discutir por su existencia, primero contra el merengue y después contra el dembow, y la gente que lo sostuvo en los años flacos lo hizo insistiendo en que era cultura y no un sonido de temporada.","type":"text"}]},{"type":"paragraph","content":[{"text":"Su catálogo propio va de Foto Con 2 Peine y Vuelta Por El Mundo, pasando por La Cubana, Señorita y Dásela, hasta No La Repito y el EP PRENDIO. Casi todo es en colaboración —Dowel King, Chuki El Cibernético, Bellota Bow Bow, Pelo Fino, Toro380, La Melodía En La Saca, Pachu What Up, KYCHU en Cimeries, 1331, Even MZ—, que es como ha funcionado siempre la escena del rap dominicano: un círculo pequeño intercambiando versos en las pistas de los demás.","type":"text"}]},{"type":"paragraph","content":[{"text":"Detrás de la consola","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Los créditos de producción llegan más lejos que el rap. Le produjo Baila a Lysee, un sencillo urbano-tropical salido en agosto de 2025 y escrito por Vicel Pimentel con Daury Blue y AnderGils, que queda bien lejos del rap de calle que él rapea.","type":"text"}]},{"type":"paragraph","content":[{"text":"También ha producido cruzando la frontera del idioma, en Kekal Manman, de Frantz Star con Jah Nesta, cantada en criollo haitiano. Los estudios de Santo Domingo hacen ese trabajo con regularidad y casi nunca queda anotado.","type":"text"}]},{"type":"paragraph","content":[{"text":"Fuera de las grabaciones y los créditos, no hay nada publicado sobre él.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'luis-caracter'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
