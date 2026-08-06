import { mergeAttributes, Node } from "@tiptap/core";
import type { CommandProps } from "@tiptap/core";
import { NodeSelection } from "@tiptap/pm/state";
import type { ArtistReferenceAttrs } from "@/lib/editorial/tiptap/artistReference";

declare module "@tiptap/core" {
  interface Commands<ReturnType> {
    artistReference: {
      insertArtistReference: (attrs: ArtistReferenceAttrs) => ReturnType;
      updateArtistReference: (attrs: Partial<Omit<ArtistReferenceAttrs, "occurrenceId">>) => ReturnType;
      removeArtistReferencePreservingText: () => ReturnType;
    };
  }
}

function selectedReference({ state }: Pick<CommandProps, "state">) {
  const selection = state.selection;
  return selection instanceof NodeSelection && selection.node.type.name === "artistReference"
    ? selection.node
    : null;
}

export const ArtistReferenceExtension = Node.create({
  name: "artistReference",
  inline: true,
  group: "inline",
  atom: true,
  selectable: true,

  addAttributes() {
    return {
      occurrenceId: { default: null },
      artistId: { default: null },
      displayText: { default: null },
    };
  },

  parseHTML() {
    return [{ tag: 'span[data-editorial-node="artist-reference"]' }];
  },

  renderHTML({ node, HTMLAttributes }) {
    return [
      "span",
      mergeAttributes(HTMLAttributes, {
        "data-editorial-node": "artist-reference",
        class: "editorial-artist-reference",
        title: "Artist reference",
      }),
      String(node.attrs.displayText ?? ""),
    ];
  },

  addCommands() {
    return {
      insertArtistReference:
        (attrs) =>
        ({ commands, state }) => {
          const { from, to } = state.selection;
          return commands.insertContentAt(
            { from, to },
            { type: this.name, attrs },
          );
        },
      updateArtistReference:
        (attrs) =>
        ({ commands }) => commands.updateAttributes(this.name, attrs),
      removeArtistReferencePreservingText:
        () =>
        ({ commands, state }) => {
          const node = selectedReference({ state });
          if (!node) return false;
          const { from } = state.selection;
          return commands.insertContentAt(
            { from, to: from + node.nodeSize },
            { type: "text", text: String(node.attrs.displayText ?? "") },
          );
        },
    };
  },
});
