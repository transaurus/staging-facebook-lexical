# @lexical/react/LexicalAutoEmbedPlugin

## Classes

### AutoEmbedOption {#autoembedoption}

Defined in: [packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx:63](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx#L63)

#### Extends

- [`MenuOption`](lexical_react_LexicalNodeMenuPlugin.md#menuoption)

#### Constructors

##### Constructor

> **new AutoEmbedOption**(`title`, `options`): [`AutoEmbedOption`](#autoembedoption)

Defined in: [packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx:66](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx#L66)

###### Parameters

###### title

`string`

###### options

###### onSelect

(`targetNode`) => `void`

###### Returns

[`AutoEmbedOption`](#autoembedoption)

###### Overrides

[`MenuOption`](lexical_react_LexicalNodeMenuPlugin.md#menuoption).[`constructor`](lexical_react_LexicalNodeMenuPlugin.md#constructor)

#### Properties

##### icon? {#icon}

> `optional` **icon**: `Element`

Defined in: [packages/lexical-react/src/shared/LexicalMenu.tsx:55](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/LexicalMenu.tsx#L55)

###### Inherited from

[`MenuOption`](lexical_react_LexicalNodeMenuPlugin.md#menuoption).[`icon`](lexical_react_LexicalNodeMenuPlugin.md#icon)

##### key {#key}

> **key**: `string`

Defined in: [packages/lexical-react/src/shared/LexicalMenu.tsx:53](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/LexicalMenu.tsx#L53)

###### Inherited from

[`MenuOption`](lexical_react_LexicalNodeMenuPlugin.md#menuoption).[`key`](lexical_react_LexicalNodeMenuPlugin.md#key)

##### onSelect() {#onselect}

> **onSelect**: (`targetNode`) => `void`

Defined in: [packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx:65](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx#L65)

###### Parameters

###### targetNode

`null` | [`LexicalNode`](lexical.md#lexicalnode)

###### Returns

`void`

##### ref? {#ref}

> `optional` **ref**: `RefObject`\<`null` \| `HTMLElement`\>

Defined in: [packages/lexical-react/src/shared/LexicalMenu.tsx:54](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/LexicalMenu.tsx#L54)

###### Inherited from

[`MenuOption`](lexical_react_LexicalNodeMenuPlugin.md#menuoption).[`ref`](lexical_react_LexicalNodeMenuPlugin.md#ref)

##### title {#title}

> **title**: `string`

Defined in: [packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx:64](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx#L64)

###### Overrides

[`MenuOption`](lexical_react_LexicalNodeMenuPlugin.md#menuoption).[`title`](lexical_react_LexicalNodeMenuPlugin.md#title)

#### Methods

##### setRefElement() {#setrefelement}

> **setRefElement**(`element`): `void`

Defined in: [packages/lexical-react/src/shared/LexicalMenu.tsx:64](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/LexicalMenu.tsx#L64)

###### Parameters

###### element

`null` | `HTMLElement`

###### Returns

`void`

###### Inherited from

[`MenuOption`](lexical_react_LexicalNodeMenuPlugin.md#menuoption).[`setRefElement`](lexical_react_LexicalNodeMenuPlugin.md#setrefelement)

## Interfaces

### EmbedConfig {#embedconfig}

Defined in: [packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx:43](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx#L43)

#### Type Parameters

##### TEmbedMatchResultData

`TEmbedMatchResultData` = `unknown`

##### TEmbedMatchResult

`TEmbedMatchResult` = [`EmbedMatchResult`](#embedmatchresult)\<`TEmbedMatchResultData`\>

#### Properties

##### insertNode() {#insertnode}

> **insertNode**: (`editor`, `result`) => `void`

Defined in: [packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx:54](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx#L54)

###### Parameters

###### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

###### result

`TEmbedMatchResult`

###### Returns

`void`

##### parseUrl() {#parseurl}

> **parseUrl**: (`text`) => `null` \| `TEmbedMatchResult` \| `Promise`\<`null` \| `TEmbedMatchResult`\>

Defined in: [packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx:50](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx#L50)

###### Parameters

###### text

`string`

###### Returns

`null` \| `TEmbedMatchResult` \| `Promise`\<`null` \| `TEmbedMatchResult`\>

##### type {#type}

> **type**: `string`

Defined in: [packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx:48](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx#L48)

## Type Aliases

### EmbedMatchResult {#embedmatchresult}

> **EmbedMatchResult**\<`TEmbedMatchResult`\> = `object`

Defined in: [packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx:37](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx#L37)

#### Type Parameters

##### TEmbedMatchResult

`TEmbedMatchResult` = `unknown`

#### Properties

##### data? {#data}

> `optional` **data**: `TEmbedMatchResult`

Defined in: [packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx:40](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx#L40)

##### id {#id}

> **id**: `string`

Defined in: [packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx:39](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx#L39)

##### url {#url}

> **url**: `string`

Defined in: [packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx:38](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx#L38)

## Variables

### INSERT\_EMBED\_COMMAND {#insert_embed_command}

> `const` **INSERT\_EMBED\_COMMAND**: [`LexicalCommand`](lexical.md#lexicalcommand)\<[`EmbedConfig`](#embedconfig)\[`"type"`\]\>

Defined in: [packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx:60](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx#L60)

***

### URL\_MATCHER {#url_matcher}

> `const` **URL\_MATCHER**: `RegExp`

Defined in: [packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx:57](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx#L57)

## Functions

### LexicalAutoEmbedPlugin() {#lexicalautoembedplugin}

> **LexicalAutoEmbedPlugin**\<`TEmbedConfig`\>(`__namedParameters`): `null` \| `Element`

Defined in: [packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx:90](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalAutoEmbedPlugin.tsx#L90)

#### Type Parameters

##### TEmbedConfig

`TEmbedConfig` *extends* [`EmbedConfig`](#embedconfig)\<`unknown`, [`EmbedMatchResult`](#embedmatchresult)\<`unknown`\>\>

#### Parameters

##### \_\_namedParameters

`LexicalAutoEmbedPluginProps`\<`TEmbedConfig`\>

#### Returns

`null` \| `Element`
