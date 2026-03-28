# @lexical/clipboard

## Interfaces

### LexicalClipboardData {#lexicalclipboarddata}

Defined in: [packages/lexical-clipboard/src/clipboard.ts:37](https://github.com/facebook/lexical/tree/main/packages/lexical-clipboard/src/clipboard.ts#L37)

#### Properties

##### application/x-lexical-editor? {#applicationx-lexical-editor}

> `optional` **application/x-lexical-editor**: `string`

Defined in: [packages/lexical-clipboard/src/clipboard.ts:39](https://github.com/facebook/lexical/tree/main/packages/lexical-clipboard/src/clipboard.ts#L39)

##### text/html? {#texthtml}

> `optional` **text/html**: `string`

Defined in: [packages/lexical-clipboard/src/clipboard.ts:38](https://github.com/facebook/lexical/tree/main/packages/lexical-clipboard/src/clipboard.ts#L38)

##### text/plain {#textplain}

> **text/plain**: `string`

Defined in: [packages/lexical-clipboard/src/clipboard.ts:40](https://github.com/facebook/lexical/tree/main/packages/lexical-clipboard/src/clipboard.ts#L40)

## Functions

### $generateJSONFromSelectedNodes() {#generatejsonfromselectednodes}

> **$generateJSONFromSelectedNodes**\<`SerializedNode`\>(`editor`, `selection`): `object`

Defined in: [packages/lexical-clipboard/src/clipboard.ts:375](https://github.com/facebook/lexical/tree/main/packages/lexical-clipboard/src/clipboard.ts#L375)

Gets the Lexical JSON of the nodes inside the provided Selection.

#### Type Parameters

##### SerializedNode

`SerializedNode` *extends* `BaseSerializedNode`

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

LexicalEditor to get the JSON content from.

##### selection

Selection to get the JSON content from.

`null` | [`BaseSelection`](lexical.md#baseselection)

#### Returns

`object`

an object with the editor namespace and a list of serializable nodes as JavaScript objects.

##### namespace

> **namespace**: `string`

##### nodes

> **nodes**: `SerializedNode`[]

***

### $generateNodesFromSerializedNodes() {#generatenodesfromserializednodes}

> **$generateNodesFromSerializedNodes**(`serializedNodes`): [`LexicalNode`](lexical.md#lexicalnode)[]

Defined in: [packages/lexical-clipboard/src/clipboard.ts:405](https://github.com/facebook/lexical/tree/main/packages/lexical-clipboard/src/clipboard.ts#L405)

This method takes an array of objects conforming to the BaseSerializedNode interface and returns
an Array containing instances of the corresponding LexicalNode classes registered on the editor.
Normally, you'd get an Array of BaseSerialized nodes from [$generateJSONFromSelectedNodes](#generatejsonfromselectednodes)

#### Parameters

##### serializedNodes

`BaseSerializedNode`[]

an Array of objects conforming to the BaseSerializedNode interface.

#### Returns

[`LexicalNode`](lexical.md#lexicalnode)[]

an Array of Lexical Node objects.

***

### $getClipboardDataFromSelection() {#getclipboarddatafromselection}

> **$getClipboardDataFromSelection**(`selection`): [`LexicalClipboardData`](#lexicalclipboarddata)

Defined in: [packages/lexical-clipboard/src/clipboard.ts:548](https://github.com/facebook/lexical/tree/main/packages/lexical-clipboard/src/clipboard.ts#L548)

Serialize the content of the current selection to strings in
text/plain, text/html, and application/x-lexical-editor (Lexical JSON)
formats (as available).

#### Parameters

##### selection

the selection to serialize (defaults to $getSelection())

`null` | [`BaseSelection`](lexical.md#baseselection)

#### Returns

[`LexicalClipboardData`](#lexicalclipboarddata)

LexicalClipboardData

***

### $getHtmlContent() {#gethtmlcontent}

> **$getHtmlContent**(`editor`, `selection`): `string`

Defined in: [packages/lexical-clipboard/src/clipboard.ts:53](https://github.com/facebook/lexical/tree/main/packages/lexical-clipboard/src/clipboard.ts#L53)

Returns the *currently selected* Lexical content as an HTML string, relying on the
logic defined in the exportDOM methods on the LexicalNode classes. Note that
this will not return the HTML content of the entire editor (unless all the content is included
in the current selection).

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

LexicalEditor instance to get HTML content from

##### selection

The selection to use (default is $getSelection())

`null` | [`BaseSelection`](lexical.md#baseselection)

#### Returns

`string`

a string of HTML content

***

### $getLexicalContent() {#getlexicalcontent}

> **$getLexicalContent**(`editor`, `selection`): `null` \| `string`

Defined in: [packages/lexical-clipboard/src/clipboard.ts:82](https://github.com/facebook/lexical/tree/main/packages/lexical-clipboard/src/clipboard.ts#L82)

Returns the *currently selected* Lexical content as a JSON string, relying on the
logic defined in the exportJSON methods on the LexicalNode classes. Note that
this will not return the JSON content of the entire editor (unless all the content is included
in the current selection).

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

LexicalEditor instance to get the JSON content from

##### selection

The selection to use (default is $getSelection())

`null` | [`BaseSelection`](lexical.md#baseselection)

#### Returns

`null` \| `string`

***

### $insertDataTransferForPlainText() {#insertdatatransferforplaintext}

> **$insertDataTransferForPlainText**(`dataTransfer`, `selection`): `void`

Defined in: [packages/lexical-clipboard/src/clipboard.ts:109](https://github.com/facebook/lexical/tree/main/packages/lexical-clipboard/src/clipboard.ts#L109)

Attempts to insert content of the mime-types text/plain or text/uri-list from
the provided DataTransfer object into the editor at the provided selection.
text/uri-list is only used if text/plain is not also provided.

#### Parameters

##### dataTransfer

`DataTransfer`

an object conforming to the [DataTransfer interface] (https://html.spec.whatwg.org/multipage/dnd.html#the-datatransfer-interface)

##### selection

[`BaseSelection`](lexical.md#baseselection)

the selection to use as the insertion point for the content in the DataTransfer object

#### Returns

`void`

***

### $insertDataTransferForRichText() {#insertdatatransferforrichtext}

> **$insertDataTransferForRichText**(`dataTransfer`, `selection`, `editor`): `void`

Defined in: [packages/lexical-clipboard/src/clipboard.ts:130](https://github.com/facebook/lexical/tree/main/packages/lexical-clipboard/src/clipboard.ts#L130)

Attempts to insert content of the mime-types application/x-lexical-editor, text/html,
text/plain, or text/uri-list (in descending order of priority) from the provided DataTransfer
object into the editor at the provided selection.

#### Parameters

##### dataTransfer

`DataTransfer`

an object conforming to the [DataTransfer interface] (https://html.spec.whatwg.org/multipage/dnd.html#the-datatransfer-interface)

##### selection

[`BaseSelection`](lexical.md#baseselection)

the selection to use as the insertion point for the content in the DataTransfer object

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

the LexicalEditor the content is being inserted into.

#### Returns

`void`

***

### $insertGeneratedNodes() {#insertgeneratednodes}

> **$insertGeneratedNodes**(`editor`, `nodes`, `selection`): `void`

Defined in: [packages/lexical-clipboard/src/clipboard.ts:223](https://github.com/facebook/lexical/tree/main/packages/lexical-clipboard/src/clipboard.ts#L223)

Inserts Lexical nodes into the editor using different strategies depending on
some simple selection-based heuristics. If you're looking for a generic way to
to insert nodes into the editor at a specific selection point, you probably want
[lexical.$insertNodes](lexical.md#insertnodes-6)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

LexicalEditor instance to insert the nodes into.

##### nodes

[`LexicalNode`](lexical.md#lexicalnode)[]

The nodes to insert.

##### selection

[`BaseSelection`](lexical.md#baseselection)

The selection to insert the nodes into.

#### Returns

`void`

***

### copyToClipboard() {#copytoclipboard}

> **copyToClipboard**(`editor`, `event`, `data?`): `Promise`\<`boolean`\>

Defined in: [packages/lexical-clipboard/src/clipboard.ts:434](https://github.com/facebook/lexical/tree/main/packages/lexical-clipboard/src/clipboard.ts#L434)

Copies the content of the current selection to the clipboard in
text/plain, text/html, and application/x-lexical-editor (Lexical JSON)
formats.

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

the LexicalEditor instance to copy content from

##### event

the native browser ClipboardEvent to add the content to.

`null` | `ClipboardEvent`

##### data?

[`LexicalClipboardData`](#lexicalclipboarddata)

#### Returns

`Promise`\<`boolean`\>

***

### setLexicalClipboardDataTransfer() {#setlexicalclipboarddatatransfer}

> **setLexicalClipboardDataTransfer**(`clipboardData`, `data`): `void`

Defined in: [packages/lexical-clipboard/src/clipboard.ts:573](https://github.com/facebook/lexical/tree/main/packages/lexical-clipboard/src/clipboard.ts#L573)

Call setData on the given clipboardData for each MIME type present
in the given data (from [$getClipboardDataFromSelection](#getclipboarddatafromselection))

#### Parameters

##### clipboardData

`DataTransfer`

the event.clipboardData to populate from data

##### data

[`LexicalClipboardData`](#lexicalclipboarddata)

The lexical data

#### Returns

`void`
