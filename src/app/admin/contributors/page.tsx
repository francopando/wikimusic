import { requireAdminUser } from "@/lib/auth";
import { createServiceRoleClient } from "@/lib/supabaseService";
import type { Contributor } from "@/types/contributor";
import ContributorsAdminClient from "./ContributorsAdminClient";

export const dynamic = "force-dynamic";

const selectFields =
  "id, name, slug, role, bio, location, specialty, website, facebook, instagram, youtube, active, display_order, created_at";

export default async function AdminContributorsPage() {
  await requireAdminUser();
  const { data, error } = await createServiceRoleClient()
    .from("contributors")
    .select(selectFields)
    .order("display_order", { ascending: true })
    .order("name", { ascending: true });

  return (
    <ContributorsAdminClient
      initialContributors={(data ?? []) as Contributor[]}
      initialError={error?.message ?? null}
    />
  );
}
