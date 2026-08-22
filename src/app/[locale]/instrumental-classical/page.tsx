import ArtistDirectory from "@/components/artists/ArtistDirectory";
import { getArtistOccupationOptions } from "@/lib/artistOccupationOptions";
import { getArtistDirectoryInitialData } from "@/lib/artistDirectoryData";
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
  return createArtistDirectoryMetadata(
    "instrumentalClassical",
    "/instrumental-classical",
    locale,
  );
}

export default async function InstrumentalClassicalPage() {
  const occupationOptions = await getArtistOccupationOptions("instrumentalist");
  const initialData = await getArtistDirectoryInitialData({
    role: "instrumentalist",
  });

  return (
    <ArtistDirectory
      path="/instrumental-classical"
      i18nKey="instrumentalClassical"
      role="instrumentalist"
      hideGenreFilter
      hideProvinceSelector
      occupationOptions={occupationOptions}
      initialData={initialData}
    />
  );
}
