import "server-only";

import { getSupabaseServiceClient } from "@/lib/adminAccess";
import { revalidateArtistProfilePaths } from "@/lib/revalidateArtistProfile";
import { revalidateHomepageData } from "@/lib/homepageCache";

export async function revalidateEditorialDocumentOwner(ownerArtistId: string) {
  const supabase = getSupabaseServiceClient();
  const [{ data }, { data: featured }] = await Promise.all([
    supabase
    .from("artists")
    .select("slug")
    .eq("id", ownerArtistId)
    .maybeSingle(),
    supabase.from("featured_artist").select("artist_id").eq("artist_id", ownerArtistId).maybeSingle(),
  ]);
  if (data?.slug) revalidateArtistProfilePaths(data.slug);
  if (featured) revalidateHomepageData();
}

export async function revalidateEditorialDocumentsReferencingArtist(targetArtistId: string) {
  const supabase = getSupabaseServiceClient();
  const { data: references } = await supabase
    .from("editorial_entity_references")
    .select("editorial_document:editorial_documents!inner(owner_artist_id)")
    .eq("target_artist_id", targetArtistId);
  const ownerIds = [...new Set((references ?? []).flatMap((row) => {
    const document = Array.isArray(row.editorial_document)
      ? row.editorial_document[0]
      : row.editorial_document;
    return document?.owner_artist_id ? [document.owner_artist_id] : [];
  }))];
  if (!ownerIds.length) return;
  const { data: owners } = await supabase.from("artists").select("slug").in("id", ownerIds);
  for (const owner of owners ?? []) if (owner.slug) revalidateArtistProfilePaths(owner.slug);
}
