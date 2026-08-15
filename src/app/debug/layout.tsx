import "../globals.css";

import DocumentShell from "@/components/layout/DocumentShell";
import { ROOT_METADATA } from "@/lib/root-metadata";

export const metadata = ROOT_METADATA;

export default function DebugLayout({ children }: { children: React.ReactNode }) {
  return <DocumentShell lang="en">{children}</DocumentShell>;
}
