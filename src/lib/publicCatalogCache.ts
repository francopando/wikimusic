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
 * 30-day fallback TTL, but any shorter revalidate on a cache they read silently
 * becomes the route's real TTL. The artist works portfolio hardcoded 600, which
 * is exactly the kind of cap that quietly defeats the export.
 *
 * Verified against a production build: Song and Release profiles now serve
 * s-maxage=2592000. The Artist profile still serves 600 from a source that has
 * not been identified — raising this removed one cap but not that one. See the
 * note on the artist route before assuming the declared value is in effect.
 *
 * Admin mutations invalidate these caches on demand (ARTIST_PORTFOLIO_CACHE_TAG
 * via invalidateArtistPortfolioCache, plus the per-path helpers in
 * revalidateCatalogProfiles.ts), so this is a safety net, never the freshness
 * mechanism. Keep it aligned with the routes' `revalidate` exports.
 */
export const PUBLIC_PROFILE_REVALIDATE_SECONDS = 2592000;
