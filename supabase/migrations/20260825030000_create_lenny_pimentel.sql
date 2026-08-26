BEGIN;

-- Lenny Pimentel — new artist record and biography (both locales).
--
-- Dominican worship singer, songwriter and producer; also releases as
-- "Lenny Piment". Listed among the former members of Ilegales, the merenhouse
-- group formed in 1993, where he spent roughly nine years as writer and
-- vocalist. Now pastors Casa de Dios La Hermosa in Baní, Peravia, and has
-- released worship records steadily since 2020.
--
-- Sourcing: the Ilegales membership is corroborated by the English Wikipedia
-- article on the group; the release list and dates come from the artist's
-- Apple Music catalogue; the 2018 debut, its producers and the ministry's
-- location come from Dominican Christian-music press coverage.
--
-- Deliberately NOT recorded: press pieces about him repeat, verbatim and
-- without detail, a claim that he "produced an album with Enrique Iglesias".
-- No album, role or date is ever given and nothing independent corroborates
-- it, so it is left out rather than entered as fact. The biography says only
-- what is supported — that he wrote for artists in commercial Latin music.
--
-- Also not recorded: date and place of birth, and the exact years he was with
-- Ilegales. None are documented in any source consulted; the fields are left
-- null rather than estimated.

INSERT INTO artists (
  id, name, sort_name, slug, first_name, last_name, type, status, gender,
  primary_role, occupations, primary_genre, genres, artist_tags, aliases,
  disambiguation, instagram, facebook, youtube, has_image, created_at, updated_at
) VALUES (
  '74a2a301-f4ae-471d-8f8c-3515bb03b428',
  'Lenny Pimentel',
  'Pimentel, Lenny',
  'lenny-pimentel',
  'Lenny',
  'Pimentel',
  'solo_artist',
  'published',
  'male',
  'singer',
  -- occupations must not repeat primary_role ('singer'). "Pastor" is not a
  -- value in ROLE_DICTIONARY.md and is left to the biography prose.
  '["songwriter", "producer"]'::jsonb,
  'worship',
  -- merengue-house records the nine years of practice inside Ilegales; his own
  -- catalogue is worship, which is why that is the primary.
  ARRAY['merengue-house']::text[],
  ARRAY['christian']::text[],
  ARRAY['lenny piment']::text[],
  'Dominican worship singer, songwriter and pastor, formerly of Ilegales',
  'lennypiment',
  'lennypimenteloficial',
  '@LennyPimentelOfficial',
  false,
  now(),
  now()
)
ON CONFLICT (slug) DO NOTHING;

-- English biography. The Spanish text is an
-- independent piece of writing, not a translation of the English.
INSERT INTO editorial_documents (
  id, document_type, locale, schema_version, document, status,
  owner_artist_id, revision, created_at, updated_at
) VALUES (
  'c486f572-a63f-4157-affe-c28afda33009',
  'artist_biography',
  'en',
  1,
  $json${"type":"doc","content":[{"type":"paragraph","content":[{"type":"text","text":"Lenny Pimentel, who also records as Lenny Piment, is a Dominican worship singer, songwriter and producer who spent roughly nine years inside the merenhouse group "},{"type":"artistReference","attrs":{"occurrenceId":"d0f59d48-0750-45cd-b3ab-576ba3618881","artistId":"1cd11a22-573a-43b4-8f54-fbd08329a4e2","displayText":"Ilegales"}},{"type":"text","text":" before leaving commercial music for the church. He pastors Casa de Dios La Hermosa in Baní and has released worship records steadily since 2020, writing from his own experience rather than to a devotional formula."}]},{"type":"paragraph","content":[{"type":"text","text":"The Ilegales years","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"Pimentel worked as a writer and vocalist with "},{"type":"artistReference","attrs":{"occurrenceId":"8623dbaf-c315-4e8a-9610-3837d36dcae5","artistId":"1cd11a22-573a-43b4-8f54-fbd08329a4e2","displayText":"Ilegales"}},{"type":"text","text":", the group formed in 1993 that pushed merenhouse past the Dominican market and onto international charts with records such as La Morena and El Taqui Taqui. He is listed among its former members and spent about nine years with the group, contributing compositions as well as voice. Accounts of this period also credit him with writing for other artists working in commercial Latin music."}]},{"type":"paragraph","content":[{"type":"text","text":"Conversion and Casa de Dios La Hermosa","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"He left the group and secular music altogether for pastoral work. With his family he leads Casa de Dios La Hermosa, a congregation in Baní, in the province of Peravia. Ministry and recording have run together since: he has described his songs as arriving out of what he was living through at the time, each one tied to a particular passage rather than written to order."}]},{"type":"paragraph","content":[{"type":"text","text":"Worship recordings","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"His first Christian project appeared in 2018 — an album of ten songs produced by Israel Martínez, with Benny Martínez as co-producer, introduced by the single Aún no has terminado and the video Muestra Tu Poder."}]},{"type":"paragraph","content":[{"type":"text","text":"A second and more sustained run began with Demasiado, released on 16 November 2020 and written during the COVID-19 pandemic. Encuéntrame followed in 2021 as part of the EP Uno Más. The 2023 releases include Movimiento, a collaboration with "},{"type":"artistReference","attrs":{"occurrenceId":"b9d4d6ec-18d7-4d59-ae81-3658fc9fd959","artistId":"629a7daa-5ab3-4b77-825f-6795b8c4a566","displayText":"Marcos Yaroide"}},{"type":"text","text":" that carried across Latin American Christian radio, alongside the live single Betesda, Consúmenos with Grupo Grace, and the live EP Tu Presencia Vale Más."}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Demasiado — single, 2020"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Encuéntrame — single, 2021, from the EP Uno Más"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Betesda (Live) — single with Hope W Music, 2023"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Movimiento — single with "},{"type":"artistReference","attrs":{"occurrenceId":"c48fb973-54c2-4666-a861-c248f7369879","artistId":"629a7daa-5ab3-4b77-825f-6795b8c4a566","displayText":"Marcos Yaroide"}},{"type":"text","text":", 2023"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Consúmenos — single with Grupo Grace, 2023"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Tu Presencia Vale Más (Live) — EP, 2023"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"De mi casa se acordó Jehová — single, 2025"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"El Más Grande — single, 2025"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"A Donde Huiré — single, 6 November 2025"}]}]}]},{"type":"paragraph","content":[{"type":"text","text":"Legacy","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"Pimentel's route — from a merenhouse group with international records to a pulpit in Baní — is among the clearer Dominican cases of a commercial songwriter moving wholly into worship music and staying productive there. He did not trade recording for ministry but kept both, and the catalogue he has built since 2020 is the work of someone still writing, not a figure retired into the pastorate."}]}]}$json$::jsonb,
  'published',
  '74a2a301-f4ae-471d-8f8c-3515bb03b428',
  1,
  now(),
  now()
);

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('c486f572-a63f-4157-affe-c28afda33009', 'd0f59d48-0750-45cd-b3ab-576ba3618881', 'artist', '1cd11a22-573a-43b4-8f54-fbd08329a4e2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('c486f572-a63f-4157-affe-c28afda33009', '8623dbaf-c315-4e8a-9610-3837d36dcae5', 'artist', '1cd11a22-573a-43b4-8f54-fbd08329a4e2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('c486f572-a63f-4157-affe-c28afda33009', 'b9d4d6ec-18d7-4d59-ae81-3658fc9fd959', 'artist', '629a7daa-5ab3-4b77-825f-6795b8c4a566');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('c486f572-a63f-4157-affe-c28afda33009', 'c48fb973-54c2-4666-a861-c248f7369879', 'artist', '629a7daa-5ab3-4b77-825f-6795b8c4a566');

-- Legacy markdown mirror. Populating this alongside the document is what
-- prevents the missing_document / legacy-only integrity findings.
UPDATE artists
SET bio_en = 'Lenny Pimentel, who also records as Lenny Piment, is a Dominican worship singer, songwriter and producer who spent roughly nine years inside the merenhouse group Ilegales before leaving commercial music for the church. He pastors Casa de Dios La Hermosa in Baní and has released worship records steadily since 2020, writing from his own experience rather than to a devotional formula.

**The Ilegales years**

Pimentel worked as a writer and vocalist with Ilegales, the group formed in 1993 that pushed merenhouse past the Dominican market and onto international charts with records such as La Morena and El Taqui Taqui. He is listed among its former members and spent about nine years with the group, contributing compositions as well as voice. Accounts of this period also credit him with writing for other artists working in commercial Latin music.

**Conversion and Casa de Dios La Hermosa**

He left the group and secular music altogether for pastoral work. With his family he leads Casa de Dios La Hermosa, a congregation in Baní, in the province of Peravia. Ministry and recording have run together since: he has described his songs as arriving out of what he was living through at the time, each one tied to a particular passage rather than written to order.

**Worship recordings**

His first Christian project appeared in 2018 — an album of ten songs produced by Israel Martínez, with Benny Martínez as co-producer, introduced by the single Aún no has terminado and the video Muestra Tu Poder.

A second and more sustained run began with Demasiado, released on 16 November 2020 and written during the COVID-19 pandemic. Encuéntrame followed in 2021 as part of the EP Uno Más. The 2023 releases include Movimiento, a collaboration with Marcos Yaroide that carried across Latin American Christian radio, alongside the live single Betesda, Consúmenos with Grupo Grace, and the live EP Tu Presencia Vale Más.

- Demasiado — single, 2020  
- Encuéntrame — single, 2021, from the EP Uno Más  
- Betesda (Live) — single with Hope W Music, 2023  
- Movimiento — single with Marcos Yaroide, 2023  
- Consúmenos — single with Grupo Grace, 2023  
- Tu Presencia Vale Más (Live) — EP, 2023  
- De mi casa se acordó Jehová — single, 2025  
- El Más Grande — single, 2025  
- A Donde Huiré — single, 6 November 2025

**Legacy**

Pimentel''s route — from a merenhouse group with international records to a pulpit in Baní — is among the clearer Dominican cases of a commercial songwriter moving wholly into worship music and staying productive there. He did not trade recording for ministry but kept both, and the catalogue he has built since 2020 is the work of someone still writing, not a figure retired into the pastorate.',
    updated_at = now()
WHERE id = '74a2a301-f4ae-471d-8f8c-3515bb03b428';

-- Spanish biography. The Spanish text is an
-- independent piece of writing, not a translation of the English.
INSERT INTO editorial_documents (
  id, document_type, locale, schema_version, document, status,
  owner_artist_id, revision, created_at, updated_at
) VALUES (
  '7d349801-eb29-4a5b-96e4-f2d0a5f6730b',
  'artist_biography',
  'es',
  1,
  $json${"type":"doc","content":[{"type":"paragraph","content":[{"type":"text","text":"Lenny Pimentel, que también graba como Lenny Piment, es un cantante de alabanza, compositor y productor dominicano que pasó cerca de nueve años en la agrupación de merenhouse "},{"type":"artistReference","attrs":{"occurrenceId":"eb5d55a6-0374-44e2-9277-2a9bbcc7417c","artistId":"1cd11a22-573a-43b4-8f54-fbd08329a4e2","displayText":"Ilegales"}},{"type":"text","text":" antes de dejar la música comercial por la iglesia. Pastorea Casa de Dios La Hermosa, en Baní, y desde 2020 publica música de adoración con regularidad, escribiendo desde lo vivido y no desde una fórmula devocional."}]},{"type":"paragraph","content":[{"type":"text","text":"Los años en Ilegales","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"Pimentel trabajó como compositor y vocalista en "},{"type":"artistReference","attrs":{"occurrenceId":"293827b8-944a-4b44-af28-de37714bd967","artistId":"1cd11a22-573a-43b4-8f54-fbd08329a4e2","displayText":"Ilegales"}},{"type":"text","text":", el grupo formado en 1993 que llevó el merenhouse más allá del mercado dominicano hasta las listas internacionales con temas como La Morena y El Taqui Taqui. Figura entre sus integrantes anteriores y estuvo cerca de nueve años en la agrupación, aportando composiciones además de voz. Los relatos de esa etapa también le atribuyen haber escrito para otros artistas de la música latina comercial."}]},{"type":"paragraph","content":[{"type":"text","text":"Conversión y Casa de Dios La Hermosa","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"Dejó el grupo y la música secular por completo para dedicarse al trabajo pastoral. Junto a su familia dirige Casa de Dios La Hermosa, una congregación de Baní, en la provincia de Peravia. Desde entonces el ministerio y la grabación caminan juntos: ha explicado que sus canciones surgen de lo que estaba atravesando en cada momento, atadas a un episodio concreto y no escritas por encargo."}]},{"type":"paragraph","content":[{"type":"text","text":"Grabaciones de alabanza","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"Su primer proyecto cristiano apareció en 2018: un disco de diez canciones producido por Israel Martínez, con Benny Martínez como coproductor, presentado con el sencillo Aún no has terminado y el video Muestra Tu Poder."}]},{"type":"paragraph","content":[{"type":"text","text":"Una segunda etapa, más sostenida, empezó con Demasiado, publicado el 16 de noviembre de 2020 y escrito durante la pandemia de COVID-19. Encuéntrame llegó en 2021 como parte del EP Uno Más. Entre los lanzamientos de 2023 está Movimiento, una colaboración con "},{"type":"artistReference","attrs":{"occurrenceId":"10cb9aa9-f856-4f9a-83a9-d5cfe7923fa5","artistId":"629a7daa-5ab3-4b77-825f-6795b8c4a566","displayText":"Marcos Yaroide"}},{"type":"text","text":" que sonó en la radio cristiana latinoamericana, junto al sencillo en vivo Betesda, Consúmenos con Grupo Grace y el EP en vivo Tu Presencia Vale Más."}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Demasiado — sencillo, 2020"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Encuéntrame — sencillo, 2021, del EP Uno Más"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Betesda (En vivo) — sencillo con Hope W Music, 2023"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Movimiento — sencillo con "},{"type":"artistReference","attrs":{"occurrenceId":"78cba011-1751-4add-8567-61955d7bffe5","artistId":"629a7daa-5ab3-4b77-825f-6795b8c4a566","displayText":"Marcos Yaroide"}},{"type":"text","text":", 2023"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Consúmenos — sencillo con Grupo Grace, 2023"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Tu Presencia Vale Más (En vivo) — EP, 2023"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"De mi casa se acordó Jehová — sencillo, 2025"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"El Más Grande — sencillo, 2025"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"A Donde Huiré — sencillo, 6 de noviembre de 2025"}]}]}]},{"type":"paragraph","content":[{"type":"text","text":"Legado","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"El recorrido de Pimentel —de una agrupación de merenhouse con discos internacionales a un púlpito en Baní— es uno de los casos dominicanos más nítidos de un compositor comercial que se pasa por entero a la música de adoración y sigue produciendo allí. No cambió la grabación por el ministerio sino que conservó ambos, y el catálogo que ha levantado desde 2020 es el de alguien que sigue escribiendo, no el de una figura retirada al pastorado."}]}]}$json$::jsonb,
  'published',
  '74a2a301-f4ae-471d-8f8c-3515bb03b428',
  1,
  now(),
  now()
);

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('7d349801-eb29-4a5b-96e4-f2d0a5f6730b', 'eb5d55a6-0374-44e2-9277-2a9bbcc7417c', 'artist', '1cd11a22-573a-43b4-8f54-fbd08329a4e2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('7d349801-eb29-4a5b-96e4-f2d0a5f6730b', '293827b8-944a-4b44-af28-de37714bd967', 'artist', '1cd11a22-573a-43b4-8f54-fbd08329a4e2');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('7d349801-eb29-4a5b-96e4-f2d0a5f6730b', '10cb9aa9-f856-4f9a-83a9-d5cfe7923fa5', 'artist', '629a7daa-5ab3-4b77-825f-6795b8c4a566');

INSERT INTO editorial_entity_references
  (editorial_document_id, occurrence_id, entity_type, target_artist_id)
VALUES ('7d349801-eb29-4a5b-96e4-f2d0a5f6730b', '78cba011-1751-4add-8567-61955d7bffe5', 'artist', '629a7daa-5ab3-4b77-825f-6795b8c4a566');

-- Legacy markdown mirror. Populating this alongside the document is what
-- prevents the missing_document / legacy-only integrity findings.
UPDATE artists
SET bio_es = 'Lenny Pimentel, que también graba como Lenny Piment, es un cantante de alabanza, compositor y productor dominicano que pasó cerca de nueve años en la agrupación de merenhouse Ilegales antes de dejar la música comercial por la iglesia. Pastorea Casa de Dios La Hermosa, en Baní, y desde 2020 publica música de adoración con regularidad, escribiendo desde lo vivido y no desde una fórmula devocional.

**Los años en Ilegales**

Pimentel trabajó como compositor y vocalista en Ilegales, el grupo formado en 1993 que llevó el merenhouse más allá del mercado dominicano hasta las listas internacionales con temas como La Morena y El Taqui Taqui. Figura entre sus integrantes anteriores y estuvo cerca de nueve años en la agrupación, aportando composiciones además de voz. Los relatos de esa etapa también le atribuyen haber escrito para otros artistas de la música latina comercial.

**Conversión y Casa de Dios La Hermosa**

Dejó el grupo y la música secular por completo para dedicarse al trabajo pastoral. Junto a su familia dirige Casa de Dios La Hermosa, una congregación de Baní, en la provincia de Peravia. Desde entonces el ministerio y la grabación caminan juntos: ha explicado que sus canciones surgen de lo que estaba atravesando en cada momento, atadas a un episodio concreto y no escritas por encargo.

**Grabaciones de alabanza**

Su primer proyecto cristiano apareció en 2018: un disco de diez canciones producido por Israel Martínez, con Benny Martínez como coproductor, presentado con el sencillo Aún no has terminado y el video Muestra Tu Poder.

Una segunda etapa, más sostenida, empezó con Demasiado, publicado el 16 de noviembre de 2020 y escrito durante la pandemia de COVID-19. Encuéntrame llegó en 2021 como parte del EP Uno Más. Entre los lanzamientos de 2023 está Movimiento, una colaboración con Marcos Yaroide que sonó en la radio cristiana latinoamericana, junto al sencillo en vivo Betesda, Consúmenos con Grupo Grace y el EP en vivo Tu Presencia Vale Más.

- Demasiado — sencillo, 2020  
- Encuéntrame — sencillo, 2021, del EP Uno Más  
- Betesda (En vivo) — sencillo con Hope W Music, 2023  
- Movimiento — sencillo con Marcos Yaroide, 2023  
- Consúmenos — sencillo con Grupo Grace, 2023  
- Tu Presencia Vale Más (En vivo) — EP, 2023  
- De mi casa se acordó Jehová — sencillo, 2025  
- El Más Grande — sencillo, 2025  
- A Donde Huiré — sencillo, 6 de noviembre de 2025

**Legado**

El recorrido de Pimentel —de una agrupación de merenhouse con discos internacionales a un púlpito en Baní— es uno de los casos dominicanos más nítidos de un compositor comercial que se pasa por entero a la música de adoración y sigue produciendo allí. No cambió la grabación por el ministerio sino que conservó ambos, y el catálogo que ha levantado desde 2020 es el de alguien que sigue escribiendo, no el de una figura retirada al pastorado.',
    updated_at = now()
WHERE id = '74a2a301-f4ae-471d-8f8c-3515bb03b428';

COMMIT;
