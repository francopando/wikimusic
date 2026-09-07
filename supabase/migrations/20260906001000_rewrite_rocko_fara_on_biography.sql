BEGIN;

-- Rewrite the catalogue entry for Rocko & Fara-On.
--
-- Rocko & Fara-On. Filler in English, nothing in Spanish, no founding year, no
-- alias -- on a duo whose debut was released by Sony Music Latin.
--
-- ADDED: the alias the Dominican press and their own accounts use, Rocko y
-- Faraon, and composer in occupations.
--
-- LEFT ALONE AND FLAGGED: province "Distrito Nacional" and birth_place "Santo
-- Domingo", the importer's default. Radio support is reported for Santo Domingo
-- and Santiago both, and nothing says where the duo formed.
--
-- NOT ADDED: a founding year. El Caribe says ten years of underground work
-- preceded the 2014 debut, which would put the start around 2004, but the paper
-- does not say that and inferring a birth_year from an approximation would be
-- inventing a fact.
--
-- SOURCES: El Nuevo Diario, 22 November 2014, by Persio Maldonado, on the Alza
-- la Mano video: the song is built on the choruses of the Panamanian El General,
-- Edgardo Franco, and Rocko says clearing it took permission from Erick Morillo,
-- from Robi Rob of C&C Music Factory and from El General himself; Xs2 The Golden
-- produced it; the video was shot by the Miami-based Dominican Algis Infante;
-- the record had radio support in Santo Domingo and Santiago. The same paper, 7
-- November 2014: the debut album Los Verdaderos Tigueres was announced for 10
-- November on the labels EVT Music and Sony Music Latin, exclusive to Spotify
-- for its first week. The 22 November piece names the guests: Ilegales, Vakero,
-- Fulanito and Fortuna La Super F. El Caribe, 26 December 2014, "Rocko y Faraon,
-- con musica urbana que se impone en el pais": "Diez anos de trabajo underground
-- y varias propuestas bajo la sombra" came before it, and the duo said they were
-- already working on a second record. The same paper's follow-up on Dale Pa'
-- Tras, which it describes as reaching listeners of merengue and of electronic
-- music alike and as drawing the attention of Sony executives. Djangueo, quoting
-- them on what audiences expect -- "un merengue tropical, o un reggaeton
-- romantico, urbano" -- and on the VEVO video for Ella Es Mia. MusicBrainz for
-- the release date of 17 November 2014 and for the titles Alza la Mano, Chuiqui
-- Chuiqui, Dale Pa' Tra (remix), Hay Que Vivir la Vida, No Me Aguanto and Pa'
-- Gozar Navidad.
--
-- NOT WRITTEN: the Spotify play count, which is what the follow-up article leads
-- with.
--
-- NOT LINKED: Vakero and Fulanito have no entries. Fulanito is a New York group
-- and El General is Panamanian; neither should have one.
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
       name = 'Rocko & Fara-On',
       sort_name = 'Rocko & Fara-On',
       type = 'duo',
       status = 'published',
       gender = 'group',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'merengue-urbano',
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
       aliases = ARRAY['Rocko y Faraón']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano', 'urban-reggaeton', 'electronic']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@RockoyfaraonVEVO',
       facebook = NULL,
       instagram = 'rockoyfaraon',
       disambiguation = 'Dominican urban duo; debut album Los Verdaderos Tígueres (2014) on EVT Music and Sony Music Latin',
       bio_en = 'Rocko & Fara-On are a Dominican urban duo. Their debut album, Los Verdaderos Tígueres, came out in November 2014 on EVT Music and Sony Music Latin after ten years of working underground.

**Ten years to the first record**

El Caribe put it plainly at the end of that year: a decade of underground work and several proposals in the shadows came before anybody was listening. That is the ordinary shape of a Dominican urban career and it is rarely written down, because the story only becomes worth telling once the label signs.

The album went out exclusively on Spotify for its first week — a distribution decision that in 2014 was still novel enough to be reported as news — and carried guests from across the field: Ilegales, Vakero, Fulanito and Fortuna La Super F.

**Alza la Mano**

The single was built on the choruses of El General, the Panamanian who took Spanish-language dancehall to the whole continent in the early nineties. Clearing it was the hard part: Rocko has said permission had to come from Erick Morillo, from Robi Rob of C&C Music Factory and from Edgardo Franco himself.

That is an unusual amount of trouble to go to for a hook, and it says what the record was doing. They were not sampling for texture; they were claiming a lineage, and they wanted the people who made it to sign off.

**Between the merengue and the machine**

Dale Pa’ Tras is the one that travelled. It reached listeners of merengue and of electronic music at the same time, which is a hard trick and the reason Sony noticed them.

They have described the problem themselves: audiences expect a tropical merengue from them, or a romantic urban reggaetón, and the records sit between those expectations rather than inside either. Chuiqui Chuiqui, Hay Que Vivir la Vida, No Me Aguanto, Ella Es Mía and a Christmas song, Pa’ Gozar Navidad, are the rest of it.',
       bio_es = 'Rocko & Fara-On son un dúo urbano dominicano. Su álbum de estreno, Los Verdaderos Tígueres, salió en noviembre de 2014 por EVT Music y Sony Music Latin, después de diez años de trabajo underground.

**Diez años hasta el primer disco**

El Caribe lo dijo sin rodeos al cierre de aquel año: una década de trabajo underground y varias propuestas bajo la sombra vinieron antes de que alguien los estuviera oyendo. Esa es la forma corriente de una carrera urbana dominicana y casi nunca queda anotada, porque la historia solo se vuelve contable cuando firma el sello.

El álbum salió en exclusiva por Spotify durante su primera semana —una decisión de distribución que en 2014 todavía era bastante nueva como para ser noticia— y llevaba invitados de todo el campo: Ilegales, Vakero, Fulanito y Fortuna La Super F.

**Alza la Mano**

El sencillo está armado sobre los coros de El General, el panameño que llevó el dancehall en español a todo el continente a comienzos de los noventa. Lo difícil fue el permiso: Rocko ha contado que hubo que conseguirlo de Erick Morillo, de Robi Rob de C&C Music Factory y del propio Edgardo Franco.

Es una cantidad rara de trabajo para un gancho, y dice lo que estaba haciendo el disco. No estaban sampleando por textura; estaban reclamando una descendencia, y querían que la gente que la hizo diera el visto bueno.

**Entre el merengue y la máquina**

Dale Pa’ Tras es el que viajó. Llegó a la vez a oyentes de merengue y a oyentes de música electrónica, que es un truco difícil y la razón por la que Sony se fijó en ellos.

Ellos mismos han descrito el problema: el público espera de ellos un merengue tropical o un reguetón romántico urbano, y los discos se quedan entre esas expectativas en vez de meterse en alguna. Chuiqui Chuiqui, Hay Que Vivir la Vida, No Me Aguanto, Ella Es Mía y un tema de Navidad, Pa’ Gozar Navidad, son el resto.',
       updated_at = now()
 WHERE slug = 'rocko-fara-on';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rocko-fara-on')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rocko-fara-on')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Rocko & Fara-On are a Dominican urban duo. Their debut album, Los Verdaderos Tígueres, came out in November 2014 on EVT Music and Sony Music Latin after ten years of working underground.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ten years to the first record","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El Caribe put it plainly at the end of that year: a decade of underground work and several proposals in the shadows came before anybody was listening. That is the ordinary shape of a Dominican urban career and it is rarely written down, because the story only becomes worth telling once the label signs.","type":"text"}]},{"type":"paragraph","content":[{"text":"The album went out exclusively on Spotify for its first week — a distribution decision that in 2014 was still novel enough to be reported as news — and carried guests from across the field: ","type":"text"},{"type":"artistReference","attrs":{"artistId":"1cd11a22-573a-43b4-8f54-fbd08329a4e2","displayText":"Ilegales","occurrenceId":"69fbf30c-c379-4091-af08-153be8f75a5f"}},{"text":", Vakero, Fulanito and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"858f68cd-dc14-497a-8391-c4a1b1777d27","displayText":"Fortuna La Super F","occurrenceId":"d45ca2d8-f059-407d-8649-e86491ba8199"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Alza la Mano","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The single was built on the choruses of El General, the Panamanian who took Spanish-language dancehall to the whole continent in the early nineties. Clearing it was the hard part: Rocko has said permission had to come from Erick Morillo, from Robi Rob of C&C Music Factory and from Edgardo Franco himself.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is an unusual amount of trouble to go to for a hook, and it says what the record was doing. They were not sampling for texture; they were claiming a lineage, and they wanted the people who made it to sign off.","type":"text"}]},{"type":"paragraph","content":[{"text":"Between the merengue and the machine","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dale Pa’ Tras is the one that travelled. It reached listeners of merengue and of electronic music at the same time, which is a hard trick and the reason Sony noticed them.","type":"text"}]},{"type":"paragraph","content":[{"text":"They have described the problem themselves: audiences expect a tropical merengue from them, or a romantic urban reggaetón, and the records sit between those expectations rather than inside either. Chuiqui Chuiqui, Hay Que Vivir la Vida, No Me Aguanto, Ella Es Mía and a Christmas song, Pa’ Gozar Navidad, are the rest of it.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'rocko-fara-on'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Rocko & Fara-On son un dúo urbano dominicano. Su álbum de estreno, Los Verdaderos Tígueres, salió en noviembre de 2014 por EVT Music y Sony Music Latin, después de diez años de trabajo underground.","type":"text"}]},{"type":"paragraph","content":[{"text":"Diez años hasta el primer disco","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El Caribe lo dijo sin rodeos al cierre de aquel año: una década de trabajo underground y varias propuestas bajo la sombra vinieron antes de que alguien los estuviera oyendo. Esa es la forma corriente de una carrera urbana dominicana y casi nunca queda anotada, porque la historia solo se vuelve contable cuando firma el sello.","type":"text"}]},{"type":"paragraph","content":[{"text":"El álbum salió en exclusiva por Spotify durante su primera semana —una decisión de distribución que en 2014 todavía era bastante nueva como para ser noticia— y llevaba invitados de todo el campo: ","type":"text"},{"type":"artistReference","attrs":{"artistId":"1cd11a22-573a-43b4-8f54-fbd08329a4e2","displayText":"Ilegales","occurrenceId":"88e27bfd-92ce-4015-8f30-5a4f9de1a066"}},{"text":", Vakero, Fulanito y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"858f68cd-dc14-497a-8391-c4a1b1777d27","displayText":"Fortuna La Super F","occurrenceId":"b4609133-d867-4d33-86df-956e98c1cb31"}},{"text":".","type":"text"}]},{"type":"paragraph","content":[{"text":"Alza la Mano","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El sencillo está armado sobre los coros de El General, el panameño que llevó el dancehall en español a todo el continente a comienzos de los noventa. Lo difícil fue el permiso: Rocko ha contado que hubo que conseguirlo de Erick Morillo, de Robi Rob de C&C Music Factory y del propio Edgardo Franco.","type":"text"}]},{"type":"paragraph","content":[{"text":"Es una cantidad rara de trabajo para un gancho, y dice lo que estaba haciendo el disco. No estaban sampleando por textura; estaban reclamando una descendencia, y querían que la gente que la hizo diera el visto bueno.","type":"text"}]},{"type":"paragraph","content":[{"text":"Entre el merengue y la máquina","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Dale Pa’ Tras es el que viajó. Llegó a la vez a oyentes de merengue y a oyentes de música electrónica, que es un truco difícil y la razón por la que Sony se fijó en ellos.","type":"text"}]},{"type":"paragraph","content":[{"text":"Ellos mismos han descrito el problema: el público espera de ellos un merengue tropical o un reguetón romántico urbano, y los discos se quedan entre esas expectativas en vez de meterse en alguna. Chuiqui Chuiqui, Hay Que Vivir la Vida, No Me Aguanto, Ella Es Mía y un tema de Navidad, Pa’ Gozar Navidad, son el resto.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'rocko-fara-on'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rocko-fara-on') AND locale = 'en'), '69fbf30c-c379-4091-af08-153be8f75a5f', 'artist', '1cd11a22-573a-43b4-8f54-fbd08329a4e2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rocko-fara-on') AND locale = 'en'), 'd45ca2d8-f059-407d-8649-e86491ba8199', 'artist', '858f68cd-dc14-497a-8391-c4a1b1777d27');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rocko-fara-on') AND locale = 'es'), '88e27bfd-92ce-4015-8f30-5a4f9de1a066', 'artist', '1cd11a22-573a-43b4-8f54-fbd08329a4e2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rocko-fara-on') AND locale = 'es'), 'b4609133-d867-4d33-86df-956e98c1cb31', 'artist', '858f68cd-dc14-497a-8391-c4a1b1777d27');

COMMIT;
