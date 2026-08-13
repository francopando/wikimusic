# Mangulina Architecture

> **Purpose**
>
> This directory contains the official technical architecture of Mangulina.
>
> These documents describe the long-term design decisions behind the platform and should be considered the authoritative reference before implementing major changes.
>
> Mangulina prioritizes long-term maintainability, editorial integrity, security, performance, and cultural preservation over short-term implementation convenience.
>
> When modifying an existing subsystem:
>
> - Read the corresponding architecture document first.
> - Prefer extending the existing design rather than introducing parallel implementations.
> - Update the documentation whenever architectural decisions change.

## System architecture

### Editorial

| Document | Purpose |
| --- | --- |
| [`EDITORIAL_ENGINE.md`](EDITORIAL_ENGINE.md) | Structured biography engine, document lifecycle, artist references, publication workflow, and integrity rules. |
| [`EDITORIAL_GOVERNANCE.md`](EDITORIAL_GOVERNANCE.md) | Editorial authority, assertions, evidence, decisions, audit history, corrections, and publication policy. |
| `EDITORIAL_INTEGRITY.md` *(future)* | Editorial validation, consistency checks, and publication verification. |

### Images and media

| Document | Purpose |
| --- | --- |
| [`IMAGE_DELIVERY_ARCHITECTURE.md`](IMAGE_DELIVERY_ARCHITECTURE.md) | Image pipeline, variants, optimization strategy, responsive delivery, and cache invalidation. |
| [`STORAGE_SECURITY.md`](STORAGE_SECURITY.md) | Storage buckets, RLS, upload model, authorization, public delivery, and least-privilege security. |

### Search

| Document | Purpose |
| --- | --- |
| `SEARCH_ARCHITECTURE.md` *(future)* | Search normalization, indexing, autocomplete, ranking, keyboard navigation, and multilingual behavior. |

### Artists

| Document | Purpose |
| --- | --- |
| `ARTIST_MODEL.md` *(future)* | Artist schema, occupations, primary roles, relationships, groups, aliases, and lifecycle. |

### Releases and recordings

| Document | Purpose |
| --- | --- |
| `DISCOGRAPHY_ARCHITECTURE.md` *(future)* | Releases, recordings, tracks, editions, variants, and release grouping. |
| [`RECORDING_VERSION_IDENTITY.md`](RECORDING_VERSION_IDENTITY.md) | Implemented Recording version identity model, boundaries, and display policy. |
| [`RECORDING_VERSION_IDENTITY_IMPLEMENTATION.md`](RECORDING_VERSION_IDENTITY_IMPLEMENTATION.md) | Production migration, governance, validation, backup, and rollback evidence. |
| [`JLG_RECORDING_VERSION_POPULATION.md`](JLG_RECORDING_VERSION_POPULATION.md) | Governed production population of the approved 53 JLG profiles and eight edit relationships. |

### Works and credits

| Document | Purpose |
| --- | --- |
| [`MUSIC_ONTOLOGY.md`](MUSIC_ONTOLOGY.md) | Authoritative Work, Recording, release-appearance, ISRC, and credit semantics. |
| [`CREDIT_ROLE_VOCABULARY.md`](CREDIT_ROLE_VOCABULARY.md) | Canonical contribution roles, aliases, families, localized labels, and scope policy. |
| `WORKS_AND_CREDITS.md` *(future)* | Creative Works, recording credits, international works, contributor model, and portfolio generation. |

### Genres

| Document | Purpose |
| --- | --- |
| `GENRE_ARCHITECTURE.md` *(future)* | Genre taxonomy, subgenres, discovery pages, filtering, and hierarchy. |

### Analytics

| Document | Purpose |
| --- | --- |
| `ANALYTICS_ARCHITECTURE.md` *(future)* | Event tracking, aggregation, deduplication, dashboards, and reporting. |

### Security

| Document | Purpose |
| --- | --- |
| `SECURITY_ARCHITECTURE.md` *(future)* | Authentication, authorization, roles, permissions, audit logging, and API protection. |

### Internationalization

| Document | Purpose |
| --- | --- |
| `I18N_ARCHITECTURE.md` *(future)* | English/Spanish architecture, translation workflow, locale routing, and SEO. |

### SEO

| Document | Purpose |
| --- | --- |
| `SEO_ARCHITECTURE.md` *(future)* | Metadata, JSON-LD, canonical URLs, Open Graph, sitemap, and indexing strategy. |

### Performance

| Document | Purpose |
| --- | --- |
| `PERFORMANCE_ARCHITECTURE.md` *(future)* | Rendering strategy, caching, lazy loading, image performance, and optimization philosophy. |

### Administration

| Document | Purpose |
| --- | --- |
| `ADMIN_ARCHITECTURE.md` *(future)* | Admin portal structure, permissions, editing workflow, dashboards, and moderation. |

## Core design principles

### 1. Editorial integrity

Data quality is always preferred over quantity. Editors curate information manually whenever necessary.

### 2. Long-term maintainability

Production-grade solutions are preferred over temporary implementations. Architectural consistency is more valuable than isolated optimizations.

### 3. Principle of least privilege

Every permission must be explicitly justified. Anonymous users receive the minimum access required. Administrative capabilities are narrowly scoped.

### 4. Predictable data models

Canonical schemas are preferred over implicit behavior. Relationships should exist in one place and be derived elsewhere.

### 5. Stable URLs

Public URLs should remain stable whenever possible. Cache invalidation should occur only when underlying content changes.

### 6. Performance through design

Optimize the architecture before optimizing individual components. Avoid unnecessary processing. Prefer deterministic pipelines.

### 7. Documentation as architecture

Architecture documentation is part of the system. When a subsystem changes, its corresponding architecture document should be reviewed and updated.

Documentation should explain:

- why a decision exists;
- what constraints it solves;
- acceptable future extensions;
- known limitations;
- deferred improvements.

## Status

| Architecture | Status |
| --- | --- |
| Editorial Engine | Complete |
| Editorial Governance | Phase 1.9 editorial pilot ready |
| Music Ontology | Complete |
| Image Delivery | Complete |
| Storage Security | Complete |
| Search | Planned |
| Works and Credits | Planned |
| Analytics | Planned |
| Security | Planned |
| SEO | Planned |
| Performance | Planned |
| Administration | Planned |

Phase 2A adds the External Contributor foundation: governed internal identities for non-Dominican participants, exclusive Artist-or-External credit foreign keys, private administration, secure images, and a minimal public Song Credits projection. It does not populate Works, migrate credits, or add External Contributors to public Artist directories.

## Future architectural reviews

Every major subsystem should periodically receive a formal architectural review covering:

- correctness;
- scalability;
- security;
- performance;
- maintainability;
- operational cost;
- technical debt;
- documentation completeness.

Architecture reviews should be completed before introducing major new functionality whenever practical.
