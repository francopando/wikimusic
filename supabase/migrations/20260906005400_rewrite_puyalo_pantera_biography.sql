BEGIN;

-- Rewrite the catalogue entry for Puyalo Pantera.
--
-- Puyalo Pantera -- ENLACE PENDIENTE RESUELTO. Nothing else about this entry
-- changes.
--
-- The original pass, migration 20260906002300, said this in its own notes:
-- "NOT LINKED: Yailin La Mas Viral has no entry in this catalogue, which is a
-- plain gap -- she is one of the most heard Dominican artists alive." She was
-- created as a draft in the same session, and a reference to an unpublished
-- artist renders as dead text, so the three sentences naming her stayed as
-- plain prose.
--
-- She is published now. The two entries are joined in both directions: her
-- biography already links to him, and this one now links to her. Bing Bong,
-- Chapa and Silla are hers and his at once, and the credits dispute recorded
-- below is precisely about that, so the pages needed to reach each other.
--
-- Only the reference is added. The row is untouched, the award row from
-- 20260906002300 stands, and the prose is the same prose apart from the three
-- places where her name becomes a link.
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
       name = 'Puyalo Pantera',
       sort_name = 'Puyalo Pantera',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'producer',
       primary_genre = 'urban-dembow',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Jarlin',
       middle_name = 'José',
       last_name = 'Beltre',
       second_last_name = 'Lara',
       stage_name = 'Puyalo Pantera',
       aliases = ARRAY['Púyalo Pantera', 'Jarlin José Beltre Lara']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'urban-trap', 'urban-reggaeton', 'bachata']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@Puyalopantera',
       facebook = 'jarlin.veltrelara',
       instagram = 'puyalopantera',
       disambiguation = 'Dominican dembow producer and songwriter, born Jarlin José Beltre Lara; produced Bing Bong',
       bio_en = 'Puyalo Pantera is a Dominican dembow producer, songwriter and performer, born Jarlin José Beltre Lara. He produced Bing Bong, Chapa and Silla for Yailin la Más Viral, and Bing Bong is the record that carried Dominican dembow furthest in its year.

**What he builds**

Apple Music describes his productions as rhythm in capital letters, and lists what goes into them: dembow, afro, trap, reggaetón, bachata. That is the working method of a modern Dominican producer — the dembow pulse is the floor, and everything else is a colour laid over it.

Bing Bong is the clearest example. It is built on a two-syllable hook that carries no meaning at all, which is the point: dembow works by making a sound stick before a listener has decided whether to like it.

**Bing Bong**

It charted internationally and it was nominated for Best Dembow Song at the Premio Lo Nuestro of 2026, in a category that also held Celos by Tokischa and Bulin 47, and Dem Bow by Natti Natasha with Nando Boom.

The nomination named him alongside Yailin la Más Viral, which is unusual. Producers are ordinarily invisible at that level of the industry, and having the credit on the ballot is a measure of how much of the record was his.

**The credit**

In March 2025 he went public claiming credits and royalties on those records. The dispute has been reported in the Dominican press and argued in interviews, and it is not settled here.

It is worth recording because it is the recurring problem of the genre. Dembow is made fast, often between people who are friends before they are business partners, and the paperwork tends to arrive after the record has already been heard by millions. Who wrote the hook is a question that only becomes expensive once the hook works.

**The rest of the work**

He has recorded with La Perversa, released a dembow with Anyonca and Lomiel in July 2025, and has credits reaching across the field — Ceky Viciny’s La Casa de Alofoke, La Gigi’s La Azarosa. He also releases under his own name.',
       bio_es = 'Puyalo Pantera es un productor, compositor e intérprete de dembow dominicano, nacido Jarlin José Beltre Lara. Produjo Bing Bong, Chapa y Silla para Yailin la Más Viral, y Bing Bong es el disco que llevó el dembow dominicano más lejos en su año.

**Lo que arma**

Apple Music describe sus producciones como ritmo con mayúsculas, y enumera lo que llevan dentro: dembow, afro, trap, reguetón, bachata. Ese es el método de trabajo de un productor dominicano de hoy: el pulso del dembow es el piso, y todo lo demás es color puesto encima.

Bing Bong es el ejemplo más claro. Está montada sobre un gancho de dos sílabas que no significa absolutamente nada, y de eso se trata: el dembow funciona haciendo que un sonido se pegue antes de que el oyente haya decidido si le gusta.

**Bing Bong**

Sonó fuera del país y fue nominada a Mejor Canción Dembow en el Premio Lo Nuestro de 2026, en una categoría donde también estaban Celos, de Tokischa con Bulin 47, y Dem Bow, de Natti Natasha con Nando Boom.

La nominación lo nombró junto a Yailin la Más Viral, y eso es raro. A ese nivel de la industria los productores son invisibles por costumbre, y que el crédito llegue a la papeleta mide cuánto del disco era suyo.

**El crédito**

En marzo de 2025 salió públicamente a reclamar créditos y regalías por esos discos. La prensa dominicana lo ha reportado y se ha discutido en entrevistas, y aquí no se resuelve.

Vale la pena anotarlo porque es el problema recurrente del género. El dembow se hace rápido, muchas veces entre gente que es amiga antes que socia, y el papeleo suele llegar después de que el disco ya lo oyeron millones. Quién escribió el gancho es una pregunta que solo se vuelve cara cuando el gancho funciona.

**El resto del trabajo**

Ha grabado con La Perversa, sacó un dembow con Anyonca y Lomiel en julio de 2025, y tiene créditos por todo el campo: La Casa de Alofoke, de Ceky Viciny, y La Azarosa, de La Gigi. También publica con su propio nombre.',
       updated_at = now()
 WHERE slug = 'puyalo-pantera';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'puyalo-pantera')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'puyalo-pantera')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Puyalo Pantera is a Dominican dembow producer, songwriter and performer, born Jarlin José Beltre Lara. He produced Bing Bong, Chapa and Silla for ","type":"text"},{"type":"artistReference","attrs":{"artistId":"439bbc6c-f06e-447f-a1fa-b2130b885457","displayText":"Yailin la Más Viral","occurrenceId":"bc451ce0-bd2d-4517-8a16-d94d1e8f7589"}},{"text":", and Bing Bong is the record that carried Dominican dembow furthest in its year.","type":"text"}]},{"type":"paragraph","content":[{"text":"What he builds","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Apple Music describes his productions as rhythm in capital letters, and lists what goes into them: dembow, afro, trap, reggaetón, bachata. That is the working method of a modern Dominican producer — the dembow pulse is the floor, and everything else is a colour laid over it.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bing Bong is the clearest example. It is built on a two-syllable hook that carries no meaning at all, which is the point: dembow works by making a sound stick before a listener has decided whether to like it.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bing Bong","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"It charted internationally and it was nominated for Best Dembow Song at the Premio Lo Nuestro of 2026, in a category that also held Celos by ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3e1718be-c12d-42f5-85e7-2156d9574940","displayText":"Tokischa","occurrenceId":"96213174-15bd-4a1d-ad80-ebdcfdc45c86"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"550df3b5-6488-4aec-a476-a5d28d52ceea","displayText":"Bulin 47","occurrenceId":"5a87f6b8-0ad3-490b-9733-04a9f973decb"}},{"text":", and Dem Bow by Natti Natasha with Nando Boom.","type":"text"}]},{"type":"paragraph","content":[{"text":"The nomination named him alongside ","type":"text"},{"type":"artistReference","attrs":{"artistId":"439bbc6c-f06e-447f-a1fa-b2130b885457","displayText":"Yailin la Más Viral","occurrenceId":"38139394-59d1-48c8-95ce-45c69a753701"}},{"text":", which is unusual. Producers are ordinarily invisible at that level of the industry, and having the credit on the ballot is a measure of how much of the record was his.","type":"text"}]},{"type":"paragraph","content":[{"text":"The credit","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"In March 2025 he went public claiming credits and royalties on those records. The dispute has been reported in the Dominican press and argued in interviews, and it is not settled here.","type":"text"}]},{"type":"paragraph","content":[{"text":"It is worth recording because it is the recurring problem of the genre. Dembow is made fast, often between people who are friends before they are business partners, and the paperwork tends to arrive after the record has already been heard by millions. Who wrote the hook is a question that only becomes expensive once the hook works.","type":"text"}]},{"type":"paragraph","content":[{"text":"The rest of the work","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He has recorded with La Perversa, released a dembow with Anyonca and Lomiel in July 2025, and has credits reaching across the field — ","type":"text"},{"type":"artistReference","attrs":{"artistId":"741eb4c0-4ab8-4ad5-8a64-2f156da6a395","displayText":"Ceky Viciny","occurrenceId":"36906c60-ea18-4417-b432-5f68ec86346a"}},{"text":"’s La Casa de Alofoke, La Gigi’s La Azarosa. He also releases under his own name.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'puyalo-pantera'), 4)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Puyalo Pantera es un productor, compositor e intérprete de dembow dominicano, nacido Jarlin José Beltre Lara. Produjo Bing Bong, Chapa y Silla para ","type":"text"},{"type":"artistReference","attrs":{"artistId":"439bbc6c-f06e-447f-a1fa-b2130b885457","displayText":"Yailin la Más Viral","occurrenceId":"3a853201-2e79-4958-a6f9-113f0ba24b32"}},{"text":", y Bing Bong es el disco que llevó el dembow dominicano más lejos en su año.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que arma","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Apple Music describe sus producciones como ritmo con mayúsculas, y enumera lo que llevan dentro: dembow, afro, trap, reguetón, bachata. Ese es el método de trabajo de un productor dominicano de hoy: el pulso del dembow es el piso, y todo lo demás es color puesto encima.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bing Bong es el ejemplo más claro. Está montada sobre un gancho de dos sílabas que no significa absolutamente nada, y de eso se trata: el dembow funciona haciendo que un sonido se pegue antes de que el oyente haya decidido si le gusta.","type":"text"}]},{"type":"paragraph","content":[{"text":"Bing Bong","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Sonó fuera del país y fue nominada a Mejor Canción Dembow en el Premio Lo Nuestro de 2026, en una categoría donde también estaban Celos, de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3e1718be-c12d-42f5-85e7-2156d9574940","displayText":"Tokischa","occurrenceId":"7f1a5ecf-dd3d-4fc7-8f07-8049d5960004"}},{"text":" con ","type":"text"},{"type":"artistReference","attrs":{"artistId":"550df3b5-6488-4aec-a476-a5d28d52ceea","displayText":"Bulin 47","occurrenceId":"5ed2d66b-dcf9-4528-a984-fde41a846b5d"}},{"text":", y Dem Bow, de Natti Natasha con Nando Boom.","type":"text"}]},{"type":"paragraph","content":[{"text":"La nominación lo nombró junto a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"439bbc6c-f06e-447f-a1fa-b2130b885457","displayText":"Yailin la Más Viral","occurrenceId":"9750f3c7-3406-4408-a3f1-000c452393e8"}},{"text":", y eso es raro. A ese nivel de la industria los productores son invisibles por costumbre, y que el crédito llegue a la papeleta mide cuánto del disco era suyo.","type":"text"}]},{"type":"paragraph","content":[{"text":"El crédito","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"En marzo de 2025 salió públicamente a reclamar créditos y regalías por esos discos. La prensa dominicana lo ha reportado y se ha discutido en entrevistas, y aquí no se resuelve.","type":"text"}]},{"type":"paragraph","content":[{"text":"Vale la pena anotarlo porque es el problema recurrente del género. El dembow se hace rápido, muchas veces entre gente que es amiga antes que socia, y el papeleo suele llegar después de que el disco ya lo oyeron millones. Quién escribió el gancho es una pregunta que solo se vuelve cara cuando el gancho funciona.","type":"text"}]},{"type":"paragraph","content":[{"text":"El resto del trabajo","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Ha grabado con La Perversa, sacó un dembow con Anyonca y Lomiel en julio de 2025, y tiene créditos por todo el campo: La Casa de Alofoke, de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"741eb4c0-4ab8-4ad5-8a64-2f156da6a395","displayText":"Ceky Viciny","occurrenceId":"d04f349b-364d-42a5-946f-2e215921e9c7"}},{"text":", y La Azarosa, de La Gigi. También publica con su propio nombre.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'puyalo-pantera'), 3)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'puyalo-pantera') AND locale = 'en'), '36906c60-ea18-4417-b432-5f68ec86346a', 'artist', '741eb4c0-4ab8-4ad5-8a64-2f156da6a395');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'puyalo-pantera') AND locale = 'en'), '38139394-59d1-48c8-95ce-45c69a753701', 'artist', '439bbc6c-f06e-447f-a1fa-b2130b885457');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'puyalo-pantera') AND locale = 'en'), '5a87f6b8-0ad3-490b-9733-04a9f973decb', 'artist', '550df3b5-6488-4aec-a476-a5d28d52ceea');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'puyalo-pantera') AND locale = 'en'), '96213174-15bd-4a1d-ad80-ebdcfdc45c86', 'artist', '3e1718be-c12d-42f5-85e7-2156d9574940');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'puyalo-pantera') AND locale = 'en'), 'bc451ce0-bd2d-4517-8a16-d94d1e8f7589', 'artist', '439bbc6c-f06e-447f-a1fa-b2130b885457');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'puyalo-pantera') AND locale = 'es'), '3a853201-2e79-4958-a6f9-113f0ba24b32', 'artist', '439bbc6c-f06e-447f-a1fa-b2130b885457');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'puyalo-pantera') AND locale = 'es'), '5ed2d66b-dcf9-4528-a984-fde41a846b5d', 'artist', '550df3b5-6488-4aec-a476-a5d28d52ceea');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'puyalo-pantera') AND locale = 'es'), '7f1a5ecf-dd3d-4fc7-8f07-8049d5960004', 'artist', '3e1718be-c12d-42f5-85e7-2156d9574940');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'puyalo-pantera') AND locale = 'es'), '9750f3c7-3406-4408-a3f1-000c452393e8', 'artist', '439bbc6c-f06e-447f-a1fa-b2130b885457');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'puyalo-pantera') AND locale = 'es'), 'd04f349b-364d-42a5-946f-2e215921e9c7', 'artist', '741eb4c0-4ab8-4ad5-8a64-2f156da6a395');

COMMIT;
