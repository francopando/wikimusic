import { supabase } from "@/lib/supabase";

type RecordingOwnerRow = { id: string; artist_id: string | null; release_id: string | null };

export const PUBLIC_VISIBILITY_BATCH_SIZE = 250;
const PUBLIC_VISIBILITY_CONCURRENCY = 5;

export function chunkForPublicVisibility<T>(values: T[]) {
  const chunks: T[][] = [];
  for (let index = 0; index < values.length; index += PUBLIC_VISIBILITY_BATCH_SIZE) {
    chunks.push(values.slice(index, index + PUBLIC_VISIBILITY_BATCH_SIZE));
  }
  return chunks;
}

async function runVisibilityBatches<T, R>(values: T[], run: (batch: T[]) => Promise<R>) {
  const batches = chunkForPublicVisibility(values);
  const results: R[] = [];
  for (let index = 0; index < batches.length; index += PUBLIC_VISIBILITY_CONCURRENCY) {
    results.push(...(await Promise.all(
      batches.slice(index, index + PUBLIC_VISIBILITY_CONCURRENCY).map(run),
    )));
  }
  return results;
}

export function isPublicArtistReference(
  artistId: string | null | undefined,
  publishedArtistIds: ReadonlySet<string>,
) {
  return !artistId || publishedArtistIds.has(artistId);
}

async function getPublishedArtistIds(artistIds: string[]) {
  const ids = [...new Set(artistIds.filter(Boolean))];
  if (!ids.length) return new Set<string>();
  const publishedArtistIds = new Set<string>();
  const responses = await runVisibilityBatches(ids, async (batch) => {
    const { data, error } = await supabase
      .from("artists").select("id").eq("status", "published").in("id", batch);
    if (error) throw error;
    return data ?? [];
  });
  for (const artists of responses) for (const artist of artists) publishedArtistIds.add(artist.id);
  return publishedArtistIds;
}

export async function getPublicRecordingIds(recordingIds: string[]) {
  const ids = [...new Set(recordingIds.filter(Boolean))];
  if (!ids.length) return new Set<string>();
  const rows: RecordingOwnerRow[] = [];
  const recordingResponses = await runVisibilityBatches(ids, async (batch) => {
    const { data, error } = await supabase
      .from("recordings").select("id,artist_id,release_id").in("id", batch);
    if (error) throw error;
    return (data ?? []) as RecordingOwnerRow[];
  });
  for (const response of recordingResponses) rows.push(...response);
  const releaseIds = [...new Set(rows.filter((row) => !row.artist_id && row.release_id)
    .map((row) => row.release_id as string))];
  const releaseArtistIds = new Map<string, string | null>();
  if (releaseIds.length) {
    const releaseResponses = await runVisibilityBatches(releaseIds, async (batch) => {
      const { data, error } = await supabase
        .from("releases").select("id,release_artist_id").in("id", batch);
      if (error) throw error;
      return data ?? [];
    });
    for (const releases of releaseResponses) {
      for (const release of releases) releaseArtistIds.set(release.id, release.release_artist_id);
    }
  }
  const ownerByRecordingId = new Map(rows.map((row) => [
    row.id,
    row.artist_id ?? (row.release_id ? releaseArtistIds.get(row.release_id) ?? null : null),
  ]));
  const publishedArtistIds = await getPublishedArtistIds(
    [...ownerByRecordingId.values()].filter((id): id is string => Boolean(id)),
  );
  return new Set(rows.filter((row) =>
    isPublicArtistReference(ownerByRecordingId.get(row.id), publishedArtistIds)).map((row) => row.id));
}

export async function isPublicRecording(recordingId: string) {
  return (await getPublicRecordingIds([recordingId])).has(recordingId);
}

export async function isPublicReleaseArtist(artistId: string | null | undefined) {
  if (!artistId) return true;
  return (await getPublishedArtistIds([artistId])).has(artistId);
}
