import { revalidatePath, revalidateTag } from "next/cache";

import { routing } from "@/i18n/routing";
import { PUBLIC_GENRE_CACHE_TAG } from "@/lib/publicCatalogCache";

/**
 * Targeted invalidation for public genre profiles.
 *
 * Phase 3A put genre pages into the Full Route Cache behind a 24h fallback
 * TTL. Before that the route was `force-dynamic`, so nothing ever needed
 * invalidating and none existed — PUBLIC_GENRE_CACHE_TAG was applied to the
 * four genre data caches but never revalidated anywhere. A long-lived HTML
 * cache makes that gap visible, so admin genre mutations now call this.
 *
 * The tag is the primary mechanism, and it is genre-scoped rather than broad:
 * it covers exactly the four genre caches. Invalidating across genres is
 * correct rather than lazy here, because every genre page renders the shared
 * genre selector built from getTopGenreOptions(), so renaming one genre
 * really does change all ~18 pages. `slug`, when the caller knows it, adds
 * direct path invalidation for the genre that changed.
 */
export function getGenreProfileRevalidationPaths(slug: string) {
  const normalized = slug.trim();
  const paths = new Set<string>();
  if (!normalized) return paths;

  paths.add(`/genres/${normalized}`);
  for (const locale of routing.locales) {
    paths.add(
      locale === routing.defaultLocale
        ? `/genres/${normalized}`
        : `/${locale}/genres/${normalized}`,
    );
  }
  return paths;
}

export function revalidateGenreContent(slug?: string | null) {
  revalidateTag(PUBLIC_GENRE_CACHE_TAG, { expire: 0 });

  if (slug) {
    for (const path of getGenreProfileRevalidationPaths(slug)) {
      revalidatePath(path, "page");
    }
  }
}
