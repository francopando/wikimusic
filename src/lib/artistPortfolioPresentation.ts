export type PortfolioSortFields = {
  recordingYear: number | null;
  disambiguation: string | null;
  releaseYear: number | null;
  title: string;
  id: string;
};

export function comparePortfolioPresentation(a: PortfolioSortFields, b: PortfolioSortFields) {
  return (
    (a.recordingYear ?? Number.MAX_SAFE_INTEGER) - (b.recordingYear ?? Number.MAX_SAFE_INTEGER) ||
    (a.disambiguation ?? "").localeCompare(b.disambiguation ?? "") ||
    (a.releaseYear ?? Number.MAX_SAFE_INTEGER) - (b.releaseYear ?? Number.MAX_SAFE_INTEGER) ||
    a.title.localeCompare(b.title) ||
    a.id.localeCompare(b.id)
  );
}

export function formatPortfolioDuration(seconds: number) {
  const minutes = Math.floor(seconds / 60);
  return `${minutes}:${String(seconds % 60).padStart(2, "0")}`;
}
