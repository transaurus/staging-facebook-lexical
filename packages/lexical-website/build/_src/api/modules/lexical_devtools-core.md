# @lexical/devtools-core

## Type Aliases

### CustomPrintNodeFn() {#customprintnodefn}

> **CustomPrintNodeFn** = (`node`, `obfuscateText?`) => `string` \| `undefined`

Defined in: [packages/lexical-devtools-core/src/generateContent.ts:35](https://github.com/facebook/lexical/tree/main/packages/lexical-devtools-core/src/generateContent.ts#L35)

#### Parameters

##### node

[`LexicalNode`](lexical.md#lexicalnode)

##### obfuscateText?

`boolean`

#### Returns

`string` \| `undefined`

***

### LexicalCommandEntry {#lexicalcommandentry}

> **LexicalCommandEntry** = `object` & [`LexicalCommand`](lexical.md#lexicalcommand)\<`unknown`\> & `object`

Defined in: [packages/lexical-devtools-core/src/useLexicalCommandsLog.ts:14](https://github.com/facebook/lexical/tree/main/packages/lexical-devtools-core/src/useLexicalCommandsLog.ts#L14)

#### Type Declaration

##### index

> **index**: `number`

#### Type Declaration

##### payload

> **payload**: `unknown`

***

### LexicalCommandLog {#lexicalcommandlog}

> **LexicalCommandLog** = `ReadonlyArray`\<[`LexicalCommandEntry`](#lexicalcommandentry)\>

Defined in: [packages/lexical-devtools-core/src/useLexicalCommandsLog.ts:18](https://github.com/facebook/lexical/tree/main/packages/lexical-devtools-core/src/useLexicalCommandsLog.ts#L18)

## Variables

### TreeView {#treeview}

> `const` **TreeView**: `ForwardRefExoticComponent`\<`object` & `RefAttributes`\<`HTMLPreElement`\>\>

Defined in: [packages/lexical-devtools-core/src/TreeView.tsx:18](https://github.com/facebook/lexical/tree/main/packages/lexical-devtools-core/src/TreeView.tsx#L18)

## Functions

### generateContent() {#generatecontent}

> **generateContent**(`editor`, `commandsLog`, `exportDOM`, `customPrintNode?`, `obfuscateText?`): `string`

Defined in: [packages/lexical-devtools-core/src/generateContent.ts:96](https://github.com/facebook/lexical/tree/main/packages/lexical-devtools-core/src/generateContent.ts#L96)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### commandsLog

[`LexicalCommandLog`](#lexicalcommandlog)

##### exportDOM

`boolean`

##### customPrintNode?

[`CustomPrintNodeFn`](#customprintnodefn)

##### obfuscateText?

`boolean` = `false`

#### Returns

`string`

***

### registerLexicalCommandLogger() {#registerlexicalcommandlogger}

> **registerLexicalCommandLogger**(`editor`, `setLoggedCommands`): () => `void`

Defined in: [packages/lexical-devtools-core/src/useLexicalCommandsLog.ts:20](https://github.com/facebook/lexical/tree/main/packages/lexical-devtools-core/src/useLexicalCommandsLog.ts#L20)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### setLoggedCommands

(`v`) => `void`

#### Returns

> (): `void`

##### Returns

`void`

***

### useLexicalCommandsLog() {#uselexicalcommandslog}

> **useLexicalCommandsLog**(`editor`): [`LexicalCommandLog`](#lexicalcommandlog)

Defined in: [packages/lexical-devtools-core/src/useLexicalCommandsLog.ts:50](https://github.com/facebook/lexical/tree/main/packages/lexical-devtools-core/src/useLexicalCommandsLog.ts#L50)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

#### Returns

[`LexicalCommandLog`](#lexicalcommandlog)
