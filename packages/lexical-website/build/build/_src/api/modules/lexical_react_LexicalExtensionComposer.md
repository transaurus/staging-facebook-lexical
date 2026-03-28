# @lexical/react/LexicalExtensionComposer

## Interfaces

### LexicalExtensionComposerProps {#lexicalextensioncomposerprops}

Defined in: [packages/lexical-react/src/LexicalExtensionComposer.tsx:17](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalExtensionComposer.tsx#L17)

#### Properties

##### children? {#children}

> `optional` **children**: `ReactNode`

Defined in: [packages/lexical-react/src/LexicalExtensionComposer.tsx:25](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalExtensionComposer.tsx#L25)

Any children will have access to useLexicalComposerContext (e.g. for React plug-ins or UX)

##### contentEditable? {#contenteditable}

> `optional` **contentEditable**: `null` \| `Element`

Defined in: [packages/lexical-react/src/LexicalExtensionComposer.tsx:32](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalExtensionComposer.tsx#L32)

Override the default ContentEditable that is rendered as the first child of the
composer. If this is null, then it is your responsibility to render a ContentEditable
elsewhere in the tree. This is equivalent to
`configExtension(ReactExtension, {contentEditable})` in your extension dependencies.

##### extension {#extension}

> **extension**: [`AnyLexicalExtensionArgument`](lexical.md#anylexicalextensionargument)

Defined in: [packages/lexical-react/src/LexicalExtensionComposer.tsx:21](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalExtensionComposer.tsx#L21)

Your root extension, typically defined with defineExtension

## Functions

### LexicalExtensionComposer() {#lexicalextensioncomposer}

> **LexicalExtensionComposer**(`__namedParameters`): `Element`

Defined in: [packages/lexical-react/src/LexicalExtensionComposer.tsx:84](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalExtensionComposer.tsx#L84)

The equivalent of LexicalComposer for an extension. Make sure that your extension
argument is stable (e.g. using module scope or useMemo) so
that you are not re-creating the editor on every render!

#### Parameters

##### \_\_namedParameters

[`LexicalExtensionComposerProps`](#lexicalextensioncomposerprops)

#### Returns

`Element`

#### Examples

Module scoped extension
```tsx
const extension = defineExtension({
  name: "[root]",
  dependencies: [RichTextExtension, HistoryExtension, EmojiExtension]
});
function MyEditor({ children }) {
  return (<LexicalExtensionComposer extension={extension}>{children}</LexicalExtensionComposer>);
}
```

useMemo extension
```tsx
function MyEditor({ emojiBaseUrl, children }) {
  const extension = useMemo(() => {
    return defineExtension({
      name: "[root]",
      dependencies: [
        RichTextExtension,
        HistoryExtension,
        configExtension(EmojiExtension, { emojiBaseUrl }),
      ],
    });
  }, [emojiBaseUrl]);
  return (<LexicalExtensionComposer extension={extension}>{children}</LexicalExtensionComposer>);
}
```

Incorrect usage with unstable extension
```tsx
function MyBrokenEditor({ emojiBaseUrl }) {
  // This argument is not stable, the editor is re-created every render and
  // all state is lost!
  const extension = defineExtension({
    name: "[root]",
    dependencies: [RichTextExtension, HistoryExtension, EmojiExtension]
  });
  return (<LexicalExtensionComposer extension={extension}>{children}</LexicalExtensionComposer>);
}
```
