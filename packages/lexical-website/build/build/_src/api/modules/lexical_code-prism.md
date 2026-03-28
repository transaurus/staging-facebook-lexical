# @lexical/code-prism

## Interfaces

### Tokenizer {#tokenizer}

Defined in: [packages/lexical-code-prism/src/CodeHighlighterPrism.ts:81](https://github.com/facebook/lexical/tree/main/packages/lexical-code-prism/src/CodeHighlighterPrism.ts#L81)

#### Properties

##### defaultLanguage {#defaultlanguage}

> **defaultLanguage**: `string`

Defined in: [packages/lexical-code-prism/src/CodeHighlighterPrism.ts:82](https://github.com/facebook/lexical/tree/main/packages/lexical-code-prism/src/CodeHighlighterPrism.ts#L82)

#### Methods

##### $tokenize() {#tokenize}

> **$tokenize**(`codeNode`, `language?`): [`LexicalNode`](lexical.md#lexicalnode)[]

Defined in: [packages/lexical-code-prism/src/CodeHighlighterPrism.ts:84](https://github.com/facebook/lexical/tree/main/packages/lexical-code-prism/src/CodeHighlighterPrism.ts#L84)

###### Parameters

###### codeNode

[`CodeNode`](lexical_code.md#codenode)

###### language?

`string`

###### Returns

[`LexicalNode`](lexical.md#lexicalnode)[]

##### tokenize() {#tokenize-2}

> **tokenize**(`code`, `language?`): (`string` \| `Token`)[]

Defined in: [packages/lexical-code-prism/src/CodeHighlighterPrism.ts:83](https://github.com/facebook/lexical/tree/main/packages/lexical-code-prism/src/CodeHighlighterPrism.ts#L83)

###### Parameters

###### code

`string`

###### language?

`string`

###### Returns

(`string` \| `Token`)[]

## Variables

### CODE\_LANGUAGE\_FRIENDLY\_NAME\_MAP {#code_language_friendly_name_map}

> `const` **CODE\_LANGUAGE\_FRIENDLY\_NAME\_MAP**: `Record`\<`string`, `string`\>

Defined in: [packages/lexical-code-prism/src/FacadePrism.ts:44](https://github.com/facebook/lexical/tree/main/packages/lexical-code-prism/src/FacadePrism.ts#L44)

***

### CODE\_LANGUAGE\_MAP {#code_language_map}

> `const` **CODE\_LANGUAGE\_MAP**: `Record`\<`string`, `string`\>

Defined in: [packages/lexical-code-prism/src/FacadePrism.ts:64](https://github.com/facebook/lexical/tree/main/packages/lexical-code-prism/src/FacadePrism.ts#L64)

***

### PrismTokenizer {#prismtokenizer}

> `const` **PrismTokenizer**: [`Tokenizer`](#tokenizer)

Defined in: [packages/lexical-code-prism/src/CodeHighlighterPrism.ts:87](https://github.com/facebook/lexical/tree/main/packages/lexical-code-prism/src/CodeHighlighterPrism.ts#L87)

## Functions

### getCodeLanguageOptions() {#getcodelanguageoptions}

> **getCodeLanguageOptions**(): \[`string`, `string`\][]

Defined in: [packages/lexical-code-prism/src/FacadePrism.ts:93](https://github.com/facebook/lexical/tree/main/packages/lexical-code-prism/src/FacadePrism.ts#L93)

#### Returns

\[`string`, `string`\][]

***

### getCodeLanguages() {#getcodelanguages}

> **getCodeLanguages**(): `string`[]

Defined in: [packages/lexical-code-prism/src/FacadePrism.ts:84](https://github.com/facebook/lexical/tree/main/packages/lexical-code-prism/src/FacadePrism.ts#L84)

#### Returns

`string`[]

***

### getCodeThemeOptions() {#getcodethemeoptions}

> **getCodeThemeOptions**(): \[`string`, `string`\][]

Defined in: [packages/lexical-code-prism/src/FacadePrism.ts:106](https://github.com/facebook/lexical/tree/main/packages/lexical-code-prism/src/FacadePrism.ts#L106)

#### Returns

\[`string`, `string`\][]

***

### getLanguageFriendlyName() {#getlanguagefriendlyname}

> **getLanguageFriendlyName**(`lang`): `string`

Defined in: [packages/lexical-code-prism/src/FacadePrism.ts:79](https://github.com/facebook/lexical/tree/main/packages/lexical-code-prism/src/FacadePrism.ts#L79)

#### Parameters

##### lang

`string`

#### Returns

`string`

***

### isCodeLanguageLoaded() {#iscodelanguageloaded}

> **isCodeLanguageLoaded**(`language`): `boolean`

Defined in: [packages/lexical-code-prism/src/FacadePrism.ts:117](https://github.com/facebook/lexical/tree/main/packages/lexical-code-prism/src/FacadePrism.ts#L117)

#### Parameters

##### language

`string`

#### Returns

`boolean`

***

### loadCodeLanguage() {#loadcodelanguage}

> **loadCodeLanguage**(`language`, `editor?`, `codeNodeKey?`): `Promise`\<`void`\>

Defined in: [packages/lexical-code-prism/src/FacadePrism.ts:128](https://github.com/facebook/lexical/tree/main/packages/lexical-code-prism/src/FacadePrism.ts#L128)

#### Parameters

##### language

`string`

##### editor?

[`LexicalEditor`](lexical.md#lexicaleditor)

##### codeNodeKey?

`string`

#### Returns

`Promise`\<`void`\>

***

### normalizeCodeLanguage() {#normalizecodelanguage}

> **normalizeCodeLanguage**(`lang`): `string`

Defined in: [packages/lexical-code-prism/src/FacadePrism.ts:75](https://github.com/facebook/lexical/tree/main/packages/lexical-code-prism/src/FacadePrism.ts#L75)

#### Parameters

##### lang

`string`

#### Returns

`string`

***

### registerCodeHighlighting() {#registercodehighlighting}

> **registerCodeHighlighting**(`editor`, `tokenizer?`): () => `void`

Defined in: [packages/lexical-code-prism/src/CodeHighlighterPrism.ts:752](https://github.com/facebook/lexical/tree/main/packages/lexical-code-prism/src/CodeHighlighterPrism.ts#L752)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### tokenizer?

[`Tokenizer`](#tokenizer)

#### Returns

> (): `void`

##### Returns

`void`
