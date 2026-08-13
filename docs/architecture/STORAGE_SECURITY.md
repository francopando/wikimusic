# Supabase Storage security architecture

Last verified against production: 2026-08-06

## Security contract

```text
Known public image URL      allowed
Anonymous bucket listing    denied (zero object metadata returned)
Anonymous upload            denied
Anonymous update/upsert      denied
Anonymous delete            denied
Non-admin authenticated I/O denied
Authorized admin mutation   allowed only for canonical entity paths
Service maintenance         allowed only in server routes/scripts
```

Public buckets deliberately separate object delivery from metadata access. A URL under `/storage/v1/object/public/{bucket}/{known-path}` is available because the bucket is public. `SELECT` on `storage.objects` is not required for that delivery; it controls Storage API metadata access, including `.list()`. Browser upload with `upsert: true` does require admin-scoped `SELECT`, `INSERT`, and `UPDATE` policies.

## Production bucket inventory

| Bucket | Public | Purpose and naming | Public known-URL read | Browser upload | Anonymous/browser listing |
| --- | --- | --- | --- | --- | --- |
| `artists-images` | Yes | Published 300×300 WebP, `{artist UUID}.webp` | Yes | Active admin only | Anonymous receives no rows; active admins can see canonical existing-artist objects for upsert |
| `artists-images-original` | Yes | Legacy/source PNG originals, `{artist UUID}.png` | Yes if path is known | No | No rows for anonymous/authenticated clients |
| `contributors-images` | Yes | Contributor WebP, `{contributor UUID}.webp` | Yes | Active admin only | Anonymous receives no rows; active admins can see canonical existing-contributor objects for upsert |
| `cover-art` | Yes | Published `150px/{release UUID}.webp` and `300px/{release UUID}.webp` | Yes | No browser path | No rows for anonymous/authenticated clients |
| `cover-art-originals` | Yes | Source JPEG/PNG, `{release UUID}.{jpg,png}` | Yes if path is known | No | No rows for anonymous/authenticated clients |

Production has no `cover-art-recovery`, editorial, temporary, import, or archive bucket. Repository recovery code refers to `cover-art-recovery`, but its bucket assertion prevents writes to production cover buckets and the bucket is not present in production.

All five current buckets have `file_size_limit = NULL` and `allowed_mime_types = NULL`. These settings were not tightened during policy remediation because contributor/source workflows do not yet share one verified size/MIME contract.

## Policy incident and classification

Before migration `20260806020000_harden_storage_least_privilege.sql`, production had the following `storage.objects` policies. There were no `storage.buckets` policies.

| Policy | Command / role | Scope | Classification and disposition |
| --- | --- | --- | --- |
| `Public can read artist images` | SELECT / PUBLIC | Entire `artists-images` bucket | Overly broad; exact source of dashboard enumeration warning; removed |
| `Allow anon upload to artist images` | INSERT / anon | Entire artist bucket | Dangerous; allowed arbitrary anonymous object creation; removed |
| `Allow anon update to artist images` | UPDATE / anon | Entire artist bucket | Dangerous; allowed anonymous replacement when SELECT was available; removed |
| `Allow authenticated upload to artist images` | INSERT / authenticated | Entire artist bucket | Overly broad and duplicate; removed |
| `Allow authenticated update to artist images` | UPDATE / authenticated | Entire artist bucket | Overly broad and duplicate; removed |
| `Allow authenticated users to upload artist images` | INSERT / authenticated | Entire artist bucket | Overly broad and duplicate; removed |
| `Allow authenticated users to update artist images` | UPDATE / authenticated | Entire artist bucket | Overly broad and duplicate; removed |
| `Authenticated users can upload contributor images` | INSERT / authenticated | Entire contributor bucket | Overly broad; any signed-in user could write; removed |
| `Authenticated users can update contributor images` | UPDATE / authenticated | Entire contributor bucket | Overly broad; any signed-in user could replace; removed |
| `Admins can upload artist images` | INSERT / authenticated | Artist bucket plus active `admin_members` lookup | Required intent but path was unrestricted and membership lookup was hidden by `admin_members` RLS; replaced |
| `Admins can update artist images` | UPDATE / authenticated | Same | Required intent; replaced |
| `Admins can delete artist images` | DELETE / authenticated | Same | Browser does not currently delete, but retained narrowly for the admin object contract |
| `Admin Access` | ALL / service_role | All objects | Redundant because service role bypasses RLS; removed |
| `Sync Script Admin` | ALL / service_role | Artist bucket | Legacy/redundant because service role bypasses RLS; removed |

The warning was specifically caused by `Public can read artist images`: `.list()` with the anonymous key returned filenames from `artists-images`. Other buckets returned an empty metadata result because they had no applicable SELECT policy. Public bucket delivery and SELECT/list permission are independent.

## Current production policies

All current policies are on `storage.objects`, apply only to `authenticated`, and require both:

1. `public.is_active_storage_admin()` — a narrowly executable `SECURITY DEFINER` predicate that checks `admin_members.user_id = auth.uid()` and `status = 'active'` without exposing `admin_members` rows.
2. `public.is_valid_admin_storage_path(bucket_id, name)` — validates an existing artist/contributor entity and the canonical `{UUID}.webp` root path.

| Policy | Command | Bucket |
| --- | --- | --- |
| `Admins can read artist image objects` | SELECT | `artists-images` |
| `Admins can upload artist image objects` | INSERT | `artists-images` |
| `Admins can update artist image objects` | UPDATE | `artists-images` |
| `Admins can delete artist image objects` | DELETE | `artists-images` |
| `Admins can read contributor image objects` | SELECT | `contributors-images` |
| `Admins can upload contributor image objects` | INSERT | `contributors-images` |
| `Admins can update contributor image objects` | UPDATE | `contributors-images` |

There is intentionally no client policy for cover buckets, original buckets, contributor deletion, move, or copy. Service-role clients bypass RLS, so their safety must come from protected entry points and hardcoded/validated targets.

## Repository operation inventory

| Location | Operation | Bucket | Execution and authorization | Listing required |
| --- | --- | --- | --- | --- |
| `src/app/admin/artists/page.tsx` | Upload/upsert | `artists-images` | Authenticated browser inside proxy-protected admin UI; production RLS independently requires active admin and canonical existing artist path | Upsert needs scoped SELECT, not general enumeration |
| `src/app/admin/contributors/ContributorsAdminClient.tsx` | Upload/upsert | `contributors-images` | Same; client enforces WebP and RLS binds path to existing contributor | Upsert needs scoped SELECT |
| `src/app/api/admin/artists/route.ts` | Remove | `artists-images` | DELETE route requires admin role; server uses service role; artist ID is required, looked up first, and path is constructed as `{id}.webp` | No |
| `scripts/backfillArtistHasImage.ts` | List | `artists-images` | Local maintenance script; service role required | Yes, operational integrity only |
| `scripts/backfillReleaseHasCoverImage.ts` | List | `cover-art/150px` | Local maintenance script; service role required | Yes |
| `scripts/auditDatabaseHealth.ts` | Recursive list | configured cover bucket | Read-only maintenance script; now requires service role and records its safety mode | Yes |
| `scripts/uploadGeneratedArtistImage.ts` | Upload/upsert and list verification | `artists-images-original`, `artists-images` | Local maintenance script; now requires service role (anonymous-key fallback removed) | Yes, post-upload verification |
| `scripts/fetchMissingCoverArtRecovery.ts` | List, upload, download verify | `cover-art-recovery` only | Service role; explicit guard rejects `cover-art` and `cover-art-originals`; bucket is absent in production | Yes if a staging recovery bucket is created |
| `supabase/functions/copy-cover-art/index.ts` | List/copy | `cover-art` to `cover-art-originals` | Legacy Edge Function using service role | Yes; see remaining risks |

No public UI or public server-rendered page calls `.list()`, `.download()`, `createSignedUrl(s)`, `.move()`, or `.copy()`. Public pages construct known public URLs from database metadata and canonical path helpers.

## Mutation authorization flows

### Artist upload/replacement

```text
Admin browser session
→ proxy requires application admin access
→ client resizes/re-encodes exactly 300×300 WebP
→ Storage upload to selectedArtistId.webp
→ RLS requires authenticated active admin
→ RLS requires existing artist and exact canonical path
→ upsert uses admin-scoped SELECT + INSERT/UPDATE
→ protected /api/admin/artist-image updates has_image/image_updated_at
→ public paths are revalidated
```

### Contributor upload/replacement

```text
Admin browser session
→ proxy requires application admin access
→ UI accepts WebP only
→ Storage upload to selectedContributorId.webp
→ RLS requires authenticated active admin
→ RLS requires existing contributor and exact canonical path
→ upsert uses admin-scoped SELECT + INSERT/UPDATE
→ browser cache key is refreshed
```

### Artist deletion

```text
DELETE /api/admin/artists
→ requireAdminApiRole('admin')
→ validate artistId and load the artist
→ block deletion when biography references exist
→ service-role Storage remove of exactly {artistId}.webp
→ database deletion and path revalidation
```

Anonymous callers and authenticated non-admins have no effective object policies. The service-role key is read only from server/script environment variables; it is not exposed through a `NEXT_PUBLIC_` variable or browser bundle.

## Production verification record

After applying the migration:

- Anonymous `.list('', {limit: 5})` returned zero filenames for all five buckets.
- Anonymous insert into a unique artist path failed with `new row violates row-level security policy`.
- Anonymous upsert failed with the same RLS error.
- Anonymous remove returned no API error (Storage treats a non-visible/nonexistent target idempotently), and an authorized follow-up proved no object was created or removed.
- A random authenticated non-admin saw zero managed artist/contributor objects and INSERT was rejected in a forced-rollback RLS test.
- An active admin could SELECT canonical objects, INSERT/UPDATE a canonical missing artist path, and UPDATE a canonical contributor path in a forced-rollback transaction.
- Service-role removal was verified through cleanup of the controlled pre-migration audit object. The application deletion route additionally enforces admin role and canonical path construction.
- Known public URLs returned HTTP 206 image bytes for all five buckets without a signed URL.
- Production pages returned 200 with public Storage references for English and Spanish home, artist, birthday, canonical genre, song, release detail, release grid, and search routes.
- SQL was first executed in a forced-rollback transaction; helper predicates and the final policy set were verified before production application.

## Bucket configuration and deferred hardening

- Keep published buckets public while the product intentionally uses stable public URLs.
- Reassess whether `artists-images-original` and `cover-art-originals` need to remain public. They are not referenced by public application code, but changing visibility requires reviewing offline/source workflows first.
- Add bucket MIME and maximum-size restrictions only after contributor and original upload contracts are standardized and tested.
- Prefer protected server routes for any new Storage mutation. If browser upload remains justified, require an active-admin predicate plus bucket, entity, extension, and path validation.
- Never add public/anon SELECT to a public bucket merely to make known public URLs load.
- Never restore anonymous INSERT/UPDATE/DELETE.

## Verification checklist

1. Query `storage.buckets` and `pg_policies`; do not infer production state from migrations.
2. Confirm anonymous list returns no filenames for every bucket.
3. Fetch a known public object URL without Authorization or a signature.
4. Confirm anonymous insert/upsert cannot create an audit object and verify absence with service role.
5. Test active-admin and non-admin predicates with rollback-only SQL or disposable test identities.
6. Verify the browser path exactly matches an existing entity UUID plus `.webp`.
7. Exercise artist/contributor replacement and artist deletion after any auth, policy, or Storage SDK change.
8. Record cleanup anomalies; never delete them automatically.

