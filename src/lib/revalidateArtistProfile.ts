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

export function revalidateArtistProfilePaths(slug: string) {
  invalidateArtistPortfolioCache();
  revalidateTag(PUBLIC_ARTIST_DIRECTORY_CACHE_TAG, { expire: 0 });

  for (const path of getArtistProfileRevalidationPaths(slug)) {
    revalidatePath(path, "page");
  }
}
