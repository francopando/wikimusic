import ArtistDirectory from "@/components/artists/ArtistDirectory";
import { getArtistDirectoryInitialData } from "@/lib/artistDirectoryData";
import { getArtistGenreOptions } from "@/lib/artistGenreOptions";
import { createArtistDirectoryMetadata } from "@/lib/artist-role-pages";

// Canonical directory HTML is cacheable: the shell no longer depends on
// searchParams, so filtered/paginated views are handled client-side and cannot
// multiply Full Route Cache entries. Artist mutations invalidate this through
// PUBLIC_ARTIST_DIRECTORY_CACHE_TAG, so the TTL is a fallback.
export const revalidate = 86400;


export async function generateMetadata({
  params,
}: {
  params: Promise<{ locale: string }>;
}) {
  const { locale } = await params;
  return createArtistDirectoryMetadata("christian", "/christian", locale);
}

export default async function ChristianArtistsPage() {
  const filteredGenreOptions = await getArtistGenreOptions({ context: "christian" });
  const initialData = await getArtistDirectoryInitialData({
    fixedContext: "christian",
    filteredGenreOptions,
  });

  return (
    <ArtistDirectory
      path="/christian"
      i18nKey="christian"
      fixedContext="christian"
      showRoleFilters
      filteredGenreOptions={filteredGenreOptions}
      initialData={initialData}
    />
  );
}
