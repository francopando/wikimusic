import "./globals.css";
import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Dominican Music Database",
  description: "Explore artists and songs with lyrics, translations, and cultural notes.",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className="min-h-screen bg-neutral-50 text-neutral-900">
        {children}
      </body>
    </html>
  );
}
