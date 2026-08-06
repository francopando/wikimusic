import { Link } from "@/i18n/navigation";
import type { EditorialLocale, ResolvedArtistReference } from "@/types/editorialDocument";

export type ArtistReferenceProps = {
  reference: ResolvedArtistReference;
  locale: EditorialLocale;
};

export default function ArtistReference({ reference, locale }: ArtistReferenceProps) {
  if (!reference.isPubliclyLinkable || !reference.slug) return reference.displayText;
  return (
    <Link
      href={`/artists/${reference.slug}`}
      locale={locale}
      prefetch={false}
      className="rounded-sm font-medium text-(--color-flagblue) underline decoration-(--color-flagblue)/35 underline-offset-3 transition-colors hover:text-(--color-wikicrimson) hover:decoration-current focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-(--color-flagblue)"
    >
      {reference.displayText}
    </Link>
  );
}

