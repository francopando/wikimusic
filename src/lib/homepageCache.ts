import { revalidateTag } from "next/cache";

export const HOMEPAGE_DATA_CACHE_TAG = "homepage-data";
export const HOMEPAGE_ARCHIVE_CACHE_TAG = "homepage-archive-counts";
/**
 * Freshness for the homepage and archive data caches.
 *
 * This value also caps the enclosing routes' ISR TTL: Next takes the minimum
 * of a route's `revalidate` export and every data cache read during its
 * render, so while this sat at 600 the homepage and /archive regenerated every
 * 10 minutes no matter what those routes declared. Both are invalidated on
 * demand through the tags below whenever an admin mutation lands, so the clock
 * only bounds drift from changes made outside the admin routes.
 */
export const HOMEPAGE_CACHE_SECONDS = 3600;

export function revalidateHomepageData() {
  revalidateTag(HOMEPAGE_DATA_CACHE_TAG, { expire: 0 });
}

export function revalidateHomepageArchiveCounts() {
  revalidateTag(HOMEPAGE_ARCHIVE_CACHE_TAG, { expire: 0 });
}

export function revalidateAllHomepageData() {
  revalidateHomepageData();
  revalidateHomepageArchiveCounts();
}
