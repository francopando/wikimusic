BEGIN;

-- Reverts 20260906007600_rewrite_toxic_crow_biography.sql.
--
-- Restores the artist row, both editorial documents and every reference row
-- to the exact state captured immediately before the rewrite.

UPDATE artists SET
       name = 'Toxic Crow',
       sort_name = 'Toxic Crow',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'rapper',
       primary_genre = 'urban-rap-hip-hop',
       date_of_birth = '1981-11-13',
       birth_year = 1981,
       date_of_death = NULL,
       birth_place = 'Los Mina, Santo Domingo Este',
       province = 'Santo Domingo',
       first_name = 'Caonabo',
       middle_name = 'Enrique',
       last_name = 'Mesa',
       second_last_name = 'Ureña',
       stage_name = 'Toxic Crow',
       aliases = ARRAY['Caonabo Enrique Mesa Ureña', 'Tóxic Crow']::text[],
       occupations = '["composer","producer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'urban-dembow']::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = '@ToxicCrowHD',
       facebook = 'ToxicCrowComplot',
       instagram = 'toxiccrow',
       disambiguation = 'Rapper from Los Mina and founder of Complot Records',
       bio_en = 'Toxic Crow is a Dominican rapper, songwriter and record-label owner from Los Mina. He came up in the generation that opened Dominican rap and he has stayed at the centre of it for a quarter of a century, mostly by building things other people can work inside.

**Los Mina**

He started in a crew of street MCs from the barrio, Punto Rojo among them, in the years when Dominican rap had no industry to join. That generation had to make its own: Ito Ogamy was already a decade in, Vakeró was coming up in San Pedro, and the whole thing ran on cassettes, corners and reputation.

What separates him from most of that cohort is that when the crew broke up he did not simply go solo. He built a label.

**Complot Records**

Complot Records came out of the Los Mina crew and became one of the two or three names that define Dominican rap in the two-thousands. Accounts differ on when exactly it was founded — 2000, 2003, 2012 all appear — probably because a crew, a label and a company are three different things that happened at three different times.

It is not a shell. He records inside it, and he films himself doing it: the Escuela del Complot sessions put unknown young rappers in his studio with him, and the footage goes up on the same channel as everything else. In a genre where almost nobody trains anybody, that is a real transfer.

Máquina Letal is the album of his that circulated furthest. Ultimátum was aimed squarely at Lápiz Conciente, which in Dominican rap is less a quarrel than a form.

**The channel**

His channel now holds more than three thousand videos, and most of the recent ones are not music. He talks — about violence against women, about young men and delinquency, about gold mining in San Juan, about what he thinks is coming. He books through three phone numbers, one for the United States, one for the Dominican Republic and one for Europe.

That is a different kind of career from the one he started. A Dominican rapper of his generation who is still working is usually still touring on the old records; he is running a label, a school and a daily broadcast, and the music is one of four things he does.',
       bio_es = 'Toxic Crow es rapero, compositor y dueño de sello discográfico dominicano, de Los Mina. Salió en la generación que abrió el rap dominicano y lleva un cuarto de siglo en el centro de él, sobre todo construyendo cosas dentro de las cuales pueda trabajar otra gente.

**Los Mina**

Empezó en una banda de emcees de calle del barrio, con Punto Rojo entre ellos, en los años en que el rap dominicano no tenía industria a la cual entrar. Esa generación tuvo que hacerse la suya: Ito Ogamy ya llevaba una década, Vakeró venía subiendo en San Pedro, y todo el asunto funcionaba con casetes, esquinas y reputación.

Lo que lo separa de casi toda esa camada es que cuando el grupo se deshizo no se limitó a irse de solista. Montó un sello.

**Complot Records**

Complot Records salió de la banda de Los Mina y se volvió uno de los dos o tres nombres que definen el rap dominicano de los dos mil. Las fuentes no coinciden en cuándo se fundó exactamente —aparecen 2000, 2003 y 2012—, probablemente porque una banda, un sello y una compañía son tres cosas distintas que pasaron en tres momentos distintos.

No es una fachada. Graba adentro, y se filma haciéndolo: las sesiones de la Escuela del Complot meten a raperos jóvenes desconocidos en su estudio con él, y el material sube al mismo canal que todo lo demás. En un género donde casi nadie forma a nadie, eso es una transferencia de verdad.

Máquina Letal es el disco suyo que más circuló. Ultimátum iba dirigida de frente a Lápiz Conciente, que en el rap dominicano es menos una pelea que una forma.

**El canal**

Su canal guarda hoy más de tres mil videos, y la mayoría de los recientes no son música. Habla: de violencia contra la mujer, de muchachos y delincuencia, de la explotación del oro en San Juan, de lo que él cree que viene. Se contrata por tres teléfonos, uno de Estados Unidos, uno de República Dominicana y uno de Europa.

Es otra carrera distinta de la que empezó. Un rapero dominicano de su generación que siga trabajando suele estar de gira con los discos viejos; él tiene un sello, una escuela y una transmisión diaria, y la música es una de cuatro cosas que hace.',
       updated_at = now()
 WHERE slug = 'toxic-crow';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'toxic-crow')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'toxic-crow')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Toxic Crow is a Dominican rapper, songwriter and record-label owner from Los Mina. He came up in the generation that opened Dominican rap and he has stayed at the centre of it for a quarter of a century, mostly by building things other people can work inside.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los Mina","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He started in a crew of street MCs from the barrio, Punto Rojo among them, in the years when Dominican rap had no industry to join. That generation had to make its own: ","type":"text"},{"type":"artistReference","attrs":{"artistId":"86fdf7d2-f8c3-457f-a318-20bb7b5a207e","displayText":"Ito Ogamy","occurrenceId":"3300ebf7-d78c-4d9e-af8b-1667559c56a3"}},{"text":" was already a decade in, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"ec8ba439-3772-49ff-a218-05f5dc615763","displayText":"Vakeró","occurrenceId":"f213edd3-499b-4212-9749-dcf65a7e5962"}},{"text":" was coming up in San Pedro, and the whole thing ran on cassettes, corners and reputation.","type":"text"}]},{"type":"paragraph","content":[{"text":"What separates him from most of that cohort is that when the crew broke up he did not simply go solo. He built a label.","type":"text"}]},{"type":"paragraph","content":[{"text":"Complot Records","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Complot Records came out of the Los Mina crew and became one of the two or three names that define Dominican rap in the two-thousands. Accounts differ on when exactly it was founded — 2000, 2003, 2012 all appear — probably because a crew, a label and a company are three different things that happened at three different times.","type":"text"}]},{"type":"paragraph","content":[{"text":"It is not a shell. He records inside it, and he films himself doing it: the Escuela del Complot sessions put unknown young rappers in his studio with him, and the footage goes up on the same channel as everything else. In a genre where almost nobody trains anybody, that is a real transfer.","type":"text"}]},{"type":"paragraph","content":[{"text":"Máquina Letal is the album of his that circulated furthest. Ultimátum was aimed squarely at ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"04e1a0b4-7f5d-4c8f-b2d3-794c6f4b5c81"}},{"text":", which in Dominican rap is less a quarrel than a form.","type":"text"}]},{"type":"paragraph","content":[{"text":"The channel","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"His channel now holds more than three thousand videos, and most of the recent ones are not music. He talks — about violence against women, about young men and delinquency, about gold mining in San Juan, about what he thinks is coming. He books through three phone numbers, one for the United States, one for the Dominican Republic and one for Europe.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is a different kind of career from the one he started. A Dominican rapper of his generation who is still working is usually still touring on the old records; he is running a label, a school and a daily broadcast, and the music is one of four things he does.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'toxic-crow'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Toxic Crow es rapero, compositor y dueño de sello discográfico dominicano, de Los Mina. Salió en la generación que abrió el rap dominicano y lleva un cuarto de siglo en el centro de él, sobre todo construyendo cosas dentro de las cuales pueda trabajar otra gente.","type":"text"}]},{"type":"paragraph","content":[{"text":"Los Mina","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Empezó en una banda de emcees de calle del barrio, con Punto Rojo entre ellos, en los años en que el rap dominicano no tenía industria a la cual entrar. Esa generación tuvo que hacerse la suya: ","type":"text"},{"type":"artistReference","attrs":{"artistId":"86fdf7d2-f8c3-457f-a318-20bb7b5a207e","displayText":"Ito Ogamy","occurrenceId":"54f0a779-086b-4f94-ab89-dde716fe424c"}},{"text":" ya llevaba una década, ","type":"text"},{"type":"artistReference","attrs":{"artistId":"ec8ba439-3772-49ff-a218-05f5dc615763","displayText":"Vakeró","occurrenceId":"4932cf6d-7766-4b1a-92b4-8cbd00ae7f4f"}},{"text":" venía subiendo en San Pedro, y todo el asunto funcionaba con casetes, esquinas y reputación.","type":"text"}]},{"type":"paragraph","content":[{"text":"Lo que lo separa de casi toda esa camada es que cuando el grupo se deshizo no se limitó a irse de solista. Montó un sello.","type":"text"}]},{"type":"paragraph","content":[{"text":"Complot Records","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Complot Records salió de la banda de Los Mina y se volvió uno de los dos o tres nombres que definen el rap dominicano de los dos mil. Las fuentes no coinciden en cuándo se fundó exactamente —aparecen 2000, 2003 y 2012—, probablemente porque una banda, un sello y una compañía son tres cosas distintas que pasaron en tres momentos distintos.","type":"text"}]},{"type":"paragraph","content":[{"text":"No es una fachada. Graba adentro, y se filma haciéndolo: las sesiones de la Escuela del Complot meten a raperos jóvenes desconocidos en su estudio con él, y el material sube al mismo canal que todo lo demás. En un género donde casi nadie forma a nadie, eso es una transferencia de verdad.","type":"text"}]},{"type":"paragraph","content":[{"text":"Máquina Letal es el disco suyo que más circuló. Ultimátum iba dirigida de frente a ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"a44d5e31-badb-4618-80cc-9ad332a6b82a"}},{"text":", que en el rap dominicano es menos una pelea que una forma.","type":"text"}]},{"type":"paragraph","content":[{"text":"El canal","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Su canal guarda hoy más de tres mil videos, y la mayoría de los recientes no son música. Habla: de violencia contra la mujer, de muchachos y delincuencia, de la explotación del oro en San Juan, de lo que él cree que viene. Se contrata por tres teléfonos, uno de Estados Unidos, uno de República Dominicana y uno de Europa.","type":"text"}]},{"type":"paragraph","content":[{"text":"Es otra carrera distinta de la que empezó. Un rapero dominicano de su generación que siga trabajando suele estar de gira con los discos viejos; él tiene un sello, una escuela y una transmisión diaria, y la música es una de cuatro cosas que hace.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'toxic-crow'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'toxic-crow') AND locale = 'en'), '04e1a0b4-7f5d-4c8f-b2d3-794c6f4b5c81', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'toxic-crow') AND locale = 'en'), '3300ebf7-d78c-4d9e-af8b-1667559c56a3', 'artist', '86fdf7d2-f8c3-457f-a318-20bb7b5a207e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'toxic-crow') AND locale = 'en'), 'f213edd3-499b-4212-9749-dcf65a7e5962', 'artist', 'ec8ba439-3772-49ff-a218-05f5dc615763');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'toxic-crow') AND locale = 'es'), '4932cf6d-7766-4b1a-92b4-8cbd00ae7f4f', 'artist', 'ec8ba439-3772-49ff-a218-05f5dc615763');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'toxic-crow') AND locale = 'es'), '54f0a779-086b-4f94-ab89-dde716fe424c', 'artist', '86fdf7d2-f8c3-457f-a318-20bb7b5a207e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'toxic-crow') AND locale = 'es'), 'a44d5e31-badb-4618-80cc-9ad332a6b82a', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

COMMIT;
