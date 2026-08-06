import StarterKit from "@tiptap/starter-kit";
import { ArtistReferenceExtension } from "@/lib/editorial/tiptap/ArtistReferenceExtension";
import { normalizeEditorialLink } from "@/lib/editorial/links";

export const editorialTiptapExtensions = [
  StarterKit.configure({
    code: false,
    codeBlock: false,
    dropcursor: false,
    gapcursor: false,
    heading: { levels: [2, 3, 4] },
    link: {
      autolink: true,
      defaultProtocol: "https",
      openOnClick: false,
      enableClickSelection: true,
      HTMLAttributes: { rel: "noopener noreferrer", target: "_blank" },
      isAllowedUri: (url) => normalizeEditorialLink(url) !== null,
    },
    strike: false,
    trailingNode: false,
    underline: false,
  }),
  ArtistReferenceExtension,
];
