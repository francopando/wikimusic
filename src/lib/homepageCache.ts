import { revalidateTag } from "next/cache";

export const HOMEPAGE_DATA_CACHE_TAG = "homepage-data";
export const HOMEPAGE_ARCHIVE_CACHE_TAG = "homepage-archive-counts";
export const HOMEPAGE_CACHE_SECONDS = 600;

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
