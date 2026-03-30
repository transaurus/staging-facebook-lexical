# @lexical/yjs

## Interfaces

### BaseBinding {#basebinding}

Defined in: [packages/lexical-yjs/src/Bindings.ts:26](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L26)

#### Extended by

- [`Binding`](#binding)
- [`BindingV2`](#bindingv2)

#### Properties

##### clientID {#clientid}

> **clientID**: `number`

Defined in: [packages/lexical-yjs/src/Bindings.ts:27](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L27)

##### cursors {#cursors}

> **cursors**: `Map`\<`number`, `Cursor`\>

Defined in: [packages/lexical-yjs/src/Bindings.ts:28](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L28)

##### cursorsContainer {#cursorscontainer}

> **cursorsContainer**: `null` \| `HTMLElement`

Defined in: [packages/lexical-yjs/src/Bindings.ts:29](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L29)

##### doc {#doc}

> **doc**: `Doc`

Defined in: [packages/lexical-yjs/src/Bindings.ts:30](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L30)

##### docMap {#docmap}

> **docMap**: `Map`\<`string`, `Doc`\>

Defined in: [packages/lexical-yjs/src/Bindings.ts:31](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L31)

##### editor {#editor}

> **editor**: [`LexicalEditor`](lexical.md#lexicaleditor)

Defined in: [packages/lexical-yjs/src/Bindings.ts:32](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L32)

##### excludedProperties {#excludedproperties}

> **excludedProperties**: [`ExcludedProperties`](#excludedproperties-3)

Defined in: [packages/lexical-yjs/src/Bindings.ts:35](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L35)

##### id {#id}

> **id**: `string`

Defined in: [packages/lexical-yjs/src/Bindings.ts:33](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L33)

##### nodeProperties {#nodeproperties}

> **nodeProperties**: `Map`\<`string`, \{\[`property`: `string`\]: `unknown`; \}\>

Defined in: [packages/lexical-yjs/src/Bindings.ts:34](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L34)

***

### Binding {#binding}

Defined in: [packages/lexical-yjs/src/Bindings.ts:38](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L38)

#### Extends

- [`BaseBinding`](#basebinding)

#### Properties

##### clientID {#clientid-1}

> **clientID**: `number`

Defined in: [packages/lexical-yjs/src/Bindings.ts:27](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L27)

###### Inherited from

[`BaseBinding`](#basebinding).[`clientID`](#clientid)

##### collabNodeMap {#collabnodemap}

> **collabNodeMap**: `Map`\<`string`, `CollabElementNode` \| `CollabTextNode` \| `CollabDecoratorNode` \| `CollabLineBreakNode`\>

Defined in: [packages/lexical-yjs/src/Bindings.ts:39](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L39)

##### cursors {#cursors-1}

> **cursors**: `Map`\<`number`, `Cursor`\>

Defined in: [packages/lexical-yjs/src/Bindings.ts:28](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L28)

###### Inherited from

[`BaseBinding`](#basebinding).[`cursors`](#cursors)

##### cursorsContainer {#cursorscontainer-1}

> **cursorsContainer**: `null` \| `HTMLElement`

Defined in: [packages/lexical-yjs/src/Bindings.ts:29](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L29)

###### Inherited from

[`BaseBinding`](#basebinding).[`cursorsContainer`](#cursorscontainer)

##### doc {#doc-1}

> **doc**: `Doc`

Defined in: [packages/lexical-yjs/src/Bindings.ts:30](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L30)

###### Inherited from

[`BaseBinding`](#basebinding).[`doc`](#doc)

##### docMap {#docmap-1}

> **docMap**: `Map`\<`string`, `Doc`\>

Defined in: [packages/lexical-yjs/src/Bindings.ts:31](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L31)

###### Inherited from

[`BaseBinding`](#basebinding).[`docMap`](#docmap)

##### editor {#editor-1}

> **editor**: [`LexicalEditor`](lexical.md#lexicaleditor)

Defined in: [packages/lexical-yjs/src/Bindings.ts:32](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L32)

###### Inherited from

[`BaseBinding`](#basebinding).[`editor`](#editor)

##### excludedProperties {#excludedproperties-1}

> **excludedProperties**: [`ExcludedProperties`](#excludedproperties-3)

Defined in: [packages/lexical-yjs/src/Bindings.ts:35](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L35)

###### Inherited from

[`BaseBinding`](#basebinding).[`excludedProperties`](#excludedproperties)

##### id {#id-1}

> **id**: `string`

Defined in: [packages/lexical-yjs/src/Bindings.ts:33](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L33)

###### Inherited from

[`BaseBinding`](#basebinding).[`id`](#id)

##### nodeProperties {#nodeproperties-1}

> **nodeProperties**: `Map`\<`string`, \{\[`property`: `string`\]: `unknown`; \}\>

Defined in: [packages/lexical-yjs/src/Bindings.ts:34](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L34)

###### Inherited from

[`BaseBinding`](#basebinding).[`nodeProperties`](#nodeproperties)

##### root {#root}

> **root**: `CollabElementNode`

Defined in: [packages/lexical-yjs/src/Bindings.ts:46](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L46)

***

### BindingV2 {#bindingv2}

Defined in: [packages/lexical-yjs/src/Bindings.ts:49](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L49)

#### Extends

- [`BaseBinding`](#basebinding)

#### Properties

##### clientID {#clientid-2}

> **clientID**: `number`

Defined in: [packages/lexical-yjs/src/Bindings.ts:27](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L27)

###### Inherited from

[`BaseBinding`](#basebinding).[`clientID`](#clientid)

##### cursors {#cursors-2}

> **cursors**: `Map`\<`number`, `Cursor`\>

Defined in: [packages/lexical-yjs/src/Bindings.ts:28](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L28)

###### Inherited from

[`BaseBinding`](#basebinding).[`cursors`](#cursors)

##### cursorsContainer {#cursorscontainer-2}

> **cursorsContainer**: `null` \| `HTMLElement`

Defined in: [packages/lexical-yjs/src/Bindings.ts:29](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L29)

###### Inherited from

[`BaseBinding`](#basebinding).[`cursorsContainer`](#cursorscontainer)

##### doc {#doc-2}

> **doc**: `Doc`

Defined in: [packages/lexical-yjs/src/Bindings.ts:30](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L30)

###### Inherited from

[`BaseBinding`](#basebinding).[`doc`](#doc)

##### docMap {#docmap-2}

> **docMap**: `Map`\<`string`, `Doc`\>

Defined in: [packages/lexical-yjs/src/Bindings.ts:31](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L31)

###### Inherited from

[`BaseBinding`](#basebinding).[`docMap`](#docmap)

##### editor {#editor-2}

> **editor**: [`LexicalEditor`](lexical.md#lexicaleditor)

Defined in: [packages/lexical-yjs/src/Bindings.ts:32](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L32)

###### Inherited from

[`BaseBinding`](#basebinding).[`editor`](#editor)

##### excludedProperties {#excludedproperties-2}

> **excludedProperties**: [`ExcludedProperties`](#excludedproperties-3)

Defined in: [packages/lexical-yjs/src/Bindings.ts:35](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L35)

###### Inherited from

[`BaseBinding`](#basebinding).[`excludedProperties`](#excludedproperties)

##### id {#id-2}

> **id**: `string`

Defined in: [packages/lexical-yjs/src/Bindings.ts:33](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L33)

###### Inherited from

[`BaseBinding`](#basebinding).[`id`](#id)

##### mapping {#mapping}

> **mapping**: `CollabV2Mapping`

Defined in: [packages/lexical-yjs/src/Bindings.ts:50](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L50)

##### nodeProperties {#nodeproperties-2}

> **nodeProperties**: `Map`\<`string`, \{\[`property`: `string`\]: `unknown`; \}\>

Defined in: [packages/lexical-yjs/src/Bindings.ts:34](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L34)

###### Inherited from

[`BaseBinding`](#basebinding).[`nodeProperties`](#nodeproperties)

##### root {#root-1}

> **root**: `YXmlElement`

Defined in: [packages/lexical-yjs/src/Bindings.ts:51](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L51)

***

### Provider {#provider}

Defined in: [packages/lexical-yjs/src/index.ts:58](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L58)

#### Properties

##### awareness {#awareness}

> **awareness**: [`ProviderAwareness`](#providerawareness-1)

Defined in: [packages/lexical-yjs/src/index.ts:59](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L59)

#### Methods

##### connect() {#connect}

> **connect**(): `void` \| `Promise`\<`void`\>

Defined in: [packages/lexical-yjs/src/index.ts:60](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L60)

###### Returns

`void` \| `Promise`\<`void`\>

##### disconnect() {#disconnect}

> **disconnect**(): `void`

Defined in: [packages/lexical-yjs/src/index.ts:61](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L61)

###### Returns

`void`

##### off() {#off}

###### Call Signature

> **off**(`type`, `cb`): `void`

Defined in: [packages/lexical-yjs/src/index.ts:62](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L62)

###### Parameters

###### type

`"sync"`

###### cb

(`isSynced`) => `void`

###### Returns

`void`

###### Call Signature

> **off**(`type`, `cb`): `void`

Defined in: [packages/lexical-yjs/src/index.ts:63](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L63)

###### Parameters

###### type

`"update"`

###### cb

(`arg0`) => `void`

###### Returns

`void`

###### Call Signature

> **off**(`type`, `cb`): `void`

Defined in: [packages/lexical-yjs/src/index.ts:64](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L64)

###### Parameters

###### type

`"status"`

###### cb

(`arg0`) => `void`

###### Returns

`void`

###### Call Signature

> **off**(`type`, `cb`): `void`

Defined in: [packages/lexical-yjs/src/index.ts:65](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L65)

###### Parameters

###### type

`"reload"`

###### cb

(`doc`) => `void`

###### Returns

`void`

##### on() {#on}

###### Call Signature

> **on**(`type`, `cb`): `void`

Defined in: [packages/lexical-yjs/src/index.ts:66](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L66)

###### Parameters

###### type

`"sync"`

###### cb

(`isSynced`) => `void`

###### Returns

`void`

###### Call Signature

> **on**(`type`, `cb`): `void`

Defined in: [packages/lexical-yjs/src/index.ts:67](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L67)

###### Parameters

###### type

`"status"`

###### cb

(`arg0`) => `void`

###### Returns

`void`

###### Call Signature

> **on**(`type`, `cb`): `void`

Defined in: [packages/lexical-yjs/src/index.ts:68](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L68)

###### Parameters

###### type

`"update"`

###### cb

(`arg0`) => `void`

###### Returns

`void`

###### Call Signature

> **on**(`type`, `cb`): `void`

Defined in: [packages/lexical-yjs/src/index.ts:69](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L69)

###### Parameters

###### type

`"reload"`

###### cb

(`doc`) => `void`

###### Returns

`void`

## Type Aliases

### ClientID {#clientid-3}

> **ClientID** = `number`

Defined in: [packages/lexical-yjs/src/Bindings.ts:25](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L25)

***

### Delta {#delta}

> **Delta** = [`Operation`](#operation)[]

Defined in: [packages/lexical-yjs/src/index.ts:77](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L77)

***

### ExcludedProperties {#excludedproperties-3}

> **ExcludedProperties** = `Map`\<[`Klass`](lexical.md#klass)\<[`LexicalNode`](lexical.md#lexicalnode)\>, `Set`\<`string`\>\>

Defined in: [packages/lexical-yjs/src/Bindings.ts:56](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L56)

***

### Operation {#operation}

> **Operation** = `object`

Defined in: [packages/lexical-yjs/src/index.ts:71](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L71)

#### Properties

##### attributes {#attributes}

> **attributes**: `object`

Defined in: [packages/lexical-yjs/src/index.ts:72](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L72)

###### \_\_type

> **\_\_type**: `string`

##### insert {#insert}

> **insert**: `string` \| `Record`\<`string`, `unknown`\>

Defined in: [packages/lexical-yjs/src/index.ts:75](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L75)

***

### ProviderAwareness {#providerawareness-1}

> **ProviderAwareness** = `object`

Defined in: [packages/lexical-yjs/src/index.ts:50](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L50)

#### Properties

##### getLocalState() {#getlocalstate}

> **getLocalState**: () => [`UserState`](#userstate) \| `null`

Defined in: [packages/lexical-yjs/src/index.ts:51](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L51)

###### Returns

[`UserState`](#userstate) \| `null`

##### getStates() {#getstates}

> **getStates**: () => `Map`\<`number`, [`UserState`](#userstate)\>

Defined in: [packages/lexical-yjs/src/index.ts:52](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L52)

###### Returns

`Map`\<`number`, [`UserState`](#userstate)\>

##### off() {#off-5}

> **off**: (`type`, `cb`) => `void`

Defined in: [packages/lexical-yjs/src/index.ts:53](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L53)

###### Parameters

###### type

`"update"`

###### cb

() => `void`

###### Returns

`void`

##### on() {#on-5}

> **on**: (`type`, `cb`) => `void`

Defined in: [packages/lexical-yjs/src/index.ts:54](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L54)

###### Parameters

###### type

`"update"`

###### cb

() => `void`

###### Returns

`void`

##### setLocalState() {#setlocalstate}

> **setLocalState**: (`arg0`) => `void`

Defined in: [packages/lexical-yjs/src/index.ts:55](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L55)

###### Parameters

###### arg0

[`UserState`](#userstate) | `null`

###### Returns

`void`

##### setLocalStateField() {#setlocalstatefield}

> **setLocalStateField**: (`field`, `value`) => `void`

Defined in: [packages/lexical-yjs/src/index.ts:56](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L56)

###### Parameters

###### field

`string`

###### value

`unknown`

###### Returns

`void`

***

### SyncCursorPositionsFn() {#synccursorpositionsfn}

> **SyncCursorPositionsFn** = (`binding`, `provider`, `options?`) => `void`

Defined in: [packages/lexical-yjs/src/SyncCursors.ts:599](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/SyncCursors.ts#L599)

#### Parameters

##### binding

`AnyBinding`

##### provider

[`Provider`](#provider)

##### options?

`SyncCursorPositionsOptions`

#### Returns

`void`

***

### UserState {#userstate}

> **UserState** = `object`

Defined in: [packages/lexical-yjs/src/index.ts:25](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L25)

#### Indexable

\[`key`: `string`\]: `unknown`

#### Properties

##### anchorPos {#anchorpos}

> **anchorPos**: `null` \| `RelativePosition`

Defined in: [packages/lexical-yjs/src/index.ts:26](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L26)

##### awarenessData {#awarenessdata}

> **awarenessData**: `object`

Defined in: [packages/lexical-yjs/src/index.ts:31](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L31)

##### color {#color}

> **color**: `string`

Defined in: [packages/lexical-yjs/src/index.ts:27](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L27)

##### focusing {#focusing}

> **focusing**: `boolean`

Defined in: [packages/lexical-yjs/src/index.ts:28](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L28)

##### focusPos {#focuspos}

> **focusPos**: `null` \| `RelativePosition`

Defined in: [packages/lexical-yjs/src/index.ts:29](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L29)

##### name {#name}

> **name**: `string`

Defined in: [packages/lexical-yjs/src/index.ts:30](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L30)

***

### YjsEvent {#yjsevent}

> **YjsEvent** = `Record`\<`string`, `unknown`\>

Defined in: [packages/lexical-yjs/src/index.ts:79](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L79)

***

### YjsNode {#yjsnode}

> **YjsNode** = `Record`\<`string`, `unknown`\>

Defined in: [packages/lexical-yjs/src/index.ts:78](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L78)

## Variables

### CLEAR\_DIFF\_VERSIONS\_COMMAND\_\_EXPERIMENTAL {#clear_diff_versions_command__experimental}

> `const` **CLEAR\_DIFF\_VERSIONS\_COMMAND\_\_EXPERIMENTAL**: [`LexicalCommand`](lexical.md#lexicalcommand)\<`void`\>

Defined in: [packages/lexical-yjs/src/index.ts:46](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L46)

***

### CONNECTED\_COMMAND {#connected_command}

> `const` **CONNECTED\_COMMAND**: [`LexicalCommand`](lexical.md#lexicalcommand)\<`boolean`\>

Defined in: [packages/lexical-yjs/src/index.ts:34](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L34)

***

### DIFF\_VERSIONS\_COMMAND\_\_EXPERIMENTAL {#diff_versions_command__experimental}

> `const` **DIFF\_VERSIONS\_COMMAND\_\_EXPERIMENTAL**: [`LexicalCommand`](lexical.md#lexicalcommand)\<\{ `prevSnapshot?`: `Snapshot`; `snapshot?`: `Snapshot`; \}\>

Defined in: [packages/lexical-yjs/src/index.ts:40](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L40)

***

### TOGGLE\_CONNECT\_COMMAND {#toggle_connect_command}

> `const` **TOGGLE\_CONNECT\_COMMAND**: [`LexicalCommand`](lexical.md#lexicalcommand)\<`boolean`\>

Defined in: [packages/lexical-yjs/src/index.ts:36](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L36)

## Functions

### $getYChangeState() {#getychangestate}

> **$getYChangeState**\<`UserT`\>(`node`): `null` \| `YChange`\<`UserT`\>

Defined in: [packages/lexical-yjs/src/RenderSnapshot.ts:36](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/RenderSnapshot.ts#L36)

#### Type Parameters

##### UserT

`UserT` = `unknown`

#### Parameters

##### node

[`LexicalNode`](lexical.md#lexicalnode)

#### Returns

`null` \| `YChange`\<`UserT`\>

***

### createBinding() {#createbinding}

> **createBinding**(`editor`, `provider`, `id`, `doc`, `docMap`, `excludedProperties?`): [`Binding`](#binding)

Defined in: [packages/lexical-yjs/src/Bindings.ts:84](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L84)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### provider

[`Provider`](#provider)

##### id

`string`

##### doc

`undefined` | `null` | `Doc`

##### docMap

`Map`\<`string`, `Doc`\>

##### excludedProperties?

[`ExcludedProperties`](#excludedproperties-3)

#### Returns

[`Binding`](#binding)

***

### createBindingV2\_\_EXPERIMENTAL() {#createbindingv2__experimental}

> **createBindingV2\_\_EXPERIMENTAL**(`editor`, `id`, `doc`, `docMap`, `options`): [`BindingV2`](#bindingv2)

Defined in: [packages/lexical-yjs/src/Bindings.ts:110](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/Bindings.ts#L110)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### id

`string`

##### doc

`undefined` | `null` | `Doc`

##### docMap

`Map`\<`string`, `Doc`\>

##### options

###### excludedProperties?

[`ExcludedProperties`](#excludedproperties-3)

###### rootName?

`string`

#### Returns

[`BindingV2`](#bindingv2)

***

### createUndoManager() {#createundomanager}

> **createUndoManager**(`binding`, `root`): `UndoManager`

Defined in: [packages/lexical-yjs/src/index.ts:90](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L90)

#### Parameters

##### binding

[`BaseBinding`](#basebinding)

##### root

`YXmlText` | `YXmlElement`\<\{\[`key`: `string`\]: `string`; \}\>

#### Returns

`UndoManager`

***

### ~~getAnchorAndFocusCollabNodesForUserState()~~ {#getanchorandfocuscollabnodesforuserstate}

> **getAnchorAndFocusCollabNodesForUserState**(`binding`, `userState`): `object`

Defined in: [packages/lexical-yjs/src/SyncCursors.ts:361](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/SyncCursors.ts#L361)

#### Parameters

##### binding

[`Binding`](#binding)

##### userState

[`UserState`](#userstate)

#### Returns

`object`

##### ~~anchorCollabNode~~

> **anchorCollabNode**: `null` \| `AnyCollabNode`

##### ~~anchorOffset~~

> **anchorOffset**: `number`

##### ~~focusCollabNode~~

> **focusCollabNode**: `null` \| `AnyCollabNode`

##### ~~focusOffset~~

> **focusOffset**: `number`

#### Deprecated

Use `$getAnchorAndFocusForUserState` instead.

***

### initLocalState() {#initlocalstate}

> **initLocalState**(`provider`, `name`, `color`, `focusing`, `awarenessData`): `void`

Defined in: [packages/lexical-yjs/src/index.ts:99](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L99)

#### Parameters

##### provider

[`Provider`](#provider)

##### name

`string`

##### color

`string`

##### focusing

`boolean`

##### awarenessData

`object`

#### Returns

`void`

***

### renderSnapshot\_\_EXPERIMENTAL() {#rendersnapshot__experimental}

> **renderSnapshot\_\_EXPERIMENTAL**(`binding`, `snapshot`, `prevSnapshot`): `void`

Defined in: [packages/lexical-yjs/src/RenderSnapshot.ts:52](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/RenderSnapshot.ts#L52)

Replaces the editor content with a view that compares the state between two given snapshots.
Any added or removed nodes between the two snapshots will have YChange attached to them.

#### Parameters

##### binding

[`BindingV2`](#bindingv2)

Yjs binding

##### snapshot

`Snapshot` = `...`

Ending snapshot state (default: current state of the Yjs document)

##### prevSnapshot

`Snapshot` = `emptySnapshot`

Starting snapshot state (default: empty snapshot)

#### Returns

`void`

***

### setLocalStateFocus() {#setlocalstatefocus}

> **setLocalStateFocus**(`provider`, `name`, `color`, `focusing`, `awarenessData`): `void`

Defined in: [packages/lexical-yjs/src/index.ts:116](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/index.ts#L116)

#### Parameters

##### provider

[`Provider`](#provider)

##### name

`string`

##### color

`string`

##### focusing

`boolean`

##### awarenessData

`object`

#### Returns

`void`

***

### syncCursorPositions() {#synccursorpositions}

> **syncCursorPositions**(`binding`, `provider`, `options?`): `void`

Defined in: [packages/lexical-yjs/src/SyncCursors.ts:619](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/SyncCursors.ts#L619)

#### Parameters

##### binding

`AnyBinding`

##### provider

[`Provider`](#provider)

##### options?

`SyncCursorPositionsOptions`

#### Returns

`void`

***

### syncLexicalUpdateToYjs() {#synclexicalupdatetoyjs}

> **syncLexicalUpdateToYjs**(`binding`, `provider`, `prevEditorState`, `currEditorState`, `dirtyElements`, `dirtyLeaves`, `normalizedNodes`, `tags`): `void`

Defined in: [packages/lexical-yjs/src/SyncEditorStates.ts:271](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/SyncEditorStates.ts#L271)

#### Parameters

##### binding

[`Binding`](#binding)

##### provider

[`Provider`](#provider)

##### prevEditorState

[`EditorState`](lexical.md#editorstate)

##### currEditorState

[`EditorState`](lexical.md#editorstate)

##### dirtyElements

`Map`\<`string`, `boolean`\>

##### dirtyLeaves

`Set`\<`string`\>

##### normalizedNodes

`Set`\<`string`\>

##### tags

`Set`\<`string`\>

#### Returns

`void`

***

### syncLexicalUpdateToYjsV2\_\_EXPERIMENTAL() {#synclexicalupdatetoyjsv2__experimental}

> **syncLexicalUpdateToYjsV2\_\_EXPERIMENTAL**(`binding`, `provider`, `prevEditorState`, `currEditorState`, `dirtyElements`, `normalizedNodes`, `tags`): `void`

Defined in: [packages/lexical-yjs/src/SyncEditorStates.ts:432](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/SyncEditorStates.ts#L432)

#### Parameters

##### binding

[`BindingV2`](#bindingv2)

##### provider

[`Provider`](#provider)

##### prevEditorState

[`EditorState`](lexical.md#editorstate)

##### currEditorState

[`EditorState`](lexical.md#editorstate)

##### dirtyElements

`Map`\<`string`, `boolean`\>

##### normalizedNodes

`Set`\<`string`\>

##### tags

`Set`\<`string`\>

#### Returns

`void`

***

### syncYjsChangesToLexical() {#syncyjschangestolexical}

> **syncYjsChangesToLexical**(`binding`, `provider`, `events`, `isFromUndoManger`, `syncCursorPositionsFn`): `void`

Defined in: [packages/lexical-yjs/src/SyncEditorStates.ts:134](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/SyncEditorStates.ts#L134)

#### Parameters

##### binding

[`Binding`](#binding)

##### provider

[`Provider`](#provider)

##### events

`YEvent`\<`YText`\>[]

##### isFromUndoManger

`boolean`

##### syncCursorPositionsFn

[`SyncCursorPositionsFn`](#synccursorpositionsfn) = `syncCursorPositions`

#### Returns

`void`

***

### syncYjsChangesToLexicalV2\_\_EXPERIMENTAL() {#syncyjschangestolexicalv2__experimental}

> **syncYjsChangesToLexicalV2\_\_EXPERIMENTAL**(`binding`, `provider`, `events`, `transaction`, `isFromUndoManger`): `void`

Defined in: [packages/lexical-yjs/src/SyncEditorStates.ts:349](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/SyncEditorStates.ts#L349)

#### Parameters

##### binding

[`BindingV2`](#bindingv2)

##### provider

[`Provider`](#provider)

##### events

`YEvent`\<`YXmlText` \| `YXmlElement`\<\{\[`key`: `string`\]: `string`; \}\>\>[]

##### transaction

`Transaction`

##### isFromUndoManger

`boolean`

#### Returns

`void`

***

### syncYjsStateToLexicalV2\_\_EXPERIMENTAL() {#syncyjsstatetolexicalv2__experimental}

> **syncYjsStateToLexicalV2\_\_EXPERIMENTAL**(`binding`, `provider`): `void`

Defined in: [packages/lexical-yjs/src/SyncEditorStates.ts:406](https://github.com/facebook/lexical/tree/main/packages/lexical-yjs/src/SyncEditorStates.ts#L406)

#### Parameters

##### binding

[`BindingV2`](#bindingv2)

##### provider

[`Provider`](#provider)

#### Returns

`void`
