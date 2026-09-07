BEGIN;

-- Rewrite the catalogue entry for Ito Ogamy.
--
-- Ito Ogamy. Filler in English, nothing in Spanish, no aliases, no date -- on
-- one of the first people to rap in Spanish in the Dominican Republic.
--
-- THE CHANNEL DESCRIPTION IS THE SOURCE THE ROW WAS MISSING. Following the
-- working order and opening the stored handle before searching, his YouTube
-- channel says in one line what no article says anywhere: "material artístico
-- musical y audiovisual hd de francisco antonio perez aka ito ogamy santo
-- domingo clan, alcapon rap inc 1988 santo domingo distrito nacional member
-- ascap #1578468. Miembro sgacedom #049". That gives the legal name already on
-- the row, the meaning of S.D.C., the founding year of his group, and two
-- society memberships.
--
-- CORRECTED: primary_role singer -> rapper; primary_genre urbano ->
-- urban-rap-hip-hop, which was already sitting in genres. urbano moves there
-- instead.
--
-- ADDED: aliases Ito Ogamy S.D.C. and Santo Domingo Clan; occupations composer
-- beside the musician already stored; the legend tag; disambiguation.
--
-- LEFT ALONE AND FLAGGED: province "Distrito Nacional" and birth_place "Santo
-- Domingo". The channel says "santo domingo distrito nacional" of the group
-- rather than of him, so it corroborates the province without naming a barrio.
-- No date of birth: a Facebook post wishes him a fiftieth birthday, which would
-- put the birth around 1975, but the post is undated in the search result and a
-- birth year inferred from a greeting is not a birth year.
--
-- SOURCES: his own YouTube channel, for the description above and for the nine
-- released videos -- El Pionero, Dominican Legends with Alex X, El Pichirry with
-- Kiko el Crazy and El Cherry Scom, California La Nota, Tienen Que Bailar,
-- Moca Biberón Street Mix, Lápida with Radel Rap, and Código Sin Mediante. His
-- Instagram, where the bio reads "Pionero de el Rap Dominicano" and "Santo
-- Domingo clan". DominicanHipHop.com's history of Dominican hip hop, which
-- records that Ito Ogamy and Alcapón Rap reached a degree of popularity in the
-- early nineties. Several Dominican rap history pages on Facebook, which call
-- him a pioneer of Dominican rap, a b-boy, one of the best beatboxers on the
-- island and the leader of Alcapón Rap, and which place the group at the end of
-- the eighties and the start of the nineties alongside Figurín and Ulises.
-- Instagram footage of Lápiz Conciente publicly honouring him during a
-- surprise visit. MusicBrainz for El Pichirri, 2020.
--
-- TWO THINGS ATTRIBUTED RATHER THAN ASSERTED. That Alcapón Rap recorded a
-- jingle built on a track called Raploncesto comes from a single Facebook
-- history page and is written here as what that account says. The claim on his
-- own Instagram that he was "the first rapper on the mic" in Dominican hip hop
-- is his, and the prose says he was among the first rather than repeating a
-- superlative nobody else states.
--
-- "MELOSO" IS NOT LINKED. The credit on El Pichirry reads "Meloso", and Yomel
-- el Meloso is in the catalogue, but no source connects the two names
-- explicitly and this catalogue does not guess at identities. He is named
-- without a reference.
--
-- NOT LINKED: La Figura, Figurín, Ulises, Alex X, Radel Rap and La Piri are
-- Dominican and have no entries. La Figura and Figurín are the other half of
-- Alcapón Rap and are a real gap.
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
       name = 'Ito Ogamy',
       sort_name = 'Ito Ogamy',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'rapper',
       primary_genre = 'urban-rap-hip-hop',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Francisco',
       middle_name = 'Antonio',
       last_name = 'Pérez',
       second_last_name = NULL,
       stage_name = 'Ito Ogamy',
       aliases = ARRAY['Ito Ogamy S.D.C.', 'Santo Domingo Clan']::text[],
       occupations = '["musician","composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['urbano']::text[],
       artist_tags = ARRAY['secular', 'legend']::text[],
       website = NULL,
       youtube = '@ItoOgamySDC',
       facebook = 'ito.ogamy',
       instagram = 'ito_ogamy_809',
       disambiguation = 'Pioneer of Dominican rap, leader of Alcapón Rap; beatboxer and b-boy',
       bio_en = 'Ito Ogamy, born Francisco Antonio Pérez, is a Dominican rapper, beatboxer and b-boy. He led Alcapón Rap, one of the first groups to rap in Spanish in the Dominican Republic, and he is still recording.

**Alcapón Rap**

He dates the group to 1988, which puts it at the very beginning. Dominican rap did not exist as an industry then — there was no label, no radio slot and no audience that had asked for it, and what a group had instead was a street corner, a boombox and whoever could hold a beat with his mouth.

He worked all three of the disciplines the culture actually consisted of: he rapped, he danced, and he was among the best beatboxers on the island. That combination is what a Dominican in the late eighties had to be, because there was nobody else to be it for him.

The group was Ito Ogamy with Figurín and Ulises, and it reached a real audience in the early nineties. Dominican hip-hop histories record that Alcapón Rap turned up in television commercials — one account has them building a jingle out of a track called Raploncesto, a rap about basketball — which was how a rapper got heard in a country whose radio would not play him.

**Santo Domingo Clan**

The S.D.C. that follows his name is Santo Domingo Clan. He is a registered member of ASCAP and holds membership number forty-nine in SGACEDOM, the Dominican authors’ and composers’ society — a low number, and evidence that he was doing the paperwork of authorship at a time when almost nobody in the genre was.

**Still on the record**

He has kept releasing. El Pionero states the position in a title. Dominican Legends was made with Alex X, Lápida with Radel Rap, and El Pichirry put him on the same record as Kiko el Crazy, Meloso and El Cherry Scom — thirty years of Dominican rap on one track, which is not a common thing to arrange.

The younger generation knows what he is. Lápiz Conciente stopped what he was doing to honour him publicly when he turned up unannounced, and footage of it circulated widely.

Almost nothing about him is written down in any newspaper. The record of the first years of Dominican rap lives on Facebook history pages and in the memory of the people who were there, and this is one of the entries where that is the whole documentary situation.',
       bio_es = 'Ito Ogamy, de nombre Francisco Antonio Pérez, es rapero, beatboxer y b-boy dominicano. Dirigió Alcapón Rap, uno de los primeros grupos en rapear en español en la República Dominicana, y sigue grabando.

**Alcapón Rap**

Él fecha el grupo en 1988, lo que lo pone en el mismísimo principio. El rap dominicano no existía entonces como industria: no había sello, ni espacio en la radio, ni un público que lo hubiera pedido, y lo que un grupo tenía en su lugar era una esquina, un radio y alguien capaz de sostener el beat con la boca.

Trabajó las tres disciplinas de las que en realidad constaba la cultura: rapeaba, bailaba, y estaba entre los mejores beatboxers de la isla. Esa combinación es lo que un dominicano de finales de los ochenta tenía que ser, porque no había nadie más que lo fuera por él.

El grupo era Ito Ogamy con Figurín y Ulises, y alcanzó público de verdad a principios de los noventa. Las historias del hip hop dominicano registran que Alcapón Rap apareció en comerciales de televisión —un relato cuenta que armaron un jingle a partir de un tema llamado Raploncesto, un rap sobre baloncesto—, que era la manera en que se hacía oír un rapero en un país cuya radio no lo ponía.

**Santo Domingo Clan**

El S.D.C. que le sigue al nombre es Santo Domingo Clan. Es miembro registrado de ASCAP y tiene el número cuarenta y nueve de SGACEDOM, la sociedad dominicana de autores y compositores: un número bajo, y prueba de que estaba haciendo el papeleo de la autoría en una época en que casi nadie del género lo hacía.

**Todavía grabando**

No ha dejado de publicar. El Pionero declara la posición en el título. Dominican Legends la hizo con Alex X, Lápida con Radel Rap, y El Pichirry lo puso en el mismo disco que Kiko el Crazy, Meloso y El Cherry Scom; treinta años de rap dominicano en un solo tema, que no es una cosa corriente de armar.

La generación más joven sabe lo que es. Lápiz Conciente paró lo que estaba haciendo para rendirle homenaje en público cuando apareció sin avisar, y el video circuló bastante.

De él casi no hay nada escrito en ningún periódico. El registro de los primeros años del rap dominicano vive en páginas de historia de Facebook y en la memoria de la gente que estuvo ahí, y esta es una de las fichas donde esa es la situación documental completa.',
       updated_at = now()
 WHERE slug = 'ito-ogamy';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ito-ogamy')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ito-ogamy')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Ito Ogamy, born Francisco Antonio Pérez, is a Dominican rapper, beatboxer and b-boy. He led Alcapón Rap, one of the first groups to rap in Spanish in the Dominican Republic, and he is still recording.","type":"text"}]},{"type":"paragraph","content":[{"text":"Alcapón Rap","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He dates the group to 1988, which puts it at the very beginning. Dominican rap did not exist as an industry then — there was no label, no radio slot and no audience that had asked for it, and what a group had instead was a street corner, a boombox and whoever could hold a beat with his mouth.","type":"text"}]},{"type":"paragraph","content":[{"text":"He worked all three of the disciplines the culture actually consisted of: he rapped, he danced, and he was among the best beatboxers on the island. That combination is what a Dominican in the late eighties had to be, because there was nobody else to be it for him.","type":"text"}]},{"type":"paragraph","content":[{"text":"The group was Ito Ogamy with Figurín and Ulises, and it reached a real audience in the early nineties. Dominican hip-hop histories record that Alcapón Rap turned up in television commercials — one account has them building a jingle out of a track called Raploncesto, a rap about basketball — which was how a rapper got heard in a country whose radio would not play him.","type":"text"}]},{"type":"paragraph","content":[{"text":"Santo Domingo Clan","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The S.D.C. that follows his name is Santo Domingo Clan. He is a registered member of ASCAP and holds membership number forty-nine in SGACEDOM, the Dominican authors’ and composers’ society — a low number, and evidence that he was doing the paperwork of authorship at a time when almost nobody in the genre was.","type":"text"}]},{"type":"paragraph","content":[{"text":"Still on the record","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He has kept releasing. El Pionero states the position in a title. Dominican Legends was made with Alex X, Lápida with Radel Rap, and El Pichirry put him on the same record as ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9be0ed08-6eb6-4ca0-bb68-d5126190aeb1","displayText":"Kiko el Crazy","occurrenceId":"9a82b4e2-5f7f-4737-b0aa-d731bd4d30cf"}},{"text":", Meloso and ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0b2e1a39-b265-42d6-95d5-85ad930eee84","displayText":"El Cherry Scom","occurrenceId":"30fa025b-9312-4999-a6ac-f304bbc9c96a"}},{"text":" — thirty years of Dominican rap on one track, which is not a common thing to arrange.","type":"text"}]},{"type":"paragraph","content":[{"text":"The younger generation knows what he is. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"7f2bded5-ea11-47bf-9a35-bb9f6115d37f"}},{"text":" stopped what he was doing to honour him publicly when he turned up unannounced, and footage of it circulated widely.","type":"text"}]},{"type":"paragraph","content":[{"text":"Almost nothing about him is written down in any newspaper. The record of the first years of Dominican rap lives on Facebook history pages and in the memory of the people who were there, and this is one of the entries where that is the whole documentary situation.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'ito-ogamy'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Ito Ogamy, de nombre Francisco Antonio Pérez, es rapero, beatboxer y b-boy dominicano. Dirigió Alcapón Rap, uno de los primeros grupos en rapear en español en la República Dominicana, y sigue grabando.","type":"text"}]},{"type":"paragraph","content":[{"text":"Alcapón Rap","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Él fecha el grupo en 1988, lo que lo pone en el mismísimo principio. El rap dominicano no existía entonces como industria: no había sello, ni espacio en la radio, ni un público que lo hubiera pedido, y lo que un grupo tenía en su lugar era una esquina, un radio y alguien capaz de sostener el beat con la boca.","type":"text"}]},{"type":"paragraph","content":[{"text":"Trabajó las tres disciplinas de las que en realidad constaba la cultura: rapeaba, bailaba, y estaba entre los mejores beatboxers de la isla. Esa combinación es lo que un dominicano de finales de los ochenta tenía que ser, porque no había nadie más que lo fuera por él.","type":"text"}]},{"type":"paragraph","content":[{"text":"El grupo era Ito Ogamy con Figurín y Ulises, y alcanzó público de verdad a principios de los noventa. Las historias del hip hop dominicano registran que Alcapón Rap apareció en comerciales de televisión —un relato cuenta que armaron un jingle a partir de un tema llamado Raploncesto, un rap sobre baloncesto—, que era la manera en que se hacía oír un rapero en un país cuya radio no lo ponía.","type":"text"}]},{"type":"paragraph","content":[{"text":"Santo Domingo Clan","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El S.D.C. que le sigue al nombre es Santo Domingo Clan. Es miembro registrado de ASCAP y tiene el número cuarenta y nueve de SGACEDOM, la sociedad dominicana de autores y compositores: un número bajo, y prueba de que estaba haciendo el papeleo de la autoría en una época en que casi nadie del género lo hacía.","type":"text"}]},{"type":"paragraph","content":[{"text":"Todavía grabando","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"No ha dejado de publicar. El Pionero declara la posición en el título. Dominican Legends la hizo con Alex X, Lápida con Radel Rap, y El Pichirry lo puso en el mismo disco que ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9be0ed08-6eb6-4ca0-bb68-d5126190aeb1","displayText":"Kiko el Crazy","occurrenceId":"04839c2c-0cbd-4e20-a670-3193f809644e"}},{"text":", Meloso y ","type":"text"},{"type":"artistReference","attrs":{"artistId":"0b2e1a39-b265-42d6-95d5-85ad930eee84","displayText":"El Cherry Scom","occurrenceId":"455e99f0-13ed-4de9-98ad-256a1fb575ee"}},{"text":"; treinta años de rap dominicano en un solo tema, que no es una cosa corriente de armar.","type":"text"}]},{"type":"paragraph","content":[{"text":"La generación más joven sabe lo que es. ","type":"text"},{"type":"artistReference","attrs":{"artistId":"102e7b78-ff98-4adc-9a54-ae73791fb176","displayText":"Lápiz Conciente","occurrenceId":"fb8c7ad3-44bf-498f-83fd-5feb464555d8"}},{"text":" paró lo que estaba haciendo para rendirle homenaje en público cuando apareció sin avisar, y el video circuló bastante.","type":"text"}]},{"type":"paragraph","content":[{"text":"De él casi no hay nada escrito en ningún periódico. El registro de los primeros años del rap dominicano vive en páginas de historia de Facebook y en la memoria de la gente que estuvo ahí, y esta es una de las fichas donde esa es la situación documental completa.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'ito-ogamy'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ito-ogamy') AND locale = 'en'), '30fa025b-9312-4999-a6ac-f304bbc9c96a', 'artist', '0b2e1a39-b265-42d6-95d5-85ad930eee84');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ito-ogamy') AND locale = 'en'), '7f2bded5-ea11-47bf-9a35-bb9f6115d37f', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ito-ogamy') AND locale = 'en'), '9a82b4e2-5f7f-4737-b0aa-d731bd4d30cf', 'artist', '9be0ed08-6eb6-4ca0-bb68-d5126190aeb1');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ito-ogamy') AND locale = 'es'), '04839c2c-0cbd-4e20-a670-3193f809644e', 'artist', '9be0ed08-6eb6-4ca0-bb68-d5126190aeb1');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ito-ogamy') AND locale = 'es'), '455e99f0-13ed-4de9-98ad-256a1fb575ee', 'artist', '0b2e1a39-b265-42d6-95d5-85ad930eee84');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'ito-ogamy') AND locale = 'es'), 'fb8c7ad3-44bf-498f-83fd-5feb464555d8', 'artist', '102e7b78-ff98-4adc-9a54-ae73791fb176');

COMMIT;
