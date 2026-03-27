# @lexical/react/LexicalExtensionEditorComposer

## Interfaces

### LexicalExtensionEditorComposerProps {#lexicalextensioneditorcomposerprops}

Defined in: [packages/lexical-react/src/LexicalExtensionEditorComposer.tsx:13](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalExtensionEditorComposer.tsx#L13)

#### Properties

##### children? {#children}

> `optional` **children**: `ReactNode`

Defined in: [packages/lexical-react/src/LexicalExtensionEditorComposer.tsx:21](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalExtensionEditorComposer.tsx#L21)

Any children will have access to useLexicalComposerContext (e.g. for React plug-ins or UX)

##### initialEditor {#initialeditor}

> **initialEditor**: [`LexicalEditorWithDispose`](lexical.md#lexicaleditorwithdispose)

Defined in: [packages/lexical-react/src/LexicalExtensionEditorComposer.tsx:17](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalExtensionEditorComposer.tsx#L17)

Your root extension, typically defined with defineExtension

## Functions

### LexicalExtensionEditorComposer() {#lexicalextensioneditorcomposer}

> **LexicalExtensionEditorComposer**(`__namedParameters`): `Element`

Defined in: [packages/lexical-react/src/LexicalExtensionEditorComposer.tsx:32](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalExtensionEditorComposer.tsx#L32)

The equivalent of LexicalComposer for an editor that was already built for
extensions, typically used with nested editors.

Make sure that your initialEditor argument is stable (e.g. using module scope or useMemo) so
that you are not re-creating the editor on every render! The editor should be built with
ReactProviderExtension and ReactExtension dependencies.

#### Parameters

##### \_\_namedParameters

[`LexicalExtensionEditorComposerProps`](#lexicalextensioneditorcomposerprops)

#### Returns

`Element`
