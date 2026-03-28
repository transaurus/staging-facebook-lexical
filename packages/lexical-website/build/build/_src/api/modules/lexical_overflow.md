# @lexical/overflow

## Classes

### OverflowNode {#overflownode}

Defined in: [packages/lexical-overflow/src/index.ts:21](https://github.com/facebook/lexical/tree/main/packages/lexical-overflow/src/index.ts#L21)

#### Extends

- [`ElementNode`](lexical.md#elementnode)

#### Methods

##### createDOM() {#createdom}

> **createDOM**(`config`): `HTMLElement`

Defined in: [packages/lexical-overflow/src/index.ts:34](https://github.com/facebook/lexical/tree/main/packages/lexical-overflow/src/index.ts#L34)

Called during the reconciliation process to determine which nodes
to insert into the DOM for this Lexical Node.

This method must return exactly one HTMLElement. Nested elements are not supported.

Do not attempt to update the Lexical EditorState during this phase of the update lifecycle.

###### Parameters

###### config

[`EditorConfig`](lexical.md#editorconfig)

###### Returns

`HTMLElement`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`createDOM`](lexical.md#createdom-2)

##### excludeFromCopy() {#excludefromcopy}

> **excludeFromCopy**(): `boolean`

Defined in: [packages/lexical-overflow/src/index.ts:55](https://github.com/facebook/lexical/tree/main/packages/lexical-overflow/src/index.ts#L55)

###### Returns

`boolean`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`excludeFromCopy`](lexical.md#excludefromcopy)

##### insertNewAfter() {#insertnewafter}

> **insertNewAfter**(`selection`, `restoreSelection`): `null` \| [`LexicalNode`](lexical.md#lexicalnode)

Defined in: [packages/lexical-overflow/src/index.ts:47](https://github.com/facebook/lexical/tree/main/packages/lexical-overflow/src/index.ts#L47)

###### Parameters

###### selection

[`RangeSelection`](lexical.md#rangeselection)

###### restoreSelection

`boolean` = `true`

###### Returns

`null` \| [`LexicalNode`](lexical.md#lexicalnode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`insertNewAfter`](lexical.md#insertnewafter)

##### updateDOM() {#updatedom}

> **updateDOM**(`prevNode`, `dom`): `boolean`

Defined in: [packages/lexical-overflow/src/index.ts:43](https://github.com/facebook/lexical/tree/main/packages/lexical-overflow/src/index.ts#L43)

Called when a node changes and should update the DOM
in whatever way is necessary to make it align with any changes that might
have happened during the update.

Returning "true" here will cause lexical to unmount and recreate the DOM node
(by calling createDOM). You would need to do this if the element tag changes,
for instance.

###### Parameters

###### prevNode

`this`

###### dom

`HTMLElement`

###### Returns

`boolean`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`updateDOM`](lexical.md#updatedom-2)

## Type Aliases

### SerializedOverflowNode {#serializedoverflownode}

> **SerializedOverflowNode** = [`SerializedElementNode`](lexical.md#serializedelementnode)

Defined in: [packages/lexical-overflow/src/index.ts:18](https://github.com/facebook/lexical/tree/main/packages/lexical-overflow/src/index.ts#L18)

## Variables

### OverflowExtension {#overflowextension}

> `const` **OverflowExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<[`ExtensionConfigBase`](lexical.md#extensionconfigbase), `"@lexical/overflow"`, `unknown`, `unknown`\>

Defined in: [packages/lexical-overflow/src/index.ts:73](https://github.com/facebook/lexical/tree/main/packages/lexical-overflow/src/index.ts#L73)

Configures [OverflowNode](#overflownode)

## Functions

### $createOverflowNode() {#createoverflownode}

> **$createOverflowNode**(): [`OverflowNode`](#overflownode)

Defined in: [packages/lexical-overflow/src/index.ts:60](https://github.com/facebook/lexical/tree/main/packages/lexical-overflow/src/index.ts#L60)

#### Returns

[`OverflowNode`](#overflownode)

***

### $isOverflowNode() {#isoverflownode}

> **$isOverflowNode**(`node`): `node is OverflowNode`

Defined in: [packages/lexical-overflow/src/index.ts:64](https://github.com/facebook/lexical/tree/main/packages/lexical-overflow/src/index.ts#L64)

#### Parameters

##### node

`undefined` | `null` | [`LexicalNode`](lexical.md#lexicalnode)

#### Returns

`node is OverflowNode`
