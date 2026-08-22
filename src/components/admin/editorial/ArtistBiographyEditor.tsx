"use client";

import { useCallback, useEffect, useRef, useState } from "react";
import EditorialDocumentEditor from "@/components/admin/editorial/EditorialDocumentEditor";
import type { AdminEditorialDocumentState, AdminEditorialLoadResult } from "@/lib/editorial/adminClient";
import type { EditorialLocale } from "@/types/editorialDocument";
import { readApiJson } from "@/lib/clientApiResponse";

export default function ArtistBiographyEditor({ artistId, artistName, onDirtyChange }: { artistId: string; artistName: string; onDirtyChange: (dirty: boolean) => void }) {
  const [locale, setLocale] = useState<EditorialLocale>("en");
  const [documents, setDocuments] = useState<Partial<Record<EditorialLocale, AdminEditorialDocumentState | null>>>({});
  const [loaded, setLoaded] = useState<Partial<Record<EditorialLocale, boolean>>>({});
  const [dirty, setDirty] = useState<Record<EditorialLocale, boolean>>({ en: false, es: false });
  const dirtyRef = useRef(dirty);
  const [error, setError] = useState("");
  // Held in state, not a ref, so the child re-renders once the node exists.
  const [actionsSlot, setActionsSlot] = useState<HTMLDivElement | null>(null);

  const load = useCallback(async (target: EditorialLocale) => {
    setError("");
    const response = await fetch(`/api/admin/editorial-documents?ownerArtistId=${encodeURIComponent(artistId)}&documentType=artist_biography&locale=${target}`);
    const result = await readApiJson<AdminEditorialLoadResult>(response, `Editorial document (${target}) endpoint`);
    if (!response.ok || !result.ok) { setError("error" in result ? result.error : "Unable to load structured biography."); return; }
    setDocuments((current) => ({ ...current, [target]: result.exists ? result.document : null }));
    setLoaded((current) => ({ ...current, [target]: true }));
  }, [artistId]);

  useEffect(() => {
    const timer = window.setTimeout(() => { void Promise.all([load("en"), load("es")]); }, 0);
    return () => window.clearTimeout(timer);
  }, [load]);

  function updateDirty(target: EditorialLocale, value: boolean) {
    const next = { ...dirtyRef.current, [target]: value };
    dirtyRef.current = next;
    setDirty(next);
    onDirtyChange(next.en || next.es);
  }

  function switchLocale(next: EditorialLocale) {
    if (dirty[locale] && !window.confirm("This biography has unsaved changes. Switch language without saving?")) return;
    setLocale(next);
  }

  return (
    <section className="rounded-xl border-2 border-blue-100 bg-blue-50/30 p-4" aria-labelledby="structured-biography-title">
      <div className="mb-4"><p className="text-[10px] uppercase tracking-[0.18em] text-blue-700">Authoritative biography</p><h2 id="structured-biography-title" className="mt-1 text-lg font-semibold text-gray-900">Structured biography for {artistName}</h2><p className="mt-1 text-sm text-gray-600">Structured documents are authoritative. Legacy locale columns are frozen compatibility snapshots and cannot be edited here.</p></div>
      <div className="mb-3 flex flex-wrap items-center justify-between gap-2">
        <div role="tablist" aria-label="Biography language" className="flex gap-2">{(["en", "es"] as const).map((value) => <button key={value} type="button" role="tab" aria-selected={locale === value} onClick={() => switchLocale(value)} className={`rounded px-4 py-2 text-sm font-medium focus-visible:outline-2 focus-visible:outline-(--color-flagblue) ${locale === value ? "bg-(--color-flagblue) text-white" : "border bg-white text-gray-700"}`}>{value === "en" ? "English" : "Spanish"}{dirty[value] ? " •" : ""}</button>)}</div>
        {/* Save draft / Publish for the active locale portal in here, so they sit
            on the language-tab row instead of the editor footer. */}
        <div ref={setActionsSlot} className="flex flex-wrap items-center gap-2"/>
      </div>
      {error && <p role="alert" className="rounded border border-red-200 bg-red-50 p-3 text-sm text-red-800">{error}</p>}
      {(["en", "es"] as const).map((value) => <div key={`${artistId}:${value}:${documents[value]?.revision ?? 0}`} role="tabpanel" hidden={locale !== value}>{loaded[value] ? <EditorialDocumentEditor ownerArtistId={artistId} locale={value} initial={documents[value] ?? null} onDirtyChange={(next) => updateDirty(value, next)} onReloadRequested={() => load(value)} actionsSlot={locale === value ? actionsSlot : null}/> : <p className="p-4 text-sm text-gray-500">Loading {value === "en" ? "English" : "Spanish"} biography…</p>}</div>)}
    </section>
  );
}
