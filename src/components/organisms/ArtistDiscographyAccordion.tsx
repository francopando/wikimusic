
//artistDiscographyaccordion.tsx

import type { DiscographyReleaseSummary } from "@/lib/artistApi";
import ArtistDiscographyTabs from "@/components/organisms/ArtistDiscographyTabs";

export default async function ArtistDiscographyGrouped({
  releases,
}: {
  releases: DiscographyReleaseSummary[];
}) {
  const { getTranslations } = await import("next-intl/server");
  const t = await getTranslations("artist");

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

  return (
    <section id="discography" className="h-fit min-w-0 bg-white p-5 rounded-xl border border-gray-100 shadow-sm sm:p-6">
      <h3 className="text-xs font-normal text-(--color-wikicrimson) uppercase mb-5">
        {t("discography")}
      </h3>

      <ArtistDiscographyTabs releases={releases} />
    </section>
  );
}
