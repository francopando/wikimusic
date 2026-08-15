import type { Metadata } from "next";
import { NextIntlClientProvider } from "next-intl";
import "../globals.css";

import DocumentShell from "@/components/layout/DocumentShell";
import { ROOT_METADATA } from "@/lib/root-metadata";
import messages from "../../../messages/en.json";

export const metadata: Metadata = {
  ...ROOT_METADATA,
  robots: {
    index: false,
    follow: false,
    noarchive: true,
    nosnippet: true,
  },
};

export default function AdminLayout({ children }: { children: React.ReactNode }) {
  return (
    <DocumentShell lang="en">
      <NextIntlClientProvider locale="en" messages={messages}>
        {children}
      </NextIntlClientProvider>
    </DocumentShell>
  );
}
