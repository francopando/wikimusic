BEGIN;

-- Rewrite the catalogue entry for Ismael Bueno.
--
-- Ismael Bueno. Filler in English, nothing in Spanish -- and, as with the
-- Sorianos, a record that had lost the fact that identifies him: he is Alex
-- Bueno's brother.
--
-- SHORT ON PURPOSE. One recording of his is documented and nothing else is. The
-- entry says that and stops.
--
-- OVERWRITTEN: birth_place "Santiago" -> null, province Santiago kept. The
-- family is from San Jose de las Matas, in Santiago province -- that is where
-- Alex Bueno's own record places him -- but no source says where Ismael was
-- born, so the province stands alone rather than carrying a town nobody has
-- confirmed.
--
-- ADDED: occupations singer removed as a duplicate of primary_role; composer
-- dropped, since nothing credits him as the author of anything.
--
-- SOURCES: the album credit "Eso Eres Tu (Feat. Ismael Bueno)" on Alex Bueno's
-- record, reproduced by French Wikipedia's Alex Bueno article, by a Dominican
-- radio page and by several tracklist reproductions, where he sits among guests
-- who include Frank Reyes on Una Espina Saca la Otra and Joe Veras on Viejo
-- Amigo. Picoteando el Espectaculo, 2 December 2018, listing "Eso eres tu --
-- Ismael Bueno -- Bachata". For the relationship: Pavel Nunez and Richard
-- Francisco, both writing publicly after Alex Bueno's death, over the same
-- home video -- "Alex Bueno disfrutaba mucho de cantar, ahi lo vemos con su
-- hermano Ismael Bueno que es tremendo cantante" -- and Salserisimo Peru and
-- Republica Merengue carrying the same clip. Al Descubierto RD and
-- dominicanmusic_ on the official tribute ceremony, whose speakers were the
-- Minister of Culture Roberto Angel Salcedo, Fatima Guzman, and "Ismael Bueno,
-- hermano del artista". Alex Bueno's own catalogue record here for his dates.
--
-- NOT WRITTEN: a birth date, and the circumstances of his brother's death.
--
-- FAMILY ROW: the sibling relationship is added separately, in the migration
-- that follows this one. A third brother, Felipe Bueno, is named by Dominican
-- pages and has no entry here.
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
       name = 'Ismael Bueno',
       sort_name = 'Bueno, Ismael',
       type = 'solo_artist',
       status = 'needs_review',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'bachata',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = NULL,
       province = 'Santiago',
       first_name = 'Ismael',
       middle_name = NULL,
       last_name = 'Bueno',
       second_last_name = NULL,
       stage_name = 'Ismael Bueno',
       aliases = ARRAY[]::text[],
       occupations = '[]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY[]::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Dominican bachata singer; brother of Alex Bueno',
       bio_en = 'Ismael Bueno is a Dominican bachata singer and a brother of Alex Bueno. He sings the duet Eso Eres Tú on his brother’s record.

**A house that sang**

The Bueno family of San José de las Matas produced more than one singer, and Dominican musicians who knew them say so plainly. A home video that circulated after Álex Bueno’s death shows the two brothers singing together in the house, and the people who posted it introduced Ismael as a formidable singer in his own right.

That is the ordinary shape of a Dominican musical family: one voice becomes the career and the others stay at the level of the living room, the church and the occasional guest verse. Which one crosses over is not usually a question of who sings better.

**Eso Eres Tú**

The one recording that carries his name is a duet with his brother, on an album whose other guests were Frank Reyes and Joe Veras — which places the invitation in serious company.

Nothing else about him is published: no album, no dates, no town. When his brother was honoured at an official ceremony, Ismael spoke on the family’s behalf alongside the Minister of Culture, and that is the last documented time his name appears.',
       bio_es = 'Ismael Bueno es un cantante de bachata dominicano y hermano de Alex Bueno. Canta el dúo Eso Eres Tú en el disco de su hermano.

**Una casa que cantaba**

La familia Bueno de San José de las Matas dio más de un cantante, y los músicos dominicanos que los conocieron lo dicen sin rodeos. Un video casero que circuló después de la muerte de Álex Bueno muestra a los dos hermanos cantando juntos en la casa, y quienes lo publicaron presentaron a Ismael como tremendo cantante por derecho propio.

Esa es la forma corriente de una familia musical dominicana: una voz se convierte en la carrera y las demás se quedan en el nivel de la sala, la iglesia y algún verso de invitado. Cuál de ellas cruza no suele ser una cuestión de quién canta mejor.

**Eso Eres Tú**

La única grabación que lleva su nombre es un dúo con su hermano, en un álbum cuyos otros invitados fueron Frank Reyes y Joe Veras, lo que pone la invitación en compañía seria.

De él no hay nada más publicado: ni álbum, ni fechas, ni pueblo. Cuando homenajearon a su hermano en un acto oficial, Ismael habló en nombre de la familia junto al ministro de Cultura, y esa es la última vez documentada en que aparece su nombre.',
       updated_at = now()
 WHERE slug = 'ismael-bueno';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ismael-bueno')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ismael-bueno')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Ismael Bueno is a Dominican bachata singer and a brother of ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6c3e0d74-23b7-4d80-969f-9d5319ee5127","displayText":"Alex Bueno","occurrenceId":"8a0d76ce-0549-4090-8952-b52c25dc4509"}},{"text":". He sings the duet Eso Eres Tú on his brother’s record.","type":"text"}]},{"type":"paragraph","content":[{"text":"A house that sang","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The Bueno family of San José de las Matas produced more than one singer, and Dominican musicians who knew them say so plainly. A home video that circulated after Álex Bueno’s death shows the two brothers singing together in the house, and the people who posted it introduced Ismael as a formidable singer in his own right.","type":"text"}]},{"type":"paragraph","content":[{"text":"That is the ordinary shape of a Dominican musical family: one voice becomes the career and the others stay at the level of the living room, the church and the occasional guest verse. Which one crosses over is not usually a question of who sings better.","type":"text"}]},{"type":"paragraph","content":[{"text":"Eso Eres Tú","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The one recording that carries his name is a duet with his brother, on an album whose other guests were ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3dd83e6b-2058-4d04-ac68-38e11d9348a9","displayText":"Frank Reyes","occurrenceId":"77091de9-6d74-4ef2-8a1e-64f869a84163"}},{"text":" and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"aec32df5-cc5a-43c2-ac33-02bc8caa1cf5","displayText":"Joe Veras","occurrenceId":"fcb5792f-c690-40b9-a7c4-01ae99af0aa9"}},{"text":" — which places the invitation in serious company.","type":"text"}]},{"type":"paragraph","content":[{"text":"Nothing else about him is published: no album, no dates, no town. When his brother was honoured at an official ceremony, Ismael spoke on the family’s behalf alongside the Minister of Culture, and that is the last documented time his name appears.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'ismael-bueno'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Ismael Bueno es un cantante de bachata dominicano y hermano de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"6c3e0d74-23b7-4d80-969f-9d5319ee5127","displayText":"Alex Bueno","occurrenceId":"6e0fe8e7-5e3e-41f3-a73c-a42934c6568d"}},{"text":". Canta el dúo Eso Eres Tú en el disco de su hermano.","type":"text"}]},{"type":"paragraph","content":[{"text":"Una casa que cantaba","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La familia Bueno de San José de las Matas dio más de un cantante, y los músicos dominicanos que los conocieron lo dicen sin rodeos. Un video casero que circuló después de la muerte de Álex Bueno muestra a los dos hermanos cantando juntos en la casa, y quienes lo publicaron presentaron a Ismael como tremendo cantante por derecho propio.","type":"text"}]},{"type":"paragraph","content":[{"text":"Esa es la forma corriente de una familia musical dominicana: una voz se convierte en la carrera y las demás se quedan en el nivel de la sala, la iglesia y algún verso de invitado. Cuál de ellas cruza no suele ser una cuestión de quién canta mejor.","type":"text"}]},{"type":"paragraph","content":[{"text":"Eso Eres Tú","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"La única grabación que lleva su nombre es un dúo con su hermano, en un álbum cuyos otros invitados fueron ","type":"text"},{"type":"artistReference","attrs":{"artistId":"3dd83e6b-2058-4d04-ac68-38e11d9348a9","displayText":"Frank Reyes","occurrenceId":"7ef096e8-ef06-4db3-8cac-bbe6a54edca3"}},{"text":" y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"aec32df5-cc5a-43c2-ac33-02bc8caa1cf5","displayText":"Joe Veras","occurrenceId":"c616f802-ee7d-4628-8182-da06bc0f1eab"}},{"text":", lo que pone la invitación en compañía seria.","type":"text"}]},{"type":"paragraph","content":[{"text":"De él no hay nada más publicado: ni álbum, ni fechas, ni pueblo. Cuando homenajearon a su hermano en un acto oficial, Ismael habló en nombre de la familia junto al ministro de Cultura, y esa es la última vez documentada en que aparece su nombre.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'ismael-bueno'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ismael-bueno') AND locale = 'en'), '77091de9-6d74-4ef2-8a1e-64f869a84163', 'artist', '3dd83e6b-2058-4d04-ac68-38e11d9348a9');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ismael-bueno') AND locale = 'en'), '8a0d76ce-0549-4090-8952-b52c25dc4509', 'artist', '6c3e0d74-23b7-4d80-969f-9d5319ee5127');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ismael-bueno') AND locale = 'en'), 'fcb5792f-c690-40b9-a7c4-01ae99af0aa9', 'artist', 'aec32df5-cc5a-43c2-ac33-02bc8caa1cf5');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ismael-bueno') AND locale = 'es'), '6e0fe8e7-5e3e-41f3-a73c-a42934c6568d', 'artist', '6c3e0d74-23b7-4d80-969f-9d5319ee5127');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ismael-bueno') AND locale = 'es'), '7ef096e8-ef06-4db3-8cac-bbe6a54edca3', 'artist', '3dd83e6b-2058-4d04-ac68-38e11d9348a9');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ismael-bueno') AND locale = 'es'), 'c616f802-ee7d-4628-8182-da06bc0f1eab', 'artist', 'aec32df5-cc5a-43c2-ac33-02bc8caa1cf5');

COMMIT;
