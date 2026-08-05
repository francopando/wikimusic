"use client";

import { useState } from "react";
import { useTranslations } from "next-intl";

import type { DiscographyReleaseSummary } from "@/lib/artistApi";
import ArtistDiscographyRelease from "@/components/organisms/ArtistDiscographyRelease";

const CATEGORY_ORDER = ["albums", "singles", "compilations", "other"] as const;

type ReleaseCategory = (typeof CATEGORY_ORDER)[number];

function getReleaseCategory(type: string | null): ReleaseCategory {
  switch (type?.trim().toLowerCase()) {
    case "album":
      return "albums";
    case "single":
      return "singles";
    case "compilation":
      return "compilations";
    default:
      return "other";
  }
}

export default function ArtistDiscographyTabs({
  releases,
}: {
  releases: DiscographyReleaseSummary[];
}) {
  const t = useTranslations("artist.discographyTabs");
  const groups = CATEGORY_ORDER.map((category) => ({
    category,
    releases: releases.filter(
      (release) => getReleaseCategory(release.release_type) === category,
    ),
  })).filter((group) => group.releases.length > 0);
  const [activeCategory, setActiveCategory] = useState<ReleaseCategory>(
    groups[0]?.category ?? "albums",
  );

  return (
    <div className="min-w-0">
      <div
        className="mb-5 flex min-w-0 gap-1 overflow-x-auto border-b border-gray-200 pb-px shadow-[0_1px_0_rgba(0,45,98,0.06)]"
        role="tablist"
        aria-label={t("label")}
      >
        {groups.map(({ category }) => {
          const isActive = category === activeCategory;

          return (
            <button
              key={category}
              id={`discography-tab-${category}`}
              type="button"
              role="tab"
              aria-selected={isActive}
              aria-controls={`discography-panel-${category}`}
              onClick={() => setActiveCategory(category)}
              className={`min-w-fit flex-1 cursor-pointer whitespace-nowrap border-b-2 px-3 py-2 text-center text-sm transition-colors ${
                isActive
                  ? "border-(--color-wikicrimson) text-(--color-wikicrimson)"
                  : "border-transparent text-gray-500 hover:text-(--color-flagblue)"
              }`}
            >
              {t(category)}
            </button>
          );
        })}
      </div>

      {groups.map(({ category, releases: categoryReleases }) => (
        <div
          key={category}
          id={`discography-panel-${category}`}
          role="tabpanel"
          aria-labelledby={`discography-tab-${category}`}
          hidden={category !== activeCategory}
          className="grid min-w-0 gap-2"
        >
          {categoryReleases.map((release) => (
            <ArtistDiscographyRelease key={release.release_id} release={release} />
          ))}
        </div>
      ))}
    </div>
  );
}
