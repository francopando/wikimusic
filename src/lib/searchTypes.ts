export type SearchResult = {
  type: "artist" | "song" | "release";
  id: string;
  title: string;
  slug: string | null;
  subtitle: string | null;
  year: number | null;
  cover_url: string | null;
  artist_name?: string | null;
  release_title?: string | null;
};

export type GlobalSearchResponse = {
  artists: SearchResult[];
  songs: SearchResult[];
  releases: SearchResult[];
};

export const MIN_SEARCH_QUERY_LENGTH = 2;
export const MAX_SEARCH_QUERY_LENGTH = 80;
