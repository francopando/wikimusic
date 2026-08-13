export type AssertionVerificationStatus = "unverified" | "under_review" | "verified" | "disputed" | "rejected" | "superseded";
export type CanonicalResolutionStatus = "unresolved" | "accepted" | "disputed" | "withheld" | "superseded";
export type EvidenceRelationship = "supports" | "disputes" | "contextualizes";
export type SourceVisibility = "public" | "internal" | "restricted";
export type EditorialActorType = "human_editor" | "system_import" | "migration" | "service_process";
export type EditorialCaseStatus = "open" | "triage" | "under_review" | "blocked" | "resolved" | "closed";
export type EditorialIsrcFinding = "probable_duplicate_recording" | "different_recordings_shared_isrc" | "insufficient_evidence";
export type CreditScope = "work" | "recording" | "release" | "track";
export type CreditRoleFamily = "composition" | "performance" | "production" | "arrangement" | "engineering" | "direction";
export interface CreditRole { id:string; code:string; display_name_en:string; display_name_es:string; description:string; role_family:CreditRoleFamily; normal_scope:CreditScope; status:"active"|"deprecated"; display_order:number; metadata:Record<string,unknown>; }

export interface EditorialSource { id:string; source_type:string; title:string; organization:string|null; author:string|null; publication_date:string|null; url:string|null; archive_reference:string|null; citation_text:string|null; language:string|null; visibility:SourceVisibility; status:"active"|"deprecated"|"withdrawn"; rights_notes:string|null; internal_notes:string|null; public_notes:string|null; metadata:Record<string,unknown>; created_by:string|null; created_at:string; updated_at:string; }
export interface EditorialAssertion { id:string; assertion_type:string; predicate:string; asserted_value:Record<string,unknown>; verification_status:AssertionVerificationStatus; canonical_status:CanonicalResolutionStatus; internal_notes:string|null; public_notes:string|null; metadata:Record<string,unknown>; created_by:string|null; reviewed_by:string|null; reviewed_at:string|null; supersedes_assertion_id:string|null; created_at:string; }
export interface EditorialDecision { id:string; decision_type:string; status:"requested"|"approved"|"rejected"|"executed"|"reversed"|"cancelled"; reason:string; requested_by:string|null; approved_by:string|null; decided_by:string|null; requires_independent_approval:boolean; previous_canonical_state:Record<string,unknown>|null; resulting_canonical_state:Record<string,unknown>|null; metadata:Record<string,unknown>; requested_at:string; decided_at:string|null; }
export interface EditorialCase { id:string; case_type:string; status:EditorialCaseStatus; priority:"low"|"normal"|"high"|"urgent"; title:string; summary:string|null; assigned_to:string|null; opened_by:string|null; resolved_by:string|null; resolution:string|null; opened_at:string; resolved_at:string|null; }
