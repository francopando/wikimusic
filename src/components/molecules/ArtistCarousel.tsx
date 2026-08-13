"use client";

import { forwardRef, type ReactNode } from "react";

type ArtistCarouselProps = {
  children: ReactNode;
};

const ArtistCarousel = forwardRef<HTMLDivElement, ArtistCarouselProps>(
  function ArtistCarousel({ children }, ref) {
    return (
      <div ref={ref} className="w-full overflow-x-auto pb-2 scrollbar-none">
        <div className="flex w-max min-w-full justify-center gap-4">
          {children}
        </div>
      </div>
    );
  },
);

export default ArtistCarousel;
