import { supabase } from "@/lib/supabaseClient";

export const revalidate = 60;

export default async function HomePage() {
  // You can keep your Supabase fetch here if you want
  // or replace everything with v0-generated UI later.

  return (
    <main className="min-h-screen bg-black text-white">
      <div className="mx-auto max-w-6xl px-6 py-16">
        <h1 className="text-3xl font-bold">Wikimusic</h1>
        <p className="mt-2 text-white/70">Plasmic removed. Ready for v0 UI.</p>
      </div>
    </main>
  );
}