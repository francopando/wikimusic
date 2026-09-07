BEGIN;

-- Alfredo Polonia — biography rewrite, missing Spanish document, and record
-- corrections. He is El Padre de la Plena Dominicana; the entry did not say so.
--
-- The stored English biography was wrong on three counts. It gave his birthplace
-- as Santiago: he was born in Arroyo Toro, a municipal district of Bonao in
-- Monseñor Nouel, and died in that same district. It put his age at death at
-- ninety-five: born 9 February 1929 and died 24 November 2025, he was ninety-six.
-- And it described him entirely as a keeper of merengue típico, omitting the whole
-- reason he matters — he introduced and adapted the Puerto Rican plena, and the
-- Dominican branch of that form is substantially his work. The record's own
-- birth_place column already read Bonao, so the prose contradicted the row it sat on.
--
-- There was no Spanish document at all, a Rule 5 violation. One is created here,
-- written independently rather than translated.
--
-- Sourcing: the almomento.net profile supplied by the editor, corroborated
-- independently for the birth and death dates, the age at death, the Arroyo Toro
-- birthplace, the Padre de la Plena Dominicana title, the Resolution 8-2018
-- declaration as Hijo Distinguido of Bonao, the La Voz del Trópico rented-airtime
-- detail, and the song and album titles.
--
-- No artistReference nodes: his sons Tommy and Aldo Polonia are named in the prose
-- but are not catalogue records, and nothing else mentioned is either.
--
-- birth_place moves from 'Bonao' to 'Arroyo Toro, Bonao' — the district is where he
-- was born and died, and it is what the sources give.
--
-- genres gains 'folklore-plena-dominicana', added to the taxonomy in 20260905200000.
-- primary_genre is deliberately left at 'merengue' pending an editorial decision: on
-- the evidence it should almost certainly be the plena slug, but that moves his
-- genre-page membership and was not what was asked for.

UPDATE editorial_documents
SET document = $json${"type":"doc","content":[{"type":"paragraph","content":[{"type":"text","text":"Alfredo Polonia (9 February 1929 – 24 November 2025), known as Fello, was a Dominican singer, accordionist and composer who took the plena — a Puerto Rican form — rebuilt it around Dominican speech and circumstance, and spent half a century making it sound native. He is remembered as El Padre de la Plena Dominicana, the father of Dominican plena, and the title is close to literal: the form has a Dominican branch largely because he decided it should."}]},{"type":"paragraph","content":[{"type":"text","text":"Early years","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"He was born in Arroyo Toro, a rural municipal district of Bonao in the province of Monseñor Nouel, and died there ninety-six years later, in the district that raised him. His two sons, Tommy and Aldo Polonia, both became musicians, working in bachata and merengue rather than their father's genre."}]},{"type":"paragraph","content":[{"type":"text","text":"What plena is, and what he did with it","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"Plena came out of Ponce, on the southern coast of Puerto Rico: an African-rooted music built on the pandereta, the hand frame drum, and sung in verses plain enough for anyone to repeat. It was known as the periódico cantado — the sung newspaper — because that is what it did. It reported. Accidents, scandals, the price of things, the daily indignities of working people: plena carried the news through neighbourhoods the actual newspapers were not written for."}]},{"type":"paragraph","content":[{"type":"text","text":"That reporting instinct is the part Polonia took. He did not import plena as a curiosity or perform it as a foreign novelty; he moved it into Dominican speech, Dominican humour and Dominican circumstance, and pointed it at what was happening around him. Titles like Lo Que le Pasó a Juan and Adónde Llegará el Pobre are the sung newspaper working exactly as intended, in a second country."}]},{"type":"paragraph","content":[{"type":"text","text":"Getting it played","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"No label was pushing this music and there was no obvious commercial argument for it, so Polonia rented airtime on the radio station La Voz del Trópico and played his own records. That is how plena dominicana reached listeners across the country instead of staying a local matter around Bonao. The songs outlived the arrangement: they still turn up on traditional radio and on streaming services."}]},{"type":"paragraph","content":[{"type":"text","text":"Recordings","marks":[{"type":"bold"}]}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Sisua, Sisua (La Piedra de Amolar) — among the best known of his songs"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Lo Que le Pasó a Juan"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Adónde Llegará el Pobre"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Cosas Increíbles"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"La Minifalda"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"En Plena Dominicana — 1995"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Plena Dominicana Vol. 2 — 1997"}]}]}]},{"type":"paragraph","content":[{"type":"text","text":"Recognition","marks":[{"type":"bold"}]}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Declared a Distinguished Son of Bonao by Resolution 8-2018 of the municipal Council of Aldermen"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Known through his later life as El Padre de la Plena Dominicana"}]}]}]},{"type":"paragraph","content":[{"type":"text","text":"Legacy","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"Polonia died on the night of 24 November 2025, aged ninety-six. What he leaves is unusual for a Dominican musician: not a body of work inside an existing tradition, but a tradition that was not here before him and is now. Plena dominicana had no Dominican lineage to inherit — he built the thing he then spent his life practising, and he did it by renting radio hours rather than waiting to be signed."}]}]}$json$::jsonb,
    revision = revision + 1,
    updated_at = now()
WHERE id = 'cd183864-5634-49f9-baf5-40d897db2abb';

INSERT INTO editorial_documents (id, document_type, locale, schema_version, document, status, owner_artist_id, revision, created_at, updated_at)
VALUES ('d0ac595a-cf64-4ef2-95e7-8e2d6f384e07', 'artist_biography', 'es', 1, $json${"type":"doc","content":[{"type":"paragraph","content":[{"type":"text","text":"Alfredo Polonia (9 de febrero de 1929 – 24 de noviembre de 2025), conocido como Fello, fue un cantante, acordeonista y compositor dominicano que tomó la plena — género puertorriqueño — la rehízo sobre el habla y las circunstancias dominicanas, y pasó medio siglo haciéndola sonar propia. Se le recuerda como El Padre de la Plena Dominicana, y el título es casi literal: la plena tiene una rama dominicana en buena medida porque él decidió que la tuviera."}]},{"type":"paragraph","content":[{"type":"text","text":"Primeros años","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"Nació en Arroyo Toro, distrito municipal rural de Bonao, en la provincia Monseñor Nouel, y allí mismo murió noventa y seis años después, en el distrito que lo crió. Sus dos hijos, Tommy y Aldo Polonia, también se hicieron músicos, aunque en la bachata y el merengue y no en el género del padre."}]},{"type":"paragraph","content":[{"type":"text","text":"Qué es la plena y qué hizo él con ella","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"La plena salió de Ponce, en la costa sur de Puerto Rico: música de raíz africana levantada sobre la pandereta y cantada en versos lo bastante llanos como para que cualquiera los repitiera. Se le llamó el periódico cantado porque eso era lo que hacía: informaba. Accidentes, escándalos, el precio de las cosas, las indignidades diarias de la gente trabajadora — la plena llevaba la noticia a barrios para los que los periódicos de verdad no estaban escritos."}]},{"type":"paragraph","content":[{"type":"text","text":"Ese instinto de crónica es lo que Polonia se llevó. No importó la plena como curiosidad ni la interpretó como rareza extranjera: la trasladó al habla, al humor y a las circunstancias dominicanas, y la apuntó hacia lo que ocurría a su alrededor. Títulos como Lo Que le Pasó a Juan o Adónde Llegará el Pobre son el periódico cantado funcionando exactamente como debía, en un segundo país."}]},{"type":"paragraph","content":[{"type":"text","text":"Cómo logró que sonara","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"Ninguna disquera empujaba esta música y no había argumento comercial evidente para ella, así que Polonia alquiló espacio en la emisora La Voz del Trópico y puso sus propios discos. Así la plena dominicana llegó a oyentes de todo el país en lugar de quedarse como cosa de Bonao. Los temas sobrevivieron al arreglo: siguen sonando en la radio tradicional y en las plataformas digitales."}]},{"type":"paragraph","content":[{"type":"text","text":"Grabaciones","marks":[{"type":"bold"}]}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Sisua, Sisua (La Piedra de Amolar) — de los más conocidos de su repertorio"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Lo Que le Pasó a Juan"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Adónde Llegará el Pobre"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Cosas Increíbles"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"La Minifalda"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"En Plena Dominicana — 1995"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Plena Dominicana Vol. 2 — 1997"}]}]}]},{"type":"paragraph","content":[{"type":"text","text":"Reconocimientos","marks":[{"type":"bold"}]}]},{"type":"bulletList","content":[{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Declarado Hijo Distinguido de Bonao mediante la Resolución 8-2018 del Concejo de Regidores"}]}]},{"type":"listItem","content":[{"type":"paragraph","content":[{"type":"text","text":"Conocido en sus últimos años como El Padre de la Plena Dominicana"}]}]}]},{"type":"paragraph","content":[{"type":"text","text":"Legado","marks":[{"type":"bold"}]}]},{"type":"paragraph","content":[{"type":"text","text":"Polonia murió la noche del 24 de noviembre de 2025, a los noventa y seis años. Lo que deja es poco común para un músico dominicano: no una obra dentro de una tradición ya existente, sino una tradición que antes de él no estaba aquí y ahora sí. La plena dominicana no tenía linaje dominicano que heredar — él construyó aquello que después dedicó la vida a practicar, y lo hizo alquilando horas de radio en vez de esperar que lo firmaran."}]}]}$json$::jsonb, 'published', '3b6f60a1-2baa-4e2c-acec-452c5b026397', 1, now(), now())
ON CONFLICT (id) DO NOTHING;

UPDATE artists
SET bio_en = $sql$Alfredo Polonia (9 February 1929 – 24 November 2025), known as Fello, was a Dominican singer, accordionist and composer who took the plena — a Puerto Rican form — rebuilt it around Dominican speech and circumstance, and spent half a century making it sound native. He is remembered as El Padre de la Plena Dominicana, the father of Dominican plena, and the title is close to literal: the form has a Dominican branch largely because he decided it should.

**Early years**

He was born in Arroyo Toro, a rural municipal district of Bonao in the province of Monseñor Nouel, and died there ninety-six years later, in the district that raised him. His two sons, Tommy and Aldo Polonia, both became musicians, working in bachata and merengue rather than their father's genre.

**What plena is, and what he did with it**

Plena came out of Ponce, on the southern coast of Puerto Rico: an African-rooted music built on the pandereta, the hand frame drum, and sung in verses plain enough for anyone to repeat. It was known as the periódico cantado — the sung newspaper — because that is what it did. It reported. Accidents, scandals, the price of things, the daily indignities of working people: plena carried the news through neighbourhoods the actual newspapers were not written for.

That reporting instinct is the part Polonia took. He did not import plena as a curiosity or perform it as a foreign novelty; he moved it into Dominican speech, Dominican humour and Dominican circumstance, and pointed it at what was happening around him. Titles like Lo Que le Pasó a Juan and Adónde Llegará el Pobre are the sung newspaper working exactly as intended, in a second country.

**Getting it played**

No label was pushing this music and there was no obvious commercial argument for it, so Polonia rented airtime on the radio station La Voz del Trópico and played his own records. That is how plena dominicana reached listeners across the country instead of staying a local matter around Bonao. The songs outlived the arrangement: they still turn up on traditional radio and on streaming services.

**Recordings**

- Sisua, Sisua (La Piedra de Amolar) — among the best known of his songs  
- Lo Que le Pasó a Juan  
- Adónde Llegará el Pobre  
- Cosas Increíbles  
- La Minifalda  
- En Plena Dominicana — 1995  
- Plena Dominicana Vol. 2 — 1997

**Recognition**

- Declared a Distinguished Son of Bonao by Resolution 8-2018 of the municipal Council of Aldermen  
- Known through his later life as El Padre de la Plena Dominicana

**Legacy**

Polonia died on the night of 24 November 2025, aged ninety-six. What he leaves is unusual for a Dominican musician: not a body of work inside an existing tradition, but a tradition that was not here before him and is now. Plena dominicana had no Dominican lineage to inherit — he built the thing he then spent his life practising, and he did it by renting radio hours rather than waiting to be signed.$sql$,
    bio_es = $sql$Alfredo Polonia (9 de febrero de 1929 – 24 de noviembre de 2025), conocido como Fello, fue un cantante, acordeonista y compositor dominicano que tomó la plena — género puertorriqueño — la rehízo sobre el habla y las circunstancias dominicanas, y pasó medio siglo haciéndola sonar propia. Se le recuerda como El Padre de la Plena Dominicana, y el título es casi literal: la plena tiene una rama dominicana en buena medida porque él decidió que la tuviera.

**Primeros años**

Nació en Arroyo Toro, distrito municipal rural de Bonao, en la provincia Monseñor Nouel, y allí mismo murió noventa y seis años después, en el distrito que lo crió. Sus dos hijos, Tommy y Aldo Polonia, también se hicieron músicos, aunque en la bachata y el merengue y no en el género del padre.

**Qué es la plena y qué hizo él con ella**

La plena salió de Ponce, en la costa sur de Puerto Rico: música de raíz africana levantada sobre la pandereta y cantada en versos lo bastante llanos como para que cualquiera los repitiera. Se le llamó el periódico cantado porque eso era lo que hacía: informaba. Accidentes, escándalos, el precio de las cosas, las indignidades diarias de la gente trabajadora — la plena llevaba la noticia a barrios para los que los periódicos de verdad no estaban escritos.

Ese instinto de crónica es lo que Polonia se llevó. No importó la plena como curiosidad ni la interpretó como rareza extranjera: la trasladó al habla, al humor y a las circunstancias dominicanas, y la apuntó hacia lo que ocurría a su alrededor. Títulos como Lo Que le Pasó a Juan o Adónde Llegará el Pobre son el periódico cantado funcionando exactamente como debía, en un segundo país.

**Cómo logró que sonara**

Ninguna disquera empujaba esta música y no había argumento comercial evidente para ella, así que Polonia alquiló espacio en la emisora La Voz del Trópico y puso sus propios discos. Así la plena dominicana llegó a oyentes de todo el país en lugar de quedarse como cosa de Bonao. Los temas sobrevivieron al arreglo: siguen sonando en la radio tradicional y en las plataformas digitales.

**Grabaciones**

- Sisua, Sisua (La Piedra de Amolar) — de los más conocidos de su repertorio  
- Lo Que le Pasó a Juan  
- Adónde Llegará el Pobre  
- Cosas Increíbles  
- La Minifalda  
- En Plena Dominicana — 1995  
- Plena Dominicana Vol. 2 — 1997

**Reconocimientos**

- Declarado Hijo Distinguido de Bonao mediante la Resolución 8-2018 del Concejo de Regidores  
- Conocido en sus últimos años como El Padre de la Plena Dominicana

**Legado**

Polonia murió la noche del 24 de noviembre de 2025, a los noventa y seis años. Lo que deja es poco común para un músico dominicano: no una obra dentro de una tradición ya existente, sino una tradición que antes de él no estaba aquí y ahora sí. La plena dominicana no tenía linaje dominicano que heredar — él construyó aquello que después dedicó la vida a practicar, y lo hizo alquilando horas de radio en vez de esperar que lo firmaran.$sql$,
    birth_place = 'Arroyo Toro, Bonao',
    genres = ARRAY['folklore', 'folklore-plena-dominicana']::text[],
    updated_at = now()
WHERE id = '3b6f60a1-2baa-4e2c-acec-452c5b026397';

COMMIT;
