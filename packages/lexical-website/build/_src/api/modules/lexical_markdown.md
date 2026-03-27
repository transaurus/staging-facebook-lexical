# @lexical/markdown

## Type Aliases

### ElementTransformer {#elementtransformer}

> **ElementTransformer** = `object`

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:57](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L57)

#### Properties

##### dependencies {#dependencies}

> **dependencies**: [`Klass`](lexical.md#klass)\<[`LexicalNode`](lexical.md#lexicalnode)\>[]

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:58](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L58)

##### export() {#export}

> **export**: (`node`, `traverseChildren`) => `string` \| `null`

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:64](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L64)

`export` is called when the `$convertToMarkdownString` is called to convert the editor state into markdown.

###### Parameters

###### node

[`LexicalNode`](lexical.md#lexicalnode)

###### traverseChildren

(`node`) => `string`

###### Returns

`string` \| `null`

return null to cancel the export, even though the regex matched. Lexical will then search for the next transformer.

##### regExp {#regexp}

> **regExp**: `RegExp`

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:69](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L69)

##### replace() {#replace}

> **replace**: (`parentNode`, `children`, `match`, `isImport`) => `boolean` \| `void`

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:75](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L75)

`replace` is called when markdown is imported or typed in the editor

###### Parameters

###### parentNode

[`ElementNode`](lexical.md#elementnode)

###### children

[`LexicalNode`](lexical.md#lexicalnode)[]

###### match

`string`[]

###### isImport

`boolean`

###### Returns

`boolean` \| `void`

return false to cancel the transform, even though the regex matched. Lexical will then search for the next transformer.

##### type {#type}

> **type**: `"element"`

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:84](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L84)

***

### MultilineElementTransformer {#multilineelementtransformer}

> **MultilineElementTransformer** = `object`

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:87](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L87)

#### Properties

##### dependencies {#dependencies-1}

> **dependencies**: [`Klass`](lexical.md#klass)\<[`LexicalNode`](lexical.md#lexicalnode)\>[]

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:101](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L101)

##### export()? {#export-1}

> `optional` **export**: (`node`, `traverseChildren`) => `string` \| `null`

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:107](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L107)

`export` is called when the `$convertToMarkdownString` is called to convert the editor state into markdown.

###### Parameters

###### node

[`LexicalNode`](lexical.md#lexicalnode)

###### traverseChildren

(`node`) => `string`

###### Returns

`string` \| `null`

return null to cancel the export, even though the regex matched. Lexical will then search for the next transformer.

##### handleImportAfterStartMatch()? {#handleimportafterstartmatch}

> `optional` **handleImportAfterStartMatch**: (`args`) => \[`boolean`, `number`\] \| `null` \| `undefined`

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:94](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L94)

Use this function to manually handle the import process, once the `regExpStart` has matched successfully.
Without providing this function, the default behavior is to match until `regExpEnd` is found, or until the end of the document if `regExpEnd.optional` is true.

###### Parameters

###### args

###### lines

`string`[]

###### rootNode

[`ElementNode`](lexical.md#elementnode)

###### startLineIndex

`number`

###### startMatch

`RegExpMatchArray`

###### transformer

[`MultilineElementTransformer`](#multilineelementtransformer)

###### Returns

\[`boolean`, `number`\] \| `null` \| `undefined`

a tuple or null. The first element of the returned tuple is a boolean indicating if a multiline element was imported. The second element is the index of the last line that was processed. If null is returned, the next multilineElementTransformer will be tried. If undefined is returned, the default behavior will be used.

##### regExpEnd? {#regexpend}

> `optional` **regExpEnd**: `RegExp` \| \{ `optional?`: `true`; `regExp`: `RegExp`; \}

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:119](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L119)

This regex determines when to stop matching. Anything in between regExpStart and regExpEnd will be matched

###### Type Declaration

`RegExp`

\{ `optional?`: `true`; `regExp`: `RegExp`; \}

###### optional?

> `optional` **optional**: `true`

Whether the end match is optional. If true, the end match is not required to match for the transformer to be triggered.
The entire text from regexpStart to the end of the document will then be matched.

###### regExp

> **regExp**: `RegExp`

##### regExpStart {#regexpstart}

> **regExpStart**: `RegExp`

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:115](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L115)

This regex determines when to start matching

##### replace() {#replace-1}

> **replace**: (`rootNode`, `children`, `startMatch`, `endMatch`, `linesInBetween`, `isImport`) => `boolean` \| `void`

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:134](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L134)

`replace` is called only when markdown is imported in the editor, not when it's typed

###### Parameters

###### rootNode

[`ElementNode`](lexical.md#elementnode)

###### children

[`LexicalNode`](lexical.md#lexicalnode)[] | `null`

###### startMatch

`string`[]

###### endMatch

`string`[] | `null`

###### linesInBetween

`string`[] | `null`

###### isImport

`boolean`

###### Returns

`boolean` \| `void`

return false to cancel the transform, even though the regex matched. Lexical will then search for the next transformer.

##### type {#type-1}

> **type**: `"multiline-element"`

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:153](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L153)

***

### TextFormatTransformer {#textformattransformer}

> **TextFormatTransformer** = `Readonly`\<\{ `format`: `ReadonlyArray`\<[`TextFormatType`](lexical.md#textformattype)\>; `intraword?`: `boolean`; `tag`: `string`; `type`: `"text-format"`; \}\>

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:156](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L156)

***

### TextMatchTransformer {#textmatchtransformer}

> **TextMatchTransformer** = `Readonly`\<\{ `dependencies`: [`Klass`](lexical.md#klass)\<[`LexicalNode`](lexical.md#lexicalnode)\>[]; `export?`: (`node`, `exportChildren`, `exportFormat`) => `string` \| `null`; `getEndIndex?`: (`node`, `match`) => `number` \| `false`; `importRegExp?`: `RegExp`; `regExp`: `RegExp`; `replace?`: (`node`, `match`) => `void` \| [`TextNode`](lexical.md#textnode); `trigger?`: `string`; `type`: `"text-match"`; \}\>

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:163](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L163)

***

### Transformer {#transformer}

> **Transformer** = [`ElementTransformer`](#elementtransformer) \| [`MultilineElementTransformer`](#multilineelementtransformer) \| [`TextFormatTransformer`](#textformattransformer) \| [`TextMatchTransformer`](#textmatchtransformer)

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:51](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L51)

## Variables

### BOLD\_ITALIC\_STAR {#bold_italic_star}

> `const` **BOLD\_ITALIC\_STAR**: [`TextFormatTransformer`](#textformattransformer)

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:618](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L618)

***

### BOLD\_ITALIC\_UNDERSCORE {#bold_italic_underscore}

> `const` **BOLD\_ITALIC\_UNDERSCORE**: [`TextFormatTransformer`](#textformattransformer)

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:624](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L624)

***

### BOLD\_STAR {#bold_star}

> `const` **BOLD\_STAR**: [`TextFormatTransformer`](#textformattransformer)

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:631](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L631)

***

### BOLD\_UNDERSCORE {#bold_underscore}

> `const` **BOLD\_UNDERSCORE**: [`TextFormatTransformer`](#textformattransformer)

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:637](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L637)

***

### CHECK\_LIST {#check_list}

> `const` **CHECK\_LIST**: [`ElementTransformer`](#elementtransformer)

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:586](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L586)

***

### CODE {#code}

> `const` **CODE**: [`MultilineElementTransformer`](#multilineelementtransformer)

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:417](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L417)

***

### ELEMENT\_TRANSFORMERS {#element_transformers}

> `const` **ELEMENT\_TRANSFORMERS**: [`ElementTransformer`](#elementtransformer)[]

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:726](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L726)

***

### HEADING {#heading}

> `const` **HEADING**: [`ElementTransformer`](#elementtransformer)

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:362](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L362)

***

### HIGHLIGHT {#highlight}

> `const` **HIGHLIGHT**: [`TextFormatTransformer`](#textformattransformer)

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:612](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L612)

***

### INLINE\_CODE {#inline_code}

> `const` **INLINE\_CODE**: [`TextFormatTransformer`](#textformattransformer)

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:606](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L606)

***

### ITALIC\_STAR {#italic_star}

> `const` **ITALIC\_STAR**: [`TextFormatTransformer`](#textformattransformer)

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:650](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L650)

***

### ITALIC\_UNDERSCORE {#italic_underscore}

> `const` **ITALIC\_UNDERSCORE**: [`TextFormatTransformer`](#textformattransformer)

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:656](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L656)

***

### LINK {#link}

> `const` **LINK**: [`TextMatchTransformer`](#textmatchtransformer)

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:667](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L667)

***

### MULTILINE\_ELEMENT\_TRANSFORMERS {#multiline_element_transformers}

> `const` **MULTILINE\_ELEMENT\_TRANSFORMERS**: [`MultilineElementTransformer`](#multilineelementtransformer)[]

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:733](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L733)

***

### ORDERED\_LIST {#ordered_list}

> `const` **ORDERED\_LIST**: [`ElementTransformer`](#elementtransformer)

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:596](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L596)

***

### QUOTE {#quote}

> `const` **QUOTE**: [`ElementTransformer`](#elementtransformer)

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:379](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L379)

***

### STRIKETHROUGH {#strikethrough}

> `const` **STRIKETHROUGH**: [`TextFormatTransformer`](#textformattransformer)

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:644](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L644)

***

### TEXT\_FORMAT\_TRANSFORMERS {#text_format_transformers}

> `const` **TEXT\_FORMAT\_TRANSFORMERS**: [`TextFormatTransformer`](#textformattransformer)[]

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:740](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L740)

***

### TEXT\_MATCH\_TRANSFORMERS {#text_match_transformers}

> `const` **TEXT\_MATCH\_TRANSFORMERS**: [`TextMatchTransformer`](#textmatchtransformer)[]

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:752](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L752)

***

### TRANSFORMERS {#transformers}

> `const` **TRANSFORMERS**: [`Transformer`](#transformer)[]

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:754](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L754)

***

### UNORDERED\_LIST {#unordered_list}

> `const` **UNORDERED\_LIST**: [`ElementTransformer`](#elementtransformer)

Defined in: [packages/lexical-markdown/src/MarkdownTransformers.ts:576](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownTransformers.ts#L576)

## Functions

### $convertFromMarkdownString() {#convertfrommarkdownstring}

> **$convertFromMarkdownString**(`markdown`, `transformers`, `node?`, `shouldPreserveNewLines?`, `shouldMergeAdjacentLines?`): `void`

Defined in: [packages/lexical-markdown/src/index.ts:52](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/index.ts#L52)

Renders markdown from a string. The selection is moved to the start after the operation.

#### Parameters

##### markdown

`string`

##### transformers

[`Transformer`](#transformer)[] = `TRANSFORMERS`

##### node?

[`ElementNode`](lexical.md#elementnode)

##### shouldPreserveNewLines?

`boolean` = `false`

By setting this to true, new lines will be preserved between conversions

##### shouldMergeAdjacentLines?

`boolean` = `false`

By setting this to true, adjacent non empty lines will be merged according to commonmark spec: https://spec.commonmark.org/0.24/#example-177. Not applicable if shouldPreserveNewLines = true.

#### Returns

`void`

***

### $convertToMarkdownString() {#converttomarkdownstring}

> **$convertToMarkdownString**(`transformers`, `node?`, `shouldPreserveNewLines?`): `string`

Defined in: [packages/lexical-markdown/src/index.ts:72](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/index.ts#L72)

Renders string from markdown. The selection is moved to the start after the operation.

#### Parameters

##### transformers

[`Transformer`](#transformer)[] = `TRANSFORMERS`

##### node?

[`ElementNode`](lexical.md#elementnode)

##### shouldPreserveNewLines?

`boolean` = `false`

#### Returns

`string`

***

### registerMarkdownShortcuts() {#registermarkdownshortcuts}

> **registerMarkdownShortcuts**(`editor`, `transformers`): () => `void`

Defined in: [packages/lexical-markdown/src/MarkdownShortcuts.ts:407](https://github.com/facebook/lexical/tree/main/packages/lexical-markdown/src/MarkdownShortcuts.ts#L407)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### transformers

[`Transformer`](#transformer)[] = `TRANSFORMERS`

#### Returns

> (): `void`

##### Returns

`void`
