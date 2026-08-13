import { getSupabaseClient } from "@/lib/supabase";

export type FamilyRelationshipType = "parent" | "sibling" | "cousin" | "spouse" | "grandparent" | "uncle_aunt" | "great_uncle_aunt";
export type SpouseStatus = "current" | "former" | "ended_by_death";
export type FamilyEditorLabel = "father" | "mother" | "parent" | "son" | "daughter" | "child" | "brother" | "sister" | "sibling" | "cousin" | "husband" | "wife" | "spouse" | "ex_husband" | "ex_wife" | "ex_spouse" | "widow_of" | "widower_of" | "grandfather" | "grandmother" | "grandparent" | "grandson" | "granddaughter" | "grandchild" | "uncle" | "aunt" | "nephew" | "niece" | "great_uncle" | "great_aunt" | "great_nephew" | "great_niece";
export type FamilyPresentationKey = FamilyEditorLabel | "late_husband" | "late_wife" | "great_uncle_aunt" | "great_nibling";

export type FamilyArtist = { id: string; name: string; slug: string | null; gender: string | null; date_of_death: string | null; death_year: number | null };
export type FamilyRelationshipRow = { id: string; artist_id: string; related_artist_id: string; relationship_type: FamilyRelationshipType; relationship_status: SpouseStatus | null; artist?: FamilyArtist | null; related_artist?: FamilyArtist | null };
export type FamilyRelationshipItem = { id: string; relatedArtist: FamilyArtist; relationshipType: FamilyRelationshipType; relationshipStatus: SpouseStatus | null; labelKey: FamilyPresentationKey };

const familyPresentationOrder: Record<FamilyPresentationKey, number> = {
  grandfather: 10, grandmother: 10, grandparent: 10,
  great_uncle: 20, great_aunt: 20, great_uncle_aunt: 20,
  father: 30, mother: 30, parent: 30,
  uncle: 40, aunt: 40,
  brother: 50, sister: 50, sibling: 50,
  husband: 60, wife: 60, spouse: 60,
  ex_husband: 61, ex_wife: 61, ex_spouse: 61,
  widow_of: 62, widower_of: 62, late_husband: 62, late_wife: 62,
  cousin: 70,
  son: 80, daughter: 80, child: 80,
  nephew: 90, niece: 90,
  grandson: 100, granddaughter: 100, grandchild: 100,
  great_nephew: 110, great_niece: 110, great_nibling: 110,
};

export function sortFamilyRelationships(
  relationships: FamilyRelationshipItem[],
  locale = "en",
) {
  return [...relationships].sort((left, right) =>
    familyPresentationOrder[left.labelKey] - familyPresentationOrder[right.labelKey]
    || left.relatedArtist.name.localeCompare(right.relatedArtist.name, locale),
  );
}

const SELECT = `id,artist_id,related_artist_id,relationship_type,relationship_status,artist:artist_id(id,name,slug,gender,date_of_death,death_year),related_artist:related_artist_id(id,name,slug,gender,date_of_death,death_year)`;
const symmetric = new Set<FamilyRelationshipType>(["sibling", "cousin", "spouse"]);
const reverseLabels = new Set<FamilyEditorLabel>(["father","mother","parent","grandfather","grandmother","grandparent","uncle","aunt","great_uncle","great_aunt"]);
const statuses: Partial<Record<FamilyEditorLabel, SpouseStatus>> = { husband:"current", wife:"current", spouse:"current", ex_husband:"former", ex_wife:"former", ex_spouse:"former", widow_of:"ended_by_death", widower_of:"ended_by_death" };

export function isFamilyEditorLabel(value: unknown): value is FamilyEditorLabel {
  return typeof value === "string" && ["father","mother","parent","son","daughter","child","brother","sister","sibling","cousin","husband","wife","spouse","ex_husband","ex_wife","ex_spouse","widow_of","widower_of","grandfather","grandmother","grandparent","grandson","granddaughter","grandchild","uncle","aunt","nephew","niece","great_uncle","great_aunt","great_nephew","great_niece"].includes(value);
}

export function normalizeFamilyRelationship(currentId: string, selectedId: string, label: FamilyEditorLabel) {
  if (currentId === selectedId) throw new Error("An artist cannot be related to itself.");
  const relationship_type: FamilyRelationshipType = ["great_uncle","great_aunt","great_nephew","great_niece"].includes(label) ? "great_uncle_aunt" : label.includes("grand") ? "grandparent" : ["uncle","aunt","nephew","niece"].includes(label) ? "uncle_aunt" : ["brother","sister","sibling"].includes(label) ? "sibling" : label === "cousin" ? "cousin" : ["husband","wife","spouse","ex_husband","ex_wife","ex_spouse","widow_of","widower_of"].includes(label) ? "spouse" : "parent";
  let artist_id = currentId;
  let related_artist_id = selectedId;
  if (reverseLabels.has(label)) [artist_id, related_artist_id] = [related_artist_id, artist_id];
  if (symmetric.has(relationship_type) && artist_id > related_artist_id) [artist_id, related_artist_id] = [related_artist_id, artist_id];
  return { artist_id, related_artist_id, relationship_type, relationship_status: statuses[label] ?? null };
}

const gendered = (artist: FamilyArtist, male: FamilyPresentationKey, female: FamilyPresentationKey, neutral: FamilyPresentationKey) => artist.gender === "male" ? male : artist.gender === "female" ? female : neutral;
const deceased = (artist: FamilyArtist) => Boolean(artist.date_of_death || artist.death_year);

export function resolveFamilyRelationship(row: FamilyRelationshipRow, perspectiveId: string): FamilyRelationshipItem | null {
  const fromCanonical = row.artist_id === perspectiveId;
  const self = fromCanonical ? row.artist : row.related_artist;
  const relative = fromCanonical ? row.related_artist : row.artist;
  if (!self || !relative) return null;
  let labelKey: FamilyPresentationKey;
  if (row.relationship_type === "parent") labelKey = fromCanonical ? gendered(relative,"son","daughter","child") : gendered(relative,"father","mother","parent");
  else if (row.relationship_type === "grandparent") labelKey = fromCanonical ? gendered(relative,"grandson","granddaughter","grandchild") : gendered(relative,"grandfather","grandmother","grandparent");
  else if (row.relationship_type === "uncle_aunt") labelKey = fromCanonical ? gendered(relative,"nephew","niece","child") : gendered(relative,"uncle","aunt","parent");
  else if (row.relationship_type === "great_uncle_aunt") labelKey = fromCanonical ? gendered(relative,"great_nephew","great_niece","great_nibling") : gendered(relative,"great_uncle","great_aunt","great_uncle_aunt");
  else if (row.relationship_type === "sibling") labelKey = gendered(relative,"brother","sister","sibling");
  else if (row.relationship_type === "cousin") labelKey = "cousin";
  else if (row.relationship_status === "former") labelKey = gendered(relative,"ex_husband","ex_wife","ex_spouse");
  else if (row.relationship_status === "ended_by_death" && deceased(relative)) labelKey = gendered(self,"widower_of","widow_of","spouse");
  else if (row.relationship_status === "ended_by_death" && deceased(self)) labelKey = gendered(relative,"late_husband","late_wife","spouse");
  else labelKey = gendered(relative,"husband","wife","spouse");
  return { id: row.id, relatedArtist: relative, relationshipType: row.relationship_type, relationshipStatus: row.relationship_status, labelKey };
}

function one<T>(value: T | T[] | null | undefined): T | null { return Array.isArray(value) ? value[0] ?? null : value ?? null; }
export async function getArtistFamilyRelationships(artistId: string): Promise<FamilyRelationshipItem[]> {
  const { data, error } = await getSupabaseClient().from("artist_family_relationships").select(SELECT).or(`artist_id.eq.${artistId},related_artist_id.eq.${artistId}`).order("created_at");
  if (error) { console.error("getArtistFamilyRelationships error:", error); return []; }
  return sortFamilyRelationships((data ?? []).map((raw) => { const row = raw as unknown as FamilyRelationshipRow & {artist?: FamilyArtist|FamilyArtist[]|null;related_artist?:FamilyArtist|FamilyArtist[]|null}; return resolveFamilyRelationship({...row,artist:one(row.artist),related_artist:one(row.related_artist)},artistId); }).filter((item): item is FamilyRelationshipItem => Boolean(item)));
}
