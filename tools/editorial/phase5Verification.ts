import "dotenv/config";
import pg from "pg";
import { isDeepStrictEqual } from "node:util";
import { buildEditorialIntegrityReport } from "../../src/lib/editorial/integrity";

const connectionString = process.env.DATABASE_URL;
if (!connectionString) throw new Error("DATABASE_URL is required.");
const client = new pg.Client({ connectionString, ssl: { rejectUnauthorized: false } });
const owner = "00000000-0000-4000-8000-202608050501";
const target = "00000000-0000-4000-8000-202608050502";
const replacement = "00000000-0000-4000-8000-202608050503";
const occurrence = "50000000-0000-4000-8000-202608050501";

async function fingerprint() {
  return (await client.query(`select
    (select count(*)::integer from public.artists) artists,
    (select count(*)::integer from public.editorial_documents) documents,
    (select count(*)::integer from public.editorial_entity_references) references,
    (select encode(digest(coalesce(string_agg(id::text || document::text || revision::text, '' order by id),''),'sha256'),'hex') from public.editorial_documents) document_hash,
    (select encode(digest(coalesce(string_agg(editorial_document_id::text || occurrence_id::text || coalesce(target_artist_id::text,''), '' order by id),''),'sha256'),'hex') from public.editorial_entity_references) reference_hash`)).rows[0];
}

await client.connect();
try {
  const before = await fingerprint();
  const documents = await client.query("select id,document_type,owner_artist_id,locale,schema_version,document,status from public.editorial_documents");
  const relations = await client.query("select editorial_document_id,occurrence_id,entity_type,target_artist_id from public.editorial_entity_references");
  const artists = await client.query("select id,name,slug,status,bio_en,bio_es from public.artists");
  const report = buildEditorialIntegrityReport({ documents: documents.rows, relations: relations.rows, artists: artists.rows });
  const plans = {
    reverseLookup: (await client.query("explain (format json) select editorial_document_id,occurrence_id from public.editorial_entity_references where target_artist_id=$1", [target])).rows[0]["QUERY PLAN"],
    documentLookup: (await client.query("explain (format json) select id from public.editorial_documents where document_type='artist_biography' and owner_artist_id=$1 and locale='en'", [owner])).rows[0]["QUERY PLAN"],
  };
  await client.query("BEGIN");
  try {
    await client.query("insert into public.artists(id,name,slug,status,type) values($1,'__CODEX_PHASE5_OWNER__','codex-phase5-owner','published','solo_artist'),($2,'__CODEX_PHASE5_TARGET__','codex-phase5-target','published','solo_artist'),($3,'__CODEX_PHASE5_REPLACEMENT__','codex-phase5-replacement','published','solo_artist')", [owner,target,replacement]);
    const originalDocument = { type: "doc", content: [{ type: "paragraph", content: [{ type: "text", text: "Worked with " }, { type: "artistReference", attrs: { occurrenceId: occurrence, artistId: target, displayText: "Saved Target Wording" } }, { type: "text", text: "." }] }] };
    const saved = await client.query("select * from public.upsert_editorial_document('artist_biography',$1,'en',1,'published',$2::jsonb,0)", [owner,JSON.stringify(originalDocument)]);
    const documentId = saved.rows[0].id;
    await client.query("update public.artists set name='__RENAMED_TARGET__',slug='codex-phase5-renamed-target' where id=$1", [target]);
    const afterRename = await client.query("select document,revision from public.editorial_documents where id=$1", [documentId]);
    const relationAfterRename = await client.query("select occurrence_id,target_artist_id from public.editorial_entity_references where editorial_document_id=$1", [documentId]);
    await client.query("update public.artists set status='hidden' where id=$1", [target]);
    const hiddenStatus = (await client.query("select status from public.artists where id=$1", [target])).rows[0].status;
    await client.query("update public.artists set status='published' where id=$1", [target]);
    let deleteRestricted = false;
    await client.query("SAVEPOINT before_delete");
    try { await client.query("delete from public.artists where id=$1", [target]); }
    catch (error) { deleteRestricted = error instanceof Error && "code" in error && error.code === "23503"; await client.query("ROLLBACK TO SAVEPOINT before_delete"); }
    const mergedDocument = structuredClone(originalDocument); mergedDocument.content[0].content[1].attrs.artistId = replacement;
    await client.query("select * from public.upsert_editorial_document('artist_biography',$1,'en',1,'published',$2::jsonb,1)", [owner,JSON.stringify(mergedDocument)]);
    const mergedRelation = (await client.query("select occurrence_id,target_artist_id from public.editorial_entity_references where editorial_document_id=$1", [documentId])).rows[0];
    console.log(JSON.stringify({ integrity: report.counts, lifecycle: { documentUnchangedAfterRename: isDeepStrictEqual(afterRename.rows[0].document, originalDocument), revisionUnchangedAfterRename: afterRename.rows[0].revision === 1, relationUnchangedAfterRename: relationAfterRename.rows[0].target_artist_id === target, occurrencePreservedAfterRename: relationAfterRename.rows[0].occurrence_id === occurrence, hiddenStatus, deleteRestricted, mergeTargetReassigned: mergedRelation.target_artist_id === replacement, mergeOccurrencePreserved: mergedRelation.occurrence_id === occurrence }, plans }, null, 2));
  } finally { await client.query("ROLLBACK"); }
  const after = await fingerprint();
  if (JSON.stringify(before) !== JSON.stringify(after)) throw new Error("Phase 5 transaction left production state changes.");
  console.log(JSON.stringify({ productionUnchanged: true, before, after }, null, 2));
} finally { await client.end(); }
