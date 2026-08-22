import ArtistStatusDirectoryPage from "@/components/artists/ArtistStatusDirectoryPage";
import { createPageMetadata } from "@/lib/seo";

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
  return createPageMetadata({
    title: "Emerging Dominican Artists",
    description:
      "Discover emerging Dominican artists and rising talent across Dominican music in Mangulina, the Dominican Music Database.",
    path: "/artists/emerging",
    locale,
  });
}

export default async function EmergingDominicanArtistsPage() {
  return (
    <ArtistStatusDirectoryPage
      path="/artists/emerging"
      i18nKey="emerging"
      artistStatus="emerging"
    />
  );
}
