# @lexical/react/LexicalNodeMenuPlugin

## Classes

### MenuOption {#menuoption}

Defined in: [packages/lexical-react/src/shared/LexicalMenu.tsx:52](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/LexicalMenu.tsx#L52)

#### Extended by

- [`AutoEmbedOption`](lexical_react_LexicalAutoEmbedPlugin.md#autoembedoption)

#### Constructors

##### Constructor

> **new MenuOption**(`key`): [`MenuOption`](#menuoption)

Defined in: [packages/lexical-react/src/shared/LexicalMenu.tsx:58](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/LexicalMenu.tsx#L58)

###### Parameters

###### key

`string`

###### Returns

[`MenuOption`](#menuoption)

#### Properties

##### icon? {#icon}

> `optional` **icon**: `Element`

Defined in: [packages/lexical-react/src/shared/LexicalMenu.tsx:55](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/LexicalMenu.tsx#L55)

##### key {#key}

> **key**: `string`

Defined in: [packages/lexical-react/src/shared/LexicalMenu.tsx:53](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/LexicalMenu.tsx#L53)

##### ref? {#ref}

> `optional` **ref**: `RefObject`\<`null` \| `HTMLElement`\>

Defined in: [packages/lexical-react/src/shared/LexicalMenu.tsx:54](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/LexicalMenu.tsx#L54)

##### title? {#title}

> `optional` **title**: `string` \| `Element`

Defined in: [packages/lexical-react/src/shared/LexicalMenu.tsx:56](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/LexicalMenu.tsx#L56)

#### Methods

##### setRefElement() {#setrefelement}

> **setRefElement**(`element`): `void`

Defined in: [packages/lexical-react/src/shared/LexicalMenu.tsx:64](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/LexicalMenu.tsx#L64)

###### Parameters

###### element

`null` | `HTMLElement`

###### Returns

`void`

## Type Aliases

### MenuRenderFn() {#menurenderfn}

> **MenuRenderFn**\<`TOption`\> = (`anchorElementRef`, `itemProps`, `matchingString`) => `ReactPortal` \| `JSX.Element` \| `null`

Defined in: [packages/lexical-react/src/shared/LexicalMenu.tsx:69](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/LexicalMenu.tsx#L69)

#### Type Parameters

##### TOption

`TOption` *extends* [`MenuOption`](#menuoption)

#### Parameters

##### anchorElementRef

`RefObject`\<`HTMLElement` \| `null`\>

##### itemProps

###### options

`TOption`[]

###### selectedIndex

`number` \| `null`

###### selectOptionAndCleanUp

(`option`) => `void`

###### setHighlightedIndex

(`index`) => `void`

##### matchingString

`string`

#### Returns

`ReactPortal` \| `JSX.Element` \| `null`

***

### MenuResolution {#menuresolution}

> **MenuResolution** = `object`

Defined in: [packages/lexical-react/src/shared/LexicalMenu.tsx:47](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/LexicalMenu.tsx#L47)

#### Properties

##### getRect() {#getrect}

> **getRect**: () => `DOMRect`

Defined in: [packages/lexical-react/src/shared/LexicalMenu.tsx:49](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/LexicalMenu.tsx#L49)

###### Returns

`DOMRect`

##### match? {#match}

> `optional` **match**: [`MenuTextMatch`](lexical_react_LexicalTypeaheadMenuPlugin.md#menutextmatch)

Defined in: [packages/lexical-react/src/shared/LexicalMenu.tsx:48](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/LexicalMenu.tsx#L48)

***

### NodeMenuPluginProps {#nodemenupluginprops}

> **NodeMenuPluginProps**\<`TOption`\> = `object`

Defined in: [packages/lexical-react/src/LexicalNodeMenuPlugin.tsx:26](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeMenuPlugin.tsx#L26)

#### Type Parameters

##### TOption

`TOption` *extends* [`MenuOption`](#menuoption)

#### Properties

##### anchorClassName? {#anchorclassname}

> `optional` **anchorClassName**: `string`

Defined in: [packages/lexical-react/src/LexicalNodeMenuPlugin.tsx:38](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeMenuPlugin.tsx#L38)

##### commandPriority? {#commandpriority}

> `optional` **commandPriority**: [`CommandListenerPriority`](lexical.md#commandlistenerpriority)

Defined in: [packages/lexical-react/src/LexicalNodeMenuPlugin.tsx:39](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeMenuPlugin.tsx#L39)

##### menuRenderFn? {#menurenderfn-1}

> `optional` **menuRenderFn**: [`MenuRenderFn`](#menurenderfn)\<`TOption`\>

Defined in: [packages/lexical-react/src/LexicalNodeMenuPlugin.tsx:35](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeMenuPlugin.tsx#L35)

##### nodeKey {#nodekey}

> **nodeKey**: [`NodeKey`](lexical.md#nodekey) \| `null`

Defined in: [packages/lexical-react/src/LexicalNodeMenuPlugin.tsx:34](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeMenuPlugin.tsx#L34)

##### onClose()? {#onclose}

> `optional` **onClose**: () => `void`

Defined in: [packages/lexical-react/src/LexicalNodeMenuPlugin.tsx:36](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeMenuPlugin.tsx#L36)

###### Returns

`void`

##### onOpen()? {#onopen}

> `optional` **onOpen**: (`resolution`) => `void`

Defined in: [packages/lexical-react/src/LexicalNodeMenuPlugin.tsx:37](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeMenuPlugin.tsx#L37)

###### Parameters

###### resolution

[`MenuResolution`](#menuresolution)

###### Returns

`void`

##### onSelectOption() {#onselectoption}

> **onSelectOption**: (`option`, `textNodeContainingQuery`, `closeMenu`, `matchingString`) => `void`

Defined in: [packages/lexical-react/src/LexicalNodeMenuPlugin.tsx:27](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeMenuPlugin.tsx#L27)

###### Parameters

###### option

`TOption`

###### textNodeContainingQuery

[`TextNode`](lexical.md#textnode) | `null`

###### closeMenu

() => `void`

###### matchingString

`string`

###### Returns

`void`

##### options {#options}

> **options**: `TOption`[]

Defined in: [packages/lexical-react/src/LexicalNodeMenuPlugin.tsx:33](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeMenuPlugin.tsx#L33)

##### parent? {#parent}

> `optional` **parent**: `HTMLElement`

Defined in: [packages/lexical-react/src/LexicalNodeMenuPlugin.tsx:40](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeMenuPlugin.tsx#L40)

## Functions

### LexicalNodeMenuPlugin() {#lexicalnodemenuplugin}

> **LexicalNodeMenuPlugin**\<`TOption`\>(`__namedParameters`): `null` \| `Element`

Defined in: [packages/lexical-react/src/LexicalNodeMenuPlugin.tsx:43](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeMenuPlugin.tsx#L43)

#### Type Parameters

##### TOption

`TOption` *extends* [`MenuOption`](#menuoption)

#### Parameters

##### \_\_namedParameters

[`NodeMenuPluginProps`](#nodemenupluginprops)\<`TOption`\>

#### Returns

`null` \| `Element`
