BEGIN;

-- Rewrite the catalogue entry for Yanfourd.
--
-- Yanfourd. Filler in English, nothing in Spanish, no gender, no occupations
-- and -- the reason this row needed opening -- the wrong Macorís.
--
-- STORED VALUE OVERWRITTEN, AND THE EDITOR SHOULD CHECK IT. The row carried
-- province "San Pedro de Macorís" and birth_place "San Pedro de Macorís".
-- Nothing sources that. Every account he controls puts him in San Francisco de
-- Macorís, in Duarte, a different province at the other end of the country:
-- his Facebook page is located there, his Instagram bio reads "DE SAN
-- FRANCISCO DE MACORÍS", and he addresses the city as "mi gente de San
-- Francisco de Macorís #SFM". The two cities share the surname Macorís and get
-- confused constantly, which is almost certainly what happened at import.
-- Province is now Duarte and birth_place San Francisco de Macorís.
--
-- The prose says he works out of the city rather than that he was born there,
-- because his own posts establish the first and no source establishes the
-- second. No article found gives a legal name or a date of birth.
--
-- CORRECTED: gender null -> male. ADDED: occupations composer (his own YouTube
-- channel bills him as "artista, intérprete y compositor"), genres, aliases,
-- disambiguation.
--
-- SOURCES: Impacto Latino, interview by Miriam Fernández-Soberón, 4 September
-- 2014, which is the only long interview found and supplies the beginning --
-- pop and ballads from the age of twelve, the group Mi Destino, the appearance
-- at the Juegos Panamericanos y del Caribe, the retreat, the return through
-- salsa, Frankie Ruiz and Eddie Santiago as models -- and the making of La
-- Traición: recorded at Polo Parra's studios, arrangements by Víctor Waill,
-- fourteen tracks, more than a year of work, released through Elegant Records
-- after his manager Steven Cifre took him on, with Gracias as the promotional
-- single. Hoy, 23 January 2015; MocaPresente, 21 January 2015; Helda Hoy, 14
-- January 2015; Costa Verde, 26 January 2015; Martí Noticias, 13 January 2015;
-- El Día, 3 December 2014; and Correo Cultural, 2 December 2014, all
-- contemporaneous, for the Billboard tropical placing with Pirata de Amor and
-- for the Premio Lo Nuestro nomination as Artista Salsa del Año, where he ran
-- against Marc Anthony, Víctor Manuelle and Salsa Giants. MinayaPR and Diario
-- Libre, 7-8 May 2025, for Corazón en Soledad and the JN Music Group
-- distribution deal. MusicBrainz for La traición and Pirata de amor, 2014.
--
-- A DISCREPANCY LEFT UNRESOLVED. The 2025 press release says the 2015
-- nominations were to Premios Juventud and Premios Soberano. Everything
-- published at the time says Premio Lo Nuestro. The contemporaneous reporting
-- is followed and the award row records Lo Nuestro only.
--
-- NOT WRITTEN: the interview also has him on his own looks and on what
-- audiences like about them. It is not about the music.
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
       name = 'Yanfourd',
       sort_name = 'Yanfourd',
       type = 'solo_artist',
       status = 'published',
       gender = 'male',
       ended = FALSE,
       primary_role = 'singer',
       primary_genre = 'salsa',
       date_of_birth = NULL,
       birth_year = NULL,
       date_of_death = NULL,
       birth_place = 'San Francisco de Macorís',
       province = 'Duarte',
       first_name = NULL,
       middle_name = NULL,
       last_name = NULL,
       second_last_name = NULL,
       stage_name = 'Yanfourd',
       aliases = ARRAY['El Yanfourd']::text[],
       occupations = '["composer"]'::jsonb,
       instruments = ARRAY[]::text[],
       genres = ARRAY['ballads-romantic']::text[],
       artist_tags = ARRAY['secular']::text[],
       website = NULL,
       youtube = '@Yanfourd',
       facebook = 'yanfourdofficial',
       instagram = 'yanfourd',
       disambiguation = 'Dominican salsa singer; Pirata de Amor, Corazón en Soledad',
       bio_en = 'Yanfourd is a Dominican salsa singer who works out of San Francisco de Macorís. The choice of genre is the first thing to explain about him: a young Dominican singer is expected to take merengue or bachata, and he took the one that belongs to somebody else’s island.

**Coming to salsa**

He sang pop and ballads from the age of twelve and appeared at the Juegos Panamericanos y del Caribe with a group called Mi Destino, then stepped away from music for a while. What brought him back was seeing Frankie Ruiz perform in the Dominican Republic. Ruiz and Eddie Santiago are the models he names, and both are salsa romántica singers from Puerto Rico.

He carried his own material to producers and labels for years without getting a record made, which he has described plainly as the ordinary condition of anybody starting out. The break came when Elegant Records and the manager Steven Cifre took him on.

**La Traición**

The debut album took more than a year and holds fourteen songs. It was cut at Polo Parra’s studios with arrangements by Víctor Waill, and Gracias was the single sent out ahead of it.

Pirata de Amor, from the same period, put him at the top of Billboard’s tropical chart — the first Dominican salsero to get there, which is how the Dominican press reported it at the time. The following season he was nominated for Premio Lo Nuestro as Artista Salsa del Año, in a category that also held Marc Anthony, Víctor Manuelle and Salsa Giants.

**Still recording**

Si Tú No Estás, El Amor de Mi Vida, Simplemente Amigos, Me Va a Matar el Deseo and Gracias por Hacerme Tan Feliz followed, and the repertoire has stayed where it started: romantic salsa, sung rather than shouted.

Corazón en Soledad, in May 2025, restarted the career after a quiet stretch, released with a distribution deal through JN Music Group. Nothing personal about him is documented — no legal name, no date of birth, no town of origin beyond the city he plays for.',
       bio_es = 'Yanfourd es un salsero dominicano que trabaja desde San Francisco de Macorís. Lo primero que hay que explicar de él es la elección de género: de un cantante dominicano joven se espera merengue o bachata, y él tomó el que es de otra isla.

**Cómo llegó a la salsa**

Cantó pop y baladas desde los doce años y se presentó en los Juegos Panamericanos y del Caribe con un grupo llamado Mi Destino; después se apartó un tiempo de la música. Lo que lo trajo de vuelta fue ver a Frankie Ruiz en la República Dominicana. Ruiz y Eddie Santiago son los modelos que él nombra, y los dos son salseros románticos puertorriqueños.

Durante años llevó su propia música a productores y disqueras sin conseguir que se la grabaran, cosa que él ha descrito sin adornos como la condición corriente de cualquiera que empieza. La puerta se abrió cuando Elegant Records y el mánager Steven Cifre se hicieron cargo.

**La Traición**

El disco de debut tomó más de un año y tiene catorce canciones. Se grabó en los estudios de Polo Parra con arreglos de Víctor Waill, y Gracias fue el tema que se mandó por delante.

Pirata de Amor, del mismo período, lo puso en la cima de la lista tropical de Billboard: el primer salsero dominicano en llegar ahí, según lo reportó entonces la prensa dominicana. La temporada siguiente quedó nominado a Premio Lo Nuestro como Artista Salsa del Año, en un renglón donde también estaban Marc Anthony, Víctor Manuelle y Salsa Giants.

**Sigue grabando**

Detrás vinieron Si Tú No Estás, El Amor de Mi Vida, Simplemente Amigos, Me Va a Matar el Deseo y Gracias por Hacerme Tan Feliz, y el repertorio se quedó donde empezó: salsa romántica, cantada y no gritada.

Corazón en Soledad, en mayo de 2025, reactivó la carrera después de un tramo callado, con un acuerdo de distribución por JN Music Group. De lo personal no hay nada documentado: ni nombre legal, ni fecha de nacimiento, ni pueblo de origen más allá de la ciudad para la que toca.',
       updated_at = now()
 WHERE slug = 'yanfourd';

DELETE FROM editorial_entity_references
 WHERE editorial_document_id IN (
   SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yanfourd')
 );

DELETE FROM editorial_documents
 WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yanfourd')
   AND locale NOT IN ('en', 'es');

INSERT INTO editorial_documents
  (document_type, locale, schema_version, document, status, owner_artist_id, revision)
VALUES ('artist_biography', 'en', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Yanfourd is a Dominican salsa singer who works out of San Francisco de Macorís. The choice of genre is the first thing to explain about him: a young Dominican singer is expected to take merengue or bachata, and he took the one that belongs to somebody else’s island.","type":"text"}]},{"type":"paragraph","content":[{"text":"Coming to salsa","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"He sang pop and ballads from the age of twelve and appeared at the Juegos Panamericanos y del Caribe with a group called Mi Destino, then stepped away from music for a while. What brought him back was seeing Frankie Ruiz perform in the Dominican Republic. Ruiz and Eddie Santiago are the models he names, and both are salsa romántica singers from Puerto Rico.","type":"text"}]},{"type":"paragraph","content":[{"text":"He carried his own material to producers and labels for years without getting a record made, which he has described plainly as the ordinary condition of anybody starting out. The break came when Elegant Records and the manager Steven Cifre took him on.","type":"text"}]},{"type":"paragraph","content":[{"text":"La Traición","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"The debut album took more than a year and holds fourteen songs. It was cut at Polo Parra’s studios with arrangements by ","type":"text"},{"type":"artistReference","attrs":{"artistId":"95010ba2-3d12-4976-938d-141737fb2daa","displayText":"Víctor Waill","occurrenceId":"39e47eaa-9b60-4613-9cdf-f0dbbcce7618"}},{"text":", and Gracias was the single sent out ahead of it.","type":"text"}]},{"type":"paragraph","content":[{"text":"Pirata de Amor, from the same period, put him at the top of Billboard’s tropical chart — the first Dominican salsero to get there, which is how the Dominican press reported it at the time. The following season he was nominated for Premio Lo Nuestro as Artista Salsa del Año, in a category that also held Marc Anthony, Víctor Manuelle and Salsa Giants.","type":"text"}]},{"type":"paragraph","content":[{"text":"Still recording","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Si Tú No Estás, El Amor de Mi Vida, Simplemente Amigos, Me Va a Matar el Deseo and Gracias por Hacerme Tan Feliz followed, and the repertoire has stayed where it started: romantic salsa, sung rather than shouted.","type":"text"}]},{"type":"paragraph","content":[{"text":"Corazón en Soledad, in May 2025, restarted the career after a quiet stretch, released with a distribution deal through JN Music Group. Nothing personal about him is documented — no legal name, no date of birth, no town of origin beyond the city he plays for.","type":"text"}]}]}'::jsonb, 'published', (SELECT id FROM artists WHERE slug = 'yanfourd'), 2)
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
VALUES ('artist_biography', 'es', 1, '{"type":"doc","content":[{"type":"paragraph","content":[{"text":"Yanfourd es un salsero dominicano que trabaja desde San Francisco de Macorís. Lo primero que hay que explicar de él es la elección de género: de un cantante dominicano joven se espera merengue o bachata, y él tomó el que es de otra isla.","type":"text"}]},{"type":"paragraph","content":[{"text":"Cómo llegó a la salsa","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Cantó pop y baladas desde los doce años y se presentó en los Juegos Panamericanos y del Caribe con un grupo llamado Mi Destino; después se apartó un tiempo de la música. Lo que lo trajo de vuelta fue ver a Frankie Ruiz en la República Dominicana. Ruiz y Eddie Santiago son los modelos que él nombra, y los dos son salseros románticos puertorriqueños.","type":"text"}]},{"type":"paragraph","content":[{"text":"Durante años llevó su propia música a productores y disqueras sin conseguir que se la grabaran, cosa que él ha descrito sin adornos como la condición corriente de cualquiera que empieza. La puerta se abrió cuando Elegant Records y el mánager Steven Cifre se hicieron cargo.","type":"text"}]},{"type":"paragraph","content":[{"text":"La Traición","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"El disco de debut tomó más de un año y tiene catorce canciones. Se grabó en los estudios de Polo Parra con arreglos de ","type":"text"},{"type":"artistReference","attrs":{"artistId":"95010ba2-3d12-4976-938d-141737fb2daa","displayText":"Víctor Waill","occurrenceId":"391d9380-1c3c-4622-8ad3-a26defc3b766"}},{"text":", y Gracias fue el tema que se mandó por delante.","type":"text"}]},{"type":"paragraph","content":[{"text":"Pirata de Amor, del mismo período, lo puso en la cima de la lista tropical de Billboard: el primer salsero dominicano en llegar ahí, según lo reportó entonces la prensa dominicana. La temporada siguiente quedó nominado a Premio Lo Nuestro como Artista Salsa del Año, en un renglón donde también estaban Marc Anthony, Víctor Manuelle y Salsa Giants.","type":"text"}]},{"type":"paragraph","content":[{"text":"Sigue grabando","type":"text","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"text":"Detrás vinieron Si Tú No Estás, El Amor de Mi Vida, Simplemente Amigos, Me Va a Matar el Deseo y Gracias por Hacerme Tan Feliz, y el repertorio se quedó donde empezó: salsa romántica, cantada y no gritada.","type":"text"}]},{"type":"paragraph","content":[{"text":"Corazón en Soledad, en mayo de 2025, reactivó la carrera después de un tramo callado, con un acuerdo de distribución por JN Music Group. De lo personal no hay nada documentado: ni nombre legal, ni fecha de nacimiento, ni pueblo de origen más allá de la ciudad para la que toca.","type":"text"}]}]}'::jsonb, 'draft', (SELECT id FROM artists WHERE slug = 'yanfourd'), 1)
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
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yanfourd') AND locale = 'en'), '39e47eaa-9b60-4613-9cdf-f0dbbcce7618', 'artist', '95010ba2-3d12-4976-938d-141737fb2daa');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ((SELECT id FROM editorial_documents WHERE owner_artist_id = (SELECT id FROM artists WHERE slug = 'yanfourd') AND locale = 'es'), '391d9380-1c3c-4622-8ad3-a26defc3b766', 'artist', '95010ba2-3d12-4976-938d-141737fb2daa');

COMMIT;
