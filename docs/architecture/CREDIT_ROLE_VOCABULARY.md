# Mangulina Canonical Credit-Role Vocabulary

Status: Authoritative Phase 1.8 editorial vocabulary

Canonical role identity, localized display labels, source wording, aliases, and semantic scope are separate. `credited_as` always preserves the historical artist billing; legacy `role` text remains untouched during the additive `role_id` transition.

## Canonical roles

| Code | English | Spanish | Family | Normal scope | Permitted scopes | Definition / notes |
|---|---|---|---|---|---|---|
| `composer` | Composer | Compositor | Composition | Work | Work | Creates the musical composition. |
| `songwriter` | Songwriter | Autor de canciones | Composition | Work | Work | Creates music and/or lyrics as a songwriting contribution. |
| `lyricist` | Lyricist | Letrista | Composition | Work | Work | Writes lyrics. |
| `arranger` | Arranger | Arreglista | Arrangement | Recording | Work, Recording | Evidence determines whether the arrangement belongs to the composition or recorded realization. |
| `lead_performer` | Lead performer | Intérprete principal | Performance | Recording | Recording | Principal performance. |
| `featured_performer` | Featured performer | Intérprete invitado | Performance | Recording | Recording | Explicitly featured performance. |
| `performer` | Performer | Intérprete | Performance | Recording | Recording | General performance contribution. |
| `instrumentalist` | Instrumentalist | Instrumentista | Performance | Recording | Recording | Instrumental performance without a canonical instrument-specific role. |
| `pianist` | Pianist | Pianista | Performance | Recording | Recording | Piano performance. |
| `producer` | Producer | Productor | Production | Recording | Recording, Release | Creative/technical production; evidence determines scope. |
| `co_producer` | Co-producer | Coproductor | Production | Recording | Recording | Explicit shared production billing. |
| `executive_producer` | Executive producer | Productor ejecutivo | Production | Release | Release | Executive oversight or financing. |
| `beat_programmer` | Beat programmer | Programador de ritmos | Production | Recording | Recording | Programs rhythmic/beat elements. |
| `recording_engineer` | Recording engineer | Ingeniero de grabación | Engineering | Recording | Recording | Engineering responsibility for recording. |
| `mixing_engineer` | Mixing engineer | Ingeniero de mezcla | Engineering | Recording | Recording | Engineering responsibility for mixing. |
| `mastering_engineer` | Mastering engineer | Ingeniero de masterización | Engineering | Recording | Recording | Engineering responsibility for mastering. |
| `conductor` | Conductor | Director de orquesta | Direction | Recording | Recording | Conducts performers. |
| `musical_director` | Musical director | Director musical | Direction | Recording | Recording, Release | Musical direction; evidence determines scope. |

Families provide stable grouping for editorial filtering and analytics without determining scope. Allowed scope is enforced relationally through `credit_role_scopes`; unusual but permitted roles can trigger an editorial warning rather than a false prohibition.

## Exact production role audit

The live re-audit found **16 distinct exact spellings**, not the 17 previously reported in Phase 1.5. No row was rewritten.

| Exact value | Current table(s) | Canonical code | Mapping | Scope observation |
|---|---|---|---|---|
| `arranger` | credited_work_credits | `arranger` | Deterministic | Archival scope remains research material |
| `Arranger` | credited_work_credits | `arranger` | Deterministic | Same identity; source casing preserved |
| `Beat Programmer` | credited_work_credits | `beat_programmer` | Deterministic | Archival row likely Recording-scoped; review before migration |
| `Co-Producer` | credited_work_credits | `co_producer` | Deterministic | Archival row likely Recording-scoped; review before migration |
| `composer` | both | `composer` | Deterministic | Recording placement requires scope review |
| `Composer` | credited_work_credits | `composer` | Deterministic | Work scope is normal |
| `Executive Producer` | credited_work_credits | `executive_producer` | Deterministic | Normally Release-scoped; review required |
| `lead_performer` | recording_credits | `lead_performer` | Deterministic | Normal Recording scope |
| `Lyricist` | credited_work_credits | `lyricist` | Deterministic | Normal Work scope |
| `Mastering Engineer` | credited_work_credits | `mastering_engineer` | Deterministic | Likely Recording scope; review required |
| `Mix Engineer` | credited_work_credits | `mixing_engineer` | Deterministic | Likely Recording scope; review required |
| `performer` | recording_credits | `performer` | Deterministic | Normal Recording scope |
| `Performer` | credited_work_credits | `performer` | Deterministic | Recording scope; archival context requires link review |
| `piano` | recording_credits | `pianist` | Deterministic | Instrument-specific historical label preserved |
| `producer` | recording_credits | `producer` | Deterministic | Normal Recording scope |
| `Producer` | credited_work_credits | `producer` | Deterministic | Recording/Release scope requires review |

No spelling is lexically ambiguous or unmapped. “Needs editorial review” applies to the target scope of several archival/Recording placements, not to their role identity. Alias matching is case-insensitive, so case variants share one alias identity while their original text remains in legacy rows.

## Transition policy

`work_credits`, `recording_credits`, and `credited_work_credits` now have nullable `role_id`. Existing role text and `credited_as` were not changed or backfilled. Governed new Work credits require `role_id` and copy the canonical machine code into the compatibility `role` field. A partial uniqueness boundary on `(work_id, artist_id, role_id)` prevents duplicate canonical semantic credits while allowing multiple artists in the same role.

`credited_works` and `credited_work_credits` are archival portfolio evidence, not authoritative ontology. A credited-work row may reference one authoritative Work, one authoritative Recording, or neither while unresolved; it cannot reference both. Linking is deferred and must preserve its title, performer, release, year, and exact role text.
