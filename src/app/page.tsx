export default function HomePage() {
  return (
    <main className="min-h-screen bg-neutral-50 text-neutral-900">
      <div className="mx-auto max-w-5xl px-6 py-16 space-y-12">

        <header className="space-y-4">
          <h1 className="text-4xl font-semibold tracking-tight">
            Wikimusic
          </h1>
          <p className="max-w-xl text-lg text-neutral-600">
            A structured encyclopedia for Dominican music, artists, and cultural expressions.
          </p>
        </header>

        <section className="grid gap-6 md:grid-cols-3">
          <div className="rounded-2xl border border-neutral-200 bg-white p-6">
            <h3 className="font-medium">Songs</h3>
            <p className="mt-2 text-sm text-neutral-600">
              Lyrics, translations, and cultural context.
            </p>
          </div>

          <div className="rounded-2xl border border-neutral-200 bg-white p-6">
            <h3 className="font-medium">Artists</h3>
            <p className="mt-2 text-sm text-neutral-600">
              Profiles, eras, and musical influence.
            </p>
          </div>

          <div className="rounded-2xl border border-neutral-200 bg-white p-6">
            <h3 className="font-medium">Expressions</h3>
            <p className="mt-2 text-sm text-neutral-600">
              Idioms and phrases explained in context.
            </p>
          </div>
        </section>

      </div>
    </main>
  );
}