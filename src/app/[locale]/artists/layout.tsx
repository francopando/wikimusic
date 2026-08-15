import type { Metadata } from "next";

import { createArtistRoleMetadata } from "@/lib/artist-role-pages";

export async function generateMetadata({
  params,
}: {
  params: Promise<{ locale: string }>;
}): Promise<Metadata> {
  const { locale } = await params;
  const baseMetadata = await createArtistRoleMetadata("artists", locale);
  const localizedTitle = typeof baseMetadata.title === "string"
    ? baseMetadata.title
    : typeof baseMetadata.openGraph?.title === "string"
      ? baseMetadata.openGraph.title
      : "Dominican Singers";

  return {
    ...baseMetadata,
    title: {
      default: localizedTitle,
      template: "%s | Mangulina",
    },
  };
}

export default function ArtistsLayout({ children }: { children: React.ReactNode }) {
  return children;
}
