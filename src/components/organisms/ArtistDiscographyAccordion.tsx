
//artistDiscographyaccordion.tsx

import type { DiscographyReleaseSummary } from "@/lib/artistApi";
import ArtistDiscographyRelease from "@/components/organisms/ArtistDiscographyRelease";

const TYPE_ORDER = ["Album", "EP", "Single", "Compilation", "Live", "Other"];
const RELEASES_PER_PAGE = 20;

// Release types come from release_groups.primary_type or the legacy
// releases.type column, so casing and vocabulary vary ("album", "Broadcast",
// null). Every release must land in a bucket — anything unrecognized goes to
// "Other" so a non-empty discography can never render as an empty section.
function normalizeReleaseType(type: string | null | undefined): string {
  const normalized = type?.trim().toLowerCase();

  if (!normalized) return "Other";

  return (
    TYPE_ORDER.find((bucket) => bucket.toLowerCase() === normalized) ?? "Other"
  );
}

export default async function ArtistDiscographyGrouped({
  releases,
  requestedPage,
}: {
  releases: DiscographyReleaseSummary[];
  requestedPage: number;
}) {
  const { getTranslations } = await import("next-intl/server");
  const t = await getTranslations("artist");
  const tPagination = await getTranslations("pagination");

  if (releases.length === 0) {
    return (
      <section className="min-w-0 bg-white p-5 rounded-xl border border-gray-100 shadow-sm sm:p-6">
        <h3 className="text-xs font-normal text-(--color-wikicrimson) uppercase mb-4">
          {t("discography")}
        </h3>

        <p className="text-gray-700 leading-relaxed">
          {t("noDiscography")}
        </p>
      </section>
    );
  }

  const totalPages = Math.ceil(releases.length / RELEASES_PER_PAGE);
  const currentPage = Math.min(Math.max(requestedPage, 1), totalPages);
  const pageStart = (currentPage - 1) * RELEASES_PER_PAGE;
  const pageReleases = releases.slice(pageStart, pageStart + RELEASES_PER_PAGE);
  const releasesWithCovers = await Promise.all(
    pageReleases.map(async (release) => ({
      release_id: release.release_id,
      release_slug: release.release_slug,
      release_title: release.release_title,
      release_year: release.release_year,
      release_type: release.release_type,
      track_count: release.track_count,
      cover_url: release.cover_url,
      release_group_id: release.release_group_id,
      edition_count: release.edition_count,
      editions: release.editions,
    }))
  );

  const grouped = TYPE_ORDER.map((type) => ({
    type,
    items: releasesWithCovers.filter(
      (release) => normalizeReleaseType(release.release_type) === type
    ),
  })).filter((group) => group.items.length > 0);

  return (
    <section id="discography" className="h-fit min-w-0 bg-white p-5 rounded-xl border border-gray-100 shadow-sm sm:p-6">
      <h3 className="text-xs font-normal text-(--color-wikicrimson) uppercase mb-5">
        {t("discography")}
      </h3>

      <div className="space-y-7">
        {grouped.map((group) => (
          <div key={group.type}>
            <h4 className="text-sm font-normal uppercase tracking-wider text-(--color-flagblue) mb-2">
              {t(`releaseGroups.${group.type}`)}
            </h4>

            <div className="grid min-w-0 gap-2 2xl:grid-cols-2">
              {group.items.map((release) => (
                <ArtistDiscographyRelease key={release.release_id} release={release} />
              ))}
            </div>
          </div>
        ))}
      </div>

      {totalPages > 1 && (
        <nav
          className="mt-6 flex items-center justify-between border-t border-gray-100 pt-4 text-sm"
          aria-label={t("discography")}
        >
          {currentPage > 1 ? (
            <a
              href={`?releasesPage=${currentPage - 1}#discography`}
              className="rounded-md border border-gray-200 px-3 py-1.5 text-(--color-flagblue) hover:bg-gray-50"
            >
              {tPagination("previous")}
            </a>
          ) : <span />}

          <span className="text-gray-500">
            {currentPage} / {totalPages}
          </span>

          {currentPage < totalPages ? (
            <a
              href={`?releasesPage=${currentPage + 1}#discography`}
              className="rounded-md border border-gray-200 px-3 py-1.5 text-(--color-flagblue) hover:bg-gray-50"
            >
              {tPagination("next")}
            </a>
          ) : <span />}
        </nav>
      )}
    </section>
  );
}
