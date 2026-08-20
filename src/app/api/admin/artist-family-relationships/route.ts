import { NextResponse } from "next/server";
import { requireAdminApiRole } from "@/lib/adminApiAuth";
import { createServiceRoleClient } from "@/lib/supabaseService";
import { getArtistFamilyRelationships, isFamilyEditorLabel, normalizeFamilyRelationship } from "@/lib/artistFamilyRelationships";
import { revalidateArtistProfilesByArtistIds } from "@/lib/revalidateCatalogProfiles";

export async function GET(request: Request) {
  const auth = await requireAdminApiRole("editor"); if (auth.response) return auth.response;
  const artistId = new URL(request.url).searchParams.get("artistId");
  if (!artistId) return NextResponse.json({ok:false,error:"Artist id is required."},{status:400});
  return NextResponse.json({ok:true,relationships:await getArtistFamilyRelationships(artistId)});
}

export async function POST(request: Request) {
  const auth = await requireAdminApiRole("editor"); if (auth.response) return auth.response;
  const { relationshipId, artistId, relatedArtistId, relationshipLabel } = await request.json();
  if (!artistId || !relatedArtistId || !isFamilyEditorLabel(relationshipLabel)) return NextResponse.json({ok:false,error:"Artist, related artist, and a valid relationship are required."},{status:400});
  let payload; try { payload = normalizeFamilyRelationship(artistId, relatedArtistId, relationshipLabel); } catch (error) { return NextResponse.json({ok:false,error:(error as Error).message},{status:400}); }
  const supabase = createServiceRoleClient();
  const { data: artists, error: artistsError } = await supabase.from("artists").select("id").in("id",[artistId,relatedArtistId]);
  if (artistsError) return NextResponse.json({ok:false,error:artistsError.message},{status:500});
  if ((artists ?? []).length !== 2) return NextResponse.json({ok:false,error:"Both family members must be Mangulina artists."},{status:400});
  const low = artistId < relatedArtistId ? artistId : relatedArtistId, high = artistId < relatedArtistId ? relatedArtistId : artistId;
  const { data: existing, error: findError } = await supabase.from("artist_family_relationships").select("id").eq("pair_low",low).eq("pair_high",high).maybeSingle();
  if (findError) return NextResponse.json({ok:false,error:findError.message},{status:500});
  const id = relationshipId || existing?.id;
  const result = id ? await supabase.from("artist_family_relationships").update(payload).eq("id",id).select("id").single() : await supabase.from("artist_family_relationships").insert(payload).select("id").single();
  if (result.error) return NextResponse.json({ok:false,error:result.error.message},{status:500});
  // Family relationships render on both artists' profiles.
  await revalidateArtistProfilesByArtistIds([artistId, relatedArtistId]);
  return NextResponse.json({ok:true,id:result.data.id});
}

export async function DELETE(request: Request) {
  const auth = await requireAdminApiRole("admin"); if (auth.response) return auth.response;
  const { relationshipId, artistId } = await request.json();
  if (!relationshipId || !artistId) return NextResponse.json({ok:false,error:"Relationship id and artist id are required."},{status:400});
  const supabase = createServiceRoleClient();
  // Fetch both sides before deleting so both profiles can be refreshed.
  const { data: existingRelationship } = await supabase.from("artist_family_relationships").select("artist_id,related_artist_id").eq("id",relationshipId).maybeSingle();
  const { error } = await supabase.from("artist_family_relationships").delete().eq("id",relationshipId).or(`artist_id.eq.${artistId},related_artist_id.eq.${artistId}`);
  if (error) return NextResponse.json({ok:false,error:error.message},{status:500});
  await revalidateArtistProfilesByArtistIds([existingRelationship?.artist_id ?? artistId, existingRelationship?.related_artist_id ?? null]);
  return NextResponse.json({ok:true});
}
