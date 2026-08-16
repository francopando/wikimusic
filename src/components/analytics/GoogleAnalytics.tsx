import Script from "next/script";

const GA_MEASUREMENT_ID_PATTERN = /^G-[A-Z0-9]+$/;

export function getGoogleAnalyticsMeasurementId(
  environment = process.env.NODE_ENV,
  configuredId = process.env.NEXT_PUBLIC_GA_MEASUREMENT_ID,
) {
  if (environment !== "production") return null;

  const measurementId = configuredId?.trim();
  return measurementId && GA_MEASUREMENT_ID_PATTERN.test(measurementId)
    ? measurementId
    : null;
}

export default function GoogleAnalytics() {
  const measurementId = getGoogleAnalyticsMeasurementId();
  if (!measurementId) return null;

  return (
    <>
      <Script
        src={`https://www.googletagmanager.com/gtag/js?id=${encodeURIComponent(measurementId)}`}
        strategy="afterInteractive"
      />
      <Script id="mangulina-google-analytics" strategy="afterInteractive">
        {`
          window.dataLayer = window.dataLayer || [];
          function gtag(){dataLayer.push(arguments);}
          gtag('js', new Date());
          gtag('config', ${JSON.stringify(measurementId)});
        `}
      </Script>
    </>
  );
}
