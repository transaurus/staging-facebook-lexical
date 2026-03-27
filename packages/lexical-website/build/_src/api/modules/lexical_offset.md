# @lexical/offset

## Classes

### OffsetView {#offsetview}

Defined in: [packages/lexical-offset/src/index.ts:60](https://github.com/facebook/lexical/tree/main/packages/lexical-offset/src/index.ts#L60)

#### Constructors

##### Constructor

> **new OffsetView**(`offsetMap`, `firstNode`, `blockOffsetSize`): [`OffsetView`](#offsetview)

Defined in: [packages/lexical-offset/src/index.ts:65](https://github.com/facebook/lexical/tree/main/packages/lexical-offset/src/index.ts#L65)

###### Parameters

###### offsetMap

`OffsetMap`

###### firstNode

`null` | `OffsetNode`

###### blockOffsetSize

`number` = `1`

###### Returns

[`OffsetView`](#offsetview)

#### Properties

##### \_blockOffsetSize {#_blockoffsetsize}

> **\_blockOffsetSize**: `number`

Defined in: [packages/lexical-offset/src/index.ts:63](https://github.com/facebook/lexical/tree/main/packages/lexical-offset/src/index.ts#L63)

##### \_firstNode {#_firstnode}

> **\_firstNode**: `null` \| `OffsetNode`

Defined in: [packages/lexical-offset/src/index.ts:62](https://github.com/facebook/lexical/tree/main/packages/lexical-offset/src/index.ts#L62)

##### \_offsetMap {#_offsetmap}

> **\_offsetMap**: `OffsetMap`

Defined in: [packages/lexical-offset/src/index.ts:61](https://github.com/facebook/lexical/tree/main/packages/lexical-offset/src/index.ts#L61)

#### Methods

##### createSelectionFromOffsets() {#createselectionfromoffsets}

> **createSelectionFromOffsets**(`originalStart`, `originalEnd`, `diffOffsetView?`): `null` \| [`RangeSelection`](lexical.md#rangeselection)

Defined in: [packages/lexical-offset/src/index.ts:75](https://github.com/facebook/lexical/tree/main/packages/lexical-offset/src/index.ts#L75)

###### Parameters

###### originalStart

`number`

###### originalEnd

`number`

###### diffOffsetView?

[`OffsetView`](#offsetview)

###### Returns

`null` \| [`RangeSelection`](lexical.md#rangeselection)

##### getOffsetsFromSelection() {#getoffsetsfromselection}

> **getOffsetsFromSelection**(`selection`): \[`number`, `number`\]

Defined in: [packages/lexical-offset/src/index.ts:189](https://github.com/facebook/lexical/tree/main/packages/lexical-offset/src/index.ts#L189)

###### Parameters

###### selection

[`RangeSelection`](lexical.md#rangeselection)

###### Returns

\[`number`, `number`\]

## Variables

### ~~createChildrenArray()~~ {#createchildrenarray}

> `const` **createChildrenArray**: (`element`, `nodeMap`) => `string`[] = `$createChildrenArray`

Defined in: [packages/lexical-offset/src/index.ts:558](https://github.com/facebook/lexical/tree/main/packages/lexical-offset/src/index.ts#L558)

#### Parameters

##### element

[`ElementNode`](lexical.md#elementnode)

##### nodeMap

`null` | [`NodeMap`](lexical.md#nodemap)

#### Returns

`string`[]

#### Deprecated

renamed to [$createChildrenArray](#createchildrenarray-1) by @lexical/eslint-plugin rules-of-lexical

## Functions

### $createChildrenArray() {#createchildrenarray-1}

> **$createChildrenArray**(`element`, `nodeMap`): `string`[]

Defined in: [packages/lexical-offset/src/index.ts:540](https://github.com/facebook/lexical/tree/main/packages/lexical-offset/src/index.ts#L540)

#### Parameters

##### element

[`ElementNode`](lexical.md#elementnode)

##### nodeMap

`null` | [`NodeMap`](lexical.md#nodemap)

#### Returns

`string`[]

***

### $createOffsetView() {#createoffsetview}

> **$createOffsetView**(`editor`, `blockOffsetSize`, `editorState?`): [`OffsetView`](#offsetview)

Defined in: [packages/lexical-offset/src/index.ts:560](https://github.com/facebook/lexical/tree/main/packages/lexical-offset/src/index.ts#L560)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### blockOffsetSize

`number` = `1`

##### editorState?

`null` | [`EditorState`](lexical.md#editorstate)

#### Returns

[`OffsetView`](#offsetview)
