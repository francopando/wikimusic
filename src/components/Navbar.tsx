'use client';

import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';

export default function Navbar() {
  const pathname = usePathname();
  const router = useRouter();

  const navLinks = [
    { name: 'Database', href: '/' },
    { name: 'Artists', href: '/artists' },
    { name: 'Discover', href: '/discover' },
  ];

  return (
    <nav className="fixed bottom-8 left-1/2 -translate-x-1/2 z-100 w-fit">
      <div className="flex items-center gap-6 px-6 py-4 bg-black/40 backdrop-blur-2xl border border-white/10 rounded-full shadow-2xl">
        
        {/* Back Button - Arrow Left */}
        <button 
          onClick={() => router.back()}
          className="flex items-center justify-center w-8 h-8 rounded-full hover:bg-white/10 transition-colors group"
          aria-label="Go Back"
        >
          <svg 
            width="20" 
            height="20" 
            viewBox="0 0 24 24" 
            fill="none" 
            stroke="currentColor" 
            strokeWidth="2.5" 
            strokeLinecap="round" 
            strokeLinejoin="round" 
            className="text-white/60 group-hover:text-wikicrimson transition-colors"
          >
            <path d="M19 12H5M12 19l-7-7 7-7"/>
          </svg>
        </button>

        {/* Branding - DMDB */}
        <Link href="/" className="text-wikicrimson font-serif italic text-xl pr-6 border-r border-white/10">
          DMDB
        </Link>

        {/* Navigation Links */}
        <div className="flex gap-8">
          {navLinks.map((link) => {
            const isActive = pathname === link.href;
            return (
              <Link
                key={link.href}
                href={link.href}
                className={`text-[10px] font-bold uppercase tracking-[0.3em] transition-all duration-300 hover:text-wikicrimson ${
                  isActive ? 'text-wikicrimson' : 'text-white/40'
                }`}
              >
                {link.name}
              </Link>
            );
          })}
        </div>
      </div>
    </nav>
  );
}