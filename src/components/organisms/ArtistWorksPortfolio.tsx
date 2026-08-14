import { Fragment } from "react";
import { getArtistWorksPortfolio, summarizePortfolioRoles, type PortfolioRecording } from "@/lib/getArtistWorksPortfolio";
import { formatDurationMilliseconds } from "@/lib/artistPortfolioPresentation";
import { formatRoleName } from "@/lib/roleNameFormatter";
import { normalizeArtistWorkCreditRole } from "@/lib/artistWorkCreditRoles";
import { Link } from "@/i18n/navigation";

type Translator = Awaited<ReturnType<typeof import("next-intl/server").getTranslations>>;

function roleLabel(role: string, t: Translator) {
  const normalized = normalizeArtistWorkCreditRole(role);
  const key = `workRoles.${normalized}` as const;
  return t.has(key) ? t(key) : formatRoleName(role);
}

function versionLabel(recording: PortfolioRecording, workTitle: string, t: Translator) {
  const summary = recording.identitySummary;
  if (summary?.disambiguation_override) return summary.disambiguation_override;
  if (summary?.performance_context) return summary.performance_context;
  if (summary?.derivation_kind) return t(`recordingIdentity.${summary.derivation_kind}`);
  if (summary?.performance_kind && summary.performance_kind !== "studio") return t(`recordingIdentity.${summary.performance_kind}`);
  if (recording.identityLabel) return recording.identityLabel;
  if (recording.title !== workTitle) return recording.title;
  return `${t("recording")}${recording.releaseYear ? ` · ${recording.releaseYear}` : ""}`;
}

function PerformerList({ recording }: { recording: PortfolioRecording }) {
  return <>{recording.performers.map((performer, index) => { const name = performer.creditedAs?.trim() || performer.artistName?.trim(); if (!name) return null; return <Fragment key={`${performer.artistId ?? name}-${index}`}>{performer.artistSlug ? <Link href={`/artists/${performer.artistSlug}`} prefetch={false} className="font-medium text-(--color-flagblue) underline-offset-2 hover:underline">{name}</Link> : <span>{name}</span>}{performer.joinPhrase ? ` ${performer.joinPhrase} ` : index < recording.performers.length - 1 ? ", " : ""}</Fragment>; })}</>;
}

function RecordingRow({ recording, workTitle, t }: { recording: PortfolioRecording; workTitle: string; t: Translator }) {
  const duration = formatDurationMilliseconds(recording.duration);
  const releaseTitle = recording.releaseTitle !== recording.title ? recording.releaseTitle : null;
  const contextualYear = recording.recordingYear ?? (recording.title !== workTitle ? recording.releaseYear : null);
  const hasMetadata = recording.performers.length > 0 || releaseTitle || contextualYear != null || duration;
  return <div className="border-b border-gray-100 py-3 last:border-b-0"><div>{recording.recordingSlug ? <Link href={`/songs/${recording.recordingSlug}`} prefetch={false} aria-label={`${recording.title}: ${versionLabel(recording, workTitle, t)}`} className="font-semibold text-(--color-flagblue) underline-offset-2 hover:underline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-(--color-flagblue)">{versionLabel(recording, workTitle, t)} <span aria-hidden="true">→</span></Link> : <span className="font-semibold text-(--color-flagblue)">{versionLabel(recording, workTitle, t)}</span>}</div>{hasMetadata && <p className="mt-1 text-xs text-gray-500">{recording.performers.length > 0 && <PerformerList recording={recording} />}{recording.performers.length > 0 && (releaseTitle || contextualYear != null || duration) ? " · " : ""}{[releaseTitle, contextualYear, duration].filter((value) => value != null).join(" · ")}</p>}</div>;
}

export default async function ArtistWorksPortfolio({ artistId }: { artistId: string }) {
  const { getTranslations } = await import("next-intl/server");
  const t = await getTranslations("artist");
  const portfolio = await getArtistWorksPortfolio(artistId);
  if (!portfolio.length) return null;
  const linkedWorks = portfolio.filter((item) => item.workId || item.recordings.some((recording) => recording.source === "editorial"));
  const unlinked = portfolio.filter((item) => !linkedWorks.includes(item));
  const roleStats = summarizePortfolioRoles(portfolio);

  return <section className="min-w-0 rounded-xl border border-gray-100 bg-white p-5 shadow-sm sm:p-6">
    <div className="mb-6 border-b border-gray-200 pb-6 text-center"><h3 className="mb-4 text-xs font-normal uppercase text-(--color-wikicrimson)">{t("worksAndCredits")}</h3><div className="mb-4 flex items-baseline justify-center gap-2"><p className="text-xl font-black text-(--color-flagblue)">{linkedWorks.length}</p><p className="text-xl font-medium uppercase tracking-wide text-gray-500">{linkedWorks.length === 1 ? t("work") : t("works")}</p></div><div className="flex flex-wrap items-center justify-center gap-1">{roleStats.map((stat, index) => <div key={stat.role} className="flex items-center gap-1"><span className="text-xs font-medium text-(--color-flagblue)">{roleLabel(stat.role, t)}</span><span className="text-xs text-gray-400">({stat.count})</span>{index < roleStats.length - 1 && <span className="mx-1 text-xs text-gray-300">•</span>}</div>)}</div></div>
    <div className="space-y-5">{linkedWorks.map((work) => <article key={work.id} className="border-b border-gray-100 pb-5 last:border-b-0"><div className="flex flex-wrap items-baseline justify-between gap-2"><h4 className="text-lg font-bold text-(--color-flagblue)">{work.title}</h4><p className="text-sm text-gray-500"><span className="text-gray-400">{t("role")}: </span><b>{work.roles.map((role) => roleLabel(role, t)).join(" • ")}</b></p></div><div className="mt-2">{work.recordings.map((recording) => <RecordingRow key={recording.id} recording={recording} workTitle={work.title} t={t} />)}</div></article>)}</div>
    {unlinked.length > 0 && <div className="mt-6 border-t pt-5"><h4 className="text-xs font-bold uppercase tracking-wide text-gray-500">{t("otherRecordingCredits")}</h4><div className="mt-3 space-y-3">{unlinked.map((item) => <article key={item.id}><p className="mb-2 text-sm text-gray-600"><b>{item.title}</b> · {item.roles.map((role) => roleLabel(role, t)).join(" • ")}</p>{item.recordings.map((recording) => <RecordingRow key={recording.id} recording={recording} workTitle={item.title} t={t} />)}</article>)}</div></div>}
  </section>;
}
