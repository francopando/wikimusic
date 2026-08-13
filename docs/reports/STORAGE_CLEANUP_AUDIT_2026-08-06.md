# Supabase Storage cleanup audit — 2026-08-06

This is an authorized, read-only production inventory. No bucket objects were deleted or rewritten.

## Aggregate contents

| Bucket | Objects | Approximate bytes | MIME summary | Layout |
| --- | ---: | ---: | --- | --- |
| `artists-images` | 497 | 11,625,381 | 495 WebP, 1 PNG, 1 octet-stream placeholder | Root |
| `artists-images-original` | 21 | 81,650,342 | 21 PNG | Root |
| `contributors-images` | 3 | 23,358 | 3 WebP | Root |
| `cover-art` | 6,200 | 124,088,034 | 6,200 WebP | 3,100 under `150px`, 3,100 under `300px` |
| `cover-art-originals` | 3,100 | 1,892,245,832 | 3,093 JPEG, 7 PNG | Root |

## Findings

### Artist images

- 493 canonical WebPs match an existing artist and the `{artist UUID}.webp` contract.
- Database flags are consistent: no `has_image=true` artist is missing its canonical object, and no matched canonical object belongs to an artist flagged without an image.
- Two orphan WebPs do not match a current artist row:
  - `66670232-037f-4ef0-a8ac-ddd0b97bc32c.webp`
  - `dbd1f97b-e930-4ac9-a4cd-fed8367e1ac7.webp`
- Two noncanonical objects exist:
  - `.emptyFolderPlaceholder` — zero bytes, `application/octet-stream`
  - `05bcf026-2c83-4944-bc0e-6e376235d153.png` — 189,643-byte PNG

The new browser policy intentionally hides and prevents replacement of these four anomalous objects. Do not delete them until provenance and rollback value are reviewed.

### Contributor images

- All three contributor rows have one canonical WebP.
- No contributor object is orphaned.

### Cover art

- Every 150px object has a corresponding 300px object and vice versa.
- `cover-art-originals` and current 300px variants form a complete 3,100-ID pair set.
- Twenty-six release IDs have both generated variants but no current `releases` row. These are orphan candidates, not approved deletions.
- No release flagged `has_cover_image=true` is missing its 150px variant.

### Temporary and malformed data

- No object name matched the audited `tmp`, `temp`, `backup`, `copy`, or `security-audit` patterns.
- The only zero-byte object is the artist bucket placeholder noted above.
- No duplicate full object paths are possible under the Storage uniqueness contract; variant duplication was assessed by release ID and size prefix instead.

## Cleanup recommendation

Create a separately reviewed cleanup migration/script only after confirming that the two artist IDs and 26 release IDs are not needed for restore, import reconciliation, or historical provenance. Any deletion should produce a manifest containing bucket, path, size, checksum/version metadata, and reason, followed by database-reference verification. This audit did not authorize deletion.
