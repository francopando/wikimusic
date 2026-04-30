'use client';

import { useState, useEffect } from 'react';
import { supabase } from '@/utils/supabase';
import Link from 'next/link';
import { useRouter, useSearchParams } from 'next/navigation';
import { Play } from 'lucide-react';

export default function HeritageArchive() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const [songs, setSongs] = useState<any[]>([]);

  // 2026 Context
  const currentYear = 2026;
  const currentDecade = 2020;

  const selectedDecade = searchParams.get('decade') || currentDecade.toString();
  const selectedYear = searchParams.get('year') ? parseInt(searchParams.get('year')!) : currentYear;

  const decadeButtons = [1940, 1950, 1960, 1970, 1980, 1990, 2000, 2010, 2020];

  const updateParams = (updates: Record<string, string | number | null>) => {
    const params = new URLSearchParams(searchParams.toString());
    Object.entries(updates).forEach(([key, value]) => {
      if (value === null) params.delete(key);
      else params.set(key, value.toString());
    });
    router.push(`?${params.toString()}`, { scroll: false });
  };

  useEffect(() => {
    async function fetchSongs() {
      const { data } = await supabase
        .from('songs')
        .select('*, artists(id, name)')
        .eq('year', selectedYear)
        .order('title', { ascending: true });
      setSongs(data || []);
    }
    fetchSongs();
  }, [selectedYear]);

  const getYearRange = () => {
    const decadeNum = parseInt(selectedDecade);
    return Array.from({ length: 10 }, (_, i) => decadeNum + i);
  };

  return (
    <main className="max-w-5xl mx-auto py-12 px-6 font-mono bg-[#fcfcfc] min-h-screen text-black antialiased">
      
      {/* GLOBAL HEADER AREA */}
      <header className="mb-10 border-b-2 border-black pb-4 flex justify-between items-end">
        <div>
          <h1 className="text-2xl font-black uppercase tracking-tighter leading-none">Heritage Archive</h1>
          <p className="text-[10px] uppercase font-bold opacity-40 mt-1 tracking-[0.3em]">Chronological Database v3.0</p>
        </div>
        <div className="text-right">
          <p className="text-[10px] font-bold opacity-30 uppercase tracking-widest">Active Index</p>
          <p className="text-xl font-black leading-none">{selectedYear}</p>
        </div>
      </header>

      {/* NAVIGATION SYSTEM */}
      <nav className="mb-12 space-y-1">
        {/* ROW 1: DECADES (Increased Font) */}
        <div className="grid grid-cols-10 gap-1">
          <div className="flex gap-1">
            <button 
              onClick={() => updateParams({ decade: "1920", year: 1920 })}
              className={`flex-1 py-3 text-[13px] font-bold border-2 transition-all tracking-tighter ${
                selectedDecade === "1920" ? 'bg-black text-white border-black' : 'bg-white border-black/10 hover:border-black'
              }`}
            >
              20s
            </button>
            <button 
              onClick={() => updateParams({ decade: "1930", year: 1930 })}
              className={`flex-1 py-3 text-[13px] font-bold border-2 transition-all tracking-tighter ${
                selectedDecade === "1930" ? 'bg-black text-white border-black' : 'bg-white border-black/10 hover:border-black'
              }`}
            >
              30s
            </button>
          </div>

          {decadeButtons.map((d) => (
            <button 
              key={d} 
              onClick={() => updateParams({ decade: d, year: d })} 
              className={`py-3 text-base font-bold border-2 transition-all ${
                selectedDecade === d.toString() 
                  ? 'bg-black text-white border-black' 
                  : 'bg-white border-black/10 hover:border-black'
              }`}
            >
              {d}s
            </button>
          ))}
        </div>

        {/* ROW 2: YEARS (Increased Font) */}
        <div className="grid grid-cols-10 gap-1">
          {getYearRange().map((y) => (
            <button 
              key={y} 
              onClick={() => updateParams({ year: y })}
              className={`py-2 text-[15px] font-bold border-2 transition-all ${
                selectedYear === y 
                  ? 'bg-black text-white border-black' 
                  : 'bg-white border-black/10 hover:border-black'
              }`}
            >
              {y}
            </button>
          ))}
        </div>
      </nav>

      {/* DATA LEDGER */}
      <section className="animate-in fade-in slide-in-from-bottom-2 duration-700">
        <div className="border-t-2 border-black">
          {songs.length > 0 ? (
            <div className="divide-y-2 divide-black/[0.03]">
              {songs.map((song) => (
                <div key={song.id} className="py-4 flex items-center group hover:bg-black/[0.02] px-2 -mx-2 transition-all border-l-0 hover:border-l-4 border-black">
                  
                  {/* ARTIST */}
                  <Link 
                    href={`/artists/${song.artists?.id}`} 
                    className="text-[13px] font-black opacity-50 group-hover:opacity-100 uppercase w-40 md:w-56 truncate shrink-0 tracking-tighter transition-all"
                  >
                    {song.artists?.name}
                  </Link>

                  {/* SONG + LINK */}
                  <Link 
                    href={`/songs/${song.id}`} 
                    className="flex-1 flex items-center gap-4 min-w-0 group/song"
                  >
                    <span className="text-[15px] italic font-medium opacity-80 group-hover/song:opacity-100 truncate underline-offset-4 group-hover/song:underline">
                      {song.title}
                    </span>
                    
                    {/* PLAY ICON */}
                    <div className="flex items-center justify-center w-6 h-6 rounded-full bg-black text-white opacity-0 group-hover/song:opacity-100 transition-all scale-75 group-hover/song:scale-110 shrink-0 shadow-lg">
                      <Play size={10} fill="currentColor" className="ml-0.5" />
                    </div>
                  </Link>

                  {/* METADATA */}
                  <div className="hidden md:flex items-center gap-6 ml-auto shrink-0">
                    <span className="text-[10px] opacity-20 uppercase font-black tracking-widest italic">
                      {song.genre || 'Unclassified'}
                    </span>
                    <span className="text-[10px] opacity-10 font-mono">
                      REF:{song.id.slice(0, 5)}
                    </span>
                  </div>
                </div>
              ))}
            </div>
          ) : (
            <div className="py-32 text-center border-b-2 border-dashed border-black/10">
              <p className="text-[11px] uppercase font-bold opacity-20 tracking-[0.5em]">No Records Found for Index {selectedYear}</p>
            </div>
          )}
        </div>
      </section>

      {/* FOOTER STATS */}
      <footer className="mt-20 pt-4 border-t border-black/10 flex justify-between items-center opacity-30 text-[9px] uppercase font-bold tracking-widest">
        <p>© 2026 Heritage Archive Project</p>
        <p>Total Ledger Entries: {songs.length}</p>
      </footer>
    </main>
  );
}