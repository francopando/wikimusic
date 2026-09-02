import { revalidatePath, revalidateTag } from "next/cache";
import { routing } from "@/i18n/routing";
import { invalidateArtistPortfolioCache } from "@/lib/artistPortfolioCache";
import { PUBLIC_ARTIST_DIRECTORY_CACHE_TAG } from "@/lib/publicCatalogCache";

export function getArtistProfileRevalidationPaths(slug: string) {
  const normalizedSlug = slug.trim();
  const paths = new Set<string>();

  if (!normalizedSlug) return paths;

  paths.add(`/artists/${normalizedSlug}`);
  paths.add(`/en/artists/${normalizedSlug}`);
  paths.add(`/es/artists/${normalizedSlug}`);

  for (const locale of routing.locales) {
    paths.add(
      locale === routing.defaultLocale
        ? `/artists/${normalizedSlug}`
        : `/${locale}/artists/${normalizedSlug}`,
    );
  }

  return paths;
}

/**
 * Invalidates every artist profile and directory in one call.
 *
 * Both tags are shared across all artists — the portfolio cache is read by
 * every profile page, the directory cache by every listing — so clearing them
 * sweeps the whole set without naming a slug. That breadth is why a single
 * artist save already refreshes far more than the artist it touched.
 *
 * Exposed on its own for /api/revalidate, which needs exactly this after an
 * editorial pass that wrote straight to Postgres and so never reached any of
 * the admin mutation routes.
 */
export function revalidateAllArtistProfiles() {
  invalidateArtistPortfolioCache();
  revalidateTag(PUBLIC_ARTIST_DIRECTORY_CACHE_TAG, { expire: 0 });
}

export function revalidateArtistProfilePaths(slug: string) {
  revalidateAllArtistProfiles();

  for (const path of getArtistProfileRevalidationPaths(slug)) {
    revalidatePath(path, "page");
  }
}
