import { Suspense } from 'react';
import ArchiveContent from './archive-content';

export default function HeritageArchive() {
  return (
    <Suspense fallback={<div className="max-w-5xl mx-auto py-12 px-6"><div className="py-20 text-center opacity-20 text-[10px] uppercase font-bold tracking-widest">Loading Archive...</div></div>}>
      <ArchiveContent />
    </Suspense>
  );
}
