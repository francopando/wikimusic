import type { EditorialDocumentV1 } from "../../src/types/editorialDocument";

export const OWNER_ARTIST_ID = "018f5af2-4d7b-42f8-8f44-c6ef3ecbd0dc";
export const TARGET_ARTIST_ID = "13d63640-f73e-46ae-80a3-94e720b7d76b";

/** Development/test-only draft fixture; it is never inserted or read by production code. */
export const artistBiographyFixture: EditorialDocumentV1 = {
  type: "doc",
  content: [
    {
      type: "paragraph",
      content: [
        { type: "text", text: "Una colaboración con ", marks: [{ type: "italic" }] },
        { type: "artistReference", attrs: { occurrenceId: "4df29df6-4b57-45a2-8514-b379c45854e4", artistId: TARGET_ARTIST_ID, displayText: "Fernando Villalona" } },
        { type: "text", text: " marcó esta etapa." },
      ],
    },
    {
      type: "paragraph",
      content: [
        { type: "text", text: "Después volvió a trabajar con ", marks: [{ type: "bold" }] },
        { type: "artistReference", attrs: { occurrenceId: "7c48b1d8-e21f-4f39-af70-ce730be6d6d8", artistId: TARGET_ARTIST_ID, displayText: "Villalona" } },
        { type: "text", text: "." },
      ],
    },
  ],
};

