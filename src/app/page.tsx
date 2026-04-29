import { supabase } from '@/utils/supabase';
import Image from 'next/image';
import Link from 'next/link';

const STORAGE_URL = "https://srulenjahemkuxtkfmzt.supabase.co/storage/v1/object/public/artist-images/";

export default async function Home() {
  // Fetch artists from your 'artists' table
  const { data: artists, error } = await supabase
    .from('artists')
    .select('*')
    .order('name', { ascending: true });

  if (error) console.error('Error loading artists:', error);

  // Use the first artist for the featured bento card
  const featured = artists?.[0];

  return (
    <>
      <header className="fixed top-0 left-0 right-0 z-50 py-8 px-10 md:px-20 flex items-center justify-between pointer-events-none">
        <Link href="/" className="font-serif italic text-2xl text-wikicrimson pointer-events-auto">
          WikiMusic.do
        </Link>
        <div className="text-[10px] font-bold uppercase tracking-[0.3em] opacity-40">
          Dominican Music Database v1.0
        </div>
      </header>

      <main className="pt-40 pb-24 px-8 max-w-6xl mx-auto font-outfit">
        {/* Bento Grid Section */}
        <div className="grid md:grid-cols-3 gap-6 mb-32">
          {/* Main Discovery Card */}
          <Link 
            href={featured ? `/artists/${featured.id}` : '#'} 
            className="md:col-span-2 bg-white/50 backdrop-blur-3xl rounded-[48px] p-12 border border-white/60 relative overflow-hidden group transition-all hover:bg-white/80"
          >
            <div className="relative z-10 flex flex-col justify-between h-full">
              <span className="text-[10px] font-bold uppercase tracking-[0.3em] opacity-40 mb-20 block">Featured Artist</span>
              <div>
                <h2 className="text-6xl md:text-8xl italic mb-4 transition-colors group-hover:text-wikicrimson">
                  {featured?.name || "The Archive"}
                </h2>
                <p className="text-lg opacity-60 max-w-sm">
                  {featured?.bio || "Mapping the history of Dominican sound."}
                </p>
              </div>
            </div>
          </Link>

          {/* Region Stats Card */}
          <div className="bg-wikicrimson rounded-[48px] p-12 text-canvas flex flex-col justify-between shadow-xl">
             <span className="text-[10px] font-bold uppercase tracking-[0.3em] opacity-60">Primary Origin</span>
             <div className="text-4xl font-serif">
               {featured?.origin_region || "Multiple Regions"}
             </div>
          </div>
        </div>

        {/* The Full Index List */}
        <section className="pt-20 border-t border-black/5">
          <h3 className="text-[11px] font-bold uppercase tracking-[0.4em] text-wikicrimson mb-16">The Archive Index</h3>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-x-12 gap-y-20">
            {artists?.map((artist, index) => (
              <Link href={`/artists/${artist.id}`} key={artist.id} className="group block">
                {/* Image Placeholder with Editorial Filter */}
                <div className="relative w-full aspect-4/5 rounded-[40px] overflow-hidden mb-8 bg-black/5 shadow-sm transition-all duration-500 group-hover:shadow-xl">
                  {artist.image_url ? (
                    <Image 
                      src={`${STORAGE_URL}${encodeURIComponent(artist.image_url)}`}
                      alt={artist.name}
                      fill
                      sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 33vw"
                      priority={index < 3}
                      className="object-cover grayscale-30 group-hover:grayscale-0 transition-all duration-700 group-hover:scale-105"
                    />
                  ) : (
                    <div className="w-full h-full flex items-center justify-center italic opacity-20">No Image</div>
                  )}
                </div>
                
                <div className="flex justify-between items-start mb-4">
                  <h4 className="text-3xl font-serif group-hover:text-wikicrimson transition-colors">
                    {artist.name}
                  </h4>
                  <span className="text-[10px] font-bold opacity-30 mt-2">{artist.birth_year}</span>
                </div>
                <p className="text-sm opacity-50 line-clamp-2 leading-relaxed">
                  {artist.bio}
                </p>
              </Link>
            ))}
          </div>
        </section>
      </main>

      <footer className="p-05 text-center border-t border-black/5">
        <p className="text-sm opacity-50">© 2026 WikiMusic.do All rights reserved.</p>
      </footer>
    </>
  );
}
