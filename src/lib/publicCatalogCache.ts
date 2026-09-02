export const PUBLIC_CATALOG_REVALIDATE_SECONDS = 600;

export const PUBLIC_ARTIST_DIRECTORY_CACHE_TAG = "public-artist-directories";
export const PUBLIC_GENRE_CACHE_TAG = "public-genres";

/**
 * Genre data lives longer than the rest of the public catalog.
 *
 * Next.js resolves a route's revalidate as the minimum across everything it
 * reads, so leaving genre data at PUBLIC_CATALOG_REVALIDATE_SECONDS capped the
 * genre page's Full Route Cache at 10 minutes and undercut Phase 3A. These
 * caches are read only by the genre profile, and admin genre, subgenre and
 * genre-media mutations now invalidate PUBLIC_GENRE_CACHE_TAG on demand, so a
 * 24h fallback is a safety net rather than the freshness mechanism.
 */
export const PUBLIC_GENRE_REVALIDATE_SECONDS = 86400;

/**
 * Fallback freshness for data read by the Artist, Song and Release profiles.
 *
 * Same minimum rule as above, and the same trap: these three routes declare a
 * 7-day fallback TTL, but any shorter revalidate on a cache they read silently
 * becomes the route's real TTL. The artist works portfolio hardcoded 600, which
 * is exactly the kind of cap that quietly defeats the export.
 *
 * Verified against a production build: all three profile routes serve this
 * value on a fresh cache miss, in both locales. That verification matters —
 * at 2592000 the artist route served 600 instead, for reasons bisection never
 * established. See the note on that route before changing this.
 *
 * A week, not a month: freshness comes from the admin mutation routes and from
 * /api/revalidate after direct database work, so this only matters when both
 * are missed. Bounding that to a week keeps an unrevalidated correction from
 * sitting stale for a whole month, at a cost of roughly 41,700 URLs / 7 days —
 * about 179K ISR writes a month, which needs headroom beyond the Hobby tier.
 *
 * Admin mutations invalidate these caches on demand (ARTIST_PORTFOLIO_CACHE_TAG
 * via invalidateArtistPortfolioCache, plus the per-path helpers in
 * revalidateCatalogProfiles.ts). Keep this aligned with the routes' exports.
 */
export const PUBLIC_PROFILE_REVALIDATE_SECONDS = 604800;
