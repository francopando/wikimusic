"use client";

import { useEffect, useState } from "react";
import { useSearchParams } from "next/navigation";
import { AdminSearchPicker, type PickerOption } from "@/components/admin/CatalogAdminControls";
import { createClientUuid } from "@/lib/clientUuid";
import { readApiJson } from "@/lib/clientApiResponse";

const input = "w-full rounded-lg border px-3 py-2";
type Profile = { id: string; preferred_name: string; country: string | null; country_code: string | null; birth_place: string | null; occupations: string[]; editorial_notes: string | null; status: string; has_image: boolean; image_updated_at: string | null };

export default function ExternalContributorsPage() {
  const searchParams = useSearchParams();
  const [id, setId] = useState(""); const [name, setName] = useState(""); const [country, setCountry] = useState(""); const [code, setCode] = useState(""); const [birthPlace, setBirthPlace] = useState(""); const [occupations, setOccupations] = useState(""); const [notes, setNotes] = useState(""); const [status, setStatus] = useState("draft"); const [imageState, setImageState] = useState(""); const [message, setMessage] = useState("");
  function clear() { setId(""); setName(""); setCountry(""); setCode(""); setBirthPlace(""); setOccupations(""); setNotes(""); setStatus("draft"); setImageState(""); }
  async function open(option: PickerOption) {
    const response = await fetch(`/api/admin/external-contributors?id=${option.id}`); const payload = await response.json(); const p = payload.external_contributors?.[0] as Profile | undefined;
    if (!p) { setMessage(payload.error ?? "Profile unavailable"); return; }
    setId(p.id); setName(p.preferred_name); setCountry(p.country ?? ""); setCode(p.country_code ?? ""); setBirthPlace(p.birth_place ?? ""); setOccupations((p.occupations ?? []).join(", ")); setNotes(p.editorial_notes ?? ""); setStatus(p.status); setImageState(p.has_image ? `Image updated ${p.image_updated_at ?? "previously"}` : "No image");
  }
  useEffect(() => { const selected = searchParams.get("id"); const timer = window.setTimeout(() => { if (selected) void open({ id: selected }); }, 0); return () => window.clearTimeout(timer); }, [searchParams]);
  async function save() {
    const response = await fetch("/api/admin/external-contributors", { method: "POST", headers: { "Content-Type": "application/json" }, body: JSON.stringify({ id: id || null, idempotencyKey: createClientUuid(), preferredName: name, country, countryCode: code, birthPlace, occupations: occupations.split(",").map((x) => x.trim()).filter(Boolean), editorialNotes: notes, entityType: "person" }) });
    const payload = await response.json(); if (payload.result?.external_contributor_id) setId(payload.result.external_contributor_id); setMessage(response.ok ? "Saved" : payload.error);
  }
  async function uploadImage(file: File) {
    if (!id) return; const form = new FormData(); form.set("target", "externalContributor"); form.set("entityId", id); form.set("file", file);
    const response = await fetch("/api/admin/image-upload", { method: "POST", body: form }); const payload = await readApiJson<{ ok: boolean; error?: string; imageUpdatedAt?: string }>(response, "Image upload endpoint"); setMessage(response.ok && payload.ok ? "Image uploaded" : payload.error ?? response.statusText); if (response.ok && payload.ok) setImageState(`Image updated ${payload.imageUpdatedAt}`);
  }
  return <main className="mx-auto max-w-3xl space-y-5 px-5 py-8"><header><h1 className="text-3xl font-black text-(--color-flagblue)">External Contributors</h1><p className="mt-2 text-sm text-gray-600">Canonical internal identities for non-Dominican participation. They are not Mangulina Artists.</p></header><AdminSearchPicker label="Search external contributors" value={id} displayValue={name} placeholder="Search name…" endpoint="/api/admin/external-contributors" resultKey="external_contributors" onSelect={open} onClear={clear} /><section className="space-y-3 rounded-xl border bg-white p-5"><div className="flex items-center justify-between"><h2 className="font-bold">Identity</h2><span className="text-xs uppercase text-gray-500">{status}</span></div><input required className={input} value={name} onChange={(e) => setName(e.target.value)} placeholder="Preferred name *" /><div className="grid gap-3 sm:grid-cols-2"><input className={input} value={country} onChange={(e) => setCountry(e.target.value)} placeholder="Country" /><input className={input} value={code} onChange={(e) => setCode(e.target.value)} placeholder="Country code" maxLength={2} /></div><input className={input} value={birthPlace} onChange={(e) => setBirthPlace(e.target.value)} placeholder="Birth place" /><input className={input} value={occupations} onChange={(e) => setOccupations(e.target.value)} placeholder="Occupations, comma separated" /><textarea className={input} value={notes} onChange={(e) => setNotes(e.target.value)} placeholder="Internal editorial notes" /><button disabled={!name.trim()} onClick={save} className="rounded-lg bg-(--color-flagblue) px-4 py-2 text-white disabled:opacity-50">{id ? "Update profile" : "Create governed contributor"}</button></section><section className="space-y-2 rounded-xl border bg-white p-5"><h2 className="font-bold">Internal image</h2><p className="text-sm text-gray-500">{id ? imageState : "Save the identity before uploading an image."}</p><input type="file" accept="image/jpeg,image/png,image/webp" disabled={!id} onChange={(e) => { const file = e.target.files?.[0]; if (file) void uploadImage(file); }} /></section><section className="rounded-xl border bg-white p-5"><h2 className="font-bold">Evidence, credits, and history</h2><p className="mt-2 text-sm text-gray-500">Identity evidence and audit history are preserved by governed workflows. Canonical Work and Recording Credits remain linked by this contributor UUID.</p></section>{message && <p role="status">{message}</p>}</main>;
}
