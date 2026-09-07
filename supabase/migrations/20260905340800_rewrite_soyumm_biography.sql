BEGIN;

-- Rewrite the catalogue entry for SOYUMM.
--
-- SOYUMM. Filler in English, nothing in Spanish, no genre -- and filed as a
-- solo artist with a singer's role. They are a duo, and nobody sings.
--
-- TYPE CORRECTED from solo_artist to duo.
-- primary_role changed from singer to dj; GENRE SET to electronic.
--
-- SOURCES: MusicBrainz, whose disambiguation reads "house and tech house duo",
-- filed as a group from the Dominican Republic, with links to Beatport,
-- Spotify, Deezer, Apple Music, SoundCloud, Facebook and Instagram. Their
-- Instagram, soyummofficial: "Simply delicious music by @drfunks & @julsdls" --
-- which is the only place the pair is identified, and the account is private.
-- Beatport for the catalogue: "Apart 3A" on D-FLOOR MUSIC, an appearance on the
-- various-artists release "Zero Nove" alongside Lorenzo De Blanck, CASSIMM, Obi
-- Baby and Simon Ricci, and a place on "Secret Weapons 3" for Phantom Deck
-- Records with Alpha Rodriguez, Dani Sbert, Funsize, Lucien Le Grub, Jee Bear
-- and Ricardo Argomaniz.
--
-- NOT WRITTEN: the names behind @drfunks and @julsdls. The account that names
-- them is private and no source spells them out.
-- NOT LINKED: MonSanto, whose "Padalia" reached the same Phantom Deck Secret
-- Weapons series. He is in the catalogue but still needs_review, and a
-- reference to an unpublished artist renders as dead text.
-- FLAGGED: status. Left at needs_review; no image on the row.
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
       name = 'SOYUMM',
       sort_name = 'SOYUMM',
       type = 'duo',
       status = 'needs_review',
       gender = NULL,
       ended = FALSE,
       primary_role = 'dj',
       primary_genre = 'electronic',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = NULL,
       aliases = ARRAY[]::text[],
       occupations = '["producer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = 'soyummofficial',
       instagram = 'soyummofficial',
       disambiguation = 'Dominican house and tech house duo; releases on D-FLOOR MUSIC and Phantom Deck Records',
       bio_en = 'SOYUMM are a Dominican house and tech house duo. They describe what they make as simply delicious music, and they keep their own names off it.

**Sold by the record**

Their work sits on D-FLOOR MUSIC and on Phantom Deck Records, and Apart 3A is the track that leads their Beatport page. They have appeared on Zero Nove alongside Lorenzo De Blanck, CASSIMM, Obi Baby and Simon Ricci, and on Secret Weapons 3 with Alpha Rodríguez, Dani Sbert, Funsize, Lucien Le Grub, Jee Bear and Ricardo Argomaniz.

That is a European tech house circuit rather than a Dominican one. House is sold there by catalogue number and by which label will take the record, and a duo working from Santo Domingo enters on exactly the same terms as anyone else, which is both the difficulty and the point.

**The company they keep**

Phantom Deck also released Padalia by the Dominican producer MonSanto, and its Secret Weapons compilations have now carried two acts from the same small island scene.

Dominican electronic music has no venue circuit, no radio and no press of its own. What it has is a handful of producers placing tracks on foreign labels, and the labels are where the scene is actually visible.',
       bio_es = 'SOYUMM es un dúo dominicano de house y tech house. Describen lo que hacen como música simplemente deliciosa, y mantienen sus propios nombres fuera de ella.

**Se vende por el disco**

Su trabajo está en D-FLOOR MUSIC y en Phantom Deck Records, y Apart 3A es el tema que encabeza su página de Beatport. Han aparecido en Zero Nove junto a Lorenzo De Blanck, CASSIMM, Obi Baby y Simon Ricci, y en Secret Weapons 3 con Alpha Rodríguez, Dani Sbert, Funsize, Lucien Le Grub, Jee Bear y Ricardo Argomaniz.

Ése es un circuito de tech house europeo y no dominicano. Allá el house se vende por número de catálogo y por qué sello acepta el disco, y un dúo que trabaja desde Santo Domingo entra exactamente en las mismas condiciones que cualquier otro, que es a la vez la dificultad y el punto.

**La compañía en la que andan**

Phantom Deck sacó también Padalia, del productor dominicano MonSanto, y sus recopilatorios Secret Weapons ya han llevado a dos actos de la misma escena pequeña de la isla.

La música electrónica dominicana no tiene circuito de locales, ni radio, ni prensa propia. Lo que tiene es un puñado de productores colocando temas en sellos extranjeros, y los sellos son donde la escena se ve de verdad.',
       updated_at = now()
 WHERE slug = 'soyumm';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'soyumm')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'soyumm')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"SOYUMM are a Dominican house and tech house duo. They describe what they make as simply delicious music, and they keep their own names off it.","type":"text"}]},{"type":"paragraph","content":[{"text":"Sold by the record","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Their work sits on D-FLOOR MUSIC and on Phantom Deck Records, and Apart 3A is the track that leads their Beatport page. They have appeared on Zero Nove alongside Lorenzo De Blanck, CASSIMM, Obi Baby and Simon Ricci, and on Secret Weapons 3 with Alpha Rodríguez, Dani Sbert, Funsize, Lucien Le Grub, Jee Bear and Ricardo Argomaniz.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is a European tech house circuit rather than a Dominican one. House is sold there by catalogue number and by which label will take the record, and a duo working from Santo Domingo enters on exactly the same terms as anyone else, which is both the difficulty and the point.","type":"text"}]},{"type":"paragraph","content":[{"text":"The company they keep","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Phantom Deck also released Padalia by the Dominican producer MonSanto, and its Secret Weapons compilations have now carried two acts from the same small island scene.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dominican electronic music has no venue circuit, no radio and no press of its own. What it has is a handful of producers placing tracks on foreign labels, and the labels are where the scene is actually visible.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'soyumm'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"SOYUMM es un dúo dominicano de house y tech house. Describen lo que hacen como música simplemente deliciosa, y mantienen sus propios nombres fuera de ella.","type":"text"}]},{"type":"paragraph","content":[{"text":"Se vende por el disco","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Su trabajo está en D-FLOOR MUSIC y en Phantom Deck Records, y Apart 3A es el tema que encabeza su página de Beatport. Han aparecido en Zero Nove junto a Lorenzo De Blanck, CASSIMM, Obi Baby y Simon Ricci, y en Secret Weapons 3 con Alpha Rodríguez, Dani Sbert, Funsize, Lucien Le Grub, Jee Bear y Ricardo Argomaniz.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ése es un circuito de tech house europeo y no dominicano. Allá el house se vende por número de catálogo y por qué sello acepta el disco, y un dúo que trabaja desde Santo Domingo entra exactamente en las mismas condiciones que cualquier otro, que es a la vez la dificultad y el punto.","type":"text"}]},{"type":"paragraph","content":[{"text":"La compañía en la que andan","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Phantom Deck sacó también Padalia, del productor dominicano MonSanto, y sus recopilatorios Secret Weapons ya han llevado a dos actos de la misma escena pequeña de la isla.","type":"text"}]},{"type":"paragraph","content":[{"text":"La música electrónica dominicana no tiene circuito de locales, ni radio, ni prensa propia. Lo que tiene es un puñado de productores colocando temas en sellos extranjeros, y los sellos son donde la escena se ve de verdad.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'soyumm'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
