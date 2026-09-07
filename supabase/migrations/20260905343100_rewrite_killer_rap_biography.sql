BEGIN;

-- Rewrite the catalogue entry for Killer Rap.
--
-- Killer Rap. Filler in English, nothing in Spanish -- and the filler asserted
-- a nationality that the evidence does not support.
--
-- OPEN QUESTION FOR THE EDITOR, and it is the reason this entry is deliberately
-- bare: the only documented recording is Picale, picale, and its only known
-- issue is a COLOMBIAN one. MusicBrainz gives the artist country DO, but that
-- field has already been caught wrong in both directions during the foreigner
-- sweep, and here it is the only thing pointing at the Dominican Republic
-- besides two Dominican names in the credits. Discogs credits the track's
-- arrangement to Victor Waill -- Victor Manuel Perez, Bani 1952, Santo Domingo
-- 2019, a Dominican arranger and producer -- and the writing to Homero Jose
-- Capellan, a Dominican surname on which nothing is published. The record it
-- sits on, El Disco del Ano Vol. 30 (Codiscos Zeida, C06654, Colombia, 1998),
-- is a Colombian annual compilation, mostly vallenato and salsa: Binomio de Oro
-- de America, Los Diablitos, La Combinacion Vallenata, Omar Geles, Grupo Niche.
-- It does carry at least one certain Dominican act, Raffy Matias, so a
-- Dominican track on it is not anomalous -- but that is inference, not proof.
-- LEAVE OR REMOVE IS THE EDITOR'S CALL. Nothing here asserts a nationality.
--
-- CORRECTED: type solo_artist -> group and gender male -> group, because
-- MusicBrainz files it as a Group and the row had no basis for either. Cleared
-- first_name "Killer" and last_name "Rap", which the importer produced by
-- splitting the stage name in two. Cleared province "No Province" to NULL,
-- which means the same thing and is what the admin form produces; its dropdown
-- offers only "Born Abroad" and the thirty-two provinces. primary_role singer ->
-- rapper.
--
-- SOURCES: MusicBrainz, Killer Rap, type Group, one recording. Discogs,
-- El Disco Del Ano Vol. 30, track 10, "Killer Rap - Picale, Picale", 5:16,
-- Arranged By Victor Waill, Written-By Homero Jose Capellan. Spanish Wikipedia
-- and Diario Libre, 8 July 2019, for Victor Waill's identity and nationality.
--
-- NOT WRITTEN: everything else. Repeated searches in Spanish and English return
-- the Colombian MC Killer and the Venezuelan Killer Insane and nothing that is
-- this group.
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
       name = 'Killer Rap',
       sort_name = 'Killer Rap',
       type = 'group',
       status = 'needs_review',
       gender = 'group',
       ended = FALSE,
       primary_role = 'rapper',
       primary_genre = 'urban-rap-hip-hop',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = NULL,
       province = NULL,
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = 'Killer Rap',
       aliases = ARRAY[]::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Rap group credited with Pícale, pícale (1998); nationality unresolved',
       bio_en = 'Killer Rap is a rap group known from a single recording. Nothing about its members, its city or its years has been published.

**Pícale, pícale**

The track runs five minutes and sixteen seconds. It was arranged by Víctor Waill — the Dominican multi-instrumentalist, arranger and producer born in Baní in 1952 — and written by Homero José Capellán.

It was issued in 1998 on El Disco del Año Vol. 30, the Colombian annual compilation put out by Codiscos Zeida, on a running order otherwise given over to vallenato and salsa: Binomio de Oro de América, Los Diablitos, La Combinación Vallenata, Omar Geles, Grupo Niche. Dominican acts did appear on those compilations — Raffy Matías is on the same disc — and a Dominican arranger and a Dominican writer are the two hands visible on this track.

That is the whole documented record. The group has no album, no interview, no photograph and no second credit.',
       bio_es = 'Killer Rap es un grupo de rap conocido por una sola grabación. No se ha publicado nada sobre sus integrantes, su ciudad ni sus años de actividad.

**Pícale, pícale**

El tema dura cinco minutos y dieciséis segundos. Lo arregló Víctor Waill —el multiinstrumentista, arreglista y productor dominicano nacido en Baní en 1952— y lo escribió Homero José Capellán.

Salió en 1998 en El Disco del Año Vol. 30, la recopilación anual colombiana de Codiscos Zeida, en un orden de pistas por lo demás entregado al vallenato y a la salsa: Binomio de Oro de América, Los Diablitos, La Combinación Vallenata, Omar Geles, Grupo Niche. Actos dominicanos sí aparecían en aquellas recopilaciones —Raffy Matías está en el mismo disco— y un arreglista dominicano y un autor dominicano son las dos manos visibles en este tema.

Ese es todo el registro documentado. El grupo no tiene álbum, ni entrevista, ni fotografía, ni un segundo crédito.',
       updated_at = now()
 WHERE slug = 'killer-rap';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'killer-rap')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'killer-rap')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Killer Rap is a rap group known from a single recording. Nothing about its members, its city or its years has been published.","type":"text"}]},{"type":"paragraph","content":[{"text":"Pícale, pícale","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The track runs five minutes and sixteen seconds. It was arranged by Víctor Waill — the Dominican multi-instrumentalist, arranger and producer born in Baní in 1952 — and written by Homero José Capellán.","type":"text"}]},{"type":"paragraph","content":[{"text":"It was issued in 1998 on El Disco del Año Vol. 30, the Colombian annual compilation put out by Codiscos Zeida, on a running order otherwise given over to vallenato and salsa: Binomio de Oro de América, Los Diablitos, La Combinación Vallenata, Omar Geles, Grupo Niche. Dominican acts did appear on those compilations — Raffy Matías is on the same disc — and a Dominican arranger and a Dominican writer are the two hands visible on this track.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is the whole documented record. The group has no album, no interview, no photograph and no second credit.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'killer-rap'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Killer Rap es un grupo de rap conocido por una sola grabación. No se ha publicado nada sobre sus integrantes, su ciudad ni sus años de actividad.","type":"text"}]},{"type":"paragraph","content":[{"text":"Pícale, pícale","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El tema dura cinco minutos y dieciséis segundos. Lo arregló Víctor Waill —el multiinstrumentista, arreglista y productor dominicano nacido en Baní en 1952— y lo escribió Homero José Capellán.","type":"text"}]},{"type":"paragraph","content":[{"text":"Salió en 1998 en El Disco del Año Vol. 30, la recopilación anual colombiana de Codiscos Zeida, en un orden de pistas por lo demás entregado al vallenato y a la salsa: Binomio de Oro de América, Los Diablitos, La Combinación Vallenata, Omar Geles, Grupo Niche. Actos dominicanos sí aparecían en aquellas recopilaciones —Raffy Matías está en el mismo disco— y un arreglista dominicano y un autor dominicano son las dos manos visibles en este tema.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ese es todo el registro documentado. El grupo no tiene álbum, ni entrevista, ni fotografía, ni un segundo crédito.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'killer-rap'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
