"use client";

import * as React from "react";
import { PlasmicComponent, PlasmicRootProvider } from "@plasmicapp/loader-nextjs";
import { PLASMIC } from "@/plasmic-init";

type Props = {
  songs: any[];
  artists: any[];
};

export function HomeShell({ songs, artists }: Props) {
  // Simple local fallback: if Plasmic fails to render for any reason,
  // you still show something.
  return (
    <PlasmicRootProvider loader={PLASMIC}>
      <PlasmicComponent
        component="Home"
        componentProps={{ songs, artists }}
      />
    </PlasmicRootProvider>
  );
}