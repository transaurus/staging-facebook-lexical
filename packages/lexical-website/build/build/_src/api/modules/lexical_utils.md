# @lexical/utils

## Interfaces

### DFSNode {#dfsnode}

Defined in: [packages/lexical-utils/src/index.ts:160](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L160)

#### Properties

##### depth {#depth}

> `readonly` **depth**: `number`

Defined in: [packages/lexical-utils/src/index.ts:161](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L161)

##### node {#node}

> `readonly` **node**: [`LexicalNode`](lexical.md#lexicalnode)

Defined in: [packages/lexical-utils/src/index.ts:162](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L162)

***

### StateConfigWrapper {#stateconfigwrapper}

Defined in: [packages/lexical-utils/src/index.ts:895](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L895)

A wrapper that creates bound functions and methods for the
StateConfig to save some boilerplate when defining methods
or exporting only the accessors from your modules rather
than exposing the StateConfig directly.

#### Type Parameters

##### K

`K` *extends* `string`

##### V

`V`

#### Properties

##### $get() {#get}

> `readonly` **$get**: \<`T`\>(`node`) => `V`

Defined in: [packages/lexical-utils/src/index.ts:899](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L899)

`(node) => $getState(node, stateConfig)`

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](lexical.md#lexicalnode)

###### Parameters

###### node

`T`

###### Returns

`V`

##### $set() {#set}

> `readonly` **$set**: \<`T`\>(`node`, `valueOrUpdater`) => `T`

Defined in: [packages/lexical-utils/src/index.ts:901](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L901)

`(node, valueOrUpdater) => $setState(node, stateConfig, valueOrUpdater)`

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](lexical.md#lexicalnode)

###### Parameters

###### node

`T`

###### valueOrUpdater

[`ValueOrUpdater`](lexical.md#valueorupdater)\<`V`\>

###### Returns

`T`

##### accessors {#accessors}

> `readonly` **accessors**: readonly \[\<`T`\>(`node`) => `V`, \<`T`\>(`node`, `valueOrUpdater`) => `T`\]

Defined in: [packages/lexical-utils/src/index.ts:906](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L906)

`[$get, $set]`

##### stateConfig {#stateconfig}

> `readonly` **stateConfig**: [`StateConfig`](lexical.md#stateconfig)\<`K`, `V`\>

Defined in: [packages/lexical-utils/src/index.ts:897](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L897)

A reference to the stateConfig

#### Methods

##### makeGetterMethod() {#makegettermethod}

> **makeGetterMethod**\<`T`\>(): (`this`) => `V`

Defined in: [packages/lexical-utils/src/index.ts:920](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L920)

`() => function () { return $get(this) }`

Should be called with an explicit `this` type parameter.

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](lexical.md#lexicalnode)

###### Returns

> (`this`): `V`

###### Parameters

###### this

`T`

###### Returns

`V`

###### Example

```ts
class MyNode {
  // …
  myGetter = myWrapper.makeGetterMethod<this>();
}
```

##### makeSetterMethod() {#makesettermethod}

> **makeSetterMethod**\<`T`\>(): (`this`, `valueOrUpdater`) => `T`

Defined in: [packages/lexical-utils/src/index.ts:934](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L934)

`() => function (valueOrUpdater) { return $set(this, valueOrUpdater) }`

Must be called with an explicit `this` type parameter.

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](lexical.md#lexicalnode)

###### Returns

> (`this`, `valueOrUpdater`): `T`

###### Parameters

###### this

`T`

###### valueOrUpdater

[`ValueOrUpdater`](lexical.md#valueorupdater)\<`V`\>

###### Returns

`T`

###### Example

```ts
class MyNode {
  // …
  mySetter = myWrapper.makeSetterMethod<this>();
}
```

## Type Aliases

### DOMNodeToLexicalConversion() {#domnodetolexicalconversion}

> **DOMNodeToLexicalConversion** = (`element`) => [`LexicalNode`](lexical.md#lexicalnode)

Defined in: [packages/lexical-utils/src/index.ts:378](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L378)

#### Parameters

##### element

`Node`

#### Returns

[`LexicalNode`](lexical.md#lexicalnode)

***

### DOMNodeToLexicalConversionMap {#domnodetolexicalconversionmap}

> **DOMNodeToLexicalConversionMap** = `Record`\<`string`, [`DOMNodeToLexicalConversion`](#domnodetolexicalconversion)\>

Defined in: [packages/lexical-utils/src/index.ts:380](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L380)

***

### ObjectKlass() {#objectklass}

> **ObjectKlass**\<`T`\> = (...`args`) => `T`

Defined in: [packages/lexical-utils/src/index.ts:612](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L612)

#### Type Parameters

##### T

`T`

#### Parameters

##### args

...`any`[]

#### Returns

`T`

## Variables

### CAN\_USE\_BEFORE\_INPUT {#can_use_before_input}

> `const` **CAN\_USE\_BEFORE\_INPUT**: `boolean` = `CAN_USE_BEFORE_INPUT_`

Defined in: [packages/lexical-utils/src/index.ts:87](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L87)

***

### CAN\_USE\_DOM {#can_use_dom}

> `const` **CAN\_USE\_DOM**: `boolean` = `CAN_USE_DOM_`

Defined in: [packages/lexical-utils/src/index.ts:88](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L88)

***

### IS\_ANDROID {#is_android}

> `const` **IS\_ANDROID**: `boolean` = `IS_ANDROID_`

Defined in: [packages/lexical-utils/src/index.ts:89](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L89)

***

### IS\_ANDROID\_CHROME {#is_android_chrome}

> `const` **IS\_ANDROID\_CHROME**: `boolean` = `IS_ANDROID_CHROME_`

Defined in: [packages/lexical-utils/src/index.ts:90](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L90)

***

### IS\_APPLE {#is_apple}

> `const` **IS\_APPLE**: `boolean` = `IS_APPLE_`

Defined in: [packages/lexical-utils/src/index.ts:91](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L91)

***

### IS\_APPLE\_WEBKIT {#is_apple_webkit}

> `const` **IS\_APPLE\_WEBKIT**: `boolean` = `IS_APPLE_WEBKIT_`

Defined in: [packages/lexical-utils/src/index.ts:92](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L92)

***

### IS\_CHROME {#is_chrome}

> `const` **IS\_CHROME**: `boolean` = `IS_CHROME_`

Defined in: [packages/lexical-utils/src/index.ts:93](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L93)

***

### IS\_FIREFOX {#is_firefox}

> `const` **IS\_FIREFOX**: `boolean` = `IS_FIREFOX_`

Defined in: [packages/lexical-utils/src/index.ts:94](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L94)

***

### IS\_IOS {#is_ios}

> `const` **IS\_IOS**: `boolean` = `IS_IOS_`

Defined in: [packages/lexical-utils/src/index.ts:95](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L95)

***

### IS\_SAFARI {#is_safari}

> `const` **IS\_SAFARI**: `boolean` = `IS_SAFARI_`

Defined in: [packages/lexical-utils/src/index.ts:96](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L96)

## Functions

### $descendantsMatching() {#descendantsmatching}

> **$descendantsMatching**\<`T`\>(`children`, `$predicate`): `T`[]

Defined in: [packages/lexical-utils/src/index.ts:807](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L807)

A depth first traversal of the children array that stops at and collects
each node that `$predicate` matches. This is typically used to discard
invalid or unsupported wrapping nodes on a children array in the `after`
of an [lexical!DOMConversionOutput](lexical.md#domconversionoutput). For example, a TableNode must only have
TableRowNode as children, but an importer might add invalid nodes based on
caption, tbody, thead, etc. and this will unwrap and discard those.

This function is read-only and performs no mutation operations, which makes
it suitable for import and export purposes but likely not for any in-place
mutation. You should use [$unwrapAndFilterDescendants](#unwrapandfilterdescendants) for in-place
mutations such as node transforms.

#### Type Parameters

##### T

`T` *extends* [`LexicalNode`](lexical.md#lexicalnode)

#### Parameters

##### children

[`LexicalNode`](lexical.md#lexicalnode)[]

The children to traverse

##### $predicate

(`node`) => `node is T`

Should return true for nodes that are permitted to be children of root

#### Returns

`T`[]

The children or their descendants that match $predicate

***

### $dfs() {#dfs}

> **$dfs**(`startNode?`, `endNode?`): [`DFSNode`](#dfsnode)[]

Defined in: [packages/lexical-utils/src/index.ts:177](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L177)

"Depth-First Search" starts at the root/top node of a tree and goes as far as it can down a branch end
before backtracking and finding a new path. Consider solving a maze by hugging either wall, moving down a
branch until you hit a dead-end (leaf) and backtracking to find the nearest branching path and repeat.
It will then return all the nodes found in the search in an array of objects.
Preorder traversal is used, meaning that nodes are listed in the order of when they are FIRST encountered.

#### Parameters

##### startNode?

[`LexicalNode`](lexical.md#lexicalnode)

The node to start the search (inclusive), if omitted, it will start at the root node.

##### endNode?

[`LexicalNode`](lexical.md#lexicalnode)

The node to end the search (inclusive), if omitted, it will find all descendants of the startingNode. If endNode
is an ElementNode, it will stop before visiting any of its children.

#### Returns

[`DFSNode`](#dfsnode)[]

An array of objects of all the nodes found by the search, including their depth into the tree.
\{depth: number, node: LexicalNode\} It will always return at least 1 node (the start node).

***

### $dfsIterator() {#dfsiterator}

> **$dfsIterator**(`startNode?`, `endNode?`): `IterableIterator`\<[`DFSNode`](#dfsnode)\>

Defined in: [packages/lexical-utils/src/index.ts:217](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L217)

$dfs iterator (left to right). Tree traversal is done on the fly as new values are requested with O(1) memory.
Preorder traversal is used, meaning that nodes are iterated over in the order of when they are FIRST encountered.

#### Parameters

##### startNode?

[`LexicalNode`](lexical.md#lexicalnode)

The node to start the search (inclusive), if omitted, it will start at the root node.

##### endNode?

[`LexicalNode`](lexical.md#lexicalnode)

The node to end the search (inclusive), if omitted, it will find all descendants of the startingNode.
If endNode is an ElementNode, the iterator will end as soon as it reaches the endNode (no children will be visited).

#### Returns

`IterableIterator`\<[`DFSNode`](#dfsnode)\>

An iterator, each yielded value is a DFSNode. It will always return at least 1 node (the start node).

***

### ~~$filter()~~ {#filter}

> **$filter**\<`T`\>(`nodes`, `filterFn`): `T`[]

Defined in: [packages/lexical-utils/src/index.ts:637](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L637)

#### Type Parameters

##### T

`T`

#### Parameters

##### nodes

[`LexicalNode`](lexical.md#lexicalnode)[]

Array of nodes that needs to be filtered

##### filterFn

(`node`) => `null` \| `T`

A filter function that returns node if the current node satisfies the condition otherwise null

#### Returns

`T`[]

Array of filtered nodes

#### Deprecated

Use Array filter or flatMap

Filter the nodes

***

### $firstToLastIterator() {#firsttolastiterator}

> **$firstToLastIterator**(`node`): `Iterable`\<[`LexicalNode`](lexical.md#lexicalnode)\>

Defined in: [packages/lexical-utils/src/index.ts:837](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L837)

Return an iterator that yields each child of node from first to last, taking
care to preserve the next sibling before yielding the value in case the caller
removes the yielded node.

#### Parameters

##### node

[`ElementNode`](lexical.md#elementnode)

The node whose children to iterate

#### Returns

`Iterable`\<[`LexicalNode`](lexical.md#lexicalnode)\>

An iterator of the node's children

***

### $getAdjacentCaret() {#getadjacentcaret}

> **$getAdjacentCaret**\<`D`\>(`caret`): `null` \| [`SiblingCaret`](lexical.md#siblingcaret)\<[`LexicalNode`](lexical.md#lexicalnode), `D`\>

Defined in: [packages/lexical-utils/src/index.ts:190](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L190)

Get the adjacent caret in the same direction

#### Type Parameters

##### D

`D` *extends* [`CaretDirection`](lexical.md#caretdirection)

#### Parameters

##### caret

A caret or null

`null` | [`NodeCaret`](lexical.md#nodecaret)\<`D`\>

#### Returns

`null` \| [`SiblingCaret`](lexical.md#siblingcaret)\<[`LexicalNode`](lexical.md#lexicalnode), `D`\>

`caret.getAdjacentCaret()` or `null`

***

### $getDepth() {#getdepth}

> **$getDepth**(`node`): `number`

Defined in: [packages/lexical-utils/src/index.ts:289](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L289)

#### Parameters

##### node

`null` | [`LexicalNode`](lexical.md#lexicalnode)

#### Returns

`number`

***

### $getNearestBlockElementAncestorOrThrow() {#getnearestblockelementancestororthrow}

> **$getNearestBlockElementAncestorOrThrow**(`startNode`): [`ElementNode`](lexical.md#elementnode)

Defined in: [packages/lexical-utils/src/index.ts:361](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L361)

Returns the element node of the nearest ancestor, otherwise throws an error.

#### Parameters

##### startNode

[`LexicalNode`](lexical.md#lexicalnode)

The starting node of the search

#### Returns

[`ElementNode`](lexical.md#elementnode)

The ancestor node found

***

### $getNearestNodeOfType() {#getnearestnodeoftype}

> **$getNearestNodeOfType**\<`T`\>(`node`, `klass`): `null` \| `T`

Defined in: [packages/lexical-utils/src/index.ts:339](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L339)

Takes a node and traverses up its ancestors (toward the root node)
in order to find a specific type of node.

#### Type Parameters

##### T

`T` *extends* [`ElementNode`](lexical.md#elementnode)

#### Parameters

##### node

[`LexicalNode`](lexical.md#lexicalnode)

the node to begin searching.

##### klass

[`Klass`](lexical.md#klass)\<`T`\>

an instance of the type of node to look for.

#### Returns

`null` \| `T`

the node of type klass that was passed, or null if none exist.

***

### $getNextRightPreorderNode() {#getnextrightpreordernode}

> **$getNextRightPreorderNode**(`startingNode`): `null` \| [`LexicalNode`](lexical.md#lexicalnode)

Defined in: [packages/lexical-utils/src/index.ts:309](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L309)

Performs a right-to-left preorder tree traversal.
From the starting node it goes to the rightmost child, than backtracks to parent and finds new rightmost path.
It will return the next node in traversal sequence after the startingNode.
The traversal is similar to $dfs functions above, but the nodes are visited right-to-left, not left-to-right.

#### Parameters

##### startingNode

[`LexicalNode`](lexical.md#lexicalnode)

The node to start the search.

#### Returns

`null` \| [`LexicalNode`](lexical.md#lexicalnode)

The next node in pre-order right to left traversal sequence or `null`, if the node does not exist

***

### $getNextSiblingOrParentSibling() {#getnextsiblingorparentsibling}

> **$getNextSiblingOrParentSibling**(`node`): `null` \| \[[`LexicalNode`](lexical.md#lexicalnode), `number`\]

Defined in: [packages/lexical-utils/src/index.ts:280](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L280)

Returns the Node sibling when this exists, otherwise the closest parent sibling. For example
R -> P -> T1, T2
  -> P2
returns T2 for node T1, P2 for node T2, and null for node P2.

#### Parameters

##### node

[`LexicalNode`](lexical.md#lexicalnode)

LexicalNode.

#### Returns

`null` \| \[[`LexicalNode`](lexical.md#lexicalnode), `number`\]

An array (tuple) containing the found Lexical node and the depth difference, or null, if this node doesn't exist.

***

### $handleIndentAndOutdent() {#handleindentandoutdent}

> **$handleIndentAndOutdent**(`indentOrOutdent`): `boolean`

Defined in: [packages/lexical-utils/src/index.ts:658](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L658)

Applies the provided callback to each indentable block element in the Selection

#### Parameters

##### indentOrOutdent

(`block`) => `void`

callback for performing the indent or outdent action
on a given block element.

#### Returns

`boolean`

true if at least one block was handled, false otherwise.

***

### $insertFirst() {#insertfirst}

> **$insertFirst**(`parent`, `node`): `void`

Defined in: [packages/lexical-utils/src/index.ts:695](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L695)

Appends the node before the first child of the parent node

#### Parameters

##### parent

[`ElementNode`](lexical.md#elementnode)

A parent node

##### node

[`LexicalNode`](lexical.md#lexicalnode)

Node that needs to be appended

#### Returns

`void`

***

### $insertNodeIntoLeaf() {#insertnodeintoleaf}

> **$insertNodeIntoLeaf**(`node`): `void`

Defined in: [packages/lexical-utils/src/index.ts:573](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L573)

Inserts a node into leaf — the deepest accessible node at the carriage position

#### Parameters

##### node

[`LexicalNode`](lexical.md#lexicalnode)

The node to be inserted

#### Returns

`void`

***

### $insertNodeToNearestRoot() {#insertnodetonearestroot}

> **$insertNodeToNearestRoot**\<`T`\>(`node`): `T`

Defined in: [packages/lexical-utils/src/index.ts:504](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L504)

If the selected insertion area is the root/shadow root node (see [lexical!$isRootOrShadowRoot](lexical.md#isrootorshadowroot)),
the node will be appended there, otherwise, it will be inserted before the insertion area.
If there is no selection where the node is to be inserted, it will be appended after any current nodes
within the tree, as a child of the root node. A paragraph will then be added after the inserted node and selected.

#### Type Parameters

##### T

`T` *extends* [`LexicalNode`](lexical.md#lexicalnode)

#### Parameters

##### node

`T`

The node to be inserted

#### Returns

`T`

The node after its insertion

***

### $insertNodeToNearestRootAtCaret() {#insertnodetonearestrootatcaret}

> **$insertNodeToNearestRootAtCaret**\<`T`, `D`\>(`node`, `caret`, `options?`): [`NodeCaret`](lexical.md#nodecaret)\<`D`\>

Defined in: [packages/lexical-utils/src/index.ts:540](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L540)

If the insertion caret is the root/shadow root node (see [lexical!$isRootOrShadowRoot](lexical.md#isrootorshadowroot)),
the node will be inserted there, otherwise the parent nodes will be split according to the
given options.

#### Type Parameters

##### T

`T` *extends* [`LexicalNode`](lexical.md#lexicalnode)

##### D

`D` *extends* [`CaretDirection`](lexical.md#caretdirection)

#### Parameters

##### node

`T`

The node to be inserted

##### caret

[`PointCaret`](lexical.md#pointcaret)\<`D`\>

The location to insert or split from

##### options?

[`SplitAtPointCaretNextOptions`](lexical.md#splitatpointcaretnextoptions)

#### Returns

[`NodeCaret`](lexical.md#nodecaret)\<`D`\>

The node after its insertion

***

### $isEditorIsNestedEditor() {#iseditorisnestededitor}

> **$isEditorIsNestedEditor**(`editor`): `boolean`

Defined in: [packages/lexical-utils/src/index.ts:742](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L742)

Checks if the editor is a nested editor created by LexicalNestedComposer

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

#### Returns

`boolean`

***

### $lastToFirstIterator() {#lasttofirstiterator}

> **$lastToFirstIterator**(`node`): `Iterable`\<[`LexicalNode`](lexical.md#lexicalnode)\>

Defined in: [packages/lexical-utils/src/index.ts:849](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L849)

Return an iterator that yields each child of node from last to first, taking
care to preserve the previous sibling before yielding the value in case the caller
removes the yielded node.

#### Parameters

##### node

[`ElementNode`](lexical.md#elementnode)

The node whose children to iterate

#### Returns

`Iterable`\<[`LexicalNode`](lexical.md#lexicalnode)\>

An iterator of the node's children

***

### $restoreEditorState() {#restoreeditorstate}

> **$restoreEditorState**(`editor`, `editorState`): `void`

Defined in: [packages/lexical-utils/src/index.ts:475](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L475)

Clones the editor and marks it as dirty to be reconciled. If there was a selection,
it would be set back to its previous state, or null otherwise.

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

The lexical editor

##### editorState

[`EditorState`](lexical.md#editorstate)

The editor's state

#### Returns

`void`

***

### $reverseDfs() {#reversedfs}

> **$reverseDfs**(`startNode?`, `endNode?`): [`DFSNode`](#dfsnode)[]

Defined in: [packages/lexical-utils/src/index.ts:202](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L202)

$dfs iterator (right to left). Tree traversal is done on the fly as new values are requested with O(1) memory.

#### Parameters

##### startNode?

[`LexicalNode`](lexical.md#lexicalnode)

The node to start the search, if omitted, it will start at the root node.

##### endNode?

[`LexicalNode`](lexical.md#lexicalnode)

The node to end the search, if omitted, it will find all descendants of the startingNode.

#### Returns

[`DFSNode`](#dfsnode)[]

An iterator, each yielded value is a DFSNode. It will always return at least 1 node (the start node).

***

### $reverseDfsIterator() {#reversedfsiterator}

> **$reverseDfsIterator**(`startNode?`, `endNode?`): `IterableIterator`\<[`DFSNode`](#dfsnode)\>

Defined in: [packages/lexical-utils/src/index.ts:325](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L325)

$dfs iterator (right to left). Tree traversal is done on the fly as new values are requested with O(1) memory.

#### Parameters

##### startNode?

[`LexicalNode`](lexical.md#lexicalnode)

The node to start the search, if omitted, it will start at the root node.

##### endNode?

[`LexicalNode`](lexical.md#lexicalnode)

The node to end the search, if omitted, it will find all descendants of the startingNode.

#### Returns

`IterableIterator`\<[`DFSNode`](#dfsnode)\>

An iterator, each yielded value is a DFSNode. It will always return at least 1 node (the start node).

***

### $unwrapAndFilterDescendants() {#unwrapandfilterdescendants}

> **$unwrapAndFilterDescendants**(`root`, `$predicate`): `boolean`

Defined in: [packages/lexical-utils/src/index.ts:757](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L757)

A depth first last-to-first traversal of root that stops at each node that matches
$predicate and ensures that its parent is root. This is typically used to discard
invalid or unsupported wrapping nodes. For example, a TableNode must only have
TableRowNode as children, but an importer might add invalid nodes based on
caption, tbody, thead, etc. and this will unwrap and discard those.

#### Parameters

##### root

[`ElementNode`](lexical.md#elementnode)

The root to start the traversal

##### $predicate

(`node`) => `boolean`

Should return true for nodes that are permitted to be children of root

#### Returns

`boolean`

true if this unwrapped or removed any nodes

***

### $unwrapNode() {#unwrapnode}

> **$unwrapNode**(`node`): `void`

Defined in: [packages/lexical-utils/src/index.ts:882](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L882)

Replace this node with its children

#### Parameters

##### node

[`ElementNode`](lexical.md#elementnode)

The ElementNode to unwrap and remove

#### Returns

`void`

***

### $wrapNodeInElement() {#wrapnodeinelement}

> **$wrapNodeInElement**(`node`, `createElementNode`): [`ElementNode`](lexical.md#elementnode)

Defined in: [packages/lexical-utils/src/index.ts:601](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L601)

Wraps the node into another node created from a createElementNode function, eg. $createParagraphNode

#### Parameters

##### node

[`LexicalNode`](lexical.md#lexicalnode)

Node to be wrapped.

##### createElementNode

() => [`ElementNode`](lexical.md#elementnode)

Creates a new lexical element to wrap the to-be-wrapped node and returns it.

#### Returns

[`ElementNode`](lexical.md#elementnode)

A new lexical element with the previous node appended within (as a child, including its children).

***

### calculateZoomLevel() {#calculatezoomlevel}

> **calculateZoomLevel**(`element`, `useManualZoom`): `number`

Defined in: [packages/lexical-utils/src/index.ts:725](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L725)

Calculates the zoom level of an element as a result of using
css zoom property. For browsers that implement standardized CSS
zoom (Firefox, Chrome >= 128), this will always return 1.

#### Parameters

##### element

`null` | `Element`

##### useManualZoom

`boolean` = `false`

If true, always use zoom level will be calculated manually, otherwise it will be calculated on as needed basis.

#### Returns

`number`

***

### isMimeType() {#ismimetype}

> **isMimeType**(`file`, `acceptableMimeTypes`): `boolean`

Defined in: [packages/lexical-utils/src/index.ts:106](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L106)

Returns true if the file type matches the types passed within the acceptableMimeTypes array, false otherwise.
The types passed must be strings and are CASE-SENSITIVE.
eg. if file is of type 'text' and acceptableMimeTypes = ['TEXT', 'IMAGE'] the function will return false.

#### Parameters

##### file

`File`

The file you want to type check.

##### acceptableMimeTypes

`string`[]

An array of strings of types which the file is checked against.

#### Returns

`boolean`

true if the file is an acceptable mime type, false otherwise.

***

### makeStateWrapper() {#makestatewrapper}

> **makeStateWrapper**\<`K`, `V`\>(`stateConfig`): [`StateConfigWrapper`](#stateconfigwrapper)\<`K`, `V`\>

Defined in: [packages/lexical-utils/src/index.ts:949](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L949)

EXPERIMENTAL

A convenience interface for working with [$getState](lexical.md#getstate) and
[$setState](lexical.md#setstate).

#### Type Parameters

##### K

`K` *extends* `string`

##### V

`V`

#### Parameters

##### stateConfig

[`StateConfig`](lexical.md#stateconfig)\<`K`, `V`\>

The stateConfig to wrap with convenience functionality

#### Returns

[`StateConfigWrapper`](#stateconfigwrapper)\<`K`, `V`\>

a StateWrapper

***

### markSelection() {#markselection}

> **markSelection**(`editor`, `onReposition`): () => `void`

Defined in: [packages/lexical-utils/src/markSelection.ts:91](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/markSelection.ts#L91)

Place one or multiple newly created Nodes at the current selection. Multiple
nodes will only be created when the selection spans multiple lines (aka
client rects).

This function can come useful when you want to show the selection but the
editor has been focused away.

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### onReposition

(`node`) => `void`

#### Returns

> (): `void`

##### Returns

`void`

***

### mediaFileReader() {#mediafilereader}

> **mediaFileReader**(`files`, `acceptableMimeTypes`): `Promise`\<`object`[]\>

Defined in: [packages/lexical-utils/src/index.ts:129](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L129)

Lexical File Reader with:
 1. MIME type support
 2. batched results (HistoryPlugin compatibility)
 3. Order aware (respects the order when multiple Files are passed)

const filesResult = await mediaFileReader(files, ['image/']);
filesResult.forEach(file => editor.dispatchCommand('INSERT_IMAGE', \{
  src: file.result,
\}));

#### Parameters

##### files

`File`[]

##### acceptableMimeTypes

`string`[]

#### Returns

`Promise`\<`object`[]\>

***

### objectKlassEquals() {#objectklassequals}

> **objectKlassEquals**\<`T`\>(`object`, `objectClass`): `object is T`

Defined in: [packages/lexical-utils/src/index.ts:619](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L619)

#### Type Parameters

##### T

`T`

#### Parameters

##### object

`unknown`

= The instance of the type

##### objectClass

[`ObjectKlass`](#objectklass)\<`T`\>

= The class of the type

#### Returns

`object is T`

Whether the object is has the same Klass of the objectClass, ignoring the difference across window (e.g. different iframes)

***

### positionNodeOnRange() {#positionnodeonrange}

> **positionNodeOnRange**(`editor`, `range`, `onReposition`): () => `void`

Defined in: [packages/lexical-utils/src/positionNodeOnRange.ts:38](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/positionNodeOnRange.ts#L38)

Place one or multiple newly created Nodes at the passed Range's position.
Multiple nodes will only be created when the Range spans multiple lines (aka
client rects).

This function can come particularly useful to highlight particular parts of
the text without interfering with the EditorState, that will often replicate
the state across collab and clipboard.

This function accounts for DOM updates which can modify the passed Range.
Hence, the function return to remove the listener.

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### range

`Range`

##### onReposition

(`node`) => `void`

#### Returns

> (): `void`

##### Returns

`void`

***

### registerNestedElementResolver() {#registernestedelementresolver}

> **registerNestedElementResolver**\<`N`\>(`editor`, `targetNode`, `cloneNode`, `handleOverlap`): () => `void`

Defined in: [packages/lexical-utils/src/index.ts:394](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/index.ts#L394)

Attempts to resolve nested element nodes of the same type into a single node of that type.
It is generally used for marks/commenting

#### Type Parameters

##### N

`N` *extends* [`ElementNode`](lexical.md#elementnode)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

The lexical editor

##### targetNode

[`Klass`](lexical.md#klass)\<`N`\>

The target for the nested element to be extracted from.

##### cloneNode

(`from`) => `N`

See $createMarkNode

##### handleOverlap

(`from`, `to`) => `void`

Handles any overlap between the node to extract and the targetNode

#### Returns

The lexical editor

> (): `void`

##### Returns

`void`

***

### selectionAlwaysOnDisplay() {#selectionalwaysondisplay}

> **selectionAlwaysOnDisplay**(`editor`, `onReposition?`): () => `void`

Defined in: [packages/lexical-utils/src/selectionAlwaysOnDisplay.ts:13](https://github.com/facebook/lexical/tree/main/packages/lexical-utils/src/selectionAlwaysOnDisplay.ts#L13)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### onReposition?

(`node`) => `void`

#### Returns

> (): `void`

##### Returns

`void`

## References

### $findMatchingParent {#findmatchingparent}

Re-exports [$findMatchingParent](lexical.md#findmatchingparent)

***

### $getAdjacentSiblingOrParentSiblingCaret {#getadjacentsiblingorparentsiblingcaret}

Re-exports [$getAdjacentSiblingOrParentSiblingCaret](lexical.md#getadjacentsiblingorparentsiblingcaret)

***

### $splitNode {#splitnode}

Re-exports [$splitNode](lexical.md#splitnode)

***

### addClassNamesToElement {#addclassnamestoelement}

Re-exports [addClassNamesToElement](lexical.md#addclassnamestoelement)

***

### isBlockDomNode {#isblockdomnode}

Re-exports [isBlockDomNode](lexical.md#isblockdomnode)

***

### isHTMLAnchorElement {#ishtmlanchorelement}

Re-exports [isHTMLAnchorElement](lexical.md#ishtmlanchorelement)

***

### isHTMLElement {#ishtmlelement}

Re-exports [isHTMLElement](lexical.md#ishtmlelement)

***

### isInlineDomNode {#isinlinedomnode}

Re-exports [isInlineDomNode](lexical.md#isinlinedomnode)

***

### mergeRegister {#mergeregister}

Re-exports [mergeRegister](lexical.md#mergeregister)

***

### removeClassNamesFromElement {#removeclassnamesfromelement}

Re-exports [removeClassNamesFromElement](lexical.md#removeclassnamesfromelement)
