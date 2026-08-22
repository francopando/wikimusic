import ArtistDirectory from "@/components/artists/ArtistDirectory";
import type { ArtistRolePageConfig } from "@/lib/artist-role-pages";
import { getArtistDirectoryInitialData } from "@/lib/artistDirectoryData";
import { getArtistGenreOptions } from "@/lib/artistGenreOptions";
import { getArtistInstrumentOptions } from "@/lib/artistInstrumentOptions";

/**
 * Server shell for the canonical artist and role directories.
 *
 * It deliberately takes no searchParams: reading them here forced every
 * directory request — filtered or not — through a fresh server render. The
 * shell now always renders the canonical first page, and ArtistDirectory
 * loads any filtered/paginated/sorted view on the client, which it already
 * did whenever the server payload did not match the requested view.
 */
export default async function ArtistRoleDirectoryPage({
  config,
}: {
  config: ArtistRolePageConfig;
}) {
  const filteredGenreOptions = config.hideGenreFilter
    ? undefined
    : await getArtistGenreOptions({
        context: "secular",
        role: config.role,
      });
  const instrumentOptions = config.showInstrumentFilter
    ? await getArtistInstrumentOptions(config.role)
    : undefined;
  const initialData = await getArtistDirectoryInitialData({
    role: config.role,
    filteredGenreOptions,
  });

  return (
    <ArtistDirectory
      {...config}
      filteredGenreOptions={filteredGenreOptions}
      instrumentOptions={instrumentOptions}
      initialData={initialData}
    />
  );
}
