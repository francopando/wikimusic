# Mangulina image delivery architecture

Last audited: 2026-08-06

## Scope and evidence boundary

This document inventories every raster and `next/image` renderer under `src/` and traces the stored variants used by those renderers. It establishes what the repository can prove; it does not attribute a percentage of historical Vercel transformations to a component. These cover-art paths are among the largest avoidable transformation sources identified during the repository audit. Determining their exact contribution requires Vercel Image Optimization analytics or a transformation export.

Vercel keys optimized images by source URL, width, quality, and negotiated format. A browser requests one candidate from a generated `srcset`; merely advertising a candidate does not itself create a transformation.

## Storage contracts

| Asset class | Repository evidence | Storage contract |
| --- | --- | --- |
| Artist portrait | `src/utils/resizeArtistImage.ts` | Uploads are resized to exactly 300×300 and encoded as WebP at quality 0.9. |
| Release cover | `src/lib/releaseCover.ts` | Public URLs select an explicit 150px or 300px square WebP variant. |
| Contributor portrait | `src/components/atoms/ContributorImage.tsx` | A WebP object is expected, but this repository does not enforce intrinsic dimensions. |
| YouTube thumbnail/avatar | `src/components/organisms/ArtistInterviewsCarousel.tsx` | Third-party dimensions and encoding are controlled by YouTube/Google. |

Artist portrait URLs use `image_updated_at` as a version query. The normal artist-profile save payload does not rewrite that field; the dedicated image route changes it when the stored image changes. The query therefore invalidates intentionally rather than on every artist edit.

## Rendering inventory

“Optimized” means that the browser URL passes through Next/Vercel `/_next/image`.

| Image class and surfaces | Source | Rendering method | Optimized | Display evidence and decision |
| --- | --- | --- | --- | --- |
| Artist portrait: artist cards, directory, genre carousel, birthday rows, featured artist, song artist preview, public artist profile | Supabase 300×300 WebP | Shared `ArtistImage`: `<Image fill unoptimized>` | No | Standardized local pipeline. Direct delivery avoids recompressing a fixed source. CSS displays range from 52px birthday rows, 96/112px song previews, 112/128/144px carousels, fluid directory cards, 224/256px featured art, and a fluid public profile image that becomes 300px at `lg` and 320px at `2xl`. Fluid mobile surfaces can exceed 300 CSS px; this is an explicit quality ceiling of the current storage contract, not a claim that every display is ≤300px. |
| Admin artist preview | Supabase 300×300 WebP or a local blob preview | Native `<img>` for blob; `<Image fill unoptimized>` for stored image | No | Fluid square admin column; `sizes="320px"` is descriptive only because the stored-image path is unoptimized. It previews the exact standardized upload. |
| Song hero cover | Supabase 300×300 WebP selected in the song page | `<Image fill unoptimized priority>` | No | `w-full` below 640px, `w-56` (224px) from 640px, and `w-64` (256px) from 1024px. With `PageSection` horizontal margins and hero padding, the phone image is approximately `viewport − 72px`, reaching about 567px immediately below the 640px breakpoint. It therefore can exceed 300 CSS px. Serving it through Vercel could upscale the same 300 source but cannot recreate detail; direct delivery avoids paid upscaling and another lossy encoding. High-DPI screens expose the 300px source ceiling sooner. A future quality improvement requires storing a larger source/variant, not enabling transformation of the 300px object. |
| Artist discography cover | Supabase 150×150 WebP selected in `artistApi` | `<Image fill unoptimized>` | No | The invariant container is `w-11 h-11`, exactly 44×44 CSS px at every breakpoint. The 150px source covers 1×, 2× (88px), and 3× (132px) displays without upscaling. |
| Release grids/cards | Supabase 300×300 WebP | Shared native `ReleaseCoverImage` | No | Square card containers; grids use 2/3/4/6 columns. Release feature/detail art is capped at 280px. The source is already the application’s display-sized WebP and the native wrapper supplies loading priority and an error fallback. |
| Song cards, related/most-searched songs | Supabase 150px cover WebP | Native `<img>` | No | Song cards are 112/128/144px. Related surfaces use the 150px variant and retain a native fallback. |
| Archive song rows | Supabase 150px cover WebP | Native `<img>` | No | Exactly 32px on mobile and 40px from `md`. |
| Search results | Supabase 150px cover WebP | Native `<img>` | No | Exactly 64×64 CSS px. |
| Contributor portraits | Supabase WebP | Shared native `ContributorImage` | No | 56px and 128px in admin; fluid public cards. Native rendering currently exists to support a reliable missing-object fallback. Because intrinsic dimensions are not standardized, this is an audited current behavior rather than a blanket assertion that optimization could never help. Standardizing contributor uploads should precede any future delivery change. |
| Interview thumbnails | YouTube thumbnail URL | Native `<img loading="lazy">` | No | Fluid 16:9 cards with widths capped at 256px on phones, 288px at `sm`, and 320px at `lg`. YouTube supplies purpose-built thumbnail assets; the native path avoids creating one Vercel transformation family per external video. |
| YouTube channel avatar | Google/YouTube remote URL | `<Image width={24} height={24} sizes="24px">` | Yes | This is the only optimized remote raster path after the cover changes. The upstream dimensions and encoding are uncontrolled, so normalization and caching at a tiny rendered size are useful. |
| Header/footer brand mark | Local `/icon.svg` | `<Image>` with intrinsic width/height | Effectively no | Next automatically serves SVG without raster optimization. It displays at 40px in the banner and 56/90px in the footer. |

No “featured image” exception currently exists: `FeaturedArtistImage` delegates to the unoptimized, standardized `ArtistImage` component.

## Song hero and discography dimension proof

### Song hero

The image frame in `SongHero.tsx` is:

```text
base (<640px): width: 100%
sm (≥640px):   width: 14rem = 224px
lg (≥1024px):  width: 16rem = 256px
```

On phones the enclosing `PageSection` contributes 16px on each side and the hero contributes 20px padding on each side, so the available image width is approximately `100vw − 72px`. Examples are 288px at a 360px viewport, 318px at 390px, 358px at 430px, and approximately 567px just below 640px. Device pixel ratio does not change the CSS box: it changes the ideal intrinsic requirement. At 256 CSS px, 2× would ideally contain 512 source pixels; at 390px viewport the 318 CSS px box would ideally contain 636 pixels at 2×. The stored object contains only 300 pixels, so an optimizer can only interpolate it.

The existing `sizes="(max-width: 640px) calc(100vw - 56px), 256px"` is not used to select a `srcset` while `unoptimized` is set. If a larger stored variant is introduced later and optimization is re-enabled, this expression must first be corrected to match the actual nested margins/padding and the 224px tablet breakpoint.

### Artist discography

`w-11 h-11` is 44×44 CSS px with no responsive override. Required intrinsic widths are 44px at 1×, 88px at 2×, and 132px at 3×. The selected 150×150 WebP is sufficient through 3× and is never displayed beyond 44 CSS px by this component.

## Width inventory and Next.js configuration decision

### Directly served raster display widths

The deterministic fixed/capped widths found in code are:

```text
24, 32, 40, 44, 52, 56, 64, 90, 96, 112, 128, 144,
150 (source variant), 224, 256, 280, 300, 320 CSS pixels
```

Several grid/profile surfaces are fluid, so there is no honest finite application-wide list of CSS widths. Their relevant caps and source variants are documented in the inventory above.

### Widths that can reach `/_next/image`

After the cover changes, only the 24px Google/YouTube avatar is an optimized remote raster. With the current default Next.js arrays and `sizes="24px"`, its generated `srcset` advertises the configured candidates:

```text
32, 48, 64, 96, 128, 256, 384,
640, 750, 828, 1080, 1200, 1920, 2048, 3840
```

The browser requests one candidate, not all of them. A 24px slot normally selects 32px at 1× and 48px at 2×; fractional and 3× densities can select 64px or 96px. Historical “actual requested” widths require Vercel request analytics and cannot be proven from source code alone.

Narrowing global `deviceSizes`/`imageSizes` would therefore provide little transformation benefit today: it would mainly shorten the one avatar `srcset`, while each client still requests one small candidate. It would also silently constrain future responsive images. The project retains Next defaults until telemetry demonstrates a material benefit or a deliberate responsive-image class is introduced.

## Official strategy

- **Artist portraits:** normalize to 300×300 WebP on upload; serve directly; version only when the object changes. Treat fluid displays above 300 CSS px as known source-quality debt.
- **Release/song covers:** generate 150px and 300px WebP variants; select the smallest contractually suitable stored variant; serve directly. Never pay to upscale a smaller stored variant.
- **Discography covers:** use the 150px variant in the invariant 44px frame; serve directly.
- **Contributor portraits:** continue the native fallback path for now; standardize upload dimensions before reconsidering delivery.
- **YouTube thumbnails:** use provider-generated thumbnails directly and lazily.
- **Uncontrolled third-party micro-images:** retain Next.js optimization when source dimensions/encoding are unknown and normalization provides clear value, as with channel avatars.
- **Future large responsive media:** use `next/image` optimization only when Mangulina stores or receives an original larger than the rendered targets; provide an accurate `sizes` contract and validate requested widths from production telemetry.
- **Configuration:** do not globally disable optimization and do not narrow global width arrays without measured evidence.

## Verification checklist for future changes

1. Identify the stored intrinsic dimensions and encoding.
2. Calculate CSS width at every breakpoint and the 1×/2× intrinsic requirement.
3. Decide whether transformation downsizes a larger source or merely upscales/re-encodes a small one.
4. For optimized `fill` images, verify `sizes` against actual parent width, including outer margins and padding.
5. Confirm the source URL is stable and only versioned when content changes.
6. Use Vercel Image Optimization analytics to measure source URL, width, format, HIT/MISS/STALE, and transformation count before changing global configuration.
