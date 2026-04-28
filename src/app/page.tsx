import Link from "next/link";
import {
  ArrowRight,
  Sparkles,
  Music2,
  Users,
  BookOpen,
  Check,
} from "lucide-react";

export default function HomePage() {
  return (
    <main className="min-h-screen bg-neutral-50 text-neutral-900">
      <div className="mx-auto max-w-6xl px-6 py-14 sm:py-20 space-y-16">
        {/* Top nav (simple + calm) */}
        <header className="space-y-10">
          <nav className="flex items-center justify-between">
            <Link href="/" className="text-sm font-semibold tracking-tight">
              Wikimusic
            </Link>

            <div className="flex items-center gap-2 text-sm">
              <Link
                href="/artists"
                className="rounded-full px-3 py-1 text-neutral-600 hover:text-neutral-900 hover:bg-neutral-100"
              >
                Artists
              </Link>
              <Link
                href="/songs"
                className="rounded-full px-3 py-1 text-neutral-600 hover:text-neutral-900 hover:bg-neutral-100"
              >
                Songs
              </Link>
              <Link
                href="/expressions"
                className="rounded-full px-3 py-1 text-neutral-600 hover:text-neutral-900 hover:bg-neutral-100"
              >
                Expressions
              </Link>
            </div>
          </nav>

          {/* HERO (same structure: title + subtitle + CTA + prompt chips) */}
          <section className="space-y-6">
            <span className="inline-flex items-center gap-2 rounded-full border border-neutral-200 bg-white px-3 py-1 text-xs font-medium text-neutral-600">
              <Sparkles className="h-4 w-4" />
              Music knowledge system · clean metadata · cultural context
            </span>

            <h1 className="max-w-4xl text-4xl sm:text-5xl font-semibold tracking-tight">
              Explore Dominican music with structure — not chaos
            </h1>

            <p className="max-w-2xl text-base sm:text-lg leading-relaxed text-neutral-600">
              Wikimusic helps you organize songs, artists, lyrics, translations,
              and expressions in a calm, consistent interface designed for
              discovery and learning.
            </p>

            <div className="flex flex-wrap gap-3">
              <Link
                href="/artists"
                className="inline-flex items-center gap-2 rounded-2xl bg-neutral-900 px-4 py-2 text-sm font-semibold text-white shadow-sm hover:bg-neutral-800"
              >
                Browse artists <ArrowRight className="h-4 w-4" />
              </Link>

              <Link
                href="/songs"
                className="inline-flex items-center gap-2 rounded-2xl border border-neutral-200 bg-white px-4 py-2 text-sm font-semibold text-neutral-900 hover:bg-neutral-100"
              >
                Browse songs
              </Link>
            </div>

            {/* “prompt chips” (inspired by the “Generate X” row) */}
            <div className="flex flex-wrap gap-2 pt-2">
              <Chip>Find songs by year</Chip>
              <Chip>Compare artists by region</Chip>
              <Chip>Highlight expressions in lyrics</Chip>
              <Chip>Audit missing metadata</Chip>
              <Chip>Generate glossary pages</Chip>
            </div>
          </section>

          {/* Trusted by row (same idea) */}
          <section className="space-y-3">
            <p className="text-sm text-neutral-500">Built for researchers, creators, and learners</p>
            <div className="flex flex-wrap items-center gap-3 text-xs text-neutral-500">
              <LogoPill>Students</LogoPill>
              <LogoPill>Teachers</LogoPill>
              <LogoPill>Translators</LogoPill>
              <LogoPill>Collectors</LogoPill>
              <LogoPill>Music Nerds</LogoPill>
            </div>
          </section>
        </header>

        {/* 01/02/03 section (same pattern as the page) */}
        <section className="space-y-8">
          <SectionTitle
            title="Clarity, speed, and structure for your music archive"
            subtitle="Build faster, stay consistent, and keep everything organized across songs, artists, and expressions."
          />

          <div className="grid gap-6 md:grid-cols-3">
            <StepCard
              number="01"
              title="Make discovery faster"
              desc="Browse by artist, album, year, genre, and region — with consistent pages and navigation."
              icon={<Music2 className="h-5 w-5" />}
            />
            <StepCard
              number="02"
              title="Keep the archive organized"
              desc="Track what’s missing: album data, release year, origin region, lyric sources, and translations."
              icon={<Users className="h-5 w-5" />}
            />
            <StepCard
              number="03"
              title="Explain culture without noise"
              desc="Attach expression definitions and notes to lyrics so context stays close to the line that needs it."
              icon={<BookOpen className="h-5 w-5" />}
            />
          </div>
        </section>

        {/* Toolkit cards (mirrors “Template / Cheatsheet / Workspace” cards) */}
        <section className="space-y-8">
          <SectionTitle
            title="A toolkit of pages you can grow into"
            subtitle="Start simple. Add structure as your library grows."
          />

          <div className="grid gap-6 md:grid-cols-3">
            <ProductCard
              badge="Template"
              title="Artist Profile"
              desc="A clean page for biography, genre, origin, era, and related songs."
              items={[
                "Name, genre, origin region",
                "Related songs + albums",
                "Influence + notes",
              ]}
              href="/artists"
              cta="Open artists"
            />
            <ProductCard
              badge="Template"
              title="Song Page"
              desc="A calm layout for metadata + lyrics + translation + references."
              items={[
                "Title, album, year, artist",
                "Lyrics + translation blocks",
                "Expression highlights",
              ]}
              href="/songs"
              cta="Open songs"
            />
            <ProductCard
              badge="Cheatsheet"
              title="Expressions Library"
              desc="A structured glossary to explain idioms and cultural phrases."
              items={[
                "Expression definition",
                "Example lyric lines",
                "Related songs + tags",
              ]}
              href="/expressions"
              cta="Open expressions"
            />
          </div>
        </section>

        {/* Pricing-style section (same structure: one price + includes list) */}
        <section className="space-y-8">
          <SectionTitle
            title="Simple roadmap pricing (free)"
            subtitle="Wikimusic is your project — start free, polish forever."
          />

          <div className="grid gap-6 lg:grid-cols-3">
            <div className="lg:col-span-2 rounded-[28px] bg-white p-8 ring-1 ring-neutral-900/10">
              <h3 className="text-xl font-semibold tracking-tight">
                Wikimusic — Core
              </h3>
              <p className="mt-2 text-sm leading-relaxed text-neutral-600">
                The base UI structure that keeps your archive readable and consistent.
              </p>

              <ul className="mt-6 grid gap-3 sm:grid-cols-2 text-sm text-neutral-700">
                <li className="flex items-start gap-2">
                  <Check className="mt-0.5 h-4 w-4 text-neutral-900" />
                  Clean editorial layout
                </li>
                <li className="flex items-start gap-2">
                  <Check className="mt-0.5 h-4 w-4 text-neutral-900" />
                  Cards + sections like the reference page
                </li>
                <li className="flex items-start gap-2">
                  <Check className="mt-0.5 h-4 w-4 text-neutral-900" />
                  Artist / Song / Expression templates
                </li>
                <li className="flex items-start gap-2">
                  <Check className="mt-0.5 h-4 w-4 text-neutral-900" />
                  Easy to tweak later with v0
                </li>
              </ul>
            </div>

            <div className="rounded-[28px] bg-neutral-900 p-8 text-white">
              <p className="text-sm text-white/70">Current plan</p>
              <div className="mt-2 text-4xl font-semibold tracking-tight">$0</div>
              <p className="mt-2 text-sm text-white/70">
                Your UI foundation is now consistent and expandable.
              </p>

              <div className="mt-6 flex flex-col gap-3">
                <Link
                  href="/artists"
                  className="inline-flex items-center justify-center rounded-2xl bg-white px-4 py-2 text-sm font-semibold text-neutral-900 hover:bg-neutral-100"
                >
                  Start browsing <ArrowRight className="ml-2 h-4 w-4" />
                </Link>

                <Link
                  href="/songs"
                  className="inline-flex items-center justify-center rounded-2xl border border-white/20 bg-transparent px-4 py-2 text-sm font-semibold text-white hover:bg-white/10"
                >
                  View songs
                </Link>
              </div>
            </div>
          </div>
        </section>

        {/* Testimonial + FAQ (same idea as bottom sections) */}
        <section className="grid gap-6 lg:grid-cols-2">
          <div className="rounded-[28px] bg-white p-8 ring-1 ring-neutral-900/10">
            <p className="text-sm text-neutral-500">What this enables</p>
            <p className="mt-3 text-lg leading-relaxed text-neutral-800">
              “Once everything is structured, adding cultural context becomes easy — you stop rewriting the same info everywhere.”
            </p>
            <p className="mt-4 text-sm font-medium text-neutral-900">
              — Future you, after 100+ songs
            </p>
          </div>

          <div className="rounded-[28px] bg-white p-8 ring-1 ring-neutral-900/10">
            <p className="text-sm text-neutral-500">Questions</p>

            <div className="mt-4 space-y-3">
              <Faq
                q="Can we tweak the design later?"
                a="Yes. Once this layout is in place, we can adjust spacing, fonts, and colors incrementally (or generate variants with v0)."
              />
              <Faq
                q="Will this work on mobile?"
                a="Yes. The grid collapses naturally, and cards stay readable because width is constrained."
              />
              <Faq
                q="What’s the next page to style?"
                a="Artists list and song page — we’ll reuse the same card and section primitives."
              />
            </div>
          </div>
        </section>

        <footer className="flex flex-col gap-4 border-t border-neutral-200 pt-8 text-sm text-neutral-500 sm:flex-row sm:items-center sm:justify-between">
          <span>Wikimusic</span>
          <span>Inspired by calm editorial design patterns [1](https://onedrive.live.com?cid=2D2C96061422011E&id=2D2C96061422011E!sf19fda7d24e7454b94c71897f0b566b2)</span>
        </footer>
      </div>
    </main>
  );
}

/* ---------- Small UI primitives (keeps things consistent) ---------- */

function Chip({ children }: { children: React.ReactNode }) {
  return (
    <span className="inline-flex items-center rounded-full border border-neutral-200 bg-white px-3 py-1 text-xs font-medium text-neutral-700">
      {children}
    </span>
  );
}

function LogoPill({ children }: { children: React.ReactNode }) {
  return (
    <span className="rounded-full border border-neutral-200 bg-white px-3 py-1">
      {children}
    </span>
  );
}

function SectionTitle({
  title,
  subtitle,
}: {
  title: string;
  subtitle: string;
}) {
  return (
    <div className="space-y-2">
      <h2 className="text-2xl sm:text-3xl font-semibold tracking-tight">
        {title}
      </h2>
      <p className="max-w-3xl text-sm sm:text-base leading-relaxed text-neutral-600">
        {subtitle}
      </p>
    </div>
  );
}

function StepCard({
  number,
  title,
  desc,
  icon,
}: {
  number: string;
  title: string;
  desc: string;
  icon: React.ReactNode;
}) {
  return (
    <div className="rounded-[28px] bg-white p-8 ring-1 ring-neutral-900/10">
      <div className="flex items-center justify-between">
        <span className="text-sm font-semibold text-neutral-500">{number}</span>
        <span className="inline-flex h-10 w-10 items-center justify-center rounded-2xl bg-neutral-100 text-neutral-900">
          {icon}
        </span>
      </div>
      <h3 className="mt-5 text-lg font-medium tracking-tight">{title}</h3>
      <p className="mt-3 text-sm leading-relaxed text-neutral-600">{desc}</p>
    </div>
  );
}

function ProductCard({
  badge,
  title,
  desc,
  items,
  href,
  cta,
}: {
  badge: string;
  title: string;
  desc: string;
  items: string[];
  href: string;
  cta: string;
}) {
  return (
    <div className="rounded-[28px] bg-white p-8 ring-1 ring-neutral-900/10">
      <p className="text-xs font-semibold text-neutral-500">{badge}</p>
      <h3 className="mt-3 text-lg font-medium tracking-tight">{title}</h3>
      <p className="mt-2 text-sm leading-relaxed text-neutral-600">{desc}</p>

      <ul className="mt-5 space-y-2 text-sm text-neutral-700">
        {items.map((x) => (
          <li key={x} className="flex items-start gap-2">
            <Check className="mt-0.5 h-4 w-4 text-neutral-900" />
            {x}
          </li>
        ))}
      </ul>

      <div className="mt-6">
        <Link
          href={href}
          className="inline-flex items-center gap-2 rounded-2xl border border-neutral-200 bg-neutral-50 px-4 py-2 text-sm font-semibold text-neutral-900 hover:bg-neutral-100"
        >
          {cta} <ArrowRight className="h-4 w-4" />
        </Link>
      </div>
    </div>
  );
}

function Faq({ q, a }: { q: string; a: string }) {
  return (
    <details className="rounded-2xl border border-neutral-200 bg-neutral-50 px-4 py-3">
      <summary className="cursor-pointer select-none text-sm font-semibold text-neutral-900">
        {q}
      </summary>
      <p className="mt-2 text-sm leading-relaxed text-neutral-600">{a}</p>
    </details>
  );
}