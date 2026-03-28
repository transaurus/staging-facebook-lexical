# @lexical/code-shiki

## Interfaces

### Tokenizer {#tokenizer}

Defined in: [packages/lexical-code-shiki/src/CodeHighlighterShiki.ts:76](https://github.com/facebook/lexical/tree/main/packages/lexical-code-shiki/src/CodeHighlighterShiki.ts#L76)

#### Properties

##### $tokenize() {#tokenize}

> **$tokenize**: (`this`, `codeNode`, `language?`) => [`LexicalNode`](lexical.md#lexicalnode)[]

Defined in: [packages/lexical-code-shiki/src/CodeHighlighterShiki.ts:79](https://github.com/facebook/lexical/tree/main/packages/lexical-code-shiki/src/CodeHighlighterShiki.ts#L79)

###### Parameters

###### this

[`Tokenizer`](#tokenizer)

###### codeNode

[`CodeNode`](lexical_code.md#codenode)

###### language?

`string`

###### Returns

[`LexicalNode`](lexical.md#lexicalnode)[]

##### defaultLanguage {#defaultlanguage}

> **defaultLanguage**: `string`

Defined in: [packages/lexical-code-shiki/src/CodeHighlighterShiki.ts:77](https://github.com/facebook/lexical/tree/main/packages/lexical-code-shiki/src/CodeHighlighterShiki.ts#L77)

##### defaultTheme {#defaulttheme}

> **defaultTheme**: `string`

Defined in: [packages/lexical-code-shiki/src/CodeHighlighterShiki.ts:78](https://github.com/facebook/lexical/tree/main/packages/lexical-code-shiki/src/CodeHighlighterShiki.ts#L78)

## Variables

### CodeHighlighterShikiExtension {#codehighlightershikiextension}

> `const` **CodeHighlighterShikiExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<[`Tokenizer`](#tokenizer), `"@lexical/code-shiki"`, `unknown`, `unknown`\>

Defined in: [packages/lexical-code-shiki/src/CodeHighlighterShiki.ts:931](https://github.com/facebook/lexical/tree/main/packages/lexical-code-shiki/src/CodeHighlighterShiki.ts#L931)

Add code highlighting support for code blocks with Shiki

***

### ShikiTokenizer {#shikitokenizer}

> `const` **ShikiTokenizer**: [`Tokenizer`](#tokenizer)

Defined in: [packages/lexical-code-shiki/src/CodeHighlighterShiki.ts:88](https://github.com/facebook/lexical/tree/main/packages/lexical-code-shiki/src/CodeHighlighterShiki.ts#L88)

## Functions

### getCodeLanguageOptions() {#getcodelanguageoptions}

> **getCodeLanguageOptions**(): \[`string`, `string`\][]

Defined in: [packages/lexical-code-shiki/src/FacadeShiki.ts:119](https://github.com/facebook/lexical/tree/main/packages/lexical-code-shiki/src/FacadeShiki.ts#L119)

#### Returns

\[`string`, `string`\][]

***

### getCodeThemeOptions() {#getcodethemeoptions}

> **getCodeThemeOptions**(): \[`string`, `string`\][]

Defined in: [packages/lexical-code-shiki/src/FacadeShiki.ts:122](https://github.com/facebook/lexical/tree/main/packages/lexical-code-shiki/src/FacadeShiki.ts#L122)

#### Returns

\[`string`, `string`\][]

***

### isCodeLanguageLoaded() {#iscodelanguageloaded}

> **isCodeLanguageLoaded**(`language`): `boolean`

Defined in: [packages/lexical-code-shiki/src/FacadeShiki.ts:38](https://github.com/facebook/lexical/tree/main/packages/lexical-code-shiki/src/FacadeShiki.ts#L38)

#### Parameters

##### language

`string`

#### Returns

`boolean`

***

### loadCodeLanguage() {#loadcodelanguage}

> **loadCodeLanguage**(`language`, `editor?`, `codeNodeKey?`): `undefined` \| `Promise`\<`void`\>

Defined in: [packages/lexical-code-shiki/src/FacadeShiki.ts:51](https://github.com/facebook/lexical/tree/main/packages/lexical-code-shiki/src/FacadeShiki.ts#L51)

#### Parameters

##### language

`string`

##### editor?

[`LexicalEditor`](lexical.md#lexicaleditor)

##### codeNodeKey?

`string`

#### Returns

`undefined` \| `Promise`\<`void`\>

***

### loadCodeTheme() {#loadcodetheme}

> **loadCodeTheme**(`theme`, `editor?`, `codeNodeKey?`): `undefined` \| `Promise`\<`void`\>

Defined in: [packages/lexical-code-shiki/src/FacadeShiki.ts:97](https://github.com/facebook/lexical/tree/main/packages/lexical-code-shiki/src/FacadeShiki.ts#L97)

#### Parameters

##### theme

`string`

##### editor?

[`LexicalEditor`](lexical.md#lexicaleditor)

##### codeNodeKey?

`string`

#### Returns

`undefined` \| `Promise`\<`void`\>

***

### normalizeCodeLanguage() {#normalizecodelanguage}

> **normalizeCodeLanguage**(`language`): `string`

Defined in: [packages/lexical-code-shiki/src/FacadeShiki.ts:126](https://github.com/facebook/lexical/tree/main/packages/lexical-code-shiki/src/FacadeShiki.ts#L126)

#### Parameters

##### language

`string`

#### Returns

`string`

***

### registerCodeHighlighting() {#registercodehighlighting}

> **registerCodeHighlighting**(`editor`, `tokenizer?`): () => `void`

Defined in: [packages/lexical-code-shiki/src/CodeHighlighterShiki.ts:768](https://github.com/facebook/lexical/tree/main/packages/lexical-code-shiki/src/CodeHighlighterShiki.ts#L768)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### tokenizer?

[`Tokenizer`](#tokenizer)

#### Returns

> (): `void`

##### Returns

`void`
