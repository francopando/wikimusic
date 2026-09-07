BEGIN;

-- Rewrite the catalogue entry for Grunjeo.
--
-- Grunjeo. Filler in English, nothing in Spanish, and a record that says the
-- band is still going. It is not: it ended on 12 June 2026.
--
-- CORRECTED: type duo -> group, because three people are named on the official
-- biography and a fourth, the first drummer, is named as having held the seat
-- before Luna. ended false -> true, birth_year 1900s-none -> 2024 and
-- death_year -> 2026, which is how this catalogue dates a group that has
-- stopped.
--
-- SOURCES: the band's own biography page at grunjeo.com, which opens "Grunjeo
-- fue una banda dominicana de grunge y rock alternativo fundada el 10 de
-- noviembre de 2024 en Santo Domingo, Republica Dominicana", is dated 12 June
-- 2026, and lists the parts: "Korven Brox -- voz, guitarra y compositor
-- principal"; "Luna Drums -- bateria. Luna Drums se incorporo a la banda
-- aportando una base ritmica solida"; "Toqita -- participo como guitarrista,
-- bajista y corista entre 2025 y 2026"; and an unnamed "primer baterista
-- oficial de Grunjeo entre 2024 y 2025". MusicBrainz, which gives the same end
-- date and describes Luna Drums as "baterista femenina en Grunjeo, banda de
-- grunge alternativo de Republica Dominicana". The band's Instagram bio,
-- "Pagina musical 2024-2026", managed by Jowmena Records. Dominicana's Got
-- Talent, which put them on stage and says they met on TikTok. Radio Bizarro's
-- interview with Korven, Luna and Toqita. Korven Brox's own posts: "Somos
-- Grunjeo una banda dominicana, no americana", and the claim that they were the
-- only Dominican band with a woman on drums.
--
-- NOTE: the domain grunjeo.com has since lapsed and the biography survives only
-- in search snippets, all of which are quoted above. The stored website field
-- still points at it. Left as it is, because a lapsed domain can be renewed and
-- removing the address loses the only citation for the founding date.
--
-- NOT WRITTEN: follower counts, which several sources lead with.
--
-- NOT LINKED: Korven Brox and Toqita, neither of whom has an entry -- and Luna
-- Drums, who does have one but is still needs_review. A reference to an
-- unpublished artist renders as dead plain text on a published page, so she is
-- named in prose here. Her own entry is corrected in the migration that follows.
-- Worth turning both mentions into references once she is published.
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
       name = 'Grunjeo',
       sort_name = 'Grunjeo',
       type = 'group',
       status = 'published',
       gender = 'group',
       ended = TRUE,
       primary_role = 'singer',
       primary_genre = 'rock',
       date_of_birth = NULL,
       birth_year = 2024,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = 'Grunjeo',
       aliases = ARRAY[]::text[],
       occupations = '["musician"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = 'https://grunjeo.com',
       youtube = '@Grunjeo',
       facebook = 'Grunjeo',
       instagram = 'grunjeo',
       disambiguation = 'Dominican grunge and alternative rock band, Santo Domingo, 2024–2026',
       bio_en = 'Grunjeo was a Dominican grunge and alternative rock band, founded in Santo Domingo on 10 November 2024 and finished on 12 June 2026. Its members met on TikTok.

**A name that argues with itself**

The name is grunge said in Dominican, and the band spent its whole life insisting on the second half of that. Somos Grunjeo, una banda dominicana, no americana, its singer wrote — a sentence you only write if people keep assuming otherwise, which is the standing condition of playing loud guitar music in a country whose export is dance rhythm.

**Who was in it**

Korven Brox sang, played guitar and wrote most of it. Luna Drums took the drum seat from the band’s first drummer and held it for the rest of the run; the band billed her as the only woman behind a kit in Dominican rock, and made a point of it. Toqita played guitar and bass and sang backing from 2025.

They were teenagers. Jowmena Records managed them, and they got as far as the stage of Dominicana’s Got Talent, which for a Dominican rock band is further than most get.

**Nineteen months**

That is the whole span: November 2024 to June 2026. Songs like Nadie Me Va a Detener carry the register the band worked in — refusal, delivered at volume, in Spanish.

Dominican rock bands rarely last, because there is almost no circuit to sustain one. What Grunjeo had instead was an audience assembled on a phone, which is a real audience and a fragile one, and the band ended while it still had it.',
       bio_es = 'Grunjeo fue una banda dominicana de grunge y rock alternativo, fundada en Santo Domingo el 10 de noviembre de 2024 y terminada el 12 de junio de 2026. Sus integrantes se conocieron en TikTok.

**Un nombre que discute consigo mismo**

El nombre es grunge dicho en dominicano, y la banda se pasó toda su vida insistiendo en la segunda mitad de eso. Somos Grunjeo, una banda dominicana, no americana, escribió su cantante: una frase que uno solo escribe si la gente sigue suponiendo lo contrario, que es la condición permanente de tocar guitarra dura en un país cuya exportación es el ritmo de baile.

**Quiénes eran**

Korven Brox cantaba, tocaba guitarra y escribía casi todo. Luna Drums tomó la batería del primer baterista de la banda y la sostuvo hasta el final; la banda la presentaba como la única mujer detrás de un set en el rock dominicano, y lo decía a propósito. Toqita tocó guitarra y bajo e hizo coros desde 2025.

Eran adolescentes. Los manejaba Jowmena Records, y llegaron hasta la tarima de Dominicana’s Got Talent, que para una banda de rock dominicana es más lejos de lo que llega casi nadie.

**Diecinueve meses**

Ese es todo el trecho: de noviembre de 2024 a junio de 2026. Canciones como Nadie Me Va a Detener llevan el registro en que trabajaba la banda: negativa, dicha a volumen, en español.

Las bandas de rock dominicanas rara vez duran, porque casi no hay circuito que sostenga a una. Lo que Grunjeo tuvo en cambio fue un público armado en un teléfono, que es un público real y frágil, y la banda terminó cuando todavía lo tenía.',
       updated_at = now()
 WHERE slug = 'grunjeo';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'grunjeo')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'grunjeo')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Grunjeo was a Dominican grunge and alternative rock band, founded in Santo Domingo on 10 November 2024 and finished on 12 June 2026. Its members met on TikTok.","type":"text"}]},{"type":"paragraph","content":[{"text":"A name that argues with itself","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The name is grunge said in Dominican, and the band spent its whole life insisting on the second half of that. Somos Grunjeo, una banda dominicana, no americana, its singer wrote — a sentence you only write if people keep assuming otherwise, which is the standing condition of playing loud guitar music in a country whose export is dance rhythm.","type":"text"}]},{"type":"paragraph","content":[{"text":"Who was in it","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Korven Brox sang, played guitar and wrote most of it. Luna Drums took the drum seat from the band’s first drummer and held it for the rest of the run; the band billed her as the only woman behind a kit in Dominican rock, and made a point of it. Toqita played guitar and bass and sang backing from 2025.","type":"text"}]},{"type":"paragraph","content":[{"text":"They were teenagers. Jowmena Records managed them, and they got as far as the stage of Dominicana’s Got Talent, which for a Dominican rock band is further than most get.","type":"text"}]},{"type":"paragraph","content":[{"text":"Nineteen months","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"That is the whole span: November 2024 to June 2026. Songs like Nadie Me Va a Detener carry the register the band worked in — refusal, delivered at volume, in Spanish.","type":"text"}]},{"type":"paragraph","content":[{"text":"Dominican rock bands rarely last, because there is almost no circuit to sustain one. What Grunjeo had instead was an audience assembled on a phone, which is a real audience and a fragile one, and the band ended while it still had it.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'grunjeo'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Grunjeo fue una banda dominicana de grunge y rock alternativo, fundada en Santo Domingo el 10 de noviembre de 2024 y terminada el 12 de junio de 2026. Sus integrantes se conocieron en TikTok.","type":"text"}]},{"type":"paragraph","content":[{"text":"Un nombre que discute consigo mismo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El nombre es grunge dicho en dominicano, y la banda se pasó toda su vida insistiendo en la segunda mitad de eso. Somos Grunjeo, una banda dominicana, no americana, escribió su cantante: una frase que uno solo escribe si la gente sigue suponiendo lo contrario, que es la condición permanente de tocar guitarra dura en un país cuya exportación es el ritmo de baile.","type":"text"}]},{"type":"paragraph","content":[{"text":"Quiénes eran","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Korven Brox cantaba, tocaba guitarra y escribía casi todo. Luna Drums tomó la batería del primer baterista de la banda y la sostuvo hasta el final; la banda la presentaba como la única mujer detrás de un set en el rock dominicano, y lo decía a propósito. Toqita tocó guitarra y bajo e hizo coros desde 2025.","type":"text"}]},{"type":"paragraph","content":[{"text":"Eran adolescentes. Los manejaba Jowmena Records, y llegaron hasta la tarima de Dominicana’s Got Talent, que para una banda de rock dominicana es más lejos de lo que llega casi nadie.","type":"text"}]},{"type":"paragraph","content":[{"text":"Diecinueve meses","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Ese es todo el trecho: de noviembre de 2024 a junio de 2026. Canciones como Nadie Me Va a Detener llevan el registro en que trabajaba la banda: negativa, dicha a volumen, en español.","type":"text"}]},{"type":"paragraph","content":[{"text":"Las bandas de rock dominicanas rara vez duran, porque casi no hay circuito que sostenga a una. Lo que Grunjeo tuvo en cambio fue un público armado en un teléfono, que es un público real y frágil, y la banda terminó cuando todavía lo tenía.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'grunjeo'), 1)
ON CONFLICT (document_type, owner_artist_id, locale)
  WHERE document_type = 'artist_biography'
DO UPDATE SET
  document = EXCLUDED.document,
  status = EXCLUDED.status,
  revision = EXCLUDED.revision,
  schema_version = EXCLUDED.schema_version,
  updated_at = now();

COMMIT;
