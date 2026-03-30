# lexical

## Classes

### DecoratorNode {#decoratornode}

Defined in: [packages/lexical/src/nodes/LexicalDecoratorNode.ts:16](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalDecoratorNode.ts#L16)

#### Extends

- [`LexicalNode`](#lexicalnode)

#### Extended by

- [`DecoratorBlockNode`](lexical_react_LexicalDecoratorBlockNode.md#decoratorblocknode)
- [`DecoratorTextNode`](lexical_extension.md#decoratortextnode)
- [`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode)

#### Type Parameters

##### T

`T`

#### Constructors

##### Constructor

> **new DecoratorNode**\<`T`\>(`key?`): [`DecoratorNode`](#decoratornode)\<`T`\>

Defined in: [packages/lexical/src/LexicalNode.ts:569](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L569)

###### Parameters

###### key?

`string`

###### Returns

[`DecoratorNode`](#decoratornode)\<`T`\>

#### Properties

##### importDOM()? {#importdom}

> `static` `optional` **importDOM**: () => `null` \| [`DOMConversionMap`](#domconversionmap)\<`any`\>

Defined in: [packages/lexical/src/LexicalNode.ts:567](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L567)

###### Returns

`null` \| [`DOMConversionMap`](#domconversionmap)\<`any`\>

#### Methods

##### $config() {#config}

> **$config**(): [`BaseStaticNodeConfig`](#basestaticnodeconfig)

Defined in: [packages/lexical/src/LexicalNode.ts:475](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L475)

Override this to implement the new static node configuration protocol,
this method is called directly on the prototype and must not depend
on anything initialized in the constructor. Generally it should be
a trivial implementation.

###### Returns

[`BaseStaticNodeConfig`](#basestaticnodeconfig)

###### Example

```ts
class MyNode extends TextNode {
  $config() {
    return this.config('my-node', {extends: TextNode});
  }
}
```

###### Inherited from

[`LexicalNode`](#lexicalnode).[`$config`](#config-15)

##### afterCloneFrom() {#afterclonefrom}

> **afterCloneFrom**(`prevNode`): `void`

Defined in: [packages/lexical/src/LexicalNode.ts:544](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L544)

Perform any state updates on the clone of prevNode that are not already
handled by the constructor call in the static clone method. If you have
state to update in your clone that is not handled directly by the
constructor, it is advisable to override this method but it is required
to include a call to `super.afterCloneFrom(prevNode)` in your
implementation. This is only intended to be called by
[$cloneWithProperties](#clonewithproperties) function or via a super call.

###### Parameters

###### prevNode

`this`

###### Returns

`void`

###### Example

```ts
class ClassesTextNode extends TextNode {
  // Not shown: static getType, static importJSON, exportJSON, createDOM, updateDOM
  __classes = new Set<string>();
  static clone(node: ClassesTextNode): ClassesTextNode {
    // The inherited TextNode constructor is used here, so
    // classes is not set by this method.
    return new ClassesTextNode(node.__text, node.__key);
  }
  afterCloneFrom(node: this): void {
    // This calls TextNode.afterCloneFrom and LexicalNode.afterCloneFrom
    // for necessary state updates
    super.afterCloneFrom(node);
    this.__addClasses(node.__classes);
  }
  // This method is a private implementation detail, it is not
  // suitable for the public API because it does not call getWritable
  __addClasses(classNames: Iterable<string>): this {
    for (const className of classNames) {
      this.__classes.add(className);
    }
    return this;
  }
  addClass(...classNames: string[]): this {
    return this.getWritable().__addClasses(classNames);
  }
  removeClass(...classNames: string[]): this {
    const node = this.getWritable();
    for (const className of classNames) {
      this.__classes.delete(className);
    }
    return this;
  }
  getClasses(): Set<string> {
    return this.getLatest().__classes;
  }
}
```

###### Inherited from

[`LexicalNode`](#lexicalnode).[`afterCloneFrom`](#afterclonefrom-6)

##### config() {#config-2}

> **config**\<`Type`, `Config`\>(`type`, `config`): `StaticNodeConfigRecord`\<`Type`, `Config`\>

Defined in: [packages/lexical/src/LexicalNode.ts:484](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L484)

This is a convenience method for $config that
aids in type inference. See [LexicalNode.$config](#config-15)
for example usage.

###### Type Parameters

###### Type

`Type` *extends* `string`

###### Config

`Config` *extends* [`StaticNodeConfigValue`](#staticnodeconfigvalue)\<[`DecoratorNode`](#decoratornode)\<`T`\>, `Type`\>

###### Parameters

###### type

`Type`

###### config

`Config`

###### Returns

`StaticNodeConfigRecord`\<`Type`, `Config`\>

###### Inherited from

[`LexicalNode`](#lexicalnode).[`config`](#config-17)

##### createDOM() {#createdom}

> **createDOM**(`_config`, `_editor`): `HTMLElement`

Defined in: [packages/lexical/src/LexicalNode.ts:1094](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1094)

Called during the reconciliation process to determine which nodes
to insert into the DOM for this Lexical Node.

This method must return exactly one HTMLElement. Nested elements are not supported.

Do not attempt to update the Lexical EditorState during this phase of the update lifecycle.

###### Parameters

###### \_config

[`EditorConfig`](#editorconfig)

allows access to things like the EditorTheme (to apply classes) during reconciliation.

###### \_editor

[`LexicalEditor`](#lexicaleditor)

allows access to the editor for context during reconciliation.

###### Returns

`HTMLElement`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`createDOM`](#createdom-12)

##### createParentElementNode() {#createparentelementnode}

> **createParentElementNode**(): [`ElementNode`](#elementnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1414](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1414)

The creation logic for any required parent. Should be implemented if [isParentRequired](#isparentrequired-6) returns true.

###### Returns

[`ElementNode`](#elementnode)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`createParentElementNode`](#createparentelementnode-6)

##### decorate() {#decorate}

> **decorate**(`editor`, `config`): `null` \| `T`

Defined in: [packages/lexical/src/nodes/LexicalDecoratorNode.ts:30](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalDecoratorNode.ts#L30)

The returned value is added to the LexicalEditor._decorators

###### Parameters

###### editor

[`LexicalEditor`](#lexicaleditor)

###### config

[`EditorConfig`](#editorconfig)

###### Returns

`null` \| `T`

##### exportDOM() {#exportdom}

> **exportDOM**(`editor`): [`DOMExportOutput`](#domexportoutput)

Defined in: [packages/lexical/src/LexicalNode.ts:1124](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1124)

Controls how the this node is serialized to HTML. This is important for
copy and paste between Lexical and non-Lexical editors, or Lexical editors with different namespaces,
in which case the primary transfer format is HTML. It's also important if you're serializing
to HTML for any other reason via [@lexical/html!$generateHtmlFromNodes](lexical_html.md#generatehtmlfromnodes). You could
also use this method to build your own HTML renderer.

###### Parameters

###### editor

[`LexicalEditor`](#lexicaleditor)

###### Returns

[`DOMExportOutput`](#domexportoutput)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`exportDOM`](#exportdom-8)

##### exportJSON() {#exportjson}

> **exportJSON**(): [`SerializedLexicalNode`](#serializedlexicalnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1136](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1136)

Controls how the this node is serialized to JSON. This is important for
copy and paste between Lexical editors sharing the same namespace. It's also important
if you're serializing to JSON for persistent storage somewhere.
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Returns

[`SerializedLexicalNode`](#serializedlexicalnode)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`exportJSON`](#exportjson-8)

##### ~~getCommonAncestor()~~ {#getcommonancestor}

> **getCommonAncestor**\<`T`\>(`node`): `null` \| `T`

Defined in: [packages/lexical/src/LexicalNode.ts:861](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L861)

###### Type Parameters

###### T

`T` *extends* [`ElementNode`](#elementnode) = [`ElementNode`](#elementnode)

###### Parameters

###### node

[`LexicalNode`](#lexicalnode)

the other node to find the common ancestor of.

###### Returns

`null` \| `T`

###### Deprecated

use [$getCommonAncestor](#getcommonancestor-8)

Returns the closest common ancestor of this node and the provided one or null
if one cannot be found.

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getCommonAncestor`](#getcommonancestor-6)

##### getIndexWithinParent() {#getindexwithinparent}

> **getIndexWithinParent**(): `number`

Defined in: [packages/lexical/src/LexicalNode.ts:687](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L687)

Returns the zero-based index of this node within the parent.

###### Returns

`number`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getIndexWithinParent`](#getindexwithinparent-6)

##### getKey() {#getkey}

> **getKey**(): `string`

Defined in: [packages/lexical/src/LexicalNode.ts:679](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L679)

Returns this nodes key.

###### Returns

`string`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getKey`](#getkey-10)

##### getLatest() {#getlatest}

> **getLatest**(): `this`

Defined in: [packages/lexical/src/LexicalNode.ts:1012](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1012)

Returns the latest version of the node from the active EditorState.
This is used to avoid getting values from stale node references.

###### Returns

`this`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getLatest`](#getlatest-7)

##### getNextSibling() {#getnextsibling}

> **getNextSibling**\<`T`\>(): `null` \| `T`

Defined in: [packages/lexical/src/LexicalNode.ts:832](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L832)

Returns the "next" siblings - that is, the node that comes
after this one in the same parent

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Returns

`null` \| `T`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getNextSibling`](#getnextsibling-6)

##### getNextSiblings() {#getnextsiblings}

> **getNextSiblings**\<`T`\>(): `T`[]

Defined in: [packages/lexical/src/LexicalNode.ts:843](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L843)

Returns all "next" siblings - that is, the nodes that come between this
one and the last child of it's parent, inclusive.

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Returns

`T`[]

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getNextSiblings`](#getnextsiblings-6)

##### getNodesBetween() {#getnodesbetween}

> **getNodesBetween**(`targetNode`): [`LexicalNode`](#lexicalnode)[]

Defined in: [packages/lexical/src/LexicalNode.ts:931](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L931)

Returns a list of nodes that are between this node and
the target node in the EditorState.

###### Parameters

###### targetNode

[`LexicalNode`](#lexicalnode)

the node that marks the other end of the range of nodes to be returned.

###### Returns

[`LexicalNode`](#lexicalnode)[]

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getNodesBetween`](#getnodesbetween-6)

##### getParent() {#getparent}

> **getParent**\<`T`\>(): `null` \| `T`

Defined in: [packages/lexical/src/LexicalNode.ts:707](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L707)

Returns the parent of this node, or null if none is found.

###### Type Parameters

###### T

`T` *extends* [`ElementNode`](#elementnode)

###### Returns

`null` \| `T`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getParent`](#getparent-6)

##### getParentKeys() {#getparentkeys}

> **getParentKeys**(): `string`[]

Defined in: [packages/lexical/src/LexicalNode.ts:784](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L784)

Returns a list of the keys of every ancestor of this node,
all the way up to the RootNode.

###### Returns

`string`[]

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getParentKeys`](#getparentkeys-6)

##### getParentOrThrow() {#getparentorthrow}

> **getParentOrThrow**\<`T`\>(): `T`

Defined in: [packages/lexical/src/LexicalNode.ts:718](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L718)

Returns the parent of this node, or throws if none is found.

###### Type Parameters

###### T

`T` *extends* [`ElementNode`](#elementnode)

###### Returns

`T`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getParentOrThrow`](#getparentorthrow-6)

##### getParents() {#getparents}

> **getParents**(): [`ElementNode`](#elementnode)[]

Defined in: [packages/lexical/src/LexicalNode.ts:769](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L769)

Returns a list of the every ancestor of this node,
all the way up to the RootNode.

###### Returns

[`ElementNode`](#elementnode)[]

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getParents`](#getparents-6)

##### getPreviousSibling() {#getprevioussibling}

> **getPreviousSibling**\<`T`\>(): `null` \| `T`

Defined in: [packages/lexical/src/LexicalNode.ts:799](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L799)

Returns the "previous" siblings - that is, the node that comes
before this one in the same parent.

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Returns

`null` \| `T`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getPreviousSibling`](#getprevioussibling-6)

##### getPreviousSiblings() {#getprevioussiblings}

> **getPreviousSiblings**\<`T`\>(): `T`[]

Defined in: [packages/lexical/src/LexicalNode.ts:810](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L810)

Returns the "previous" siblings - that is, the nodes that come between
this one and the first child of it's parent, inclusive.

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Returns

`T`[]

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getPreviousSiblings`](#getprevioussiblings-6)

##### getTextContent() {#gettextcontent}

> **getTextContent**(): `string`

Defined in: [packages/lexical/src/LexicalNode.ts:1068](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1068)

Returns the text content of the node. Override this for
custom nodes that should have a representation in plain text
format (for copy + paste, for example)

###### Returns

`string`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getTextContent`](#gettextcontent-12)

##### getTextContentSize() {#gettextcontentsize}

> **getTextContentSize**(): `number`

Defined in: [packages/lexical/src/LexicalNode.ts:1076](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1076)

Returns the length of the string produced by calling getTextContent on this node.

###### Returns

`number`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getTextContentSize`](#gettextcontentsize-6)

##### getTopLevelElement() {#gettoplevelelement}

> **getTopLevelElement**(): `null` \| [`ElementNode`](#elementnode) \| [`DecoratorNode`](#decoratornode)\<`T`\>

Defined in: [packages/lexical/src/nodes/LexicalDecoratorNode.ts:17](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalDecoratorNode.ts#L17)

Returns the highest (in the EditorState tree)
non-root ancestor of this node, or null if none is found. See [lexical!$isRootOrShadowRoot](#isrootorshadowroot)
for more information on which Elements comprise "roots".

###### Returns

`null` \| [`ElementNode`](#elementnode) \| [`DecoratorNode`](#decoratornode)\<`T`\>

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getTopLevelElement`](#gettoplevelelement-6)

##### getTopLevelElementOrThrow() {#gettoplevelelementorthrow}

> **getTopLevelElementOrThrow**(): [`ElementNode`](#elementnode) \| [`DecoratorNode`](#decoratornode)\<`T`\>

Defined in: [packages/lexical/src/nodes/LexicalDecoratorNode.ts:18](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalDecoratorNode.ts#L18)

Returns the highest (in the EditorState tree)
non-root ancestor of this node, or throws if none is found. See [lexical!$isRootOrShadowRoot](#isrootorshadowroot)
for more information on which Elements comprise "roots".

###### Returns

[`ElementNode`](#elementnode) \| [`DecoratorNode`](#decoratornode)\<`T`\>

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getTopLevelElementOrThrow`](#gettoplevelelementorthrow-8)

##### getType() {#gettype}

> **getType**(): `string`

Defined in: [packages/lexical/src/LexicalNode.ts:593](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L593)

Returns the string type of this node.

###### Returns

`string`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getType`](#gettype-20)

##### getWritable() {#getwritable}

> **getWritable**(): `this`

Defined in: [packages/lexical/src/LexicalNode.ts:1032](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1032)

Returns a mutable version of the node using [$cloneWithProperties](#clonewithproperties)
if necessary. Will throw an error if called outside of a Lexical Editor
[LexicalEditor.update](#update) callback.

###### Returns

`this`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getWritable`](#getwritable-6)

##### insertAfter() {#insertafter}

> **insertAfter**(`nodeToInsert`, `restoreSelection`): [`LexicalNode`](#lexicalnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1299](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1299)

Inserts a node after this LexicalNode (as the next sibling).

###### Parameters

###### nodeToInsert

[`LexicalNode`](#lexicalnode)

The node to insert after this one.

###### restoreSelection

`boolean` = `true`

Whether or not to attempt to resolve the
selection to the appropriate place after the operation is complete.

###### Returns

[`LexicalNode`](#lexicalnode)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`insertAfter`](#insertafter-8)

##### insertBefore() {#insertbefore}

> **insertBefore**(`nodeToInsert`, `restoreSelection`): [`LexicalNode`](#lexicalnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1366](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1366)

Inserts a node before this LexicalNode (as the previous sibling).

###### Parameters

###### nodeToInsert

[`LexicalNode`](#lexicalnode)

The node to insert before this one.

###### restoreSelection

`boolean` = `true`

Whether or not to attempt to resolve the
selection to the appropriate place after the operation is complete.

###### Returns

[`LexicalNode`](#lexicalnode)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`insertBefore`](#insertbefore-8)

##### is() {#is}

> **is**(`object`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:878](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L878)

Returns true if the provided node is the exact same one as this node, from Lexical's perspective.
Always use this instead of referential equality.

###### Parameters

###### object

the node to perform the equality comparison on.

`undefined` | `null` | [`LexicalNode`](#lexicalnode)

###### Returns

`boolean`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`is`](#is-8)

##### isAttached() {#isattached}

> **isAttached**(): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:610](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L610)

Returns true if there is a path between this node and the RootNode, false otherwise.
This is a way of determining if the node is "attached" EditorState. Unattached nodes
won't be reconciled and will ultimately be cleaned up by the Lexical GC.

###### Returns

`boolean`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`isAttached`](#isattached-6)

##### isBefore() {#isbefore}

> **isBefore**(`targetNode`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:896](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L896)

Returns true if this node logically precedes the target node in the
editor state, false otherwise (including if there is no common ancestor).

Note that this notion of isBefore is based on post-order; a descendant
node is always before its ancestors. See also
[$getCommonAncestor](#getcommonancestor-8) and [$comparePointCaretNext](#comparepointcaretnext) for
more flexible ways to determine the relative positions of nodes.

###### Parameters

###### targetNode

[`LexicalNode`](#lexicalnode)

the node we're testing to see if it's after this one.

###### Returns

`boolean`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`isBefore`](#isbefore-6)

##### isDirty() {#isdirty}

> **isDirty**(): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:1001](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1001)

Returns true if this node has been marked dirty during this update cycle.

###### Returns

`boolean`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`isDirty`](#isdirty-6)

##### isInline() {#isinline}

> **isInline**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalDecoratorNode.ts:38](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalDecoratorNode.ts#L38)

###### Returns

`boolean`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`isInline`](#isinline-8)

##### isIsolated() {#isisolated}

> **isIsolated**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalDecoratorNode.ts:34](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalDecoratorNode.ts#L34)

###### Returns

`boolean`

##### isKeyboardSelectable() {#iskeyboardselectable}

> **isKeyboardSelectable**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalDecoratorNode.ts:42](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalDecoratorNode.ts#L42)

###### Returns

`boolean`

##### isParentOf() {#isparentof}

> **isParentOf**(`targetNode`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:919](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L919)

Returns true if this node is an ancestor of and distinct from the target node, false otherwise.

###### Parameters

###### targetNode

[`LexicalNode`](#lexicalnode)

the would-be child node.

###### Returns

`boolean`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`isParentOf`](#isparentof-6)

##### isParentRequired() {#isparentrequired}

> **isParentRequired**(): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:1406](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1406)

Whether or not this node has a required parent. Used during copy + paste operations
to normalize nodes that would otherwise be orphaned. For example, ListItemNodes without
a ListNode parent or TextNodes with a ParagraphNode parent.

###### Returns

`boolean`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`isParentRequired`](#isparentrequired-6)

##### isSelected() {#isselected}

> **isSelected**(`selection?`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:634](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L634)

Returns true if this node is contained within the provided Selection., false otherwise.
Relies on the algorithms implemented in [BaseSelection.getNodes](#getnodes) to determine
what's included.

###### Parameters

###### selection?

The selection that we want to determine if the node is in.

`null` | [`BaseSelection`](#baseselection)

###### Returns

`boolean`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`isSelected`](#isselected-6)

##### markDirty() {#markdirty}

> **markDirty**(): `void`

Defined in: [packages/lexical/src/LexicalNode.ts:1475](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1475)

Marks a node dirty, triggering transforms and
forcing it to be reconciled during the update cycle.

###### Returns

`void`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`markDirty`](#markdirty-6)

##### remove() {#remove}

> **remove**(`preserveEmptyParent?`): `void`

Defined in: [packages/lexical/src/LexicalNode.ts:1218](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1218)

Removes this LexicalNode from the EditorState. If the node isn't re-inserted
somewhere, the Lexical garbage collector will eventually clean it up.

###### Parameters

###### preserveEmptyParent?

`boolean`

If falsy, the node's parent will be removed if
it's empty after the removal operation. This is the default behavior, subject to
other node heuristics such as [ElementNode#canBeEmpty](#canbeempty)

###### Returns

`void`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`remove`](#remove-10)

##### replace() {#replace}

> **replace**\<`N`\>(`replaceWith`, `includeChildren?`): `N`

Defined in: [packages/lexical/src/LexicalNode.ts:1229](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1229)

Replaces this LexicalNode with the provided node, optionally transferring the children
of the replaced node to the replacing node.

###### Type Parameters

###### N

`N` *extends* [`LexicalNode`](#lexicalnode)

###### Parameters

###### replaceWith

`N`

The node to replace this one with.

###### includeChildren?

`boolean`

Whether or not to transfer the children of this node to the replacing node.

###### Returns

`N`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`replace`](#replace-8)

##### resetOnCopyNodeFrom() {#resetoncopynodefrom}

> **resetOnCopyNodeFrom**(`originalNode`): `void`

Defined in: [packages/lexical/src/LexicalNode.ts:560](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L560)

Reset state in this copy of originalNode, if necessary

###### Parameters

###### originalNode

`this`

###### Returns

`void`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`resetOnCopyNodeFrom`](#resetoncopynodefrom-6)

##### selectEnd() {#selectend}

> **selectEnd**(): [`RangeSelection`](#rangeselection)

Defined in: [packages/lexical/src/LexicalNode.ts:1422](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1422)

###### Returns

[`RangeSelection`](#rangeselection)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`selectEnd`](#selectend-6)

##### selectNext() {#selectnext}

> **selectNext**(`anchorOffset?`, `focusOffset?`): [`RangeSelection`](#rangeselection)

Defined in: [packages/lexical/src/LexicalNode.ts:1454](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1454)

Moves selection to the next sibling of this node, at the specified offsets.

###### Parameters

###### anchorOffset?

`number`

The anchor offset for selection.

###### focusOffset?

`number`

The focus offset for selection

###### Returns

[`RangeSelection`](#rangeselection)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`selectNext`](#selectnext-6)

##### selectPrevious() {#selectprevious}

> **selectPrevious**(`anchorOffset?`, `focusOffset?`): [`RangeSelection`](#rangeselection)

Defined in: [packages/lexical/src/LexicalNode.ts:1432](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1432)

Moves selection to the previous sibling of this node, at the specified offsets.

###### Parameters

###### anchorOffset?

`number`

The anchor offset for selection.

###### focusOffset?

`number`

The focus offset for selection

###### Returns

[`RangeSelection`](#rangeselection)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`selectPrevious`](#selectprevious-6)

##### selectStart() {#selectstart}

> **selectStart**(): [`RangeSelection`](#rangeselection)

Defined in: [packages/lexical/src/LexicalNode.ts:1418](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1418)

###### Returns

[`RangeSelection`](#rangeselection)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`selectStart`](#selectstart-6)

##### updateDOM() {#updatedom}

> **updateDOM**(`_prevNode`, `_dom`, `_config`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:1108](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1108)

Called when a node changes and should update the DOM
in whatever way is necessary to make it align with any changes that might
have happened during the update.

Returning "true" here will cause lexical to unmount and recreate the DOM node
(by calling createDOM). You would need to do this if the element tag changes,
for instance.

###### Parameters

###### \_prevNode

`unknown`

###### \_dom

`HTMLElement`

###### \_config

[`EditorConfig`](#editorconfig)

###### Returns

`boolean`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`updateDOM`](#updatedom-12)

##### updateFromJSON() {#updatefromjson}

> **updateFromJSON**(`serializedNode`): `this`

Defined in: [packages/lexical/src/LexicalNode.ts:1189](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1189)

Update this LexicalNode instance from serialized JSON. It's recommended
to implement as much logic as possible in this method instead of the
static importJSON method, so that the functionality can be inherited in subclasses.

The LexicalUpdateJSON utility type should be used to ignore any type, version,
or children properties in the JSON so that the extended JSON from subclasses
are acceptable parameters for the super call.

If overridden, this method must call super.

###### Parameters

###### serializedNode

[`LexicalUpdateJSON`](#lexicalupdatejson)\<[`SerializedLexicalNode`](#serializedlexicalnode)\>

###### Returns

`this`

###### Example

```ts
class MyTextNode extends TextNode {
  // ...
  static importJSON(serializedNode: SerializedMyTextNode): MyTextNode {
    return $createMyTextNode()
      .updateFromJSON(serializedNode);
  }
  updateFromJSON(
    serializedNode: LexicalUpdateJSON<SerializedMyTextNode>,
  ): this {
    return super.updateFromJSON(serializedNode)
      .setMyProperty(serializedNode.myProperty);
  }
}
```

###### Inherited from

[`LexicalNode`](#lexicalnode).[`updateFromJSON`](#updatefromjson-6)

##### clone() {#clone}

> `static` **clone**(`_data`): [`LexicalNode`](#lexicalnode)

Defined in: [packages/lexical/src/LexicalNode.ts:452](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L452)

Clones this node, creating a new node with a different key
and adding it to the EditorState (but not attaching it anywhere!). All nodes must
implement this method.

###### Parameters

###### \_data

`unknown`

###### Returns

[`LexicalNode`](#lexicalnode)

##### getType() {#gettype-2}

> `static` **getType**(): `string`

Defined in: [packages/lexical/src/LexicalNode.ts:436](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L436)

Returns the string type of this node. Every node must
implement this and it MUST BE UNIQUE amongst nodes registered
on the editor.

###### Returns

`string`

##### importJSON() {#importjson}

> `static` **importJSON**(`_serializedNode`): [`LexicalNode`](#lexicalnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1153](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1153)

Controls how the this node is deserialized from JSON. This is usually boilerplate,
but provides an abstraction between the node implementation and serialized interface that can
be important if you ever make breaking changes to a node schema (by adding or removing properties).
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Parameters

###### \_serializedNode

[`SerializedLexicalNode`](#serializedlexicalnode)

###### Returns

[`LexicalNode`](#lexicalnode)

##### transform() {#transform}

> `static` **transform**(): `null` \| (`node`) => `void`

Defined in: [packages/lexical/src/LexicalNode.ts:1204](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1204)

**`Experimental`**

Registers the returned function as a transform on the node during
Editor initialization. Most such use cases should be addressed via
the [LexicalEditor.registerNodeTransform](#registernodetransform) API.

Experimental - use at your own risk.

###### Returns

`null` \| (`node`) => `void`

***

### ElementNode {#elementnode}

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:78](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L78)

#### Extends

- [`LexicalNode`](#lexicalnode)

#### Extended by

- [`OverflowNode`](lexical_overflow.md#overflownode)
- [`QuoteNode`](lexical_rich-text.md#quotenode)
- [`HeadingNode`](lexical_rich-text.md#headingnode)
- [`ParagraphNode`](#paragraphnode)
- [`RootNode`](#rootnode)
- [`CodeNode`](lexical_code.md#codenode)
- [`LinkNode`](lexical_link.md#linknode)
- [`ListItemNode`](lexical_list.md#listitemnode)
- [`ListNode`](lexical_list.md#listnode)
- [`MarkNode`](lexical_mark.md#marknode)
- [`TableCellNode`](lexical_table.md#tablecellnode)
- [`TableNode`](lexical_table.md#tablenode)
- [`TableRowNode`](lexical_table.md#tablerownode)

#### Constructors

##### Constructor

> **new ElementNode**(`key?`): [`ElementNode`](#elementnode)

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:333](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L333)

###### Parameters

###### key?

`string`

###### Returns

[`ElementNode`](#elementnode)

#### Properties

##### importDOM()? {#importdom-1}

> `static` `optional` **importDOM**: () => `null` \| [`DOMConversionMap`](#domconversionmap)\<`any`\>

Defined in: [packages/lexical/src/LexicalNode.ts:567](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L567)

###### Returns

`null` \| [`DOMConversionMap`](#domconversionmap)\<`any`\>

#### Methods

##### $config() {#config-4}

> **$config**(): [`BaseStaticNodeConfig`](#basestaticnodeconfig)

Defined in: [packages/lexical/src/LexicalNode.ts:475](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L475)

Override this to implement the new static node configuration protocol,
this method is called directly on the prototype and must not depend
on anything initialized in the constructor. Generally it should be
a trivial implementation.

###### Returns

[`BaseStaticNodeConfig`](#basestaticnodeconfig)

###### Example

```ts
class MyNode extends TextNode {
  $config() {
    return this.config('my-node', {extends: TextNode});
  }
}
```

###### Inherited from

[`LexicalNode`](#lexicalnode).[`$config`](#config-15)

##### afterCloneFrom() {#afterclonefrom-2}

> **afterCloneFrom**(`prevNode`): `void`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:346](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L346)

Perform any state updates on the clone of prevNode that are not already
handled by the constructor call in the static clone method. If you have
state to update in your clone that is not handled directly by the
constructor, it is advisable to override this method but it is required
to include a call to `super.afterCloneFrom(prevNode)` in your
implementation. This is only intended to be called by
[$cloneWithProperties](#clonewithproperties) function or via a super call.

###### Parameters

###### prevNode

`this`

###### Returns

`void`

###### Example

```ts
class ClassesTextNode extends TextNode {
  // Not shown: static getType, static importJSON, exportJSON, createDOM, updateDOM
  __classes = new Set<string>();
  static clone(node: ClassesTextNode): ClassesTextNode {
    // The inherited TextNode constructor is used here, so
    // classes is not set by this method.
    return new ClassesTextNode(node.__text, node.__key);
  }
  afterCloneFrom(node: this): void {
    // This calls TextNode.afterCloneFrom and LexicalNode.afterCloneFrom
    // for necessary state updates
    super.afterCloneFrom(node);
    this.__addClasses(node.__classes);
  }
  // This method is a private implementation detail, it is not
  // suitable for the public API because it does not call getWritable
  __addClasses(classNames: Iterable<string>): this {
    for (const className of classNames) {
      this.__classes.add(className);
    }
    return this;
  }
  addClass(...classNames: string[]): this {
    return this.getWritable().__addClasses(classNames);
  }
  removeClass(...classNames: string[]): this {
    const node = this.getWritable();
    for (const className of classNames) {
      this.__classes.delete(className);
    }
    return this;
  }
  getClasses(): Set<string> {
    return this.getLatest().__classes;
  }
}
```

###### Inherited from

[`LexicalNode`](#lexicalnode).[`afterCloneFrom`](#afterclonefrom-6)

##### append() {#append}

> **append**(...`nodesToAppend`): `this`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:652](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L652)

###### Parameters

###### nodesToAppend

...[`LexicalNode`](#lexicalnode)[]

###### Returns

`this`

##### canBeEmpty() {#canbeempty}

> **canBeEmpty**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:935](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L935)

###### Returns

`boolean`

##### canIndent() {#canindent}

> **canIndent**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:907](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L907)

###### Returns

`boolean`

##### canInsertTextAfter() {#caninserttextafter}

> **canInsertTextAfter**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:941](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L941)

###### Returns

`boolean`

##### canInsertTextBefore() {#caninserttextbefore}

> **canInsertTextBefore**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:938](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L938)

###### Returns

`boolean`

##### canMergeWhenEmpty() {#canmergewhenempty}

> **canMergeWhenEmpty**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:979](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L979)

Determines whether this node, when empty, can merge with a first block
of nodes being inserted.

This method is specifically called in [RangeSelection.insertNodes](#insertnodes-4)
to determine merging behavior during nodes insertion.

###### Returns

`boolean`

###### Example

```ts
// In a ListItemNode or QuoteNode implementation:
canMergeWhenEmpty(): true {
 return true;
}
```

##### clear() {#clear}

> **clear**(): `this`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:646](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L646)

###### Returns

`this`

##### collapseAtStart() {#collapseatstart}

> **collapseAtStart**(`selection`): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:921](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L921)

###### Parameters

###### selection

[`RangeSelection`](#rangeselection)

###### Returns

`boolean`

##### config() {#config-6}

> **config**\<`Type`, `Config`\>(`type`, `config`): `StaticNodeConfigRecord`\<`Type`, `Config`\>

Defined in: [packages/lexical/src/LexicalNode.ts:484](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L484)

This is a convenience method for $config that
aids in type inference. See [LexicalNode.$config](#config-15)
for example usage.

###### Type Parameters

###### Type

`Type` *extends* `string`

###### Config

`Config` *extends* [`StaticNodeConfigValue`](#staticnodeconfigvalue)\<[`ElementNode`](#elementnode), `Type`\>

###### Parameters

###### type

`Type`

###### config

`Config`

###### Returns

`StaticNodeConfigRecord`\<`Type`, `Config`\>

###### Inherited from

[`LexicalNode`](#lexicalnode).[`config`](#config-17)

##### createDOM() {#createdom-2}

> **createDOM**(`_config`, `_editor`): `HTMLElement`

Defined in: [packages/lexical/src/LexicalNode.ts:1094](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1094)

Called during the reconciliation process to determine which nodes
to insert into the DOM for this Lexical Node.

This method must return exactly one HTMLElement. Nested elements are not supported.

Do not attempt to update the Lexical EditorState during this phase of the update lifecycle.

###### Parameters

###### \_config

[`EditorConfig`](#editorconfig)

allows access to things like the EditorTheme (to apply classes) during reconciliation.

###### \_editor

[`LexicalEditor`](#lexicaleditor)

allows access to the editor for context during reconciliation.

###### Returns

`HTMLElement`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`createDOM`](#createdom-12)

##### createParentElementNode() {#createparentelementnode-2}

> **createParentElementNode**(): [`ElementNode`](#elementnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1414](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1414)

The creation logic for any required parent. Should be implemented if [isParentRequired](#isparentrequired-6) returns true.

###### Returns

[`ElementNode`](#elementnode)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`createParentElementNode`](#createparentelementnode-6)

##### excludeFromCopy() {#excludefromcopy}

> **excludeFromCopy**(`destination?`): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:924](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L924)

###### Parameters

###### destination?

`"clone"` | `"html"`

###### Returns

`boolean`

##### exportDOM() {#exportdom-2}

> **exportDOM**(`editor`): [`DOMExportOutput`](#domexportoutput)

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:837](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L837)

Controls how the this node is serialized to HTML. This is important for
copy and paste between Lexical and non-Lexical editors, or Lexical editors with different namespaces,
in which case the primary transfer format is HTML. It's also important if you're serializing
to HTML for any other reason via [@lexical/html!$generateHtmlFromNodes](lexical_html.md#generatehtmlfromnodes). You could
also use this method to build your own HTML renderer.

###### Parameters

###### editor

[`LexicalEditor`](#lexicaleditor)

###### Returns

[`DOMExportOutput`](#domexportoutput)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`exportDOM`](#exportdom-8)

##### exportJSON() {#exportjson-2}

> **exportJSON**(): [`SerializedElementNode`](#serializedelementnode)

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:860](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L860)

Controls how the this node is serialized to JSON. This is important for
copy and paste between Lexical editors sharing the same namespace. It's also important
if you're serializing to JSON for persistent storage somewhere.
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Returns

[`SerializedElementNode`](#serializedelementnode)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`exportJSON`](#exportjson-8)

##### extractWithChild() {#extractwithchild}

> **extractWithChild**(`child`, `selection`, `destination`): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:958](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L958)

###### Parameters

###### child

[`LexicalNode`](#lexicalnode)

###### selection

`null` | [`BaseSelection`](#baseselection)

###### destination

`"clone"` | `"html"`

###### Returns

`boolean`

##### getAllTextNodes() {#getalltextnodes}

> **getAllTextNodes**(): [`TextNode`](#textnode)[]

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:412](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L412)

###### Returns

[`TextNode`](#textnode)[]

##### getChildAtIndex() {#getchildatindex}

> **getChildAtIndex**\<`T`\>(`index`): `null` \| `T`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:493](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L493)

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Parameters

###### index

`number`

###### Returns

`null` \| `T`

##### getChildren() {#getchildren}

> **getChildren**\<`T`\>(): `T`[]

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:377](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L377)

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Returns

`T`[]

##### getChildrenKeys() {#getchildrenkeys}

> **getChildrenKeys**(): `string`[]

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:386](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L386)

###### Returns

`string`[]

##### getChildrenSize() {#getchildrensize}

> **getChildrenSize**(): `number`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:395](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L395)

###### Returns

`number`

##### ~~getCommonAncestor()~~ {#getcommonancestor-2}

> **getCommonAncestor**\<`T`\>(`node`): `null` \| `T`

Defined in: [packages/lexical/src/LexicalNode.ts:861](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L861)

###### Type Parameters

###### T

`T` *extends* [`ElementNode`](#elementnode) = [`ElementNode`](#elementnode)

###### Parameters

###### node

[`LexicalNode`](#lexicalnode)

the other node to find the common ancestor of.

###### Returns

`null` \| `T`

###### Deprecated

use [$getCommonAncestor](#getcommonancestor-8)

Returns the closest common ancestor of this node and the provided one or null
if one cannot be found.

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getCommonAncestor`](#getcommonancestor-6)

##### getDescendantByIndex() {#getdescendantbyindex}

> **getDescendantByIndex**\<`T`\>(`index`): `null` \| `T`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:449](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L449)

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Parameters

###### index

`number`

###### Returns

`null` \| `T`

##### getDirection() {#getdirection}

> **getDirection**(): `null` \| `"ltr"` \| `"rtl"`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:556](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L556)

###### Returns

`null` \| `"ltr"` \| `"rtl"`

##### getFirstChild() {#getfirstchild}

> **getFirstChild**\<`T`\>(): `null` \| `T`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:469](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L469)

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Returns

`null` \| `T`

##### getFirstChildOrThrow() {#getfirstchildorthrow}

> **getFirstChildOrThrow**\<`T`\>(): `T`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:474](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L474)

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Returns

`T`

##### getFirstDescendant() {#getfirstdescendant}

> **getFirstDescendant**\<`T`\>(): `null` \| `T`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:427](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L427)

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Returns

`null` \| `T`

##### getFormat() {#getformat}

> **getFormat**(): `number`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:361](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L361)

###### Returns

`number`

##### getFormatFlags() {#getformatflags}

> **getFormatFlags**(`type`, `alignWithFormat`): `number`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:580](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L580)

Returns the format flags applied to the node as a 32-bit integer.

###### Parameters

###### type

[`TextFormatType`](#textformattype)

###### alignWithFormat

`null` | `number`

###### Returns

`number`

a number representing the TextFormatTypes applied to the node.

##### getFormatType() {#getformattype}

> **getFormatType**(): [`ElementFormatType`](#elementformattype)

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:365](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L365)

###### Returns

[`ElementFormatType`](#elementformattype)

##### getIndent() {#getindent}

> **getIndent**(): `number`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:373](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L373)

###### Returns

`number`

##### getIndexWithinParent() {#getindexwithinparent-2}

> **getIndexWithinParent**(): `number`

Defined in: [packages/lexical/src/LexicalNode.ts:687](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L687)

Returns the zero-based index of this node within the parent.

###### Returns

`number`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getIndexWithinParent`](#getindexwithinparent-6)

##### getKey() {#getkey-2}

> **getKey**(): `string`

Defined in: [packages/lexical/src/LexicalNode.ts:679](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L679)

Returns this nodes key.

###### Returns

`string`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getKey`](#getkey-10)

##### getLastChild() {#getlastchild}

> **getLastChild**\<`T`\>(): `null` \| `T`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:481](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L481)

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Returns

`null` \| `T`

##### getLastChildOrThrow() {#getlastchildorthrow}

> **getLastChildOrThrow**\<`T`\>(): `T`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:486](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L486)

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Returns

`T`

##### getLastDescendant() {#getlastdescendant}

> **getLastDescendant**\<`T`\>(): `null` \| `T`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:438](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L438)

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Returns

`null` \| `T`

##### getLatest() {#getlatest-2}

> **getLatest**(): `this`

Defined in: [packages/lexical/src/LexicalNode.ts:1012](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1012)

Returns the latest version of the node from the active EditorState.
This is used to avoid getting values from stale node references.

###### Returns

`this`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getLatest`](#getlatest-7)

##### getNextSibling() {#getnextsibling-2}

> **getNextSibling**\<`T`\>(): `null` \| `T`

Defined in: [packages/lexical/src/LexicalNode.ts:832](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L832)

Returns the "next" siblings - that is, the node that comes
after this one in the same parent

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Returns

`null` \| `T`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getNextSibling`](#getnextsibling-6)

##### getNextSiblings() {#getnextsiblings-2}

> **getNextSiblings**\<`T`\>(): `T`[]

Defined in: [packages/lexical/src/LexicalNode.ts:843](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L843)

Returns all "next" siblings - that is, the nodes that come between this
one and the last child of it's parent, inclusive.

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Returns

`T`[]

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getNextSiblings`](#getnextsiblings-6)

##### getNodesBetween() {#getnodesbetween-2}

> **getNodesBetween**(`targetNode`): [`LexicalNode`](#lexicalnode)[]

Defined in: [packages/lexical/src/LexicalNode.ts:931](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L931)

Returns a list of nodes that are between this node and
the target node in the EditorState.

###### Parameters

###### targetNode

[`LexicalNode`](#lexicalnode)

the node that marks the other end of the range of nodes to be returned.

###### Returns

[`LexicalNode`](#lexicalnode)[]

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getNodesBetween`](#getnodesbetween-6)

##### getParent() {#getparent-2}

> **getParent**\<`T`\>(): `null` \| `T`

Defined in: [packages/lexical/src/LexicalNode.ts:707](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L707)

Returns the parent of this node, or null if none is found.

###### Type Parameters

###### T

`T` *extends* [`ElementNode`](#elementnode)

###### Returns

`null` \| `T`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getParent`](#getparent-6)

##### getParentKeys() {#getparentkeys-2}

> **getParentKeys**(): `string`[]

Defined in: [packages/lexical/src/LexicalNode.ts:784](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L784)

Returns a list of the keys of every ancestor of this node,
all the way up to the RootNode.

###### Returns

`string`[]

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getParentKeys`](#getparentkeys-6)

##### getParentOrThrow() {#getparentorthrow-2}

> **getParentOrThrow**\<`T`\>(): `T`

Defined in: [packages/lexical/src/LexicalNode.ts:718](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L718)

Returns the parent of this node, or throws if none is found.

###### Type Parameters

###### T

`T` *extends* [`ElementNode`](#elementnode)

###### Returns

`T`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getParentOrThrow`](#getparentorthrow-6)

##### getParents() {#getparents-2}

> **getParents**(): [`ElementNode`](#elementnode)[]

Defined in: [packages/lexical/src/LexicalNode.ts:769](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L769)

Returns a list of the every ancestor of this node,
all the way up to the RootNode.

###### Returns

[`ElementNode`](#elementnode)[]

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getParents`](#getparents-6)

##### getPreviousSibling() {#getprevioussibling-2}

> **getPreviousSibling**\<`T`\>(): `null` \| `T`

Defined in: [packages/lexical/src/LexicalNode.ts:799](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L799)

Returns the "previous" siblings - that is, the node that comes
before this one in the same parent.

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Returns

`null` \| `T`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getPreviousSibling`](#getprevioussibling-6)

##### getPreviousSiblings() {#getprevioussiblings-2}

> **getPreviousSiblings**\<`T`\>(): `T`[]

Defined in: [packages/lexical/src/LexicalNode.ts:810](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L810)

Returns the "previous" siblings - that is, the nodes that come between
this one and the first child of it's parent, inclusive.

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Returns

`T`[]

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getPreviousSiblings`](#getprevioussiblings-6)

##### getStyle() {#getstyle}

> **getStyle**(): `string`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:369](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L369)

###### Returns

`string`

##### getTextContent() {#gettextcontent-2}

> **getTextContent**(): `string`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:520](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L520)

Returns the text content of the node. Override this for
custom nodes that should have a representation in plain text
format (for copy + paste, for example)

###### Returns

`string`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getTextContent`](#gettextcontent-12)

##### getTextContentSize() {#gettextcontentsize-2}

> **getTextContentSize**(): `number`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:538](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L538)

Returns the length of the string produced by calling getTextContent on this node.

###### Returns

`number`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getTextContentSize`](#gettextcontentsize-6)

##### getTextFormat() {#gettextformat}

> **getTextFormat**(): `number`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:560](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L560)

###### Returns

`number`

##### getTextStyle() {#gettextstyle}

> **getTextStyle**(): `string`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:586](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L586)

###### Returns

`string`

##### getTopLevelElement() {#gettoplevelelement-2}

> **getTopLevelElement**(): `null` \| [`ElementNode`](#elementnode)

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:79](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L79)

Returns the highest (in the EditorState tree)
non-root ancestor of this node, or null if none is found. See [lexical!$isRootOrShadowRoot](#isrootorshadowroot)
for more information on which Elements comprise "roots".

###### Returns

`null` \| [`ElementNode`](#elementnode)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getTopLevelElement`](#gettoplevelelement-6)

##### getTopLevelElementOrThrow() {#gettoplevelelementorthrow-2}

> **getTopLevelElementOrThrow**(): [`ElementNode`](#elementnode)

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:80](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L80)

Returns the highest (in the EditorState tree)
non-root ancestor of this node, or throws if none is found. See [lexical!$isRootOrShadowRoot](#isrootorshadowroot)
for more information on which Elements comprise "roots".

###### Returns

[`ElementNode`](#elementnode)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getTopLevelElementOrThrow`](#gettoplevelelementorthrow-8)

##### getType() {#gettype-4}

> **getType**(): `string`

Defined in: [packages/lexical/src/LexicalNode.ts:593](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L593)

Returns the string type of this node.

###### Returns

`string`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getType`](#gettype-20)

##### getWritable() {#getwritable-2}

> **getWritable**(): `this`

Defined in: [packages/lexical/src/LexicalNode.ts:1032](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1032)

Returns a mutable version of the node using [$cloneWithProperties](#clonewithproperties)
if necessary. Will throw an error if called outside of a Lexical Editor
[LexicalEditor.update](#update) callback.

###### Returns

`this`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getWritable`](#getwritable-6)

##### hasFormat() {#hasformat}

> **hasFormat**(`type`): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:564](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L564)

###### Parameters

###### type

[`ElementFormatType`](#elementformattype)

###### Returns

`boolean`

##### hasTextFormat() {#hastextformat}

> **hasTextFormat**(`type`): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:571](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L571)

###### Parameters

###### type

[`TextFormatType`](#textformattype)

###### Returns

`boolean`

##### insertAfter() {#insertafter-2}

> **insertAfter**(`nodeToInsert`, `restoreSelection`): [`LexicalNode`](#lexicalnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1299](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1299)

Inserts a node after this LexicalNode (as the next sibling).

###### Parameters

###### nodeToInsert

[`LexicalNode`](#lexicalnode)

The node to insert after this one.

###### restoreSelection

`boolean` = `true`

Whether or not to attempt to resolve the
selection to the appropriate place after the operation is complete.

###### Returns

[`LexicalNode`](#lexicalnode)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`insertAfter`](#insertafter-8)

##### insertBefore() {#insertbefore-2}

> **insertBefore**(`nodeToInsert`, `restoreSelection`): [`LexicalNode`](#lexicalnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1366](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1366)

Inserts a node before this LexicalNode (as the previous sibling).

###### Parameters

###### nodeToInsert

[`LexicalNode`](#lexicalnode)

The node to insert before this one.

###### restoreSelection

`boolean` = `true`

Whether or not to attempt to resolve the
selection to the appropriate place after the operation is complete.

###### Returns

[`LexicalNode`](#lexicalnode)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`insertBefore`](#insertbefore-8)

##### insertNewAfter() {#insertnewafter}

> **insertNewAfter**(`selection`, `restoreSelection?`): `null` \| [`LexicalNode`](#lexicalnode)

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:901](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L901)

###### Parameters

###### selection

[`RangeSelection`](#rangeselection)

###### restoreSelection?

`boolean`

###### Returns

`null` \| [`LexicalNode`](#lexicalnode)

##### is() {#is-2}

> **is**(`object`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:878](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L878)

Returns true if the provided node is the exact same one as this node, from Lexical's perspective.
Always use this instead of referential equality.

###### Parameters

###### object

the node to perform the equality comparison on.

`undefined` | `null` | [`LexicalNode`](#lexicalnode)

###### Returns

`boolean`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`is`](#is-8)

##### isAttached() {#isattached-2}

> **isAttached**(): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:610](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L610)

Returns true if there is a path between this node and the RootNode, false otherwise.
This is a way of determining if the node is "attached" EditorState. Unattached nodes
won't be reconciled and will ultimately be cleaned up by the Lexical GC.

###### Returns

`boolean`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`isAttached`](#isattached-6)

##### isBefore() {#isbefore-2}

> **isBefore**(`targetNode`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:896](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L896)

Returns true if this node logically precedes the target node in the
editor state, false otherwise (including if there is no common ancestor).

Note that this notion of isBefore is based on post-order; a descendant
node is always before its ancestors. See also
[$getCommonAncestor](#getcommonancestor-8) and [$comparePointCaretNext](#comparepointcaretnext) for
more flexible ways to determine the relative positions of nodes.

###### Parameters

###### targetNode

[`LexicalNode`](#lexicalnode)

the node we're testing to see if it's after this one.

###### Returns

`boolean`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`isBefore`](#isbefore-6)

##### isDirty() {#isdirty-2}

> **isDirty**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:402](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L402)

Returns true if this node has been marked dirty during this update cycle.

###### Returns

`boolean`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`isDirty`](#isdirty-6)

##### isEmpty() {#isempty}

> **isEmpty**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:399](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L399)

###### Returns

`boolean`

##### isInline() {#isinline-2}

> **isInline**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:944](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L944)

###### Returns

`boolean`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`isInline`](#isinline-8)

##### isLastChild() {#islastchild}

> **isLastChild**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:407](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L407)

###### Returns

`boolean`

##### isParentOf() {#isparentof-2}

> **isParentOf**(`targetNode`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:919](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L919)

Returns true if this node is an ancestor of and distinct from the target node, false otherwise.

###### Parameters

###### targetNode

[`LexicalNode`](#lexicalnode)

the would-be child node.

###### Returns

`boolean`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`isParentOf`](#isparentof-6)

##### isParentRequired() {#isparentrequired-2}

> **isParentRequired**(): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:1406](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1406)

Whether or not this node has a required parent. Used during copy + paste operations
to normalize nodes that would otherwise be orphaned. For example, ListItemNodes without
a ListNode parent or TextNodes with a ParagraphNode parent.

###### Returns

`boolean`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`isParentRequired`](#isparentrequired-6)

##### isSelected() {#isselected-2}

> **isSelected**(`selection?`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:634](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L634)

Returns true if this node is contained within the provided Selection., false otherwise.
Relies on the algorithms implemented in [BaseSelection.getNodes](#getnodes) to determine
what's included.

###### Parameters

###### selection?

The selection that we want to determine if the node is in.

`null` | [`BaseSelection`](#baseselection)

###### Returns

`boolean`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`isSelected`](#isselected-6)

##### isShadowRoot() {#isshadowroot}

> **isShadowRoot**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:951](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L951)

###### Returns

`boolean`

##### markDirty() {#markdirty-2}

> **markDirty**(): `void`

Defined in: [packages/lexical/src/LexicalNode.ts:1475](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1475)

Marks a node dirty, triggering transforms and
forcing it to be reconciled during the update cycle.

###### Returns

`void`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`markDirty`](#markdirty-6)

##### remove() {#remove-2}

> **remove**(`preserveEmptyParent?`): `void`

Defined in: [packages/lexical/src/LexicalNode.ts:1218](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1218)

Removes this LexicalNode from the EditorState. If the node isn't re-inserted
somewhere, the Lexical garbage collector will eventually clean it up.

###### Parameters

###### preserveEmptyParent?

`boolean`

If falsy, the node's parent will be removed if
it's empty after the removal operation. This is the default behavior, subject to
other node heuristics such as [ElementNode#canBeEmpty](#canbeempty)

###### Returns

`void`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`remove`](#remove-10)

##### replace() {#replace-2}

> **replace**\<`N`\>(`replaceWith`, `includeChildren?`): `N`

Defined in: [packages/lexical/src/LexicalNode.ts:1229](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1229)

Replaces this LexicalNode with the provided node, optionally transferring the children
of the replaced node to the replacing node.

###### Type Parameters

###### N

`N` *extends* [`LexicalNode`](#lexicalnode)

###### Parameters

###### replaceWith

`N`

The node to replace this one with.

###### includeChildren?

`boolean`

Whether or not to transfer the children of this node to the replacing node.

###### Returns

`N`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`replace`](#replace-8)

##### resetOnCopyNodeFrom() {#resetoncopynodefrom-2}

> **resetOnCopyNodeFrom**(`originalNode`): `void`

Defined in: [packages/lexical/src/LexicalNode.ts:560](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L560)

Reset state in this copy of originalNode, if necessary

###### Parameters

###### originalNode

`this`

###### Returns

`void`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`resetOnCopyNodeFrom`](#resetoncopynodefrom-6)

##### select() {#select}

> **select**(`_anchorOffset?`, `_focusOffset?`): [`RangeSelection`](#rangeselection)

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:593](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L593)

###### Parameters

###### \_anchorOffset?

`number`

###### \_focusOffset?

`number`

###### Returns

[`RangeSelection`](#rangeselection)

##### selectEnd() {#selectend-2}

> **selectEnd**(): [`RangeSelection`](#rangeselection)

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:642](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L642)

###### Returns

[`RangeSelection`](#rangeselection)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`selectEnd`](#selectend-6)

##### selectNext() {#selectnext-2}

> **selectNext**(`anchorOffset?`, `focusOffset?`): [`RangeSelection`](#rangeselection)

Defined in: [packages/lexical/src/LexicalNode.ts:1454](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1454)

Moves selection to the next sibling of this node, at the specified offsets.

###### Parameters

###### anchorOffset?

`number`

The anchor offset for selection.

###### focusOffset?

`number`

The focus offset for selection

###### Returns

[`RangeSelection`](#rangeselection)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`selectNext`](#selectnext-6)

##### selectPrevious() {#selectprevious-2}

> **selectPrevious**(`anchorOffset?`, `focusOffset?`): [`RangeSelection`](#rangeselection)

Defined in: [packages/lexical/src/LexicalNode.ts:1432](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1432)

Moves selection to the previous sibling of this node, at the specified offsets.

###### Parameters

###### anchorOffset?

`number`

The anchor offset for selection.

###### focusOffset?

`number`

The focus offset for selection

###### Returns

[`RangeSelection`](#rangeselection)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`selectPrevious`](#selectprevious-6)

##### selectStart() {#selectstart-2}

> **selectStart**(): [`RangeSelection`](#rangeselection)

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:638](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L638)

###### Returns

[`RangeSelection`](#rangeselection)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`selectStart`](#selectstart-6)

##### setDirection() {#setdirection}

> **setDirection**(`direction`): `this`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:655](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L655)

###### Parameters

###### direction

`null` | `"ltr"` | `"rtl"`

###### Returns

`this`

##### setFormat() {#setformat}

> **setFormat**(`type`): `this`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:660](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L660)

###### Parameters

###### type

[`ElementFormatType`](#elementformattype)

###### Returns

`this`

##### setIndent() {#setindent}

> **setIndent**(`indentLevel`): `this`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:680](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L680)

###### Parameters

###### indentLevel

`number`

###### Returns

`this`

##### setStyle() {#setstyle}

> **setStyle**(`style`): `this`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:665](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L665)

###### Parameters

###### style

`string`

###### Returns

`this`

##### setTextFormat() {#settextformat}

> **setTextFormat**(`type`): `this`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:670](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L670)

###### Parameters

###### type

`number`

###### Returns

`this`

##### setTextStyle() {#settextstyle}

> **setTextStyle**(`style`): `this`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:675](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L675)

###### Parameters

###### style

`string`

###### Returns

`this`

##### splice() {#splice}

> **splice**(`start`, `deleteCount`, `nodesToInsert`): `this`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:685](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L685)

###### Parameters

###### start

`number`

###### deleteCount

`number`

###### nodesToInsert

[`LexicalNode`](#lexicalnode)[]

###### Returns

`this`

##### updateDOM() {#updatedom-2}

> **updateDOM**(`_prevNode`, `_dom`, `_config`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:1108](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1108)

Called when a node changes and should update the DOM
in whatever way is necessary to make it align with any changes that might
have happened during the update.

Returning "true" here will cause lexical to unmount and recreate the DOM node
(by calling createDOM). You would need to do this if the element tag changes,
for instance.

###### Parameters

###### \_prevNode

`unknown`

###### \_dom

`HTMLElement`

###### \_config

[`EditorConfig`](#editorconfig)

###### Returns

`boolean`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`updateDOM`](#updatedom-12)

##### updateFromJSON() {#updatefromjson-2}

> **updateFromJSON**(`serializedNode`): `this`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:889](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L889)

Update this LexicalNode instance from serialized JSON. It's recommended
to implement as much logic as possible in this method instead of the
static importJSON method, so that the functionality can be inherited in subclasses.

The LexicalUpdateJSON utility type should be used to ignore any type, version,
or children properties in the JSON so that the extended JSON from subclasses
are acceptable parameters for the super call.

If overridden, this method must call super.

###### Parameters

###### serializedNode

[`LexicalUpdateJSON`](#lexicalupdatejson)\<[`SerializedElementNode`](#serializedelementnode)\>

###### Returns

`this`

###### Example

```ts
class MyTextNode extends TextNode {
  // ...
  static importJSON(serializedNode: SerializedMyTextNode): MyTextNode {
    return $createMyTextNode()
      .updateFromJSON(serializedNode);
  }
  updateFromJSON(
    serializedNode: LexicalUpdateJSON<SerializedMyTextNode>,
  ): this {
    return super.updateFromJSON(serializedNode)
      .setMyProperty(serializedNode.myProperty);
  }
}
```

###### Inherited from

[`LexicalNode`](#lexicalnode).[`updateFromJSON`](#updatefromjson-6)

##### clone() {#clone-2}

> `static` **clone**(`_data`): [`LexicalNode`](#lexicalnode)

Defined in: [packages/lexical/src/LexicalNode.ts:452](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L452)

Clones this node, creating a new node with a different key
and adding it to the EditorState (but not attaching it anywhere!). All nodes must
implement this method.

###### Parameters

###### \_data

`unknown`

###### Returns

[`LexicalNode`](#lexicalnode)

##### getType() {#gettype-6}

> `static` **getType**(): `string`

Defined in: [packages/lexical/src/LexicalNode.ts:436](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L436)

Returns the string type of this node. Every node must
implement this and it MUST BE UNIQUE amongst nodes registered
on the editor.

###### Returns

`string`

##### importJSON() {#importjson-2}

> `static` **importJSON**(`_serializedNode`): [`LexicalNode`](#lexicalnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1153](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1153)

Controls how the this node is deserialized from JSON. This is usually boilerplate,
but provides an abstraction between the node implementation and serialized interface that can
be important if you ever make breaking changes to a node schema (by adding or removing properties).
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Parameters

###### \_serializedNode

[`SerializedLexicalNode`](#serializedlexicalnode)

###### Returns

[`LexicalNode`](#lexicalnode)

##### transform() {#transform-2}

> `static` **transform**(): `null` \| (`node`) => `void`

Defined in: [packages/lexical/src/LexicalNode.ts:1204](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1204)

**`Experimental`**

Registers the returned function as a transform on the node during
Editor initialization. Most such use cases should be addressed via
the [LexicalEditor.registerNodeTransform](#registernodetransform) API.

Experimental - use at your own risk.

###### Returns

`null` \| (`node`) => `void`

***

### LineBreakNode {#linebreaknode}

Defined in: [packages/lexical/src/nodes/LexicalLineBreakNode.ts:27](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalLineBreakNode.ts#L27)

#### Extends

- [`LexicalNode`](#lexicalnode)

#### Constructors

##### Constructor

> **new LineBreakNode**(`key?`): [`LineBreakNode`](#linebreaknode)

Defined in: [packages/lexical/src/nodes/LexicalLineBreakNode.ts:38](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalLineBreakNode.ts#L38)

###### Parameters

###### key?

`string`

###### Returns

[`LineBreakNode`](#linebreaknode)

###### Overrides

`LexicalNode.constructor`

#### Methods

##### createDOM() {#createdom-4}

> **createDOM**(): `HTMLElement`

Defined in: [packages/lexical/src/nodes/LexicalLineBreakNode.ts:46](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalLineBreakNode.ts#L46)

Called during the reconciliation process to determine which nodes
to insert into the DOM for this Lexical Node.

This method must return exactly one HTMLElement. Nested elements are not supported.

Do not attempt to update the Lexical EditorState during this phase of the update lifecycle.

###### Returns

`HTMLElement`

###### Overrides

[`LexicalNode`](#lexicalnode).[`createDOM`](#createdom-12)

##### getTextContent() {#gettextcontent-4}

> **getTextContent**(): "\n"

Defined in: [packages/lexical/src/nodes/LexicalLineBreakNode.ts:42](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalLineBreakNode.ts#L42)

Returns the text content of the node. Override this for
custom nodes that should have a representation in plain text
format (for copy + paste, for example)

###### Returns

"\n"

###### Overrides

[`LexicalNode`](#lexicalnode).[`getTextContent`](#gettextcontent-12)

##### isInline() {#isinline-4}

> **isInline**(): `true`

Defined in: [packages/lexical/src/nodes/LexicalLineBreakNode.ts:54](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalLineBreakNode.ts#L54)

###### Returns

`true`

###### Overrides

[`LexicalNode`](#lexicalnode).[`isInline`](#isinline-8)

##### updateDOM() {#updatedom-4}

> **updateDOM**(): `false`

Defined in: [packages/lexical/src/nodes/LexicalLineBreakNode.ts:50](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalLineBreakNode.ts#L50)

Called when a node changes and should update the DOM
in whatever way is necessary to make it align with any changes that might
have happened during the update.

Returning "true" here will cause lexical to unmount and recreate the DOM node
(by calling createDOM). You would need to do this if the element tag changes,
for instance.

###### Returns

`false`

###### Overrides

[`LexicalNode`](#lexicalnode).[`updateDOM`](#updatedom-12)

##### clone() {#clone-4}

> `static` **clone**(`node`): [`LineBreakNode`](#linebreaknode)

Defined in: [packages/lexical/src/nodes/LexicalLineBreakNode.ts:34](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalLineBreakNode.ts#L34)

Clones this node, creating a new node with a different key
and adding it to the EditorState (but not attaching it anywhere!). All nodes must
implement this method.

###### Parameters

###### node

[`LineBreakNode`](#linebreaknode)

###### Returns

[`LineBreakNode`](#linebreaknode)

###### Overrides

`LexicalNode.clone`

##### getType() {#gettype-8}

> `static` **getType**(): `string`

Defined in: [packages/lexical/src/nodes/LexicalLineBreakNode.ts:30](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalLineBreakNode.ts#L30)

Returns the string type of this node. Every node must
implement this and it MUST BE UNIQUE amongst nodes registered
on the editor.

###### Returns

`string`

###### Overrides

`LexicalNode.getType`

##### importDOM() {#importdom-2}

> `static` **importDOM**(): `null` \| [`DOMConversionMap`](#domconversionmap)

Defined in: [packages/lexical/src/nodes/LexicalLineBreakNode.ts:58](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalLineBreakNode.ts#L58)

###### Returns

`null` \| [`DOMConversionMap`](#domconversionmap)

###### Overrides

`LexicalNode.importDOM`

##### importJSON() {#importjson-4}

> `static` **importJSON**(`serializedLineBreakNode`): [`LineBreakNode`](#linebreaknode)

Defined in: [packages/lexical/src/nodes/LexicalLineBreakNode.ts:72](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalLineBreakNode.ts#L72)

Controls how the this node is deserialized from JSON. This is usually boilerplate,
but provides an abstraction between the node implementation and serialized interface that can
be important if you ever make breaking changes to a node schema (by adding or removing properties).
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Parameters

###### serializedLineBreakNode

[`SerializedLexicalNode`](#serializedlexicalnode)

###### Returns

[`LineBreakNode`](#linebreaknode)

###### Overrides

`LexicalNode.importJSON`

***

### ParagraphNode {#paragraphnode}

Defined in: [packages/lexical/src/nodes/LexicalParagraphNode.ts:46](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalParagraphNode.ts#L46)

#### Extends

- [`ElementNode`](#elementnode)

#### Methods

##### collapseAtStart() {#collapseatstart-2}

> **collapseAtStart**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalParagraphNode.ts:143](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalParagraphNode.ts#L143)

###### Returns

`boolean`

###### Overrides

[`ElementNode`](#elementnode).[`collapseAtStart`](#collapseatstart)

##### createDOM() {#createdom-6}

> **createDOM**(`config`): `HTMLElement`

Defined in: [packages/lexical/src/nodes/LexicalParagraphNode.ts:60](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalParagraphNode.ts#L60)

Called during the reconciliation process to determine which nodes
to insert into the DOM for this Lexical Node.

This method must return exactly one HTMLElement. Nested elements are not supported.

Do not attempt to update the Lexical EditorState during this phase of the update lifecycle.

###### Parameters

###### config

[`EditorConfig`](#editorconfig)

###### Returns

`HTMLElement`

###### Overrides

[`ElementNode`](#elementnode).[`createDOM`](#createdom-2)

##### exportDOM() {#exportdom-4}

> **exportDOM**(`editor`): [`DOMExportOutput`](#domexportoutput)

Defined in: [packages/lexical/src/nodes/LexicalParagraphNode.ts:86](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalParagraphNode.ts#L86)

Controls how the this node is serialized to HTML. This is important for
copy and paste between Lexical and non-Lexical editors, or Lexical editors with different namespaces,
in which case the primary transfer format is HTML. It's also important if you're serializing
to HTML for any other reason via [@lexical/html!$generateHtmlFromNodes](lexical_html.md#generatehtmlfromnodes). You could
also use this method to build your own HTML renderer.

###### Parameters

###### editor

[`LexicalEditor`](#lexicaleditor)

###### Returns

[`DOMExportOutput`](#domexportoutput)

###### Overrides

[`ElementNode`](#elementnode).[`exportDOM`](#exportdom-2)

##### exportJSON() {#exportjson-4}

> **exportJSON**(): [`SerializedParagraphNode`](#serializedparagraphnode)

Defined in: [packages/lexical/src/nodes/LexicalParagraphNode.ts:109](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalParagraphNode.ts#L109)

Controls how the this node is serialized to JSON. This is important for
copy and paste between Lexical editors sharing the same namespace. It's also important
if you're serializing to JSON for persistent storage somewhere.
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Returns

[`SerializedParagraphNode`](#serializedparagraphnode)

###### Overrides

[`ElementNode`](#elementnode).[`exportJSON`](#exportjson-2)

##### insertNewAfter() {#insertnewafter-2}

> **insertNewAfter**(`rangeSelection`, `restoreSelection`): [`ParagraphNode`](#paragraphnode)

Defined in: [packages/lexical/src/nodes/LexicalParagraphNode.ts:128](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalParagraphNode.ts#L128)

###### Parameters

###### rangeSelection

[`RangeSelection`](#rangeselection)

###### restoreSelection

`boolean`

###### Returns

[`ParagraphNode`](#paragraphnode)

###### Overrides

[`ElementNode`](#elementnode).[`insertNewAfter`](#insertnewafter)

##### updateDOM() {#updatedom-6}

> **updateDOM**(`prevNode`, `dom`, `config`): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalParagraphNode.ts:69](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalParagraphNode.ts#L69)

Called when a node changes and should update the DOM
in whatever way is necessary to make it align with any changes that might
have happened during the update.

Returning "true" here will cause lexical to unmount and recreate the DOM node
(by calling createDOM). You would need to do this if the element tag changes,
for instance.

###### Parameters

###### prevNode

[`ParagraphNode`](#paragraphnode)

###### dom

`HTMLElement`

###### config

[`EditorConfig`](#editorconfig)

###### Returns

`boolean`

###### Overrides

[`ElementNode`](#elementnode).[`updateDOM`](#updatedom-2)

##### clone() {#clone-6}

> `static` **clone**(`node`): [`ParagraphNode`](#paragraphnode)

Defined in: [packages/lexical/src/nodes/LexicalParagraphNode.ts:54](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalParagraphNode.ts#L54)

Clones this node, creating a new node with a different key
and adding it to the EditorState (but not attaching it anywhere!). All nodes must
implement this method.

###### Parameters

###### node

[`ParagraphNode`](#paragraphnode)

###### Returns

[`ParagraphNode`](#paragraphnode)

###### Overrides

[`ElementNode`](#elementnode).[`clone`](#clone-2)

##### getType() {#gettype-10}

> `static` **getType**(): `string`

Defined in: [packages/lexical/src/nodes/LexicalParagraphNode.ts:50](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalParagraphNode.ts#L50)

Returns the string type of this node. Every node must
implement this and it MUST BE UNIQUE amongst nodes registered
on the editor.

###### Returns

`string`

###### Overrides

[`ElementNode`](#elementnode).[`getType`](#gettype-6)

##### importDOM() {#importdom-4}

> `static` **importDOM**(): `null` \| [`DOMConversionMap`](#domconversionmap)

Defined in: [packages/lexical/src/nodes/LexicalParagraphNode.ts:77](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalParagraphNode.ts#L77)

###### Returns

`null` \| [`DOMConversionMap`](#domconversionmap)

###### Overrides

`ElementNode.importDOM`

##### importJSON() {#importjson-6}

> `static` **importJSON**(`serializedNode`): [`ParagraphNode`](#paragraphnode)

Defined in: [packages/lexical/src/nodes/LexicalParagraphNode.ts:105](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalParagraphNode.ts#L105)

Controls how the this node is deserialized from JSON. This is usually boilerplate,
but provides an abstraction between the node implementation and serialized interface that can
be important if you ever make breaking changes to a node schema (by adding or removing properties).
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Parameters

###### serializedNode

[`SerializedParagraphNode`](#serializedparagraphnode)

###### Returns

[`ParagraphNode`](#paragraphnode)

###### Overrides

[`ElementNode`](#elementnode).[`importJSON`](#importjson-2)

***

### RootNode {#rootnode}

Defined in: [packages/lexical/src/nodes/LexicalRootNode.ts:25](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalRootNode.ts#L25)

#### Extends

- [`ElementNode`](#elementnode)

#### Constructors

##### Constructor

> **new RootNode**(): [`RootNode`](#rootnode)

Defined in: [packages/lexical/src/nodes/LexicalRootNode.ts:37](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalRootNode.ts#L37)

###### Returns

[`RootNode`](#rootnode)

###### Overrides

[`ElementNode`](#elementnode).[`constructor`](#constructor-1)

#### Methods

##### collapseAtStart() {#collapseatstart-4}

> **collapseAtStart**(): `true`

Defined in: [packages/lexical/src/nodes/LexicalRootNode.ts:104](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalRootNode.ts#L104)

###### Returns

`true`

###### Overrides

[`ElementNode`](#elementnode).[`collapseAtStart`](#collapseatstart)

##### getTextContent() {#gettextcontent-6}

> **getTextContent**(): `string`

Defined in: [packages/lexical/src/nodes/LexicalRootNode.ts:49](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalRootNode.ts#L49)

Returns the text content of the node. Override this for
custom nodes that should have a representation in plain text
format (for copy + paste, for example)

###### Returns

`string`

###### Overrides

[`ElementNode`](#elementnode).[`getTextContent`](#gettextcontent-2)

##### getTopLevelElementOrThrow() {#gettoplevelelementorthrow-4}

> **getTopLevelElementOrThrow**(): `never`

Defined in: [packages/lexical/src/nodes/LexicalRootNode.ts:42](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalRootNode.ts#L42)

Returns the highest (in the EditorState tree)
non-root ancestor of this node, or throws if none is found. See [lexical!$isRootOrShadowRoot](#isrootorshadowroot)
for more information on which Elements comprise "roots".

###### Returns

`never`

###### Overrides

[`ElementNode`](#elementnode).[`getTopLevelElementOrThrow`](#gettoplevelelementorthrow-2)

##### insertAfter() {#insertafter-4}

> **insertAfter**(`nodeToInsert`): [`LexicalNode`](#lexicalnode)

Defined in: [packages/lexical/src/nodes/LexicalRootNode.ts:74](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalRootNode.ts#L74)

Inserts a node after this LexicalNode (as the next sibling).

###### Parameters

###### nodeToInsert

[`LexicalNode`](#lexicalnode)

The node to insert after this one.

###### Returns

[`LexicalNode`](#lexicalnode)

###### Overrides

[`ElementNode`](#elementnode).[`insertAfter`](#insertafter-2)

##### insertBefore() {#insertbefore-4}

> **insertBefore**(`nodeToInsert`): [`LexicalNode`](#lexicalnode)

Defined in: [packages/lexical/src/nodes/LexicalRootNode.ts:70](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalRootNode.ts#L70)

Inserts a node before this LexicalNode (as the previous sibling).

###### Parameters

###### nodeToInsert

[`LexicalNode`](#lexicalnode)

The node to insert before this one.

###### Returns

[`LexicalNode`](#lexicalnode)

###### Overrides

[`ElementNode`](#elementnode).[`insertBefore`](#insertbefore-2)

##### remove() {#remove-4}

> **remove**(): `never`

Defined in: [packages/lexical/src/nodes/LexicalRootNode.ts:62](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalRootNode.ts#L62)

Removes this LexicalNode from the EditorState. If the node isn't re-inserted
somewhere, the Lexical garbage collector will eventually clean it up.

###### Returns

`never`

###### Overrides

[`ElementNode`](#elementnode).[`remove`](#remove-2)

##### replace() {#replace-4}

> **replace**\<`N`\>(`node`): `never`

Defined in: [packages/lexical/src/nodes/LexicalRootNode.ts:66](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalRootNode.ts#L66)

Replaces this LexicalNode with the provided node, optionally transferring the children
of the replaced node to the replacing node.

###### Type Parameters

###### N

`N` = [`LexicalNode`](#lexicalnode)

###### Parameters

###### node

`N`

###### Returns

`never`

###### Overrides

[`ElementNode`](#elementnode).[`replace`](#replace-2)

##### splice() {#splice-2}

> **splice**(`start`, `deleteCount`, `nodesToInsert`): `this`

Defined in: [packages/lexical/src/nodes/LexicalRootNode.ts:85](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalRootNode.ts#L85)

###### Parameters

###### start

`number`

###### deleteCount

`number`

###### nodesToInsert

[`LexicalNode`](#lexicalnode)[]

###### Returns

`this`

###### Overrides

[`ElementNode`](#elementnode).[`splice`](#splice)

##### updateDOM() {#updatedom-8}

> **updateDOM**(`prevNode`, `dom`): `false`

Defined in: [packages/lexical/src/nodes/LexicalRootNode.ts:80](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalRootNode.ts#L80)

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

`false`

###### Overrides

[`ElementNode`](#elementnode).[`updateDOM`](#updatedom-2)

##### clone() {#clone-8}

> `static` **clone**(): [`RootNode`](#rootnode)

Defined in: [packages/lexical/src/nodes/LexicalRootNode.ts:33](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalRootNode.ts#L33)

Clones this node, creating a new node with a different key
and adding it to the EditorState (but not attaching it anywhere!). All nodes must
implement this method.

###### Returns

[`RootNode`](#rootnode)

###### Overrides

[`ElementNode`](#elementnode).[`clone`](#clone-2)

##### getType() {#gettype-12}

> `static` **getType**(): `string`

Defined in: [packages/lexical/src/nodes/LexicalRootNode.ts:29](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalRootNode.ts#L29)

Returns the string type of this node. Every node must
implement this and it MUST BE UNIQUE amongst nodes registered
on the editor.

###### Returns

`string`

###### Overrides

[`ElementNode`](#elementnode).[`getType`](#gettype-6)

##### importJSON() {#importjson-8}

> `static` **importJSON**(`serializedNode`): [`RootNode`](#rootnode)

Defined in: [packages/lexical/src/nodes/LexicalRootNode.ts:99](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalRootNode.ts#L99)

Controls how the this node is deserialized from JSON. This is usually boilerplate,
but provides an abstraction between the node implementation and serialized interface that can
be important if you ever make breaking changes to a node schema (by adding or removing properties).
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Parameters

###### serializedNode

[`SerializedRootNode`](#serializedrootnode)

###### Returns

[`RootNode`](#rootnode)

###### Overrides

[`ElementNode`](#elementnode).[`importJSON`](#importjson-2)

***

### TabNode {#tabnode}

Defined in: [packages/lexical/src/nodes/LexicalTabNode.ts:28](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTabNode.ts#L28)

#### Extends

- [`TextNode`](#textnode)

#### Constructors

##### Constructor

> **new TabNode**(`key?`): [`TabNode`](#tabnode)

Defined in: [packages/lexical/src/nodes/LexicalTabNode.ts:37](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTabNode.ts#L37)

###### Parameters

###### key?

`string`

###### Returns

[`TabNode`](#tabnode)

###### Overrides

[`TextNode`](#textnode).[`constructor`](#constructor-5)

#### Methods

##### canInsertTextAfter() {#caninserttextafter-2}

> **canInsertTextAfter**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalTabNode.ts:97](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTabNode.ts#L97)

This method is meant to be overridden by TextNode subclasses to control the behavior of those nodes
when a user event would cause text to be inserted after them in the editor. If true, Lexical will attempt
to insert text into this node. If false, it will insert the text in a new sibling node.

###### Returns

`boolean`

true if text can be inserted after the node, false otherwise.

###### Overrides

[`TextNode`](#textnode).[`canInsertTextAfter`](#caninserttextafter-4)

##### canInsertTextBefore() {#caninserttextbefore-2}

> **canInsertTextBefore**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalTabNode.ts:93](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTabNode.ts#L93)

This method is meant to be overridden by TextNode subclasses to control the behavior of those nodes
when a user event would cause text to be inserted before them in the editor. If true, Lexical will attempt
to insert text into this node. If false, it will insert the text in a new sibling node.

###### Returns

`boolean`

true if text can be inserted before the node, false otherwise.

###### Overrides

[`TextNode`](#textnode).[`canInsertTextBefore`](#caninserttextbefore-4)

##### createDOM() {#createdom-8}

> **createDOM**(`config`): `HTMLElement`

Defined in: [packages/lexical/src/nodes/LexicalTabNode.ts:46](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTabNode.ts#L46)

Called during the reconciliation process to determine which nodes
to insert into the DOM for this Lexical Node.

This method must return exactly one HTMLElement. Nested elements are not supported.

Do not attempt to update the Lexical EditorState during this phase of the update lifecycle.

###### Parameters

###### config

[`EditorConfig`](#editorconfig)

###### Returns

`HTMLElement`

###### Overrides

[`TextNode`](#textnode).[`createDOM`](#createdom-10)

##### setDetail() {#setdetail}

> **setDetail**(`detail`): `this`

Defined in: [packages/lexical/src/nodes/LexicalTabNode.ts:83](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTabNode.ts#L83)

Sets the node detail to the provided TextDetailType or 32-bit integer. Note that the TextDetailType
version of the argument can only specify one detail value and doing so will remove all other detail values that
may be applied to the node. For toggling behavior, consider using [TextNode.toggleDirectionless](#toggledirectionless)
or [TextNode.toggleUnmergeable](#toggleunmergeable)

###### Parameters

###### detail

TextDetailType or 32-bit integer representing the node detail.

`number` | `TextDetailType`

###### Returns

`this`

this TextNode.
// TODO 0.12 This should just be a `string`.

###### Overrides

[`TextNode`](#textnode).[`setDetail`](#setdetail-2)

##### setMode() {#setmode}

> **setMode**(`type`): `this`

Defined in: [packages/lexical/src/nodes/LexicalTabNode.ts:88](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTabNode.ts#L88)

Sets the mode of the node.

###### Parameters

###### type

[`TextModeType`](#textmodetype)

###### Returns

`this`

this TextNode.

###### Overrides

[`TextNode`](#textnode).[`setMode`](#setmode-2)

##### setTextContent() {#settextcontent}

> **setTextContent**(`text`): `this`

Defined in: [packages/lexical/src/nodes/LexicalTabNode.ts:61](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTabNode.ts#L61)

Sets the text content of the node.

###### Parameters

###### text

`string`

the string to set as the text value of the node.

###### Returns

`this`

this TextNode.

###### Overrides

[`TextNode`](#textnode).[`setTextContent`](#settextcontent-2)

##### spliceText() {#splicetext}

> **spliceText**(`offset`, `delCount`, `newText`, `moveSelection?`): [`TextNode`](#textnode)

Defined in: [packages/lexical/src/nodes/LexicalTabNode.ts:69](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTabNode.ts#L69)

Inserts the provided text into this TextNode at the provided offset, deleting the number of characters
specified. Can optionally calculate a new selection after the operation is complete.

###### Parameters

###### offset

`number`

the offset at which the splice operation should begin.

###### delCount

`number`

the number of characters to delete, starting from the offset.

###### newText

`string`

the text to insert into the TextNode at the offset.

###### moveSelection?

`boolean`

optional, whether or not to move selection to the end of the inserted substring.

###### Returns

[`TextNode`](#textnode)

this TextNode.

###### Overrides

[`TextNode`](#textnode).[`spliceText`](#splicetext-2)

##### clone() {#clone-10}

> `static` **clone**(`node`): [`TabNode`](#tabnode)

Defined in: [packages/lexical/src/nodes/LexicalTabNode.ts:33](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTabNode.ts#L33)

Clones this node, creating a new node with a different key
and adding it to the EditorState (but not attaching it anywhere!). All nodes must
implement this method.

###### Parameters

###### node

[`TabNode`](#tabnode)

###### Returns

[`TabNode`](#tabnode)

###### Overrides

[`TextNode`](#textnode).[`clone`](#clone-12)

##### getType() {#gettype-14}

> `static` **getType**(): `string`

Defined in: [packages/lexical/src/nodes/LexicalTabNode.ts:29](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTabNode.ts#L29)

Returns the string type of this node. Every node must
implement this and it MUST BE UNIQUE amongst nodes registered
on the editor.

###### Returns

`string`

###### Overrides

[`TextNode`](#textnode).[`getType`](#gettype-18)

##### importDOM() {#importdom-6}

> `static` **importDOM**(): `null` \| [`DOMConversionMap`](#domconversionmap)

Defined in: [packages/lexical/src/nodes/LexicalTabNode.ts:42](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTabNode.ts#L42)

###### Returns

`null` \| [`DOMConversionMap`](#domconversionmap)

###### Overrides

[`TextNode`](#textnode).[`importDOM`](#importdom-8)

##### importJSON() {#importjson-10}

> `static` **importJSON**(`serializedTabNode`): [`TabNode`](#tabnode)

Defined in: [packages/lexical/src/nodes/LexicalTabNode.ts:57](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTabNode.ts#L57)

Controls how the this node is deserialized from JSON. This is usually boilerplate,
but provides an abstraction between the node implementation and serialized interface that can
be important if you ever make breaking changes to a node schema (by adding or removing properties).
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Parameters

###### serializedTabNode

[`SerializedTextNode`](#serializedtextnode)

###### Returns

[`TabNode`](#tabnode)

###### Overrides

[`TextNode`](#textnode).[`importJSON`](#importjson-12)

***

### TextNode {#textnode}

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:287](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L287)

#### Extends

- [`LexicalNode`](#lexicalnode)

#### Extended by

- [`TabNode`](#tabnode)
- [`CodeHighlightNode`](lexical_code.md#codehighlightnode)
- [`HashtagNode`](lexical_hashtag.md#hashtagnode)

#### Constructors

##### Constructor

> **new TextNode**(`text`, `key?`): [`TextNode`](#textnode)

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:324](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L324)

###### Parameters

###### text

`string` = `''`

###### key?

`string`

###### Returns

[`TextNode`](#textnode)

#### Properties

##### \_\_text {#__text}

> **\_\_text**: `string`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:297](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L297)

#### Methods

##### $config() {#config-8}

> **$config**(): [`BaseStaticNodeConfig`](#basestaticnodeconfig)

Defined in: [packages/lexical/src/LexicalNode.ts:475](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L475)

Override this to implement the new static node configuration protocol,
this method is called directly on the prototype and must not depend
on anything initialized in the constructor. Generally it should be
a trivial implementation.

###### Returns

[`BaseStaticNodeConfig`](#basestaticnodeconfig)

###### Example

```ts
class MyNode extends TextNode {
  $config() {
    return this.config('my-node', {extends: TextNode});
  }
}
```

###### Inherited from

[`LexicalNode`](#lexicalnode).[`$config`](#config-15)

##### afterCloneFrom() {#afterclonefrom-4}

> **afterCloneFrom**(`prevNode`): `void`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:315](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L315)

Perform any state updates on the clone of prevNode that are not already
handled by the constructor call in the static clone method. If you have
state to update in your clone that is not handled directly by the
constructor, it is advisable to override this method but it is required
to include a call to `super.afterCloneFrom(prevNode)` in your
implementation. This is only intended to be called by
[$cloneWithProperties](#clonewithproperties) function or via a super call.

###### Parameters

###### prevNode

`this`

###### Returns

`void`

###### Example

```ts
class ClassesTextNode extends TextNode {
  // Not shown: static getType, static importJSON, exportJSON, createDOM, updateDOM
  __classes = new Set<string>();
  static clone(node: ClassesTextNode): ClassesTextNode {
    // The inherited TextNode constructor is used here, so
    // classes is not set by this method.
    return new ClassesTextNode(node.__text, node.__key);
  }
  afterCloneFrom(node: this): void {
    // This calls TextNode.afterCloneFrom and LexicalNode.afterCloneFrom
    // for necessary state updates
    super.afterCloneFrom(node);
    this.__addClasses(node.__classes);
  }
  // This method is a private implementation detail, it is not
  // suitable for the public API because it does not call getWritable
  __addClasses(classNames: Iterable<string>): this {
    for (const className of classNames) {
      this.__classes.add(className);
    }
    return this;
  }
  addClass(...classNames: string[]): this {
    return this.getWritable().__addClasses(classNames);
  }
  removeClass(...classNames: string[]): this {
    const node = this.getWritable();
    for (const className of classNames) {
      this.__classes.delete(className);
    }
    return this;
  }
  getClasses(): Set<string> {
    return this.getLatest().__classes;
  }
}
```

###### Inherited from

[`LexicalNode`](#lexicalnode).[`afterCloneFrom`](#afterclonefrom-6)

##### canHaveFormat() {#canhaveformat}

> **canHaveFormat**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:474](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L474)

###### Returns

`boolean`

true if the text node supports font styling, false otherwise.

##### canInsertTextAfter() {#caninserttextafter-4}

> **canInsertTextAfter**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:941](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L941)

This method is meant to be overridden by TextNode subclasses to control the behavior of those nodes
when a user event would cause text to be inserted after them in the editor. If true, Lexical will attempt
to insert text into this node. If false, it will insert the text in a new sibling node.

###### Returns

`boolean`

true if text can be inserted after the node, false otherwise.

##### canInsertTextBefore() {#caninserttextbefore-4}

> **canInsertTextBefore**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:930](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L930)

This method is meant to be overridden by TextNode subclasses to control the behavior of those nodes
when a user event would cause text to be inserted before them in the editor. If true, Lexical will attempt
to insert text into this node. If false, it will insert the text in a new sibling node.

###### Returns

`boolean`

true if text can be inserted before the node, false otherwise.

##### config() {#config-10}

> **config**\<`Type`, `Config`\>(`type`, `config`): `StaticNodeConfigRecord`\<`Type`, `Config`\>

Defined in: [packages/lexical/src/LexicalNode.ts:484](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L484)

This is a convenience method for $config that
aids in type inference. See [LexicalNode.$config](#config-15)
for example usage.

###### Type Parameters

###### Type

`Type` *extends* `string`

###### Config

`Config` *extends* [`StaticNodeConfigValue`](#staticnodeconfigvalue)\<[`TextNode`](#textnode), `Type`\>

###### Parameters

###### type

`Type`

###### config

`Config`

###### Returns

`StaticNodeConfigRecord`\<`Type`, `Config`\>

###### Inherited from

[`LexicalNode`](#lexicalnode).[`config`](#config-17)

##### createDOM() {#createdom-10}

> **createDOM**(`config`, `editor?`): `HTMLElement`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:487](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L487)

Called during the reconciliation process to determine which nodes
to insert into the DOM for this Lexical Node.

This method must return exactly one HTMLElement. Nested elements are not supported.

Do not attempt to update the Lexical EditorState during this phase of the update lifecycle.

###### Parameters

###### config

[`EditorConfig`](#editorconfig)

###### editor?

[`LexicalEditor`](#lexicaleditor)

###### Returns

`HTMLElement`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`createDOM`](#createdom-12)

##### createParentElementNode() {#createparentelementnode-4}

> **createParentElementNode**(): [`ElementNode`](#elementnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1414](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1414)

The creation logic for any required parent. Should be implemented if [isParentRequired](#isparentrequired-6) returns true.

###### Returns

[`ElementNode`](#elementnode)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`createParentElementNode`](#createparentelementnode-6)

##### exportDOM() {#exportdom-6}

> **exportDOM**(`editor`): [`DOMExportOutput`](#domexportoutput)

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:643](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L643)

Controls how the this node is serialized to HTML. This is important for
copy and paste between Lexical and non-Lexical editors, or Lexical editors with different namespaces,
in which case the primary transfer format is HTML. It's also important if you're serializing
to HTML for any other reason via [@lexical/html!$generateHtmlFromNodes](lexical_html.md#generatehtmlfromnodes). You could
also use this method to build your own HTML renderer.

###### Parameters

###### editor

[`LexicalEditor`](#lexicaleditor)

###### Returns

[`DOMExportOutput`](#domexportoutput)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`exportDOM`](#exportdom-8)

##### exportJSON() {#exportjson-6}

> **exportJSON**(): [`SerializedTextNode`](#serializedtextnode)

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:681](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L681)

Controls how the this node is serialized to JSON. This is important for
copy and paste between Lexical editors sharing the same namespace. It's also important
if you're serializing to JSON for persistent storage somewhere.
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Returns

[`SerializedTextNode`](#serializedtextnode)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`exportJSON`](#exportjson-8)

##### ~~getCommonAncestor()~~ {#getcommonancestor-4}

> **getCommonAncestor**\<`T`\>(`node`): `null` \| `T`

Defined in: [packages/lexical/src/LexicalNode.ts:861](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L861)

###### Type Parameters

###### T

`T` *extends* [`ElementNode`](#elementnode) = [`ElementNode`](#elementnode)

###### Parameters

###### node

[`LexicalNode`](#lexicalnode)

the other node to find the common ancestor of.

###### Returns

`null` \| `T`

###### Deprecated

use [$getCommonAncestor](#getcommonancestor-8)

Returns the closest common ancestor of this node and the provided one or null
if one cannot be found.

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getCommonAncestor`](#getcommonancestor-6)

##### getDetail() {#getdetail}

> **getDetail**(): `number`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:351](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L351)

Returns a 32-bit integer that represents the TextDetailTypes currently applied to the
TextNode. You probably don't want to use this method directly - consider using TextNode.isDirectionless
or TextNode.isUnmergeable instead.

###### Returns

`number`

a number representing the detail of the text node.

##### getFormat() {#getformat-2}

> **getFormat**(): `number`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:339](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L339)

Returns a 32-bit integer that represents the TextFormatTypes currently applied to the
TextNode. You probably don't want to use this method directly - consider using TextNode.hasFormat instead.

###### Returns

`number`

a number representing the format of the text node.

##### getFormatFlags() {#getformatflags-2}

> **getFormatFlags**(`type`, `alignWithFormat`): `number`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:464](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L464)

Returns the format flags applied to the node as a 32-bit integer.

###### Parameters

###### type

[`TextFormatType`](#textformattype)

###### alignWithFormat

`null` | `number`

###### Returns

`number`

a number representing the TextFormatTypes applied to the node.

##### getIndexWithinParent() {#getindexwithinparent-4}

> **getIndexWithinParent**(): `number`

Defined in: [packages/lexical/src/LexicalNode.ts:687](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L687)

Returns the zero-based index of this node within the parent.

###### Returns

`number`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getIndexWithinParent`](#getindexwithinparent-6)

##### getKey() {#getkey-4}

> **getKey**(): `string`

Defined in: [packages/lexical/src/LexicalNode.ts:679](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L679)

Returns this nodes key.

###### Returns

`string`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getKey`](#getkey-10)

##### getLatest() {#getlatest-4}

> **getLatest**(): `this`

Defined in: [packages/lexical/src/LexicalNode.ts:1012](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1012)

Returns the latest version of the node from the active EditorState.
This is used to avoid getting values from stale node references.

###### Returns

`this`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getLatest`](#getlatest-7)

##### getMode() {#getmode}

> **getMode**(): [`TextModeType`](#textmodetype)

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:361](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L361)

Returns the mode (TextModeType) of the TextNode, which may be "normal", "token", or "segmented"

###### Returns

[`TextModeType`](#textmodetype)

TextModeType.

##### getNextSibling() {#getnextsibling-4}

> **getNextSibling**\<`T`\>(): `null` \| `T`

Defined in: [packages/lexical/src/LexicalNode.ts:832](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L832)

Returns the "next" siblings - that is, the node that comes
after this one in the same parent

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Returns

`null` \| `T`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getNextSibling`](#getnextsibling-6)

##### getNextSiblings() {#getnextsiblings-4}

> **getNextSiblings**\<`T`\>(): `T`[]

Defined in: [packages/lexical/src/LexicalNode.ts:843](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L843)

Returns all "next" siblings - that is, the nodes that come between this
one and the last child of it's parent, inclusive.

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Returns

`T`[]

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getNextSiblings`](#getnextsiblings-6)

##### getNodesBetween() {#getnodesbetween-4}

> **getNodesBetween**(`targetNode`): [`LexicalNode`](#lexicalnode)[]

Defined in: [packages/lexical/src/LexicalNode.ts:931](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L931)

Returns a list of nodes that are between this node and
the target node in the EditorState.

###### Parameters

###### targetNode

[`LexicalNode`](#lexicalnode)

the node that marks the other end of the range of nodes to be returned.

###### Returns

[`LexicalNode`](#lexicalnode)[]

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getNodesBetween`](#getnodesbetween-6)

##### getParent() {#getparent-4}

> **getParent**\<`T`\>(): `null` \| `T`

Defined in: [packages/lexical/src/LexicalNode.ts:707](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L707)

Returns the parent of this node, or null if none is found.

###### Type Parameters

###### T

`T` *extends* [`ElementNode`](#elementnode)

###### Returns

`null` \| `T`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getParent`](#getparent-6)

##### getParentKeys() {#getparentkeys-4}

> **getParentKeys**(): `string`[]

Defined in: [packages/lexical/src/LexicalNode.ts:784](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L784)

Returns a list of the keys of every ancestor of this node,
all the way up to the RootNode.

###### Returns

`string`[]

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getParentKeys`](#getparentkeys-6)

##### getParentOrThrow() {#getparentorthrow-4}

> **getParentOrThrow**\<`T`\>(): `T`

Defined in: [packages/lexical/src/LexicalNode.ts:718](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L718)

Returns the parent of this node, or throws if none is found.

###### Type Parameters

###### T

`T` *extends* [`ElementNode`](#elementnode)

###### Returns

`T`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getParentOrThrow`](#getparentorthrow-6)

##### getParents() {#getparents-4}

> **getParents**(): [`ElementNode`](#elementnode)[]

Defined in: [packages/lexical/src/LexicalNode.ts:769](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L769)

Returns a list of the every ancestor of this node,
all the way up to the RootNode.

###### Returns

[`ElementNode`](#elementnode)[]

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getParents`](#getparents-6)

##### getPreviousSibling() {#getprevioussibling-4}

> **getPreviousSibling**\<`T`\>(): `null` \| `T`

Defined in: [packages/lexical/src/LexicalNode.ts:799](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L799)

Returns the "previous" siblings - that is, the node that comes
before this one in the same parent.

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Returns

`null` \| `T`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getPreviousSibling`](#getprevioussibling-6)

##### getPreviousSiblings() {#getprevioussiblings-4}

> **getPreviousSiblings**\<`T`\>(): `T`[]

Defined in: [packages/lexical/src/LexicalNode.ts:810](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L810)

Returns the "previous" siblings - that is, the nodes that come between
this one and the first child of it's parent, inclusive.

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Returns

`T`[]

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getPreviousSiblings`](#getprevioussiblings-6)

##### getStyle() {#getstyle-2}

> **getStyle**(): `string`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:371](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L371)

Returns the styles currently applied to the node. This is analogous to CSSText in the DOM.

###### Returns

`string`

CSSText-like string of styles applied to the underlying DOM node.

##### getTextContent() {#gettextcontent-8}

> **getTextContent**(): `string`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:454](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L454)

Returns the text content of the node as a string.

###### Returns

`string`

a string representing the text content of the node.

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getTextContent`](#gettextcontent-12)

##### getTextContentSize() {#gettextcontentsize-4}

> **getTextContentSize**(): `number`

Defined in: [packages/lexical/src/LexicalNode.ts:1076](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1076)

Returns the length of the string produced by calling getTextContent on this node.

###### Returns

`number`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getTextContentSize`](#gettextcontentsize-6)

##### getTopLevelElement() {#gettoplevelelement-4}

> **getTopLevelElement**(): `null` \| [`ElementNode`](#elementnode)

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:288](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L288)

Returns the highest (in the EditorState tree)
non-root ancestor of this node, or null if none is found. See [lexical!$isRootOrShadowRoot](#isrootorshadowroot)
for more information on which Elements comprise "roots".

###### Returns

`null` \| [`ElementNode`](#elementnode)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getTopLevelElement`](#gettoplevelelement-6)

##### getTopLevelElementOrThrow() {#gettoplevelelementorthrow-6}

> **getTopLevelElementOrThrow**(): [`ElementNode`](#elementnode)

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:289](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L289)

Returns the highest (in the EditorState tree)
non-root ancestor of this node, or throws if none is found. See [lexical!$isRootOrShadowRoot](#isrootorshadowroot)
for more information on which Elements comprise "roots".

###### Returns

[`ElementNode`](#elementnode)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getTopLevelElementOrThrow`](#gettoplevelelementorthrow-8)

##### getType() {#gettype-16}

> **getType**(): `string`

Defined in: [packages/lexical/src/LexicalNode.ts:593](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L593)

Returns the string type of this node.

###### Returns

`string`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getType`](#gettype-20)

##### getWritable() {#getwritable-4}

> **getWritable**(): `this`

Defined in: [packages/lexical/src/LexicalNode.ts:1032](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1032)

Returns a mutable version of the node using [$cloneWithProperties](#clonewithproperties)
if necessary. Will throw an error if called outside of a Lexical Editor
[LexicalEditor.update](#update) callback.

###### Returns

`this`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`getWritable`](#getwritable-6)

##### hasFormat() {#hasformat-2}

> **hasFormat**(`type`): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:434](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L434)

Returns whether or not the node has the provided format applied. Use this with the human-readable TextFormatType
string values to get the format of a TextNode.

###### Parameters

###### type

[`TextFormatType`](#textformattype)

the TextFormatType to check for.

###### Returns

`boolean`

true if the node has the provided format, false otherwise.

##### insertAfter() {#insertafter-6}

> **insertAfter**(`nodeToInsert`, `restoreSelection`): [`LexicalNode`](#lexicalnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1299](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1299)

Inserts a node after this LexicalNode (as the next sibling).

###### Parameters

###### nodeToInsert

[`LexicalNode`](#lexicalnode)

The node to insert after this one.

###### restoreSelection

`boolean` = `true`

Whether or not to attempt to resolve the
selection to the appropriate place after the operation is complete.

###### Returns

[`LexicalNode`](#lexicalnode)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`insertAfter`](#insertafter-8)

##### insertBefore() {#insertbefore-6}

> **insertBefore**(`nodeToInsert`, `restoreSelection`): [`LexicalNode`](#lexicalnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1366](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1366)

Inserts a node before this LexicalNode (as the previous sibling).

###### Parameters

###### nodeToInsert

[`LexicalNode`](#lexicalnode)

The node to insert before this one.

###### restoreSelection

`boolean` = `true`

Whether or not to attempt to resolve the
selection to the appropriate place after the operation is complete.

###### Returns

[`LexicalNode`](#lexicalnode)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`insertBefore`](#insertbefore-8)

##### is() {#is-4}

> **is**(`object`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:878](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L878)

Returns true if the provided node is the exact same one as this node, from Lexical's perspective.
Always use this instead of referential equality.

###### Parameters

###### object

the node to perform the equality comparison on.

`undefined` | `null` | [`LexicalNode`](#lexicalnode)

###### Returns

`boolean`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`is`](#is-8)

##### isAttached() {#isattached-4}

> **isAttached**(): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:610](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L610)

Returns true if there is a path between this node and the RootNode, false otherwise.
This is a way of determining if the node is "attached" EditorState. Unattached nodes
won't be reconciled and will ultimately be cleaned up by the Lexical GC.

###### Returns

`boolean`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`isAttached`](#isattached-6)

##### isBefore() {#isbefore-4}

> **isBefore**(`targetNode`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:896](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L896)

Returns true if this node logically precedes the target node in the
editor state, false otherwise (including if there is no common ancestor).

Note that this notion of isBefore is based on post-order; a descendant
node is always before its ancestors. See also
[$getCommonAncestor](#getcommonancestor-8) and [$comparePointCaretNext](#comparepointcaretnext) for
more flexible ways to determine the relative positions of nodes.

###### Parameters

###### targetNode

[`LexicalNode`](#lexicalnode)

the node we're testing to see if it's after this one.

###### Returns

`boolean`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`isBefore`](#isbefore-6)

##### isComposing() {#iscomposing}

> **isComposing**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:392](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L392)

###### Returns

`boolean`

true if Lexical detects that an IME or other 3rd-party script is attempting to
mutate the TextNode, false otherwise.

##### isDirectionless() {#isdirectionless}

> **isDirectionless**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:411](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L411)

Returns whether or not the node is "directionless". Directionless nodes don't respect changes between RTL and LTR modes.

###### Returns

`boolean`

true if the node is directionless, false otherwise.

##### isDirty() {#isdirty-4}

> **isDirty**(): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:1001](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1001)

Returns true if this node has been marked dirty during this update cycle.

###### Returns

`boolean`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`isDirty`](#isdirty-6)

##### isInline() {#isinline-6}

> **isInline**(): `true`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:481](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L481)

###### Returns

`true`

true if the text node is inline, false otherwise.

###### Inherited from

[`LexicalNode`](#lexicalnode).[`isInline`](#isinline-8)

##### isParentOf() {#isparentof-4}

> **isParentOf**(`targetNode`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:919](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L919)

Returns true if this node is an ancestor of and distinct from the target node, false otherwise.

###### Parameters

###### targetNode

[`LexicalNode`](#lexicalnode)

the would-be child node.

###### Returns

`boolean`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`isParentOf`](#isparentof-6)

##### isParentRequired() {#isparentrequired-4}

> **isParentRequired**(): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:1406](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1406)

Whether or not this node has a required parent. Used during copy + paste operations
to normalize nodes that would otherwise be orphaned. For example, ListItemNodes without
a ListNode parent or TextNodes with a ParagraphNode parent.

###### Returns

`boolean`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`isParentRequired`](#isparentrequired-6)

##### isSegmented() {#issegmented}

> **isSegmented**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:402](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L402)

Returns whether or not the node is in "segmented" mode. TextNodes in segmented mode can be navigated through character-by-character
with a RangeSelection, but are deleted in space-delimited "segments".

###### Returns

`boolean`

true if the node is in segmented mode, false otherwise.

##### isSelected() {#isselected-4}

> **isSelected**(`selection?`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:634](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L634)

Returns true if this node is contained within the provided Selection., false otherwise.
Relies on the algorithms implemented in [BaseSelection.getNodes](#getnodes) to determine
what's included.

###### Parameters

###### selection?

The selection that we want to determine if the node is in.

`null` | [`BaseSelection`](#baseselection)

###### Returns

`boolean`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`isSelected`](#isselected-6)

##### isSimpleText() {#issimpletext}

> **isSimpleText**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:445](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L445)

Returns whether or not the node is simple text. Simple text is defined as a TextNode that has the string type "text"
(i.e., not a subclass) and has no mode applied to it (i.e., not segmented or token).

###### Returns

`boolean`

true if the node is simple text, false otherwise.

##### isTextEntity() {#istextentity}

> **isTextEntity**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:1173](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L1173)

This method is meant to be overridden by TextNode subclasses to control the behavior of those nodes
when used with the registerLexicalTextEntity function. If you're using registerLexicalTextEntity, the
node class that you create and replace matched text with should return true from this method.

###### Returns

`boolean`

true if the node is to be treated as a "text entity", false otherwise.

##### isToken() {#istoken}

> **isToken**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:382](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L382)

Returns whether or not the node is in "token" mode. TextNodes in token mode can be navigated through character-by-character
with a RangeSelection, but are deleted as a single entity (not individually by character).

###### Returns

`boolean`

true if the node is in token mode, false otherwise.

##### isUnmergeable() {#isunmergeable}

> **isUnmergeable**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:421](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L421)

Returns whether or not the node is unmergeable. In some scenarios, Lexical tries to merge
adjacent TextNodes into a single TextNode. If a TextNode is unmergeable, this won't happen.

###### Returns

`boolean`

true if the node is unmergeable, false otherwise.

##### markDirty() {#markdirty-4}

> **markDirty**(): `void`

Defined in: [packages/lexical/src/LexicalNode.ts:1475](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1475)

Marks a node dirty, triggering transforms and
forcing it to be reconciled during the update cycle.

###### Returns

`void`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`markDirty`](#markdirty-6)

##### mergeWithSibling() {#mergewithsibling}

> **mergeWithSibling**(`target`): [`TextNode`](#textnode)

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:1118](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L1118)

Merges the target TextNode into this TextNode, removing the target node.

###### Parameters

###### target

[`TextNode`](#textnode)

the TextNode to merge into this one.

###### Returns

[`TextNode`](#textnode)

this TextNode.

##### remove() {#remove-6}

> **remove**(`preserveEmptyParent?`): `void`

Defined in: [packages/lexical/src/LexicalNode.ts:1218](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1218)

Removes this LexicalNode from the EditorState. If the node isn't re-inserted
somewhere, the Lexical garbage collector will eventually clean it up.

###### Parameters

###### preserveEmptyParent?

`boolean`

If falsy, the node's parent will be removed if
it's empty after the removal operation. This is the default behavior, subject to
other node heuristics such as [ElementNode#canBeEmpty](#canbeempty)

###### Returns

`void`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`remove`](#remove-10)

##### replace() {#replace-6}

> **replace**\<`N`\>(`replaceWith`, `includeChildren?`): `N`

Defined in: [packages/lexical/src/LexicalNode.ts:1229](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1229)

Replaces this LexicalNode with the provided node, optionally transferring the children
of the replaced node to the replacing node.

###### Type Parameters

###### N

`N` *extends* [`LexicalNode`](#lexicalnode)

###### Parameters

###### replaceWith

`N`

The node to replace this one with.

###### includeChildren?

`boolean`

Whether or not to transfer the children of this node to the replacing node.

###### Returns

`N`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`replace`](#replace-8)

##### resetOnCopyNodeFrom() {#resetoncopynodefrom-4}

> **resetOnCopyNodeFrom**(`originalNode`): `void`

Defined in: [packages/lexical/src/LexicalNode.ts:560](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L560)

Reset state in this copy of originalNode, if necessary

###### Parameters

###### originalNode

`this`

###### Returns

`void`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`resetOnCopyNodeFrom`](#resetoncopynodefrom-6)

##### select() {#select-2}

> **select**(`_anchorOffset?`, `_focusOffset?`): [`RangeSelection`](#rangeselection)

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:828](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L828)

Sets the current Lexical selection to be a RangeSelection with anchor and focus on this TextNode at the provided offsets.

###### Parameters

###### \_anchorOffset?

`number`

the offset at which the Selection anchor will be placed.

###### \_focusOffset?

`number`

the offset at which the Selection focus will be placed.

###### Returns

[`RangeSelection`](#rangeselection)

the new RangeSelection.

##### selectEnd() {#selectend-4}

> **selectEnd**(): [`RangeSelection`](#rangeselection)

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:873](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L873)

###### Returns

[`RangeSelection`](#rangeselection)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`selectEnd`](#selectend-6)

##### selectionTransform() {#selectiontransform}

> **selectionTransform**(`prevSelection`, `nextSelection`): `void`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:696](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L696)

###### Parameters

###### prevSelection

`null` | [`BaseSelection`](#baseselection)

###### nextSelection

[`RangeSelection`](#rangeselection)

###### Returns

`void`

##### selectNext() {#selectnext-4}

> **selectNext**(`anchorOffset?`, `focusOffset?`): [`RangeSelection`](#rangeselection)

Defined in: [packages/lexical/src/LexicalNode.ts:1454](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1454)

Moves selection to the next sibling of this node, at the specified offsets.

###### Parameters

###### anchorOffset?

`number`

The anchor offset for selection.

###### focusOffset?

`number`

The focus offset for selection

###### Returns

[`RangeSelection`](#rangeselection)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`selectNext`](#selectnext-6)

##### selectPrevious() {#selectprevious-4}

> **selectPrevious**(`anchorOffset?`, `focusOffset?`): [`RangeSelection`](#rangeselection)

Defined in: [packages/lexical/src/LexicalNode.ts:1432](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1432)

Moves selection to the previous sibling of this node, at the specified offsets.

###### Parameters

###### anchorOffset?

`number`

The anchor offset for selection.

###### focusOffset?

`number`

The focus offset for selection

###### Returns

[`RangeSelection`](#rangeselection)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`selectPrevious`](#selectprevious-6)

##### selectStart() {#selectstart-4}

> **selectStart**(): [`RangeSelection`](#rangeselection)

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:869](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L869)

###### Returns

[`RangeSelection`](#rangeselection)

###### Inherited from

[`LexicalNode`](#lexicalnode).[`selectStart`](#selectstart-6)

##### setDetail() {#setdetail-2}

> **setDetail**(`detail`): `this`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:731](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L731)

Sets the node detail to the provided TextDetailType or 32-bit integer. Note that the TextDetailType
version of the argument can only specify one detail value and doing so will remove all other detail values that
may be applied to the node. For toggling behavior, consider using [TextNode.toggleDirectionless](#toggledirectionless)
or [TextNode.toggleUnmergeable](#toggleunmergeable)

###### Parameters

###### detail

TextDetailType or 32-bit integer representing the node detail.

`number` | `TextDetailType`

###### Returns

`this`

this TextNode.
// TODO 0.12 This should just be a `string`.

##### setFormat() {#setformat-2}

> **setFormat**(`format`): `this`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:713](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L713)

Sets the node format to the provided TextFormatType or 32-bit integer. Note that the TextFormatType
version of the argument can only specify one format and doing so will remove all other formats that
may be applied to the node. For toggling behavior, consider using [TextNode.toggleFormat](#toggleformat)

###### Parameters

###### format

TextFormatType or 32-bit integer representing the node format.

`number` | [`TextFormatType`](#textformattype)

###### Returns

`this`

this TextNode.
// TODO 0.12 This should just be a `string`.

##### setMode() {#setmode-2}

> **setMode**(`type`): `this`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:794](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L794)

Sets the mode of the node.

###### Parameters

###### type

[`TextModeType`](#textmodetype)

###### Returns

`this`

this TextNode.

##### setStyle() {#setstyle-2}

> **setStyle**(`style`): `this`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:746](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L746)

Sets the node style to the provided CSSText-like string. Set this property as you
would an HTMLElement style attribute to apply inline styles to the underlying DOM Element.

###### Parameters

###### style

`string`

CSSText to be applied to the underlying HTMLElement.

###### Returns

`this`

this TextNode.

##### setTextContent() {#settextcontent-2}

> **setTextContent**(`text`): `this`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:811](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L811)

Sets the text content of the node.

###### Parameters

###### text

`string`

the string to set as the text value of the node.

###### Returns

`this`

this TextNode.

##### spliceText() {#splicetext-2}

> **spliceText**(`offset`, `delCount`, `newText`, `moveSelection?`): [`TextNode`](#textnode)

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:889](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L889)

Inserts the provided text into this TextNode at the provided offset, deleting the number of characters
specified. Can optionally calculate a new selection after the operation is complete.

###### Parameters

###### offset

`number`

the offset at which the splice operation should begin.

###### delCount

`number`

the number of characters to delete, starting from the offset.

###### newText

`string`

the text to insert into the TextNode at the offset.

###### moveSelection?

`boolean`

optional, whether or not to move selection to the end of the inserted substring.

###### Returns

[`TextNode`](#textnode)

this TextNode.

##### splitText() {#splittext}

> **splitText**(...`splitOffsets`): [`TextNode`](#textnode)[]

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:953](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L953)

Splits this TextNode at the provided character offsets, forming new TextNodes from the substrings
formed by the split, and inserting those new TextNodes into the editor, replacing the one that was split.

###### Parameters

###### splitOffsets

...`number`[]

rest param of the text content character offsets at which this node should be split.

###### Returns

[`TextNode`](#textnode)[]

an Array containing the newly-created TextNodes.

##### toggleDirectionless() {#toggledirectionless}

> **toggleDirectionless**(): `this`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:772](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L772)

Toggles the directionless detail value of the node. Prefer using this method over setDetail.

###### Returns

`this`

this TextNode.

##### toggleFormat() {#toggleformat}

> **toggleFormat**(`type`): `this`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:761](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L761)

Applies the provided format to this TextNode if it's not present. Removes it if it's present.
The subscript and superscript formats are mutually exclusive.
Prefer using this method to turn specific formats on and off.

###### Parameters

###### type

[`TextFormatType`](#textformattype)

TextFormatType to toggle.

###### Returns

`this`

this TextNode.

##### toggleUnmergeable() {#toggleunmergeable}

> **toggleUnmergeable**(): `this`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:783](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L783)

Toggles the unmergeable detail value of the node. Prefer using this method over setDetail.

###### Returns

`this`

this TextNode.

##### updateDOM() {#updatedom-10}

> **updateDOM**(`prevNode`, `dom`, `config`): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:510](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L510)

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

###### config

[`EditorConfig`](#editorconfig)

###### Returns

`boolean`

###### Inherited from

[`LexicalNode`](#lexicalnode).[`updateDOM`](#updatedom-12)

##### updateFromJSON() {#updatefromjson-4}

> **updateFromJSON**(`serializedNode`): `this`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:630](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L630)

Update this LexicalNode instance from serialized JSON. It's recommended
to implement as much logic as possible in this method instead of the
static importJSON method, so that the functionality can be inherited in subclasses.

The LexicalUpdateJSON utility type should be used to ignore any type, version,
or children properties in the JSON so that the extended JSON from subclasses
are acceptable parameters for the super call.

If overridden, this method must call super.

###### Parameters

###### serializedNode

[`LexicalUpdateJSON`](#lexicalupdatejson)\<[`SerializedTextNode`](#serializedtextnode)\>

###### Returns

`this`

###### Example

```ts
class MyTextNode extends TextNode {
  // ...
  static importJSON(serializedNode: SerializedMyTextNode): MyTextNode {
    return $createMyTextNode()
      .updateFromJSON(serializedNode);
  }
  updateFromJSON(
    serializedNode: LexicalUpdateJSON<SerializedMyTextNode>,
  ): this {
    return super.updateFromJSON(serializedNode)
      .setMyProperty(serializedNode.myProperty);
  }
}
```

###### Inherited from

[`LexicalNode`](#lexicalnode).[`updateFromJSON`](#updatefromjson-6)

##### clone() {#clone-12}

> `static` **clone**(`node`): [`TextNode`](#textnode)

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:311](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L311)

Clones this node, creating a new node with a different key
and adding it to the EditorState (but not attaching it anywhere!). All nodes must
implement this method.

###### Parameters

###### node

[`TextNode`](#textnode)

###### Returns

[`TextNode`](#textnode)

##### getType() {#gettype-18}

> `static` **getType**(): `string`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:307](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L307)

Returns the string type of this node. Every node must
implement this and it MUST BE UNIQUE amongst nodes registered
on the editor.

###### Returns

`string`

##### importDOM() {#importdom-8}

> `static` **importDOM**(): `null` \| [`DOMConversionMap`](#domconversionmap)

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:573](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L573)

###### Returns

`null` \| [`DOMConversionMap`](#domconversionmap)

##### importJSON() {#importjson-12}

> `static` **importJSON**(`serializedNode`): [`TextNode`](#textnode)

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:626](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L626)

Controls how the this node is deserialized from JSON. This is usually boilerplate,
but provides an abstraction between the node implementation and serialized interface that can
be important if you ever make breaking changes to a node schema (by adding or removing properties).
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Parameters

###### serializedNode

[`SerializedTextNode`](#serializedtextnode)

###### Returns

[`TextNode`](#textnode)

##### transform() {#transform-4}

> `static` **transform**(): `null` \| (`node`) => `void`

Defined in: [packages/lexical/src/LexicalNode.ts:1204](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1204)

**`Experimental`**

Registers the returned function as a transform on the node during
Editor initialization. Most such use cases should be addressed via
the [LexicalEditor.registerNodeTransform](#registernodetransform) API.

Experimental - use at your own risk.

###### Returns

`null` \| (`node`) => `void`

## Interfaces

### BaseCaret {#basecaret}

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:47](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L47)

#### Extends

- `Iterable`\<[`SiblingCaret`](#siblingcaret)\<[`LexicalNode`](#lexicalnode), `D`\>\>

#### Extended by

- [`ChildCaret`](#childcaret)
- [`SiblingCaret`](#siblingcaret)
- [`TextPointCaret`](#textpointcaret)

#### Type Parameters

##### T

`T` *extends* [`LexicalNode`](#lexicalnode)

##### D

`D` *extends* [`CaretDirection`](#caretdirection)

##### Type

`Type`

#### Properties

##### direction {#direction}

> `readonly` **direction**: `D`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:57](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L57)

next if pointing at the next sibling or first child, previous if pointing at the previous sibling or last child

##### getAdjacentCaret() {#getadjacentcaret}

> **getAdjacentCaret**: () => `null` \| [`SiblingCaret`](#siblingcaret)\<[`LexicalNode`](#lexicalnode), `D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:63](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L63)

Get a new SiblingCaret from getNodeAtCaret() in the same direction.

###### Returns

`null` \| [`SiblingCaret`](#siblingcaret)\<[`LexicalNode`](#lexicalnode), `D`\>

##### getNodeAtCaret() {#getnodeatcaret}

> **getNodeAtCaret**: () => `null` \| [`LexicalNode`](#lexicalnode)

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:61](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L61)

Get the node connected to the origin in the caret's direction, or null if there is no node

###### Returns

`null` \| [`LexicalNode`](#lexicalnode)

##### getParentAtCaret() {#getparentatcaret}

> **getParentAtCaret**: () => `null` \| [`ElementNode`](#elementnode)

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:59](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L59)

Get the ElementNode that is the logical parent (`origin` for `ChildCaret`, `origin.getParent()` for `SiblingCaret`)

###### Returns

`null` \| [`ElementNode`](#elementnode)

##### getSiblingCaret() {#getsiblingcaret}

> **getSiblingCaret**: () => [`SiblingCaret`](#siblingcaret)\<`T`, `D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:67](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L67)

Get a new SiblingCaret with this same node

###### Returns

[`SiblingCaret`](#siblingcaret)\<`T`, `D`\>

##### insert() {#insert}

> **insert**: (`node`) => `this`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:75](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L75)

Insert a node connected to origin in this direction (before the node that this caret is pointing towards, if any existed).
For a `SiblingCaret` this is `origin.insertAfter(node)` for next, or `origin.insertBefore(node)` for previous.
For a `ChildCaret` this is `origin.splice(0, 0, [node])` for next or `origin.append(node)` for previous.

###### Parameters

###### node

[`LexicalNode`](#lexicalnode)

###### Returns

`this`

##### origin {#origin}

> `readonly` **origin**: `T`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:53](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L53)

The origin node of this caret, typically this is what you will use in traversals

##### remove() {#remove-8}

> **remove**: () => `this`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:69](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L69)

Remove the getNodeAtCaret() node that this caret is pointing towards, if it exists

###### Returns

`this`

##### replaceOrInsert() {#replaceorinsert}

> **replaceOrInsert**: (`node`, `includeChildren?`) => `this`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:77](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L77)

If getNodeAtCaret() is not null then replace it with node, otherwise insert node

###### Parameters

###### node

[`LexicalNode`](#lexicalnode)

###### includeChildren?

`boolean`

###### Returns

`this`

##### splice() {#splice-4}

> **splice**: (`deleteCount`, `nodes`, `nodesDirection?`) => `this`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:85](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L85)

Splice an iterable (typically an Array) of nodes into this location.

###### Parameters

###### deleteCount

`number`

The number of existing nodes to replace or delete

###### nodes

`Iterable`\<[`LexicalNode`](#lexicalnode)\>

An iterable of nodes that will be inserted in this location, using replace instead of insert for the first deleteCount nodes

###### nodesDirection?

[`CaretDirection`](#caretdirection)

The direction of the nodes iterable, defaults to 'next'

###### Returns

`this`

##### type {#type-1}

> `readonly` **type**: `Type`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:55](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L55)

sibling for a SiblingCaret (pointing at the next or previous sibling) or child for a ChildCaret (pointing at the first or last child)

***

### BaseSelection {#baseselection}

Defined in: [packages/lexical/src/LexicalSelection.ts:302](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L302)

#### Properties

##### \_cachedNodes {#_cachednodes}

> **\_cachedNodes**: `null` \| [`LexicalNode`](#lexicalnode)[]

Defined in: [packages/lexical/src/LexicalSelection.ts:303](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L303)

##### dirty {#dirty}

> **dirty**: `boolean`

Defined in: [packages/lexical/src/LexicalSelection.ts:304](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L304)

#### Methods

##### clone() {#clone-14}

> **clone**(): [`BaseSelection`](#baseselection)

Defined in: [packages/lexical/src/LexicalSelection.ts:306](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L306)

###### Returns

[`BaseSelection`](#baseselection)

##### extract() {#extract}

> **extract**(): [`LexicalNode`](#lexicalnode)[]

Defined in: [packages/lexical/src/LexicalSelection.ts:307](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L307)

###### Returns

[`LexicalNode`](#lexicalnode)[]

##### getCachedNodes() {#getcachednodes}

> **getCachedNodes**(): `null` \| [`LexicalNode`](#lexicalnode)[]

Defined in: [packages/lexical/src/LexicalSelection.ts:317](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L317)

###### Returns

`null` \| [`LexicalNode`](#lexicalnode)[]

##### getNodes() {#getnodes}

> **getNodes**(): [`LexicalNode`](#lexicalnode)[]

Defined in: [packages/lexical/src/LexicalSelection.ts:308](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L308)

###### Returns

[`LexicalNode`](#lexicalnode)[]

##### getStartEndPoints() {#getstartendpoints}

> **getStartEndPoints**(): `null` \| \[[`PointType`](#pointtype-1), [`PointType`](#pointtype-1)\]

Defined in: [packages/lexical/src/LexicalSelection.ts:314](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L314)

###### Returns

`null` \| \[[`PointType`](#pointtype-1), [`PointType`](#pointtype-1)\]

##### getTextContent() {#gettextcontent-10}

> **getTextContent**(): `string`

Defined in: [packages/lexical/src/LexicalSelection.ts:309](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L309)

###### Returns

`string`

##### insertNodes() {#insertnodes}

> **insertNodes**(`nodes`): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:313](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L313)

###### Parameters

###### nodes

[`LexicalNode`](#lexicalnode)[]

###### Returns

`void`

##### insertRawText() {#insertrawtext}

> **insertRawText**(`text`): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:311](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L311)

###### Parameters

###### text

`string`

###### Returns

`void`

##### insertText() {#inserttext}

> **insertText**(`text`): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:310](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L310)

###### Parameters

###### text

`string`

###### Returns

`void`

##### is() {#is-6}

> **is**(`selection`): `boolean`

Defined in: [packages/lexical/src/LexicalSelection.ts:312](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L312)

###### Parameters

###### selection

`null` | [`BaseSelection`](#baseselection)

###### Returns

`boolean`

##### isBackward() {#isbackward}

> **isBackward**(): `boolean`

Defined in: [packages/lexical/src/LexicalSelection.ts:316](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L316)

###### Returns

`boolean`

##### isCollapsed() {#iscollapsed}

> **isCollapsed**(): `boolean`

Defined in: [packages/lexical/src/LexicalSelection.ts:315](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L315)

###### Returns

`boolean`

##### setCachedNodes() {#setcachednodes}

> **setCachedNodes**(`nodes`): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:318](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L318)

###### Parameters

###### nodes

`null` | [`LexicalNode`](#lexicalnode)[]

###### Returns

`void`

***

### CaretRange {#caretrange}

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:95](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L95)

A RangeSelection expressed as a pair of Carets

#### Extends

- `Iterable`\<[`NodeCaret`](#nodecaret)\<`D`\>\>

#### Type Parameters

##### D

`D` *extends* [`CaretDirection`](#caretdirection) = [`CaretDirection`](#caretdirection)

#### Properties

##### anchor {#anchor}

> **anchor**: [`PointCaret`](#pointcaret)\<`D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:99](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L99)

##### direction {#direction-1}

> `readonly` **direction**: `D`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:98](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L98)

##### focus {#focus}

> **focus**: [`PointCaret`](#pointcaret)\<`D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:100](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L100)

##### getTextSlices() {#gettextslices}

> **getTextSlices**: () => [`TextPointCaretSliceTuple`](#textpointcaretslicetuple)\<`D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:122](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L122)

There are between zero and two non-null TextSliceCarets for a CaretRange.
Note that when anchor and focus share an origin node the second element
will be null because the slice is entirely represented by the first element.

`[slice, slice]`: anchor and focus are TextPointCaret with distinct origin nodes
`[slice, null]`: anchor is a TextPointCaret
`[null, slice]`: focus is a TextPointCaret
`[null, null]`: Neither anchor nor focus are TextPointCarets

###### Returns

[`TextPointCaretSliceTuple`](#textpointcaretslicetuple)\<`D`\>

##### isCollapsed() {#iscollapsed-2}

> **isCollapsed**: () => `boolean`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:102](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L102)

Return true if anchor and focus are the same caret

###### Returns

`boolean`

##### iterNodeCarets() {#iternodecarets}

> **iterNodeCarets**: (`rootMode?`) => `IterableIterator`\<[`NodeCaret`](#nodecaret)\<`D`\>\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:111](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L111)

Iterate the carets between anchor and focus in a pre-order fashion, note
that this does not include any text slices represented by the anchor and/or
focus. Those are accessed separately from getTextSlices.

An ElementNode origin will be yielded as a ChildCaret on enter,
and a SiblingCaret on leave.

###### Parameters

###### rootMode?

[`RootMode`](#rootmode-1)

###### Returns

`IterableIterator`\<[`NodeCaret`](#nodecaret)\<`D`\>\>

##### type {#type-2}

> `readonly` **type**: `"node-caret-range"`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:97](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L97)

#### Methods

##### \[iterator\]() {#iterator}

> **\[iterator\]**(): `Iterator`\<[`NodeCaret`](#nodecaret)\<`D`\>, `any`, `any`\>

Defined in: [node\_modules/.pnpm/typescript@5.9.2/node\_modules/typescript/lib/lib.es2015.iterable.d.ts:49](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/typescript@5.9.2/node_modules/typescript/lib/lib.es2015.iterable.d.ts#L49)

###### Returns

`Iterator`\<[`NodeCaret`](#nodecaret)\<`D`\>, `any`, `any`\>

###### Inherited from

`Iterable.[iterator]`

***

### ChildCaret {#childcaret}

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:227](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L227)

A ChildCaret points from an origin ElementNode towards its first or last child.

#### Extends

- [`BaseCaret`](#basecaret)\<`T`, `D`, `"child"`\>

#### Type Parameters

##### T

`T` *extends* [`ElementNode`](#elementnode) = [`ElementNode`](#elementnode)

##### D

`D` *extends* [`CaretDirection`](#caretdirection) = [`CaretDirection`](#caretdirection)

#### Properties

##### direction {#direction-2}

> `readonly` **direction**: `D`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:57](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L57)

next if pointing at the next sibling or first child, previous if pointing at the previous sibling or last child

###### Inherited from

[`BaseCaret`](#basecaret).[`direction`](#direction)

##### getAdjacentCaret() {#getadjacentcaret-1}

> **getAdjacentCaret**: () => `null` \| [`SiblingCaret`](#siblingcaret)\<[`LexicalNode`](#lexicalnode), `D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:63](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L63)

Get a new SiblingCaret from getNodeAtCaret() in the same direction.

###### Returns

`null` \| [`SiblingCaret`](#siblingcaret)\<[`LexicalNode`](#lexicalnode), `D`\>

###### Inherited from

[`BaseCaret`](#basecaret).[`getAdjacentCaret`](#getadjacentcaret)

##### getChildCaret() {#getchildcaret}

> **getChildCaret**: () => `this`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:236](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L236)

Return this, the ChildCaret is already a child caret of its origin

###### Returns

`this`

##### getFlipped() {#getflipped}

> **getFlipped**: () => [`NodeCaret`](#nodecaret)\<[`FlipDirection`](#flipdirection)\<`D`\>\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:264](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L264)

Get a new NodeCaret with the head and tail of its directional arrow flipped, such that flipping twice is the identity.
For example, given a non-empty parent with a firstChild and lastChild, and a second emptyParent node with no children:

###### Returns

[`NodeCaret`](#nodecaret)\<[`FlipDirection`](#flipdirection)\<`D`\>\>

###### Example

```
caret.getFlipped().getFlipped().is(caret) === true;
$getChildCaret(parent, 'next').getFlipped().is($getSiblingCaret(firstChild, 'previous')) === true;
$getSiblingCaret(lastChild, 'next').getFlipped().is($getChildCaret(parent, 'previous')) === true;
$getSiblingCaret(firstChild, 'next).getFlipped().is($getSiblingCaret(lastChild, 'previous')) === true;
$getChildCaret(emptyParent, 'next').getFlipped().is($getChildCaret(emptyParent, 'previous')) === true;
```

##### getLatest() {#getlatest-6}

> **getLatest**: () => [`ChildCaret`](#childcaret)\<`T`, `D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:232](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L232)

Get a new caret with the latest origin pointer

###### Returns

[`ChildCaret`](#childcaret)\<`T`, `D`\>

##### getNodeAtCaret() {#getnodeatcaret-1}

> **getNodeAtCaret**: () => `null` \| [`LexicalNode`](#lexicalnode)

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:61](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L61)

Get the node connected to the origin in the caret's direction, or null if there is no node

###### Returns

`null` \| [`LexicalNode`](#lexicalnode)

###### Inherited from

[`BaseCaret`](#basecaret).[`getNodeAtCaret`](#getnodeatcaret)

##### getParentAtCaret() {#getparentatcaret-1}

> **getParentAtCaret**: () => `T`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:234](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L234)

Get the ElementNode that is the logical parent (`origin` for `ChildCaret`, `origin.getParent()` for `SiblingCaret`)

###### Returns

`T`

###### Overrides

[`BaseCaret`](#basecaret).[`getParentAtCaret`](#getparentatcaret)

##### getParentCaret() {#getparentcaret}

> **getParentCaret**: (`mode?`) => `null` \| [`SiblingCaret`](#siblingcaret)\<`T`, `D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:233](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L233)

###### Parameters

###### mode?

[`RootMode`](#rootmode-1)

###### Returns

`null` \| [`SiblingCaret`](#siblingcaret)\<`T`, `D`\>

##### getSiblingCaret() {#getsiblingcaret-1}

> **getSiblingCaret**: () => [`SiblingCaret`](#siblingcaret)\<`T`, `D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:67](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L67)

Get a new SiblingCaret with this same node

###### Returns

[`SiblingCaret`](#siblingcaret)\<`T`, `D`\>

###### Inherited from

[`BaseCaret`](#basecaret).[`getSiblingCaret`](#getsiblingcaret)

##### insert() {#insert-1}

> **insert**: (`node`) => `this`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:75](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L75)

Insert a node connected to origin in this direction (before the node that this caret is pointing towards, if any existed).
For a `SiblingCaret` this is `origin.insertAfter(node)` for next, or `origin.insertBefore(node)` for previous.
For a `ChildCaret` this is `origin.splice(0, 0, [node])` for next or `origin.append(node)` for previous.

###### Parameters

###### node

[`LexicalNode`](#lexicalnode)

###### Returns

`this`

###### Inherited from

[`BaseCaret`](#basecaret).[`insert`](#insert)

##### isSameNodeCaret() {#issamenodecaret}

> **isSameNodeCaret**: (`other`) => `other is ChildCaret<T, D>`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:241](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L241)

Return true if other is a ChildCaret with the same
origin (by node key comparison) and direction.

###### Parameters

###### other

`undefined` | `null` | [`PointCaret`](#pointcaret)\<[`CaretDirection`](#caretdirection)\>

###### Returns

`other is ChildCaret<T, D>`

##### isSamePointCaret() {#issamepointcaret}

> **isSamePointCaret**: (`other`) => `other is ChildCaret<T, D>`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:248](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L248)

Return true if other is a ChildCaret with the same
origin (by node key comparison) and direction.

###### Parameters

###### other

`undefined` | `null` | [`PointCaret`](#pointcaret)\<[`CaretDirection`](#caretdirection)\>

###### Returns

`other is ChildCaret<T, D>`

##### origin {#origin-1}

> `readonly` **origin**: `T`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:53](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L53)

The origin node of this caret, typically this is what you will use in traversals

###### Inherited from

[`BaseCaret`](#basecaret).[`origin`](#origin)

##### remove() {#remove-9}

> **remove**: () => `this`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:69](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L69)

Remove the getNodeAtCaret() node that this caret is pointing towards, if it exists

###### Returns

`this`

###### Inherited from

[`BaseCaret`](#basecaret).[`remove`](#remove-8)

##### replaceOrInsert() {#replaceorinsert-1}

> **replaceOrInsert**: (`node`, `includeChildren?`) => `this`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:77](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L77)

If getNodeAtCaret() is not null then replace it with node, otherwise insert node

###### Parameters

###### node

[`LexicalNode`](#lexicalnode)

###### includeChildren?

`boolean`

###### Returns

`this`

###### Inherited from

[`BaseCaret`](#basecaret).[`replaceOrInsert`](#replaceorinsert)

##### splice() {#splice-5}

> **splice**: (`deleteCount`, `nodes`, `nodesDirection?`) => `this`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:85](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L85)

Splice an iterable (typically an Array) of nodes into this location.

###### Parameters

###### deleteCount

`number`

The number of existing nodes to replace or delete

###### nodes

`Iterable`\<[`LexicalNode`](#lexicalnode)\>

An iterable of nodes that will be inserted in this location, using replace instead of insert for the first deleteCount nodes

###### nodesDirection?

[`CaretDirection`](#caretdirection)

The direction of the nodes iterable, defaults to 'next'

###### Returns

`this`

###### Inherited from

[`BaseCaret`](#basecaret).[`splice`](#splice-4)

##### type {#type-3}

> `readonly` **type**: `"child"`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:55](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L55)

sibling for a SiblingCaret (pointing at the next or previous sibling) or child for a ChildCaret (pointing at the first or last child)

###### Inherited from

[`BaseCaret`](#basecaret).[`type`](#type-1)

***

### CommonAncestorResultAncestor {#commonancestorresultancestor}

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:1308](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L1308)

Node a is an ancestor of node b, and not the same node

#### Type Parameters

##### A

`A` *extends* [`ElementNode`](#elementnode)

#### Properties

##### commonAncestor {#commonancestor}

> `readonly` **commonAncestor**: `A`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:1310](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L1310)

##### type {#type-4}

> `readonly` **type**: `"ancestor"`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:1309](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L1309)

***

### CommonAncestorResultBranch {#commonancestorresultbranch}

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:1318](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L1318)

Node a and node b have a common ancestor but are on different branches,
the `a` and `b` properties of this result are the ancestors of a and b
that are children of the commonAncestor. Since they are siblings, their
positions are comparable to determine order in the document.

#### Type Parameters

##### A

`A` *extends* [`LexicalNode`](#lexicalnode)

##### B

`B` *extends* [`LexicalNode`](#lexicalnode)

#### Properties

##### a {#a-2}

> `readonly` **a**: [`ElementNode`](#elementnode) \| `A`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:1325](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L1325)

The ancestor of `a` that is a child of `commonAncestor`

##### b {#b-1}

> `readonly` **b**: [`ElementNode`](#elementnode) \| `B`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:1327](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L1327)

The ancestor of `b` that is a child of `commonAncestor`

##### commonAncestor {#commonancestor-1}

> `readonly` **commonAncestor**: [`ElementNode`](#elementnode)

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:1323](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L1323)

##### type {#type-5}

> `readonly` **type**: `"branch"`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:1322](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L1322)

***

### CommonAncestorResultDescendant {#commonancestorresultdescendant}

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:1301](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L1301)

Node a was a descendant of node b, and not the same node

#### Type Parameters

##### B

`B` *extends* [`ElementNode`](#elementnode)

#### Properties

##### commonAncestor {#commonancestor-2}

> `readonly` **commonAncestor**: `B`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:1303](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L1303)

##### type {#type-6}

> `readonly` **type**: `"descendant"`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:1302](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L1302)

***

### CommonAncestorResultSame {#commonancestorresultsame}

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:1294](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L1294)

The two compared nodes are the same

#### Type Parameters

##### A

`A` *extends* [`LexicalNode`](#lexicalnode)

#### Properties

##### commonAncestor {#commonancestor-3}

> `readonly` **commonAncestor**: `A`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:1296](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L1296)

##### type {#type-7}

> `readonly` **type**: `"same"`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:1295](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L1295)

***

### EditorState {#editorstate}

Defined in: [packages/lexical/src/LexicalEditorState.ts:105](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditorState.ts#L105)

#### Properties

##### \_flushSync {#_flushsync}

> **\_flushSync**: `boolean`

Defined in: [packages/lexical/src/LexicalEditorState.ts:108](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditorState.ts#L108)

##### \_nodeMap {#_nodemap}

> **\_nodeMap**: [`NodeMap`](#nodemap)

Defined in: [packages/lexical/src/LexicalEditorState.ts:106](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditorState.ts#L106)

##### \_readOnly {#_readonly}

> **\_readOnly**: `boolean`

Defined in: [packages/lexical/src/LexicalEditorState.ts:109](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditorState.ts#L109)

##### \_selection {#_selection}

> **\_selection**: `null` \| [`BaseSelection`](#baseselection)

Defined in: [packages/lexical/src/LexicalEditorState.ts:107](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditorState.ts#L107)

#### Methods

##### clone() {#clone-16}

> **clone**(`selection?`): [`EditorState`](#editorstate)

Defined in: [packages/lexical/src/LexicalEditorState.ts:130](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditorState.ts#L130)

###### Parameters

###### selection?

`null` | [`BaseSelection`](#baseselection)

###### Returns

[`EditorState`](#editorstate)

##### isEmpty() {#isempty-2}

> **isEmpty**(): `boolean`

Defined in: [packages/lexical/src/LexicalEditorState.ts:118](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditorState.ts#L118)

###### Returns

`boolean`

##### read() {#read}

> **read**\<`V`\>(`callbackFn`, `options?`): `V`

Defined in: [packages/lexical/src/LexicalEditorState.ts:122](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditorState.ts#L122)

###### Type Parameters

###### V

`V`

###### Parameters

###### callbackFn

() => `V`

###### options?

[`EditorStateReadOptions`](#editorstatereadoptions)

###### Returns

`V`

##### toJSON() {#tojson}

> **toJSON**(): [`SerializedEditorState`](#serializededitorstate)

Defined in: [packages/lexical/src/LexicalEditorState.ts:139](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditorState.ts#L139)

###### Returns

[`SerializedEditorState`](#serializededitorstate)

***

### EditorStateReadOptions {#editorstatereadoptions}

Defined in: [packages/lexical/src/LexicalEditorState.ts:94](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditorState.ts#L94)

#### Properties

##### editor? {#editor}

> `optional` **editor**: `null` \| [`LexicalEditor`](#lexicaleditor)

Defined in: [packages/lexical/src/LexicalEditorState.ts:95](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditorState.ts#L95)

***

### EditorThemeClasses {#editorthemeclasses}

Defined in: [packages/lexical/src/LexicalEditor.ts:131](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L131)

#### Indexable

\[`key`: `string`\]: `any`

#### Properties

##### blockCursor? {#blockcursor}

> `optional` **blockCursor**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:132](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L132)

##### characterLimit? {#characterlimit}

> `optional` **characterLimit**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:133](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L133)

##### code? {#code}

> `optional` **code**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:134](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L134)

##### codeHighlight? {#codehighlight}

> `optional` **codeHighlight**: `Record`\<`string`, `string`\>

Defined in: [packages/lexical/src/LexicalEditor.ts:135](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L135)

##### embedBlock? {#embedblock}

> `optional` **embedBlock**: `object`

Defined in: [packages/lexical/src/LexicalEditor.ts:186](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L186)

###### base?

> `optional` **base**: `string`

###### focus?

> `optional` **focus**: `string`

##### hashtag? {#hashtag}

> `optional` **hashtag**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:136](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L136)

##### heading? {#heading}

> `optional` **heading**: `object`

Defined in: [packages/lexical/src/LexicalEditor.ts:138](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L138)

###### h1?

> `optional` **h1**: `string`

###### h2?

> `optional` **h2**: `string`

###### h3?

> `optional` **h3**: `string`

###### h4?

> `optional` **h4**: `string`

###### h5?

> `optional` **h5**: `string`

###### h6?

> `optional` **h6**: `string`

##### hr? {#hr}

> `optional` **hr**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:146](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L146)

##### hrSelected? {#hrselected}

> `optional` **hrSelected**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:147](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L147)

##### image? {#image}

> `optional` **image**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:148](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L148)

##### indent? {#indent}

> `optional` **indent**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:190](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L190)

##### link? {#link}

> `optional` **link**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:149](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L149)

##### list? {#list}

> `optional` **list**: `object`

Defined in: [packages/lexical/src/LexicalEditor.ts:150](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L150)

###### checklist?

> `optional` **checklist**: `string`

###### listitem?

> `optional` **listitem**: `string`

###### listitemChecked?

> `optional` **listitemChecked**: `string`

###### listitemUnchecked?

> `optional` **listitemUnchecked**: `string`

###### nested?

> `optional` **nested**: `object`

###### nested.list?

> `optional` **list**: `string`

###### nested.listitem?

> `optional` **listitem**: `string`

###### ol?

> `optional` **ol**: `string`

###### olDepth?

> `optional` **olDepth**: `string`[]

###### ul?

> `optional` **ul**: `string`

###### ulDepth?

> `optional` **ulDepth**: `string`[]

##### ltr? {#ltr}

> `optional` **ltr**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:164](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L164)

##### mark? {#mark}

> `optional` **mark**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:165](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L165)

##### markOverlap? {#markoverlap}

> `optional` **markOverlap**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:166](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L166)

##### paragraph? {#paragraph}

> `optional` **paragraph**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:167](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L167)

##### quote? {#quote}

> `optional` **quote**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:168](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L168)

##### root? {#root}

> `optional` **root**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:169](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L169)

##### rtl? {#rtl}

> `optional` **rtl**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:170](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L170)

##### specialText? {#specialtext}

> `optional` **specialText**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:137](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L137)

##### tab? {#tab}

> `optional` **tab**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:171](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L171)

##### table? {#table}

> `optional` **table**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:172](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L172)

##### tableAddColumns? {#tableaddcolumns}

> `optional` **tableAddColumns**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:173](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L173)

##### tableAddRows? {#tableaddrows}

> `optional` **tableAddRows**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:174](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L174)

##### tableCell? {#tablecell}

> `optional` **tableCell**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:178](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L178)

##### tableCellActionButton? {#tablecellactionbutton}

> `optional` **tableCellActionButton**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:175](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L175)

##### tableCellActionButtonContainer? {#tablecellactionbuttoncontainer}

> `optional` **tableCellActionButtonContainer**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:176](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L176)

##### tableCellHeader? {#tablecellheader}

> `optional` **tableCellHeader**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:179](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L179)

##### tableCellResizer? {#tablecellresizer}

> `optional` **tableCellResizer**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:180](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L180)

##### tableCellSelected? {#tablecellselected}

> `optional` **tableCellSelected**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:177](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L177)

##### tableRow? {#tablerow}

> `optional` **tableRow**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:181](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L181)

##### tableScrollableWrapper? {#tablescrollablewrapper}

> `optional` **tableScrollableWrapper**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:182](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L182)

##### tableSelected? {#tableselected}

> `optional` **tableSelected**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:183](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L183)

##### tableSelection? {#tableselection}

> `optional` **tableSelection**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:184](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L184)

##### text? {#text}

> `optional` **text**: `TextNodeThemeClasses`

Defined in: [packages/lexical/src/LexicalEditor.ts:185](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L185)

***

### ElementDOMSlot {#elementdomslot}

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:86](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L86)

A utility class for managing the DOM children of an ElementNode

#### Type Parameters

##### T

`T` *extends* `HTMLElement` = `HTMLElement`

#### Properties

##### after {#after}

> `readonly` **after**: `null` \| `Node`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:89](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L89)

##### before {#before}

> `readonly` **before**: `null` \| `Node`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:88](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L88)

##### element {#element}

> `readonly` **element**: `T`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:87](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L87)

#### Methods

##### getFirstChild() {#getfirstchild-2}

> **getFirstChild**(): `null` \| `ChildNode`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:168](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L168)

Returns the first managed child of this node,
which will either be this.after.nextSibling or this.element.firstChild,
and will never be this.before if it is defined.

###### Returns

`null` \| `ChildNode`

##### insertChild() {#insertchild}

> **insertChild**(`dom`): `this`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:129](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L129)

Insert the given child before this.before and any reconciler managed line break node,
or append it if this.before is not defined

###### Parameters

###### dom

`Node`

###### Returns

`this`

##### removeChild() {#removechild}

> **removeChild**(`dom`): `this`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:141](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L141)

Remove the managed child from this container, will throw if it was not already there

###### Parameters

###### dom

`Node`

###### Returns

`this`

##### replaceChild() {#replacechild}

> **replaceChild**(`dom`, `prevDom`): `this`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:155](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L155)

Replace managed child prevDom with dom. Will throw if prevDom is not a child

###### Parameters

###### dom

`Node`

The new node to replace prevDom

###### prevDom

`Node`

the node that will be replaced

###### Returns

`this`

##### withAfter() {#withafter}

> **withAfter**(`after`): [`ElementDOMSlot`](#elementdomslot)\<`T`\>

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:111](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L111)

Return a new ElementDOMSlot where all managed children will be inserted after this node

###### Parameters

###### after

`undefined` | `null` | `Node`

###### Returns

[`ElementDOMSlot`](#elementdomslot)\<`T`\>

##### withBefore() {#withbefore}

> **withBefore**(`before`): [`ElementDOMSlot`](#elementdomslot)\<`T`\>

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:105](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L105)

Return a new ElementDOMSlot where all managed children will be inserted before this node

###### Parameters

###### before

`undefined` | `null` | `Node`

###### Returns

[`ElementDOMSlot`](#elementdomslot)\<`T`\>

##### withElement() {#withelement}

> **withElement**\<`ElementType`\>(`element`): [`ElementDOMSlot`](#elementdomslot)\<`ElementType`\>

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:117](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L117)

Return a new ElementDOMSlot with an updated root element

###### Type Parameters

###### ElementType

`ElementType` *extends* `HTMLElement`

###### Parameters

###### element

`ElementType`

###### Returns

[`ElementDOMSlot`](#elementdomslot)\<`ElementType`\>

***

### ExtensionBuildState {#extensionbuildstate}

Defined in: [packages/lexical/src/extension-core/types.ts:100](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L100)

#### Extends

- `Omit`\<[`ExtensionInitState`](#extensioninitstate), `"getPeer"` \| `"getDependency"`\>

#### Extended by

- [`ExtensionRegisterState`](#extensionregisterstate)

#### Type Parameters

##### Init

`Init`

#### Properties

##### getDependency() {#getdependency}

> **getDependency**: \<`Dependency`\>(`dep`) => [`LexicalExtensionDependency`](#lexicalextensiondependency)\<`Dependency`\>

Defined in: [packages/lexical/src/extension-core/types.ts:113](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L113)

Get the configuration of a dependency by extension
(must be a direct dependency of this extension)

###### Type Parameters

###### Dependency

`Dependency` *extends* [`AnyLexicalExtension`](#anylexicalextension)

###### Parameters

###### dep

`Dependency`

###### Returns

[`LexicalExtensionDependency`](#lexicalextensiondependency)\<`Dependency`\>

##### getDirectDependentNames() {#getdirectdependentnames}

> **getDirectDependentNames**: () => `ReadonlySet`\<`string`\>

Defined in: [packages/lexical/src/extension-core/types.ts:91](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L91)

Get the names of any direct dependents of this
Extension, typically only used for error messages.

###### Returns

`ReadonlySet`\<`string`\>

###### Inherited from

[`ExtensionInitState`](#extensioninitstate).[`getDirectDependentNames`](#getdirectdependentnames-1)

##### getInitResult() {#getinitresult}

> **getInitResult**: () => `Init`

Defined in: [packages/lexical/src/extension-core/types.ts:119](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L119)

The result of the init function

###### Returns

`Init`

##### getPeer() {#getpeer}

> **getPeer**: \<`Dependency`\>(`name`) => `undefined` \| [`LexicalExtensionDependency`](#lexicalextensiondependency)\<`Dependency`\>

Defined in: [packages/lexical/src/extension-core/types.ts:106](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L106)

Get the result of a peerDependency by name, if it exists
(must be a peerDependency of this extension)

###### Type Parameters

###### Dependency

`Dependency` *extends* [`AnyLexicalExtension`](#anylexicalextension) = `never`

###### Parameters

###### name

`Dependency`\[`"name"`\]

###### Returns

`undefined` \| [`LexicalExtensionDependency`](#lexicalextensiondependency)\<`Dependency`\>

##### getPeerNameSet() {#getpeernameset}

> **getPeerNameSet**: () => `ReadonlySet`\<`string`\>

Defined in: [packages/lexical/src/extension-core/types.ts:97](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L97)

Get the names of all peer dependencies of this
Extension, even if they do not exist in the builder,
typically only used for devtools.

###### Returns

`ReadonlySet`\<`string`\>

###### Inherited from

[`ExtensionInitState`](#extensioninitstate).[`getPeerNameSet`](#getpeernameset-1)

***

### ExtensionInitState {#extensioninitstate}

Defined in: [packages/lexical/src/extension-core/types.ts:70](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L70)

An object that the init method can use to access the
configuration for extension dependencies

#### Properties

##### getDependency() {#getdependency-1}

> **getDependency**: \<`Dependency`\>(`dep`) => `Omit`\<[`LexicalExtensionDependency`](#lexicalextensiondependency)\<`Dependency`\>, `"output"` \| `"init"`\>

Defined in: [packages/lexical/src/extension-core/types.ts:84](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L84)

Get the configuration of a dependency by extension
(must be a direct dependency of this extension)

###### Type Parameters

###### Dependency

`Dependency` *extends* [`AnyLexicalExtension`](#anylexicalextension)

###### Parameters

###### dep

`Dependency`

###### Returns

`Omit`\<[`LexicalExtensionDependency`](#lexicalextensiondependency)\<`Dependency`\>, `"output"` \| `"init"`\>

##### getDirectDependentNames() {#getdirectdependentnames-1}

> **getDirectDependentNames**: () => `ReadonlySet`\<`string`\>

Defined in: [packages/lexical/src/extension-core/types.ts:91](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L91)

Get the names of any direct dependents of this
Extension, typically only used for error messages.

###### Returns

`ReadonlySet`\<`string`\>

##### getPeer() {#getpeer-1}

> **getPeer**: \<`Dependency`\>(`name`) => `undefined` \| `Omit`\<[`LexicalExtensionDependency`](#lexicalextensiondependency)\<`Dependency`\>, `"output"` \| `"init"`\>

Defined in: [packages/lexical/src/extension-core/types.ts:75](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L75)

Get the result of a peerDependency by name, if it exists
(must be a peerDependency of this extension)

###### Type Parameters

###### Dependency

`Dependency` *extends* [`AnyLexicalExtension`](#anylexicalextension) = `never`

###### Parameters

###### name

`Dependency`\[`"name"`\]

###### Returns

`undefined` \| `Omit`\<[`LexicalExtensionDependency`](#lexicalextensiondependency)\<`Dependency`\>, `"output"` \| `"init"`\>

##### getPeerNameSet() {#getpeernameset-1}

> **getPeerNameSet**: () => `ReadonlySet`\<`string`\>

Defined in: [packages/lexical/src/extension-core/types.ts:97](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L97)

Get the names of all peer dependencies of this
Extension, even if they do not exist in the builder,
typically only used for devtools.

###### Returns

`ReadonlySet`\<`string`\>

***

### ExtensionRegisterState {#extensionregisterstate}

Defined in: [packages/lexical/src/extension-core/types.ts:126](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L126)

An object that the register method can use to detect unmount and access the
configuration for extension dependencies

#### Extends

- [`ExtensionBuildState`](#extensionbuildstate)\<`Init`\>

#### Type Parameters

##### Init

`Init`

##### Output

`Output`

#### Properties

##### getDependency() {#getdependency-2}

> **getDependency**: \<`Dependency`\>(`dep`) => [`LexicalExtensionDependency`](#lexicalextensiondependency)\<`Dependency`\>

Defined in: [packages/lexical/src/extension-core/types.ts:113](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L113)

Get the configuration of a dependency by extension
(must be a direct dependency of this extension)

###### Type Parameters

###### Dependency

`Dependency` *extends* [`AnyLexicalExtension`](#anylexicalextension)

###### Parameters

###### dep

`Dependency`

###### Returns

[`LexicalExtensionDependency`](#lexicalextensiondependency)\<`Dependency`\>

###### Inherited from

[`ExtensionBuildState`](#extensionbuildstate).[`getDependency`](#getdependency)

##### getDirectDependentNames() {#getdirectdependentnames-2}

> **getDirectDependentNames**: () => `ReadonlySet`\<`string`\>

Defined in: [packages/lexical/src/extension-core/types.ts:91](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L91)

Get the names of any direct dependents of this
Extension, typically only used for error messages.

###### Returns

`ReadonlySet`\<`string`\>

###### Inherited from

[`ExtensionInitState`](#extensioninitstate).[`getDirectDependentNames`](#getdirectdependentnames-1)

##### getInitResult() {#getinitresult-1}

> **getInitResult**: () => `Init`

Defined in: [packages/lexical/src/extension-core/types.ts:119](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L119)

The result of the init function

###### Returns

`Init`

###### Inherited from

[`ExtensionBuildState`](#extensionbuildstate).[`getInitResult`](#getinitresult)

##### getOutput() {#getoutput}

> **getOutput**: () => `Output`

Defined in: [packages/lexical/src/extension-core/types.ts:133](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L133)

The result of the output function

###### Returns

`Output`

##### getPeer() {#getpeer-2}

> **getPeer**: \<`Dependency`\>(`name`) => `undefined` \| [`LexicalExtensionDependency`](#lexicalextensiondependency)\<`Dependency`\>

Defined in: [packages/lexical/src/extension-core/types.ts:106](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L106)

Get the result of a peerDependency by name, if it exists
(must be a peerDependency of this extension)

###### Type Parameters

###### Dependency

`Dependency` *extends* [`AnyLexicalExtension`](#anylexicalextension) = `never`

###### Parameters

###### name

`Dependency`\[`"name"`\]

###### Returns

`undefined` \| [`LexicalExtensionDependency`](#lexicalextensiondependency)\<`Dependency`\>

###### Inherited from

[`ExtensionBuildState`](#extensionbuildstate).[`getPeer`](#getpeer)

##### getPeerNameSet() {#getpeernameset-2}

> **getPeerNameSet**: () => `ReadonlySet`\<`string`\>

Defined in: [packages/lexical/src/extension-core/types.ts:97](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L97)

Get the names of all peer dependencies of this
Extension, even if they do not exist in the builder,
typically only used for devtools.

###### Returns

`ReadonlySet`\<`string`\>

###### Inherited from

[`ExtensionInitState`](#extensioninitstate).[`getPeerNameSet`](#getpeernameset-1)

##### getSignal() {#getsignal}

> **getSignal**: () => `AbortSignal`

Defined in: [packages/lexical/src/extension-core/types.ts:129](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L129)

An AbortSignal that is aborted when this LexicalEditor registration is disposed

###### Returns

`AbortSignal`

***

### InitialEditorConfig {#initialeditorconfig}

Defined in: [packages/lexical/src/extension-core/types.ts:357](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L357)

#### Extended by

- [`LexicalExtension`](#lexicalextension)

#### Properties

##### $initialEditorState? {#initialeditorstate}

> `optional` **$initialEditorState**: [`InitialEditorStateType`](#initialeditorstatetype)

Defined in: [packages/lexical/src/extension-core/types.ts:409](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L409)

The initial EditorState as a JSON string, an EditorState, or a function
to update the editor (once).

##### editable? {#editable}

> `optional` **editable**: `boolean`

Defined in: [packages/lexical/src/extension-core/types.ts:395](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L395)

Whether the initial state of the editor is editable or not

##### html? {#html}

> `optional` **html**: [`HTMLConfig`](#htmlconfig)

Defined in: [packages/lexical/src/extension-core/types.ts:391](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L391)

Overrides for HTML serialization (exportDOM) and
deserialization (importDOM) that does not require subclassing and node
replacement

##### namespace? {#namespace}

> `optional` **namespace**: `string`

Defined in: [packages/lexical/src/extension-core/types.ts:371](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L371)

The namespace of this Editor. If two editors share the same
namespace, JSON will be the clipboard interchange format.
Otherwise HTML will be used.

##### nodes? {#nodes}

> `optional` **nodes**: readonly [`LexicalNodeConfig`](#lexicalnodeconfig-4)[] \| () => `undefined` \| readonly [`LexicalNodeConfig`](#lexicalnodeconfig-4)[]

Defined in: [packages/lexical/src/extension-core/types.ts:381](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L381)

The nodes that this Extension adds to the Editor configuration, will be
merged with other Extensions.

Can be a function to defer the access of the nodes to editor construction
which may be useful in cases when the node and extension are defined in
different modules and have depenendencies on each other, depending on the
bundler configuration.

##### onError()? {#onerror}

> `optional` **onError**: (`error`, `editor`) => `void`

Defined in: [packages/lexical/src/extension-core/types.ts:404](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L404)

The editor will catch errors that happen during updates and
reconciliation and call this. It defaults to
`(error) => { throw error }`.

###### Parameters

###### error

`Error`

The Error object

###### editor

[`LexicalEditor`](#lexicaleditor)

The editor that this error came from

###### Returns

`void`

##### parentEditor? {#parenteditor}

> `optional` **parentEditor**: [`LexicalEditor`](#lexicaleditor)

Defined in: [packages/lexical/src/extension-core/types.ts:365](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L365)

Used when this editor is nested inside of another editor

##### theme? {#theme}

> `optional` **theme**: [`EditorThemeClasses`](#editorthemeclasses)

Defined in: [packages/lexical/src/extension-core/types.ts:385](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L385)

EditorThemeClasses that will be deep merged with other Extensions

***

### LexicalEditor {#lexicaleditor}

Defined in: [packages/lexical/src/LexicalEditor.ts:715](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L715)

#### Extended by

- [`LexicalEditorWithDispose`](#lexicaleditorwithdispose)

#### Methods

##### blur() {#blur}

> **blur**(): `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:1440](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1440)

Removes focus from the editor.

###### Returns

`void`

##### dispatchCommand() {#dispatchcommand}

> **dispatchCommand**\<`TCommand`\>(`type`, `payload`): `boolean`

Defined in: [packages/lexical/src/LexicalEditor.ts:1172](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1172)

Dispatches a command of the specified type with the specified payload.
This triggers all command listeners (set by [LexicalEditor.registerCommand](#registercommand))
for this type, passing them the provided payload. The command listeners
will be triggered in an implicit [LexicalEditor.update](#update), unless
this was invoked from inside an update in which case that update context
will be re-used (as if this was a dollar function itself).

###### Type Parameters

###### TCommand

`TCommand` *extends* [`LexicalCommand`](#lexicalcommand)\<`unknown`\>

###### Parameters

###### type

`TCommand`

the type of command listeners to trigger.

###### payload

[`CommandPayloadType`](#commandpayloadtype)\<`TCommand`\>

the data to pass as an argument to the command listeners.

###### Returns

`boolean`

##### focus() {#focus-1}

> **focus**(`callbackFn?`, `options?`): `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:1399](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1399)

Focuses the editor by marking the existing selection as dirty, or by
creating a new selection at `defaultSelection` if one does not already
exist. If you want to force a specific selection, you should call
`root.selectStart()` or `root.selectEnd()` in an update.

###### Parameters

###### callbackFn?

() => `void`

A function to run after the editor is focused.

###### options?

`EditorFocusOptions` = `{}`

A bag of options

###### Returns

`void`

##### getDecorators() {#getdecorators}

> **getDecorators**\<`T`\>(): `Record`\<[`NodeKey`](#nodekey), `T`\>

Defined in: [packages/lexical/src/LexicalEditor.ts:1183](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1183)

Gets a map of all decorators in the editor.

###### Type Parameters

###### T

`T`

###### Returns

`Record`\<[`NodeKey`](#nodekey), `T`\>

A mapping of call decorator keys to their decorated content

##### getEditorState() {#geteditorstate}

> **getEditorState**(): [`EditorState`](#editorstate)

Defined in: [packages/lexical/src/LexicalEditor.ts:1292](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1292)

Gets the active editor state.

###### Returns

[`EditorState`](#editorstate)

The editor state

##### getElementByKey() {#getelementbykey}

> **getElementByKey**(`key`): `null` \| `HTMLElement`

Defined in: [packages/lexical/src/LexicalEditor.ts:1284](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1284)

Gets the underlying HTMLElement associated with the LexicalNode for the given key.

###### Parameters

###### key

`string`

the key of the LexicalNode.

###### Returns

`null` \| `HTMLElement`

the HTMLElement rendered by the LexicalNode associated with the key.

##### getKey() {#getkey-6}

> **getKey**(): `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:1201](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1201)

Gets the key of the editor

###### Returns

`string`

The editor key

##### getRootElement() {#getrootelement}

> **getRootElement**(): `null` \| `HTMLElement`

Defined in: [packages/lexical/src/LexicalEditor.ts:1193](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1193)

###### Returns

`null` \| `HTMLElement`

the current root element of the editor. If you want to register
an event listener, do it via [LexicalEditor.registerRootListener](#registerrootlistener), since
this reference may not be stable.

##### hasNode() {#hasnode}

> **hasNode**\<`T`\>(`node`): `boolean`

Defined in: [packages/lexical/src/LexicalEditor.ts:1149](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1149)

Used to assert that a certain node is registered, usually by plugins to ensure nodes that they
depend on have been registered.

###### Type Parameters

###### T

`T` *extends* [`KlassConstructor`](#klassconstructor)\<*typeof* [`LexicalNode`](#lexicalnode)\>

###### Parameters

###### node

`T`

###### Returns

`boolean`

True if the editor has registered the provided node type, false otherwise.

##### hasNodes() {#hasnodes}

> **hasNodes**\<`T`\>(`nodes`): `boolean`

Defined in: [packages/lexical/src/LexicalEditor.ts:1158](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1158)

Used to assert that certain nodes are registered, usually by plugins to ensure nodes that they
depend on have been registered.

###### Type Parameters

###### T

`T` *extends* [`KlassConstructor`](#klassconstructor)\<*typeof* [`LexicalNode`](#lexicalnode)\>

###### Parameters

###### nodes

`T`[]

###### Returns

`boolean`

True if the editor has registered all of the provided node types, false otherwise.

##### isComposing() {#iscomposing-2}

> **isComposing**(): `boolean`

Defined in: [packages/lexical/src/LexicalEditor.ts:852](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L852)

###### Returns

`boolean`

true if the editor is currently in "composition" mode due to receiving input
through an IME, or 3P extension, for example. Returns false otherwise.

##### isEditable() {#iseditable}

> **isEditable**(): `boolean`

Defined in: [packages/lexical/src/LexicalEditor.ts:1457](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1457)

Returns true if the editor is editable, false otherwise.

###### Returns

`boolean`

True if the editor is editable, false otherwise.

##### parseEditorState() {#parseeditorstate}

> **parseEditorState**(`maybeStringifiedEditorState`, `updateFn?`): [`EditorState`](#editorstate)

Defined in: [packages/lexical/src/LexicalEditor.ts:1356](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1356)

Parses a SerializedEditorState (usually produced by [EditorState.toJSON](#tojson)) and returns
and EditorState object that can be, for example, passed to [LexicalEditor.setEditorState](#seteditorstate). Typically,
deserialization from JSON stored in a database uses this method.

###### Parameters

###### maybeStringifiedEditorState

`string` | [`SerializedEditorState`](#serializededitorstate)\<[`SerializedLexicalNode`](#serializedlexicalnode)\>

###### updateFn?

() => `void`

###### Returns

[`EditorState`](#editorstate)

##### read() {#read-2}

> **read**\<`T`\>(`callbackFn`): `T`

Defined in: [packages/lexical/src/LexicalEditor.ts:1375](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1375)

Executes a read of the editor's state, with the
editor context available (useful for exporting and read-only DOM
operations). Much like update, but prevents any mutation of the
editor's state. Any pending updates will be flushed immediately before
the read.

###### Type Parameters

###### T

`T`

###### Parameters

###### callbackFn

() => `T`

A function that has access to read-only editor state.

###### Returns

`T`

##### registerCommand() {#registercommand}

> **registerCommand**\<`P`\>(`command`, `listener`, `priority`): () => `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:950](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L950)

Registers a listener that will trigger anytime the provided command
is dispatched with LexicalEditor.dispatch, subject to priority.
Listeners that run at a higher priority can "intercept" commands and
prevent them from propagating to other handlers by returning true.

Listeners are always invoked in an [LexicalEditor.update](#update) and can
call dollar functions.

Listeners registered at the same priority level will run
deterministically in the order of registration.

###### Type Parameters

###### P

`P`

###### Parameters

###### command

[`LexicalCommand`](#lexicalcommand)\<`P`\>

the command that will trigger the callback.

###### listener

[`CommandListener`](#commandlistener)\<`P`\>

the function that will execute when the command is dispatched.

###### priority

[`CommandListenerPriority`](#commandlistenerpriority)

the relative priority of the listener. 0 | 1 | 2 | 3 | 4
  (or [COMMAND\_PRIORITY\_EDITOR](#command_priority_editor) |
    [COMMAND\_PRIORITY\_LOW](#command_priority_low) |
    [COMMAND\_PRIORITY\_NORMAL](#command_priority_normal) |
    [COMMAND\_PRIORITY\_HIGH](#command_priority_high) |
    [COMMAND\_PRIORITY\_CRITICAL](#command_priority_critical))

###### Returns

a teardown function that can be used to cleanup the listener.

> (): `void`

###### Returns

`void`

##### registerDecoratorListener() {#registerdecoratorlistener}

> **registerDecoratorListener**\<`T`\>(`listener`): () => `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:887](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L887)

Registers a listener for when the editor's decorator object changes. The decorator object contains
all DecoratorNode keys -> their decorated value. This is primarily used with external UI frameworks.

Will trigger the provided callback each time the editor transitions between these states until the
teardown function is called.

###### Type Parameters

###### T

`T`

###### Parameters

###### listener

`DecoratorListener`\<`T`\>

###### Returns

a teardown function that can be used to cleanup the listener.

> (): `void`

###### Returns

`void`

##### registerEditableListener() {#registereditablelistener}

> **registerEditableListener**(`listener`): () => `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:875](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L875)

Registers a listener for for when the editor changes between editable and non-editable states.
Will trigger the provided callback each time the editor transitions between these states until the
teardown function is called.

If the listener returns a function, that function will be called before the next transition or
teardown.

###### Parameters

###### listener

[`EditableListener`](#editablelistener)

###### Returns

a teardown function that can be used to cleanup the listener.

> (): `void`

###### Returns

`void`

##### registerMutationListener() {#registermutationlistener}

> **registerMutationListener**(`klass`, `listener`, `options?`): () => `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:1014](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1014)

Registers a listener that will run when a Lexical node of the provided class is
mutated. The listener will receive a list of nodes along with the type of mutation
that was performed on each: created, destroyed, or updated.

One common use case for this is to attach DOM event listeners to the underlying DOM nodes as Lexical nodes are created.
[LexicalEditor.getElementByKey](#getelementbykey) can be used for this.

If any existing nodes are in the DOM, and skipInitialization is not true, the listener
will be called immediately with an updateTag of 'registerMutationListener' where all
nodes have the 'created' NodeMutation. This can be controlled with the skipInitialization option
(whose default was previously true for backwards compatibility with &lt;=0.16.1 but has been changed to false as of 0.21.0).

###### Parameters

###### klass

[`KlassConstructor`](#klassconstructor)\<*typeof* [`LexicalNode`](#lexicalnode)\>

The class of the node that you want to listen to mutations on.

###### listener

[`MutationListener`](#mutationlistener)

The logic you want to run when the node is mutated.

###### options?

`MutationListenerOptions`

see MutationListenerOptions

###### Returns

a teardown function that can be used to cleanup the listener.

> (): `void`

###### Returns

`void`

##### registerNodeTransform() {#registernodetransform}

> **registerNodeTransform**\<`T`\>(`klass`, `listener`): () => `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:1117](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1117)

Registers a listener that will run when a Lexical node of the provided class is
marked dirty during an update. The listener will continue to run as long as the node
is marked dirty. There are no guarantees around the order of transform execution!

Watch out for infinite loops. See [Node Transforms](https://lexical.dev/docs/concepts/transforms)

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Parameters

###### klass

[`Klass`](#klass)\<`T`\>

The class of the node that you want to run transforms on.

###### listener

[`Transform`](#transform-7)\<`T`\>

The logic you want to run when the node is updated.

###### Returns

a teardown function that can be used to cleanup the listener.

> (): `void`

###### Returns

`void`

##### registerRootListener() {#registerrootlistener}

> **registerRootListener**(`listener`): () => `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:917](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L917)

Registers a listener for when the editor's root DOM element (the content editable
Lexical attaches to) changes. This is primarily used to attach event listeners to the root
 element. The root listener function is executed directly upon registration and then on
any subsequent update.

Will trigger the provided callback each time the editor transitions between these states until the
teardown function is called.

If the listener returns a function, that function will be called before the next transition or
teardown.

###### Parameters

###### listener

[`RootListener`](#rootlistener)

###### Returns

a teardown function that can be used to cleanup the listener.

> (): `void`

###### Returns

`void`

##### registerTextContentListener() {#registertextcontentlistener}

> **registerTextContentListener**(`listener`): () => `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:900](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L900)

Registers a listener for when Lexical commits an update to the DOM and the text content of
the editor changes from the previous state of the editor. If the text content is the
same between updates, no notifications to the listeners will happen.

Will trigger the provided callback each time the editor transitions between these states until the
teardown function is called.

###### Parameters

###### listener

`TextContentListener`

###### Returns

a teardown function that can be used to cleanup the listener.

> (): `void`

###### Returns

`void`

##### registerUpdateListener() {#registerupdatelistener}

> **registerUpdateListener**(`listener`): () => `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:862](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L862)

Registers a listener for Editor update event. Will trigger the provided callback
each time the editor goes through an update (via [LexicalEditor.update](#update)) until the
teardown function is called.

###### Parameters

###### listener

[`UpdateListener`](#updatelistener)

###### Returns

a teardown function that can be used to cleanup the listener.

> (): `void`

###### Returns

`void`

##### setEditable() {#seteditable}

> **setEditable**(`editable`): `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:1465](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1465)

Sets the editable property of the editor. When false, the
editor will not listen for user events on the underling contenteditable.

###### Parameters

###### editable

`boolean`

the value to set the editable mode to.

###### Returns

`void`

##### setEditorState() {#seteditorstate}

> **setEditorState**(`editorState`, `options?`): `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:1301](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1301)

Imperatively set the EditorState. Triggers reconciliation like an update.

###### Parameters

###### editorState

[`EditorState`](#editorstate)

the state to set the editor

###### options?

[`EditorSetOptions`](#editorsetoptions)

options for the update.

###### Returns

`void`

##### setRootElement() {#setrootelement}

> **setRootElement**(`nextRootElement`): `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:1209](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1209)

Imperatively set the root contenteditable element that Lexical listens
for events on.

###### Parameters

###### nextRootElement

`null` | `HTMLElement`

###### Returns

`void`

##### toJSON() {#tojson-2}

> **toJSON**(): [`SerializedEditor`](#serializededitor)

Defined in: [packages/lexical/src/LexicalEditor.ts:1480](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1480)

Returns a JSON-serializable javascript object NOT a JSON string.
You still must call JSON.stringify (or something else) to turn the
state into a string you can transfer over the wire and store in a database.

See [LexicalNode.exportJSON](#exportjson-8)

###### Returns

[`SerializedEditor`](#serializededitor)

A JSON-serializable javascript object

##### update() {#update}

> **update**(`updateFn`, `options?`): `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:1386](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1386)

Executes an update to the editor state. The updateFn callback is the ONLY place
where Lexical editor state can be safely mutated.

###### Parameters

###### updateFn

() => `void`

A function that has access to writable editor state.

###### options?

[`EditorUpdateOptions`](#editorupdateoptions)

A bag of options to control the behavior of the update.

###### Returns

`void`

***

### LexicalEditorWithDispose {#lexicaleditorwithdispose}

Defined in: [packages/lexical/src/extension-core/types.ts:336](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L336)

A handle to the editor with an attached dispose function

#### Extends

- [`LexicalEditor`](#lexicaleditor).`Disposable`

#### Properties

##### dispose() {#dispose}

> **dispose**: () => `void`

Defined in: [packages/lexical/src/extension-core/types.ts:341](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L341)

Dispose the editor and perform all clean-up
(also available as Symbol.dispose via Disposable)

###### Returns

`void`

#### Methods

##### \[dispose\]() {#dispose-1}

###### Call Signature

> **\[dispose\]**(): `void`

Defined in: [node\_modules/.pnpm/typescript@5.9.2/node\_modules/typescript/lib/lib.esnext.disposable.d.ts:36](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/typescript@5.9.2/node_modules/typescript/lib/lib.esnext.disposable.d.ts#L36)

###### Returns

`void`

###### Inherited from

`Disposable.[dispose]`

###### Call Signature

> **\[dispose\]**(): `void`

Defined in: [node\_modules/.pnpm/@types+node@20.19.17/node\_modules/@types/node/compatibility/disposable.d.ts:11](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@types+node@20.19.17/node_modules/@types/node/compatibility/disposable.d.ts#L11)

###### Returns

`void`

###### Inherited from

`Disposable.[dispose]`

##### blur() {#blur-2}

> **blur**(): `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:1440](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1440)

Removes focus from the editor.

###### Returns

`void`

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`blur`](#blur)

##### dispatchCommand() {#dispatchcommand-2}

> **dispatchCommand**\<`TCommand`\>(`type`, `payload`): `boolean`

Defined in: [packages/lexical/src/LexicalEditor.ts:1172](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1172)

Dispatches a command of the specified type with the specified payload.
This triggers all command listeners (set by [LexicalEditor.registerCommand](#registercommand))
for this type, passing them the provided payload. The command listeners
will be triggered in an implicit [LexicalEditor.update](#update), unless
this was invoked from inside an update in which case that update context
will be re-used (as if this was a dollar function itself).

###### Type Parameters

###### TCommand

`TCommand` *extends* [`LexicalCommand`](#lexicalcommand)\<`unknown`\>

###### Parameters

###### type

`TCommand`

the type of command listeners to trigger.

###### payload

[`CommandPayloadType`](#commandpayloadtype)\<`TCommand`\>

the data to pass as an argument to the command listeners.

###### Returns

`boolean`

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`dispatchCommand`](#dispatchcommand)

##### focus() {#focus-3}

> **focus**(`callbackFn?`, `options?`): `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:1399](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1399)

Focuses the editor by marking the existing selection as dirty, or by
creating a new selection at `defaultSelection` if one does not already
exist. If you want to force a specific selection, you should call
`root.selectStart()` or `root.selectEnd()` in an update.

###### Parameters

###### callbackFn?

() => `void`

A function to run after the editor is focused.

###### options?

`EditorFocusOptions` = `{}`

A bag of options

###### Returns

`void`

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`focus`](#focus-1)

##### getDecorators() {#getdecorators-2}

> **getDecorators**\<`T`\>(): `Record`\<[`NodeKey`](#nodekey), `T`\>

Defined in: [packages/lexical/src/LexicalEditor.ts:1183](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1183)

Gets a map of all decorators in the editor.

###### Type Parameters

###### T

`T`

###### Returns

`Record`\<[`NodeKey`](#nodekey), `T`\>

A mapping of call decorator keys to their decorated content

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`getDecorators`](#getdecorators)

##### getEditorState() {#geteditorstate-2}

> **getEditorState**(): [`EditorState`](#editorstate)

Defined in: [packages/lexical/src/LexicalEditor.ts:1292](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1292)

Gets the active editor state.

###### Returns

[`EditorState`](#editorstate)

The editor state

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`getEditorState`](#geteditorstate)

##### getElementByKey() {#getelementbykey-2}

> **getElementByKey**(`key`): `null` \| `HTMLElement`

Defined in: [packages/lexical/src/LexicalEditor.ts:1284](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1284)

Gets the underlying HTMLElement associated with the LexicalNode for the given key.

###### Parameters

###### key

`string`

the key of the LexicalNode.

###### Returns

`null` \| `HTMLElement`

the HTMLElement rendered by the LexicalNode associated with the key.

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`getElementByKey`](#getelementbykey)

##### getKey() {#getkey-8}

> **getKey**(): `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:1201](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1201)

Gets the key of the editor

###### Returns

`string`

The editor key

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`getKey`](#getkey-6)

##### getRootElement() {#getrootelement-2}

> **getRootElement**(): `null` \| `HTMLElement`

Defined in: [packages/lexical/src/LexicalEditor.ts:1193](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1193)

###### Returns

`null` \| `HTMLElement`

the current root element of the editor. If you want to register
an event listener, do it via [LexicalEditor.registerRootListener](#registerrootlistener), since
this reference may not be stable.

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`getRootElement`](#getrootelement)

##### hasNode() {#hasnode-2}

> **hasNode**\<`T`\>(`node`): `boolean`

Defined in: [packages/lexical/src/LexicalEditor.ts:1149](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1149)

Used to assert that a certain node is registered, usually by plugins to ensure nodes that they
depend on have been registered.

###### Type Parameters

###### T

`T` *extends* [`KlassConstructor`](#klassconstructor)\<*typeof* [`LexicalNode`](#lexicalnode)\>

###### Parameters

###### node

`T`

###### Returns

`boolean`

True if the editor has registered the provided node type, false otherwise.

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`hasNode`](#hasnode)

##### hasNodes() {#hasnodes-2}

> **hasNodes**\<`T`\>(`nodes`): `boolean`

Defined in: [packages/lexical/src/LexicalEditor.ts:1158](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1158)

Used to assert that certain nodes are registered, usually by plugins to ensure nodes that they
depend on have been registered.

###### Type Parameters

###### T

`T` *extends* [`KlassConstructor`](#klassconstructor)\<*typeof* [`LexicalNode`](#lexicalnode)\>

###### Parameters

###### nodes

`T`[]

###### Returns

`boolean`

True if the editor has registered all of the provided node types, false otherwise.

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`hasNodes`](#hasnodes)

##### isComposing() {#iscomposing-4}

> **isComposing**(): `boolean`

Defined in: [packages/lexical/src/LexicalEditor.ts:852](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L852)

###### Returns

`boolean`

true if the editor is currently in "composition" mode due to receiving input
through an IME, or 3P extension, for example. Returns false otherwise.

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`isComposing`](#iscomposing-2)

##### isEditable() {#iseditable-2}

> **isEditable**(): `boolean`

Defined in: [packages/lexical/src/LexicalEditor.ts:1457](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1457)

Returns true if the editor is editable, false otherwise.

###### Returns

`boolean`

True if the editor is editable, false otherwise.

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`isEditable`](#iseditable)

##### parseEditorState() {#parseeditorstate-2}

> **parseEditorState**(`maybeStringifiedEditorState`, `updateFn?`): [`EditorState`](#editorstate)

Defined in: [packages/lexical/src/LexicalEditor.ts:1356](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1356)

Parses a SerializedEditorState (usually produced by [EditorState.toJSON](#tojson)) and returns
and EditorState object that can be, for example, passed to [LexicalEditor.setEditorState](#seteditorstate). Typically,
deserialization from JSON stored in a database uses this method.

###### Parameters

###### maybeStringifiedEditorState

`string` | [`SerializedEditorState`](#serializededitorstate)\<[`SerializedLexicalNode`](#serializedlexicalnode)\>

###### updateFn?

() => `void`

###### Returns

[`EditorState`](#editorstate)

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`parseEditorState`](#parseeditorstate)

##### read() {#read-4}

> **read**\<`T`\>(`callbackFn`): `T`

Defined in: [packages/lexical/src/LexicalEditor.ts:1375](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1375)

Executes a read of the editor's state, with the
editor context available (useful for exporting and read-only DOM
operations). Much like update, but prevents any mutation of the
editor's state. Any pending updates will be flushed immediately before
the read.

###### Type Parameters

###### T

`T`

###### Parameters

###### callbackFn

() => `T`

A function that has access to read-only editor state.

###### Returns

`T`

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`read`](#read-2)

##### registerCommand() {#registercommand-2}

> **registerCommand**\<`P`\>(`command`, `listener`, `priority`): () => `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:950](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L950)

Registers a listener that will trigger anytime the provided command
is dispatched with LexicalEditor.dispatch, subject to priority.
Listeners that run at a higher priority can "intercept" commands and
prevent them from propagating to other handlers by returning true.

Listeners are always invoked in an [LexicalEditor.update](#update) and can
call dollar functions.

Listeners registered at the same priority level will run
deterministically in the order of registration.

###### Type Parameters

###### P

`P`

###### Parameters

###### command

[`LexicalCommand`](#lexicalcommand)\<`P`\>

the command that will trigger the callback.

###### listener

[`CommandListener`](#commandlistener)\<`P`\>

the function that will execute when the command is dispatched.

###### priority

[`CommandListenerPriority`](#commandlistenerpriority)

the relative priority of the listener. 0 | 1 | 2 | 3 | 4
  (or [COMMAND\_PRIORITY\_EDITOR](#command_priority_editor) |
    [COMMAND\_PRIORITY\_LOW](#command_priority_low) |
    [COMMAND\_PRIORITY\_NORMAL](#command_priority_normal) |
    [COMMAND\_PRIORITY\_HIGH](#command_priority_high) |
    [COMMAND\_PRIORITY\_CRITICAL](#command_priority_critical))

###### Returns

a teardown function that can be used to cleanup the listener.

> (): `void`

###### Returns

`void`

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`registerCommand`](#registercommand)

##### registerDecoratorListener() {#registerdecoratorlistener-2}

> **registerDecoratorListener**\<`T`\>(`listener`): () => `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:887](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L887)

Registers a listener for when the editor's decorator object changes. The decorator object contains
all DecoratorNode keys -> their decorated value. This is primarily used with external UI frameworks.

Will trigger the provided callback each time the editor transitions between these states until the
teardown function is called.

###### Type Parameters

###### T

`T`

###### Parameters

###### listener

`DecoratorListener`\<`T`\>

###### Returns

a teardown function that can be used to cleanup the listener.

> (): `void`

###### Returns

`void`

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`registerDecoratorListener`](#registerdecoratorlistener)

##### registerEditableListener() {#registereditablelistener-2}

> **registerEditableListener**(`listener`): () => `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:875](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L875)

Registers a listener for for when the editor changes between editable and non-editable states.
Will trigger the provided callback each time the editor transitions between these states until the
teardown function is called.

If the listener returns a function, that function will be called before the next transition or
teardown.

###### Parameters

###### listener

[`EditableListener`](#editablelistener)

###### Returns

a teardown function that can be used to cleanup the listener.

> (): `void`

###### Returns

`void`

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`registerEditableListener`](#registereditablelistener)

##### registerMutationListener() {#registermutationlistener-2}

> **registerMutationListener**(`klass`, `listener`, `options?`): () => `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:1014](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1014)

Registers a listener that will run when a Lexical node of the provided class is
mutated. The listener will receive a list of nodes along with the type of mutation
that was performed on each: created, destroyed, or updated.

One common use case for this is to attach DOM event listeners to the underlying DOM nodes as Lexical nodes are created.
[LexicalEditor.getElementByKey](#getelementbykey) can be used for this.

If any existing nodes are in the DOM, and skipInitialization is not true, the listener
will be called immediately with an updateTag of 'registerMutationListener' where all
nodes have the 'created' NodeMutation. This can be controlled with the skipInitialization option
(whose default was previously true for backwards compatibility with &lt;=0.16.1 but has been changed to false as of 0.21.0).

###### Parameters

###### klass

[`KlassConstructor`](#klassconstructor)\<*typeof* [`LexicalNode`](#lexicalnode)\>

The class of the node that you want to listen to mutations on.

###### listener

[`MutationListener`](#mutationlistener)

The logic you want to run when the node is mutated.

###### options?

`MutationListenerOptions`

see MutationListenerOptions

###### Returns

a teardown function that can be used to cleanup the listener.

> (): `void`

###### Returns

`void`

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`registerMutationListener`](#registermutationlistener)

##### registerNodeTransform() {#registernodetransform-2}

> **registerNodeTransform**\<`T`\>(`klass`, `listener`): () => `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:1117](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1117)

Registers a listener that will run when a Lexical node of the provided class is
marked dirty during an update. The listener will continue to run as long as the node
is marked dirty. There are no guarantees around the order of transform execution!

Watch out for infinite loops. See [Node Transforms](https://lexical.dev/docs/concepts/transforms)

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Parameters

###### klass

[`Klass`](#klass)\<`T`\>

The class of the node that you want to run transforms on.

###### listener

[`Transform`](#transform-7)\<`T`\>

The logic you want to run when the node is updated.

###### Returns

a teardown function that can be used to cleanup the listener.

> (): `void`

###### Returns

`void`

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`registerNodeTransform`](#registernodetransform)

##### registerRootListener() {#registerrootlistener-2}

> **registerRootListener**(`listener`): () => `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:917](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L917)

Registers a listener for when the editor's root DOM element (the content editable
Lexical attaches to) changes. This is primarily used to attach event listeners to the root
 element. The root listener function is executed directly upon registration and then on
any subsequent update.

Will trigger the provided callback each time the editor transitions between these states until the
teardown function is called.

If the listener returns a function, that function will be called before the next transition or
teardown.

###### Parameters

###### listener

[`RootListener`](#rootlistener)

###### Returns

a teardown function that can be used to cleanup the listener.

> (): `void`

###### Returns

`void`

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`registerRootListener`](#registerrootlistener)

##### registerTextContentListener() {#registertextcontentlistener-2}

> **registerTextContentListener**(`listener`): () => `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:900](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L900)

Registers a listener for when Lexical commits an update to the DOM and the text content of
the editor changes from the previous state of the editor. If the text content is the
same between updates, no notifications to the listeners will happen.

Will trigger the provided callback each time the editor transitions between these states until the
teardown function is called.

###### Parameters

###### listener

`TextContentListener`

###### Returns

a teardown function that can be used to cleanup the listener.

> (): `void`

###### Returns

`void`

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`registerTextContentListener`](#registertextcontentlistener)

##### registerUpdateListener() {#registerupdatelistener-2}

> **registerUpdateListener**(`listener`): () => `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:862](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L862)

Registers a listener for Editor update event. Will trigger the provided callback
each time the editor goes through an update (via [LexicalEditor.update](#update)) until the
teardown function is called.

###### Parameters

###### listener

[`UpdateListener`](#updatelistener)

###### Returns

a teardown function that can be used to cleanup the listener.

> (): `void`

###### Returns

`void`

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`registerUpdateListener`](#registerupdatelistener)

##### setEditable() {#seteditable-2}

> **setEditable**(`editable`): `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:1465](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1465)

Sets the editable property of the editor. When false, the
editor will not listen for user events on the underling contenteditable.

###### Parameters

###### editable

`boolean`

the value to set the editable mode to.

###### Returns

`void`

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`setEditable`](#seteditable)

##### setEditorState() {#seteditorstate-2}

> **setEditorState**(`editorState`, `options?`): `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:1301](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1301)

Imperatively set the EditorState. Triggers reconciliation like an update.

###### Parameters

###### editorState

[`EditorState`](#editorstate)

the state to set the editor

###### options?

[`EditorSetOptions`](#editorsetoptions)

options for the update.

###### Returns

`void`

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`setEditorState`](#seteditorstate)

##### setRootElement() {#setrootelement-2}

> **setRootElement**(`nextRootElement`): `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:1209](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1209)

Imperatively set the root contenteditable element that Lexical listens
for events on.

###### Parameters

###### nextRootElement

`null` | `HTMLElement`

###### Returns

`void`

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`setRootElement`](#setrootelement)

##### toJSON() {#tojson-4}

> **toJSON**(): [`SerializedEditor`](#serializededitor)

Defined in: [packages/lexical/src/LexicalEditor.ts:1480](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1480)

Returns a JSON-serializable javascript object NOT a JSON string.
You still must call JSON.stringify (or something else) to turn the
state into a string you can transfer over the wire and store in a database.

See [LexicalNode.exportJSON](#exportjson-8)

###### Returns

[`SerializedEditor`](#serializededitor)

A JSON-serializable javascript object

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`toJSON`](#tojson-2)

##### update() {#update-2}

> **update**(`updateFn`, `options?`): `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:1386](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L1386)

Executes an update to the editor state. The updateFn callback is the ONLY place
where Lexical editor state can be safely mutated.

###### Parameters

###### updateFn

() => `void`

A function that has access to writable editor state.

###### options?

[`EditorUpdateOptions`](#editorupdateoptions)

A bag of options to control the behavior of the update.

###### Returns

`void`

###### Inherited from

[`LexicalEditor`](#lexicaleditor).[`update`](#update)

***

### LexicalExtension {#lexicalextension}

Defined in: [packages/lexical/src/extension-core/types.ts:164](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L164)

An Extension is a composable unit of LexicalEditor configuration
(nodes, theme, etc) used to create an editor, plus runtime behavior
that is registered after the editor is created.

An Extension may depend on other Extensions, and provide functionality to other
extensions through its config.

#### Extends

- [`InitialEditorConfig`](#initialeditorconfig)

#### Type Parameters

##### Config

`Config` *extends* [`ExtensionConfigBase`](#extensionconfigbase)

##### Name

`Name` *extends* `string`

##### Output

`Output`

##### Init

`Init`

#### Properties

##### $initialEditorState? {#initialeditorstate-1}

> `optional` **$initialEditorState**: [`InitialEditorStateType`](#initialeditorstatetype)

Defined in: [packages/lexical/src/extension-core/types.ts:409](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L409)

The initial EditorState as a JSON string, an EditorState, or a function
to update the editor (once).

###### Inherited from

[`InitialEditorConfig`](#initialeditorconfig).[`$initialEditorState`](#initialeditorstate)

##### afterRegistration()? {#afterregistration}

> `optional` **afterRegistration**: (`editor`, `config`, `state`) => () => `void`

Defined in: [packages/lexical/src/extension-core/types.ts:282](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L282)

Run any code that must happen after initialization of the
editor state (which happens after all register calls).

###### Parameters

###### editor

[`LexicalEditor`](#lexicaleditor)

The editor this Extension is being registered with

###### config

`Config`

The merged configuration specific to this Extension

###### state

[`ExtensionRegisterState`](#extensionregisterstate)\<`Init`, `Output`\>

An object containing an AbortSignal that can be
  used, and methods for accessing the merged configuration of
  dependencies and peerDependencies

###### Returns

A clean-up function

> (): `void`

###### Returns

`void`

##### build()? {#build}

> `optional` **build**: (`editor`, `config`, `state`) => `Output`

Defined in: [packages/lexical/src/extension-core/types.ts:247](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L247)

Perform any tasks that require a LexicalEditor instance, but before
registration has taken place. May provide output to be used by
dependencies or the application (commands, components, etc.).
This will only be run once, and any work performed by the output
function must not require cleanup.

###### Parameters

###### editor

[`LexicalEditor`](#lexicaleditor)

###### config

`Config`

###### state

[`ExtensionBuildState`](#extensionbuildstate)\<`Init`\>

###### Returns

`Output`

##### config? {#config-13}

> `optional` **config**: `Config`

Defined in: [packages/lexical/src/extension-core/types.ts:197](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L197)

The default configuration specific to this Extension. This Config may be
seen by this Extension, or any Extension that uses it as a dependency.

The config may be mutated on register, this is particularly useful
for vending functionality to other Extensions that depend on this Extension.

##### conflictsWith? {#conflictswith}

> `optional` **conflictsWith**: `string`[]

Defined in: [packages/lexical/src/extension-core/types.ts:181](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L181)

Extension names that must not be loaded with this Extension.
If this extension and any of the conflicting extensions are configured
in the same editor then a runtime error will be thrown instead of
creating the editor. This is used to prevent extensions with incompatible
and overlapping functionality from being registered concurrently, such as
PlainTextExtension and RichTextExtension.

##### dependencies? {#dependencies}

> `optional` **dependencies**: [`AnyLexicalExtensionArgument`](#anylexicalextensionargument)[]

Defined in: [packages/lexical/src/extension-core/types.ts:183](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L183)

Other Extensions that this Extension depends on, can also be used to configure them

##### editable? {#editable-1}

> `optional` **editable**: `boolean`

Defined in: [packages/lexical/src/extension-core/types.ts:395](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L395)

Whether the initial state of the editor is editable or not

###### Inherited from

[`InitialEditorConfig`](#initialeditorconfig).[`editable`](#editable)

##### html? {#html-1}

> `optional` **html**: [`HTMLConfig`](#htmlconfig)

Defined in: [packages/lexical/src/extension-core/types.ts:391](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L391)

Overrides for HTML serialization (exportDOM) and
deserialization (importDOM) that does not require subclassing and node
replacement

###### Inherited from

[`InitialEditorConfig`](#initialeditorconfig).[`html`](#html)

##### init()? {#init-3}

> `optional` **init**: (`editorConfig`, `config`, `state`) => `Init`

Defined in: [packages/lexical/src/extension-core/types.ts:235](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L235)

Perform any necessary initialization before the editor is created,
this runs after all configuration overrides for both the editor this
this extension have been merged. May be used validate the editor
configuration.

###### Parameters

###### editorConfig

[`InitialEditorConfig`](#initialeditorconfig)

The in-progress editor configuration (mutable)

###### config

`Config`

The merged configuration specific to this extension (mutable)

###### state

[`ExtensionInitState`](#extensioninitstate)

An object containing methods for accessing the merged
  configuration of dependencies and peerDependencies

###### Returns

`Init`

##### mergeConfig()? {#mergeconfig}

> `optional` **mergeConfig**: (`config`, `overrides`) => `Config`

Defined in: [packages/lexical/src/extension-core/types.ts:223](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L223)

By default, Config is shallow merged `{...a, ...b}` with
[shallowMergeConfig](#shallowmergeconfig), if your Extension requires other strategies
(such as concatenating an Array) you can implement it here.

###### Parameters

###### config

`Config`

The current configuration

###### overrides

`Partial`\<`Config`\>

The partial configuration to merge

###### Returns

`Config`

The merged configuration

###### Example

Merging an array
```js
const extension = defineExtension({
  // ...
  mergeConfig(config, overrides) {
    const merged = shallowMergeConfig(config, overrides);
    if (Array.isArray(overrides.decorators)) {
      merged.decorators = [...config.decorators, ...overrides.decorators];
    }
    return merged;
  }
});
```

##### name {#name-1}

> `readonly` **name**: `Name`

Defined in: [packages/lexical/src/extension-core/types.ts:172](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L172)

The name of the Extension, must be unique

##### namespace? {#namespace-1}

> `optional` **namespace**: `string`

Defined in: [packages/lexical/src/extension-core/types.ts:371](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L371)

The namespace of this Editor. If two editors share the same
namespace, JSON will be the clipboard interchange format.
Otherwise HTML will be used.

###### Inherited from

[`InitialEditorConfig`](#initialeditorconfig).[`namespace`](#namespace)

##### nodes? {#nodes-1}

> `optional` **nodes**: readonly [`LexicalNodeConfig`](#lexicalnodeconfig-4)[] \| () => `undefined` \| readonly [`LexicalNodeConfig`](#lexicalnodeconfig-4)[]

Defined in: [packages/lexical/src/extension-core/types.ts:381](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L381)

The nodes that this Extension adds to the Editor configuration, will be
merged with other Extensions.

Can be a function to defer the access of the nodes to editor construction
which may be useful in cases when the node and extension are defined in
different modules and have depenendencies on each other, depending on the
bundler configuration.

###### Inherited from

[`InitialEditorConfig`](#initialeditorconfig).[`nodes`](#nodes)

##### onError()? {#onerror-1}

> `optional` **onError**: (`error`, `editor`) => `void`

Defined in: [packages/lexical/src/extension-core/types.ts:404](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L404)

The editor will catch errors that happen during updates and
reconciliation and call this. It defaults to
`(error) => { throw error }`.

###### Parameters

###### error

`Error`

The Error object

###### editor

[`LexicalEditor`](#lexicaleditor)

The editor that this error came from

###### Returns

`void`

###### Inherited from

[`InitialEditorConfig`](#initialeditorconfig).[`onError`](#onerror)

##### parentEditor? {#parenteditor-1}

> `optional` **parentEditor**: [`LexicalEditor`](#lexicaleditor)

Defined in: [packages/lexical/src/extension-core/types.ts:365](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L365)

Used when this editor is nested inside of another editor

###### Inherited from

[`InitialEditorConfig`](#initialeditorconfig).[`parentEditor`](#parenteditor)

##### peerDependencies? {#peerdependencies}

> `optional` **peerDependencies**: [`NormalizedPeerDependency`](#normalizedpeerdependency)\<[`AnyLexicalExtension`](#anylexicalextension)\>[]

Defined in: [packages/lexical/src/extension-core/types.ts:188](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L188)

Other Extensions, by name, that this Extension can optionally depend on or
configure, if they are directly depended on by another Extension

##### register()? {#register}

> `optional` **register**: (`editor`, `config`, `state`) => () => `void`

Defined in: [packages/lexical/src/extension-core/types.ts:265](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L265)

Add behavior to the editor (register transforms, listeners, etc.) after
the Editor is created, but before its initial state is set.
The register function may also mutate the config
in-place to expose data to other extensions that use it as a dependency.

###### Parameters

###### editor

[`LexicalEditor`](#lexicaleditor)

The editor this Extension is being registered with

###### config

`Config`

The merged configuration specific to this Extension

###### state

[`ExtensionRegisterState`](#extensionregisterstate)\<`Init`, `Output`\>

An object containing an AbortSignal that can be
  used, and methods for accessing the merged configuration of
  dependencies and peerDependencies

###### Returns

A clean-up function

> (): `void`

###### Returns

`void`

##### theme? {#theme-1}

> `optional` **theme**: [`EditorThemeClasses`](#editorthemeclasses)

Defined in: [packages/lexical/src/extension-core/types.ts:385](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L385)

EditorThemeClasses that will be deep merged with other Extensions

###### Inherited from

[`InitialEditorConfig`](#initialeditorconfig).[`theme`](#theme)

***

### LexicalExtensionDependency {#lexicalextensiondependency}

Defined in: [packages/lexical/src/extension-core/types.ts:148](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L148)

#### Type Parameters

##### Dependency

`Dependency` *extends* [`AnyLexicalExtension`](#anylexicalextension)

#### Properties

##### config {#config-14}

> **config**: [`LexicalExtensionConfig`](#lexicalextensionconfig-2)\<`Dependency`\>

Defined in: [packages/lexical/src/extension-core/types.ts:152](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L152)

##### init {#init-4}

> **init**: [`LexicalExtensionInit`](#lexicalextensioninit-2)\<`Dependency`\>

Defined in: [packages/lexical/src/extension-core/types.ts:151](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L151)

##### output {#output-2}

> **output**: [`LexicalExtensionOutput`](#lexicalextensionoutput-1)\<`Dependency`\>

Defined in: [packages/lexical/src/extension-core/types.ts:153](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L153)

***

### LexicalNode {#lexicalnode}

Defined in: [packages/lexical/src/LexicalNode.ts:408](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L408)

#### Extended by

- [`DecoratorNode`](#decoratornode)
- [`ElementNode`](#elementnode)
- [`LineBreakNode`](#linebreaknode)
- [`TextNode`](#textnode)

#### Methods

##### $config() {#config-15}

> **$config**(): [`BaseStaticNodeConfig`](#basestaticnodeconfig)

Defined in: [packages/lexical/src/LexicalNode.ts:475](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L475)

Override this to implement the new static node configuration protocol,
this method is called directly on the prototype and must not depend
on anything initialized in the constructor. Generally it should be
a trivial implementation.

###### Returns

[`BaseStaticNodeConfig`](#basestaticnodeconfig)

###### Example

```ts
class MyNode extends TextNode {
  $config() {
    return this.config('my-node', {extends: TextNode});
  }
}
```

##### afterCloneFrom() {#afterclonefrom-6}

> **afterCloneFrom**(`prevNode`): `void`

Defined in: [packages/lexical/src/LexicalNode.ts:544](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L544)

Perform any state updates on the clone of prevNode that are not already
handled by the constructor call in the static clone method. If you have
state to update in your clone that is not handled directly by the
constructor, it is advisable to override this method but it is required
to include a call to `super.afterCloneFrom(prevNode)` in your
implementation. This is only intended to be called by
[$cloneWithProperties](#clonewithproperties) function or via a super call.

###### Parameters

###### prevNode

`this`

###### Returns

`void`

###### Example

```ts
class ClassesTextNode extends TextNode {
  // Not shown: static getType, static importJSON, exportJSON, createDOM, updateDOM
  __classes = new Set<string>();
  static clone(node: ClassesTextNode): ClassesTextNode {
    // The inherited TextNode constructor is used here, so
    // classes is not set by this method.
    return new ClassesTextNode(node.__text, node.__key);
  }
  afterCloneFrom(node: this): void {
    // This calls TextNode.afterCloneFrom and LexicalNode.afterCloneFrom
    // for necessary state updates
    super.afterCloneFrom(node);
    this.__addClasses(node.__classes);
  }
  // This method is a private implementation detail, it is not
  // suitable for the public API because it does not call getWritable
  __addClasses(classNames: Iterable<string>): this {
    for (const className of classNames) {
      this.__classes.add(className);
    }
    return this;
  }
  addClass(...classNames: string[]): this {
    return this.getWritable().__addClasses(classNames);
  }
  removeClass(...classNames: string[]): this {
    const node = this.getWritable();
    for (const className of classNames) {
      this.__classes.delete(className);
    }
    return this;
  }
  getClasses(): Set<string> {
    return this.getLatest().__classes;
  }
}
```

##### config() {#config-17}

> **config**\<`Type`, `Config`\>(`type`, `config`): `StaticNodeConfigRecord`\<`Type`, `Config`\>

Defined in: [packages/lexical/src/LexicalNode.ts:484](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L484)

This is a convenience method for $config that
aids in type inference. See [LexicalNode.$config](#config-15)
for example usage.

###### Type Parameters

###### Type

`Type` *extends* `string`

###### Config

`Config` *extends* [`StaticNodeConfigValue`](#staticnodeconfigvalue)\<[`LexicalNode`](#lexicalnode), `Type`\>

###### Parameters

###### type

`Type`

###### config

`Config`

###### Returns

`StaticNodeConfigRecord`\<`Type`, `Config`\>

##### createDOM() {#createdom-12}

> **createDOM**(`_config`, `_editor`): `HTMLElement`

Defined in: [packages/lexical/src/LexicalNode.ts:1094](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1094)

Called during the reconciliation process to determine which nodes
to insert into the DOM for this Lexical Node.

This method must return exactly one HTMLElement. Nested elements are not supported.

Do not attempt to update the Lexical EditorState during this phase of the update lifecycle.

###### Parameters

###### \_config

[`EditorConfig`](#editorconfig)

allows access to things like the EditorTheme (to apply classes) during reconciliation.

###### \_editor

[`LexicalEditor`](#lexicaleditor)

allows access to the editor for context during reconciliation.

###### Returns

`HTMLElement`

##### createParentElementNode() {#createparentelementnode-6}

> **createParentElementNode**(): [`ElementNode`](#elementnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1414](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1414)

The creation logic for any required parent. Should be implemented if [isParentRequired](#isparentrequired-6) returns true.

###### Returns

[`ElementNode`](#elementnode)

##### exportDOM() {#exportdom-8}

> **exportDOM**(`editor`): [`DOMExportOutput`](#domexportoutput)

Defined in: [packages/lexical/src/LexicalNode.ts:1124](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1124)

Controls how the this node is serialized to HTML. This is important for
copy and paste between Lexical and non-Lexical editors, or Lexical editors with different namespaces,
in which case the primary transfer format is HTML. It's also important if you're serializing
to HTML for any other reason via [@lexical/html!$generateHtmlFromNodes](lexical_html.md#generatehtmlfromnodes). You could
also use this method to build your own HTML renderer.

###### Parameters

###### editor

[`LexicalEditor`](#lexicaleditor)

###### Returns

[`DOMExportOutput`](#domexportoutput)

##### exportJSON() {#exportjson-8}

> **exportJSON**(): [`SerializedLexicalNode`](#serializedlexicalnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1136](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1136)

Controls how the this node is serialized to JSON. This is important for
copy and paste between Lexical editors sharing the same namespace. It's also important
if you're serializing to JSON for persistent storage somewhere.
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Returns

[`SerializedLexicalNode`](#serializedlexicalnode)

##### ~~getCommonAncestor()~~ {#getcommonancestor-6}

> **getCommonAncestor**\<`T`\>(`node`): `null` \| `T`

Defined in: [packages/lexical/src/LexicalNode.ts:861](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L861)

###### Type Parameters

###### T

`T` *extends* [`ElementNode`](#elementnode) = [`ElementNode`](#elementnode)

###### Parameters

###### node

[`LexicalNode`](#lexicalnode)

the other node to find the common ancestor of.

###### Returns

`null` \| `T`

###### Deprecated

use [$getCommonAncestor](#getcommonancestor-8)

Returns the closest common ancestor of this node and the provided one or null
if one cannot be found.

##### getIndexWithinParent() {#getindexwithinparent-6}

> **getIndexWithinParent**(): `number`

Defined in: [packages/lexical/src/LexicalNode.ts:687](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L687)

Returns the zero-based index of this node within the parent.

###### Returns

`number`

##### getKey() {#getkey-10}

> **getKey**(): `string`

Defined in: [packages/lexical/src/LexicalNode.ts:679](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L679)

Returns this nodes key.

###### Returns

`string`

##### getLatest() {#getlatest-7}

> **getLatest**(): `this`

Defined in: [packages/lexical/src/LexicalNode.ts:1012](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1012)

Returns the latest version of the node from the active EditorState.
This is used to avoid getting values from stale node references.

###### Returns

`this`

##### getNextSibling() {#getnextsibling-6}

> **getNextSibling**\<`T`\>(): `null` \| `T`

Defined in: [packages/lexical/src/LexicalNode.ts:832](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L832)

Returns the "next" siblings - that is, the node that comes
after this one in the same parent

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Returns

`null` \| `T`

##### getNextSiblings() {#getnextsiblings-6}

> **getNextSiblings**\<`T`\>(): `T`[]

Defined in: [packages/lexical/src/LexicalNode.ts:843](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L843)

Returns all "next" siblings - that is, the nodes that come between this
one and the last child of it's parent, inclusive.

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Returns

`T`[]

##### getNodesBetween() {#getnodesbetween-6}

> **getNodesBetween**(`targetNode`): [`LexicalNode`](#lexicalnode)[]

Defined in: [packages/lexical/src/LexicalNode.ts:931](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L931)

Returns a list of nodes that are between this node and
the target node in the EditorState.

###### Parameters

###### targetNode

[`LexicalNode`](#lexicalnode)

the node that marks the other end of the range of nodes to be returned.

###### Returns

[`LexicalNode`](#lexicalnode)[]

##### getParent() {#getparent-6}

> **getParent**\<`T`\>(): `null` \| `T`

Defined in: [packages/lexical/src/LexicalNode.ts:707](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L707)

Returns the parent of this node, or null if none is found.

###### Type Parameters

###### T

`T` *extends* [`ElementNode`](#elementnode)

###### Returns

`null` \| `T`

##### getParentKeys() {#getparentkeys-6}

> **getParentKeys**(): `string`[]

Defined in: [packages/lexical/src/LexicalNode.ts:784](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L784)

Returns a list of the keys of every ancestor of this node,
all the way up to the RootNode.

###### Returns

`string`[]

##### getParentOrThrow() {#getparentorthrow-6}

> **getParentOrThrow**\<`T`\>(): `T`

Defined in: [packages/lexical/src/LexicalNode.ts:718](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L718)

Returns the parent of this node, or throws if none is found.

###### Type Parameters

###### T

`T` *extends* [`ElementNode`](#elementnode)

###### Returns

`T`

##### getParents() {#getparents-6}

> **getParents**(): [`ElementNode`](#elementnode)[]

Defined in: [packages/lexical/src/LexicalNode.ts:769](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L769)

Returns a list of the every ancestor of this node,
all the way up to the RootNode.

###### Returns

[`ElementNode`](#elementnode)[]

##### getPreviousSibling() {#getprevioussibling-6}

> **getPreviousSibling**\<`T`\>(): `null` \| `T`

Defined in: [packages/lexical/src/LexicalNode.ts:799](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L799)

Returns the "previous" siblings - that is, the node that comes
before this one in the same parent.

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Returns

`null` \| `T`

##### getPreviousSiblings() {#getprevioussiblings-6}

> **getPreviousSiblings**\<`T`\>(): `T`[]

Defined in: [packages/lexical/src/LexicalNode.ts:810](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L810)

Returns the "previous" siblings - that is, the nodes that come between
this one and the first child of it's parent, inclusive.

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### Returns

`T`[]

##### getTextContent() {#gettextcontent-12}

> **getTextContent**(): `string`

Defined in: [packages/lexical/src/LexicalNode.ts:1068](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1068)

Returns the text content of the node. Override this for
custom nodes that should have a representation in plain text
format (for copy + paste, for example)

###### Returns

`string`

##### getTextContentSize() {#gettextcontentsize-6}

> **getTextContentSize**(): `number`

Defined in: [packages/lexical/src/LexicalNode.ts:1076](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1076)

Returns the length of the string produced by calling getTextContent on this node.

###### Returns

`number`

##### getTopLevelElement() {#gettoplevelelement-6}

> **getTopLevelElement**(): `null` \| [`ElementNode`](#elementnode) \| [`DecoratorNode`](#decoratornode)\<`unknown`\>

Defined in: [packages/lexical/src/LexicalNode.ts:731](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L731)

Returns the highest (in the EditorState tree)
non-root ancestor of this node, or null if none is found. See [lexical!$isRootOrShadowRoot](#isrootorshadowroot)
for more information on which Elements comprise "roots".

###### Returns

`null` \| [`ElementNode`](#elementnode) \| [`DecoratorNode`](#decoratornode)\<`unknown`\>

##### getTopLevelElementOrThrow() {#gettoplevelelementorthrow-8}

> **getTopLevelElementOrThrow**(): [`ElementNode`](#elementnode) \| [`DecoratorNode`](#decoratornode)\<`unknown`\>

Defined in: [packages/lexical/src/LexicalNode.ts:752](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L752)

Returns the highest (in the EditorState tree)
non-root ancestor of this node, or throws if none is found. See [lexical!$isRootOrShadowRoot](#isrootorshadowroot)
for more information on which Elements comprise "roots".

###### Returns

[`ElementNode`](#elementnode) \| [`DecoratorNode`](#decoratornode)\<`unknown`\>

##### getType() {#gettype-20}

> **getType**(): `string`

Defined in: [packages/lexical/src/LexicalNode.ts:593](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L593)

Returns the string type of this node.

###### Returns

`string`

##### getWritable() {#getwritable-6}

> **getWritable**(): `this`

Defined in: [packages/lexical/src/LexicalNode.ts:1032](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1032)

Returns a mutable version of the node using [$cloneWithProperties](#clonewithproperties)
if necessary. Will throw an error if called outside of a Lexical Editor
[LexicalEditor.update](#update) callback.

###### Returns

`this`

##### insertAfter() {#insertafter-8}

> **insertAfter**(`nodeToInsert`, `restoreSelection`): [`LexicalNode`](#lexicalnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1299](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1299)

Inserts a node after this LexicalNode (as the next sibling).

###### Parameters

###### nodeToInsert

[`LexicalNode`](#lexicalnode)

The node to insert after this one.

###### restoreSelection

`boolean` = `true`

Whether or not to attempt to resolve the
selection to the appropriate place after the operation is complete.

###### Returns

[`LexicalNode`](#lexicalnode)

##### insertBefore() {#insertbefore-8}

> **insertBefore**(`nodeToInsert`, `restoreSelection`): [`LexicalNode`](#lexicalnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1366](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1366)

Inserts a node before this LexicalNode (as the previous sibling).

###### Parameters

###### nodeToInsert

[`LexicalNode`](#lexicalnode)

The node to insert before this one.

###### restoreSelection

`boolean` = `true`

Whether or not to attempt to resolve the
selection to the appropriate place after the operation is complete.

###### Returns

[`LexicalNode`](#lexicalnode)

##### is() {#is-8}

> **is**(`object`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:878](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L878)

Returns true if the provided node is the exact same one as this node, from Lexical's perspective.
Always use this instead of referential equality.

###### Parameters

###### object

the node to perform the equality comparison on.

`undefined` | `null` | [`LexicalNode`](#lexicalnode)

###### Returns

`boolean`

##### isAttached() {#isattached-6}

> **isAttached**(): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:610](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L610)

Returns true if there is a path between this node and the RootNode, false otherwise.
This is a way of determining if the node is "attached" EditorState. Unattached nodes
won't be reconciled and will ultimately be cleaned up by the Lexical GC.

###### Returns

`boolean`

##### isBefore() {#isbefore-6}

> **isBefore**(`targetNode`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:896](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L896)

Returns true if this node logically precedes the target node in the
editor state, false otherwise (including if there is no common ancestor).

Note that this notion of isBefore is based on post-order; a descendant
node is always before its ancestors. See also
[$getCommonAncestor](#getcommonancestor-8) and [$comparePointCaretNext](#comparepointcaretnext) for
more flexible ways to determine the relative positions of nodes.

###### Parameters

###### targetNode

[`LexicalNode`](#lexicalnode)

the node we're testing to see if it's after this one.

###### Returns

`boolean`

##### isDirty() {#isdirty-6}

> **isDirty**(): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:1001](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1001)

Returns true if this node has been marked dirty during this update cycle.

###### Returns

`boolean`

##### isInline() {#isinline-8}

> **isInline**(): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:597](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L597)

###### Returns

`boolean`

##### isParentOf() {#isparentof-6}

> **isParentOf**(`targetNode`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:919](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L919)

Returns true if this node is an ancestor of and distinct from the target node, false otherwise.

###### Parameters

###### targetNode

[`LexicalNode`](#lexicalnode)

the would-be child node.

###### Returns

`boolean`

##### isParentRequired() {#isparentrequired-6}

> **isParentRequired**(): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:1406](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1406)

Whether or not this node has a required parent. Used during copy + paste operations
to normalize nodes that would otherwise be orphaned. For example, ListItemNodes without
a ListNode parent or TextNodes with a ParagraphNode parent.

###### Returns

`boolean`

##### isSelected() {#isselected-6}

> **isSelected**(`selection?`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:634](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L634)

Returns true if this node is contained within the provided Selection., false otherwise.
Relies on the algorithms implemented in [BaseSelection.getNodes](#getnodes) to determine
what's included.

###### Parameters

###### selection?

The selection that we want to determine if the node is in.

`null` | [`BaseSelection`](#baseselection)

###### Returns

`boolean`

##### markDirty() {#markdirty-6}

> **markDirty**(): `void`

Defined in: [packages/lexical/src/LexicalNode.ts:1475](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1475)

Marks a node dirty, triggering transforms and
forcing it to be reconciled during the update cycle.

###### Returns

`void`

##### remove() {#remove-10}

> **remove**(`preserveEmptyParent?`): `void`

Defined in: [packages/lexical/src/LexicalNode.ts:1218](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1218)

Removes this LexicalNode from the EditorState. If the node isn't re-inserted
somewhere, the Lexical garbage collector will eventually clean it up.

###### Parameters

###### preserveEmptyParent?

`boolean`

If falsy, the node's parent will be removed if
it's empty after the removal operation. This is the default behavior, subject to
other node heuristics such as [ElementNode#canBeEmpty](#canbeempty)

###### Returns

`void`

##### replace() {#replace-8}

> **replace**\<`N`\>(`replaceWith`, `includeChildren?`): `N`

Defined in: [packages/lexical/src/LexicalNode.ts:1229](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1229)

Replaces this LexicalNode with the provided node, optionally transferring the children
of the replaced node to the replacing node.

###### Type Parameters

###### N

`N` *extends* [`LexicalNode`](#lexicalnode)

###### Parameters

###### replaceWith

`N`

The node to replace this one with.

###### includeChildren?

`boolean`

Whether or not to transfer the children of this node to the replacing node.

###### Returns

`N`

##### resetOnCopyNodeFrom() {#resetoncopynodefrom-6}

> **resetOnCopyNodeFrom**(`originalNode`): `void`

Defined in: [packages/lexical/src/LexicalNode.ts:560](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L560)

Reset state in this copy of originalNode, if necessary

###### Parameters

###### originalNode

`this`

###### Returns

`void`

##### selectEnd() {#selectend-6}

> **selectEnd**(): [`RangeSelection`](#rangeselection)

Defined in: [packages/lexical/src/LexicalNode.ts:1422](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1422)

###### Returns

[`RangeSelection`](#rangeselection)

##### selectNext() {#selectnext-6}

> **selectNext**(`anchorOffset?`, `focusOffset?`): [`RangeSelection`](#rangeselection)

Defined in: [packages/lexical/src/LexicalNode.ts:1454](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1454)

Moves selection to the next sibling of this node, at the specified offsets.

###### Parameters

###### anchorOffset?

`number`

The anchor offset for selection.

###### focusOffset?

`number`

The focus offset for selection

###### Returns

[`RangeSelection`](#rangeselection)

##### selectPrevious() {#selectprevious-6}

> **selectPrevious**(`anchorOffset?`, `focusOffset?`): [`RangeSelection`](#rangeselection)

Defined in: [packages/lexical/src/LexicalNode.ts:1432](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1432)

Moves selection to the previous sibling of this node, at the specified offsets.

###### Parameters

###### anchorOffset?

`number`

The anchor offset for selection.

###### focusOffset?

`number`

The focus offset for selection

###### Returns

[`RangeSelection`](#rangeselection)

##### selectStart() {#selectstart-6}

> **selectStart**(): [`RangeSelection`](#rangeselection)

Defined in: [packages/lexical/src/LexicalNode.ts:1418](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1418)

###### Returns

[`RangeSelection`](#rangeselection)

##### updateDOM() {#updatedom-12}

> **updateDOM**(`_prevNode`, `_dom`, `_config`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:1108](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1108)

Called when a node changes and should update the DOM
in whatever way is necessary to make it align with any changes that might
have happened during the update.

Returning "true" here will cause lexical to unmount and recreate the DOM node
(by calling createDOM). You would need to do this if the element tag changes,
for instance.

###### Parameters

###### \_prevNode

`unknown`

###### \_dom

`HTMLElement`

###### \_config

[`EditorConfig`](#editorconfig)

###### Returns

`boolean`

##### updateFromJSON() {#updatefromjson-6}

> **updateFromJSON**(`serializedNode`): `this`

Defined in: [packages/lexical/src/LexicalNode.ts:1189](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1189)

Update this LexicalNode instance from serialized JSON. It's recommended
to implement as much logic as possible in this method instead of the
static importJSON method, so that the functionality can be inherited in subclasses.

The LexicalUpdateJSON utility type should be used to ignore any type, version,
or children properties in the JSON so that the extended JSON from subclasses
are acceptable parameters for the super call.

If overridden, this method must call super.

###### Parameters

###### serializedNode

[`LexicalUpdateJSON`](#lexicalupdatejson)\<[`SerializedLexicalNode`](#serializedlexicalnode)\>

###### Returns

`this`

###### Example

```ts
class MyTextNode extends TextNode {
  // ...
  static importJSON(serializedNode: SerializedMyTextNode): MyTextNode {
    return $createMyTextNode()
      .updateFromJSON(serializedNode);
  }
  updateFromJSON(
    serializedNode: LexicalUpdateJSON<SerializedMyTextNode>,
  ): this {
    return super.updateFromJSON(serializedNode)
      .setMyProperty(serializedNode.myProperty);
  }
}
```

***

### NodeSelection {#nodeselection}

Defined in: [packages/lexical/src/LexicalSelection.ts:321](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L321)

#### Implements

- [`BaseSelection`](#baseselection)

#### Properties

##### \_cachedNodes {#_cachednodes-1}

> **\_cachedNodes**: `null` \| [`LexicalNode`](#lexicalnode)[]

Defined in: [packages/lexical/src/LexicalSelection.ts:323](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L323)

###### Implementation of

`BaseSelection._cachedNodes`

##### \_nodes {#_nodes}

> **\_nodes**: `Set`\<`string`\>

Defined in: [packages/lexical/src/LexicalSelection.ts:322](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L322)

##### dirty {#dirty-1}

> **dirty**: `boolean`

Defined in: [packages/lexical/src/LexicalSelection.ts:324](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L324)

###### Implementation of

`BaseSelection.dirty`

#### Methods

##### add() {#add}

> **add**(`key`): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:361](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L361)

###### Parameters

###### key

`string`

###### Returns

`void`

##### clear() {#clear-2}

> **clear**(): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:373](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L373)

###### Returns

`void`

##### clone() {#clone-18}

> **clone**(): [`NodeSelection`](#nodeselection)

Defined in: [packages/lexical/src/LexicalSelection.ts:383](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L383)

###### Returns

[`NodeSelection`](#nodeselection)

###### Implementation of

`BaseSelection.clone`

##### delete() {#delete}

> **delete**(`key`): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:367](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L367)

###### Parameters

###### key

`string`

###### Returns

`void`

##### deleteNodes() {#deletenodes}

> **deleteNodes**(): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:451](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L451)

Remove all nodes in the NodeSelection. If there were any nodes,
replace the selection with a new RangeSelection at the previous
location of the first node.

###### Returns

`void`

##### extract() {#extract-2}

> **extract**(): [`LexicalNode`](#lexicalnode)[]

Defined in: [packages/lexical/src/LexicalSelection.ts:387](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L387)

###### Returns

[`LexicalNode`](#lexicalnode)[]

###### Implementation of

`BaseSelection.extract`

##### getCachedNodes() {#getcachednodes-2}

> **getCachedNodes**(): `null` \| [`LexicalNode`](#lexicalnode)[]

Defined in: [packages/lexical/src/LexicalSelection.ts:332](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L332)

###### Returns

`null` \| [`LexicalNode`](#lexicalnode)[]

###### Implementation of

`BaseSelection.getCachedNodes`

##### getNodes() {#getnodes-2}

> **getNodes**(): [`LexicalNode`](#lexicalnode)[]

Defined in: [packages/lexical/src/LexicalSelection.ts:418](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L418)

###### Returns

[`LexicalNode`](#lexicalnode)[]

###### Implementation of

`BaseSelection.getNodes`

##### getStartEndPoints() {#getstartendpoints-2}

> **getStartEndPoints**(): `null`

Defined in: [packages/lexical/src/LexicalSelection.ts:357](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L357)

###### Returns

`null`

###### Implementation of

`BaseSelection.getStartEndPoints`

##### getTextContent() {#gettextcontent-14}

> **getTextContent**(): `string`

Defined in: [packages/lexical/src/LexicalSelection.ts:437](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L437)

###### Returns

`string`

###### Implementation of

`BaseSelection.getTextContent`

##### has() {#has}

> **has**(`key`): `boolean`

Defined in: [packages/lexical/src/LexicalSelection.ts:379](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L379)

###### Parameters

###### key

`string`

###### Returns

`boolean`

##### insertNodes() {#insertnodes-2}

> **insertNodes**(`nodes`): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:399](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L399)

###### Parameters

###### nodes

[`LexicalNode`](#lexicalnode)[]

###### Returns

`void`

###### Implementation of

`BaseSelection.insertNodes`

##### insertRawText() {#insertrawtext-2}

> **insertRawText**(`text`): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:391](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L391)

###### Parameters

###### text

`string`

###### Returns

`void`

###### Implementation of

`BaseSelection.insertRawText`

##### insertText() {#inserttext-2}

> **insertText**(): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:395](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L395)

###### Returns

`void`

###### Implementation of

`BaseSelection.insertText`

##### is() {#is-10}

> **is**(`selection`): `boolean`

Defined in: [packages/lexical/src/LexicalSelection.ts:340](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L340)

###### Parameters

###### selection

`null` | [`BaseSelection`](#baseselection)

###### Returns

`boolean`

###### Implementation of

`BaseSelection.is`

##### isBackward() {#isbackward-2}

> **isBackward**(): `boolean`

Defined in: [packages/lexical/src/LexicalSelection.ts:353](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L353)

###### Returns

`boolean`

###### Implementation of

`BaseSelection.isBackward`

##### isCollapsed() {#iscollapsed-3}

> **isCollapsed**(): `boolean`

Defined in: [packages/lexical/src/LexicalSelection.ts:349](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L349)

###### Returns

`boolean`

###### Implementation of

`BaseSelection.isCollapsed`

##### setCachedNodes() {#setcachednodes-2}

> **setCachedNodes**(`nodes`): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:336](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L336)

###### Parameters

###### nodes

`null` | [`LexicalNode`](#lexicalnode)[]

###### Returns

`void`

###### Implementation of

`BaseSelection.setCachedNodes`

***

### Point {#point}

Defined in: [packages/lexical/src/LexicalSelection.ts:132](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L132)

#### Properties

##### \_selection {#_selection-1}

> **\_selection**: `null` \| [`BaseSelection`](#baseselection)

Defined in: [packages/lexical/src/LexicalSelection.ts:136](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L136)

##### key {#key}

> **key**: `string`

Defined in: [packages/lexical/src/LexicalSelection.ts:133](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L133)

##### offset {#offset}

> **offset**: `number`

Defined in: [packages/lexical/src/LexicalSelection.ts:134](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L134)

##### type {#type-8}

> **type**: `"element"` \| `"text"`

Defined in: [packages/lexical/src/LexicalSelection.ts:135](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L135)

#### Methods

##### getNode() {#getnode}

> **getNode**(): [`LexicalNode`](#lexicalnode)

Defined in: [packages/lexical/src/LexicalSelection.ts:170](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L170)

###### Returns

[`LexicalNode`](#lexicalnode)

##### is() {#is-12}

> **is**(`point`): `boolean`

Defined in: [packages/lexical/src/LexicalSelection.ts:153](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L153)

###### Parameters

###### point

[`PointType`](#pointtype-1)

###### Returns

`boolean`

##### isBefore() {#isbefore-8}

> **isBefore**(`b`): `boolean`

Defined in: [packages/lexical/src/LexicalSelection.ts:161](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L161)

###### Parameters

###### b

[`PointType`](#pointtype-1)

###### Returns

`boolean`

##### set() {#set}

> **set**(`key`, `offset`, `type`, `onlyIfChanged?`): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:179](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L179)

###### Parameters

###### key

`string`

###### offset

`number`

###### type

`"element"` | `"text"`

###### onlyIfChanged?

`boolean`

###### Returns

`void`

***

### RangeSelection {#rangeselection}

Defined in: [packages/lexical/src/LexicalSelection.ts:467](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L467)

#### Implements

- [`BaseSelection`](#baseselection)

#### Properties

##### \_cachedNodes {#_cachednodes-2}

> **\_cachedNodes**: `null` \| [`LexicalNode`](#lexicalnode)[]

Defined in: [packages/lexical/src/LexicalSelection.ts:472](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L472)

###### Implementation of

`BaseSelection._cachedNodes`

##### anchor {#anchor-1}

> **anchor**: [`PointType`](#pointtype-1)

Defined in: [packages/lexical/src/LexicalSelection.ts:470](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L470)

##### dirty {#dirty-2}

> **dirty**: `boolean`

Defined in: [packages/lexical/src/LexicalSelection.ts:473](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L473)

###### Implementation of

`BaseSelection.dirty`

##### focus {#focus-5}

> **focus**: [`PointType`](#pointtype-1)

Defined in: [packages/lexical/src/LexicalSelection.ts:471](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L471)

##### format {#format}

> **format**: `number`

Defined in: [packages/lexical/src/LexicalSelection.ts:468](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L468)

##### style {#style}

> **style**: `string`

Defined in: [packages/lexical/src/LexicalSelection.ts:469](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L469)

#### Methods

##### applyDOMRange() {#applydomrange}

> **applyDOMRange**(`range`): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:654](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L654)

Attempts to map a DOM selection range onto this Lexical Selection,
setting the anchor, focus, and type accordingly

###### Parameters

###### range

`StaticRange`

a DOM Selection range conforming to the StaticRange interface.

###### Returns

`void`

##### clone() {#clone-20}

> **clone**(): [`RangeSelection`](#rangeselection)

Defined in: [packages/lexical/src/LexicalSelection.ts:687](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L687)

Creates a new RangeSelection, copying over all the property values from this one.

###### Returns

[`RangeSelection`](#rangeselection)

a new RangeSelection with the same property values as this one.

###### Implementation of

`BaseSelection.clone`

##### deleteCharacter() {#deletecharacter}

> **deleteCharacter**(`isBackward`): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:1743](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L1743)

Performs one logical character deletion operation on the EditorState based on the current Selection.
Handles different node types.

###### Parameters

###### isBackward

`boolean`

whether or not the selection is backwards.

###### Returns

`void`

##### deleteLine() {#deleteline}

> **deleteLine**(`isBackward`): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:1917](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L1917)

Performs one logical line deletion operation on the EditorState based on the current Selection.
Handles different node types.

###### Parameters

###### isBackward

`boolean`

whether or not the selection is backwards.

###### Returns

`void`

##### deleteWord() {#deleteword}

> **deleteWord**(`isBackward`): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:1937](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L1937)

Performs one logical word deletion operation on the EditorState based on the current Selection.
Handles different node types.

###### Parameters

###### isBackward

`boolean`

whether or not the selection is backwards.

###### Returns

`void`

##### extract() {#extract-4}

> **extract**(): [`LexicalNode`](#lexicalnode)[]

Defined in: [packages/lexical/src/LexicalSelection.ts:1502](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L1502)

Extracts the nodes in the Selection, splitting nodes where necessary
to get offset-level precision.

###### Returns

[`LexicalNode`](#lexicalnode)[]

The nodes in the Selection

###### Implementation of

`BaseSelection.extract`

##### formatText() {#formattext}

> **formatText**(`formatType`, `alignWithFormat`): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:1184](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L1184)

Applies the provided format to the TextNodes in the Selection, splitting or
merging nodes as necessary.

###### Parameters

###### formatType

[`TextFormatType`](#textformattype)

the format type to apply to the nodes in the Selection.

###### alignWithFormat

a 32-bit integer representing formatting flags to align with.

`null` | `number`

###### Returns

`void`

##### forwardDeletion() {#forwarddeletion}

> **forwardDeletion**(`anchor`, `anchorNode`, `isBackward`): `boolean`

Defined in: [packages/lexical/src/LexicalSelection.ts:1711](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L1711)

Helper for handling forward character and word deletion that prevents element nodes
like a table, columns layout being destroyed

###### Parameters

###### anchor

[`PointType`](#pointtype-1)

the anchor

###### anchorNode

the anchor node in the selection

[`ElementNode`](#elementnode) | [`TextNode`](#textnode)

###### isBackward

`boolean`

whether or not selection is backwards

###### Returns

`boolean`

##### getCachedNodes() {#getcachednodes-4}

> **getCachedNodes**(): `null` \| [`LexicalNode`](#lexicalnode)[]

Defined in: [packages/lexical/src/LexicalSelection.ts:491](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L491)

###### Returns

`null` \| [`LexicalNode`](#lexicalnode)[]

###### Implementation of

`BaseSelection.getCachedNodes`

##### getNodes() {#getnodes-4}

> **getNodes**(): [`LexicalNode`](#lexicalnode)[]

Defined in: [packages/lexical/src/LexicalSelection.ts:538](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L538)

Gets all the nodes in the Selection. Uses caching to make it generally suitable
for use in hot paths.

See also the [CaretRange](#caretrange) APIs (starting with
[$caretRangeFromSelection](#caretrangefromselection)), which are likely to provide a better
foundation for any operation where partial selection is relevant
(e.g. the anchor or focus are inside an ElementNode and TextNode)

###### Returns

[`LexicalNode`](#lexicalnode)[]

an Array containing all the nodes in the Selection

###### Implementation of

`BaseSelection.getNodes`

##### getStartEndPoints() {#getstartendpoints-4}

> **getStartEndPoints**(): `null` \| \[[`PointType`](#pointtype-1), [`PointType`](#pointtype-1)\]

Defined in: [packages/lexical/src/LexicalSelection.ts:1965](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L1965)

###### Returns

`null` \| \[[`PointType`](#pointtype-1), [`PointType`](#pointtype-1)\]

###### Implementation of

`BaseSelection.getStartEndPoints`

##### getTextContent() {#gettextcontent-16}

> **getTextContent**(): `string`

Defined in: [packages/lexical/src/LexicalSelection.ts:586](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L586)

Gets the (plain) text content of all the nodes in the selection.

###### Returns

`string`

a string representing the text content of all the nodes in the Selection

###### Implementation of

`BaseSelection.getTextContent`

##### hasFormat() {#hasformat-4}

> **hasFormat**(`type`): `boolean`

Defined in: [packages/lexical/src/LexicalSelection.ts:736](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L736)

Returns whether the provided TextFormatType is present on the Selection. This will be true if any node in the Selection
has the specified format.

###### Parameters

###### type

[`TextFormatType`](#textformattype)

the TextFormatType to check for.

###### Returns

`boolean`

true if the provided format is currently toggled on on the Selection, false otherwise.

##### insertLineBreak() {#insertlinebreak}

> **insertLineBreak**(`selectStart?`): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:1485](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L1485)

Inserts a logical linebreak, which may be a new LineBreakNode or a new ParagraphNode, into the EditorState at the
current Selection.

###### Parameters

###### selectStart?

`boolean`

###### Returns

`void`

##### insertNodes() {#insertnodes-4}

> **insertNodes**(`nodes`): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:1335](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L1335)

Attempts to "intelligently" insert an arbitrary list of Lexical nodes into the EditorState at the
current Selection according to a set of heuristics that determine how surrounding nodes
should be changed, replaced, or moved to accommodate the incoming ones.

###### Parameters

###### nodes

[`LexicalNode`](#lexicalnode)[]

the nodes to insert

###### Returns

`void`

###### Implementation of

`BaseSelection.insertNodes`

##### insertParagraph() {#insertparagraph}

> **insertParagraph**(): `null` \| [`ElementNode`](#elementnode)

Defined in: [packages/lexical/src/LexicalSelection.ts:1454](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L1454)

Inserts a new ParagraphNode into the EditorState at the current Selection

###### Returns

`null` \| [`ElementNode`](#elementnode)

the newly inserted node.

##### insertRawText() {#insertrawtext-4}

> **insertRawText**(`text`): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:747](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L747)

Attempts to insert the provided text into the EditorState at the current Selection.
converts tabs, newlines, and carriage returns into LexicalNodes.

###### Parameters

###### text

`string`

the text to insert into the Selection

###### Returns

`void`

###### Implementation of

`BaseSelection.insertRawText`

##### insertText() {#inserttext-4}

> **insertText**(`text`): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:769](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L769)

Insert the provided text into the EditorState at the current Selection.

###### Parameters

###### text

`string`

the text to insert into the Selection

###### Returns

`void`

###### Implementation of

`BaseSelection.insertText`

##### is() {#is-14}

> **is**(`selection`): `boolean`

Defined in: [packages/lexical/src/LexicalSelection.ts:505](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L505)

Used to check if the provided selections is equal to this one by value,
including anchor, focus, format, and style properties.

###### Parameters

###### selection

the Selection to compare this one to.

`null` | [`BaseSelection`](#baseselection)

###### Returns

`boolean`

true if the Selections are equal, false otherwise.

###### Implementation of

`BaseSelection.is`

##### isBackward() {#isbackward-4}

> **isBackward**(): `boolean`

Defined in: [packages/lexical/src/LexicalSelection.ts:1961](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L1961)

Returns whether the Selection is "backwards", meaning the focus
logically precedes the anchor in the EditorState.

###### Returns

`boolean`

true if the Selection is backwards, false otherwise.

###### Implementation of

`BaseSelection.isBackward`

##### isCollapsed() {#iscollapsed-5}

> **isCollapsed**(): `boolean`

Defined in: [packages/lexical/src/LexicalSelection.ts:523](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L523)

Returns whether the Selection is "collapsed", meaning the anchor and focus are
the same node and have the same offset.

###### Returns

`boolean`

true if the Selection is collapsed, false otherwise.

###### Implementation of

`BaseSelection.isCollapsed`

##### modify() {#modify}

> **modify**(`alter`, `isBackward`, `granularity`): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:1564](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L1564)

Modifies the Selection according to the parameters and a set of heuristics that account for
various node types. Can be used to safely move or extend selection by one logical "unit" without
dealing explicitly with all the possible node types.

###### Parameters

###### alter

the type of modification to perform

`"move"` | `"extend"`

###### isBackward

`boolean`

whether or not selection is backwards

###### granularity

the granularity at which to apply the modification

`"character"` | `"word"` | `"lineboundary"`

###### Returns

`void`

##### removeText() {#removetext}

> **removeText**(): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:1167](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L1167)

Removes the text in the Selection, adjusting the EditorState accordingly.

###### Returns

`void`

##### setCachedNodes() {#setcachednodes-4}

> **setCachedNodes**(`nodes`): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:495](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L495)

###### Parameters

###### nodes

`null` | [`LexicalNode`](#lexicalnode)[]

###### Returns

`void`

###### Implementation of

`BaseSelection.setCachedNodes`

##### setFormat() {#setformat-4}

> **setFormat**(`format`): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:714](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L714)

Sets the value of the format property on the Selection

###### Parameters

###### format

`number`

the format to set at the value of the format property.

###### Returns

`void`

##### setStyle() {#setstyle-4}

> **setStyle**(`style`): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:724](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L724)

Sets the value of the style property on the Selection

###### Parameters

###### style

`string`

the style to set at the value of the style property.

###### Returns

`void`

##### setTextNodeRange() {#settextnoderange}

> **setTextNodeRange**(`anchorNode`, `anchorOffset`, `focusNode`, `focusOffset`): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:571](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L571)

Sets this Selection to be of type "text" at the provided anchor and focus values.

###### Parameters

###### anchorNode

[`TextNode`](#textnode)

the anchor node to set on the Selection

###### anchorOffset

`number`

the offset to set on the Selection

###### focusNode

[`TextNode`](#textnode)

the focus node to set on the Selection

###### focusOffset

`number`

the focus offset to set on the Selection

###### Returns

`void`

##### toggleFormat() {#toggleformat-2}

> **toggleFormat**(`format`): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:704](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L704)

Toggles the provided format on all the TextNodes in the Selection.

###### Parameters

###### format

[`TextFormatType`](#textformattype)

a string TextFormatType to toggle on the TextNodes in the selection

###### Returns

`void`

***

### SerializedEditorState {#serializededitorstate}

Defined in: [packages/lexical/src/LexicalEditorState.ts:22](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditorState.ts#L22)

#### Type Parameters

##### T

`T` *extends* [`SerializedLexicalNode`](#serializedlexicalnode) = [`SerializedLexicalNode`](#serializedlexicalnode)

#### Properties

##### root {#root-1}

> **root**: [`SerializedRootNode`](#serializedrootnode)\<`T`\>

Defined in: [packages/lexical/src/LexicalEditorState.ts:25](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditorState.ts#L25)

***

### SiblingCaret {#siblingcaret}

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:174](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L174)

A SiblingCaret points from an origin LexicalNode towards its next or previous sibling.

#### Extends

- [`BaseCaret`](#basecaret)\<`T`, `D`, `"sibling"`\>

#### Type Parameters

##### T

`T` *extends* [`LexicalNode`](#lexicalnode) = [`LexicalNode`](#lexicalnode)

##### D

`D` *extends* [`CaretDirection`](#caretdirection) = [`CaretDirection`](#caretdirection)

#### Properties

##### direction {#direction-3}

> `readonly` **direction**: `D`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:57](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L57)

next if pointing at the next sibling or first child, previous if pointing at the previous sibling or last child

###### Inherited from

[`BaseCaret`](#basecaret).[`direction`](#direction)

##### getAdjacentCaret() {#getadjacentcaret-2}

> **getAdjacentCaret**: () => `null` \| [`SiblingCaret`](#siblingcaret)\<[`LexicalNode`](#lexicalnode), `D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:63](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L63)

Get a new SiblingCaret from getNodeAtCaret() in the same direction.

###### Returns

`null` \| [`SiblingCaret`](#siblingcaret)\<[`LexicalNode`](#lexicalnode), `D`\>

###### Inherited from

[`BaseCaret`](#basecaret).[`getAdjacentCaret`](#getadjacentcaret)

##### getChildCaret() {#getchildcaret-1}

> **getChildCaret**: () => `null` \| [`ChildCaret`](#childcaret)\<`T` & [`ElementNode`](#elementnode), `D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:184](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L184)

If the origin of this node is an ElementNode, return the ChildCaret of this origin in the same direction.
If the origin is not an ElementNode, this will return null.

###### Returns

`null` \| [`ChildCaret`](#childcaret)\<`T` & [`ElementNode`](#elementnode), `D`\>

##### getFlipped() {#getflipped-1}

> **getFlipped**: () => [`NodeCaret`](#nodecaret)\<[`FlipDirection`](#flipdirection)\<`D`\>\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:221](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L221)

Get a new NodeCaret with the head and tail of its directional arrow flipped, such that flipping twice is the identity.
For example, given a non-empty parent with a firstChild and lastChild, and a second emptyParent node with no children:

###### Returns

[`NodeCaret`](#nodecaret)\<[`FlipDirection`](#flipdirection)\<`D`\>\>

###### Example

```
caret.getFlipped().getFlipped().is(caret) === true;
$getChildCaret(parent, 'next').getFlipped().is($getSiblingCaret(firstChild, 'previous')) === true;
$getSiblingCaret(lastChild, 'next').getFlipped().is($getChildCaret(parent, 'previous')) === true;
$getSiblingCaret(firstChild, 'next).getFlipped().is($getSiblingCaret(lastChild, 'previous')) === true;
$getChildCaret(emptyParent, 'next').getFlipped().is($getChildCaret(emptyParent, 'previous')) === true;
```

##### getLatest() {#getlatest-9}

> **getLatest**: () => [`SiblingCaret`](#siblingcaret)\<`T`, `D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:179](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L179)

Get a new caret with the latest origin pointer

###### Returns

[`SiblingCaret`](#siblingcaret)\<`T`, `D`\>

##### getNodeAtCaret() {#getnodeatcaret-2}

> **getNodeAtCaret**: () => `null` \| [`LexicalNode`](#lexicalnode)

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:61](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L61)

Get the node connected to the origin in the caret's direction, or null if there is no node

###### Returns

`null` \| [`LexicalNode`](#lexicalnode)

###### Inherited from

[`BaseCaret`](#basecaret).[`getNodeAtCaret`](#getnodeatcaret)

##### getParentAtCaret() {#getparentatcaret-2}

> **getParentAtCaret**: () => `null` \| [`ElementNode`](#elementnode)

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:59](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L59)

Get the ElementNode that is the logical parent (`origin` for `ChildCaret`, `origin.getParent()` for `SiblingCaret`)

###### Returns

`null` \| [`ElementNode`](#elementnode)

###### Inherited from

[`BaseCaret`](#basecaret).[`getParentAtCaret`](#getparentatcaret)

##### getParentCaret() {#getparentcaret-1}

> **getParentCaret**: (`mode?`) => `null` \| [`SiblingCaret`](#siblingcaret)\<[`ElementNode`](#elementnode), `D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:191](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L191)

Get the caret in the same direction from the parent of this origin.

###### Parameters

###### mode?

[`RootMode`](#rootmode-1)

'root' to return null at the root, 'shadowRoot' to return null at the root or any shadow root

###### Returns

`null` \| [`SiblingCaret`](#siblingcaret)\<[`ElementNode`](#elementnode), `D`\>

A SiblingCaret with the parent of this origin, or null if the parent is a root according to mode.

##### getSiblingCaret() {#getsiblingcaret-2}

> **getSiblingCaret**: () => [`SiblingCaret`](#siblingcaret)\<`T`, `D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:67](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L67)

Get a new SiblingCaret with this same node

###### Returns

[`SiblingCaret`](#siblingcaret)\<`T`, `D`\>

###### Inherited from

[`BaseCaret`](#basecaret).[`getSiblingCaret`](#getsiblingcaret)

##### insert() {#insert-2}

> **insert**: (`node`) => `this`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:75](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L75)

Insert a node connected to origin in this direction (before the node that this caret is pointing towards, if any existed).
For a `SiblingCaret` this is `origin.insertAfter(node)` for next, or `origin.insertBefore(node)` for previous.
For a `ChildCaret` this is `origin.splice(0, 0, [node])` for next or `origin.append(node)` for previous.

###### Parameters

###### node

[`LexicalNode`](#lexicalnode)

###### Returns

`this`

###### Inherited from

[`BaseCaret`](#basecaret).[`insert`](#insert)

##### isSameNodeCaret() {#issamenodecaret-1}

> **isSameNodeCaret**: (`other`) => other is (SiblingCaret\<T, D\> \| T) extends TextNode ? TextPointCaret\<T & TextNode, D\> : never

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:196](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L196)

Return true if other is a SiblingCaret or TextPointCaret with the same
origin (by node key comparison) and direction.

###### Parameters

###### other

`undefined` | `null` | [`PointCaret`](#pointcaret)\<[`CaretDirection`](#caretdirection)\>

###### Returns

other is (SiblingCaret\<T, D\> \| T) extends TextNode ? TextPointCaret\<T & TextNode, D\> : never

##### isSamePointCaret() {#issamepointcaret-1}

> **isSamePointCaret**: (`other`) => `other is SiblingCaret<T, D>`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:205](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L205)

Return true if other is a SiblingCaret with the same
origin (by node key comparison) and direction.

###### Parameters

###### other

`undefined` | `null` | [`PointCaret`](#pointcaret)\<[`CaretDirection`](#caretdirection)\>

###### Returns

`other is SiblingCaret<T, D>`

##### origin {#origin-2}

> `readonly` **origin**: `T`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:53](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L53)

The origin node of this caret, typically this is what you will use in traversals

###### Inherited from

[`BaseCaret`](#basecaret).[`origin`](#origin)

##### remove() {#remove-12}

> **remove**: () => `this`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:69](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L69)

Remove the getNodeAtCaret() node that this caret is pointing towards, if it exists

###### Returns

`this`

###### Inherited from

[`BaseCaret`](#basecaret).[`remove`](#remove-8)

##### replaceOrInsert() {#replaceorinsert-2}

> **replaceOrInsert**: (`node`, `includeChildren?`) => `this`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:77](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L77)

If getNodeAtCaret() is not null then replace it with node, otherwise insert node

###### Parameters

###### node

[`LexicalNode`](#lexicalnode)

###### includeChildren?

`boolean`

###### Returns

`this`

###### Inherited from

[`BaseCaret`](#basecaret).[`replaceOrInsert`](#replaceorinsert)

##### splice() {#splice-6}

> **splice**: (`deleteCount`, `nodes`, `nodesDirection?`) => `this`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:85](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L85)

Splice an iterable (typically an Array) of nodes into this location.

###### Parameters

###### deleteCount

`number`

The number of existing nodes to replace or delete

###### nodes

`Iterable`\<[`LexicalNode`](#lexicalnode)\>

An iterable of nodes that will be inserted in this location, using replace instead of insert for the first deleteCount nodes

###### nodesDirection?

[`CaretDirection`](#caretdirection)

The direction of the nodes iterable, defaults to 'next'

###### Returns

`this`

###### Inherited from

[`BaseCaret`](#basecaret).[`splice`](#splice-4)

##### type {#type-9}

> `readonly` **type**: `"sibling"`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:55](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L55)

sibling for a SiblingCaret (pointing at the next or previous sibling) or child for a ChildCaret (pointing at the first or last child)

###### Inherited from

[`BaseCaret`](#basecaret).[`type`](#type-1)

***

### SplitAtPointCaretNextOptions {#splitatpointcaretnextoptions}

Defined in: [packages/lexical/src/caret/LexicalCaretUtils.ts:669](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaretUtils.ts#L669)

#### Properties

##### $copyElementNode()? {#copyelementnode}

> `optional` **$copyElementNode**: (`node`) => [`ElementNode`](#elementnode)

Defined in: [packages/lexical/src/caret/LexicalCaretUtils.ts:671](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaretUtils.ts#L671)

The function to create the right side of a split ElementNode (default [$copyNode](#copynode))

###### Parameters

###### node

[`ElementNode`](#elementnode)

###### Returns

[`ElementNode`](#elementnode)

##### $shouldSplit()? {#shouldsplit}

> `optional` **$shouldSplit**: (`node`, `edge`) => `boolean`

Defined in: [packages/lexical/src/caret/LexicalCaretUtils.ts:683](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaretUtils.ts#L683)

If element.canBeEmpty() and would create an empty split, this function will be
called with the element and 'first' | 'last'. If it returns false, the empty
split will not be created. Default is `() => true` to always split when possible.

###### Parameters

###### node

[`ElementNode`](#elementnode)

###### edge

`"first"` | `"last"`

###### Returns

`boolean`

##### $splitTextPointCaretNext()? {#splittextpointcaretnext}

> `optional` **$splitTextPointCaretNext**: (`caret`) => [`NodeCaret`](#nodecaret)\<`"next"`\>

Defined in: [packages/lexical/src/caret/LexicalCaretUtils.ts:673](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaretUtils.ts#L673)

The function to split a TextNode (default $splitTextPointCaret)

###### Parameters

###### caret

[`TextPointCaret`](#textpointcaret)\<[`TextNode`](#textnode), `"next"`\>

###### Returns

[`NodeCaret`](#nodecaret)\<`"next"`\>

##### rootMode? {#rootmode}

> `optional` **rootMode**: [`RootMode`](#rootmode-1)

Defined in: [packages/lexical/src/caret/LexicalCaretUtils.ts:677](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaretUtils.ts#L677)

If the parent matches rootMode a split will not occur, default is 'shadowRoot'

***

### StateConfig {#stateconfig}

Defined in: [packages/lexical/src/LexicalNodeState.ts:237](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNodeState.ts#L237)

The return value of [createState](#createstate), for use with
[$getState](#getstate) and [$setState](#setstate).

#### Type Parameters

##### K

`K` *extends* `string`

##### V

`V`

#### Properties

##### defaultValue {#defaultvalue}

> `readonly` **defaultValue**: `V`

Defined in: [packages/lexical/src/LexicalNodeState.ts:258](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNodeState.ts#L258)

The result of `stateValueConfig.parse(undefined)`, which is computed only
once and used as the default value. When the current value `isEqual` to
the `defaultValue`, it will not be serialized to JSON.

##### isEqual() {#isequal}

> `readonly` **isEqual**: (`a`, `b`) => `boolean`

Defined in: [packages/lexical/src/LexicalNodeState.ts:252](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNodeState.ts#L252)

An equality function from the StateValueConfig, with a default of
Object.is.

###### Parameters

###### a

`V`

###### b

`V`

###### Returns

`boolean`

##### key {#key-1}

> `readonly` **key**: `K`

Defined in: [packages/lexical/src/LexicalNodeState.ts:239](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNodeState.ts#L239)

The string key used when serializing this state to JSON

##### parse() {#parse}

> `readonly` **parse**: (`value?`) => `V`

Defined in: [packages/lexical/src/LexicalNodeState.ts:241](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNodeState.ts#L241)

The parse function from the StateValueConfig passed to createState

###### Parameters

###### value?

`unknown`

###### Returns

`V`

##### resetOnCopyNode {#resetoncopynode}

> `readonly` **resetOnCopyNode**: `boolean`

Defined in: [packages/lexical/src/LexicalNodeState.ts:259](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNodeState.ts#L259)

##### unparse() {#unparse}

> `readonly` **unparse**: (`value`) => `unknown`

Defined in: [packages/lexical/src/LexicalNodeState.ts:247](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNodeState.ts#L247)

The unparse function from the StateValueConfig passed to createState,
with a default that is simply a pass-through that assumes the value is
JSON serializable.

###### Parameters

###### value

`V`

###### Returns

`unknown`

***

### StateValueConfig {#statevalueconfig}

Defined in: [packages/lexical/src/LexicalNodeState.ts:188](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNodeState.ts#L188)

Configure a value to be used with StateConfig.

The value type should be inferred from the definition of parse.

If the value type is not JSON serializable, then unparse must also be provided.

Values should be treated as immutable, much like React.useState. Mutating
stored values directly will cause unpredictable behavior, is not supported,
and may trigger errors in the future.

#### Examples

```ts
const numberOrNullState = createState('numberOrNull', {parse: (v) => typeof v === 'number' ? v : null});
//    ^? State<'numberOrNull', StateValueConfig<number | null>>
const numberState = createState('number', {parse: (v) => typeof v === 'number' ? v : 0});
//    ^? State<'number', StateValueConfig<number>>
```

Only the parse option is required, it is generally not useful to
override `unparse` or `isEqual`. However, if you are using
non-primitive types such as Array, Object, Date, or something
more exotic then you would want to override this. In these
cases you might want to reach for third party libraries.

```ts
const isoDateState = createState('isoDate', {
  parse: (v): null | Date => {
    const date = typeof v === 'string' ? new Date(v) : null;
    return date && !isNaN(date.valueOf()) ? date : null;
  }
  isEqual: (a, b) => a === b || (a && b && a.valueOf() === b.valueOf()),
  unparse: (v) => v && v.toString()
});
```

You may find it easier to write a parse function using libraries like
zod, valibot, ajv, Effect, TypeBox, etc. perhaps with a wrapper function.

#### Type Parameters

##### V

`V`

#### Properties

##### isEqual()? {#isequal-1}

> `optional` **isEqual**: (`a`, `b`) => `boolean`

Defined in: [packages/lexical/src/LexicalNodeState.ts:225](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNodeState.ts#L225)

This is optional and for advanced use cases only.

Used to define the equality function so you can use an Array or Object
as V and still omit default values from the exported JSON.

The default is `Object.is`, but something like `fast-deep-equal` might be
more appropriate for your use case.

###### Parameters

###### a

`V`

###### b

`V`

###### Returns

`boolean`

##### parse() {#parse-1}

> **parse**: (`jsonValue`) => `V`

Defined in: [packages/lexical/src/LexicalNodeState.ts:208](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNodeState.ts#L208)

This function must return a default value when called with undefined,
otherwise it should parse the given JSON value to your type V. Note
that it is not required to copy or clone the given value, you can
pass it directly through if it matches the expected type.

When you encounter an invalid value, it's up to you to decide
as to whether to ignore it and return the default value,
return some non-default error value, or throw an error.

It is possible for V to include undefined, but if it does, then
it should also be considered the default value since undefined
can not be serialized to JSON so it is indistinguishable from the
default.

Similarly, if your V is a function, then usage of [$setState](#setstate)
must use an updater function because your type will be indistinguishable
from an updater function.

###### Parameters

###### jsonValue

`unknown`

###### Returns

`V`

##### resetOnCopyNode? {#resetoncopynode-1}

> `optional` **resetOnCopyNode**: `boolean`

Defined in: [packages/lexical/src/LexicalNodeState.ts:230](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNodeState.ts#L230)

When a node is copied with [$copyNode](#copynode) (not cloned), reset this
value to the default.

##### unparse()? {#unparse-1}

> `optional` **unparse**: (`parsed`) => `unknown`

Defined in: [packages/lexical/src/LexicalNodeState.ts:215](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNodeState.ts#L215)

This is optional and for advanced use cases only.

You may specify a function that converts V back to JSON.
This is mandatory when V is not a JSON serializable type.

###### Parameters

###### parsed

`V`

###### Returns

`unknown`

***

### StaticNodeConfigValue {#staticnodeconfigvalue}

Defined in: [packages/lexical/src/LexicalNode.ts:99](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L99)

EXPERIMENTAL
The configuration of a node returned by LexicalNode.$config()

#### Example

```ts
class CustomText extends TextNode {
  $config() {
    return this.config('custom-text', {extends: TextNode}};
  }
}
```

#### Type Parameters

##### T

`T` *extends* [`LexicalNode`](#lexicalnode)

##### Type

`Type` *extends* `string`

#### Properties

##### $importJSON()? {#importjson-14}

> `readonly` `optional` **$importJSON**: (`serializedNode`) => `T`

Defined in: [packages/lexical/src/LexicalNode.ts:118](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L118)

An alternative to the static importJSON() method
that provides better type inference.

###### Parameters

###### serializedNode

[`SerializedLexicalNode`](#serializedlexicalnode)

###### Returns

`T`

##### $transform()? {#transform-6}

> `readonly` `optional` **$transform**: (`node`) => `void`

Defined in: [packages/lexical/src/LexicalNode.ts:113](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L113)

An alternative to the internal static transform() method
that provides better type inference. If implemented this
transform will be registered for this class and any subclass.

###### Parameters

###### node

`T`

###### Returns

`void`

##### extends? {#extends}

> `readonly` `optional` **extends**: [`KlassConstructor`](#klassconstructor)\<*typeof* [`LexicalNode`](#lexicalnode)\>

Defined in: [packages/lexical/src/LexicalNode.ts:164](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L164)

If specified, this must be the exact superclass of the node. It is not
checked at compile time and it is provided automatically at runtime.

You would want to specify this when you are extending a node that
has non-trivial configuration in its $config such
as required state. If you do not specify this, the inferred
types for your node class might be missing some of that.

##### importDOM? {#importdom-10}

> `readonly` `optional` **importDOM**: [`DOMConversionMap`](#domconversionmap)\<`HTMLElement`\>

Defined in: [packages/lexical/src/LexicalNode.ts:122](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L122)

An alternative to the static importDOM() method

##### stateConfigs? {#stateconfigs}

> `readonly` `optional` **stateConfigs**: readonly `RequiredNodeStateConfig`[]

Defined in: [packages/lexical/src/LexicalNode.ts:154](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L154)

EXPERIMENTAL

An array of RequiredNodeStateConfig to initialize your node with
its state requirements. This may be used to configure serialization of
that state.

This function will be called (at most) once per editor initialization,
directly on your node's prototype. It must not depend on any state
initialized in the constructor.

###### Example

```ts
const flatState = createState("flat", {parse: parseNumber});
const nestedState = createState("nested", {parse: parseNumber});
class MyNode extends TextNode {
  $config() {
    return this.config(
      'my-node',
      {
        extends: TextNode,
        stateConfigs: [
          { stateConfig: flatState, flat: true},
          nestedState,
        ]
      },
    );
  }
}
```

##### type? {#type-11}

> `readonly` `optional` **type**: `Type`

Defined in: [packages/lexical/src/LexicalNode.ts:107](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L107)

The exact type of T.getType(), e.g. 'text' - the method itself must
have a more generic 'string' type to be compatible wtih subclassing.

***

### StepwiseIteratorConfig {#stepwiseiteratorconfig}

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:125](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L125)

#### Type Parameters

##### State

`State`

##### Stop

`Stop`

##### Value

`Value`

#### Properties

##### hasNext() {#hasnext}

> `readonly` **hasNext**: (`value`) => `value is State`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:127](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L127)

###### Parameters

###### value

`State` | `Stop`

###### Returns

`value is State`

##### initial {#initial}

> `readonly` **initial**: `State` \| `Stop`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:126](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L126)

##### map() {#map}

> `readonly` **map**: (`value`) => `Value`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:129](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L129)

###### Parameters

###### value

`State`

###### Returns

`Value`

##### step() {#step}

> `readonly` **step**: (`value`) => `State` \| `Stop`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:128](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L128)

###### Parameters

###### value

`State`

###### Returns

`State` \| `Stop`

***

### TextPointCaret {#textpointcaret}

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:280](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L280)

A TextPointCaret is a special case of a SiblingCaret that also carries
an offset used for representing partially selected TextNode at the edges
of a CaretRange.

The direction determines which part of the text is adjacent to the caret,
if next it's all of the text after offset. If previous, it's all of the
text before offset.

While this can be used in place of any SiblingCaret of a TextNode,
the offset into the text will be ignored except in contexts that
specifically use the TextPointCaret or PointCaret types.

#### Extends

- [`BaseCaret`](#basecaret)\<`T`, `D`, `"text"`\>

#### Type Parameters

##### T

`T` *extends* [`TextNode`](#textnode) = [`TextNode`](#textnode)

##### D

`D` *extends* [`CaretDirection`](#caretdirection) = [`CaretDirection`](#caretdirection)

#### Properties

##### direction {#direction-4}

> `readonly` **direction**: `D`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:57](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L57)

next if pointing at the next sibling or first child, previous if pointing at the previous sibling or last child

###### Inherited from

[`BaseCaret`](#basecaret).[`direction`](#direction)

##### getAdjacentCaret() {#getadjacentcaret-3}

> **getAdjacentCaret**: () => `null` \| [`SiblingCaret`](#siblingcaret)\<[`LexicalNode`](#lexicalnode), `D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:63](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L63)

Get a new SiblingCaret from getNodeAtCaret() in the same direction.

###### Returns

`null` \| [`SiblingCaret`](#siblingcaret)\<[`LexicalNode`](#lexicalnode), `D`\>

###### Inherited from

[`BaseCaret`](#basecaret).[`getAdjacentCaret`](#getadjacentcaret)

##### getChildCaret() {#getchildcaret-2}

> **getChildCaret**: () => `null`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:291](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L291)

A TextPointCaret can not have a ChildCaret.

###### Returns

`null`

##### getFlipped() {#getflipped-2}

> **getFlipped**: () => [`TextPointCaret`](#textpointcaret)\<`T`, [`FlipDirection`](#flipdirection)\<`D`\>\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:322](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L322)

Get a new TextPointCaret with the head and tail of its directional arrow flipped, such that flipping twice is the identity.
For a TextPointCaret this merely flips the direction because the arrow is internal to the node.

###### Returns

[`TextPointCaret`](#textpointcaret)\<`T`, [`FlipDirection`](#flipdirection)\<`D`\>\>

###### Example

```
caret.getFlipped().getFlipped().is(caret) === true;
```

##### getLatest() {#getlatest-10}

> **getLatest**: () => [`TextPointCaret`](#textpointcaret)\<`T`, `D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:287](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L287)

Get a new caret with the latest origin pointer

###### Returns

[`TextPointCaret`](#textpointcaret)\<`T`, `D`\>

##### getNodeAtCaret() {#getnodeatcaret-3}

> **getNodeAtCaret**: () => `null` \| [`LexicalNode`](#lexicalnode)

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:61](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L61)

Get the node connected to the origin in the caret's direction, or null if there is no node

###### Returns

`null` \| [`LexicalNode`](#lexicalnode)

###### Inherited from

[`BaseCaret`](#basecaret).[`getNodeAtCaret`](#getnodeatcaret)

##### getParentAtCaret() {#getparentatcaret-3}

> **getParentAtCaret**: () => `null` \| [`ElementNode`](#elementnode)

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:59](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L59)

Get the ElementNode that is the logical parent (`origin` for `ChildCaret`, `origin.getParent()` for `SiblingCaret`)

###### Returns

`null` \| [`ElementNode`](#elementnode)

###### Inherited from

[`BaseCaret`](#basecaret).[`getParentAtCaret`](#getparentatcaret)

##### getParentCaret() {#getparentcaret-2}

> **getParentCaret**: (`mode?`) => `null` \| [`SiblingCaret`](#siblingcaret)\<[`ElementNode`](#elementnode), `D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:298](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L298)

Get the caret in the same direction from the parent of this origin.

###### Parameters

###### mode?

[`RootMode`](#rootmode-1)

'root' to return null at the root, 'shadowRoot' to return null at the root or any shadow root

###### Returns

`null` \| [`SiblingCaret`](#siblingcaret)\<[`ElementNode`](#elementnode), `D`\>

A SiblingCaret with the parent of this origin, or null if the parent is a root according to mode.

##### getSiblingCaret() {#getsiblingcaret-3}

> **getSiblingCaret**: () => [`SiblingCaret`](#siblingcaret)\<`T`, `D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:67](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L67)

Get a new SiblingCaret with this same node

###### Returns

[`SiblingCaret`](#siblingcaret)\<`T`, `D`\>

###### Inherited from

[`BaseCaret`](#basecaret).[`getSiblingCaret`](#getsiblingcaret)

##### insert() {#insert-3}

> **insert**: (`node`) => `this`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:75](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L75)

Insert a node connected to origin in this direction (before the node that this caret is pointing towards, if any existed).
For a `SiblingCaret` this is `origin.insertAfter(node)` for next, or `origin.insertBefore(node)` for previous.
For a `ChildCaret` this is `origin.splice(0, 0, [node])` for next or `origin.append(node)` for previous.

###### Parameters

###### node

[`LexicalNode`](#lexicalnode)

###### Returns

`this`

###### Inherited from

[`BaseCaret`](#basecaret).[`insert`](#insert)

##### isSameNodeCaret() {#issamenodecaret-2}

> **isSameNodeCaret**: (`other`) => other is TextPointCaret\<T, D\> \| SiblingCaret\<T, D\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:303](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L303)

Return true if other is a TextPointCaret or SiblingCaret with the same
origin (by node key comparison) and direction.

###### Parameters

###### other

`undefined` | `null` | [`PointCaret`](#pointcaret)\<[`CaretDirection`](#caretdirection)\>

###### Returns

other is TextPointCaret\<T, D\> \| SiblingCaret\<T, D\>

##### isSamePointCaret() {#issamepointcaret-2}

> **isSamePointCaret**: (`other`) => `other is TextPointCaret<T, D>`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:310](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L310)

Return true if other is a ChildCaret with the same
origin (by node key comparison) and direction.

###### Parameters

###### other

`undefined` | `null` | [`PointCaret`](#pointcaret)\<[`CaretDirection`](#caretdirection)\>

###### Returns

`other is TextPointCaret<T, D>`

##### offset {#offset-1}

> `readonly` **offset**: `number`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:285](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L285)

The offset into the string

##### origin {#origin-3}

> `readonly` **origin**: `T`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:53](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L53)

The origin node of this caret, typically this is what you will use in traversals

###### Inherited from

[`BaseCaret`](#basecaret).[`origin`](#origin)

##### remove() {#remove-13}

> **remove**: () => `this`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:69](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L69)

Remove the getNodeAtCaret() node that this caret is pointing towards, if it exists

###### Returns

`this`

###### Inherited from

[`BaseCaret`](#basecaret).[`remove`](#remove-8)

##### replaceOrInsert() {#replaceorinsert-3}

> **replaceOrInsert**: (`node`, `includeChildren?`) => `this`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:77](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L77)

If getNodeAtCaret() is not null then replace it with node, otherwise insert node

###### Parameters

###### node

[`LexicalNode`](#lexicalnode)

###### includeChildren?

`boolean`

###### Returns

`this`

###### Inherited from

[`BaseCaret`](#basecaret).[`replaceOrInsert`](#replaceorinsert)

##### splice() {#splice-7}

> **splice**: (`deleteCount`, `nodes`, `nodesDirection?`) => `this`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:85](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L85)

Splice an iterable (typically an Array) of nodes into this location.

###### Parameters

###### deleteCount

`number`

The number of existing nodes to replace or delete

###### nodes

`Iterable`\<[`LexicalNode`](#lexicalnode)\>

An iterable of nodes that will be inserted in this location, using replace instead of insert for the first deleteCount nodes

###### nodesDirection?

[`CaretDirection`](#caretdirection)

The direction of the nodes iterable, defaults to 'next'

###### Returns

`this`

###### Inherited from

[`BaseCaret`](#basecaret).[`splice`](#splice-4)

##### type {#type-12}

> `readonly` **type**: `"text"`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:55](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L55)

sibling for a SiblingCaret (pointing at the next or previous sibling) or child for a ChildCaret (pointing at the first or last child)

###### Inherited from

[`BaseCaret`](#basecaret).[`type`](#type-1)

***

### TextPointCaretSlice {#textpointcaretslice}

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:332](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L332)

A TextPointCaretSlice is a wrapper for a TextPointCaret that carries a signed
distance representing the direction and amount of text selected from the given
caret. A negative distance means that text before offset is selected, a
positive distance means that text after offset is selected. The offset+distance
pair is not affected in any way by the direction of the caret.

#### Type Parameters

##### T

`T` *extends* [`TextNode`](#textnode) = [`TextNode`](#textnode)

##### D

`D` *extends* [`CaretDirection`](#caretdirection) = [`CaretDirection`](#caretdirection)

#### Properties

##### caret {#caret}

> `readonly` **caret**: [`TextPointCaret`](#textpointcaret)\<`T`, `D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:337](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L337)

##### distance {#distance}

> `readonly` **distance**: `number`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:338](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L338)

##### getSliceIndices() {#getsliceindices}

> **getSliceIndices**: () => \[`number`, `number`\]

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:342](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L342)

###### Returns

\[`number`, `number`\]

absolute coordinates into the text (for use with `text.slice(...)`)

##### getTextContent() {#gettextcontent-18}

> **getTextContent**: () => `string`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:346](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L346)

###### Returns

`string`

The text represented by the slice

##### getTextContentSize() {#gettextcontentsize-8}

> **getTextContentSize**: () => `number`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:350](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L350)

###### Returns

`number`

The size of the text represented by the slice

##### type {#type-13}

> `readonly` **type**: `"slice"`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:336](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L336)

#### Methods

##### removeTextSlice() {#removetextslice}

> **removeTextSlice**(): [`TextPointCaret`](#textpointcaret)\<`T`, `D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:362](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L362)

Remove the slice of text from the contained caret, returning a new
TextPointCaret without the wrapper (since the size would be zero).

Note that this is a lower-level utility that does not have any specific
behavior for 'segmented' or 'token' modes and it will not remove
an empty TextNode.

###### Returns

[`TextPointCaret`](#textpointcaret)\<`T`, `D`\>

The inner TextPointCaret with the same offset and direction
         and the latest TextNode origin after mutation

***

### UpdateListenerPayload {#updatelistenerpayload}

Defined in: [packages/lexical/src/LexicalEditor.ts:271](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L271)

The payload passed to an UpdateListener

#### Properties

##### dirtyElements {#dirtyelements}

> **dirtyElements**: `Map`\<`string`, `boolean`\>

Defined in: [packages/lexical/src/LexicalEditor.ts:277](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L277)

A Map of NodeKeys of ElementNodes to a boolean that is true
if the node was intentionally mutated ('unintentional' mutations
are triggered when an indirect descendant is marked dirty)

##### dirtyLeaves {#dirtyleaves}

> **dirtyLeaves**: `Set`\<`string`\>

Defined in: [packages/lexical/src/LexicalEditor.ts:282](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L282)

A Set of NodeKeys of all nodes that were marked dirty that
do not inherit from ElementNode.

##### editorState {#editorstate-1}

> **editorState**: [`EditorState`](#editorstate)

Defined in: [packages/lexical/src/LexicalEditor.ts:287](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L287)

The new EditorState after all updates have been processed,
equivalent to `editor.getEditorState()`

##### mutatedNodes {#mutatednodes}

> **mutatedNodes**: `null` \| `MutatedNodes`

Defined in: [packages/lexical/src/LexicalEditor.ts:299](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L299)

The Map of LexicalNode constructors to a `Map<NodeKey, NodeMutation>`,
this is useful when you have a mutation listener type use cases that
should apply to all or most nodes. Will be null if no DOM was mutated,
such as when only the selection changed. Note that this will be empty
unless at least one MutationListener is explicitly registered
(any MutationListener is sufficient to compute the mutatedNodes Map
for all nodes).

Added in v0.28.0

##### normalizedNodes {#normalizednodes}

> **normalizedNodes**: `Set`\<`string`\>

Defined in: [packages/lexical/src/LexicalEditor.ts:308](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L308)

For advanced use cases only.

Tracks the keys of TextNode descendants that have been merged
with their siblings by normalization. Note that these keys may
not exist in either editorState or prevEditorState and generally
this is only used for conflict resolution edge cases in collab.

##### prevEditorState {#preveditorstate}

> **prevEditorState**: [`EditorState`](#editorstate)

Defined in: [packages/lexical/src/LexicalEditor.ts:312](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L312)

The previous EditorState that is being discarded

##### tags {#tags}

> **tags**: `Set`\<`string`\>

Defined in: [packages/lexical/src/LexicalEditor.ts:318](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L318)

The set of tags added with update options or [$addUpdateTag](#addupdatetag),
node that this includes all tags that were processed in this
reconciliation which may have been added by separate updates.

## Type Aliases

### AnyLexicalExtension {#anylexicalextension}

> **AnyLexicalExtension** = [`LexicalExtension`](#lexicalextension)\<`any`, `string`, `any`, `any`\>

Defined in: [packages/lexical/src/extension-core/types.ts:22](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L22)

Any concrete [LexicalExtension](#lexicalextension)

***

### AnyLexicalExtensionArgument {#anylexicalextensionargument}

> **AnyLexicalExtensionArgument** = [`AnyLexicalExtension`](#anylexicalextension) \| [`AnyNormalizedLexicalExtensionArgument`](#anynormalizedlexicalextensionargument)

Defined in: [packages/lexical/src/extension-core/types.ts:26](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L26)

Any [LexicalExtension](#lexicalextension) or [NormalizedLexicalExtensionArgument](#normalizedlexicalextensionargument)

***

### AnyNormalizedLexicalExtensionArgument {#anynormalizedlexicalextensionargument}

> **AnyNormalizedLexicalExtensionArgument** = [`NormalizedLexicalExtensionArgument`](#normalizedlexicalextensionargument)\<`any`, `string`, `any`, `any`\>

Defined in: [packages/lexical/src/extension-core/types.ts:55](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L55)

Any [NormalizedLexicalExtensionArgument](#normalizedlexicalextensionargument)

***

### AnyStateConfig {#anystateconfig}

> **AnyStateConfig** = [`StateConfig`](#stateconfig)\<`any`, `any`\>

Defined in: [packages/lexical/src/LexicalNodeState.ts:288](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNodeState.ts#L288)

For advanced use cases, using this type is not recommended unless
it is required (due to TypeScript's lack of features like
higher-kinded types).

A [StateConfig](#stateconfig) type with any key and any value that can be
used in situations where the key and value type can not be known,
such as in a generic constraint when working with a collection of
StateConfig.

[StateConfigKey](#stateconfigkey-1) and [StateConfigValue](#stateconfigvalue) will be
useful when this is used as a generic constraint.

***

### BaseStaticNodeConfig {#basestaticnodeconfig}

> **BaseStaticNodeConfig** = `{ readonly [K in string]?: StaticNodeConfigValue<LexicalNode, string> }`

Defined in: [packages/lexical/src/LexicalNode.ts:171](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L171)

This is the type of LexicalNode.$config() that can be
overridden by subclasses.

***

### CaretDirection {#caretdirection}

> **CaretDirection** = `"next"` \| `"previous"`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:22](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L22)

The direction of a caret, 'next' points towards the end of the document
and 'previous' points towards the beginning

***

### CaretType {#carettype}

> **CaretType** = `"sibling"` \| `"child"`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:32](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L32)

A sibling caret type points from a LexicalNode origin to its next or previous sibling,
and a child caret type points from an ElementNode origin to its first or last child.

***

### CommandListener() {#commandlistener}

> **CommandListener**\<`P`\> = (`payload`, `editor`) => `boolean`

Defined in: [packages/lexical/src/LexicalEditor.ts:351](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L351)

#### Type Parameters

##### P

`P`

#### Parameters

##### payload

`P`

##### editor

[`LexicalEditor`](#lexicaleditor)

#### Returns

`boolean`

***

### CommandListenerPriority {#commandlistenerpriority}

> **CommandListenerPriority** = `0` \| `1` \| `2` \| `3` \| `4`

Defined in: [packages/lexical/src/LexicalEditor.ts:360](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L360)

***

### CommandPayloadType {#commandpayloadtype}

> **CommandPayloadType**\<`TCommand`\> = `TCommand` *extends* [`LexicalCommand`](#lexicalcommand)\<infer TPayload\> ? `TPayload` : `never`

Defined in: [packages/lexical/src/LexicalEditor.ts:393](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L393)

Type helper for extracting the payload type from a command.

#### Type Parameters

##### TCommand

`TCommand` *extends* [`LexicalCommand`](#lexicalcommand)\<`unknown`\>

#### Example

```ts
const MY_COMMAND = createCommand<SomeType>();

// ...

editor.registerCommand(MY_COMMAND, payload => {
  // Type of `payload` is inferred here. But lets say we want to extract a function to delegate to
  $handleMyCommand(editor, payload);
  return true;
});

function $handleMyCommand(editor: LexicalEditor, payload: CommandPayloadType<typeof MY_COMMAND>) {
  // `payload` is of type `SomeType`, extracted from the command.
}
```

***

### CommonAncestorResult {#commonancestorresult}

> **CommonAncestorResult**\<`A`, `B`\> = [`CommonAncestorResultSame`](#commonancestorresultsame)\<`A`\> \| [`CommonAncestorResultAncestor`](#commonancestorresultancestor)\<`A` & [`ElementNode`](#elementnode)\> \| [`CommonAncestorResultDescendant`](#commonancestorresultdescendant)\<`B` & [`ElementNode`](#elementnode)\> \| [`CommonAncestorResultBranch`](#commonancestorresultbranch)\<`A`, `B`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:1332](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L1332)

The result of comparing two nodes that share some common ancestor

#### Type Parameters

##### A

`A` *extends* [`LexicalNode`](#lexicalnode)

##### B

`B` *extends* [`LexicalNode`](#lexicalnode)

***

### CreateEditorArgs {#createeditorargs}

> **CreateEditorArgs** = `object`

Defined in: [packages/lexical/src/LexicalEditor.ts:220](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L220)

#### Properties

##### disableEvents? {#disableevents}

> `optional` **disableEvents**: `boolean`

Defined in: [packages/lexical/src/LexicalEditor.ts:221](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L221)

##### editable? {#editable-2}

> `optional` **editable**: `boolean`

Defined in: [packages/lexical/src/LexicalEditor.ts:227](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L227)

##### editorState? {#editorstate-2}

> `optional` **editorState**: [`EditorState`](#editorstate)

Defined in: [packages/lexical/src/LexicalEditor.ts:222](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L222)

##### html? {#html-2}

> `optional` **html**: [`HTMLConfig`](#htmlconfig)

Defined in: [packages/lexical/src/LexicalEditor.ts:229](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L229)

##### namespace? {#namespace-2}

> `optional` **namespace**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:223](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L223)

##### nodes? {#nodes-2}

> `optional` **nodes**: `ReadonlyArray`\<[`LexicalNodeConfig`](#lexicalnodeconfig-4)\>

Defined in: [packages/lexical/src/LexicalEditor.ts:224](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L224)

##### onError? {#onerror-2}

> `optional` **onError**: `ErrorHandler`

Defined in: [packages/lexical/src/LexicalEditor.ts:225](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L225)

##### parentEditor? {#parenteditor-2}

> `optional` **parentEditor**: [`LexicalEditor`](#lexicaleditor)

Defined in: [packages/lexical/src/LexicalEditor.ts:226](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L226)

##### theme? {#theme-2}

> `optional` **theme**: [`EditorThemeClasses`](#editorthemeclasses)

Defined in: [packages/lexical/src/LexicalEditor.ts:228](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L228)

***

### DOMChildConversion() {#domchildconversion}

> **DOMChildConversion** = (`lexicalNode`, `parentLexicalNode`) => [`LexicalNode`](#lexicalnode) \| `null` \| `undefined`

Defined in: [packages/lexical/src/LexicalNode.ts:353](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L353)

#### Parameters

##### lexicalNode

[`LexicalNode`](#lexicalnode)

##### parentLexicalNode

[`LexicalNode`](#lexicalnode) | `null` | `undefined`

#### Returns

[`LexicalNode`](#lexicalnode) \| `null` \| `undefined`

***

### DOMConversion {#domconversion}

> **DOMConversion**\<`T`\> = `object`

Defined in: [packages/lexical/src/LexicalNode.ts:344](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L344)

#### Type Parameters

##### T

`T` *extends* `HTMLElement` = `HTMLElement`

#### Properties

##### conversion {#conversion}

> **conversion**: [`DOMConversionFn`](#domconversionfn)\<`T`\>

Defined in: [packages/lexical/src/LexicalNode.ts:345](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L345)

##### priority? {#priority}

> `optional` **priority**: `0` \| `1` \| `2` \| `3` \| `4`

Defined in: [packages/lexical/src/LexicalNode.ts:346](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L346)

***

### DOMConversionFn() {#domconversionfn}

> **DOMConversionFn**\<`T`\> = (`element`) => [`DOMConversionOutput`](#domconversionoutput) \| `null`

Defined in: [packages/lexical/src/LexicalNode.ts:349](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L349)

#### Type Parameters

##### T

`T` *extends* `HTMLElement` = `HTMLElement`

#### Parameters

##### element

`T`

#### Returns

[`DOMConversionOutput`](#domconversionoutput) \| `null`

***

### DOMConversionMap {#domconversionmap}

> **DOMConversionMap**\<`T`\> = `Record`\<`NodeName`, [`DOMConversionProp`](#domconversionprop)\<`T`\>\>

Defined in: [packages/lexical/src/LexicalNode.ts:358](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L358)

#### Type Parameters

##### T

`T` *extends* `HTMLElement` = `HTMLElement`

***

### DOMConversionOutput {#domconversionoutput}

> **DOMConversionOutput** = `object`

Defined in: [packages/lexical/src/LexicalNode.ts:364](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L364)

#### Properties

##### after()? {#after-1}

> `optional` **after**: (`childLexicalNodes`) => [`LexicalNode`](#lexicalnode)[]

Defined in: [packages/lexical/src/LexicalNode.ts:365](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L365)

###### Parameters

###### childLexicalNodes

[`LexicalNode`](#lexicalnode)[]

###### Returns

[`LexicalNode`](#lexicalnode)[]

##### forChild? {#forchild}

> `optional` **forChild**: [`DOMChildConversion`](#domchildconversion)

Defined in: [packages/lexical/src/LexicalNode.ts:366](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L366)

##### node {#node}

> **node**: `null` \| [`LexicalNode`](#lexicalnode) \| [`LexicalNode`](#lexicalnode)[]

Defined in: [packages/lexical/src/LexicalNode.ts:367](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L367)

***

### DOMConversionProp() {#domconversionprop}

> **DOMConversionProp**\<`T`\> = (`node`) => [`DOMConversion`](#domconversion)\<`T`\> \| `null`

Defined in: [packages/lexical/src/LexicalNode.ts:321](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L321)

#### Type Parameters

##### T

`T` *extends* `HTMLElement`

#### Parameters

##### node

`T`

#### Returns

[`DOMConversion`](#domconversion)\<`T`\> \| `null`

***

### DOMConversionPropByTagName {#domconversionpropbytagname}

> **DOMConversionPropByTagName**\<`K`\> = [`DOMConversionProp`](#domconversionprop)\<`K` *extends* keyof `HTMLElementTagNameMap` ? `HTMLElementTagNameMap`\[`K`\] : `HTMLElement`\>

Defined in: [packages/lexical/src/LexicalNode.ts:325](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L325)

#### Type Parameters

##### K

`K` *extends* `string`

***

### DOMConversionTagNameMap {#domconversiontagnamemap}

> **DOMConversionTagNameMap**\<`K`\> = `{ [NodeName in K]?: DOMConversionPropByTagName<NodeName> }`

Defined in: [packages/lexical/src/LexicalNode.ts:329](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L329)

#### Type Parameters

##### K

`K` *extends* `string`

***

### DOMExportOutput {#domexportoutput}

> **DOMExportOutput** = `object`

Defined in: [packages/lexical/src/LexicalNode.ts:375](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L375)

#### Properties

##### after()? {#after-2}

> `optional` **after**: (`generatedElement`) => `HTMLElement` \| `DocumentFragment` \| `Text` \| `null` \| `undefined`

Defined in: [packages/lexical/src/LexicalNode.ts:376](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L376)

###### Parameters

###### generatedElement

`HTMLElement` | `DocumentFragment` | `Text` | `null` | `undefined`

###### Returns

`HTMLElement` \| `DocumentFragment` \| `Text` \| `null` \| `undefined`

##### element {#element-1}

> **element**: `HTMLElement` \| `DocumentFragment` \| `Text` \| `null`

Defined in: [packages/lexical/src/LexicalNode.ts:379](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L379)

***

### DOMExportOutputMap {#domexportoutputmap}

> **DOMExportOutputMap** = `Map`\<[`Klass`](#klass)\<[`LexicalNode`](#lexicalnode)\>, (`editor`, `target`) => [`DOMExportOutput`](#domexportoutput)\>

Defined in: [packages/lexical/src/LexicalNode.ts:370](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L370)

***

### EditableListener() {#editablelistener}

> **EditableListener** = (`editable`) => `void` \| () => `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:358](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L358)

A listener that is called when [LexicalEditor.setEditable](#seteditable) changes the
editable state of the editor. If this callback returns a function,
that function will be called before the next value update or unregister.

#### Parameters

##### editable

`boolean`

#### Returns

`void` \| () => `void`

***

### EditorConfig {#editorconfig}

> **EditorConfig** = `object`

Defined in: [packages/lexical/src/LexicalEditor.ts:195](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L195)

#### Properties

##### disableEvents? {#disableevents-1}

> `optional` **disableEvents**: `boolean`

Defined in: [packages/lexical/src/LexicalEditor.ts:196](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L196)

##### namespace {#namespace-3}

> **namespace**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:197](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L197)

##### theme {#theme-3}

> **theme**: [`EditorThemeClasses`](#editorthemeclasses)

Defined in: [packages/lexical/src/LexicalEditor.ts:198](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L198)

***

### EditorSetOptions {#editorsetoptions}

> **EditorSetOptions** = `object`

Defined in: [packages/lexical/src/LexicalEditor.ts:119](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L119)

#### Properties

##### tag? {#tag}

> `optional` **tag**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:120](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L120)

***

### EditorThemeClassName {#editorthemeclassname}

> **EditorThemeClassName** = `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:75](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L75)

***

### EditorUpdateOptions {#editorupdateoptions}

> **EditorUpdateOptions** = `object`

Defined in: [packages/lexical/src/LexicalEditor.ts:94](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L94)

#### Properties

##### discrete? {#discrete}

> `optional` **discrete**: `true`

Defined in: [packages/lexical/src/LexicalEditor.ts:114](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L114)

If true, prevents this update from being batched, forcing it to
run synchronously.

##### onUpdate()? {#onupdate}

> `optional` **onUpdate**: () => `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:98](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L98)

A function to run once the update is complete. See also [$onUpdate](#onupdate-1).

###### Returns

`void`

##### skipTransforms? {#skiptransforms}

> `optional` **skipTransforms**: `true`

Defined in: [packages/lexical/src/LexicalEditor.ts:104](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L104)

Setting this to true will suppress all node
transforms for this update cycle.
Useful for synchronizing updates in some cases.

##### tag? {#tag-1}

> `optional` **tag**: [`UpdateTag`](#updatetag) \| [`UpdateTag`](#updatetag)[]

Defined in: [packages/lexical/src/LexicalEditor.ts:109](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L109)

A tag to identify this update, in an update listener, for instance.
See also [$addUpdateTag](#addupdatetag).

***

### ElementFormatType {#elementformattype}

> **ElementFormatType** = `"left"` \| `"start"` \| `"center"` \| `"right"` \| `"end"` \| `"justify"` \| `""`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:68](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L68)

***

### ElementPoint {#elementpoint}

> **ElementPoint** = `object`

Defined in: [packages/lexical/src/LexicalSelection.ts:114](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L114)

#### Properties

##### \_selection {#_selection-2}

> **\_selection**: [`BaseSelection`](#baseselection)

Defined in: [packages/lexical/src/LexicalSelection.ts:115](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L115)

##### getNode() {#getnode-2}

> **getNode**: () => [`ElementNode`](#elementnode)

Defined in: [packages/lexical/src/LexicalSelection.ts:116](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L116)

###### Returns

[`ElementNode`](#elementnode)

##### is() {#is-16}

> **is**: (`point`) => `boolean`

Defined in: [packages/lexical/src/LexicalSelection.ts:117](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L117)

###### Parameters

###### point

[`PointType`](#pointtype-1)

###### Returns

`boolean`

##### isBefore() {#isbefore-10}

> **isBefore**: (`point`) => `boolean`

Defined in: [packages/lexical/src/LexicalSelection.ts:118](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L118)

###### Parameters

###### point

[`PointType`](#pointtype-1)

###### Returns

`boolean`

##### key {#key-2}

> **key**: [`NodeKey`](#nodekey)

Defined in: [packages/lexical/src/LexicalSelection.ts:119](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L119)

##### offset {#offset-2}

> **offset**: `number`

Defined in: [packages/lexical/src/LexicalSelection.ts:120](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L120)

##### set() {#set-2}

> **set**: (`key`, `offset`, `type`, `onlyIfChanged?`) => `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:121](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L121)

###### Parameters

###### key

[`NodeKey`](#nodekey)

###### offset

`number`

###### type

`"text"` | `"element"`

###### onlyIfChanged?

`boolean`

###### Returns

`void`

##### type {#type-14}

> **type**: `"element"`

Defined in: [packages/lexical/src/LexicalSelection.ts:127](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L127)

***

### EventHandler() {#eventhandler}

> **EventHandler** = (`event`, `editor`) => `void`

Defined in: [packages/lexical/src/LexicalEvents.ts:1391](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEvents.ts#L1391)

#### Parameters

##### event

`Event`

##### editor

[`LexicalEditor`](#lexicaleditor)

#### Returns

`void`

***

### ExtensionConfigBase {#extensionconfigbase}

> **ExtensionConfigBase** = `Record`\<`never`, `never`\>

Defined in: [packages/lexical/src/extension-core/types.ts:32](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L32)

The default extension configuration of an empty object

***

### FlipDirection {#flipdirection}

> **FlipDirection**\<`D`\> = *typeof* `FLIP_DIRECTION`\[`D`\]

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:26](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L26)

A type utility to flip next and previous

#### Type Parameters

##### D

`D` *extends* [`CaretDirection`](#caretdirection)

***

### HTMLConfig {#htmlconfig}

> **HTMLConfig** = `object`

Defined in: [packages/lexical/src/LexicalEditor.ts:210](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L210)

#### Properties

##### export? {#export}

> `optional` **export**: [`DOMExportOutputMap`](#domexportoutputmap)

Defined in: [packages/lexical/src/LexicalEditor.ts:211](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L211)

##### import? {#import}

> `optional` **import**: [`DOMConversionMap`](#domconversionmap)

Defined in: [packages/lexical/src/LexicalEditor.ts:212](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L212)

***

### InitialEditorStateType {#initialeditorstatetype}

> **InitialEditorStateType** = `null` \| `string` \| [`EditorState`](#editorstate) \| (`editor`) => `void`

Defined in: [packages/lexical/src/extension-core/types.ts:351](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L351)

All of the possible ways to initialize $initialEditorState:
- `null` an empty state, the default
- `string` an EditorState serialized to JSON
- `EditorState` an EditorState that has been deserialized already (not just parsed JSON)
- `((editor: LexicalEditor) => void)` A function that is called with the editor for you to mutate it

***

### Klass {#klass}

> **Klass**\<`T`\> = `InstanceType`\<`T`\[`"constructor"`\]\> *extends* `T` ? `T`\[`"constructor"`\] : `GenericConstructor`\<`T`\> & `T`\[`"constructor"`\]

Defined in: [packages/lexical/src/LexicalEditor.ts:70](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L70)

#### Type Parameters

##### T

`T` *extends* [`LexicalNode`](#lexicalnode)

***

### KlassConstructor {#klassconstructor}

> **KlassConstructor**\<`Cls`\> = `GenericConstructor`\<`InstanceType`\<`Cls`\>\> & `{ [k in keyof Cls]: Cls[k] }`

Defined in: [packages/lexical/src/LexicalEditor.ts:65](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L65)

#### Type Parameters

##### Cls

`Cls` *extends* `GenericConstructor`\<`any`\>

***

### LexicalCommand {#lexicalcommand}

> **LexicalCommand**\<`TPayload`\> = `object`

Defined in: [packages/lexical/src/LexicalEditor.ts:369](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L369)

#### Type Parameters

##### TPayload

`TPayload`

#### Properties

##### type? {#type-15}

> `optional` **type**: `string`

Defined in: [packages/lexical/src/LexicalEditor.ts:370](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L370)

***

### LexicalExportJSON {#lexicalexportjson}

> **LexicalExportJSON**\<`T`\> = `Prettify`\<`Omit`\<`ReturnType`\<`T`\[`"exportJSON"`\]\>, `"type"`\> & `object` & [`NodeStateJSON`](#nodestatejson)\<`T`\>\>

Defined in: [packages/lexical/src/LexicalNode.ts:228](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L228)

The most precise type we can infer for the JSON that will
be produced by T.exportJSON().

Do not use this for the return type of T.exportJSON()! It must be
a more generic type to be compatible with subclassing.

#### Type Parameters

##### T

`T` *extends* [`LexicalNode`](#lexicalnode)

***

### LexicalExtensionArgument {#lexicalextensionargument}

> **LexicalExtensionArgument**\<`Config`, `Name`, `Output`, `Init`\> = [`LexicalExtension`](#lexicalextension)\<`Config`, `Name`, `Output`, `Init`\> \| [`NormalizedLexicalExtensionArgument`](#normalizedlexicalextensionargument)\<`Config`, `Name`, `Output`, `Init`\>

Defined in: [packages/lexical/src/extension-core/types.ts:139](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L139)

A [LexicalExtension](#lexicalextension) or [NormalizedLexicalExtensionArgument](#normalizedlexicalextensionargument) (extension with config overrides)

#### Type Parameters

##### Config

`Config` *extends* [`ExtensionConfigBase`](#extensionconfigbase)

##### Name

`Name` *extends* `string`

##### Output

`Output`

##### Init

`Init`

***

### LexicalExtensionConfig {#lexicalextensionconfig-2}

> **LexicalExtensionConfig**\<`Extension`\> = `NonNullable`\<`Extension`\[`configTypeSymbol`\]\>

Defined in: [packages/lexical/src/extension-core/types.ts:292](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L292)

Extract the Config type from an Extension

#### Type Parameters

##### Extension

`Extension` *extends* [`AnyLexicalExtension`](#anylexicalextension)

***

### LexicalExtensionInit {#lexicalextensioninit-2}

> **LexicalExtensionInit**\<`Extension`\> = `NonNullable`\<`Extension`\[`initTypeSymbol`\]\>

Defined in: [packages/lexical/src/extension-core/types.ts:310](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L310)

Extract the Init type from an Extension

#### Type Parameters

##### Extension

`Extension` *extends* [`AnyLexicalExtension`](#anylexicalextension)

***

### LexicalExtensionName {#lexicalextensionname-2}

> **LexicalExtensionName**\<`Extension`\> = `Extension`\[`"name"`\]

Defined in: [packages/lexical/src/extension-core/types.ts:298](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L298)

Extract the Name type from an Extension

#### Type Parameters

##### Extension

`Extension` *extends* [`AnyLexicalExtension`](#anylexicalextension)

***

### LexicalExtensionOutput {#lexicalextensionoutput-1}

> **LexicalExtensionOutput**\<`Extension`\> = `NonNullable`\<`Extension`\[`outputTypeSymbol`\]\>

Defined in: [packages/lexical/src/extension-core/types.ts:304](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L304)

Extract the Output type from an Extension

#### Type Parameters

##### Extension

`Extension` *extends* [`AnyLexicalExtension`](#anylexicalextension)

***

### LexicalNodeConfig {#lexicalnodeconfig-4}

> **LexicalNodeConfig** = [`Klass`](#klass)\<[`LexicalNode`](#lexicalnode)\> \| [`LexicalNodeReplacement`](#lexicalnodereplacement)

Defined in: [packages/lexical/src/LexicalEditor.ts:218](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L218)

A LexicalNode class or LexicalNodeReplacement configuration

***

### LexicalNodeReplacement {#lexicalnodereplacement}

> **LexicalNodeReplacement** = `object`

Defined in: [packages/lexical/src/LexicalEditor.ts:201](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L201)

#### Properties

##### replace {#replace-10}

> **replace**: [`Klass`](#klass)\<[`LexicalNode`](#lexicalnode)\>

Defined in: [packages/lexical/src/LexicalEditor.ts:202](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L202)

##### with() {#with}

> **with**: \<`T`\>(`node`) => [`LexicalNode`](#lexicalnode)

Defined in: [packages/lexical/src/LexicalEditor.ts:204](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L204)

###### Type Parameters

###### T

`T` *extends* (...`args`) => `any`

###### Parameters

###### node

`InstanceType`\<`T`\>

###### Returns

[`LexicalNode`](#lexicalnode)

##### withKlass? {#withklass}

> `optional` **withKlass**: [`Klass`](#klass)\<[`LexicalNode`](#lexicalnode)\>

Defined in: [packages/lexical/src/LexicalEditor.ts:207](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L207)

***

### LexicalUpdateJSON {#lexicalupdatejson}

> **LexicalUpdateJSON**\<`T`\> = `Omit`\<`T`, `"children"` \| `"type"` \| `"version"`\>

Defined in: [packages/lexical/src/LexicalNode.ts:237](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L237)

Omit the children, type, and version properties from the given SerializedLexicalNode definition.

#### Type Parameters

##### T

`T` *extends* [`SerializedLexicalNode`](#serializedlexicalnode)

***

### MutationListener() {#mutationlistener}

> **MutationListener** = (`nodes`, `payload`) => `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:342](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L342)

#### Parameters

##### nodes

`Map`\<[`NodeKey`](#nodekey), [`NodeMutation`](#nodemutation)\>

##### payload

###### dirtyLeaves

`Set`\<`string`\>

###### prevEditorState

[`EditorState`](#editorstate)

###### updateTags

`Set`\<`string`\>

#### Returns

`void`

***

### NodeCaret {#nodecaret}

> **NodeCaret**\<`D`\> = [`SiblingCaret`](#siblingcaret)\<[`LexicalNode`](#lexicalnode), `D`\> \| [`ChildCaret`](#childcaret)\<[`ElementNode`](#elementnode), `D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:150](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L150)

A NodeCaret is the combination of an origin node and a direction
that points towards where a connected node will be fetched, inserted,
or replaced. A SiblingCaret points from a node to its next or previous
sibling, and a ChildCaret points to its first or last child
(using next or previous as direction, for symmetry with SiblingCaret).

The differences between NodeCaret and PointType are:
- NodeCaret can only be used to refer to an entire node (PointCaret is used when a full analog is needed). A PointType of text type can be used to refer to a specific location inside of a TextNode.
- NodeCaret stores an origin node, type (sibling or child), and direction (next or previous). A PointType stores a type (text or element), the key of a node, and a text or child offset within that node.
- NodeCaret is directional and always refers to a very specific node, eliminating all ambiguity. PointType can refer to the location before or at a node depending on context.
- NodeCaret is more robust to nearby mutations, as it relies only on a node's direct connections. An element Any change to the count of previous siblings in an element PointType will invalidate it.
- NodeCaret is designed to work more directly with the internal representation of the document tree, making it suitable for use in traversals without performing any redundant work.

The caret does *not* update in response to any mutations, you should
not persist it across editor updates, and using a caret after its origin
node has been removed or replaced may result in runtime errors.

#### Type Parameters

##### D

`D` *extends* [`CaretDirection`](#caretdirection) = [`CaretDirection`](#caretdirection)

***

### NodeKey {#nodekey}

> **NodeKey** = `string`

Defined in: [packages/lexical/src/LexicalNode.ts:382](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L382)

***

### NodeMap {#nodemap}

> **NodeMap** = `Map`\<[`NodeKey`](#nodekey), [`LexicalNode`](#lexicalnode)\>

Defined in: [packages/lexical/src/LexicalNode.ts:69](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L69)

***

### NodeMutation {#nodemutation}

> **NodeMutation** = `"created"` \| `"updated"` \| `"destroyed"`

Defined in: [packages/lexical/src/LexicalEditor.ts:254](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L254)

***

### NodeStateJSON {#nodestatejson}

> **NodeStateJSON**\<`T`\> = `Prettify`\<`object` & `CollectStateJSON`\<`GetNodeStateConfig`\<`T`\>, `true`\>\>

Defined in: [packages/lexical/src/LexicalNodeState.ts:142](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNodeState.ts#L142)

The NodeState JSON produced by this LexicalNode

#### Type Parameters

##### T

`T` *extends* [`LexicalNode`](#lexicalnode)

***

### NormalizedLexicalExtensionArgument {#normalizedlexicalextensionargument}

> **NormalizedLexicalExtensionArgument**\<`Config`, `Name`, `Output`, `Init`\> = \[[`LexicalExtension`](#lexicalextension)\<`Config`, `Name`, `Output`, `Init`\>, `...Partial<Config>[]`\]

Defined in: [packages/lexical/src/extension-core/types.ts:45](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L45)

A tuple of `[extension, ...configOverrides]`

#### Type Parameters

##### Config

`Config` *extends* [`ExtensionConfigBase`](#extensionconfigbase)

##### Name

`Name` *extends* `string`

##### Output

`Output`

##### Init

`Init`

***

### NormalizedPeerDependency {#normalizedpeerdependency}

> **NormalizedPeerDependency**\<`Extension`\> = \[`Extension`\[`"name"`\], `Partial`\<[`LexicalExtensionConfig`](#lexicalextensionconfig-2)\<`Extension`\>\> \| `undefined`\] & `object`

Defined in: [packages/lexical/src/extension-core/types.ts:37](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L37)

The result of [declarePeerDependency](#declarepeerdependency), a tuple of a peer dependency
name and its associated configuration.

#### Type Declaration

##### \[peerDependencySymbol\]?

> `readonly` `optional` **\[peerDependencySymbol\]**: `Extension`

#### Type Parameters

##### Extension

`Extension` *extends* [`AnyLexicalExtension`](#anylexicalextension)

***

### OutputComponentExtension {#outputcomponentextension}

> **OutputComponentExtension**\<`ComponentType`\> = [`OutputExtension`](#outputextension)\<\{ `Component`: `ComponentType`; \}\>

Defined in: [packages/lexical/src/extension-core/types.ts:316](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L316)

An Extension that has an OutputComponent of the given type (e.g. React.ComponentType)

#### Type Parameters

##### ComponentType

`ComponentType`

***

### OutputExtension {#outputextension}

> **OutputExtension**\<`Output`\> = [`LexicalExtension`](#lexicalextension)\<`any`, `any`, `Output`, `any`\>

Defined in: [packages/lexical/src/extension-core/types.ts:323](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/types.ts#L323)

An Extension that has an Output of the given type

#### Type Parameters

##### Output

`Output`

***

### PasteCommandType {#pastecommandtype}

> **PasteCommandType** = `ClipboardEvent` \| `InputEvent` \| `KeyboardEvent`

Defined in: [packages/lexical/src/LexicalCommands.ts:15](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L15)

***

### PointCaret {#pointcaret}

> **PointCaret**\<`D`\> = [`TextPointCaret`](#textpointcaret)\<[`TextNode`](#textnode), `D`\> \| [`SiblingCaret`](#siblingcaret)\<[`LexicalNode`](#lexicalnode), `D`\> \| [`ChildCaret`](#childcaret)\<[`ElementNode`](#elementnode), `D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:166](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L166)

A PointCaret is a NodeCaret that also includes a
TextPointCaret type which refers to a specific offset of a TextNode.
This type is separate because it is not relevant to general node traversal
so it doesn't make sense to have it show up except when defining
a CaretRange and in those cases there will be at most two of them only
at the boundaries.

The addition of TextPointCaret allows this type to represent any location
that is representable by PointType, as the TextPointCaret refers to a
specific offset within a TextNode.

#### Type Parameters

##### D

`D` *extends* [`CaretDirection`](#caretdirection) = [`CaretDirection`](#caretdirection)

***

### PointType {#pointtype-1}

> **PointType** = [`TextPoint`](#textpoint) \| [`ElementPoint`](#elementpoint)

Defined in: [packages/lexical/src/LexicalSelection.ts:130](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L130)

***

### RootListener() {#rootlistener}

> **RootListener** = (`rootElement`, `prevRootElement`) => `void` \| () => `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:335](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L335)

A listener that is called when [LexicalEditor.setRootElement](#setrootelement) changes the
element that the editor is attached to. If this callback returns a function,
that function will be called before the next value update or unregister.

#### Parameters

##### rootElement

`null` | `HTMLElement`

##### prevRootElement

`null` | `HTMLElement`

#### Returns

`void` \| () => `void`

***

### RootMode {#rootmode-1}

> **RootMode** = `"root"` \| `"shadowRoot"`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:39](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L39)

The RootMode is specified in all caret traversals where the traversal can go up
towards the root. 'root' means that it will stop at the document root,
and 'shadowRoot' will stop at the document root or any shadow root
(per [$isRootOrShadowRoot](#isrootorshadowroot)).

***

### SerializedEditor {#serializededitor}

> **SerializedEditor** = `object`

Defined in: [packages/lexical/src/LexicalEditor.ts:437](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L437)

#### Properties

##### editorState {#editorstate-3}

> **editorState**: [`SerializedEditorState`](#serializededitorstate)

Defined in: [packages/lexical/src/LexicalEditor.ts:438](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L438)

***

### SerializedElementNode {#serializedelementnode}

> **SerializedElementNode**\<`T`\> = [`Spread`](#spread)\<\{ `children`: `T`[]; `direction`: `"ltr"` \| `"rtl"` \| `null`; `format`: [`ElementFormatType`](#elementformattype); `indent`: `number`; `textFormat?`: `number`; `textStyle?`: `string`; \}, [`SerializedLexicalNode`](#serializedlexicalnode)\>

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:54](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L54)

#### Type Parameters

##### T

`T` *extends* [`SerializedLexicalNode`](#serializedlexicalnode) = [`SerializedLexicalNode`](#serializedlexicalnode)

***

### SerializedLexicalNode {#serializedlexicalnode}

> **SerializedLexicalNode** = `object`

Defined in: [packages/lexical/src/LexicalNode.ts:74](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L74)

The base type for all serialized nodes

#### Properties

##### $?

> `optional` **$**: `Record`\<`string`, `unknown`\>

Defined in: [packages/lexical/src/LexicalNode.ts:83](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L83)

Any state persisted with the NodeState API that is not
configured for flat storage

##### type {#type-16}

> **type**: `string`

Defined in: [packages/lexical/src/LexicalNode.ts:76](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L76)

The type string used by the Node class

##### version {#version}

> **version**: `number`

Defined in: [packages/lexical/src/LexicalNode.ts:78](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L78)

A numeric version for this schema, defaulting to 1, but not generally recommended for use

***

### SerializedLineBreakNode {#serializedlinebreaknode}

> **SerializedLineBreakNode** = [`SerializedLexicalNode`](#serializedlexicalnode)

Defined in: [packages/lexical/src/nodes/LexicalLineBreakNode.ts:24](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalLineBreakNode.ts#L24)

***

### SerializedParagraphNode {#serializedparagraphnode}

> **SerializedParagraphNode** = [`Spread`](#spread)\<\{ `textFormat`: `number`; `textStyle`: `string`; \}, [`SerializedElementNode`](#serializedelementnode)\>

Defined in: [packages/lexical/src/nodes/LexicalParagraphNode.ts:37](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalParagraphNode.ts#L37)

***

### SerializedRootNode {#serializedrootnode}

> **SerializedRootNode**\<`T`\> = [`SerializedElementNode`](#serializedelementnode)\<`T`\>

Defined in: [packages/lexical/src/nodes/LexicalRootNode.ts:20](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalRootNode.ts#L20)

#### Type Parameters

##### T

`T` *extends* [`SerializedLexicalNode`](#serializedlexicalnode) = [`SerializedLexicalNode`](#serializedlexicalnode)

***

### SerializedTabNode {#serializedtabnode}

> **SerializedTabNode** = [`SerializedTextNode`](#serializedtextnode)

Defined in: [packages/lexical/src/nodes/LexicalTabNode.ts:25](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTabNode.ts#L25)

***

### SerializedTextNode {#serializedtextnode}

> **SerializedTextNode** = [`Spread`](#spread)\<\{ `detail`: `number`; `format`: `number`; `mode`: [`TextModeType`](#textmodetype); `style`: `string`; `text`: `string`; \}, [`SerializedLexicalNode`](#serializedlexicalnode)\>

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:77](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L77)

***

### Spread {#spread}

> **Spread**\<`T1`, `T2`\> = `Omit`\<`T2`, keyof `T1`\> & `T1`

Defined in: [packages/lexical/src/LexicalEditor.ts:61](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L61)

#### Type Parameters

##### T1

`T1`

##### T2

`T2`

***

### StateConfigKey {#stateconfigkey-1}

> **StateConfigKey**\<`S`\> = `S` *extends* [`StateConfig`](#stateconfig)\<infer K, infer \_V\> ? `K` : `never`

Defined in: [packages/lexical/src/LexicalNodeState.ts:34](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNodeState.ts#L34)

Get the key type (K) from a StateConfig

#### Type Parameters

##### S

`S` *extends* [`AnyStateConfig`](#anystateconfig)

***

### StateConfigValue {#stateconfigvalue}

> **StateConfigValue**\<`S`\> = `S` *extends* [`StateConfig`](#stateconfig)\<infer \_K, infer V\> ? `V` : `never`

Defined in: [packages/lexical/src/LexicalNodeState.ts:29](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNodeState.ts#L29)

Get the value type (V) from a StateConfig

#### Type Parameters

##### S

`S` *extends* [`AnyStateConfig`](#anystateconfig)

***

### StateValueOrUpdater {#statevalueorupdater}

> **StateValueOrUpdater**\<`Cfg`\> = [`ValueOrUpdater`](#valueorupdater)\<[`StateConfigValue`](#stateconfigvalue)\<`Cfg`\>\>

Defined in: [packages/lexical/src/LexicalNodeState.ts:57](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNodeState.ts#L57)

A type alias to make it easier to define setter methods on your node class

#### Type Parameters

##### Cfg

`Cfg` *extends* [`AnyStateConfig`](#anystateconfig)

#### Example

```ts
const fooState = createState("foo", { parse: ... });
class MyClass extends TextNode {
  // ...
  setFoo(valueOrUpdater: StateValueOrUpdater<typeof fooState>): this {
    return $setState(this, fooState, valueOrUpdater);
  }
}
```

***

### StaticNodeConfig {#staticnodeconfig}

> **StaticNodeConfig**\<`T`, `Type`\> = [`BaseStaticNodeConfig`](#basestaticnodeconfig) & `{ readonly [K in Type]?: StaticNodeConfigValue<T, Type> }`

Defined in: [packages/lexical/src/LexicalNode.ts:178](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L178)

Used to extract the node and type from a StaticNodeConfigRecord

#### Type Parameters

##### T

`T` *extends* [`LexicalNode`](#lexicalnode)

##### Type

`Type` *extends* `string`

***

### TextFormatType {#textformattype}

> **TextFormatType** = `"bold"` \| `"underline"` \| `"strikethrough"` \| `"italic"` \| `"highlight"` \| `"code"` \| `"subscript"` \| `"superscript"` \| `"lowercase"` \| `"uppercase"` \| `"capitalize"`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:90](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L90)

***

### TextModeType {#textmodetype}

> **TextModeType** = `"normal"` \| `"token"` \| `"segmented"`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:103](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L103)

***

### TextPoint {#textpoint}

> **TextPoint** = `object`

Defined in: [packages/lexical/src/LexicalSelection.ts:98](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L98)

#### Properties

##### \_selection {#_selection-3}

> **\_selection**: [`BaseSelection`](#baseselection)

Defined in: [packages/lexical/src/LexicalSelection.ts:99](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L99)

##### getNode() {#getnode-3}

> **getNode**: () => [`TextNode`](#textnode)

Defined in: [packages/lexical/src/LexicalSelection.ts:100](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L100)

###### Returns

[`TextNode`](#textnode)

##### is() {#is-17}

> **is**: (`point`) => `boolean`

Defined in: [packages/lexical/src/LexicalSelection.ts:101](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L101)

###### Parameters

###### point

[`PointType`](#pointtype-1)

###### Returns

`boolean`

##### isBefore() {#isbefore-11}

> **isBefore**: (`point`) => `boolean`

Defined in: [packages/lexical/src/LexicalSelection.ts:102](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L102)

###### Parameters

###### point

[`PointType`](#pointtype-1)

###### Returns

`boolean`

##### key {#key-3}

> **key**: [`NodeKey`](#nodekey)

Defined in: [packages/lexical/src/LexicalSelection.ts:103](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L103)

##### offset {#offset-3}

> **offset**: `number`

Defined in: [packages/lexical/src/LexicalSelection.ts:104](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L104)

##### set() {#set-3}

> **set**: (`key`, `offset`, `type`, `onlyIfChanged?`) => `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:105](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L105)

###### Parameters

###### key

[`NodeKey`](#nodekey)

###### offset

`number`

###### type

`"text"` | `"element"`

###### onlyIfChanged?

`boolean`

###### Returns

`void`

##### type {#type-18}

> **type**: `"text"`

Defined in: [packages/lexical/src/LexicalSelection.ts:111](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L111)

***

### TextPointCaretSliceTuple {#textpointcaretslicetuple}

> **TextPointCaretSliceTuple**\<`D`\> = readonly \[`null` \| [`TextPointCaretSlice`](#textpointcaretslice)\<[`TextNode`](#textnode), `D`\>, `null` \| [`TextPointCaretSlice`](#textpointcaretslice)\<[`TextNode`](#textnode), `D`\>\]

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:371](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L371)

A utility type to specify that a CaretRange may have zero,
one, or two associated TextPointCaretSlice. If the anchor
and focus are on the same node, the anchorSlice will contain
the slice and focusSlie will be null.

#### Type Parameters

##### D

`D` *extends* [`CaretDirection`](#caretdirection)

***

### Transform() {#transform-7}

> **Transform**\<`T`\> = (`node`) => `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:246](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L246)

#### Type Parameters

##### T

`T` *extends* [`LexicalNode`](#lexicalnode)

#### Parameters

##### node

`T`

#### Returns

`void`

***

### UpdateListener() {#updatelistener}

> **UpdateListener** = (`payload`) => `void`

Defined in: [packages/lexical/src/LexicalEditor.ts:324](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L324)

A listener that gets called after the editor is updated

#### Parameters

##### payload

[`UpdateListenerPayload`](#updatelistenerpayload)

#### Returns

`void`

***

### UpdateTag {#updatetag}

> **UpdateTag** = *typeof* [`COLLABORATION_TAG`](#collaboration_tag) \| *typeof* `FOCUS_TAG` \| *typeof* [`HISTORIC_TAG`](#historic_tag) \| *typeof* [`HISTORY_MERGE_TAG`](#history_merge_tag) \| *typeof* [`HISTORY_PUSH_TAG`](#history_push_tag) \| *typeof* [`PASTE_TAG`](#paste_tag) \| *typeof* [`SKIP_COLLAB_TAG`](#skip_collab_tag) \| *typeof* [`SKIP_DOM_SELECTION_TAG`](#skip_dom_selection_tag) \| *typeof* [`SKIP_SCROLL_INTO_VIEW_TAG`](#skip_scroll_into_view_tag) \| *typeof* [`COMPOSITION_START_TAG`](#composition_start_tag) \| *typeof* [`COMPOSITION_END_TAG`](#composition_end_tag) \| `string` & `object`

Defined in: [packages/lexical/src/LexicalUpdateTags.ts:79](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUpdateTags.ts#L79)

The set of known update tags to help with TypeScript suggestions.

***

### ValueOrUpdater {#valueorupdater}

> **ValueOrUpdater**\<`V`\> = `V` \| (`prevValue`) => `V`

Defined in: [packages/lexical/src/LexicalNodeState.ts:41](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNodeState.ts#L41)

A value type, or an updater for that value type. For use with
[$setState](#setstate) or any user-defined wrappers around it.

#### Type Parameters

##### V

`V`

## Variables

### $findMatchingParent() {#findmatchingparent}

> `const` **$findMatchingParent**: \{\<`T`\>(`startingNode`, `findFn`): `null` \| `T`; (`startingNode`, `findFn`): `null` \| [`LexicalNode`](#lexicalnode); \}

Defined in: [packages/lexical/src/LexicalUtils.ts:2235](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L2235)

Starts with a node and moves up the tree (toward the root node) to find a matching node based on
the search parameters of the findFn. (Consider JavaScripts' .find() function where a testing function must be
passed as an argument. eg. if( (node) => node.__type === 'div') ) return true; otherwise return false

#### Call Signature

> \<`T`\>(`startingNode`, `findFn`): `null` \| `T`

##### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

##### Parameters

###### startingNode

[`LexicalNode`](#lexicalnode)

###### findFn

(`node`) => `node is T`

##### Returns

`null` \| `T`

#### Call Signature

> (`startingNode`, `findFn`): `null` \| [`LexicalNode`](#lexicalnode)

##### Parameters

###### startingNode

[`LexicalNode`](#lexicalnode)

###### findFn

(`node`) => `boolean`

##### Returns

`null` \| [`LexicalNode`](#lexicalnode)

#### Param

The node where the search starts.

#### Param

A testing function that returns true if the current node satisfies the testing parameters.

#### Returns

`startingNode` or one of its ancestors that matches the `findFn` predicate and is not the `RootNode`, or `null` if no match was found.

***

### BEFORE\_INPUT\_COMMAND {#before_input_command}

> `const` **BEFORE\_INPUT\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`InputEvent`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:40](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L40)

***

### BLUR\_COMMAND {#blur_command}

> `const` **BLUR\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`FocusEvent`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:231](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L231)

***

### CAN\_REDO\_COMMAND {#can_redo_command}

> `const` **CAN\_REDO\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`boolean`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:225](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L225)

***

### CAN\_UNDO\_COMMAND {#can_undo_command}

> `const` **CAN\_UNDO\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`boolean`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:227](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L227)

***

### CLEAR\_EDITOR\_COMMAND {#clear_editor_command}

> `const` **CLEAR\_EDITOR\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`void`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:219](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L219)

***

### CLEAR\_HISTORY\_COMMAND {#clear_history_command}

> `const` **CLEAR\_HISTORY\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`void`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:222](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L222)

***

### CLICK\_COMMAND {#click_command}

> `const` **CLICK\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`MouseEvent`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:38](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L38)

***

### COLLABORATION\_TAG {#collaboration_tag}

> `const` **COLLABORATION\_TAG**: `"collaboration"` = `'collaboration'`

Defined in: [packages/lexical/src/LexicalUpdateTags.ts:37](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUpdateTags.ts#L37)

Indicates that the update is related to collaborative editing

***

### COMMAND\_PRIORITY\_CRITICAL {#command_priority_critical}

> `const` **COMMAND\_PRIORITY\_CRITICAL**: `4` = `4`

Defined in: [packages/lexical/src/LexicalEditor.ts:366](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L366)

***

### COMMAND\_PRIORITY\_EDITOR {#command_priority_editor}

> `const` **COMMAND\_PRIORITY\_EDITOR**: `0` = `0`

Defined in: [packages/lexical/src/LexicalEditor.ts:362](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L362)

***

### COMMAND\_PRIORITY\_HIGH {#command_priority_high}

> `const` **COMMAND\_PRIORITY\_HIGH**: `3` = `3`

Defined in: [packages/lexical/src/LexicalEditor.ts:365](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L365)

***

### COMMAND\_PRIORITY\_LOW {#command_priority_low}

> `const` **COMMAND\_PRIORITY\_LOW**: `1` = `1`

Defined in: [packages/lexical/src/LexicalEditor.ts:363](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L363)

***

### COMMAND\_PRIORITY\_NORMAL {#command_priority_normal}

> `const` **COMMAND\_PRIORITY\_NORMAL**: `2` = `2`

Defined in: [packages/lexical/src/LexicalEditor.ts:364](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L364)

***

### COMPOSITION\_END\_COMMAND {#composition_end_command}

> `const` **COMPOSITION\_END\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`CompositionEvent`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:47](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L47)

***

### COMPOSITION\_END\_TAG {#composition_end_tag}

> `const` **COMPOSITION\_END\_TAG**: `"composition-end"` = `'composition-end'`

Defined in: [packages/lexical/src/LexicalUpdateTags.ts:74](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUpdateTags.ts#L74)

The update was triggered by composition-end

***

### COMPOSITION\_START\_COMMAND {#composition_start_command}

> `const` **COMPOSITION\_START\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`CompositionEvent`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:45](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L45)

***

### COMPOSITION\_START\_TAG {#composition_start_tag}

> `const` **COMPOSITION\_START\_TAG**: `"composition-start"` = `'composition-start'`

Defined in: [packages/lexical/src/LexicalUpdateTags.ts:69](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUpdateTags.ts#L69)

The update was triggered by composition-start

***

### CONTROLLED\_TEXT\_INSERTION\_COMMAND {#controlled_text_insertion_command}

> `const` **CONTROLLED\_TEXT\_INSERTION\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`InputEvent` \| `string`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:68](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L68)

***

### COPY\_COMMAND {#copy_command}

> `const` **COPY\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`ClipboardEvent` \| `KeyboardEvent` \| `null`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:203](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L203)

Dispatched on a copy event, either via the clipboard or a KeyboardEvent
(Cmd+C on macOS, Ctrl+C elsewhere).

***

### CUT\_COMMAND {#cut_command}

> `const` **CUT\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`ClipboardEvent` \| `KeyboardEvent` \| `null`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:210](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L210)

Dispatched on a cut event, either via the clipboard or a KeyboardEvent
(Cmd+X on macOS, Ctrl+X elsewhere).

***

### DELETE\_CHARACTER\_COMMAND {#delete_character_command}

> `const` **DELETE\_CHARACTER\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`boolean`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:54](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L54)

Dispatched to delete a character, the payload will be `true` if the deletion
is backwards (backspace or delete on macOS) and `false` if forwards
(delete or Fn+Delete on macOS).

***

### DELETE\_LINE\_COMMAND {#delete_line_command}

> `const` **DELETE\_LINE\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`boolean`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:88](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L88)

Dispatched to delete a line, the payload will be `true` if the deletion is
backwards (Cmd+Delete on macOS), and `false` if forwards
(Fn+Cmd+Delete on macOS).

***

### DELETE\_WORD\_COMMAND {#delete_word_command}

> `const` **DELETE\_WORD\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`boolean`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:80](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L80)

Dispatched to delete a word, the payload will be `true` if the deletion is
backwards (Ctrl+Backspace or Opt+Delete on macOS), and `false` if
forwards (Ctrl+Delete or Fn+Opt+Delete on macOS).

***

### DRAGEND\_COMMAND {#dragend_command}

> `const` **DRAGEND\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`DragEvent`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:197](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L197)

***

### DRAGOVER\_COMMAND {#dragover_command}

> `const` **DRAGOVER\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`DragEvent`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:195](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L195)

***

### DRAGSTART\_COMMAND {#dragstart_command}

> `const` **DRAGSTART\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`DragEvent`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:193](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L193)

***

### DROP\_COMMAND {#drop_command}

> `const` **DROP\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`DragEvent`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:189](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L189)

***

### FOCUS\_COMMAND {#focus_command}

> `const` **FOCUS\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`FocusEvent`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:229](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L229)

***

### FORMAT\_ELEMENT\_COMMAND {#format_element_command}

> `const` **FORMAT\_ELEMENT\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<[`ElementFormatType`](#elementformattype)\>

Defined in: [packages/lexical/src/LexicalCommands.ts:191](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L191)

***

### FORMAT\_TEXT\_COMMAND {#format_text_command}

> `const` **FORMAT\_TEXT\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<[`TextFormatType`](#textformattype)\>

Defined in: [packages/lexical/src/LexicalCommands.ts:94](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L94)

Dispatched to format the selected text.

***

### HISTORIC\_TAG {#historic_tag}

> `const` **HISTORIC\_TAG**: `"historic"` = `'historic'`

Defined in: [packages/lexical/src/LexicalUpdateTags.ts:17](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUpdateTags.ts#L17)

Indicates that the update is related to history operations (undo/redo)

***

### HISTORY\_MERGE\_TAG {#history_merge_tag}

> `const` **HISTORY\_MERGE\_TAG**: `"history-merge"` = `'history-merge'`

Defined in: [packages/lexical/src/LexicalUpdateTags.ts:27](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUpdateTags.ts#L27)

Indicates that the current update should be merged with the previous history entry

***

### HISTORY\_PUSH\_TAG {#history_push_tag}

> `const` **HISTORY\_PUSH\_TAG**: `"history-push"` = `'history-push'`

Defined in: [packages/lexical/src/LexicalUpdateTags.ts:22](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUpdateTags.ts#L22)

Indicates that a new history entry should be pushed to the history stack

***

### INDENT\_CONTENT\_COMMAND {#indent_content_command}

> `const` **INDENT\_CONTENT\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`void`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:183](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L183)

***

### INPUT\_COMMAND {#input_command}

> `const` **INPUT\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`InputEvent`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:43](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L43)

***

### INSERT\_LINE\_BREAK\_COMMAND {#insert_line_break_command}

> `const` **INSERT\_LINE\_BREAK\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`boolean`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:62](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L62)

Dispatched to insert a line break. With a false payload the
cursor moves to the new line (Shift+Enter), with a true payload the cursor
does not move (Ctrl+O on macOS).

***

### INSERT\_PARAGRAPH\_COMMAND {#insert_paragraph_command}

> `const` **INSERT\_PARAGRAPH\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`void`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:65](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L65)

***

### INSERT\_TAB\_COMMAND {#insert_tab_command}

> `const` **INSERT\_TAB\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`void`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:181](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L181)

***

### IS\_ALL\_FORMATTING {#is_all_formatting}

> `const` **IS\_ALL\_FORMATTING**: `number`

Defined in: [packages/lexical/src/LexicalConstants.ts:53](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalConstants.ts#L53)

***

### IS\_BOLD {#is_bold}

> `const` **IS\_BOLD**: `1` = `1`

Defined in: [packages/lexical/src/LexicalConstants.ts:41](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalConstants.ts#L41)

***

### IS\_CODE {#is_code}

> `const` **IS\_CODE**: `number`

Defined in: [packages/lexical/src/LexicalConstants.ts:45](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalConstants.ts#L45)

***

### IS\_HIGHLIGHT {#is_highlight}

> `const` **IS\_HIGHLIGHT**: `number`

Defined in: [packages/lexical/src/LexicalConstants.ts:48](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalConstants.ts#L48)

***

### IS\_ITALIC {#is_italic}

> `const` **IS\_ITALIC**: `number`

Defined in: [packages/lexical/src/LexicalConstants.ts:42](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalConstants.ts#L42)

***

### IS\_STRIKETHROUGH {#is_strikethrough}

> `const` **IS\_STRIKETHROUGH**: `number`

Defined in: [packages/lexical/src/LexicalConstants.ts:43](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalConstants.ts#L43)

***

### IS\_SUBSCRIPT {#is_subscript}

> `const` **IS\_SUBSCRIPT**: `number`

Defined in: [packages/lexical/src/LexicalConstants.ts:46](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalConstants.ts#L46)

***

### IS\_SUPERSCRIPT {#is_superscript}

> `const` **IS\_SUPERSCRIPT**: `number`

Defined in: [packages/lexical/src/LexicalConstants.ts:47](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalConstants.ts#L47)

***

### IS\_UNDERLINE {#is_underline}

> `const` **IS\_UNDERLINE**: `number`

Defined in: [packages/lexical/src/LexicalConstants.ts:44](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalConstants.ts#L44)

***

### KEY\_ARROW\_DOWN\_COMMAND {#key_arrow_down_command}

> `const` **KEY\_ARROW\_DOWN\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`KeyboardEvent`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:143](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L143)

Dispatched when the `'ArrowDown'` key is pressed.
The shift and/or alt (option) modifier keys may also be down.

***

### KEY\_ARROW\_LEFT\_COMMAND {#key_arrow_left_command}

> `const` **KEY\_ARROW\_LEFT\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`KeyboardEvent`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:125](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L125)

Dispatched when the `'ArrowLeft'` key is pressed.
The shift modifier key may also be down.

***

### KEY\_ARROW\_RIGHT\_COMMAND {#key_arrow_right_command}

> `const` **KEY\_ARROW\_RIGHT\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`KeyboardEvent`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:113](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L113)

Dispatched when the `'ArrowRight'` key is pressed.
The shift modifier key may also be down.

***

### KEY\_ARROW\_UP\_COMMAND {#key_arrow_up_command}

> `const` **KEY\_ARROW\_UP\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`KeyboardEvent`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:137](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L137)

Dispatched when the `'ArrowUp'` key is pressed.
The shift and/or alt (option) modifier keys may also be down.

***

### KEY\_BACKSPACE\_COMMAND {#key_backspace_command}

> `const` **KEY\_BACKSPACE\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`KeyboardEvent`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:162](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L162)

Dispatched whenever the `'Backspace'` key is pressed, the shift
modifier key may be down.

***

### KEY\_DELETE\_COMMAND {#key_delete_command}

> `const` **KEY\_DELETE\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`KeyboardEvent`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:173](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L173)

Dispatched whenever the `'Delete'` key is pressed (Fn+Delete on macOS).

***

### KEY\_DOWN\_COMMAND {#key_down_command}

> `const` **KEY\_DOWN\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`KeyboardEvent`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:107](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L107)

Dispatched when any key is pressed.

***

### KEY\_ENTER\_COMMAND {#key_enter_command}

> `const` **KEY\_ENTER\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`KeyboardEvent` \| `null`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:150](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L150)

Dispatched when the enter key is pressed, may also be called with a null
payload when the intent is to insert a newline. The shift modifier key
must be down, any other modifier keys may also be down.

***

### KEY\_ESCAPE\_COMMAND {#key_escape_command}

> `const` **KEY\_ESCAPE\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`KeyboardEvent`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:168](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L168)

Dispatched whenever the `'Escape'` key is pressed, any modifier
keys may be down.

***

### ~~KEY\_MODIFIER\_COMMAND~~ {#key_modifier_command}

> `const` **KEY\_MODIFIER\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`KeyboardEvent`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:239](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L239)

#### Deprecated

in v0.31.0, use KEY_DOWN_COMMAND and check for modifiers
directly.

Dispatched after any KeyboardEvent when modifiers are pressed

***

### KEY\_SPACE\_COMMAND {#key_space_command}

> `const` **KEY\_SPACE\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`KeyboardEvent`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:156](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L156)

Dispatched whenever the space (`' '`) key is pressed, any modifier
keys may be down.

***

### KEY\_TAB\_COMMAND {#key_tab_command}

> `const` **KEY\_TAB\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`KeyboardEvent`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:179](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L179)

Dispatched whenever the `'Tab'` key is pressed. The shift modifier key
may be down.

***

### MOVE\_TO\_END {#move_to_end}

> `const` **MOVE\_TO\_END**: [`LexicalCommand`](#lexicalcommand)\<`KeyboardEvent`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:119](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L119)

Dispatched when the move to end keyboard shortcut is pressed,
(Cmd+Right on macOS; Ctrl+Right elsewhere).

***

### MOVE\_TO\_START {#move_to_start}

> `const` **MOVE\_TO\_START**: [`LexicalCommand`](#lexicalcommand)\<`KeyboardEvent`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:131](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L131)

Dispatched when the move to start keyboard shortcut is pressed,
(Cmd+Left on macOS; Ctrl+Left elsewhere).

***

### NODE\_STATE\_KEY {#node_state_key}

> `const` **NODE\_STATE\_KEY**: `"$"` = `'$'`

Defined in: [packages/lexical/src/LexicalConstants.ts:158](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalConstants.ts#L158)

***

### OUTDENT\_CONTENT\_COMMAND {#outdent_content_command}

> `const` **OUTDENT\_CONTENT\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`void`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:186](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L186)

***

### PASTE\_COMMAND {#paste_command}

> `const` **PASTE\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<[`PasteCommandType`](#pastecommandtype)\>

Defined in: [packages/lexical/src/LexicalCommands.ts:71](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L71)

***

### PASTE\_TAG {#paste_tag}

> `const` **PASTE\_TAG**: `"paste"` = `'paste'`

Defined in: [packages/lexical/src/LexicalUpdateTags.ts:32](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUpdateTags.ts#L32)

Indicates that the update is related to a paste operation

***

### REDO\_COMMAND {#redo_command}

> `const` **REDO\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`void`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:103](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L103)

Dispatched on redo (Shift+Cmd+Z on macOS, Shift+Ctrl+Z or Ctrl+Y elsewhere).

***

### REMOVE\_TEXT\_COMMAND {#remove_text_command}

> `const` **REMOVE\_TEXT\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`InputEvent` \| `null`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:73](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L73)

***

### SELECT\_ALL\_COMMAND {#select_all_command}

> `const` **SELECT\_ALL\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`KeyboardEvent`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:217](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L217)

Dispatched on the select all keyboard shortcut
(Cmd+A on macOS, Ctrl+A elsehwere).

***

### SELECTION\_CHANGE\_COMMAND {#selection_change_command}

> `const` **SELECTION\_CHANGE\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`void`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:31](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L31)

***

### SELECTION\_INSERT\_CLIPBOARD\_NODES\_COMMAND {#selection_insert_clipboard_nodes_command}

> `const` **SELECTION\_INSERT\_CLIPBOARD\_NODES\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<\{ `nodes`: [`LexicalNode`](#lexicalnode)[]; `selection`: [`BaseSelection`](#baseselection); \}\>

Defined in: [packages/lexical/src/LexicalCommands.ts:34](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L34)

***

### SKIP\_COLLAB\_TAG {#skip_collab_tag}

> `const` **SKIP\_COLLAB\_TAG**: `"skip-collab"` = `'skip-collab'`

Defined in: [packages/lexical/src/LexicalUpdateTags.ts:42](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUpdateTags.ts#L42)

Indicates that the update should skip collaborative sync

***

### SKIP\_DOM\_SELECTION\_TAG {#skip_dom_selection_tag}

> `const` **SKIP\_DOM\_SELECTION\_TAG**: `"skip-dom-selection"` = `'skip-dom-selection'`

Defined in: [packages/lexical/src/LexicalUpdateTags.ts:53](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUpdateTags.ts#L53)

Indicates that the update should skip updating the DOM selection
This is useful when you want to make updates without changing the selection or focus

***

### SKIP\_SCROLL\_INTO\_VIEW\_TAG {#skip_scroll_into_view_tag}

> `const` **SKIP\_SCROLL\_INTO\_VIEW\_TAG**: `"skip-scroll-into-view"` = `'skip-scroll-into-view'`

Defined in: [packages/lexical/src/LexicalUpdateTags.ts:47](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUpdateTags.ts#L47)

Indicates that the update should skip scrolling the selection into view

***

### SKIP\_SELECTION\_FOCUS\_TAG {#skip_selection_focus_tag}

> `const` **SKIP\_SELECTION\_FOCUS\_TAG**: `"skip-selection-focus"` = `'skip-selection-focus'`

Defined in: [packages/lexical/src/LexicalUpdateTags.ts:59](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUpdateTags.ts#L59)

Indicates that after changing the selection, the editor should not focus itself
This tag is ignored if [SKIP\_DOM\_SELECTION\_TAG](#skip_dom_selection_tag) is used

***

### TEXT\_TYPE\_TO\_FORMAT {#text_type_to_format}

> `const` **TEXT\_TYPE\_TO\_FORMAT**: `Record`\<[`TextFormatType`](#textformattype) \| `string`, `number`\>

Defined in: [packages/lexical/src/LexicalConstants.ts:106](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalConstants.ts#L106)

***

### UNDO\_COMMAND {#undo_command}

> `const` **UNDO\_COMMAND**: [`LexicalCommand`](#lexicalcommand)\<`void`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:99](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L99)

Dispatched on undo (Cmd+Z on macOS, Ctrl+Z elsewhere).

## Functions

### $addUpdateTag() {#addupdatetag}

> **$addUpdateTag**(`tag`): `void`

Defined in: [packages/lexical/src/LexicalUtils.ts:1467](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L1467)

#### Parameters

##### tag

[`UpdateTag`](#updatetag)

#### Returns

`void`

***

### $applyNodeReplacement() {#applynodereplacement}

> **$applyNodeReplacement**\<`N`\>(`node`): `N`

Defined in: [packages/lexical/src/LexicalUtils.ts:1589](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L1589)

#### Type Parameters

##### N

`N` *extends* [`LexicalNode`](#lexicalnode)

#### Parameters

##### node

`N`

#### Returns

`N`

***

### $caretFromPoint() {#caretfrompoint}

> **$caretFromPoint**\<`D`\>(`point`, `direction`): [`PointCaret`](#pointcaret)\<`D`\>

Defined in: [packages/lexical/src/caret/LexicalCaretUtils.ts:61](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaretUtils.ts#L61)

#### Type Parameters

##### D

`D` *extends* [`CaretDirection`](#caretdirection)

#### Parameters

##### point

`Pick`\<[`PointType`](#pointtype-1), `"type"` \| `"key"` \| `"offset"`\>

##### direction

`D`

#### Returns

[`PointCaret`](#pointcaret)\<`D`\>

a PointCaret for the point

***

### $caretRangeFromSelection() {#caretrangefromselection}

> **$caretRangeFromSelection**(`selection`): [`CaretRange`](#caretrange)

Defined in: [packages/lexical/src/caret/LexicalCaretUtils.ts:156](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaretUtils.ts#L156)

Get a pair of carets for a RangeSelection.

If the focus is before the anchor, then the direction will be
'previous', otherwise the direction will be 'next'.

#### Parameters

##### selection

[`RangeSelection`](#rangeselection)

#### Returns

[`CaretRange`](#caretrange)

***

### $cloneWithProperties() {#clonewithproperties}

> **$cloneWithProperties**\<`T`\>(`latestNode`): `T`

Defined in: [packages/lexical/src/LexicalUtils.ts:1999](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L1999)

Returns a clone of a node using `node.constructor.clone()` followed by
`clone.afterCloneFrom(node)`. The resulting clone must have the same key,
parent/next/prev pointers, and other properties that are not set by
`node.constructor.clone` (format, style, etc.). This is primarily used by
[LexicalNode.getWritable](#getwritable-6) to create a writable version of an
existing node. The clone is the same logical node as the original node,
do not try and use this function to duplicate or copy an existing node.

Does not mutate the EditorState.

#### Type Parameters

##### T

`T` *extends* [`LexicalNode`](#lexicalnode)

#### Parameters

##### latestNode

`T`

The node to be cloned.

#### Returns

`T`

The clone of the node.

***

### $cloneWithPropertiesEphemeral() {#clonewithpropertiesephemeral}

> **$cloneWithPropertiesEphemeral**\<`T`\>(`latestNode`): `T`

Defined in: [packages/lexical/src/LexicalUtils.ts:2034](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L2034)

Returns a clone with [$cloneWithProperties](#clonewithproperties) and then "detaches"
it from the state by overriding its getLatest and getWritable to always
return this. This node can not be added to an EditorState or become the
parent, child, or sibling of another node. It is primarily only useful
for making in-place temporary modifications to a TextNode when
serializing a partial slice.

Does not mutate the EditorState.

#### Type Parameters

##### T

`T` *extends* [`LexicalNode`](#lexicalnode)

#### Parameters

##### latestNode

`T`

The node to be cloned.

#### Returns

`T`

The clone of the node.

***

### $comparePointCaretNext() {#comparepointcaretnext}

> **$comparePointCaretNext**(`a`, `b`): `-1` \| `0` \| `1`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:1229](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L1229)

A total ordering for `PointCaret<'next'>`, based on
the same order that a [CaretRange](#caretrange) would iterate
them.

For a given origin node:
- ChildCaret comes before SiblingCaret
- TextPointCaret comes before SiblingCaret

An exception is thrown when a and b do not have any
common ancestor.

This ordering is a sort of mix of pre-order and post-order
because each ElementNode will show up as a ChildCaret
on 'enter' (pre-order) and a SiblingCaret on 'leave' (post-order).

#### Parameters

##### a

[`PointCaret`](#pointcaret)\<`"next"`\>

##### b

[`PointCaret`](#pointcaret)\<`"next"`\>

#### Returns

`-1` \| `0` \| `1`

-1 if a comes before b, 0 if a and b are the same, or 1 if a comes after b

***

### $copyNode() {#copynode}

> **$copyNode**\<`T`\>(`node`, `skipReset`): `T`

Defined in: [packages/lexical/src/LexicalUtils.ts:1576](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L1576)

Returns a shallow clone of node with a new key. All properties of the node
will be copied to the new node (by `clone` and then `afterCloneFrom`),
except those related to parent/sibling/child
relationships in the `EditorState`. This means that the copy must be
separately added to the document, and it will not have any children.

#### Type Parameters

##### T

`T` *extends* [`LexicalNode`](#lexicalnode)

#### Parameters

##### node

`T`

The node to be copied.

##### skipReset

`boolean` = `false`

If true (default false) skip the call to resetOnCopyNodeFrom

#### Returns

`T`

The copy of the node.

***

### $create() {#create}

> **$create**\<`T`\>(`klass`): `T`

Defined in: [packages/lexical/src/LexicalUtils.ts:2218](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L2218)

Create an node from its class.

Note that this will directly construct the final `withKlass` node type,
and will ignore the deprecated `with` functions. This allows `$create` to
skip any intermediate steps where the replaced node would be created and
then immediately discarded (once per configured replacement of that node).

This does not support any arguments to the constructor.
Setters can be used to initialize your node, and they can
be chained. You can of course write your own mutliple-argument functions
to wrap that.

#### Type Parameters

##### T

`T` *extends* [`LexicalNode`](#lexicalnode)

#### Parameters

##### klass

[`Klass`](#klass)\<`T`\>

#### Returns

`T`

#### Example

```ts
function $createTokenText(text: string): TextNode {
  return $create(TextNode).setTextContent(text).setMode('token');
}
```

***

### $createLineBreakNode() {#createlinebreaknode}

> **$createLineBreakNode**(): [`LineBreakNode`](#linebreaknode)

Defined in: [packages/lexical/src/nodes/LexicalLineBreakNode.ts:83](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalLineBreakNode.ts#L83)

#### Returns

[`LineBreakNode`](#linebreaknode)

***

### $createNodeSelection() {#createnodeselection}

> **$createNodeSelection**(): [`NodeSelection`](#nodeselection)

Defined in: [packages/lexical/src/LexicalSelection.ts:2581](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L2581)

#### Returns

[`NodeSelection`](#nodeselection)

***

### $createParagraphNode() {#createparagraphnode}

> **$createParagraphNode**(): [`ParagraphNode`](#paragraphnode)

Defined in: [packages/lexical/src/nodes/LexicalParagraphNode.ts:188](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalParagraphNode.ts#L188)

#### Returns

[`ParagraphNode`](#paragraphnode)

***

### $createPoint() {#createpoint}

> **$createPoint**(`key`, `offset`, `type`): [`PointType`](#pointtype-1)

Defined in: [packages/lexical/src/LexicalSelection.ts:220](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L220)

#### Parameters

##### key

`string`

##### offset

`number`

##### type

`"element"` | `"text"`

#### Returns

[`PointType`](#pointtype-1)

***

### $createRangeSelection() {#createrangeselection}

> **$createRangeSelection**(): [`RangeSelection`](#rangeselection)

Defined in: [packages/lexical/src/LexicalSelection.ts:2575](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L2575)

#### Returns

[`RangeSelection`](#rangeselection)

***

### $createRangeSelectionFromDom() {#createrangeselectionfromdom}

> **$createRangeSelectionFromDom**(`domSelection`, `editor`): `null` \| [`RangeSelection`](#rangeselection)

Defined in: [packages/lexical/src/LexicalSelection.ts:2604](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L2604)

#### Parameters

##### domSelection

`null` | `Selection`

##### editor

[`LexicalEditor`](#lexicaleditor)

#### Returns

`null` \| [`RangeSelection`](#rangeselection)

***

### $createTabNode() {#createtabnode}

> **$createTabNode**(): [`TabNode`](#tabnode)

Defined in: [packages/lexical/src/nodes/LexicalTabNode.ts:102](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTabNode.ts#L102)

#### Returns

[`TabNode`](#tabnode)

***

### $createTextNode() {#createtextnode}

> **$createTextNode**(`text`): [`TextNode`](#textnode)

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:1375](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L1375)

#### Parameters

##### text

`string` = `''`

#### Returns

[`TextNode`](#textnode)

***

### $extendCaretToRange() {#extendcarettorange}

> **$extendCaretToRange**\<`D`\>(`anchor`): [`CaretRange`](#caretrange)\<`D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:1127](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L1127)

Construct a CaretRange that starts at anchor and goes to the end of the
document in the anchor caret's direction.

#### Type Parameters

##### D

`D` *extends* [`CaretDirection`](#caretdirection)

#### Parameters

##### anchor

[`PointCaret`](#pointcaret)\<`D`\>

#### Returns

[`CaretRange`](#caretrange)\<`D`\>

***

### $getAdjacentChildCaret() {#getadjacentchildcaret}

> **$getAdjacentChildCaret**\<`D`\>(`caret`): `null` \| [`NodeCaret`](#nodecaret)\<`D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:977](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L977)

Gets the adjacent caret, if not-null and if the origin of the adjacent caret is an ElementNode, then return
the ChildCaret. This can be used along with the getParentAdjacentCaret method to perform a full DFS
style traversal of the tree.

#### Type Parameters

##### D

`D` *extends* [`CaretDirection`](#caretdirection)

#### Parameters

##### caret

The caret to start at

`null` | [`NodeCaret`](#nodecaret)\<`D`\>

#### Returns

`null` \| [`NodeCaret`](#nodecaret)\<`D`\>

***

### $getAdjacentNode() {#getadjacentnode}

> **$getAdjacentNode**(`focus`, `isBackward`): `null` \| [`LexicalNode`](#lexicalnode)

Defined in: [packages/lexical/src/LexicalUtils.ts:1317](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L1317)

#### Parameters

##### focus

[`PointType`](#pointtype-1)

##### isBackward

`boolean`

#### Returns

`null` \| [`LexicalNode`](#lexicalnode)

***

### $getAdjacentSiblingOrParentSiblingCaret() {#getadjacentsiblingorparentsiblingcaret}

> **$getAdjacentSiblingOrParentSiblingCaret**\<`D`\>(`startCaret`, `rootMode`): `null` \| \[[`NodeCaret`](#nodecaret)\<`D`\>, `number`\]

Defined in: [packages/lexical/src/caret/LexicalCaretUtils.ts:603](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaretUtils.ts#L603)

Returns the Node sibling when this exists, otherwise the closest parent sibling. For example
R -> P -> T1, T2
  -> P2
returns T2 for node T1, P2 for node T2, and null for node P2.

#### Type Parameters

##### D

`D` *extends* [`CaretDirection`](#caretdirection)

#### Parameters

##### startCaret

[`NodeCaret`](#nodecaret)\<`D`\>

The initial caret

##### rootMode

[`RootMode`](#rootmode-1) = `'root'`

The root mode, 'root' (default) or 'shadowRoot'

#### Returns

`null` \| \[[`NodeCaret`](#nodecaret)\<`D`\>, `number`\]

An array (tuple) containing the found caret and the depth difference, or null, if this node doesn't exist.

***

### $getCaretInDirection() {#getcaretindirection}

> **$getCaretInDirection**\<`Caret`, `D`\>(`caret`, `direction`): [`NodeCaret`](#nodecaret)\<`D`\> \| `Caret` *extends* [`TextPointCaret`](#textpointcaret)\<[`TextNode`](#textnode), [`CaretDirection`](#caretdirection)\> ? [`TextPointCaret`](#textpointcaret)\<[`TextNode`](#textnode), `D`\> : `never`

Defined in: [packages/lexical/src/caret/LexicalCaretUtils.ts:526](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaretUtils.ts#L526)

Return the caret if it's in the given direction, otherwise return
caret.getFlipped().

#### Type Parameters

##### Caret

`Caret` *extends* [`PointCaret`](#pointcaret)\<[`CaretDirection`](#caretdirection)\>

##### D

`D` *extends* [`CaretDirection`](#caretdirection)

#### Parameters

##### caret

`Caret`

Any PointCaret

##### direction

`D`

The desired direction

#### Returns

[`NodeCaret`](#nodecaret)\<`D`\> \| `Caret` *extends* [`TextPointCaret`](#textpointcaret)\<[`TextNode`](#textnode), [`CaretDirection`](#caretdirection)\> ? [`TextPointCaret`](#textpointcaret)\<[`TextNode`](#textnode), `D`\> : `never`

A PointCaret in direction

***

### $getCaretRange() {#getcaretrange}

> **$getCaretRange**\<`D`\>(`anchor`, `focus`): [`CaretRange`](#caretrange)\<`D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:1156](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L1156)

Construct a CaretRange from anchor and focus carets pointing in the
same direction. In order to get the expected behavior,
the anchor must point towards the focus or be the same point.

In the 'next' direction the anchor should be at or before the
focus in the document. In the 'previous' direction the anchor
should be at or after the focus in the document
(similar to a backwards RangeSelection).

#### Type Parameters

##### D

`D` *extends* [`CaretDirection`](#caretdirection)

#### Parameters

##### anchor

[`PointCaret`](#pointcaret)\<`D`\>

##### focus

[`PointCaret`](#pointcaret)\<`D`\>

#### Returns

[`CaretRange`](#caretrange)\<`D`\>

a CaretRange

***

### $getCaretRangeInDirection() {#getcaretrangeindirection}

> **$getCaretRangeInDirection**\<`D`\>(`range`, `direction`): [`CaretRange`](#caretrange)\<`D`\>

Defined in: [packages/lexical/src/caret/LexicalCaretUtils.ts:555](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaretUtils.ts#L555)

Return the range if it's in the given direction, otherwise
construct a new range using a flipped focus as the anchor
and a flipped anchor as the focus. This transformation
preserves the section of the document that it's working
with, but reverses the order of iteration.

#### Type Parameters

##### D

`D` *extends* [`CaretDirection`](#caretdirection)

#### Parameters

##### range

[`CaretRange`](#caretrange)\<[`CaretDirection`](#caretdirection)\>

Any CaretRange

##### direction

`D`

The desired direction

#### Returns

[`CaretRange`](#caretrange)\<`D`\>

A CaretRange in direction

***

### $getCharacterOffsets() {#getcharacteroffsets}

> **$getCharacterOffsets**(`selection`): \[`number`, `number`\]

Defined in: [packages/lexical/src/LexicalSelection.ts:1986](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L1986)

#### Parameters

##### selection

[`BaseSelection`](#baseselection)

#### Returns

\[`number`, `number`\]

***

### $getChildCaret() {#getchildcaret-3}

> **$getChildCaret**\<`T`, `D`\>(`origin`, `direction`): [`ChildCaret`](#childcaret)\<`T`, `D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:950](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L950)

Get a caret that points at the first or last child of the given origin node,
which must be an ElementNode.

#### Type Parameters

##### T

`T` *extends* [`ElementNode`](#elementnode)

##### D

`D` *extends* [`CaretDirection`](#caretdirection)

#### Parameters

##### origin

`T`

The origin ElementNode

##### direction

`D`

'next' for first child or 'previous' for last child

#### Returns

[`ChildCaret`](#childcaret)\<`T`, `D`\>

null if origin is null or not an ElementNode, otherwise a ChildCaret for this origin and direction

***

### $getChildCaretAtIndex() {#getchildcaretatindex}

> **$getChildCaretAtIndex**\<`D`\>(`parent`, `index`, `direction`): [`NodeCaret`](#nodecaret)\<`D`\>

Defined in: [packages/lexical/src/caret/LexicalCaretUtils.ts:577](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaretUtils.ts#L577)

Get a caret pointing at the child at the given index, or the last
caret in that node if out of bounds.

#### Type Parameters

##### D

`D` *extends* [`CaretDirection`](#caretdirection)

#### Parameters

##### parent

[`ElementNode`](#elementnode)

An ElementNode

##### index

`number`

The index of the origin for the caret

##### direction

`D`

#### Returns

[`NodeCaret`](#nodecaret)\<`D`\>

A caret pointing towards the node at that index

***

### $getChildCaretOrSelf() {#getchildcaretorself}

> **$getChildCaretOrSelf**\<`Caret`\>(`caret`): `Caret` \| [`ChildCaret`](#childcaret)\<[`ElementNode`](#elementnode), `NonNullable`\<`Caret`\>\[`"direction"`\]\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:964](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L964)

Gets the ChildCaret if one is possible at this caret origin, otherwise return the caret

#### Type Parameters

##### Caret

`Caret` *extends* `null` \| [`PointCaret`](#pointcaret)\<[`CaretDirection`](#caretdirection)\>

#### Parameters

##### caret

`Caret`

#### Returns

`Caret` \| [`ChildCaret`](#childcaret)\<[`ElementNode`](#elementnode), `NonNullable`\<`Caret`\>\[`"direction"`\]\>

***

### $getCollapsedCaretRange() {#getcollapsedcaretrange}

> **$getCollapsedCaretRange**\<`D`\>(`anchor`): [`CaretRange`](#caretrange)\<`D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:1136](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L1136)

Construct a collapsed CaretRange that starts and ends at anchor.

#### Type Parameters

##### D

`D` *extends* [`CaretDirection`](#caretdirection)

#### Parameters

##### anchor

[`PointCaret`](#pointcaret)\<`D`\>

#### Returns

[`CaretRange`](#caretrange)\<`D`\>

***

### $getCommonAncestor() {#getcommonancestor-8}

> **$getCommonAncestor**\<`A`, `B`\>(`a`, `b`): `null` \| [`CommonAncestorResult`](#commonancestorresult)\<`A`, `B`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:1367](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L1367)

Find a common ancestor of a and b and return a detailed result object,
or null if there is no common ancestor between the two nodes.

The result object will have a commonAncestor property, and the other
properties can be used to quickly compare these positions in the tree.

#### Type Parameters

##### A

`A` *extends* [`LexicalNode`](#lexicalnode)

##### B

`B` *extends* [`LexicalNode`](#lexicalnode)

#### Parameters

##### a

`A`

A LexicalNode

##### b

`B`

A LexicalNode

#### Returns

`null` \| [`CommonAncestorResult`](#commonancestorresult)\<`A`, `B`\>

A comparison result between the two nodes or null if they have no common ancestor

***

### $getCommonAncestorResultBranchOrder() {#getcommonancestorresultbranchorder}

> **$getCommonAncestorResultBranchOrder**\<`A`, `B`\>(`compare`): `-1` \| `1`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:1272](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L1272)

Return the ordering of siblings in a [CommonAncestorResultBranch](#commonancestorresultbranch)

#### Type Parameters

##### A

`A` *extends* [`LexicalNode`](#lexicalnode)

##### B

`B` *extends* [`LexicalNode`](#lexicalnode)

#### Parameters

##### compare

[`CommonAncestorResultBranch`](#commonancestorresultbranch)\<`A`, `B`\>

Returns -1 if a precedes b, 1 otherwise

#### Returns

`-1` \| `1`

***

### $getEditor() {#geteditor}

> **$getEditor**(): [`LexicalEditor`](#lexicaleditor)

Defined in: [packages/lexical/src/LexicalUtils.ts:1936](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L1936)

Utility function for accessing current active editor instance.

#### Returns

[`LexicalEditor`](#lexicaleditor)

Current active editor

***

### $getNearestNodeFromDOMNode() {#getnearestnodefromdomnode}

> **$getNearestNodeFromDOMNode**(`startingDOM`, `editorState?`): `null` \| [`LexicalNode`](#lexicalnode)

Defined in: [packages/lexical/src/LexicalUtils.ts:557](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L557)

#### Parameters

##### startingDOM

`Node`

##### editorState?

[`EditorState`](#editorstate)

#### Returns

`null` \| [`LexicalNode`](#lexicalnode)

***

### $getNearestRootOrShadowRoot() {#getnearestrootorshadowroot}

> **$getNearestRootOrShadowRoot**(`node`): [`ElementNode`](#elementnode) \| [`RootNode`](#rootnode)

Defined in: [packages/lexical/src/LexicalUtils.ts:1539](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L1539)

#### Parameters

##### node

[`LexicalNode`](#lexicalnode)

#### Returns

[`ElementNode`](#elementnode) \| [`RootNode`](#rootnode)

***

### $getNodeByKey() {#getnodebykey}

> **$getNodeByKey**\<`T`\>(`key`, `_editorState?`): `null` \| `T`

Defined in: [packages/lexical/src/LexicalUtils.ts:516](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L516)

#### Type Parameters

##### T

`T` *extends* [`LexicalNode`](#lexicalnode)

#### Parameters

##### key

`string`

##### \_editorState?

[`EditorState`](#editorstate)

#### Returns

`null` \| `T`

***

### $getNodeByKeyOrThrow() {#getnodebykeyorthrow}

> **$getNodeByKeyOrThrow**\<`N`\>(`key`): `N`

Defined in: [packages/lexical/src/LexicalUtils.ts:1655](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L1655)

#### Type Parameters

##### N

`N` *extends* [`LexicalNode`](#lexicalnode)

#### Parameters

##### key

`string`

#### Returns

`N`

***

### $getNodeFromDOMNode() {#getnodefromdomnode}

> **$getNodeFromDOMNode**(`dom`, `editorState?`): `null` \| [`LexicalNode`](#lexicalnode)

Defined in: [packages/lexical/src/LexicalUtils.ts:528](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L528)

#### Parameters

##### dom

`Node`

##### editorState?

[`EditorState`](#editorstate)

#### Returns

`null` \| [`LexicalNode`](#lexicalnode)

***

### $getPreviousSelection() {#getpreviousselection}

> **$getPreviousSelection**(): `null` \| [`BaseSelection`](#baseselection)

Defined in: [packages/lexical/src/LexicalSelection.ts:2755](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L2755)

#### Returns

`null` \| [`BaseSelection`](#baseselection)

***

### $getRoot() {#getroot}

> **$getRoot**(): [`RootNode`](#rootnode)

Defined in: [packages/lexical/src/LexicalUtils.ts:625](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L625)

#### Returns

[`RootNode`](#rootnode)

***

### $getSelection() {#getselection}

> **$getSelection**(): `null` \| [`BaseSelection`](#baseselection)

Defined in: [packages/lexical/src/LexicalSelection.ts:2750](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L2750)

#### Returns

`null` \| [`BaseSelection`](#baseselection)

***

### $getSiblingCaret() {#getsiblingcaret-4}

#### Call Signature

> **$getSiblingCaret**\<`T`, `D`\>(`origin`, `direction`): [`SiblingCaret`](#siblingcaret)\<`T`, `D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:843](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L843)

Get a caret that points at the next or previous sibling of the given origin node.

##### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### D

`D` *extends* [`CaretDirection`](#caretdirection)

##### Parameters

###### origin

`T`

The origin node

###### direction

`D`

'next' or 'previous'

##### Returns

[`SiblingCaret`](#siblingcaret)\<`T`, `D`\>

null if origin is null, otherwise a SiblingCaret for this origin and direction

#### Call Signature

> **$getSiblingCaret**\<`T`, `D`\>(`origin`, `direction`): `null` \| [`SiblingCaret`](#siblingcaret)\<`T`, `D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:847](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L847)

Get a caret that points at the next or previous sibling of the given origin node.

##### Type Parameters

###### T

`T` *extends* [`LexicalNode`](#lexicalnode)

###### D

`D` *extends* [`CaretDirection`](#caretdirection)

##### Parameters

###### origin

The origin node

`null` | `T`

###### direction

`D`

'next' or 'previous'

##### Returns

`null` \| [`SiblingCaret`](#siblingcaret)\<`T`, `D`\>

null if origin is null, otherwise a SiblingCaret for this origin and direction

***

### $getState() {#getstate}

> **$getState**\<`K`, `V`\>(`node`, `stateConfig`, `version`): `V`

Defined in: [packages/lexical/src/LexicalNodeState.ts:331](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNodeState.ts#L331)

The accessor for working with node state. This will read the value for the
state on the given node, and will return `stateConfig.defaultValue` if the
state has never been set on this node.

The `version` parameter is optional and should generally be `'latest'`,
consistent with the behavior of other node methods and functions,
but for certain use cases such as `updateDOM` you may have a need to
use `'direct'` to read the state from a previous version of the node.

For very advanced use cases, you can expect that 'direct' does not
require an editor state, just like directly accessing other properties
of a node without an accessor (e.g. `textNode.__text`).

#### Type Parameters

##### K

`K` *extends* `string`

##### V

`V`

#### Parameters

##### node

[`LexicalNode`](#lexicalnode)

Any LexicalNode

##### stateConfig

[`StateConfig`](#stateconfig)\<`K`, `V`\>

The configuration of the state to read

##### version

The default value 'latest' will read the latest version of the node state, 'direct' will read the version that is stored on this LexicalNode which not reflect the version used in the current editor state

`"latest"` | `"direct"`

#### Returns

`V`

The current value from the state, or the default value provided by the configuration.

***

### $getStateChange() {#getstatechange}

> **$getStateChange**\<`T`, `K`, `V`\>(`node`, `prevNode`, `stateConfig`): `null` \| \[`V`, `V`\]

Defined in: [packages/lexical/src/LexicalNodeState.ts:359](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNodeState.ts#L359)

Given two versions of a node and a stateConfig, compare their state values
using `$getState(nodeVersion, stateConfig, 'direct')`.
If the values are equal according to `stateConfig.isEqual`, return `null`,
otherwise return `[value, prevValue]`.

This is useful for implementing updateDOM. Note that the `'direct'`
version argument is used for both nodes.

#### Type Parameters

##### T

`T` *extends* [`LexicalNode`](#lexicalnode)

##### K

`K` *extends* `string`

##### V

`V`

#### Parameters

##### node

`T`

Any LexicalNode

##### prevNode

`T`

A previous version of node

##### stateConfig

[`StateConfig`](#stateconfig)\<`K`, `V`\>

The configuration of the state to read

#### Returns

`null` \| \[`V`, `V`\]

`[value, prevValue]` if changed, otherwise `null`

***

### $getTextContent() {#gettextcontent-19}

> **$getTextContent**(): `string`

Defined in: [packages/lexical/src/LexicalSelection.ts:3192](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L3192)

#### Returns

`string`

***

### $getTextNodeOffset() {#gettextnodeoffset}

> **$getTextNodeOffset**(`origin`, `offset`, `mode`): `number`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:902](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L902)

Get a normalized offset into a TextNode given a numeric offset or a
direction for which end of the string to use. Throws in dev if the offset
is not in the bounds of the text content size.

#### Parameters

##### origin

[`TextNode`](#textnode)

a TextNode

##### offset

An absolute offset into the TextNode string, or a direction for which end to use as the offset

`number` | [`CaretDirection`](#caretdirection)

##### mode

If 'error' (the default) out of bounds offsets will be an error in dev. Otherwise it will clamp to a valid offset.

`"error"` | `"clamp"`

#### Returns

`number`

An absolute offset into the TextNode string

***

### $getTextPointCaret() {#gettextpointcaret}

#### Call Signature

> **$getTextPointCaret**\<`T`, `D`\>(`origin`, `direction`, `offset`): [`TextPointCaret`](#textpointcaret)\<`T`, `D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:866](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L866)

Construct a TextPointCaret

##### Type Parameters

###### T

`T` *extends* [`TextNode`](#textnode)

###### D

`D` *extends* [`CaretDirection`](#caretdirection)

##### Parameters

###### origin

`T`

The TextNode

###### direction

`D`

The direction (next points to the end of the text, previous points to the beginning)

###### offset

The offset into the text in absolute positive string coordinates (0 is the start)

`number` | [`CaretDirection`](#caretdirection)

##### Returns

[`TextPointCaret`](#textpointcaret)\<`T`, `D`\>

a TextPointCaret

#### Call Signature

> **$getTextPointCaret**\<`T`, `D`\>(`origin`, `direction`, `offset`): `null` \| [`TextPointCaret`](#textpointcaret)\<`T`, `D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:874](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L874)

Construct a TextPointCaret

##### Type Parameters

###### T

`T` *extends* [`TextNode`](#textnode)

###### D

`D` *extends* [`CaretDirection`](#caretdirection)

##### Parameters

###### origin

The TextNode

`null` | `T`

###### direction

`D`

The direction (next points to the end of the text, previous points to the beginning)

###### offset

The offset into the text in absolute positive string coordinates (0 is the start)

`number` | [`CaretDirection`](#caretdirection)

##### Returns

`null` \| [`TextPointCaret`](#textpointcaret)\<`T`, `D`\>

a TextPointCaret

***

### $getTextPointCaretSlice() {#gettextpointcaretslice}

> **$getTextPointCaretSlice**\<`T`, `D`\>(`caret`, `distance`): [`TextPointCaretSlice`](#textpointcaretslice)\<`T`, `D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:935](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L935)

Construct a TextPointCaretSlice given a TextPointCaret and a signed distance. The
distance should be negative to slice text before the caret's offset, and positive
to slice text after the offset. The direction of the caret itself is not
relevant to the string coordinates when working with a TextPointCaretSlice
but mutation operations will preserve the direction.

#### Type Parameters

##### T

`T` *extends* [`TextNode`](#textnode)

##### D

`D` *extends* [`CaretDirection`](#caretdirection)

#### Parameters

##### caret

[`TextPointCaret`](#textpointcaret)\<`T`, `D`\>

##### distance

`number`

#### Returns

[`TextPointCaretSlice`](#textpointcaretslice)\<`T`, `D`\>

TextPointCaretSlice

***

### $hasAncestor() {#hasancestor}

> **$hasAncestor**(`child`, `targetNode`): `boolean`

Defined in: [packages/lexical/src/LexicalUtils.ts:1505](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L1505)

#### Parameters

##### child

[`LexicalNode`](#lexicalnode)

##### targetNode

[`LexicalNode`](#lexicalnode)

#### Returns

`boolean`

***

### $hasUpdateTag() {#hasupdatetag}

> **$hasUpdateTag**(`tag`): `boolean`

Defined in: [packages/lexical/src/LexicalUtils.ts:1462](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L1462)

#### Parameters

##### tag

[`UpdateTag`](#updatetag)

#### Returns

`boolean`

***

### $insertNodes() {#insertnodes-6}

> **$insertNodes**(`nodes`): `void`

Defined in: [packages/lexical/src/LexicalSelection.ts:3183](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L3183)

#### Parameters

##### nodes

[`LexicalNode`](#lexicalnode)[]

#### Returns

`void`

***

### $isBlockElementNode() {#isblockelementnode}

> **$isBlockElementNode**(`node`): `node is ElementNode`

Defined in: [packages/lexical/src/LexicalSelection.ts:2545](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L2545)

#### Parameters

##### node

`undefined` | `null` | [`LexicalNode`](#lexicalnode)

#### Returns

`node is ElementNode`

***

### $isChildCaret() {#ischildcaret}

> **$isChildCaret**\<`D`\>(`caret`): `caret is ChildCaret<ElementNode, D>`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:759](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L759)

Guard to check if the given argument is specifically a ChildCaret

#### Type Parameters

##### D

`D` *extends* [`CaretDirection`](#caretdirection)

#### Parameters

##### caret

`undefined` | `null` | [`PointCaret`](#pointcaret)\<`D`\>

#### Returns

`caret is ChildCaret<ElementNode, D>`

true if caret is a ChildCaret

***

### $isDecoratorNode() {#isdecoratornode}

> **$isDecoratorNode**\<`T`\>(`node`): `node is DecoratorNode<T>`

Defined in: [packages/lexical/src/nodes/LexicalDecoratorNode.ts:47](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalDecoratorNode.ts#L47)

#### Type Parameters

##### T

`T`

#### Parameters

##### node

`undefined` | `null` | [`LexicalNode`](#lexicalnode)

#### Returns

`node is DecoratorNode<T>`

***

### $isEditorState() {#iseditorstate}

> **$isEditorState**(`x`): `x is EditorState`

Defined in: [packages/lexical/src/LexicalEditorState.ts:101](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditorState.ts#L101)

Type guard that returns true if the argument is an EditorState

#### Parameters

##### x

`unknown`

#### Returns

`x is EditorState`

***

### $isElementNode() {#iselementnode}

> **$isElementNode**(`node`): `node is ElementNode`

Defined in: [packages/lexical/src/nodes/LexicalElementNode.ts:1010](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalElementNode.ts#L1010)

#### Parameters

##### node

`undefined` | `null` | [`LexicalNode`](#lexicalnode)

#### Returns

`node is ElementNode`

***

### $isExtendableTextPointCaret() {#isextendabletextpointcaret}

> **$isExtendableTextPointCaret**\<`D`\>(`caret`): `caret is TextPointCaret<TextNode, D> & { [PointCaretIsExtendableBrand]: never }`

Defined in: [packages/lexical/src/caret/LexicalCaretUtils.ts:507](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaretUtils.ts#L507)

Determine whether the TextPointCaret's offset can be extended further without leaving the TextNode.
Returns false if the given caret is not a TextPointCaret or the offset can not be moved further in
direction.

#### Type Parameters

##### D

`D` *extends* [`CaretDirection`](#caretdirection)

#### Parameters

##### caret

[`PointCaret`](#pointcaret)\<`D`\>

A PointCaret

#### Returns

`caret is TextPointCaret<TextNode, D> & { [PointCaretIsExtendableBrand]: never }`

true if caret is a TextPointCaret with an offset that is not at the end of the text given the direction.

***

### $isInlineElementOrDecoratorNode() {#isinlineelementordecoratornode}

> **$isInlineElementOrDecoratorNode**(`node`): `boolean`

Defined in: [packages/lexical/src/LexicalUtils.ts:1532](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L1532)

#### Parameters

##### node

[`LexicalNode`](#lexicalnode)

#### Returns

`boolean`

***

### $isLeafNode() {#isleafnode}

> **$isLeafNode**(`node`): node is DecoratorNode\<unknown\> \| TextNode \| LineBreakNode

Defined in: [packages/lexical/src/LexicalUtils.ts:299](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L299)

#### Parameters

##### node

`undefined` | `null` | [`LexicalNode`](#lexicalnode)

#### Returns

node is DecoratorNode\<unknown\> \| TextNode \| LineBreakNode

***

### $isLineBreakNode() {#islinebreaknode}

> **$isLineBreakNode**(`node`): `node is LineBreakNode`

Defined in: [packages/lexical/src/nodes/LexicalLineBreakNode.ts:87](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalLineBreakNode.ts#L87)

#### Parameters

##### node

`undefined` | `null` | [`LexicalNode`](#lexicalnode)

#### Returns

`node is LineBreakNode`

***

### $isNodeCaret() {#isnodecaret}

> **$isNodeCaret**\<`D`\>(`caret`): `caret is PointCaret<D>`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:735](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L735)

Guard to check if the given argument is any type of caret

#### Type Parameters

##### D

`D` *extends* [`CaretDirection`](#caretdirection)

#### Parameters

##### caret

`undefined` | `null` | [`PointCaret`](#pointcaret)\<`D`\>

#### Returns

`caret is PointCaret<D>`

true if caret is any type of caret

***

### $isNodeSelection() {#isnodeselection}

> **$isNodeSelection**(`x`): `x is NodeSelection`

Defined in: [packages/lexical/src/LexicalSelection.ts:1970](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L1970)

#### Parameters

##### x

`unknown`

#### Returns

`x is NodeSelection`

***

### $isParagraphNode() {#isparagraphnode}

> **$isParagraphNode**(`node`): `node is ParagraphNode`

Defined in: [packages/lexical/src/nodes/LexicalParagraphNode.ts:192](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalParagraphNode.ts#L192)

#### Parameters

##### node

`undefined` | `null` | [`LexicalNode`](#lexicalnode)

#### Returns

`node is ParagraphNode`

***

### $isRangeSelection() {#israngeselection}

> **$isRangeSelection**(`x`): `x is RangeSelection`

Defined in: [packages/lexical/src/LexicalSelection.ts:463](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalSelection.ts#L463)

#### Parameters

##### x

`unknown`

#### Returns

`x is RangeSelection`

***

### $isRootNode() {#isrootnode}

> **$isRootNode**(`node`): `node is RootNode`

Defined in: [packages/lexical/src/nodes/LexicalRootNode.ts:113](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalRootNode.ts#L113)

#### Parameters

##### node

`undefined` | `null` | [`LexicalNode`](#lexicalnode) | [`RootNode`](#rootnode)

#### Returns

`node is RootNode`

***

### $isRootOrShadowRoot() {#isrootorshadowroot}

> **$isRootOrShadowRoot**(`node`): node is RootNode \| ShadowRootNode

Defined in: [packages/lexical/src/LexicalUtils.ts:1559](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L1559)

#### Parameters

##### node

`null` | [`LexicalNode`](#lexicalnode)

#### Returns

node is RootNode \| ShadowRootNode

***

### $isSiblingCaret() {#issiblingcaret}

> **$isSiblingCaret**\<`D`\>(`caret`): `caret is SiblingCaret<LexicalNode, D>`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:747](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L747)

Guard to check if the given argument is specifically a SiblingCaret (or TextPointCaret)

#### Type Parameters

##### D

`D` *extends* [`CaretDirection`](#caretdirection)

#### Parameters

##### caret

`undefined` | `null` | [`PointCaret`](#pointcaret)\<`D`\>

#### Returns

`caret is SiblingCaret<LexicalNode, D>`

true if caret is a SiblingCaret

***

### $isTabNode() {#istabnode}

> **$isTabNode**(`node`): `node is TabNode`

Defined in: [packages/lexical/src/nodes/LexicalTabNode.ts:106](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTabNode.ts#L106)

#### Parameters

##### node

`undefined` | `null` | [`LexicalNode`](#lexicalnode)

#### Returns

`node is TabNode`

***

### $isTextNode() {#istextnode}

> **$isTextNode**(`node`): `node is TextNode`

Defined in: [packages/lexical/src/nodes/LexicalTextNode.ts:1379](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalTextNode.ts#L1379)

#### Parameters

##### node

`undefined` | `null` | [`LexicalNode`](#lexicalnode)

#### Returns

`node is TextNode`

***

### $isTextPointCaret() {#istextpointcaret}

> **$isTextPointCaret**\<`D`\>(`caret`): `caret is TextPointCaret<TextNode, D>`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:723](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L723)

Guard to check if the given caret is specifically a TextPointCaret

#### Type Parameters

##### D

`D` *extends* [`CaretDirection`](#caretdirection)

#### Parameters

##### caret

Any caret

`undefined` | `null` | [`PointCaret`](#pointcaret)\<`D`\>

#### Returns

`caret is TextPointCaret<TextNode, D>`

true if it is a TextPointCaret

***

### $isTextPointCaretSlice() {#istextpointcaretslice}

> **$isTextPointCaretSlice**\<`D`\>(`caretOrSlice`): `caretOrSlice is TextPointCaretSlice<TextNode, D>`

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:1113](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L1113)

Guard to check for a TextPointCaretSlice

#### Type Parameters

##### D

`D` *extends* [`CaretDirection`](#caretdirection)

#### Parameters

##### caretOrSlice

A caret or slice

`undefined` | `null` | [`PointCaret`](#pointcaret)\<`D`\> | [`TextPointCaretSlice`](#textpointcaretslice)\<[`TextNode`](#textnode), `D`\>

#### Returns

`caretOrSlice is TextPointCaretSlice<TextNode, D>`

true if caretOrSlice is a TextPointCaretSlice

***

### $isTokenOrSegmented() {#istokenorsegmented}

> **$isTokenOrSegmented**(`node`): `boolean`

Defined in: [packages/lexical/src/LexicalUtils.ts:238](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L238)

Return true if the TextNode is a TabNode, or is in token or segmented mode.

#### Parameters

##### node

[`TextNode`](#textnode)

#### Returns

`boolean`

***

### $isTokenOrTab() {#istokenortab}

> **$isTokenOrTab**(`node`): `boolean`

Defined in: [packages/lexical/src/LexicalUtils.ts:231](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L231)

Return true if the TextNode is a TabNode or is in token mode.

#### Parameters

##### node

[`TextNode`](#textnode)

#### Returns

`boolean`

***

### ~~$nodesOfType()~~ {#nodesoftype}

> **$nodesOfType**\<`T`\>(`klass`): `T`[]

Defined in: [packages/lexical/src/LexicalUtils.ts:1274](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L1274)

#### Type Parameters

##### T

`T` *extends* [`LexicalNode`](#lexicalnode)

#### Parameters

##### klass

[`Klass`](#klass)\<`T`\>

#### Returns

`T`[]

#### Deprecated

Use [LexicalEditor.registerMutationListener](#registermutationlistener) with `skipInitialization: false` instead.

***

### $normalizeCaret() {#normalizecaret}

> **$normalizeCaret**\<`D`\>(`initialCaret`): [`PointCaret`](#pointcaret)\<`D`\>

Defined in: [packages/lexical/src/caret/LexicalCaretUtils.ts:482](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaretUtils.ts#L482)

Normalize a caret to the deepest equivalent PointCaret.
This will return a TextPointCaret with the offset set according
to the direction if given a caret with a TextNode origin
or a caret with an ElementNode origin with the deepest ChildCaret
having an adjacent TextNode.

If given a TextPointCaret, it will be returned, as no normalization
is required when an offset is already present.

#### Type Parameters

##### D

`D` *extends* [`CaretDirection`](#caretdirection)

#### Parameters

##### initialCaret

[`PointCaret`](#pointcaret)\<`D`\>

#### Returns

[`PointCaret`](#pointcaret)\<`D`\>

The normalized PointCaret

***

### $normalizeSelection\_\_EXPERIMENTAL() {#normalizeselection__experimental}

> **$normalizeSelection\_\_EXPERIMENTAL**(`selection`): [`RangeSelection`](#rangeselection)

Defined in: [packages/lexical/src/LexicalNormalization.ts:95](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNormalization.ts#L95)

#### Parameters

##### selection

[`RangeSelection`](#rangeselection)

#### Returns

[`RangeSelection`](#rangeselection)

***

### $onUpdate() {#onupdate-1}

> **$onUpdate**(`updateFn`): `void`

Defined in: [packages/lexical/src/LexicalUtils.ts:1480](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L1480)

Add a function to run after the current update. This will run after any
`onUpdate` function already supplied to `editor.update()`, as well as any
functions added with previous calls to `$onUpdate`.

#### Parameters

##### updateFn

() => `void`

The function to run after the current update.

#### Returns

`void`

***

### $parseSerializedNode() {#parseserializednode}

> **$parseSerializedNode**(`serializedNode`): [`LexicalNode`](#lexicalnode)

Defined in: [packages/lexical/src/LexicalUpdates.ts:356](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUpdates.ts#L356)

#### Parameters

##### serializedNode

[`SerializedLexicalNode`](#serializedlexicalnode)

#### Returns

[`LexicalNode`](#lexicalnode)

***

### $removeTextFromCaretRange() {#removetextfromcaretrange}

> **$removeTextFromCaretRange**\<`D`\>(`initialRange`, `sliceMode`): [`CaretRange`](#caretrange)\<`D`\>

Defined in: [packages/lexical/src/caret/LexicalCaretUtils.ts:232](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaretUtils.ts#L232)

Remove all text and nodes in the given range. If the range spans multiple
blocks then the remaining contents of the later block will be merged with
the earlier block.

#### Type Parameters

##### D

`D` *extends* [`CaretDirection`](#caretdirection)

#### Parameters

##### initialRange

[`CaretRange`](#caretrange)\<`D`\>

The range to remove text and nodes from

##### sliceMode

If 'preserveEmptyTextPointCaret' it will leave an empty TextPointCaret at the anchor for insert if one exists, otherwise empty slices will be removed

`"removeEmptySlices"` | `"preserveEmptyTextSliceCaret"`

#### Returns

[`CaretRange`](#caretrange)\<`D`\>

The new collapsed range (biased towards the earlier node)

***

### $rewindSiblingCaret() {#rewindsiblingcaret}

> **$rewindSiblingCaret**\<`T`, `D`\>(`caret`): [`NodeCaret`](#nodecaret)\<`D`\>

Defined in: [packages/lexical/src/caret/LexicalCaretUtils.ts:183](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaretUtils.ts#L183)

Given a SiblingCaret we can always compute a caret that points to the
origin of that caret in the same direction. The adjacent caret of the
returned caret will be equivalent to the given caret.

#### Type Parameters

##### T

`T` *extends* [`LexicalNode`](#lexicalnode)

##### D

`D` *extends* [`CaretDirection`](#caretdirection)

#### Parameters

##### caret

[`SiblingCaret`](#siblingcaret)\<`T`, `D`\>

The caret to "rewind"

#### Returns

[`NodeCaret`](#nodecaret)\<`D`\>

A new caret (ChildCaret or SiblingCaret) with the same direction

#### Example

```ts
siblingCaret.is($rewindSiblingCaret(siblingCaret).getAdjacentCaret())
```

***

### $selectAll() {#selectall}

> **$selectAll**(`selection?`): [`RangeSelection`](#rangeselection)

Defined in: [packages/lexical/src/LexicalUtils.ts:1192](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L1192)

#### Parameters

##### selection?

`null` | [`RangeSelection`](#rangeselection)

#### Returns

[`RangeSelection`](#rangeselection)

***

### $setCompositionKey() {#setcompositionkey}

> **$setCompositionKey**(`compositionKey`): `void`

Defined in: [packages/lexical/src/LexicalUtils.ts:487](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L487)

#### Parameters

##### compositionKey

`null` | `string`

#### Returns

`void`

***

### $setPointFromCaret() {#setpointfromcaret}

> **$setPointFromCaret**\<`D`\>(`point`, `caret`): `void`

Defined in: [packages/lexical/src/caret/LexicalCaretUtils.ts:91](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaretUtils.ts#L91)

Update the given point in-place from the PointCaret

#### Type Parameters

##### D

`D` *extends* [`CaretDirection`](#caretdirection)

#### Parameters

##### point

[`PointType`](#pointtype-1)

the point to set

##### caret

[`PointCaret`](#pointcaret)\<`D`\>

the caret to set the point from

#### Returns

`void`

***

### $setSelection() {#setselection}

> **$setSelection**(`selection`): `void`

Defined in: [packages/lexical/src/LexicalUtils.ts:633](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L633)

#### Parameters

##### selection

`null` | [`BaseSelection`](#baseselection)

#### Returns

`void`

***

### $setSelectionFromCaretRange() {#setselectionfromcaretrange}

> **$setSelectionFromCaretRange**(`caretRange`): [`RangeSelection`](#rangeselection)

Defined in: [packages/lexical/src/caret/LexicalCaretUtils.ts:127](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaretUtils.ts#L127)

Set a RangeSelection on the editor from the given CaretRange

#### Parameters

##### caretRange

[`CaretRange`](#caretrange)

#### Returns

[`RangeSelection`](#rangeselection)

The new RangeSelection

***

### $setState() {#setstate}

> **$setState**\<`Node`, `K`, `V`\>(`node`, `stateConfig`, `valueOrUpdater`): `Node`

Defined in: [packages/lexical/src/LexicalNodeState.ts:392](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNodeState.ts#L392)

Set the state defined by stateConfig on node. Like with `React.useState`
you may directly specify the value or use an updater function that will
be called with the previous value of the state on that node (which will
be the `stateConfig.defaultValue` if not set).

When an updater function is used, the node will only be marked dirty if
`stateConfig.isEqual(prevValue, value)` is false.

#### Type Parameters

##### Node

`Node` *extends* [`LexicalNode`](#lexicalnode)

##### K

`K` *extends* `string`

##### V

`V`

#### Parameters

##### node

`Node`

The LexicalNode to set the state on

##### stateConfig

[`StateConfig`](#stateconfig)\<`K`, `V`\>

The configuration for this state

##### valueOrUpdater

[`ValueOrUpdater`](#valueorupdater)\<`V`\>

The value or updater function

#### Returns

`Node`

node

#### Example

```ts
const toggle = createState('toggle', {parse: Boolean});
// set it direction
$setState(node, counterState, true);
// use an updater
$setState(node, counterState, (prev) => !prev);
```

***

### $splitAtPointCaretNext() {#splitatpointcaretnext}

> **$splitAtPointCaretNext**(`pointCaret`, `__namedParameters`): `null` \| [`NodeCaret`](#nodecaret)\<`"next"`\>

Defined in: [packages/lexical/src/caret/LexicalCaretUtils.ts:696](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaretUtils.ts#L696)

Split a node at a PointCaret and return a NodeCaret at that point, or null if the
node can't be split. This is non-recursive and will only perform at most one split.

#### Parameters

##### pointCaret

[`PointCaret`](#pointcaret)\<`"next"`\>

##### \_\_namedParameters

[`SplitAtPointCaretNextOptions`](#splitatpointcaretnextoptions) = `{}`

#### Returns

`null` \| [`NodeCaret`](#nodecaret)\<`"next"`\>

The NodeCaret pointing to the location of the split (or null if a split is not possible)

***

### $splitNode() {#splitnode}

> **$splitNode**(`node`, `offset`): \[`null` \| [`ElementNode`](#elementnode), [`ElementNode`](#elementnode)\]

Defined in: [packages/lexical/src/LexicalUtils.ts:1788](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L1788)

#### Parameters

##### node

[`ElementNode`](#elementnode)

##### offset

`number`

#### Returns

\[`null` \| [`ElementNode`](#elementnode), [`ElementNode`](#elementnode)\]

***

### $updateRangeSelectionFromCaretRange() {#updaterangeselectionfromcaretrange}

> **$updateRangeSelectionFromCaretRange**(`selection`, `caretRange`): `void`

Defined in: [packages/lexical/src/caret/LexicalCaretUtils.ts:142](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaretUtils.ts#L142)

Update the points of a RangeSelection based on the given PointCaret.

#### Parameters

##### selection

[`RangeSelection`](#rangeselection)

##### caretRange

[`CaretRange`](#caretrange)

#### Returns

`void`

***

### addClassNamesToElement() {#addclassnamestoelement}

> **addClassNamesToElement**(`element`, ...`classNames`): `void`

Defined in: [packages/lexical/src/utils/classNames.ts:32](https://github.com/facebook/lexical/tree/main/packages/lexical/src/utils/classNames.ts#L32)

Takes an HTML element and adds the classNames passed within an array,
ignoring any non-string types. A space can be used to add multiple classes
eg. addClassNamesToElement(element, ['element-inner active', true, null])
will add both 'element-inner' and 'active' as classes to that element.

#### Parameters

##### element

`HTMLElement`

The element in which the classes are added

##### classNames

...(`undefined` \| `null` \| `string` \| `boolean`)[]

An array defining the class names to add to the element

#### Returns

`void`

***

### buildImportMap() {#buildimportmap}

> **buildImportMap**\<`K`\>(`importMap`): [`DOMConversionMap`](#domconversionmap)

Defined in: [packages/lexical/src/LexicalNode.ts:338](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L338)

An identity function that will infer the type of DOM nodes
based on tag names to make it easier to construct a
DOMConversionMap.

#### Type Parameters

##### K

`K` *extends* `string`

#### Parameters

##### importMap

`{ [NodeName in string]: DOMConversionPropByTagName<NodeName> }`

#### Returns

[`DOMConversionMap`](#domconversionmap)

***

### configExtension() {#configextension}

> **configExtension**\<`Config`, `Name`, `Output`, `Init`\>(...`args`): [`NormalizedLexicalExtensionArgument`](#normalizedlexicalextensionargument)\<`Config`, `Name`, `Output`, `Init`\>

Defined in: [packages/lexical/src/extension-core/defineExtension.ts:93](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/defineExtension.ts#L93)

**`Experimental`**

Override a partial of the configuration of an Extension, to be used
in the dependencies array of another extension, or as
an argument to buildEditorFromExtensions.

Before building the editor, configurations will be merged using
`extension.mergeConfig(extension, config)` or [shallowMergeConfig](#shallowmergeconfig) if
this is not directly implemented by the Extension.

#### Type Parameters

##### Config

`Config` *extends* [`ExtensionConfigBase`](#extensionconfigbase)

##### Name

`Name` *extends* `string`

##### Output

`Output`

##### Init

`Init`

#### Parameters

##### args

...[`NormalizedLexicalExtensionArgument`](#normalizedlexicalextensionargument)\<`Config`, `Name`, `Output`, `Init`\>

An extension followed by one or more config partials for that extension

#### Returns

[`NormalizedLexicalExtensionArgument`](#normalizedlexicalextensionargument)\<`Config`, `Name`, `Output`, `Init`\>

`[extension, config, ...configs]`

#### Example

```ts
export const ReactDecoratorExtension = defineExtension({
  name: "react-decorator",
  dependencies: [
    configExtension(ReactExtension, {
      decorators: [<ReactDecorator />]
    }),
  ],
});
```

@__NO_SIDE_EFFECTS__

***

### createCommand() {#createcommand}

> **createCommand**\<`T`\>(`type?`): [`LexicalCommand`](#lexicalcommand)\<`T`\>

Defined in: [packages/lexical/src/LexicalCommands.ts:27](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalCommands.ts#L27)

Crete a command that can be used with `editor.dispatchCommand` and
`editor.registerCommand`. Commands are used by unique reference, not by
name.

#### Type Parameters

##### T

`T`

#### Parameters

##### type?

`string`

A string to identify the command, very helpful for debugging

#### Returns

[`LexicalCommand`](#lexicalcommand)\<`T`\>

A new LexicalCommand

@__NO_SIDE_EFFECTS__

***

### createEditor() {#createeditor}

> **createEditor**(`editorConfig?`): [`LexicalEditor`](#lexicaleditor)

Defined in: [packages/lexical/src/LexicalEditor.ts:558](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalEditor.ts#L558)

Creates a new LexicalEditor attached to a single contentEditable (provided in the config). This is
the lowest-level initialization API for a LexicalEditor. If you're using React or another framework,
consider using the appropriate abstractions, such as LexicalComposer

#### Parameters

##### editorConfig?

[`CreateEditorArgs`](#createeditorargs)

the editor configuration.

#### Returns

[`LexicalEditor`](#lexicaleditor)

a LexicalEditor instance

***

### createState() {#createstate}

> **createState**\<`K`, `V`\>(`key`, `valueConfig`): [`StateConfig`](#stateconfig)\<`K`, `V`\>

Defined in: [packages/lexical/src/LexicalNodeState.ts:305](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNodeState.ts#L305)

Create a StateConfig for the given string key and StateValueConfig.

The key must be locally unique. In dev you will get a key collision error
when you use two separate StateConfig on the same node with the same key.

The returned StateConfig value should be used with [$getState](#getstate) and
[$setState](#setstate).

#### Type Parameters

##### K

`K` *extends* `string`

##### V

`V`

#### Parameters

##### key

`K`

The key to use

##### valueConfig

[`StateValueConfig`](#statevalueconfig)\<`V`\>

Configuration for the value type

#### Returns

[`StateConfig`](#stateconfig)\<`K`, `V`\>

a StateConfig

@__NO_SIDE_EFFECTS__

***

### declarePeerDependency() {#declarepeerdependency}

> **declarePeerDependency**\<`Extension`\>(`name`, `config?`): [`NormalizedPeerDependency`](#normalizedpeerdependency)\<`Extension`\>

Defined in: [packages/lexical/src/extension-core/defineExtension.ts:130](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/defineExtension.ts#L130)

**`Experimental`**

Used to declare a peer dependency of an extension in a type-safe way,
requires the type parameter. The most common use case for peer dependencies
is to avoid a direct import dependency, so you would want to use a
type import or the import type (shown in below examples).

#### Type Parameters

##### Extension

`Extension` *extends* [`AnyLexicalExtension`](#anylexicalextension) = `never`

#### Parameters

##### name

`Extension`\[`"name"`\]

The extension's name

##### config?

`Partial`\<[`LexicalExtensionConfig`](#lexicalextensionconfig-2)\<`Extension`\>\>

An optional config override

#### Returns

[`NormalizedPeerDependency`](#normalizedpeerdependency)\<`Extension`\>

NormalizedPeerDependency

#### Example

```ts
import type {FooExtension} from "foo";

export const PeerExtension = defineExtension({
  name: 'PeerExtension',
  peerDependencies: [
    declarePeerDependency<FooExtension>("foo"),
    declarePeerDependency<typeof import("bar").BarExtension>("bar", {config: "bar"}),
  ],
});
```

@__NO_SIDE_EFFECTS__

***

### defineExtension() {#defineextension}

> **defineExtension**\<`Config`, `Name`, `Output`, `Init`\>(`extension`): [`LexicalExtension`](#lexicalextension)\<`Config`, `Name`, `Output`, `Init`\>

Defined in: [packages/lexical/src/extension-core/defineExtension.ts:55](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/defineExtension.ts#L55)

**`Experimental`**

Define a LexicalExtension from the given object literal. TypeScript will
infer Config and Name in most cases, but you may want to use
[safeCast](#safecast) for config if there are default fields or varying types.

#### Type Parameters

##### Config

`Config` *extends* [`ExtensionConfigBase`](#extensionconfigbase)

##### Name

`Name` *extends* `string`

##### Output

`Output`

##### Init

`Init`

#### Parameters

##### extension

[`LexicalExtension`](#lexicalextension)\<`Config`, `Name`, `Output`, `Init`\>

The LexicalExtension

#### Returns

[`LexicalExtension`](#lexicalextension)\<`Config`, `Name`, `Output`, `Init`\>

The unmodified extension argument (this is only an inference helper)

#### Examples

Basic example
```ts
export const MyExtension = defineExtension({
  // Extension names must be unique in an editor
  name: "my",
  nodes: [MyNode],
});
```

Extension with optional configuration
```ts
export interface ConfigurableConfig {
  optional?: string;
  required: number;
}
export const ConfigurableExtension = defineExtension({
  name: "configurable",
  // The Extension's config must satisfy the full config type,
  // but using the Extension as a dependency never requires
  // configuration and any partial of the config can be specified
  config: safeCast<ConfigurableConfig>({ required: 1 }),
});
```

@__NO_SIDE_EFFECTS__

***

### flipDirection() {#flipdirection-1}

> **flipDirection**\<`D`\>(`direction`): [`FlipDirection`](#flipdirection)\<`D`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:580](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L580)

Flip a direction ('next' -> 'previous'; 'previous' -> 'next').

Note that TypeScript can't prove that FlipDirection is its own
inverse (but if you have a concrete 'next' or 'previous' it will
simplify accordingly).

#### Type Parameters

##### D

`D` *extends* [`CaretDirection`](#caretdirection)

#### Parameters

##### direction

`D`

A direction

#### Returns

[`FlipDirection`](#flipdirection)\<`D`\>

The opposite direction

***

### getDOMOwnerDocument() {#getdomownerdocument}

> **getDOMOwnerDocument**(`target`): `null` \| `Document`

Defined in: [packages/lexical/src/LexicalUtils.ts:1389](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L1389)

#### Parameters

##### target

`null` | `EventTarget`

#### Returns

`null` \| `Document`

***

### getDOMSelection() {#getdomselection}

> **getDOMSelection**(`targetWindow`): `null` \| `Selection`

Defined in: [packages/lexical/src/LexicalUtils.ts:1771](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L1771)

Returns the selection for the given window, or the global window if null.
Will return null if CAN\_USE\_DOM is false.

#### Parameters

##### targetWindow

The window to get the selection from

`null` | `Window`

#### Returns

`null` \| `Selection`

a Selection or null

***

### getDOMSelectionFromTarget() {#getdomselectionfromtarget}

> **getDOMSelectionFromTarget**(`eventTarget`): `null` \| `Selection`

Defined in: [packages/lexical/src/LexicalUtils.ts:1781](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L1781)

Returns the selection for the defaultView of the ownerDocument of given EventTarget.

#### Parameters

##### eventTarget

The node to get the selection from

`null` | `EventTarget`

#### Returns

`null` \| `Selection`

a Selection or null

***

### getDOMTextNode() {#getdomtextnode}

> **getDOMTextNode**(`element`): `null` \| `Text`

Defined in: [packages/lexical/src/LexicalUtils.ts:258](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L258)

#### Parameters

##### element

`null` | `Node`

#### Returns

`null` \| `Text`

***

### getNearestEditorFromDOMNode() {#getnearesteditorfromdomnode}

> **getNearestEditorFromDOMNode**(`node`): `null` \| [`LexicalEditor`](#lexicaleditor)

Defined in: [packages/lexical/src/LexicalUtils.ts:198](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L198)

#### Parameters

##### node

`null` | `Node`

#### Returns

`null` \| [`LexicalEditor`](#lexicaleditor)

***

### getTextDirection() {#gettextdirection}

> **getTextDirection**(`text`): `null` \| `"ltr"` \| `"rtl"`

Defined in: [packages/lexical/src/LexicalUtils.ts:218](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L218)

#### Parameters

##### text

`string`

#### Returns

`null` \| `"ltr"` \| `"rtl"`

***

### isBlockDomNode() {#isblockdomnode}

> **isBlockDomNode**(`node`): `boolean`

Defined in: [packages/lexical/src/LexicalUtils.ts:1891](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L1891)

#### Parameters

##### node

`Node`

the Dom Node to check

#### Returns

`boolean`

if the Dom Node is a block node

***

### isCurrentlyReadOnlyMode() {#iscurrentlyreadonlymode}

> **isCurrentlyReadOnlyMode**(): `boolean`

Defined in: [packages/lexical/src/LexicalUpdates.ts:79](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUpdates.ts#L79)

#### Returns

`boolean`

***

### isDocumentFragment() {#isdocumentfragment}

> **isDocumentFragment**(`x`): `x is DocumentFragment`

Defined in: [packages/lexical/src/LexicalUtils.ts:1869](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L1869)

#### Parameters

##### x

`unknown`

The element being testing

#### Returns

`x is DocumentFragment`

Returns true if x is a document fragment, false otherwise.

***

### isDOMDocumentNode() {#isdomdocumentnode}

> **isDOMDocumentNode**(`node`): `node is Document`

Defined in: [packages/lexical/src/LexicalUtils.ts:254](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L254)

#### Parameters

##### node

`unknown`

The element being tested

#### Returns

`node is Document`

Returns true if node is an DOM Document node, false otherwise.

***

### isDOMNode() {#isdomnode}

> **isDOMNode**(`x`): `x is Node`

Defined in: [packages/lexical/src/LexicalUtils.ts:1856](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L1856)

#### Parameters

##### x

`unknown`

The element being tested

#### Returns

`x is Node`

Returns true if x is a DOM Node, false otherwise.

***

### isDOMTextNode() {#isdomtextnode}

> **isDOMTextNode**(`node`): `node is Text`

Defined in: [packages/lexical/src/LexicalUtils.ts:246](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L246)

#### Parameters

##### node

`unknown`

The element being tested

#### Returns

`node is Text`

Returns true if node is an DOM Text node, false otherwise.

***

### isExactShortcutMatch() {#isexactshortcutmatch}

> **isExactShortcutMatch**(`event`, `expectedKey`, `mask`): `boolean`

Defined in: [packages/lexical/src/LexicalUtils.ts:995](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L995)

Match a KeyboardEvent with its expected state

#### Parameters

##### event

`KeyboardEventModifiers`

A KeyboardEvent, or structurally similar object

##### expectedKey

`string`

The string to compare with event.key (case insensitive)

##### mask

`KeyboardEventModifierMask`

An object specifying the expected state of the modifiers

#### Returns

`boolean`

true if the event matches

***

### isHTMLAnchorElement() {#ishtmlanchorelement}

> **isHTMLAnchorElement**(`x`): `x is HTMLAnchorElement`

Defined in: [packages/lexical/src/LexicalUtils.ts:1840](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L1840)

#### Parameters

##### x

`unknown`

The element being tested

#### Returns

`x is HTMLAnchorElement`

Returns true if x is an HTML anchor tag, false otherwise

***

### isHTMLElement() {#ishtmlelement}

> **isHTMLElement**(`x`): `x is HTMLElement`

Defined in: [packages/lexical/src/LexicalUtils.ts:1848](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L1848)

#### Parameters

##### x

`unknown`

The element being tested

#### Returns

`x is HTMLElement`

Returns true if x is an HTML element, false otherwise.

***

### isInlineDomNode() {#isinlinedomnode}

> **isInlineDomNode**(`node`): `boolean`

Defined in: [packages/lexical/src/LexicalUtils.ts:1878](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L1878)

#### Parameters

##### node

`Node`

the Dom Node to check

#### Returns

`boolean`

if the Dom Node is an inline node

***

### isLexicalEditor() {#islexicaleditor}

> **isLexicalEditor**(`editor`): `editor is LexicalEditor`

Defined in: [packages/lexical/src/LexicalUtils.ts:193](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L193)

#### Parameters

##### editor

`unknown`

#### Returns

`editor is LexicalEditor`

true if the given argument is a LexicalEditor instance from this build of Lexical

***

### isModifierMatch() {#ismodifiermatch}

> **isModifierMatch**(`event`, `mask`): `boolean`

Defined in: [packages/lexical/src/LexicalUtils.ts:975](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L975)

Match a KeyboardEvent with its expected modifier state

#### Parameters

##### event

`KeyboardEventModifiers`

A KeyboardEvent, or structurally similar object

##### mask

`KeyboardEventModifierMask`

An object specifying the expected state of the modifiers

#### Returns

`boolean`

true if the event matches

***

### isSelectionCapturedInDecoratorInput() {#isselectioncapturedindecoratorinput}

> **isSelectionCapturedInDecoratorInput**(`anchorDOM`): `boolean`

Defined in: [packages/lexical/src/LexicalUtils.ts:152](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L152)

#### Parameters

##### anchorDOM

`Node`

#### Returns

`boolean`

***

### isSelectionWithinEditor() {#isselectionwithineditor}

> **isSelectionWithinEditor**(`editor`, `anchorDOM`, `focusDOM`): `boolean`

Defined in: [packages/lexical/src/LexicalUtils.ts:169](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L169)

#### Parameters

##### editor

[`LexicalEditor`](#lexicaleditor)

##### anchorDOM

`null` | `Node`

##### focusDOM

`null` | `Node`

#### Returns

`boolean`

***

### makeStepwiseIterator() {#makestepwiseiterator}

> **makeStepwiseIterator**\<`State`, `Stop`, `Value`\>(`config`): `IterableIterator`\<`Value`\>

Defined in: [packages/lexical/src/caret/LexicalCaret.ts:1185](https://github.com/facebook/lexical/tree/main/packages/lexical/src/caret/LexicalCaret.ts#L1185)

A generalized utility for creating a stepwise iterator
based on:

- an initial state
- a stop guard that returns true if the iteration is over, this
  is typically used to detect a sentinel value such as null or
  undefined from the state but may return true for other conditions
  as well
- a step function that advances the state (this will be called
  after map each time next() is called to prepare the next state)
- a map function that will be called that may transform the state
  before returning it. It will only be called once for each next()
  call when stop(state) === false

#### Type Parameters

##### State

`State`

##### Stop

`Stop`

##### Value

`Value`

#### Parameters

##### config

[`StepwiseIteratorConfig`](#stepwiseiteratorconfig)\<`State`, `Stop`, `Value`\>

#### Returns

`IterableIterator`\<`Value`\>

An IterableIterator

***

### mergeRegister() {#mergeregister}

> **mergeRegister**(...`func`): () => `void`

Defined in: [packages/lexical/src/utils/mergeRegister.ts:34](https://github.com/facebook/lexical/tree/main/packages/lexical/src/utils/mergeRegister.ts#L34)

Returns a function that will execute all functions passed when called. It is generally used
to register multiple lexical listeners and then tear them down with a single function call, such
as React's useEffect hook.

#### Parameters

##### func

...() => `void`[]

An array of cleanup functions meant to be executed by the returned function.

#### Returns

the function which executes all the passed cleanup functions.

> (): `void`

##### Returns

`void`

#### Example

```ts
useEffect(() => {
  return mergeRegister(
    editor.registerCommand(...registerCommand1 logic),
    editor.registerCommand(...registerCommand2 logic),
    editor.registerCommand(...registerCommand3 logic)
  )
}, [editor])
```
In this case, useEffect is returning the function returned by mergeRegister as a cleanup
function to be executed after either the useEffect runs again (due to one of its dependencies
updating) or the component it resides in unmounts.
Note the functions don't necessarily need to be in an array as all arguments
are considered to be the func argument and spread from there.
The order of cleanup is the reverse of the argument order. Generally it is
expected that the first "acquire" will be "released" last (LIFO order),
because a later step may have some dependency on an earlier one.

***

### removeClassNamesFromElement() {#removeclassnamesfromelement}

> **removeClassNamesFromElement**(`element`, ...`classNames`): `void`

Defined in: [packages/lexical/src/utils/classNames.ts:50](https://github.com/facebook/lexical/tree/main/packages/lexical/src/utils/classNames.ts#L50)

Takes an HTML element and removes the classNames passed within an array,
ignoring any non-string types. A space can be used to remove multiple classes
eg. removeClassNamesFromElement(element, ['active small', true, null])
will remove both the 'active' and 'small' classes from that element.

#### Parameters

##### element

`HTMLElement`

The element in which the classes are removed

##### classNames

...(`undefined` \| `null` \| `string` \| `boolean`)[]

An array defining the class names to remove from the element

#### Returns

`void`

***

### resetRandomKey() {#resetrandomkey}

> **resetRandomKey**(): `void`

Defined in: [packages/lexical/src/LexicalUtils.ts:105](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L105)

#### Returns

`void`

***

### safeCast() {#safecast}

> **safeCast**\<`T`\>(`value`): `T`

Defined in: [packages/lexical/src/extension-core/safeCast.ts:16](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/safeCast.ts#L16)

Explicitly and safely cast a value to a specific type when inference or
satisfies isn't going to work as expected (often useful for the config
property with [defineExtension](#defineextension))

@__NO_SIDE_EFFECTS__

#### Type Parameters

##### T

`T`

#### Parameters

##### value

`T`

#### Returns

`T`

***

### setNodeIndentFromDOM() {#setnodeindentfromdom}

> **setNodeIndentFromDOM**(`elementDom`, `elementNode`): `void`

Defined in: [packages/lexical/src/LexicalUtils.ts:2040](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L2040)

#### Parameters

##### elementDom

`HTMLElement`

##### elementNode

[`ElementNode`](#elementnode)

#### Returns

`void`

***

### shallowMergeConfig() {#shallowmergeconfig}

> **shallowMergeConfig**\<`T`\>(`config`, `overrides?`): `T`

Defined in: [packages/lexical/src/extension-core/shallowMergeConfig.ts:17](https://github.com/facebook/lexical/tree/main/packages/lexical/src/extension-core/shallowMergeConfig.ts#L17)

The default merge strategy for extension configuration is a shallow merge.

#### Type Parameters

##### T

`T` *extends* [`ExtensionConfigBase`](#extensionconfigbase)

#### Parameters

##### config

`T`

A full config

##### overrides?

`Partial`\<`T`\>

A partial config of overrides

#### Returns

`T`

config if there are no overrides, otherwise `{...config, ...overrides}`

***

### toggleTextFormatType() {#toggletextformattype}

> **toggleTextFormatType**(`format`, `type`, `alignWithFormat`): `number`

Defined in: [packages/lexical/src/LexicalUtils.ts:269](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalUtils.ts#L269)

#### Parameters

##### format

`number`

##### type

[`TextFormatType`](#textformattype)

##### alignWithFormat

`null` | `number`

#### Returns

`number`
