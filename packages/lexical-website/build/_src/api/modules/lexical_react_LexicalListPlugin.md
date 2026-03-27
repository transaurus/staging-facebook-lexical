# @lexical/react/LexicalListPlugin

## Interfaces

### ListPluginProps {#listpluginprops}

Defined in: [packages/lexical-react/src/LexicalListPlugin.ts:21](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalListPlugin.ts#L21)

#### Properties

##### hasStrictIndent? {#hasstrictindent}

> `optional` **hasStrictIndent**: `boolean`

Defined in: [packages/lexical-react/src/LexicalListPlugin.ts:26](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalListPlugin.ts#L26)

When `true`, enforces strict indentation rules for list items, ensuring consistent structure.
When `false` (default), indentation is more flexible.

##### shouldPreserveNumbering? {#shouldpreservenumbering}

> `optional` **shouldPreserveNumbering**: `boolean`

Defined in: [packages/lexical-react/src/LexicalListPlugin.ts:31](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalListPlugin.ts#L31)

When `true`, splitting a numbered list will preserve the numbering continuity.
When `false` (default), the new split list resets to 1.

## Functions

### ListPlugin() {#listplugin}

> **ListPlugin**(`__namedParameters`): `null`

Defined in: [packages/lexical-react/src/LexicalListPlugin.ts:34](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalListPlugin.ts#L34)

#### Parameters

##### \_\_namedParameters

[`ListPluginProps`](#listpluginprops)

#### Returns

`null`
