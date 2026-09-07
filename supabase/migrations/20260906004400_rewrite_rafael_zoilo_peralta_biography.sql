BEGIN;

-- Rewrite the catalogue entry for Rafael Zoilo Peralta.
--
-- Rafael Zoilo Peralta. Filler in English, nothing in Spanish, no occupations,
-- no instruments, no aliases -- and the alias was the key to the whole record.
-- The MBID already on the row carries the disambiguation "Pinguino", and once
-- that name is searched instead of the legal one, a career appears.
--
-- ADDED: aliases El Pingüino, instruments bass and double_bass, occupations
-- musician, disambiguation. primary_role musician -> instrumentalist, which is
-- what the catalogue uses for a player whose trade is the instrument.
--
-- LEFT ALONE AND FLAGGED: province "Distrito Nacional" and birth_place "Santo
-- Domingo", the importer's default. No source found gives a town or a date, and
-- for a merengue típico player the default is suspect on its face -- típico is
-- Cibao music. It is not changed, because a guess is not better than the wrong
-- value it replaces. No source gives a date of birth or of death either.
--
-- SOURCES: MusicBrainz for the artist name Pinguino. The Facebook page "La
-- historia del merengue típico", in a post about Tatico Henríquez, for the line
-- that this entry is really built on -- "El Pingüino en el bajo, el único
-- bajista en la música típica que ha tocado un bajo acústico" -- and for the
-- band roster it appears in. A second Facebook thread, on Tatico's conjunto,
-- naming "Zoilo Peralta, el Pingüino" beside Tatico's brother Julio on güira.
-- The Instagram account coleccionistatipico, which posts him as "La estrella
-- del bajo, Zoilo Peralta (El Pingüino)" with La Dinastía Román, and where a
-- commenter writes "nunca había visto ese bajo en el merengue". DJ Intokable's
-- channel for the Rafaelito Román sides -- María Luisa, La Lisa, La Cama, La
-- Cartera Vacía, La Cruz de Oro, Homenaje a Vidal -- which credit him by his
-- full name, and for El Ciego de Nagua's Sabor a Caña, 1978. TipicoHead for the
-- line-up on Los Algodones: Raúl Román on accordion, Rafaelito Román on sax,
-- Zoilo Peralta on bass, El Americano on tambora, Nixon on güira.
--
-- A CLAIM ATTRIBUTED, NOT ASSERTED. "The only bassist in típico to have played
-- an upright bass" comes from one enthusiast page. It is a strong claim about a
-- whole tradition and no second source states it, so the entry says what makes
-- him unusual and does not repeat the superlative as settled fact.
--
-- NOT LINKED: Raúl Román, El Ciego de Nagua, La Dinastía Román and the players
-- named on Los Algodones have no entries.
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
       name = 'Rafael Zoilo Peralta',
       sort_name = 'Peralta, Rafael Zoilo',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'instrumentalist',
       primary_genre = 'merengue-perico-ripiao',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'Santo Domingo',
       province = 'Distrito Nacional',
       first_name = 'Rafael',
       middle_name = 'Zoilo',
       last_name = 'Peralta',
       second_last_name = NULL,
       stage_name = 'El Pingüino',
       aliases = ARRAY['El Pingüino', 'Pingüino', 'Zoilo Peralta']::text[],
       occupations = '["musician"]'::jsonb,
       instruments = ARRAY['bass', 'double_bass']::text[],
       genres = ARRAY['merengue']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = NULL,
       facebook = NULL,
       instagram = NULL,
       disambiguation = 'Bass player in merengue típico, known as El Pingüino',
       bio_en = 'Rafael Zoilo Peralta, known to everyone in the music as El Pingüino, is a bass player in merengue típico. He is a sideman, and the people who remember him remember the bass itself.

**The instrument**

Típico is accordion, tambora and güira, and when a bass arrived it arrived as an electric one, plugged in and locked to the tambora. He is remembered instead for playing an upright — a full acoustic double bass, standing, in a conjunto típico, which the players who saw it describe as something they had never seen in this music.

It is not a decorative difference. An upright answers the tambora differently: shorter decay, more air, less push. In a music whose whole engine is the argument between the accordion and the drum, changing what the bass does changes where the floor is.

**Whose bands**

He is named in the conjunto of Tatico Henríquez, the man who brought típico from Nagua into the capital and who added the bass and the guitar to a form that had done without both. Getting the bass chair in that band means being present at the moment the instrument entered the tradition at all.

He later worked with the Román family, on sides led by Rafaelito Román — María Luisa, La Lisa, La Cama, La Cartera Vacía, La Cruz de Oro, Homenaje a Vidal — where the credit is written out under his full legal name. He also plays on El Ciego de Nagua’s Sabor a Caña, from 1978.

Nothing personal about him is written down: no date of birth, no town, no interview. What survives is a nickname, a run of credits and the memory of an unusual instrument.',
       bio_es = 'Rafael Zoilo Peralta, conocido por todo el mundo en la música como El Pingüino, es bajista de merengue típico. Es músico acompañante, y la gente que lo recuerda recuerda el bajo mismo.

**El instrumento**

El típico es acordeón, tambora y güira, y cuando llegó el bajo llegó eléctrico, enchufado y amarrado a la tambora. A él se le recuerda en cambio tocando contrabajo: un bajo acústico entero, de pie, dentro de un conjunto típico, cosa que los músicos que lo vieron describen como algo que nunca habían visto en esta música.

No es una diferencia de adorno. Un contrabajo le responde distinto a la tambora: menos cola, más aire, menos empuje. En una música cuyo motor entero es la discusión entre el acordeón y el tambor, cambiar lo que hace el bajo cambia dónde está el piso.

**En qué conjuntos**

Se le nombra en el conjunto de Tatico Henríquez, el hombre que trajo el típico de Nagua a la capital y que le agregó el bajo y la guitarra a una forma que se arreglaba sin los dos. Ocupar la silla de bajo en esa banda es estar presente en el momento mismo en que el instrumento entra a la tradición.

Después trabajó con la familia Román, en discos dirigidos por Rafaelito Román: María Luisa, La Lisa, La Cama, La Cartera Vacía, La Cruz de Oro, Homenaje a Vidal, donde el crédito aparece escrito con su nombre legal completo. También toca en Sabor a Caña, de El Ciego de Nagua, de 1978.

De lo personal no hay nada escrito: ni fecha de nacimiento, ni pueblo, ni entrevista. Lo que queda es un apodo, una lista de créditos y el recuerdo de un instrumento raro.',
       updated_at = now()
 WHERE slug = 'rafael-zoilo-peralta';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rafael-zoilo-peralta')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rafael-zoilo-peralta')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Rafael Zoilo Peralta, known to everyone in the music as El Pingüino, is a bass player in merengue típico. He is a sideman, and the people who remember him remember the bass itself.","type":"text"}]},{"type":"paragraph","content":[{"text":"The instrument","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Típico is accordion, tambora and güira, and when a bass arrived it arrived as an electric one, plugged in and locked to the tambora. He is remembered instead for playing an upright — a full acoustic double bass, standing, in a conjunto típico, which the players who saw it describe as something they had never seen in this music.","type":"text"}]},{"type":"paragraph","content":[{"text":"It is not a decorative difference. An upright answers the tambora differently: shorter decay, more air, less push. In a music whose whole engine is the argument between the accordion and the drum, changing what the bass does changes where the floor is.","type":"text"}]},{"type":"paragraph","content":[{"text":"Whose bands","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He is named in the conjunto of ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9b15dfca-0f60-49b3-a139-100a5a329741","displayText":"Tatico Henríquez","occurrenceId":"0a4bbd2c-0af3-40df-b422-89341afe44e5"}},{"text":", the man who brought típico from Nagua into the capital and who added the bass and the guitar to a form that had done without both. Getting the bass chair in that band means being present at the moment the instrument entered the tradition at all.","type":"text"}]},{"type":"paragraph","content":[{"text":"He later worked with the Román family, on sides led by ","type":"text"},{"type":"artistReference","attrs":{"artistId":"7a92e4df-157c-49d9-9905-17ac0f740c4e","displayText":"Rafaelito Román","occurrenceId":"55915bb1-8889-4c60-9dec-24ee05176521"}},{"text":" — María Luisa, La Lisa, La Cama, La Cartera Vacía, La Cruz de Oro, Homenaje a Vidal — where the credit is written out under his full legal name. He also plays on El Ciego de Nagua’s Sabor a Caña, from 1978.","type":"text"}]},{"type":"paragraph","content":[{"text":"Nothing personal about him is written down: no date of birth, no town, no interview. What survives is a nickname, a run of credits and the memory of an unusual instrument.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'rafael-zoilo-peralta'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Rafael Zoilo Peralta, conocido por todo el mundo en la música como El Pingüino, es bajista de merengue típico. Es músico acompañante, y la gente que lo recuerda recuerda el bajo mismo.","type":"text"}]},{"type":"paragraph","content":[{"text":"El instrumento","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El típico es acordeón, tambora y güira, y cuando llegó el bajo llegó eléctrico, enchufado y amarrado a la tambora. A él se le recuerda en cambio tocando contrabajo: un bajo acústico entero, de pie, dentro de un conjunto típico, cosa que los músicos que lo vieron describen como algo que nunca habían visto en esta música.","type":"text"}]},{"type":"paragraph","content":[{"text":"No es una diferencia de adorno. Un contrabajo le responde distinto a la tambora: menos cola, más aire, menos empuje. En una música cuyo motor entero es la discusión entre el acordeón y el tambor, cambiar lo que hace el bajo cambia dónde está el piso.","type":"text"}]},{"type":"paragraph","content":[{"text":"En qué conjuntos","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Se le nombra en el conjunto de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"9b15dfca-0f60-49b3-a139-100a5a329741","displayText":"Tatico Henríquez","occurrenceId":"aaa7a0d4-105c-4c79-86e4-133c43675094"}},{"text":", el hombre que trajo el típico de Nagua a la capital y que le agregó el bajo y la guitarra a una forma que se arreglaba sin los dos. Ocupar la silla de bajo en esa banda es estar presente en el momento mismo en que el instrumento entra a la tradición.","type":"text"}]},{"type":"paragraph","content":[{"text":"Después trabajó con la familia Román, en discos dirigidos por ","type":"text"},{"type":"artistReference","attrs":{"artistId":"7a92e4df-157c-49d9-9905-17ac0f740c4e","displayText":"Rafaelito Román","occurrenceId":"96287b09-4576-48b7-becd-d24561bb7d47"}},{"text":": María Luisa, La Lisa, La Cama, La Cartera Vacía, La Cruz de Oro, Homenaje a Vidal, donde el crédito aparece escrito con su nombre legal completo. También toca en Sabor a Caña, de El Ciego de Nagua, de 1978.","type":"text"}]},{"type":"paragraph","content":[{"text":"De lo personal no hay nada escrito: ni fecha de nacimiento, ni pueblo, ni entrevista. Lo que queda es un apodo, una lista de créditos y el recuerdo de un instrumento raro.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'rafael-zoilo-peralta'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rafael-zoilo-peralta') AND locale = 'en'), '0a4bbd2c-0af3-40df-b422-89341afe44e5', 'artist', '9b15dfca-0f60-49b3-a139-100a5a329741');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rafael-zoilo-peralta') AND locale = 'en'), '55915bb1-8889-4c60-9dec-24ee05176521', 'artist', '7a92e4df-157c-49d9-9905-17ac0f740c4e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rafael-zoilo-peralta') AND locale = 'es'), '96287b09-4576-48b7-becd-d24561bb7d47', 'artist', '7a92e4df-157c-49d9-9905-17ac0f740c4e');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'rafael-zoilo-peralta') AND locale = 'es'), 'aaa7a0d4-105c-4c79-86e4-133c43675094', 'artist', '9b15dfca-0f60-49b3-a139-100a5a329741');

COMMIT;
