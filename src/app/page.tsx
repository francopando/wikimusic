import Link from "next/link";
import { supabase } from "@/lib/supabaseClient";
import {
  ArrowRight,
  Music,
  Users,
  Library,
  Sparkles,
} from "lucide-react";

export const revalidate = 60;

export default async function HomePage() {
  const [{ data: songs }, { data: artists }] = await Promise.all([
    supabase.from("songs").select("id,title").limit(6),
    supabase.from("artists").select("id,name").limit(6),
  ]);

  return (
    <main className="min-h-screen bg-neutral-50 text-neutral-900">
      <div className="mx-auto max-w-6xl px-6 py-16 space-y-20">

        {/* Header */}
        <header className="space-y-6">
          <span className="inline-flex items-center gap-2 rounded-full border border-neutral-200 bg-white px-3 py-1 text-xs font-medium text-neutral-600">
            <Sparkles className="h-3 w-3" />
            Cultural music encyclopedia
          </span>

          <h1 className="max-w-3xl text-5xl font-semibold tracking-tight">
            A structured way to explore Dominican music
          </h1>

          <p className="max-w-2xl text-lg text-neutral-600">
            Clean metadata, cultural context, lyrics, and expressions — built as
            a living reference, not a streaming app.
          </p>

          <div className="flex gap-4">
            <Link
              href="/artists"
              className="inline-flex items-center gap-2 rounded-xl bg-neutral-900 px-5 py-3 text-sm font-medium text-white hover:bg-neutral-800 transition"
            >
              Browse artists
              <ArrowRight className="h-4 w-4" />
            </Link>

            <Link
              href="/search"
              className="inline-flex items-center gap-2 rounded-xl border border-neutral-300 bg-white px-5 py-3 text-sm font-medium hover:bg-neutral-100 transition"
            >
              Search songs
            </Link>
          </div>
        </header>

        {/* Feature Grid */}
        <section className="grid gap-6 md:grid-cols-3">
          <Feature
            icon={<Music className="h-5 w-5" />}
            title="Songs"
            description="Detailed song pages with lyrics, translation, and cultural notes."
            href="/songs"
          />
          <Feature
            icon={<Users className="h-5 w-5" />}
            title="Artists"
            description="Artist profiles with eras, styles, and influence."
            href="/artists"
          />
          <Feature
            icon={<Library className="h-5 w-5" />}
            title="Expressions"
            description="Idioms and cultural expressions explained in context."
            href="/expressions"
          />
        </section>

        {/* Content Grid */}
        <section className="grid gap-10 md:grid-cols-2">
          <Card
            title="Recently added songs"
            items={songs?.map((s) => ({
              id: s.id,
              label: s.title,
              href: `/songs/${s.id}`,
            }))}
            empty="No songs yet"
          />

          <Card
            title="New artists"
            items={artists?.map((a) => ({
              id: a.id,
              label: a.name,
              href: `/artists/${a.id}`,
            }))}
            empty="No artists yet"
          />
        </section>

        {/* Footer */}
        <footer className="border-t border-neutral-200 pt-8 text-sm text-neutral-500">
          Built for exploration, not consumption.
        </footer>
      </div>
    </main>
  );
}

function Feature({
  icon,
  title,
  description,
  href,
}: {
  icon: React.ReactNode;
  title: string;
  description: string;
  href: string;
}) {
  return (
    <Link
      href={href}
      className="group rounded-2xl border border-neutral-200 bg-white p-6 hover:border-neutral-300 transition"
    >
      <div className="flex items-center gap-3 text-neutral-900">
        {icon}
        <h3 className="text-lg font-medium">{title}</h3>
      </div>
      <p className="mt-3 text-sm text-neutral-600">{description}</p>
      <p className="mt-4 text-sm font-medium text-neutral-900 opacity-0 group-hover:opacity-100 transition">
        Explore →
      </p>
    </Link>
  );
}

function Card({
  title,
  items,
  empty,
}: {
  title: string;
  items?: { id: string; label: string; href: string }[];
  empty: string;
}) {
  return (
    <div className="rounded-3xl border border-neutral-200 bg-white p-6">
      <h3 className="text-lg font-medium">{title}</h3>

      <div className="mt-4 space-y-2">
        {items && items.length > 0 ? (
          items.map((item) => (
            <Link
              key={item.id}
              href={item.href}
              className="block rounded-lg px-3 py-2 text-sm hover:bg-neutral-100 transition"
            >
              {item.label}
            </Link>
          ))
        ) : (
          <p className="text-sm text-neutral-500">{empty}</p>
        )}
      </div>
    </div>
  );
}