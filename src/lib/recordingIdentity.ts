import { createServiceRoleClient } from "@/lib/supabaseService";
import type { RecordingIdentitySummary } from "@/types/recordingVersion";

/**
 * Server-only read path for the durable Recording identity contract.
 *
 * This does not infer or create version profiles from imported metadata. The
 * returned structured facets are present only after a governed editorial save.
 */
export async function getRecordingIdentitySummaries(
  recordingIds: readonly string[],
): Promise<RecordingIdentitySummary[]> {
  if (recordingIds.length === 0) return [];

  const { data, error } = await createServiceRoleClient()
    .from("recording_identity_summary")
    .select("*")
    .in("recording_id", [...recordingIds]);

  if (error) throw new Error(`Unable to load Recording identity summaries: ${error.message}`);
  return (data ?? []) as RecordingIdentitySummary[];
}
