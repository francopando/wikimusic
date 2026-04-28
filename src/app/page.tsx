import Link from "next/link";
import { ArrowRight, Music2, Users, BookOpen, Sparkles } from "lucide-react";

export default function HomePage() {
  return (
    <main className="min-h-screen bg-neutral-50 text-neutral-900">
      <div className="mx-auto max-w-6xl px-6 py-16 space-y-14">
        {/* HERO */}
        <header className="space-y-6">
          <span className="inline-flex items-center gap-2 rounded-full border border-neutral-200 bg-white px-3 py-1 text-xs font-medium text-neutral-600">
            <Sparkles className="h-4 w-4" />
            Dominican music encyclopedia
          </span>

          <h1 className="max-w-3xl text-5xl font-semibold tracking-tight">
            A structured way to explore Dominican music
          </h1>

          <p className="max-w-2xl text-lg leading-relaxed text-neutral-600">
            Songs, artists, lyrics, translations, and cultural expressions — built as a living reference.
          </p>

          <div className="flex flex-wrap gap-3">
            <Link
              href="/artists"
              className="inline-flex items-center gap-2 rounded-2xl bg-neutral-900 px-4 py-2 text-sm font-semibold text-white shadow-sm hover:bg-neutral-800"
            >
              Browse artists <ArrowRight className="h-4 w-4" />
            </Link>

            <Link
              href="/search?q="
              className="inline-flex items-center gap-2 rounded-2xl border border-neutral-200 bg-white px-4 py-2 text-sm font-semibold text-neutral-900 hover:bg-neutral-100"
            >
              Search songs
            </Link>
          </div>
        </header>

        {/* THREE NICE CARDS */}
        <section className="grid gap-8 md:grid-cols-3">
          <FeatureCard
            icon={<Music2 className="h-5 w-5" />}
            title="Songs"
            desc="Lyrics, translations, album metadata and cultural context."
            href="/songs"
          />
          <FeatureCard
            icon={<Users className="h-5 w-5" />}
            title="Artists"
            desc="Profiles, genres, origins, eras, and influence."
            href="/artists"
          />
          <FeatureCard
            icon={<BookOpen className="h-5 w-5" />}
            title="Expressions"
            desc="Idioms and phrases explained through real lyrics."
            href="/expressions"
          />
        </section>

        {/* FOOTER */}
        <footer className="border-t border-neutral-200 pt-8 text-sm text-neutral-500">
          Built for exploration — calm, clean, and consistent.
        </footer>
      </div>
    </main>
  );
}

function FeatureCard({
  icon,
  title,
  desc,
  href,
}: {
  icon: React.ReactNode;
  title: string;
  desc: string;
  href: string;
}) {
  return (
    <Link
      href={href}
      className="group rounded-3xl bg-white p-8 ring-1 ring-neutral-900/5 shadow-[0_1px_0_rgba(0,0,0,0.04),0_10px_30px_rgba(0,0,0,0.06)] transition hover:-translate-y-0.5 hover:shadow-[0_1px_0_rgba(0,0,0,0.04),0_16px_40px_rgba(0,0,0,0.08)]"
    >
      <div className="flex items-center gap-3">
        <span className="inline-flex h-10 w-10 items-center justify-center rounded-2xl bg-neutral-100 text-neutral-900">
          {icon}
        </span>
        <h3 className="text-lg font-medium tracking-tight">{title}</h3>
      </div>

      <p className="mt-3 text-sm leading-relaxed text-neutral-600">{desc}</p>

      <div className="mt-5 text-sm font-medium text-neutral-900 opacity-0 transition group-hover:opacity-100">
        Explore →
      </div>
    </Link>
  );
}