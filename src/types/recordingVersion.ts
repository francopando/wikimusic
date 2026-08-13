export const recordingPerformanceKinds = ["studio", "live", "demo", "rehearsal", "other"] as const;
export const recordingDerivationKinds = ["rerecording", "remix", "edit", "alternate_take", "medley", "other"] as const;
export const recordingPerformanceDatePrecisions = ["year", "month", "day"] as const;
export const recordingDerivationRelationshipTypes = ["edit_of", "remix_of", "rerecording_of", "alternate_take_of", "derived_from"] as const;

export type RecordingPerformanceKind = (typeof recordingPerformanceKinds)[number];
export type RecordingDerivationKind = (typeof recordingDerivationKinds)[number];
export type RecordingPerformanceDatePrecision = (typeof recordingPerformanceDatePrecisions)[number];
export type RecordingDerivationRelationshipType = (typeof recordingDerivationRelationshipTypes)[number];

export type RecordingVersionProfile = {
  recording_id: string;
  performance_kind: RecordingPerformanceKind | null;
  derivation_kind: RecordingDerivationKind | null;
  language_code: string | null;
  performance_date: string | null;
  performance_date_precision: RecordingPerformanceDatePrecision | null;
  performance_context: string | null;
  created_at: string;
  updated_at: string;
};

export type RecordingIdentityPerformer = { credit_id: string; artist_id: string | null; external_contributor_id: string | null; name: string; role: string; credited_as: string | null };
export type RecordingIdentitySummary = {
  recording_id: string; canonical_title: string; slug: string | null; artist_id: string; primary_artist_name: string; work_id: string | null;
  disambiguation_override: string | null; performance_kind: RecordingPerformanceKind | null; derivation_kind: RecordingDerivationKind | null;
  language_code: string | null; performance_date: string | null; performance_date_precision: RecordingPerformanceDatePrecision | null; performance_context: string | null;
  recording_year: number | null; duration: number | null; representative_release_id: string | null; representative_release_title: string | null;
  first_release_id: string | null; first_release_title: string | null; first_release_year: number | null; track_appearance_count: number; release_appearance_count: number;
  performers: RecordingIdentityPerformer[]; has_structured_version_profile: boolean; descriptor_source: "editorial_or_legacy_override" | "structured" | "none";
};
