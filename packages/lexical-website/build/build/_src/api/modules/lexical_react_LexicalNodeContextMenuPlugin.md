# @lexical/react/LexicalNodeContextMenuPlugin

## Classes

### NodeContextMenuOption {#nodecontextmenuoption}

Defined in: [packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx:43](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx#L43)

#### Extends

- `MenuOption`

#### Constructors

##### Constructor

> **new NodeContextMenuOption**(`title`, `options`): [`NodeContextMenuOption`](#nodecontextmenuoption)

Defined in: [packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx:51](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx#L51)

###### Parameters

###### title

`string`

###### options

###### $onSelect

() => `void`

###### $showOn?

(`node`) => `boolean`

###### disabled?

`boolean`

###### icon?

`Element`

###### Returns

[`NodeContextMenuOption`](#nodecontextmenuoption)

###### Overrides

`MenuOption.constructor`

#### Properties

##### $onSelect() {#onselect}

> **$onSelect**: () => `void`

Defined in: [packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx:48](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx#L48)

###### Returns

`void`

##### $showOn()? {#showon}

> `optional` **$showOn**: (`node`) => `boolean`

Defined in: [packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx:49](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx#L49)

###### Parameters

###### node

[`LexicalNode`](lexical.md#lexicalnode)

###### Returns

`boolean`

##### disabled {#disabled}

> **disabled**: `boolean`

Defined in: [packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx:47](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx#L47)

##### icon {#icon}

> **icon**: `null` \| `Element`

Defined in: [packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx:46](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx#L46)

##### key {#key}

> **key**: `string`

Defined in: [packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx:29](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx#L29)

###### Inherited from

`MenuOption.key`

##### ref? {#ref}

> `optional` **ref**: `RefObject`\<`null` \| `HTMLElement`\>

Defined in: [packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx:30](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx#L30)

###### Inherited from

`MenuOption.ref`

##### title {#title}

> **title**: `string`

Defined in: [packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx:45](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx#L45)

##### type {#type}

> **type**: `string`

Defined in: [packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx:44](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx#L44)

#### Methods

##### setRefElement() {#setrefelement}

> **setRefElement**(`element`): `void`

Defined in: [packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx:38](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx#L38)

###### Parameters

###### element

`null` | `HTMLElement`

###### Returns

`void`

###### Inherited from

`MenuOption.setRefElement`

***

### NodeContextMenuSeparator {#nodecontextmenuseparator}

Defined in: [packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx:72](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx#L72)

#### Extends

- `MenuOption`

#### Constructors

##### Constructor

> **new NodeContextMenuSeparator**(`options?`): [`NodeContextMenuSeparator`](#nodecontextmenuseparator)

Defined in: [packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx:76](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx#L76)

###### Parameters

###### options?

###### $showOn?

(`node`) => `boolean`

###### Returns

[`NodeContextMenuSeparator`](#nodecontextmenuseparator)

###### Overrides

`MenuOption.constructor`

#### Properties

##### $showOn()? {#showon-1}

> `optional` **$showOn**: (`node`) => `boolean`

Defined in: [packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx:74](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx#L74)

###### Parameters

###### node

[`LexicalNode`](lexical.md#lexicalnode)

###### Returns

`boolean`

##### key {#key-1}

> **key**: `string`

Defined in: [packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx:29](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx#L29)

###### Inherited from

`MenuOption.key`

##### ref? {#ref-1}

> `optional` **ref**: `RefObject`\<`null` \| `HTMLElement`\>

Defined in: [packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx:30](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx#L30)

###### Inherited from

`MenuOption.ref`

##### type {#type-1}

> **type**: `string`

Defined in: [packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx:73](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx#L73)

#### Methods

##### setRefElement() {#setrefelement-2}

> **setRefElement**(`element`): `void`

Defined in: [packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx:38](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx#L38)

###### Parameters

###### element

`null` | `HTMLElement`

###### Returns

`void`

###### Inherited from

`MenuOption.setRefElement`

## Variables

### NodeContextMenuPlugin {#nodecontextmenuplugin}

> `const` **NodeContextMenuPlugin**: `ForwardRefExoticComponent`\<`Omit`\<`Props` & `HTMLProps`\<`HTMLButtonElement`\>, `"ref"`\> & `RefAttributes`\<`HTMLButtonElement`\>\>

Defined in: [packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx:140](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNodeContextMenuPlugin.tsx#L140)
