# @lexical/react/LexicalComposer

## Type Aliases

### InitialConfigType {#initialconfigtype}

> **InitialConfigType** = `Readonly`\<\{ `editable?`: `boolean`; `editorState?`: [`InitialEditorStateType`](#initialeditorstatetype); `html?`: [`HTMLConfig`](lexical.md#htmlconfig); `namespace`: `string`; `nodes?`: `ReadonlyArray`\<[`Klass`](lexical.md#klass)\<[`LexicalNode`](lexical.md#lexicalnode)\> \| [`LexicalNodeReplacement`](lexical.md#lexicalnodereplacement)\>; `onError`: (`error`, `editor`) => `void`; `theme?`: [`EditorThemeClasses`](lexical.md#editorthemeclasses); \}\>

Defined in: [packages/lexical-react/src/LexicalComposer.tsx:43](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalComposer.tsx#L43)

***

### InitialEditorStateType {#initialeditorstatetype}

> **InitialEditorStateType** = `null` \| `string` \| [`EditorState`](lexical.md#editorstate) \| (`editor`) => `void`

Defined in: [packages/lexical-react/src/LexicalComposer.tsx:37](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalComposer.tsx#L37)

## Functions

### LexicalComposer() {#lexicalcomposer}

> **LexicalComposer**(`__namedParameters`): `Element`

Defined in: [packages/lexical-react/src/LexicalComposer.tsx:57](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalComposer.tsx#L57)

#### Parameters

##### \_\_namedParameters

`Props`

#### Returns

`Element`
