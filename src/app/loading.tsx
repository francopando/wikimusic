export default function Loading() {
  return (
    <main className="min-h-screen bg-neutral-950 text-neutral-100">
      <div className="mx-auto max-w-6xl px-6 py-16 space-y-6">
        <div className="h-10 w-72 rounded-xl bg-white/10" />
        <div className="h-5 w-[520px] rounded-xl bg-white/10" />
        <div className="grid gap-4 mt-10">
          <div className="h-20 rounded-2xl bg-white/10" />
          <div className="h-20 rounded-2xl bg-white/10" />
          <div className="h-20 rounded-2xl bg-white/10" />
        </div>
      </div>
    </main>
  );
}