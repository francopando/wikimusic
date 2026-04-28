import Link from "next/link";
import { ArrowRight, Sparkles, Music2, Users, BookOpen, Search, PlayCircle } from "lucide-react";

export default function HomePage() {
  return (
    <main className="min-h-screen antialiased relative overflow-x-hidden">
      
      {/* BACKGROUND GRADIENTS */}
      <div className="fixed inset-0 -z-10 pointer-events-none">
        <div className="absolute top-[-10%] right-[-5%] w-[600px] h-[600px] bg-dr-blue/10 blur-[140px] rounded-full" />
        <div className="absolute bottom-[-10%] left-[-5%] w-[500px] h-[500px] bg-dr-red/5 blur-[120px] rounded-full" />
      </div>

      <div className="relative max-w-[1400px] mx-auto px-8 py-16 space-y-32">
        
        {/* NAV BAR */}
        <header className="flex justify-between items-center glass rounded-2xl px-8 py-4 shadow-soft">
          <Link href="/" className="flex items-center gap-3 font-black text-xl uppercase tracking-tight text-dr-blue">
            <div className="w-10 h-10 bg-dr-blue rounded-xl flex items-center justify-center shadow-md">
              <Music2 className="h-5 w-5 text-white" />
            </div>
            Wikimusic
          </Link>

          <nav className="flex items-center gap-8 font-bold text-text-main/60 text-sm">
            <Link href="/artists" className="hover:text-dr-red">Artists</Link>
            <Link href="/songs" className="hover:text-dr-red">Songs</Link>
            <div className="bg-ui-depth p-2 rounded-full text-dr-blue/60">
              <Search size={18} />
            </div>
          </nav>
        </header>

        {/* HERO */}
        <section className="flex flex-col items-center text-center space-y-10 pt-12">
          <div className="inline-flex items-center gap-2 px-5 py-2 rounded-full bg-ui-depth border border-white shadow-sm text-[11px] font-black text-dr-blue uppercase tracking-[0.2em]">
            <Sparkles size={14} className="fill-current" />
            Modern Dominican Archive
          </div>

          <h1 className="text-7xl md:text-9xl font-black tracking-tight leading-[0.9] text-text-main">
            Explore music with <br />
            <span className="text-dr-red">structure.</span>
          </h1>

          <p className="max-w-2xl text-lg md:text-2xl text-text-main/60 font-medium leading-relaxed">
            A calm, curated space for Dominican lyrics, cultural expressions, and deep musical metadata.
          </p>

          <div className="flex gap-4 pt-4">
            <Link
              href="/artists"
              className="px-8 py-4 bg-text-main text-white rounded-2xl font-bold shadow-soft hover:scale-105 hover:shadow-soft-lg flex items-center gap-3"
            >
              Start Exploring <ArrowRight size={20} />
            </Link>
          </div>
        </section>

        {/* FEATURE GRID */}
        <section className="grid grid-cols-1 md:grid-cols-3 gap-12">
          <FeatureCard 
            Icon={PlayCircle} 
            title="Discovery"
            desc="Sleek, consistent navigation for every era of Dominican music."
            variant="blue" 
          />
          <FeatureCard 
            Icon={Users} 
            title="Archives"
            desc="Clean metadata tracking—know exactly where every song comes from."
            variant="red"
          />
          <FeatureCard 
            Icon={BookOpen} 
            title="Culture"
            desc="Idioms and phrases explained right inside the lyrics."
            variant="blue"
          />
        </section>

        <footer className="pt-20 pb-10 border-t border-neutral-100 text-center text-[10px] font-black text-dr-blue/30 uppercase tracking-[0.3em]">
          © 2026 Wikimusic — Made for the Culture
        </footer>
      </div>
    </main>
  );
}

function FeatureCard({ Icon, title, desc, variant }: { Icon: any, title: string, desc: string, variant: 'blue' | 'red' }) {
  const isBlue = variant === 'blue';

  const bg = isBlue ? "bg-dr-blue/10" : "bg-dr-red/10";
  const text = isBlue ? "text-dr-blue" : "text-dr-red";
  const dot = isBlue ? "bg-dr-red" : "bg-dr-blue";

  return (
    <div className="group relative glass p-10 rounded-[32px] shadow-soft hover:-translate-y-3 hover:shadow-soft-lg">
      
      {/* ICON */}
      <div className={`w-16 h-16 rounded-2xl ${bg} flex items-center justify-center mb-8 relative`}>
        <div className={`absolute inset-0 rounded-2xl blur-2xl opacity-0 group-hover:opacity-60 ${bg}`} />
        <Icon size={28} strokeWidth={2.5} className={`${text} relative z-10 group-hover:scale-110`} />
      </div>

      {/* CONTENT */}
      <h3 className="text-2xl font-black mb-4 text-text-main tracking-tight">
        {title}
      </h3>

      <p className="text-text-main/60 leading-relaxed font-medium text-[15px]">
        {desc}
      </p>

      {/* DOT */}
      <div className={`absolute top-6 right-6 w-1.5 h-1.5 rounded-full opacity-40 ${dot}`} />
    </div>
  );
}