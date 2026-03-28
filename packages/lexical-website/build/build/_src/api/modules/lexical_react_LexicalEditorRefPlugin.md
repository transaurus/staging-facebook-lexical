# @lexical/react/LexicalEditorRefPlugin

## Functions

### EditorRefPlugin() {#editorrefplugin}

> **EditorRefPlugin**(`__namedParameters`): `null`

Defined in: [packages/lexical-react/src/LexicalEditorRefPlugin.tsx:21](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalEditorRefPlugin.tsx#L21)

Use this plugin to access the editor instance outside of the
LexicalComposer. This can help with things like buttons or other
UI components that need to update or read EditorState but need to
be positioned outside the LexicalComposer in the React tree.

#### Parameters

##### \_\_namedParameters

###### editorRef

(`instance`) => `void` \| () => `VoidOrUndefinedOnly` \| `RefObject`\<`undefined` \| `null` \| [`LexicalEditor`](lexical.md#lexicaleditor)\>

#### Returns

`null`
