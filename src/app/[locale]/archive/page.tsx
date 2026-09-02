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

// Counts come from getArchiveCounts, which admin recording/release mutations
// invalidate through HOMEPAGE_ARCHIVE_CACHE_TAG, so this clock is a fallback.
//
// The effective TTL is HOMEPAGE_CACHE_SECONDS (1h), not this value: Next
// resolves a route's revalidate as the minimum across every cache it reads,
// and getArchiveCounts is shorter. This stays as the route-level ceiling.
export const revalidate = 86400; // 24 hours (capped to 1h by the data cache)

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
