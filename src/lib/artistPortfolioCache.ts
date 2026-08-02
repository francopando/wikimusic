import { revalidateTag } from "next/cache";

export const ARTIST_PORTFOLIO_CACHE_TAG = "artist-portfolios";

export function invalidateArtistPortfolioCache() {
  revalidateTag(ARTIST_PORTFOLIO_CACHE_TAG, { expire: 0 });
}
