'use client';

import Link from 'next/link';
import { usePathname } from 'next/navigation';

export default function Navbar() {
  const pathname = usePathname();

  const navLinks = [
    { name: 'Database', href: '/' },
    { name: 'Artists', href: '/artists' },
    { name: 'Discover', href: '/discover' },
  ];

  return (
    <nav className="fixed bottom-8 left-1/2 -translate-x-1/2 z-100 w-fit">
      <div className="flex items-center gap-8 px-8 py-4 bg-black/40 backdrop-blur-2xl border border-white/10 rounded-full shadow-2xl">
        {/* Minimalist Logo - Updated branding initials */}
        <Link href="/" className="text-wikicrimson font-serif italic text-xl pr-4 border-r border-white/10">
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