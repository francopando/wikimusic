import Link from "next/link";
import { supabase } from "@/lib/supabaseClient";

export const revalidate = 300;

function meta(parts: Array<string | null | undefined>) {
  return parts.filter((p) => p && p.trim() !== "").join(" · ");
}

export default async function ArtistsPage() {
  const { data: artists, error } = await supabase
    .from("artists")
    .select("id,name,genre,origin_region")
    .order("name")
    .limit(200);

  return (
    <main className="mx-auto max-w-6xl px-4 py-10 space-y-6">
      <header className="rounded-3xl border bg-white p-6 shadow-sm">
        <h1 className="text-2xl font-semibold">Artists</h1>
        <p className="mt-2 text-sm text-neutral-600">
          Browse the artist directory (sorted A–Z).
        </p>
      </header>

      {error && (
        <div className="rounded-2xl border bg-white p-4 text-sm text-red-600">
          Error loading artists: {error.message}
        </div>
      )}

      <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
        {artists?.map((a: any) => (
          <Link
            key={a.id}
            href={`/artists/${a.id}`}
            className="rounded-2xl border bg-white p-4 hover:bg-neutral-50"
          >
            <div className="font-medium">{a.name}</div>
            <div className="mt-1 text-sm text-neutral-600">
              {meta([a.genre ?? "—", a.origin_region]) || "—"}
            </div>
          </Link>
        ))}

        {!artists?.length && !error && (
          <div className="text-sm text-neutral-600">
            No artists found yet. Add rows to <code className="rounded bg-neutral-100 px-1">artists</code>.
          </div>
        )}
      </div>
    </main>
  );
}