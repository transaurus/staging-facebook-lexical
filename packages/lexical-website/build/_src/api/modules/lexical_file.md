# @lexical/file

## Interfaces

### SerializedDocument {#serializeddocument}

Defined in: [packages/lexical-file/src/fileImportExport.ts:15](https://github.com/facebook/lexical/tree/main/packages/lexical-file/src/fileImportExport.ts#L15)

#### Properties

##### editorState {#editorstate}

> **editorState**: [`SerializedEditorState`](lexical.md#serializededitorstate)

Defined in: [packages/lexical-file/src/fileImportExport.ts:17](https://github.com/facebook/lexical/tree/main/packages/lexical-file/src/fileImportExport.ts#L17)

The serialized editorState produced by editorState.toJSON()

##### lastSaved {#lastsaved}

> **lastSaved**: `number`

Defined in: [packages/lexical-file/src/fileImportExport.ts:19](https://github.com/facebook/lexical/tree/main/packages/lexical-file/src/fileImportExport.ts#L19)

The time this document was created in epoch milliseconds (Date.now())

##### source {#source}

> **source**: `string`

Defined in: [packages/lexical-file/src/fileImportExport.ts:21](https://github.com/facebook/lexical/tree/main/packages/lexical-file/src/fileImportExport.ts#L21)

The source of the document, defaults to Lexical

##### version {#version}

> **version**: `string`

Defined in: [packages/lexical-file/src/fileImportExport.ts:23](https://github.com/facebook/lexical/tree/main/packages/lexical-file/src/fileImportExport.ts#L23)

The version of Lexical that produced this document

## Functions

### editorStateFromSerializedDocument() {#editorstatefromserializeddocument}

> **editorStateFromSerializedDocument**(`editor`, `maybeStringifiedDocument`): [`EditorState`](lexical.md#editorstate)

Defined in: [packages/lexical-file/src/fileImportExport.ts:54](https://github.com/facebook/lexical/tree/main/packages/lexical-file/src/fileImportExport.ts#L54)

Parse an EditorState from the given editor and document

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

The lexical editor

##### maybeStringifiedDocument

The contents of a .lexical file (as a JSON string, or already parsed)

`string` | [`SerializedDocument`](#serializeddocument)

#### Returns

[`EditorState`](lexical.md#editorstate)

***

### exportFile() {#exportfile}

> **exportFile**(`editor`, `config`): `void`

Defined in: [packages/lexical-file/src/fileImportExport.ts:105](https://github.com/facebook/lexical/tree/main/packages/lexical-file/src/fileImportExport.ts#L105)

Generates a .lexical file to be downloaded by the browser containing the current editor state.

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

The lexical editor.

##### config

`Readonly`\<\{ `fileName?`: `string`; `source?`: `string`; \}\> = `...`

An object that optionally contains fileName and source. fileName defaults to
the current date (as a string) and source defaults to Lexical.

#### Returns

`void`

***

### importFile() {#importfile}

> **importFile**(`editor`): `void`

Defined in: [packages/lexical-file/src/fileImportExport.ts:69](https://github.com/facebook/lexical/tree/main/packages/lexical-file/src/fileImportExport.ts#L69)

Takes a file and inputs its content into the editor state as an input field.

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

The lexical editor.

#### Returns

`void`

***

### serializedDocumentFromEditorState() {#serializeddocumentfromeditorstate}

> **serializedDocumentFromEditorState**(`editorState`, `config`): [`SerializedDocument`](#serializeddocument)

Defined in: [packages/lexical-file/src/fileImportExport.ts:33](https://github.com/facebook/lexical/tree/main/packages/lexical-file/src/fileImportExport.ts#L33)

Generates a SerializedDocument from the given EditorState

#### Parameters

##### editorState

[`EditorState`](lexical.md#editorstate)

the EditorState to serialize

##### config

`Readonly`\<\{ `lastSaved?`: `number`; `source?`: `string`; \}\> = `...`

An object that optionally contains source and lastSaved.
source defaults to Lexical and lastSaved defaults to the current time in
epoch milliseconds.

#### Returns

[`SerializedDocument`](#serializeddocument)
