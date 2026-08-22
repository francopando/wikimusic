export const PUBLIC_CATALOG_REVALIDATE_SECONDS = 600;

/**
 * Artist directory data lives as long as the directory HTML above it.
 *
 * Next.js resolves a route's revalidate as the minimum across everything it
 * reads, so leaving this at PUBLIC_CATALOG_REVALIDATE_SECONDS would cap the
 * canonical directory pages at 10 minutes. Artist mutations already invalidate
 * PUBLIC_ARTIST_DIRECTORY_CACHE_TAG through revalidateArtistProfilePaths, so a
 * 24h fallback is a safety net rather than the freshness mechanism.
 */
export const PUBLIC_ARTIST_DIRECTORY_REVALIDATE_SECONDS = 86400;

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
