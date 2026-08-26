"use client";

import { useCallback, useEffect, useState } from "react";
import { useTranslations } from "next-intl";
import ArtistCombobox, { type ArtistComboboxOption } from "@/components/admin/ArtistCombobox";
import type { FamilyEditorLabel, FamilyRelationshipItem } from "@/lib/artistFamilyRelationships";

const labelKeys: FamilyEditorLabel[] = ["father","mother","parent","son","daughter","child","brother","sister","sibling","cousin","husband","wife","spouse","ex_husband","ex_wife","ex_spouse","widow_of","widower_of","grandfather","grandmother","grandparent","grandson","granddaughter","grandchild","uncle","aunt","nephew","niece","great_uncle","great_aunt","great_nephew","great_niece"];

// Presentation-only keys have no entry in the editor dropdown, so map each one
// back to the label an editor would have picked.
function editableLabel(item: FamilyRelationshipItem): FamilyEditorLabel {
  if (item.labelKey === "late_husband" || item.labelKey === "late_wife") return "widow_of";
  if (item.labelKey === "great_uncle_aunt") return "great_uncle";
  if (item.labelKey === "great_nibling") return "great_nephew";
  if (item.labelKey === "male_cousin" || item.labelKey === "female_cousin") return "cousin";
  if (item.labelKey === "uncle_aunt") return "uncle";
  if (item.labelKey === "nibling") return "nephew";
  return item.labelKey;
}

export default function ArtistFamilyRelationshipsManager({ artistId }: { artistId: string }) {
  const t = useTranslations("family");
  const [items,setItems] = useState<FamilyRelationshipItem[]>([]);
  const [selected,setSelected] = useState<ArtistComboboxOption|null>(null);
  const [label,setLabel] = useState<FamilyEditorLabel>("parent");
  const [editingId,setEditingId] = useState("");
  const [searchOpen,setSearchOpen] = useState(false);
  const [busy,setBusy] = useState(false);
  const [message,setMessage] = useState("");
  const load = useCallback(async () => { const response=await fetch(`/api/admin/artist-family-relationships?artistId=${encodeURIComponent(artistId)}`); const body=await response.json(); if(response.ok&&body.ok)setItems(body.relationships??[]); else setMessage(body.error??t("loadError")); },[artistId,t]);
  useEffect(()=>{
    // Fetch completion, rather than the effect body, performs the state update.
    const timer = window.setTimeout(() => void load(), 0);
    return () => window.clearTimeout(timer);
  },[load]);
  function reset(){setSelected(null);setLabel("parent");setEditingId("");setSearchOpen(false);}
  async function save(){ if(!selected)return setMessage(t("chooseArtist")); setBusy(true);setMessage(""); const response=await fetch("/api/admin/artist-family-relationships",{method:"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify({relationshipId:editingId||null,artistId,relatedArtistId:selected.id,relationshipLabel:label})});const body=await response.json();if(response.ok&&body.ok){reset();await load();setMessage(t(editingId?"updated":"added"));}else setMessage(body.error??t("saveError"));setBusy(false); }
  async function remove(item:FamilyRelationshipItem){if(!window.confirm(t("confirmDelete",{name:item.relatedArtist.name})))return;setBusy(true);const response=await fetch("/api/admin/artist-family-relationships",{method:"DELETE",headers:{"Content-Type":"application/json"},body:JSON.stringify({relationshipId:item.id,artistId})});const body=await response.json();if(response.ok&&body.ok){if(editingId===item.id)reset();await load();}else setMessage(body.error??t("deleteError"));setBusy(false);}
  return <details className="rounded-xl border border-gray-100 bg-white p-5 shadow-sm" open>
    <summary className="cursor-pointer text-xs uppercase tracking-[0.2em] text-(--color-wikicrimson)">{t("relationships")} ({items.length})</summary>
    <div className="mt-5 space-y-4">
      {items.length ? <div className="divide-y rounded-lg border border-gray-100">{items.map(item=><div key={item.id} className="flex items-center justify-between gap-3 p-3"><div><p className="text-sm font-medium text-(--color-flagblue)">{item.relatedArtist.name}</p><p className="text-xs text-gray-500">{t(`labels.${item.labelKey}`)}</p></div><div className="flex gap-2"><button type="button" className="rounded border px-2 py-1 text-xs" onClick={()=>{setEditingId(item.id);setSelected({id:item.relatedArtist.id,name:item.relatedArtist.name});setLabel(editableLabel(item));}}>{t("edit")}</button><button type="button" className="rounded border border-red-100 px-2 py-1 text-xs text-red-700" onClick={()=>void remove(item)}>{t("delete")}</button></div></div>)}</div>:<p className="text-sm text-gray-400">{t("empty")}</p>}
      <div className="rounded-lg border border-gray-100 bg-gray-50 p-4"><p className="mb-3 text-[10px] uppercase tracking-[0.18em] text-gray-400">{t(editingId?"editRelationship":"addRelationship")}</p>
        {selected?<div className="mb-3 flex items-center justify-between rounded-md border bg-white px-3 py-2"><span className="text-sm font-medium">{selected.name}</span><button type="button" className="text-xs text-red-700" onClick={()=>setSelected(null)}>{t("changeArtist")}</button></div>:searchOpen?<ArtistCombobox excludedArtistId={artistId} onSelect={(artist)=>{setSelected(artist);setSearchOpen(false);}} onCancel={()=>setSearchOpen(false)}/>:<button type="button" className="mb-3 w-full rounded-md border bg-white px-3 py-2 text-left text-sm" onClick={()=>setSearchOpen(true)}>{t("searchArtist")}</button>}
        <select className="w-full rounded-md border border-gray-300 bg-white px-3 py-2 text-sm" value={label} onChange={e=>setLabel(e.target.value as FamilyEditorLabel)}>{labelKeys.map(key=><option key={key} value={key}>{t(`labels.${key}`)}</option>)}</select>
        <div className="mt-3 flex gap-2"><button type="button" disabled={busy||!selected} onClick={()=>void save()} className="flex-1 rounded-lg bg-(--color-flagblue) px-4 py-2 text-xs uppercase tracking-wider text-white disabled:opacity-40">{t(editingId?"update":"add")}</button>{editingId&&<button type="button" onClick={reset} className="rounded-lg border px-4 py-2 text-xs">{t("cancel")}</button>}</div>
      </div>{message&&<p role="status" className="text-sm text-gray-600">{message}</p>}
    </div>
  </details>;
}
