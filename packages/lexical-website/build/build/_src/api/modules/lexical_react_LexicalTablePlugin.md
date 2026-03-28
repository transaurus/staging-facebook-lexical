# @lexical/react/LexicalTablePlugin

## Interfaces

### TablePluginProps {#tablepluginprops}

Defined in: [packages/lexical-react/src/LexicalTablePlugin.ts:24](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTablePlugin.ts#L24)

#### Properties

##### hasCellBackgroundColor? {#hascellbackgroundcolor}

> `optional` **hasCellBackgroundColor**: `boolean`

Defined in: [packages/lexical-react/src/LexicalTablePlugin.ts:33](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTablePlugin.ts#L33)

When `false` (default `true`), the background color of TableCellNode will always be removed.

##### hasCellMerge? {#hascellmerge}

> `optional` **hasCellMerge**: `boolean`

Defined in: [packages/lexical-react/src/LexicalTablePlugin.ts:29](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTablePlugin.ts#L29)

When `false` (default `true`), merged cell support (colspan and rowspan) will be disabled and all
tables will be forced into a regular grid with 1x1 table cells.

##### hasHorizontalScroll? {#hashorizontalscroll}

> `optional` **hasHorizontalScroll**: `boolean`

Defined in: [packages/lexical-react/src/LexicalTablePlugin.ts:41](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTablePlugin.ts#L41)

When `true` (default `false`), tables will be wrapped in a `<div>` to enable horizontal scrolling

##### hasNestedTables? {#hasnestedtables}

> `optional` **hasNestedTables**: `boolean`

Defined in: [packages/lexical-react/src/LexicalTablePlugin.ts:47](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTablePlugin.ts#L47)

**`Experimental`**

When `true` (default `false`), nested tables will be allowed.

 Nested tables are not officially supported.

##### hasTabHandler? {#hastabhandler}

> `optional` **hasTabHandler**: `boolean`

Defined in: [packages/lexical-react/src/LexicalTablePlugin.ts:37](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTablePlugin.ts#L37)

When `true` (default `true`), the tab key can be used to navigate table cells.

## Functions

### TablePlugin() {#tableplugin}

> **TablePlugin**(`props`): `null` \| `Element`

Defined in: [packages/lexical-react/src/LexicalTablePlugin.ts:56](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTablePlugin.ts#L56)

A plugin to enable all of the features of Lexical's TableNode.

#### Parameters

##### props

[`TablePluginProps`](#tablepluginprops)

See type for documentation

#### Returns

`null` \| `Element`

An element to render in your LexicalComposer
