import ArtistRoleDirectoryPage from "@/components/artists/ArtistRoleDirectoryPage";
import { ARTIST_ROLE_PAGES, createArtistRoleMetadata } from "@/lib/artist-role-pages";

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
  return createArtistRoleMetadata("songwriters", locale);
}

export default async function SongwritersPage() {
  return (
    <ArtistRoleDirectoryPage
      config={ARTIST_ROLE_PAGES.songwriters}
    />
  );
}
