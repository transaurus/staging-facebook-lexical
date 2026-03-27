# @lexical/headless

## Functions

### createHeadlessEditor() {#createheadlesseditor}

> **createHeadlessEditor**(`editorConfig?`): [`LexicalEditor`](lexical.md#lexicaleditor)

Defined in: [packages/lexical-headless/src/index.ts:19](https://github.com/facebook/lexical/tree/main/packages/lexical-headless/src/index.ts#L19)

Generates a headless editor that allows lexical to be used without the need for a DOM, eg in Node.js.
Throws an error when unsupported methods are used.

#### Parameters

##### editorConfig?

[`CreateEditorArgs`](lexical.md#createeditorargs)

The optional lexical editor configuration.

#### Returns

[`LexicalEditor`](lexical.md#lexicaleditor)

- The configured headless editor.
