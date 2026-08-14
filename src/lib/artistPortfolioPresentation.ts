export type PortfolioSortFields = { recordingYear: number | null; identityLabel: string | null; releaseYear: number | null; title: string; id: string };

export type GroupablePortfolioRecording = PortfolioSortFields & { workId: string | null; workTitle: string | null; roles: string[] };

export type GroupedPortfolio<T extends GroupablePortfolioRecording> = {
  id: string;
  workId: string | null;
  title: string;
  roles: string[];
  recordings: T[];
};

export function comparePortfolioRecordings(a: PortfolioSortFields, b: PortfolioSortFields) {
  return (
    (a.recordingYear ?? Number.MAX_SAFE_INTEGER) - (b.recordingYear ?? Number.MAX_SAFE_INTEGER) ||
    (a.identityLabel ?? "").localeCompare(b.identityLabel ?? "") ||
    (a.releaseYear ?? Number.MAX_SAFE_INTEGER) - (b.releaseYear ?? Number.MAX_SAFE_INTEGER) ||
    a.title.localeCompare(b.title) ||
    a.id.localeCompare(b.id)
  );
}

export function groupPortfolioRecordings<T extends GroupablePortfolioRecording>(recordings: T[]): GroupedPortfolio<T>[] {
  const groups = new Map<string, GroupedPortfolio<T>>();
  for (const recording of recordings) {
    const key = recording.workId ? `work:${recording.workId}` : `recording:${recording.id}`;
    const existing = groups.get(key);
    if (existing) {
      existing.recordings.push(recording);
      existing.roles = [...new Set([...existing.roles, ...recording.roles])];
    } else {
      groups.set(key, { id: key, workId: recording.workId, title: recording.workTitle ?? recording.title, roles: [...recording.roles], recordings: [recording] });
    }
  }
  return [...groups.values()].map((group) => ({ ...group, recordings: group.recordings.sort(comparePortfolioRecordings) }));
}

export function formatDurationMilliseconds(milliseconds: number | null | undefined): string | null {
  if (milliseconds == null || milliseconds < 0) return null;
  const totalSeconds = Math.round(milliseconds / 1000);
  const hours = Math.floor(totalSeconds / 3600);
  const minutes = Math.floor((totalSeconds % 3600) / 60);
  const seconds = totalSeconds % 60;
  return hours > 0
    ? `${hours}:${String(minutes).padStart(2, "0")}:${String(seconds).padStart(2, "0")}`
    : `${minutes}:${String(seconds).padStart(2, "0")}`;
}
