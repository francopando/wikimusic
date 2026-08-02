// src/app/archive/page.tsx

import { Suspense } from "react";
import { getTranslations } from "next-intl/server";
import MainWrapper from "@/components/layout/MainWrapper";
import PageSection from "@/components/layout/PageSection";
import DecadeTimelineCarousel from "@/components/home/DecadeTimelineCarousel";
import ArchiveClient, { type ArchiveInitialData } from "./ArchiveClient";
import { createPageMetadata } from "@/lib/seo";
import { ARCHIVE_PAGE_SIZE, getArchiveCacheKey } from "@/lib/archiveShared";
import { getArchiveCounts, getTopSongsByViews } from "@/lib/getSongsByYear";

export async function generateMetadata({
  params,
}: {
  params: Promise<{ locale: string }>;
}) {
  const { locale } = await params;
  return createPageMetadata({
    title: "Dominican Songs & Recordings",
    description:
      "Browse Dominican songs and recordings by year, title and popularity in Mangulina, the Dominican Music Database.",
    path: "/archive",
    locale,
  });
}

export const revalidate = 3600;

export default async function ArchivePage() {
  const archiveCounts = await getArchiveCounts();
  const songs = await getTopSongsByViews(ARCHIVE_PAGE_SIZE);
  const initialData: ArchiveInitialData = {
    songs,
    total: songs.length,
    hasMore: false,
    cacheKey: getArchiveCacheKey(null, "views", 1),
  };
  const t = await getTranslations("navigation");

  return (
    <MainWrapper>
      <PageSection>
        <DecadeTimelineCarousel
          decadeCounts={archiveCounts.decadeCounts}
          ctaHref="/"
          ctaLabel={t("home")}
        />
      </PageSection>

      <Suspense fallback={null}>
        <ArchiveClient initialData={initialData} />
      </Suspense>
    </MainWrapper>
  );
}
