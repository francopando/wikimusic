"use client";

import { useEffect, useId, useRef, useState } from "react";
import { useTranslations } from "next-intl";

export type ArtistComboboxOption = {
  id: string;
  name: string;
  type?: string | null;
  status?: string | null;
  primary_role?: string | null;
};

export function nextArtistComboboxIndex(current: number, key: "ArrowDown" | "ArrowUp", count: number) {
  if (count <= 0) return 0;
  return key === "ArrowDown" ? Math.min(current + 1, count - 1) : Math.max(current - 1, 0);
}

export default function ArtistCombobox({
  onSelect,
  onCancel,
  initialQuery = "",
  excludedArtistId,
}: {
  onSelect: (artist: ArtistComboboxOption) => void;
  onCancel: () => void;
  initialQuery?: string;
  excludedArtistId?: string;
}) {
  const t = useTranslations("family.search");
  const [query, setQuery] = useState(initialQuery);
  const [results, setResults] = useState<ArtistComboboxOption[]>([]);
  const [active, setActive] = useState(0);
  const [state, setState] = useState<"idle" | "loading" | "error">("idle");
  const listId = useId();
  const inputRef = useRef<HTMLInputElement>(null);

  useEffect(() => inputRef.current?.focus(), []);
  useEffect(() => {
    const controller = new AbortController();
    const timer = window.setTimeout(async () => {
      setState("loading");
      try {
        const response = await fetch(`/api/admin/artists?q=${encodeURIComponent(query)}&limit=20`, { signal: controller.signal });
        const body = await response.json();
        if (!response.ok) throw new Error(body.error ?? "Search failed.");
        setResults((body.artists ?? []).filter((artist: ArtistComboboxOption) => artist.id !== excludedArtistId));
        setActive(0);
        setState("idle");
      } catch (error) {
        if ((error as Error).name !== "AbortError") setState("error");
      }
    }, 180);
    return () => { window.clearTimeout(timer); controller.abort(); };
  }, [query, excludedArtistId]);

  function choose(index: number) {
    const artist = results[index];
    if (artist) onSelect(artist);
  }

  return (
    <div className="rounded-lg border border-gray-200 bg-white p-3 shadow-xl" role="dialog" aria-label={t("dialog")}>
      <label className="block text-xs font-medium text-gray-700" htmlFor={`${listId}-input`}>{t("label")}</label>
      <input
        ref={inputRef}
        id={`${listId}-input`}
        role="combobox"
        aria-autocomplete="list"
        aria-controls={listId}
        aria-expanded="true"
        aria-activedescendant={results[active] ? `${listId}-${results[active].id}` : undefined}
        value={query}
        onChange={(event) => setQuery(event.target.value)}
        onKeyDown={(event) => {
          if (event.key === "ArrowDown") { event.preventDefault(); setActive((value) => nextArtistComboboxIndex(value, "ArrowDown", results.length)); }
          if (event.key === "ArrowUp") { event.preventDefault(); setActive((value) => nextArtistComboboxIndex(value, "ArrowUp", results.length)); }
          if (event.key === "Enter") { event.preventDefault(); choose(active); }
          if (event.key === "Escape") { event.preventDefault(); onCancel(); }
        }}
        className="mt-1 w-full rounded-md border border-gray-300 px-3 py-2 text-sm outline-none focus-visible:ring-2 focus-visible:ring-(--color-flagblue)"
        placeholder={t("placeholder")}
      />
      <div id={listId} role="listbox" className="mt-2 max-h-56 overflow-y-auto">
        {state === "loading" && <p className="px-2 py-3 text-sm text-gray-500">{t("searching")}</p>}
        {state === "error" && <p role="alert" className="px-2 py-3 text-sm text-red-700">{t("error")}</p>}
        {state === "idle" && !results.length && <p className="px-2 py-3 text-sm text-gray-500">{t("empty")}</p>}
        {state === "idle" && results.map((artist, index) => (
          <button
            id={`${listId}-${artist.id}`}
            role="option"
            aria-selected={index === active}
            key={artist.id}
            type="button"
            onMouseDown={(event) => event.preventDefault()}
            onMouseEnter={() => setActive(index)}
            onClick={() => choose(index)}
            className={`block w-full rounded-md px-3 py-2 text-left text-sm focus-visible:outline-2 focus-visible:outline-(--color-flagblue) ${index === active ? "bg-blue-50" : "hover:bg-gray-50"}`}
          >
            <span className="font-medium text-gray-900">{artist.name}</span>
            <span className="ml-2 text-xs text-gray-500">{artist.type || "person"} · {artist.status || "unknown status"}{artist.primary_role ? ` · ${artist.primary_role}` : ""}</span>
          </button>
        ))}
      </div>
      <button type="button" onClick={onCancel} className="mt-2 rounded px-2 py-1 text-xs text-gray-600 focus-visible:outline-2">{t("cancel")}</button>
    </div>
  );
}
