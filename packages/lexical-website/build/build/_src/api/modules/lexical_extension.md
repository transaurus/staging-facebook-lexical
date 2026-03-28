# @lexical/extension

## Classes

### DecoratorTextNode {#decoratortextnode}

Defined in: [packages/lexical-extension/src/DecoratorTextExtension.ts:45](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/DecoratorTextExtension.ts#L45)

#### Extends

- [`DecoratorNode`](lexical.md#decoratornode)\<`JSX.Element`\>

#### Constructors

##### Constructor

> **new DecoratorTextNode**(`key?`): [`DecoratorTextNode`](#decoratortextnode)

Defined in: [packages/lexical/src/LexicalNode.ts:569](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L569)

###### Parameters

###### key?

`string`

###### Returns

[`DecoratorTextNode`](#decoratortextnode)

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`constructor`](lexical.md#constructor)

#### Properties

##### importDOM()? {#importdom}

> `static` `optional` **importDOM**: () => `null` \| [`DOMConversionMap`](lexical.md#domconversionmap)\<`any`\>

Defined in: [packages/lexical/src/LexicalNode.ts:567](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L567)

###### Returns

`null` \| [`DOMConversionMap`](lexical.md#domconversionmap)\<`any`\>

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`importDOM`](lexical.md#importdom)

#### Methods

##### $config() {#config}

> **$config**(): `StaticNodeConfigRecord`\<`"decorator-text"`, \{ `extends`: *typeof* [`DecoratorNode`](lexical.md#decoratornode); `stateConfigs`: `object`[]; \}\>

Defined in: [packages/lexical-extension/src/DecoratorTextExtension.ts:46](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/DecoratorTextExtension.ts#L46)

Override this to implement the new static node configuration protocol,
this method is called directly on the prototype and must not depend
on anything initialized in the constructor. Generally it should be
a trivial implementation.

###### Returns

`StaticNodeConfigRecord`\<`"decorator-text"`, \{ `extends`: *typeof* [`DecoratorNode`](lexical.md#decoratornode); `stateConfigs`: `object`[]; \}\>

###### Example

```ts
class MyNode extends TextNode {
  $config() {
    return this.config('my-node', {extends: TextNode});
  }
}
```

###### Overrides

[`DecoratorNode`](lexical.md#decoratornode).[`$config`](lexical.md#config)

##### afterCloneFrom() {#afterclonefrom}

> **afterCloneFrom**(`prevNode`): `void`

Defined in: [packages/lexical/src/LexicalNode.ts:544](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L544)

Perform any state updates on the clone of prevNode that are not already
handled by the constructor call in the static clone method. If you have
state to update in your clone that is not handled directly by the
constructor, it is advisable to override this method but it is required
to include a call to `super.afterCloneFrom(prevNode)` in your
implementation. This is only intended to be called by
[$cloneWithProperties](lexical.md#clonewithproperties) function or via a super call.

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

[`DecoratorNode`](lexical.md#decoratornode).[`afterCloneFrom`](lexical.md#afterclonefrom)

##### config() {#config-2}

> **config**\<`Type`, `Config`\>(`type`, `config`): `StaticNodeConfigRecord`\<`Type`, `Config`\>

Defined in: [packages/lexical/src/LexicalNode.ts:484](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L484)

This is a convenience method for $config that
aids in type inference. See [LexicalNode.$config](lexical.md#config-15)
for example usage.

###### Type Parameters

###### Type

`Type` *extends* `string`

###### Config

`Config` *extends* [`StaticNodeConfigValue`](lexical.md#staticnodeconfigvalue)\<[`DecoratorTextNode`](#decoratortextnode), `Type`\>

###### Parameters

###### type

`Type`

###### config

`Config`

###### Returns

`StaticNodeConfigRecord`\<`Type`, `Config`\>

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`config`](lexical.md#config-2)

##### createDOM() {#createdom}

> **createDOM**(): `HTMLElement`

Defined in: [packages/lexical-extension/src/DecoratorTextExtension.ts:80](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/DecoratorTextExtension.ts#L80)

Called during the reconciliation process to determine which nodes
to insert into the DOM for this Lexical Node.

This method must return exactly one HTMLElement. Nested elements are not supported.

Do not attempt to update the Lexical EditorState during this phase of the update lifecycle.

###### Returns

`HTMLElement`

###### Overrides

[`DecoratorNode`](lexical.md#decoratornode).[`createDOM`](lexical.md#createdom)

##### createParentElementNode() {#createparentelementnode}

> **createParentElementNode**(): [`ElementNode`](lexical.md#elementnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1414](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1414)

The creation logic for any required parent. Should be implemented if [isParentRequired](lexical.md#isparentrequired-6) returns true.

###### Returns

[`ElementNode`](lexical.md#elementnode)

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`createParentElementNode`](lexical.md#createparentelementnode)

##### decorate() {#decorate}

> **decorate**(`editor`, `config`): `null` \| `Element`

Defined in: [packages/lexical/src/nodes/LexicalDecoratorNode.ts:30](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalDecoratorNode.ts#L30)

The returned value is added to the LexicalEditor._decorators

###### Parameters

###### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

###### config

[`EditorConfig`](lexical.md#editorconfig)

###### Returns

`null` \| `Element`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`decorate`](lexical.md#decorate)

##### exportDOM() {#exportdom}

> **exportDOM**(`editor`): [`DOMExportOutput`](lexical.md#domexportoutput)

Defined in: [packages/lexical/src/LexicalNode.ts:1124](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1124)

Controls how the this node is serialized to HTML. This is important for
copy and paste between Lexical and non-Lexical editors, or Lexical editors with different namespaces,
in which case the primary transfer format is HTML. It's also important if you're serializing
to HTML for any other reason via [@lexical/html!$generateHtmlFromNodes](lexical_html.md#generatehtmlfromnodes). You could
also use this method to build your own HTML renderer.

###### Parameters

###### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

###### Returns

[`DOMExportOutput`](lexical.md#domexportoutput)

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`exportDOM`](lexical.md#exportdom)

##### exportJSON() {#exportjson}

> **exportJSON**(): [`SerializedLexicalNode`](lexical.md#serializedlexicalnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1136](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1136)

Controls how the this node is serialized to JSON. This is important for
copy and paste between Lexical editors sharing the same namespace. It's also important
if you're serializing to JSON for persistent storage somewhere.
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Returns

[`SerializedLexicalNode`](lexical.md#serializedlexicalnode)

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`exportJSON`](lexical.md#exportjson)

##### ~~getCommonAncestor()~~ {#getcommonancestor}

> **getCommonAncestor**\<`T`\>(`node`): `null` \| `T`

Defined in: [packages/lexical/src/LexicalNode.ts:861](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L861)

###### Type Parameters

###### T

`T` *extends* [`ElementNode`](lexical.md#elementnode) = [`ElementNode`](lexical.md#elementnode)

###### Parameters

###### node

[`LexicalNode`](lexical.md#lexicalnode)

the other node to find the common ancestor of.

###### Returns

`null` \| `T`

###### Deprecated

use [$getCommonAncestor](lexical.md#getcommonancestor-8)

Returns the closest common ancestor of this node and the provided one or null
if one cannot be found.

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getCommonAncestor`](lexical.md#getcommonancestor)

##### getFormat() {#getformat}

> **getFormat**(): `number`

Defined in: [packages/lexical-extension/src/DecoratorTextExtension.ts:53](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/DecoratorTextExtension.ts#L53)

###### Returns

`number`

##### getFormatFlags() {#getformatflags}

> **getFormatFlags**(`type`, `alignWithFormat`): `number`

Defined in: [packages/lexical-extension/src/DecoratorTextExtension.ts:57](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/DecoratorTextExtension.ts#L57)

###### Parameters

###### type

[`TextFormatType`](lexical.md#textformattype)

###### alignWithFormat

`null` | `number`

###### Returns

`number`

##### getIndexWithinParent() {#getindexwithinparent}

> **getIndexWithinParent**(): `number`

Defined in: [packages/lexical/src/LexicalNode.ts:687](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L687)

Returns the zero-based index of this node within the parent.

###### Returns

`number`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getIndexWithinParent`](lexical.md#getindexwithinparent)

##### getKey() {#getkey}

> **getKey**(): `string`

Defined in: [packages/lexical/src/LexicalNode.ts:679](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L679)

Returns this nodes key.

###### Returns

`string`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getKey`](lexical.md#getkey)

##### getLatest() {#getlatest}

> **getLatest**(): `this`

Defined in: [packages/lexical/src/LexicalNode.ts:1012](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1012)

Returns the latest version of the node from the active EditorState.
This is used to avoid getting values from stale node references.

###### Returns

`this`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getLatest`](lexical.md#getlatest)

##### getNextSibling() {#getnextsibling}

> **getNextSibling**\<`T`\>(): `null` \| `T`

Defined in: [packages/lexical/src/LexicalNode.ts:832](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L832)

Returns the "next" siblings - that is, the node that comes
after this one in the same parent

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](lexical.md#lexicalnode)

###### Returns

`null` \| `T`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getNextSibling`](lexical.md#getnextsibling)

##### getNextSiblings() {#getnextsiblings}

> **getNextSiblings**\<`T`\>(): `T`[]

Defined in: [packages/lexical/src/LexicalNode.ts:843](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L843)

Returns all "next" siblings - that is, the nodes that come between this
one and the last child of it's parent, inclusive.

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](lexical.md#lexicalnode)

###### Returns

`T`[]

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getNextSiblings`](lexical.md#getnextsiblings)

##### getNodesBetween() {#getnodesbetween}

> **getNodesBetween**(`targetNode`): [`LexicalNode`](lexical.md#lexicalnode)[]

Defined in: [packages/lexical/src/LexicalNode.ts:931](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L931)

Returns a list of nodes that are between this node and
the target node in the EditorState.

###### Parameters

###### targetNode

[`LexicalNode`](lexical.md#lexicalnode)

the node that marks the other end of the range of nodes to be returned.

###### Returns

[`LexicalNode`](lexical.md#lexicalnode)[]

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getNodesBetween`](lexical.md#getnodesbetween)

##### getParent() {#getparent}

> **getParent**\<`T`\>(): `null` \| `T`

Defined in: [packages/lexical/src/LexicalNode.ts:707](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L707)

Returns the parent of this node, or null if none is found.

###### Type Parameters

###### T

`T` *extends* [`ElementNode`](lexical.md#elementnode)

###### Returns

`null` \| `T`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getParent`](lexical.md#getparent)

##### getParentKeys() {#getparentkeys}

> **getParentKeys**(): `string`[]

Defined in: [packages/lexical/src/LexicalNode.ts:784](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L784)

Returns a list of the keys of every ancestor of this node,
all the way up to the RootNode.

###### Returns

`string`[]

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getParentKeys`](lexical.md#getparentkeys)

##### getParentOrThrow() {#getparentorthrow}

> **getParentOrThrow**\<`T`\>(): `T`

Defined in: [packages/lexical/src/LexicalNode.ts:718](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L718)

Returns the parent of this node, or throws if none is found.

###### Type Parameters

###### T

`T` *extends* [`ElementNode`](lexical.md#elementnode)

###### Returns

`T`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getParentOrThrow`](lexical.md#getparentorthrow)

##### getParents() {#getparents}

> **getParents**(): [`ElementNode`](lexical.md#elementnode)[]

Defined in: [packages/lexical/src/LexicalNode.ts:769](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L769)

Returns a list of the every ancestor of this node,
all the way up to the RootNode.

###### Returns

[`ElementNode`](lexical.md#elementnode)[]

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getParents`](lexical.md#getparents)

##### getPreviousSibling() {#getprevioussibling}

> **getPreviousSibling**\<`T`\>(): `null` \| `T`

Defined in: [packages/lexical/src/LexicalNode.ts:799](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L799)

Returns the "previous" siblings - that is, the node that comes
before this one in the same parent.

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](lexical.md#lexicalnode)

###### Returns

`null` \| `T`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getPreviousSibling`](lexical.md#getprevioussibling)

##### getPreviousSiblings() {#getprevioussiblings}

> **getPreviousSiblings**\<`T`\>(): `T`[]

Defined in: [packages/lexical/src/LexicalNode.ts:810](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L810)

Returns the "previous" siblings - that is, the nodes that come between
this one and the first child of it's parent, inclusive.

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](lexical.md#lexicalnode)

###### Returns

`T`[]

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getPreviousSiblings`](lexical.md#getprevioussiblings)

##### getTextContent() {#gettextcontent}

> **getTextContent**(): `string`

Defined in: [packages/lexical/src/LexicalNode.ts:1068](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1068)

Returns the text content of the node. Override this for
custom nodes that should have a representation in plain text
format (for copy + paste, for example)

###### Returns

`string`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getTextContent`](lexical.md#gettextcontent)

##### getTextContentSize() {#gettextcontentsize}

> **getTextContentSize**(): `number`

Defined in: [packages/lexical/src/LexicalNode.ts:1076](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1076)

Returns the length of the string produced by calling getTextContent on this node.

###### Returns

`number`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getTextContentSize`](lexical.md#gettextcontentsize)

##### getTopLevelElement() {#gettoplevelelement}

> **getTopLevelElement**(): `null` \| [`ElementNode`](lexical.md#elementnode) \| [`DecoratorTextNode`](#decoratortextnode)

Defined in: [packages/lexical/src/nodes/LexicalDecoratorNode.ts:17](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalDecoratorNode.ts#L17)

Returns the highest (in the EditorState tree)
non-root ancestor of this node, or null if none is found. See [lexical!$isRootOrShadowRoot](lexical.md#isrootorshadowroot)
for more information on which Elements comprise "roots".

###### Returns

`null` \| [`ElementNode`](lexical.md#elementnode) \| [`DecoratorTextNode`](#decoratortextnode)

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getTopLevelElement`](lexical.md#gettoplevelelement)

##### getTopLevelElementOrThrow() {#gettoplevelelementorthrow}

> **getTopLevelElementOrThrow**(): [`ElementNode`](lexical.md#elementnode) \| [`DecoratorTextNode`](#decoratortextnode)

Defined in: [packages/lexical/src/nodes/LexicalDecoratorNode.ts:18](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalDecoratorNode.ts#L18)

Returns the highest (in the EditorState tree)
non-root ancestor of this node, or throws if none is found. See [lexical!$isRootOrShadowRoot](lexical.md#isrootorshadowroot)
for more information on which Elements comprise "roots".

###### Returns

[`ElementNode`](lexical.md#elementnode) \| [`DecoratorTextNode`](#decoratortextnode)

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getTopLevelElementOrThrow`](lexical.md#gettoplevelelementorthrow)

##### getType() {#gettype}

> **getType**(): `string`

Defined in: [packages/lexical/src/LexicalNode.ts:593](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L593)

Returns the string type of this node.

###### Returns

`string`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getType`](lexical.md#gettype)

##### getWritable() {#getwritable}

> **getWritable**(): `this`

Defined in: [packages/lexical/src/LexicalNode.ts:1032](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1032)

Returns a mutable version of the node using [$cloneWithProperties](lexical.md#clonewithproperties)
if necessary. Will throw an error if called outside of a Lexical Editor
[LexicalEditor.update](lexical.md#update) callback.

###### Returns

`this`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getWritable`](lexical.md#getwritable)

##### hasFormat() {#hasformat}

> **hasFormat**(`type`): `boolean`

Defined in: [packages/lexical-extension/src/DecoratorTextExtension.ts:61](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/DecoratorTextExtension.ts#L61)

###### Parameters

###### type

[`TextFormatType`](lexical.md#textformattype)

###### Returns

`boolean`

##### insertAfter() {#insertafter}

> **insertAfter**(`nodeToInsert`, `restoreSelection`): [`LexicalNode`](lexical.md#lexicalnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1299](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1299)

Inserts a node after this LexicalNode (as the next sibling).

###### Parameters

###### nodeToInsert

[`LexicalNode`](lexical.md#lexicalnode)

The node to insert after this one.

###### restoreSelection

`boolean` = `true`

Whether or not to attempt to resolve the
selection to the appropriate place after the operation is complete.

###### Returns

[`LexicalNode`](lexical.md#lexicalnode)

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`insertAfter`](lexical.md#insertafter)

##### insertBefore() {#insertbefore}

> **insertBefore**(`nodeToInsert`, `restoreSelection`): [`LexicalNode`](lexical.md#lexicalnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1366](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1366)

Inserts a node before this LexicalNode (as the previous sibling).

###### Parameters

###### nodeToInsert

[`LexicalNode`](lexical.md#lexicalnode)

The node to insert before this one.

###### restoreSelection

`boolean` = `true`

Whether or not to attempt to resolve the
selection to the appropriate place after the operation is complete.

###### Returns

[`LexicalNode`](lexical.md#lexicalnode)

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`insertBefore`](lexical.md#insertbefore)

##### is() {#is}

> **is**(`object`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:878](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L878)

Returns true if the provided node is the exact same one as this node, from Lexical's perspective.
Always use this instead of referential equality.

###### Parameters

###### object

the node to perform the equality comparison on.

`undefined` | `null` | [`LexicalNode`](lexical.md#lexicalnode)

###### Returns

`boolean`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`is`](lexical.md#is)

##### isAttached() {#isattached}

> **isAttached**(): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:610](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L610)

Returns true if there is a path between this node and the RootNode, false otherwise.
This is a way of determining if the node is "attached" EditorState. Unattached nodes
won't be reconciled and will ultimately be cleaned up by the Lexical GC.

###### Returns

`boolean`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`isAttached`](lexical.md#isattached)

##### isBefore() {#isbefore}

> **isBefore**(`targetNode`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:896](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L896)

Returns true if this node logically precedes the target node in the
editor state, false otherwise (including if there is no common ancestor).

Note that this notion of isBefore is based on post-order; a descendant
node is always before its ancestors. See also
[$getCommonAncestor](lexical.md#getcommonancestor-8) and $comparePointCaretNext for
more flexible ways to determine the relative positions of nodes.

###### Parameters

###### targetNode

[`LexicalNode`](lexical.md#lexicalnode)

the node we're testing to see if it's after this one.

###### Returns

`boolean`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`isBefore`](lexical.md#isbefore)

##### isDirty() {#isdirty}

> **isDirty**(): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:1001](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1001)

Returns true if this node has been marked dirty during this update cycle.

###### Returns

`boolean`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`isDirty`](lexical.md#isdirty)

##### isInline() {#isinline}

> **isInline**(): `true`

Defined in: [packages/lexical-extension/src/DecoratorTextExtension.ts:76](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/DecoratorTextExtension.ts#L76)

###### Returns

`true`

###### Overrides

[`DecoratorNode`](lexical.md#decoratornode).[`isInline`](lexical.md#isinline)

##### isIsolated() {#isisolated}

> **isIsolated**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalDecoratorNode.ts:34](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalDecoratorNode.ts#L34)

###### Returns

`boolean`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`isIsolated`](lexical.md#isisolated)

##### isKeyboardSelectable() {#iskeyboardselectable}

> **isKeyboardSelectable**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalDecoratorNode.ts:42](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalDecoratorNode.ts#L42)

###### Returns

`boolean`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`isKeyboardSelectable`](lexical.md#iskeyboardselectable)

##### isParentOf() {#isparentof}

> **isParentOf**(`targetNode`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:919](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L919)

Returns true if this node is an ancestor of and distinct from the target node, false otherwise.

###### Parameters

###### targetNode

[`LexicalNode`](lexical.md#lexicalnode)

the would-be child node.

###### Returns

`boolean`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`isParentOf`](lexical.md#isparentof)

##### isParentRequired() {#isparentrequired}

> **isParentRequired**(): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:1406](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1406)

Whether or not this node has a required parent. Used during copy + paste operations
to normalize nodes that would otherwise be orphaned. For example, ListItemNodes without
a ListNode parent or TextNodes with a ParagraphNode parent.

###### Returns

`boolean`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`isParentRequired`](lexical.md#isparentrequired)

##### isSelected() {#isselected}

> **isSelected**(`selection?`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:634](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L634)

Returns true if this node is contained within the provided Selection., false otherwise.
Relies on the algorithms implemented in [BaseSelection.getNodes](lexical.md#getnodes) to determine
what's included.

###### Parameters

###### selection?

The selection that we want to determine if the node is in.

`null` | [`BaseSelection`](lexical.md#baseselection)

###### Returns

`boolean`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`isSelected`](lexical.md#isselected)

##### markDirty() {#markdirty}

> **markDirty**(): `void`

Defined in: [packages/lexical/src/LexicalNode.ts:1475](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1475)

Marks a node dirty, triggering transforms and
forcing it to be reconciled during the update cycle.

###### Returns

`void`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`markDirty`](lexical.md#markdirty)

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
other node heuristics such as [ElementNode#canBeEmpty](lexical.md#canbeempty)

###### Returns

`void`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`remove`](lexical.md#remove)

##### replace() {#replace}

> **replace**\<`N`\>(`replaceWith`, `includeChildren?`): `N`

Defined in: [packages/lexical/src/LexicalNode.ts:1229](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1229)

Replaces this LexicalNode with the provided node, optionally transferring the children
of the replaced node to the replacing node.

###### Type Parameters

###### N

`N` *extends* [`LexicalNode`](lexical.md#lexicalnode)

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

[`DecoratorNode`](lexical.md#decoratornode).[`replace`](lexical.md#replace)

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

[`DecoratorNode`](lexical.md#decoratornode).[`resetOnCopyNodeFrom`](lexical.md#resetoncopynodefrom)

##### selectEnd() {#selectend}

> **selectEnd**(): [`RangeSelection`](lexical.md#rangeselection)

Defined in: [packages/lexical/src/LexicalNode.ts:1422](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1422)

###### Returns

[`RangeSelection`](lexical.md#rangeselection)

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`selectEnd`](lexical.md#selectend)

##### selectNext() {#selectnext}

> **selectNext**(`anchorOffset?`, `focusOffset?`): [`RangeSelection`](lexical.md#rangeselection)

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

[`RangeSelection`](lexical.md#rangeselection)

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`selectNext`](lexical.md#selectnext)

##### selectPrevious() {#selectprevious}

> **selectPrevious**(`anchorOffset?`, `focusOffset?`): [`RangeSelection`](lexical.md#rangeselection)

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

[`RangeSelection`](lexical.md#rangeselection)

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`selectPrevious`](lexical.md#selectprevious)

##### selectStart() {#selectstart}

> **selectStart**(): [`RangeSelection`](lexical.md#rangeselection)

Defined in: [packages/lexical/src/LexicalNode.ts:1418](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1418)

###### Returns

[`RangeSelection`](lexical.md#rangeselection)

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`selectStart`](lexical.md#selectstart)

##### setFormat() {#setformat}

> **setFormat**(`type`): `this`

Defined in: [packages/lexical-extension/src/DecoratorTextExtension.ts:66](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/DecoratorTextExtension.ts#L66)

###### Parameters

###### type

[`StateValueOrUpdater`](lexical.md#statevalueorupdater)\<[`StateConfig`](lexical.md#stateconfig)\<`"format"`, `number`\>\>

###### Returns

`this`

##### toggleFormat() {#toggleformat}

> **toggleFormat**(`type`): `this`

Defined in: [packages/lexical-extension/src/DecoratorTextExtension.ts:70](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/DecoratorTextExtension.ts#L70)

###### Parameters

###### type

[`TextFormatType`](lexical.md#textformattype)

###### Returns

`this`

##### updateDOM() {#updatedom}

> **updateDOM**(): `false`

Defined in: [packages/lexical-extension/src/DecoratorTextExtension.ts:84](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/DecoratorTextExtension.ts#L84)

Called when a node changes and should update the DOM
in whatever way is necessary to make it align with any changes that might
have happened during the update.

Returning "true" here will cause lexical to unmount and recreate the DOM node
(by calling createDOM). You would need to do this if the element tag changes,
for instance.

###### Returns

`false`

###### Overrides

[`DecoratorNode`](lexical.md#decoratornode).[`updateDOM`](lexical.md#updatedom)

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

[`LexicalUpdateJSON`](lexical.md#lexicalupdatejson)\<[`SerializedLexicalNode`](lexical.md#serializedlexicalnode)\>

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

[`DecoratorNode`](lexical.md#decoratornode).[`updateFromJSON`](lexical.md#updatefromjson)

##### clone() {#clone}

> `static` **clone**(`_data`): [`LexicalNode`](lexical.md#lexicalnode)

Defined in: [packages/lexical/src/LexicalNode.ts:452](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L452)

Clones this node, creating a new node with a different key
and adding it to the EditorState (but not attaching it anywhere!). All nodes must
implement this method.

###### Parameters

###### \_data

`unknown`

###### Returns

[`LexicalNode`](lexical.md#lexicalnode)

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`clone`](lexical.md#clone)

##### getType() {#gettype-2}

> `static` **getType**(): `string`

Defined in: [packages/lexical/src/LexicalNode.ts:436](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L436)

Returns the string type of this node. Every node must
implement this and it MUST BE UNIQUE amongst nodes registered
on the editor.

###### Returns

`string`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getType`](lexical.md#gettype-2)

##### importJSON() {#importjson}

> `static` **importJSON**(`_serializedNode`): [`LexicalNode`](lexical.md#lexicalnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1153](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1153)

Controls how the this node is deserialized from JSON. This is usually boilerplate,
but provides an abstraction between the node implementation and serialized interface that can
be important if you ever make breaking changes to a node schema (by adding or removing properties).
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Parameters

###### \_serializedNode

[`SerializedLexicalNode`](lexical.md#serializedlexicalnode)

###### Returns

[`LexicalNode`](lexical.md#lexicalnode)

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`importJSON`](lexical.md#importjson)

##### transform() {#transform}

> `static` **transform**(): `null` \| (`node`) => `void`

Defined in: [packages/lexical/src/LexicalNode.ts:1204](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1204)

**`Experimental`**

Registers the returned function as a transform on the node during
Editor initialization. Most such use cases should be addressed via
the [LexicalEditor.registerNodeTransform](lexical.md#registernodetransform) API.

Experimental - use at your own risk.

###### Returns

`null` \| (`node`) => `void`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`transform`](lexical.md#transform)

***

### HorizontalRuleNode {#horizontalrulenode}

Defined in: [packages/lexical-extension/src/HorizontalRuleExtension.ts:51](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/HorizontalRuleExtension.ts#L51)

#### Extends

- [`DecoratorNode`](lexical.md#decoratornode)\<`unknown`\>

#### Extended by

- [`HorizontalRuleNode`](lexical_react_LexicalHorizontalRuleNode.md#horizontalrulenode)

#### Constructors

##### Constructor

> **new HorizontalRuleNode**(`key?`): [`HorizontalRuleNode`](#horizontalrulenode)

Defined in: [packages/lexical/src/LexicalNode.ts:569](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L569)

###### Parameters

###### key?

`string`

###### Returns

[`HorizontalRuleNode`](#horizontalrulenode)

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`constructor`](lexical.md#constructor)

#### Methods

##### $config() {#config-4}

> **$config**(): [`BaseStaticNodeConfig`](lexical.md#basestaticnodeconfig)

Defined in: [packages/lexical/src/LexicalNode.ts:475](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L475)

Override this to implement the new static node configuration protocol,
this method is called directly on the prototype and must not depend
on anything initialized in the constructor. Generally it should be
a trivial implementation.

###### Returns

[`BaseStaticNodeConfig`](lexical.md#basestaticnodeconfig)

###### Example

```ts
class MyNode extends TextNode {
  $config() {
    return this.config('my-node', {extends: TextNode});
  }
}
```

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`$config`](lexical.md#config)

##### afterCloneFrom() {#afterclonefrom-2}

> **afterCloneFrom**(`prevNode`): `void`

Defined in: [packages/lexical/src/LexicalNode.ts:544](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L544)

Perform any state updates on the clone of prevNode that are not already
handled by the constructor call in the static clone method. If you have
state to update in your clone that is not handled directly by the
constructor, it is advisable to override this method but it is required
to include a call to `super.afterCloneFrom(prevNode)` in your
implementation. This is only intended to be called by
[$cloneWithProperties](lexical.md#clonewithproperties) function or via a super call.

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

[`DecoratorNode`](lexical.md#decoratornode).[`afterCloneFrom`](lexical.md#afterclonefrom)

##### config() {#config-6}

> **config**\<`Type`, `Config`\>(`type`, `config`): `StaticNodeConfigRecord`\<`Type`, `Config`\>

Defined in: [packages/lexical/src/LexicalNode.ts:484](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L484)

This is a convenience method for $config that
aids in type inference. See [LexicalNode.$config](lexical.md#config-15)
for example usage.

###### Type Parameters

###### Type

`Type` *extends* `string`

###### Config

`Config` *extends* [`StaticNodeConfigValue`](lexical.md#staticnodeconfigvalue)\<[`HorizontalRuleNode`](#horizontalrulenode), `Type`\>

###### Parameters

###### type

`Type`

###### config

`Config`

###### Returns

`StaticNodeConfigRecord`\<`Type`, `Config`\>

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`config`](lexical.md#config-2)

##### createDOM() {#createdom-2}

> **createDOM**(`config`): `HTMLElement`

Defined in: [packages/lexical-extension/src/HorizontalRuleExtension.ts:79](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/HorizontalRuleExtension.ts#L79)

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

[`DecoratorNode`](lexical.md#decoratornode).[`createDOM`](lexical.md#createdom)

##### createParentElementNode() {#createparentelementnode-2}

> **createParentElementNode**(): [`ElementNode`](lexical.md#elementnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1414](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1414)

The creation logic for any required parent. Should be implemented if [isParentRequired](lexical.md#isparentrequired-6) returns true.

###### Returns

[`ElementNode`](lexical.md#elementnode)

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`createParentElementNode`](lexical.md#createparentelementnode)

##### decorate() {#decorate-2}

> **decorate**(`editor`, `config`): `unknown`

Defined in: [packages/lexical/src/nodes/LexicalDecoratorNode.ts:30](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalDecoratorNode.ts#L30)

The returned value is added to the LexicalEditor._decorators

###### Parameters

###### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

###### config

[`EditorConfig`](lexical.md#editorconfig)

###### Returns

`unknown`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`decorate`](lexical.md#decorate)

##### exportDOM() {#exportdom-2}

> **exportDOM**(): [`DOMExportOutput`](lexical.md#domexportoutput)

Defined in: [packages/lexical-extension/src/HorizontalRuleExtension.ts:75](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/HorizontalRuleExtension.ts#L75)

Controls how the this node is serialized to HTML. This is important for
copy and paste between Lexical and non-Lexical editors, or Lexical editors with different namespaces,
in which case the primary transfer format is HTML. It's also important if you're serializing
to HTML for any other reason via [@lexical/html!$generateHtmlFromNodes](lexical_html.md#generatehtmlfromnodes). You could
also use this method to build your own HTML renderer.

###### Returns

[`DOMExportOutput`](lexical.md#domexportoutput)

###### Overrides

[`DecoratorNode`](lexical.md#decoratornode).[`exportDOM`](lexical.md#exportdom)

##### exportJSON() {#exportjson-2}

> **exportJSON**(): [`SerializedLexicalNode`](lexical.md#serializedlexicalnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1136](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1136)

Controls how the this node is serialized to JSON. This is important for
copy and paste between Lexical editors sharing the same namespace. It's also important
if you're serializing to JSON for persistent storage somewhere.
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Returns

[`SerializedLexicalNode`](lexical.md#serializedlexicalnode)

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`exportJSON`](lexical.md#exportjson)

##### ~~getCommonAncestor()~~ {#getcommonancestor-2}

> **getCommonAncestor**\<`T`\>(`node`): `null` \| `T`

Defined in: [packages/lexical/src/LexicalNode.ts:861](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L861)

###### Type Parameters

###### T

`T` *extends* [`ElementNode`](lexical.md#elementnode) = [`ElementNode`](lexical.md#elementnode)

###### Parameters

###### node

[`LexicalNode`](lexical.md#lexicalnode)

the other node to find the common ancestor of.

###### Returns

`null` \| `T`

###### Deprecated

use [$getCommonAncestor](lexical.md#getcommonancestor-8)

Returns the closest common ancestor of this node and the provided one or null
if one cannot be found.

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getCommonAncestor`](lexical.md#getcommonancestor)

##### getIndexWithinParent() {#getindexwithinparent-2}

> **getIndexWithinParent**(): `number`

Defined in: [packages/lexical/src/LexicalNode.ts:687](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L687)

Returns the zero-based index of this node within the parent.

###### Returns

`number`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getIndexWithinParent`](lexical.md#getindexwithinparent)

##### getKey() {#getkey-2}

> **getKey**(): `string`

Defined in: [packages/lexical/src/LexicalNode.ts:679](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L679)

Returns this nodes key.

###### Returns

`string`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getKey`](lexical.md#getkey)

##### getLatest() {#getlatest-2}

> **getLatest**(): `this`

Defined in: [packages/lexical/src/LexicalNode.ts:1012](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1012)

Returns the latest version of the node from the active EditorState.
This is used to avoid getting values from stale node references.

###### Returns

`this`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getLatest`](lexical.md#getlatest)

##### getNextSibling() {#getnextsibling-2}

> **getNextSibling**\<`T`\>(): `null` \| `T`

Defined in: [packages/lexical/src/LexicalNode.ts:832](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L832)

Returns the "next" siblings - that is, the node that comes
after this one in the same parent

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](lexical.md#lexicalnode)

###### Returns

`null` \| `T`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getNextSibling`](lexical.md#getnextsibling)

##### getNextSiblings() {#getnextsiblings-2}

> **getNextSiblings**\<`T`\>(): `T`[]

Defined in: [packages/lexical/src/LexicalNode.ts:843](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L843)

Returns all "next" siblings - that is, the nodes that come between this
one and the last child of it's parent, inclusive.

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](lexical.md#lexicalnode)

###### Returns

`T`[]

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getNextSiblings`](lexical.md#getnextsiblings)

##### getNodesBetween() {#getnodesbetween-2}

> **getNodesBetween**(`targetNode`): [`LexicalNode`](lexical.md#lexicalnode)[]

Defined in: [packages/lexical/src/LexicalNode.ts:931](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L931)

Returns a list of nodes that are between this node and
the target node in the EditorState.

###### Parameters

###### targetNode

[`LexicalNode`](lexical.md#lexicalnode)

the node that marks the other end of the range of nodes to be returned.

###### Returns

[`LexicalNode`](lexical.md#lexicalnode)[]

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getNodesBetween`](lexical.md#getnodesbetween)

##### getParent() {#getparent-2}

> **getParent**\<`T`\>(): `null` \| `T`

Defined in: [packages/lexical/src/LexicalNode.ts:707](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L707)

Returns the parent of this node, or null if none is found.

###### Type Parameters

###### T

`T` *extends* [`ElementNode`](lexical.md#elementnode)

###### Returns

`null` \| `T`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getParent`](lexical.md#getparent)

##### getParentKeys() {#getparentkeys-2}

> **getParentKeys**(): `string`[]

Defined in: [packages/lexical/src/LexicalNode.ts:784](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L784)

Returns a list of the keys of every ancestor of this node,
all the way up to the RootNode.

###### Returns

`string`[]

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getParentKeys`](lexical.md#getparentkeys)

##### getParentOrThrow() {#getparentorthrow-2}

> **getParentOrThrow**\<`T`\>(): `T`

Defined in: [packages/lexical/src/LexicalNode.ts:718](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L718)

Returns the parent of this node, or throws if none is found.

###### Type Parameters

###### T

`T` *extends* [`ElementNode`](lexical.md#elementnode)

###### Returns

`T`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getParentOrThrow`](lexical.md#getparentorthrow)

##### getParents() {#getparents-2}

> **getParents**(): [`ElementNode`](lexical.md#elementnode)[]

Defined in: [packages/lexical/src/LexicalNode.ts:769](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L769)

Returns a list of the every ancestor of this node,
all the way up to the RootNode.

###### Returns

[`ElementNode`](lexical.md#elementnode)[]

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getParents`](lexical.md#getparents)

##### getPreviousSibling() {#getprevioussibling-2}

> **getPreviousSibling**\<`T`\>(): `null` \| `T`

Defined in: [packages/lexical/src/LexicalNode.ts:799](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L799)

Returns the "previous" siblings - that is, the node that comes
before this one in the same parent.

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](lexical.md#lexicalnode)

###### Returns

`null` \| `T`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getPreviousSibling`](lexical.md#getprevioussibling)

##### getPreviousSiblings() {#getprevioussiblings-2}

> **getPreviousSiblings**\<`T`\>(): `T`[]

Defined in: [packages/lexical/src/LexicalNode.ts:810](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L810)

Returns the "previous" siblings - that is, the nodes that come between
this one and the first child of it's parent, inclusive.

###### Type Parameters

###### T

`T` *extends* [`LexicalNode`](lexical.md#lexicalnode)

###### Returns

`T`[]

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getPreviousSiblings`](lexical.md#getprevioussiblings)

##### getTextContent() {#gettextcontent-2}

> **getTextContent**(): `string`

Defined in: [packages/lexical-extension/src/HorizontalRuleExtension.ts:85](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/HorizontalRuleExtension.ts#L85)

Returns the text content of the node. Override this for
custom nodes that should have a representation in plain text
format (for copy + paste, for example)

###### Returns

`string`

###### Overrides

[`DecoratorNode`](lexical.md#decoratornode).[`getTextContent`](lexical.md#gettextcontent)

##### getTextContentSize() {#gettextcontentsize-2}

> **getTextContentSize**(): `number`

Defined in: [packages/lexical/src/LexicalNode.ts:1076](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1076)

Returns the length of the string produced by calling getTextContent on this node.

###### Returns

`number`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getTextContentSize`](lexical.md#gettextcontentsize)

##### getTopLevelElement() {#gettoplevelelement-2}

> **getTopLevelElement**(): `null` \| [`ElementNode`](lexical.md#elementnode) \| [`HorizontalRuleNode`](#horizontalrulenode)

Defined in: [packages/lexical/src/nodes/LexicalDecoratorNode.ts:17](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalDecoratorNode.ts#L17)

Returns the highest (in the EditorState tree)
non-root ancestor of this node, or null if none is found. See [lexical!$isRootOrShadowRoot](lexical.md#isrootorshadowroot)
for more information on which Elements comprise "roots".

###### Returns

`null` \| [`ElementNode`](lexical.md#elementnode) \| [`HorizontalRuleNode`](#horizontalrulenode)

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getTopLevelElement`](lexical.md#gettoplevelelement)

##### getTopLevelElementOrThrow() {#gettoplevelelementorthrow-2}

> **getTopLevelElementOrThrow**(): [`ElementNode`](lexical.md#elementnode) \| [`HorizontalRuleNode`](#horizontalrulenode)

Defined in: [packages/lexical/src/nodes/LexicalDecoratorNode.ts:18](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalDecoratorNode.ts#L18)

Returns the highest (in the EditorState tree)
non-root ancestor of this node, or throws if none is found. See [lexical!$isRootOrShadowRoot](lexical.md#isrootorshadowroot)
for more information on which Elements comprise "roots".

###### Returns

[`ElementNode`](lexical.md#elementnode) \| [`HorizontalRuleNode`](#horizontalrulenode)

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getTopLevelElementOrThrow`](lexical.md#gettoplevelelementorthrow)

##### getType() {#gettype-4}

> **getType**(): `string`

Defined in: [packages/lexical/src/LexicalNode.ts:593](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L593)

Returns the string type of this node.

###### Returns

`string`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getType`](lexical.md#gettype)

##### getWritable() {#getwritable-2}

> **getWritable**(): `this`

Defined in: [packages/lexical/src/LexicalNode.ts:1032](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1032)

Returns a mutable version of the node using [$cloneWithProperties](lexical.md#clonewithproperties)
if necessary. Will throw an error if called outside of a Lexical Editor
[LexicalEditor.update](lexical.md#update) callback.

###### Returns

`this`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getWritable`](lexical.md#getwritable)

##### insertAfter() {#insertafter-2}

> **insertAfter**(`nodeToInsert`, `restoreSelection`): [`LexicalNode`](lexical.md#lexicalnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1299](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1299)

Inserts a node after this LexicalNode (as the next sibling).

###### Parameters

###### nodeToInsert

[`LexicalNode`](lexical.md#lexicalnode)

The node to insert after this one.

###### restoreSelection

`boolean` = `true`

Whether or not to attempt to resolve the
selection to the appropriate place after the operation is complete.

###### Returns

[`LexicalNode`](lexical.md#lexicalnode)

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`insertAfter`](lexical.md#insertafter)

##### insertBefore() {#insertbefore-2}

> **insertBefore**(`nodeToInsert`, `restoreSelection`): [`LexicalNode`](lexical.md#lexicalnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1366](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1366)

Inserts a node before this LexicalNode (as the previous sibling).

###### Parameters

###### nodeToInsert

[`LexicalNode`](lexical.md#lexicalnode)

The node to insert before this one.

###### restoreSelection

`boolean` = `true`

Whether or not to attempt to resolve the
selection to the appropriate place after the operation is complete.

###### Returns

[`LexicalNode`](lexical.md#lexicalnode)

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`insertBefore`](lexical.md#insertbefore)

##### is() {#is-2}

> **is**(`object`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:878](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L878)

Returns true if the provided node is the exact same one as this node, from Lexical's perspective.
Always use this instead of referential equality.

###### Parameters

###### object

the node to perform the equality comparison on.

`undefined` | `null` | [`LexicalNode`](lexical.md#lexicalnode)

###### Returns

`boolean`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`is`](lexical.md#is)

##### isAttached() {#isattached-2}

> **isAttached**(): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:610](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L610)

Returns true if there is a path between this node and the RootNode, false otherwise.
This is a way of determining if the node is "attached" EditorState. Unattached nodes
won't be reconciled and will ultimately be cleaned up by the Lexical GC.

###### Returns

`boolean`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`isAttached`](lexical.md#isattached)

##### isBefore() {#isbefore-2}

> **isBefore**(`targetNode`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:896](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L896)

Returns true if this node logically precedes the target node in the
editor state, false otherwise (including if there is no common ancestor).

Note that this notion of isBefore is based on post-order; a descendant
node is always before its ancestors. See also
[$getCommonAncestor](lexical.md#getcommonancestor-8) and $comparePointCaretNext for
more flexible ways to determine the relative positions of nodes.

###### Parameters

###### targetNode

[`LexicalNode`](lexical.md#lexicalnode)

the node we're testing to see if it's after this one.

###### Returns

`boolean`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`isBefore`](lexical.md#isbefore)

##### isDirty() {#isdirty-2}

> **isDirty**(): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:1001](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1001)

Returns true if this node has been marked dirty during this update cycle.

###### Returns

`boolean`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`isDirty`](lexical.md#isdirty)

##### isInline() {#isinline-2}

> **isInline**(): `false`

Defined in: [packages/lexical-extension/src/HorizontalRuleExtension.ts:89](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/HorizontalRuleExtension.ts#L89)

###### Returns

`false`

###### Overrides

[`DecoratorNode`](lexical.md#decoratornode).[`isInline`](lexical.md#isinline)

##### isIsolated() {#isisolated-2}

> **isIsolated**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalDecoratorNode.ts:34](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalDecoratorNode.ts#L34)

###### Returns

`boolean`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`isIsolated`](lexical.md#isisolated)

##### isKeyboardSelectable() {#iskeyboardselectable-2}

> **isKeyboardSelectable**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalDecoratorNode.ts:42](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalDecoratorNode.ts#L42)

###### Returns

`boolean`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`isKeyboardSelectable`](lexical.md#iskeyboardselectable)

##### isParentOf() {#isparentof-2}

> **isParentOf**(`targetNode`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:919](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L919)

Returns true if this node is an ancestor of and distinct from the target node, false otherwise.

###### Parameters

###### targetNode

[`LexicalNode`](lexical.md#lexicalnode)

the would-be child node.

###### Returns

`boolean`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`isParentOf`](lexical.md#isparentof)

##### isParentRequired() {#isparentrequired-2}

> **isParentRequired**(): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:1406](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1406)

Whether or not this node has a required parent. Used during copy + paste operations
to normalize nodes that would otherwise be orphaned. For example, ListItemNodes without
a ListNode parent or TextNodes with a ParagraphNode parent.

###### Returns

`boolean`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`isParentRequired`](lexical.md#isparentrequired)

##### isSelected() {#isselected-2}

> **isSelected**(`selection?`): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:634](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L634)

Returns true if this node is contained within the provided Selection., false otherwise.
Relies on the algorithms implemented in [BaseSelection.getNodes](lexical.md#getnodes) to determine
what's included.

###### Parameters

###### selection?

The selection that we want to determine if the node is in.

`null` | [`BaseSelection`](lexical.md#baseselection)

###### Returns

`boolean`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`isSelected`](lexical.md#isselected)

##### markDirty() {#markdirty-2}

> **markDirty**(): `void`

Defined in: [packages/lexical/src/LexicalNode.ts:1475](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1475)

Marks a node dirty, triggering transforms and
forcing it to be reconciled during the update cycle.

###### Returns

`void`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`markDirty`](lexical.md#markdirty)

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
other node heuristics such as [ElementNode#canBeEmpty](lexical.md#canbeempty)

###### Returns

`void`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`remove`](lexical.md#remove)

##### replace() {#replace-2}

> **replace**\<`N`\>(`replaceWith`, `includeChildren?`): `N`

Defined in: [packages/lexical/src/LexicalNode.ts:1229](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1229)

Replaces this LexicalNode with the provided node, optionally transferring the children
of the replaced node to the replacing node.

###### Type Parameters

###### N

`N` *extends* [`LexicalNode`](lexical.md#lexicalnode)

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

[`DecoratorNode`](lexical.md#decoratornode).[`replace`](lexical.md#replace)

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

[`DecoratorNode`](lexical.md#decoratornode).[`resetOnCopyNodeFrom`](lexical.md#resetoncopynodefrom)

##### selectEnd() {#selectend-2}

> **selectEnd**(): [`RangeSelection`](lexical.md#rangeselection)

Defined in: [packages/lexical/src/LexicalNode.ts:1422](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1422)

###### Returns

[`RangeSelection`](lexical.md#rangeselection)

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`selectEnd`](lexical.md#selectend)

##### selectNext() {#selectnext-2}

> **selectNext**(`anchorOffset?`, `focusOffset?`): [`RangeSelection`](lexical.md#rangeselection)

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

[`RangeSelection`](lexical.md#rangeselection)

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`selectNext`](lexical.md#selectnext)

##### selectPrevious() {#selectprevious-2}

> **selectPrevious**(`anchorOffset?`, `focusOffset?`): [`RangeSelection`](lexical.md#rangeselection)

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

[`RangeSelection`](lexical.md#rangeselection)

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`selectPrevious`](lexical.md#selectprevious)

##### selectStart() {#selectstart-2}

> **selectStart**(): [`RangeSelection`](lexical.md#rangeselection)

Defined in: [packages/lexical/src/LexicalNode.ts:1418](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1418)

###### Returns

[`RangeSelection`](lexical.md#rangeselection)

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`selectStart`](lexical.md#selectstart)

##### updateDOM() {#updatedom-2}

> **updateDOM**(): `boolean`

Defined in: [packages/lexical-extension/src/HorizontalRuleExtension.ts:93](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/HorizontalRuleExtension.ts#L93)

Called when a node changes and should update the DOM
in whatever way is necessary to make it align with any changes that might
have happened during the update.

Returning "true" here will cause lexical to unmount and recreate the DOM node
(by calling createDOM). You would need to do this if the element tag changes,
for instance.

###### Returns

`boolean`

###### Overrides

[`DecoratorNode`](lexical.md#decoratornode).[`updateDOM`](lexical.md#updatedom)

##### updateFromJSON() {#updatefromjson-2}

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

[`LexicalUpdateJSON`](lexical.md#lexicalupdatejson)\<[`SerializedLexicalNode`](lexical.md#serializedlexicalnode)\>

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

[`DecoratorNode`](lexical.md#decoratornode).[`updateFromJSON`](lexical.md#updatefromjson)

##### clone() {#clone-2}

> `static` **clone**(`node`): [`HorizontalRuleNode`](#horizontalrulenode)

Defined in: [packages/lexical-extension/src/HorizontalRuleExtension.ts:56](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/HorizontalRuleExtension.ts#L56)

Clones this node, creating a new node with a different key
and adding it to the EditorState (but not attaching it anywhere!). All nodes must
implement this method.

###### Parameters

###### node

[`HorizontalRuleNode`](#horizontalrulenode)

###### Returns

[`HorizontalRuleNode`](#horizontalrulenode)

###### Overrides

[`DecoratorNode`](lexical.md#decoratornode).[`clone`](lexical.md#clone)

##### getType() {#gettype-6}

> `static` **getType**(): `string`

Defined in: [packages/lexical-extension/src/HorizontalRuleExtension.ts:52](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/HorizontalRuleExtension.ts#L52)

Returns the string type of this node. Every node must
implement this and it MUST BE UNIQUE amongst nodes registered
on the editor.

###### Returns

`string`

###### Overrides

[`DecoratorNode`](lexical.md#decoratornode).[`getType`](lexical.md#gettype-2)

##### importDOM() {#importdom-1}

> `static` **importDOM**(): `null` \| [`DOMConversionMap`](lexical.md#domconversionmap)

Defined in: [packages/lexical-extension/src/HorizontalRuleExtension.ts:66](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/HorizontalRuleExtension.ts#L66)

###### Returns

`null` \| [`DOMConversionMap`](lexical.md#domconversionmap)

###### Overrides

`DecoratorNode.importDOM`

##### importJSON() {#importjson-2}

> `static` **importJSON**(`serializedNode`): [`HorizontalRuleNode`](#horizontalrulenode)

Defined in: [packages/lexical-extension/src/HorizontalRuleExtension.ts:60](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/HorizontalRuleExtension.ts#L60)

Controls how the this node is deserialized from JSON. This is usually boilerplate,
but provides an abstraction between the node implementation and serialized interface that can
be important if you ever make breaking changes to a node schema (by adding or removing properties).
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Parameters

###### serializedNode

[`SerializedLexicalNode`](lexical.md#serializedlexicalnode)

###### Returns

[`HorizontalRuleNode`](#horizontalrulenode)

###### Overrides

[`DecoratorNode`](lexical.md#decoratornode).[`importJSON`](lexical.md#importjson)

##### transform() {#transform-2}

> `static` **transform**(): `null` \| (`node`) => `void`

Defined in: [packages/lexical/src/LexicalNode.ts:1204](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1204)

**`Experimental`**

Registers the returned function as a transform on the node during
Editor initialization. Most such use cases should be addressed via
the [LexicalEditor.registerNodeTransform](lexical.md#registernodetransform) API.

Experimental - use at your own risk.

###### Returns

`null` \| (`node`) => `void`

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`transform`](lexical.md#transform)

## Interfaces

### AutoFocusConfig {#autofocusconfig}

Defined in: [packages/lexical-extension/src/AutoFocusExtension.ts:15](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/AutoFocusExtension.ts#L15)

#### Properties

##### defaultSelection {#defaultselection}

> **defaultSelection**: `DefaultSelection`

Defined in: [packages/lexical-extension/src/AutoFocusExtension.ts:20](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/AutoFocusExtension.ts#L20)

Where to move the selection when the editor is focused and there is no
existing selection. Can be "rootStart" or "rootEnd" (the default).

##### disabled {#disabled}

> **disabled**: `boolean`

Defined in: [packages/lexical-extension/src/AutoFocusExtension.ts:24](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/AutoFocusExtension.ts#L24)

The initial state of disabled

***

### ClearEditorConfig {#cleareditorconfig}

Defined in: [packages/lexical-extension/src/ClearEditorExtension.ts:39](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/ClearEditorExtension.ts#L39)

#### Properties

##### $onClear() {#onclear}

> **$onClear**: () => `void`

Defined in: [packages/lexical-extension/src/ClearEditorExtension.ts:40](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/ClearEditorExtension.ts#L40)

###### Returns

`void`

***

### InitialStateConfig {#initialstateconfig}

Defined in: [packages/lexical-extension/src/InitialStateExtension.ts:37](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/InitialStateExtension.ts#L37)

#### Properties

##### setOptions {#setoptions}

> **setOptions**: [`EditorSetOptions`](lexical.md#editorsetoptions)

Defined in: [packages/lexical-extension/src/InitialStateExtension.ts:39](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/InitialStateExtension.ts#L39)

##### updateOptions {#updateoptions}

> **updateOptions**: [`EditorUpdateOptions`](lexical.md#editorupdateoptions)

Defined in: [packages/lexical-extension/src/InitialStateExtension.ts:38](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/InitialStateExtension.ts#L38)

***

### KnownTypesAndNodes {#knowntypesandnodes}

Defined in: [packages/lexical-extension/src/config.ts:15](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/config.ts#L15)

#### Properties

##### nodes {#nodes}

> **nodes**: `Set`\<[`KlassConstructor`](lexical.md#klassconstructor)\<*typeof* [`LexicalNode`](lexical.md#lexicalnode)\>\>

Defined in: [packages/lexical-extension/src/config.ts:17](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/config.ts#L17)

##### types {#types}

> **types**: `Set`\<`string`\>

Defined in: [packages/lexical-extension/src/config.ts:16](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/config.ts#L16)

***

### ReadonlySignal {#readonlysignal}

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:76](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L76)

An interface for read-only signals.

#### Type Parameters

##### T

`T` = `any`

#### Properties

##### brand {#brand}

> **brand**: *typeof* `BRAND_SYMBOL`

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:83](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L83)

##### value {#value}

> `readonly` **value**: `T`

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:77](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L77)

#### Methods

##### peek() {#peek}

> **peek**(): `T`

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:78](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L78)

###### Returns

`T`

##### subscribe() {#subscribe}

> **subscribe**(`fn`): () => `void`

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:79](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L79)

###### Parameters

###### fn

(`value`) => `void`

###### Returns

> (): `void`

###### Returns

`void`

##### toJSON() {#tojson}

> **toJSON**(): `T`

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:82](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L82)

###### Returns

`T`

##### toString() {#tostring}

> **toString**(): `string`

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:81](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L81)

###### Returns

`string`

##### valueOf() {#valueof}

> **valueOf**(): `T`

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:80](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L80)

###### Returns

`T`

***

### Signal {#signal}

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:36](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L36)

The base class for plain and computed signals.

#### Type Parameters

##### T

`T` = `any`

#### Properties

##### brand {#brand-1}

> **brand**: *typeof* `BRAND_SYMBOL`

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:44](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L44)

##### name? {#name}

> `optional` **name**: `string`

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:39](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L39)

#### Accessors

##### value {#value-1}

###### Get Signature

> **get** **value**(): `T`

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:45](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L45)

###### Returns

`T`

###### Set Signature

> **set** **value**(`value`): `void`

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:46](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L46)

###### Parameters

###### value

`T`

###### Returns

`void`

#### Methods

##### peek() {#peek-2}

> **peek**(): `T`

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:43](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L43)

###### Returns

`T`

##### subscribe() {#subscribe-2}

> **subscribe**(`fn`): () => `void`

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:38](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L38)

###### Parameters

###### fn

(`value`) => `void`

###### Returns

> (): `void`

###### Returns

`void`

##### toJSON() {#tojson-2}

> **toJSON**(): `T`

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:42](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L42)

###### Returns

`T`

##### toString() {#tostring-2}

> **toString**(): `string`

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:41](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L41)

###### Returns

`string`

##### valueOf() {#valueof-2}

> **valueOf**(): `T`

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:40](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L40)

###### Returns

`T`

***

### SignalOptions {#signaloptions}

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:48](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L48)

#### Type Parameters

##### T

`T` = `any`

#### Properties

##### name? {#name-1}

> `optional` **name**: `string`

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:51](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L51)

##### unwatched()? {#unwatched}

> `optional` **unwatched**: (`this`) => `void`

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:50](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L50)

###### Parameters

###### this

[`Signal`](#signal)\<`T`\>

###### Returns

`void`

##### watched()? {#watched}

> `optional` **watched**: (`this`) => `void`

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:49](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L49)

###### Parameters

###### this

[`Signal`](#signal)\<`T`\>

###### Returns

`void`

***

### TabIndentationConfig {#tabindentationconfig}

Defined in: [packages/lexical-extension/src/TabIndentationExtension.ts:134](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/TabIndentationExtension.ts#L134)

#### Properties

##### $canIndent {#canindent}

> **$canIndent**: [`CanIndentPredicate`](#canindentpredicate)

Defined in: [packages/lexical-extension/src/TabIndentationExtension.ts:141](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/TabIndentationExtension.ts#L141)

By default, indents are set on all elements for which the [ElementNode.canIndent](lexical.md#canindent) returns true.
This option allows you to set indents for specific nodes without overriding the method for others.

##### disabled {#disabled-1}

> **disabled**: `boolean`

Defined in: [packages/lexical-extension/src/TabIndentationExtension.ts:135](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/TabIndentationExtension.ts#L135)

##### maxIndent {#maxindent}

> **maxIndent**: `null` \| `number`

Defined in: [packages/lexical-extension/src/TabIndentationExtension.ts:136](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/TabIndentationExtension.ts#L136)

## Type Aliases

### CanIndentPredicate() {#canindentpredicate}

> **CanIndentPredicate** = (`node`) => `boolean`

Defined in: [packages/lexical-extension/src/TabIndentationExtension.ts:70](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/TabIndentationExtension.ts#L70)

#### Parameters

##### node

[`ElementNode`](lexical.md#elementnode)

#### Returns

`boolean`

***

### NamedSignalsOptions {#namedsignalsoptions}

> **NamedSignalsOptions**\<`Defaults`\> = `{ [K in keyof Defaults]?: Defaults[K] }`

Defined in: [packages/lexical-extension/src/namedSignals.ts:10](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/namedSignals.ts#L10)

#### Type Parameters

##### Defaults

`Defaults`

***

### NamedSignalsOutput {#namedsignalsoutput}

> **NamedSignalsOutput**\<`Defaults`\> = `{ [K in keyof Defaults]: Signal<Defaults[K]> }`

Defined in: [packages/lexical-extension/src/namedSignals.ts:13](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/namedSignals.ts#L13)

#### Type Parameters

##### Defaults

`Defaults`

***

### SerializedDecoratorTextNode {#serializeddecoratortextnode}

> **SerializedDecoratorTextNode** = [`Spread`](lexical.md#spread)\<\{ `format`: `number`; \}, [`SerializedLexicalNode`](lexical.md#serializedlexicalnode)\>

Defined in: [packages/lexical-extension/src/DecoratorTextExtension.ts:34](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/DecoratorTextExtension.ts#L34)

***

### SerializedHorizontalRuleNode {#serializedhorizontalrulenode}

> **SerializedHorizontalRuleNode** = [`SerializedLexicalNode`](lexical.md#serializedlexicalnode)

Defined in: [packages/lexical-extension/src/HorizontalRuleExtension.ts:46](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/HorizontalRuleExtension.ts#L46)

## Variables

### AutoFocusExtension {#autofocusextension}

> `const` **AutoFocusExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<[`AutoFocusConfig`](#autofocusconfig), `"@lexical/extension/AutoFocus"`, [`NamedSignalsOutput`](#namedsignalsoutput)\<[`AutoFocusConfig`](#autofocusconfig)\>, `unknown`\>

Defined in: [packages/lexical-extension/src/AutoFocusExtension.ts:31](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/AutoFocusExtension.ts#L31)

An Extension to focus the LexicalEditor when the root element is set
(typically only when the editor is first created).

***

### ClearEditorExtension {#cleareditorextension}

> `const` **ClearEditorExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<[`ClearEditorConfig`](#cleareditorconfig), `"@lexical/extension/ClearEditor"`, [`NamedSignalsOutput`](#namedsignalsoutput)\<[`ClearEditorConfig`](#cleareditorconfig)\>, `unknown`\>

Defined in: [packages/lexical-extension/src/ClearEditorExtension.ts:60](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/ClearEditorExtension.ts#L60)

An extension to provide an implementation of [CLEAR\_EDITOR\_COMMAND](lexical.md#clear_editor_command)

***

### DecoratorTextExtension {#decoratortextextension}

> `const` **DecoratorTextExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<[`ExtensionConfigBase`](lexical.md#extensionconfigbase), `"@lexical/extension/DecoratorText"`, `unknown`, `unknown`\>

Defined in: [packages/lexical-extension/src/DecoratorTextExtension.ts:196](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/DecoratorTextExtension.ts#L196)

An extension for DecoratorTextNode that sets the format for the node and CSS classes for the DOM container.
The base class is always set, and the focus class is set when the node is selected.

***

### EditorStateExtension {#editorstateextension}

> `const` **EditorStateExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<[`ExtensionConfigBase`](lexical.md#extensionconfigbase), `"@lexical/extension/EditorState"`, [`Signal`](#signal)\<[`EditorState`](lexical.md#editorstate)\>, `unknown`\>

Defined in: [packages/lexical-extension/src/EditorStateExtension.ts:15](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/EditorStateExtension.ts#L15)

An extension to provide the current EditorState as a signal

***

### HorizontalRuleExtension {#horizontalruleextension}

> `const` **HorizontalRuleExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<[`ExtensionConfigBase`](lexical.md#extensionconfigbase), `"@lexical/extension/HorizontalRule"`, `unknown`, `unknown`\>

Defined in: [packages/lexical-extension/src/HorizontalRuleExtension.ts:137](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/HorizontalRuleExtension.ts#L137)

An extension for HorizontalRuleNode that provides an implementation that
works without any React dependency.

***

### InitialStateExtension {#initialstateextension}

> `const` **InitialStateExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<[`InitialStateConfig`](#initialstateconfig), `"@lexical/extension/InitialState"`, `unknown`, \{ `$initialEditorState`: [`InitialEditorStateType`](lexical.md#initialeditorstatetype); `initialized`: `boolean`; \}\>

Defined in: [packages/lexical-extension/src/InitialStateExtension.ts:51](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/InitialStateExtension.ts#L51)

An extension to set the initial state of the editor from
a function or serialized JSON EditorState. This is
implicitly included with all editors built with
Lexical Extension. This happens in the `afterRegistration`
phase so your initial state may depend on registered commands,
but you should not call `editor.setRootElement` earlier than
this phase to avoid rendering an empty editor first.

***

### INSERT\_HORIZONTAL\_RULE\_COMMAND {#insert_horizontal_rule_command}

> `const` **INSERT\_HORIZONTAL\_RULE\_COMMAND**: [`LexicalCommand`](lexical.md#lexicalcommand)\<`void`\>

Defined in: [packages/lexical-extension/src/HorizontalRuleExtension.ts:48](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/HorizontalRuleExtension.ts#L48)

***

### NestedEditorExtension {#nestededitorextension}

> `const` **NestedEditorExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<`NestedEditorConfig`, `"@lexical/extension/NestedEditor"`, [`NamedSignalsOutput`](#namedsignalsoutput)\<\{ `inheritEditableFromParent`: `boolean`; \}\>, `void`\>

Defined in: [packages/lexical-extension/src/NestedEditorExtension.ts:26](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/NestedEditorExtension.ts#L26)

***

### NodeSelectionExtension {#nodeselectionextension}

> `const` **NodeSelectionExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<[`ExtensionConfigBase`](lexical.md#extensionconfigbase), `"@lexical/extension/NodeSelection"`, \{ `watchNodeKey`: (`key`) => [`ReadonlySignal`](#readonlysignal)\<`boolean`\>; \}, `unknown`\>

Defined in: [packages/lexical-extension/src/NodeSelectionExtension.ts:30](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/NodeSelectionExtension.ts#L30)

An extension that provides a `watchNodeKey` output that
returns a signal for the selection state of a node.

Typically used for tracking whether a DecoratorNode is
currently selected or not. A framework independent
alternative to useLexicalNodeSelection.

***

### SelectionAlwaysOnDisplayExtension {#selectionalwaysondisplayextension}

> `const` **SelectionAlwaysOnDisplayExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<`SelectionAlwaysOnDisplayConfig`, `"@lexical/utils/SelectionAlwaysOnDisplay"`, [`NamedSignalsOutput`](#namedsignalsoutput)\<`SelectionAlwaysOnDisplayConfig`\>, `unknown`\>

Defined in: [packages/lexical-extension/src/SelectionAlwaysOnDisplayExtension.ts:24](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/SelectionAlwaysOnDisplayExtension.ts#L24)

An extension that highlights selected content in the Lexical editor
even when the editor is not currently focused.

***

### TabIndentationExtension {#tabindentationextension}

> `const` **TabIndentationExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<[`TabIndentationConfig`](#tabindentationconfig), `"@lexical/extension/TabIndentation"`, [`NamedSignalsOutput`](#namedsignalsoutput)\<[`TabIndentationConfig`](#tabindentationconfig)\>, `unknown`\>

Defined in: [packages/lexical-extension/src/TabIndentationExtension.ts:149](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/TabIndentationExtension.ts#L149)

This extension adds the ability to indent content using the tab key. Generally, we don't
recommend using this plugin as it could negatively affect accessibility for keyboard
users, causing focus to become trapped within the editor.

## Functions

### $createHorizontalRuleNode() {#createhorizontalrulenode}

> **$createHorizontalRuleNode**(): [`HorizontalRuleNode`](#horizontalrulenode)

Defined in: [packages/lexical-extension/src/HorizontalRuleExtension.ts:102](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/HorizontalRuleExtension.ts#L102)

#### Returns

[`HorizontalRuleNode`](#horizontalrulenode)

***

### $isDecoratorTextNode() {#isdecoratortextnode}

> **$isDecoratorTextNode**(`node`): `node is DecoratorTextNode`

Defined in: [packages/lexical-extension/src/DecoratorTextExtension.ts:89](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/DecoratorTextExtension.ts#L89)

#### Parameters

##### node

`undefined` | `null` | [`LexicalNode`](lexical.md#lexicalnode)

#### Returns

`node is DecoratorTextNode`

***

### $isHorizontalRuleNode() {#ishorizontalrulenode}

> **$isHorizontalRuleNode**(`node`): `node is HorizontalRuleNode`

Defined in: [packages/lexical-extension/src/HorizontalRuleExtension.ts:106](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/HorizontalRuleExtension.ts#L106)

#### Parameters

##### node

`undefined` | `null` | [`LexicalNode`](lexical.md#lexicalnode)

#### Returns

`node is HorizontalRuleNode`

***

### applyFormatFromStyle() {#applyformatfromstyle}

> **applyFormatFromStyle**(`lexicalNode`, `style`, `shouldApply?`): [`DecoratorTextNode`](#decoratortextnode)

Defined in: [packages/lexical-extension/src/DecoratorTextExtension.ts:106](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/DecoratorTextExtension.ts#L106)

Applies formatting to the node based on the properties in the passed style object.
By default, properties are checked according to the values set
when importing content from Google Docs.
This algorithm is identical to the TextNode import.

#### Parameters

##### lexicalNode

[`DecoratorTextNode`](#decoratortextnode)

The node to which the format will apply

##### style

`CSSStyleDeclaration`

CSS style object

##### shouldApply?

[`TextFormatType`](lexical.md#textformattype)

format to apply if it is not in style

#### Returns

[`DecoratorTextNode`](#decoratortextnode)

lexicalNode

***

### applyFormatToDom() {#applyformattodom}

> **applyFormatToDom**(`lexicalNode`, `domNode`, `tagNameToFormat`): `HTMLElement` \| `Text`

Defined in: [packages/lexical-extension/src/DecoratorTextExtension.ts:157](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/DecoratorTextExtension.ts#L157)

The function wraps the passed DOM node in semantic tags depending on the node format.

#### Parameters

##### lexicalNode

[`DecoratorTextNode`](#decoratortextnode)

The node where the format is checked

##### domNode

DOM that will be wrapped in tags

`HTMLElement` | `Text`

##### tagNameToFormat

Tag name and format mapping

#### Returns

`HTMLElement` \| `Text`

domNode

***

### batch() {#batch}

> **batch**\<`T`\>(`fn`): `T`

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:24](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L24)

Combine multiple value updates into one "commit" at the end of the provided callback.

Batches can be nested and changes are only flushed once the outermost batch callback
completes.

Accessing a signal that has been modified within a batch will reflect its updated
value.

#### Type Parameters

##### T

`T`

#### Parameters

##### fn

() => `T`

The callback function.

#### Returns

`T`

The value returned by the callback.

***

### buildEditorFromExtensions() {#buildeditorfromextensions}

> **buildEditorFromExtensions**(...`extensions`): [`LexicalEditorWithDispose`](lexical.md#lexicaleditorwithdispose)

Defined in: [packages/lexical-extension/src/LexicalBuilder.ts:80](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/LexicalBuilder.ts#L80)

Build a LexicalEditor by combining together one or more extensions, optionally
overriding some of their configuration.

#### Parameters

##### extensions

...[`AnyLexicalExtensionArgument`](lexical.md#anylexicalextensionargument)[]

Extension arguments (extensions or extensions with config overrides)

#### Returns

[`LexicalEditorWithDispose`](lexical.md#lexicaleditorwithdispose)

An editor handle

#### Examples

A single root extension with multiple dependencies

```ts
const editor = buildEditorFromExtensions(
  defineExtension({
    name: "[root]",
    dependencies: [
      RichTextExtension,
      configExtension(EmojiExtension, { emojiBaseUrl: "/assets/emoji" }),
    ],
    register: (editor: LexicalEditor) => {
      console.log("Editor Created");
      return () => console.log("Editor Disposed");
    },
  }),
);
```

A very similar minimal configuration without the register hook

```ts
const editor = buildEditorFromExtensions(
  RichTextExtension,
  configExtension(EmojiExtension, { emojiBaseUrl: "/assets/emoji" }),
);
```

***

### computed() {#computed}

> **computed**\<`T`\>(`fn`, `options?`): [`ReadonlySignal`](#readonlysignal)\<`T`\>

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:94](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L94)

Create a new signal that is computed based on the values of other signals.

The returned computed signal is read-only, and its value is automatically
updated when any signals accessed from within the callback function change.

#### Type Parameters

##### T

`T`

#### Parameters

##### fn

() => `T`

The effect callback.

##### options?

[`SignalOptions`](#signaloptions)\<`T`\>

#### Returns

[`ReadonlySignal`](#readonlysignal)\<`T`\>

A new read-only signal.

***

### effect() {#effect}

> **effect**(`fn`, `options?`): () => `void`

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:131](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L131)

Create an effect to run arbitrary code in response to signal changes.

An effect tracks which signals are accessed within the given callback
function `fn`, and re-runs the callback when those signals change.

The callback may return a cleanup function. The cleanup function gets
run once, either when the callback is next called or when the effect
gets disposed, whichever happens first.

#### Parameters

##### fn

`EffectFn`

The effect callback.

##### options?

`EffectOptions`

#### Returns

A function for disposing the effect.

> (): `void`

##### Returns

`void`

***

### getExtensionDependencyFromEditor() {#getextensiondependencyfromeditor}

> **getExtensionDependencyFromEditor**\<`Extension`\>(`editor`, `extension`): [`LexicalExtensionDependency`](lexical.md#lexicalextensiondependency)\<`Extension`\>

Defined in: [packages/lexical-extension/src/getExtensionDependencyFromEditor.ts:32](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/getExtensionDependencyFromEditor.ts#L32)

**`Experimental`**

Get the finalized config and output of an Extension that was used to build the editor.

This is useful in the implementation of a LexicalNode or in other
situations where you have an editor reference but it's not easy to
pass the config or [ExtensionRegisterState](lexical.md#extensionregisterstate) around.

It will throw if the Editor was not built using this Extension.

#### Type Parameters

##### Extension

`Extension` *extends* [`AnyLexicalExtension`](lexical.md#anylexicalextension)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

The editor that was built using extension

##### extension

`Extension`

The concrete reference to an Extension used to build this editor

#### Returns

[`LexicalExtensionDependency`](lexical.md#lexicalextensiondependency)\<`Extension`\>

The config and output for that Extension

***

### getKnownTypesAndNodes() {#getknowntypesandnodes}

> **getKnownTypesAndNodes**(`config`): `object`

Defined in: [packages/lexical-extension/src/config.ts:28](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/config.ts#L28)

**`Experimental`**

Get the sets of nodes and types registered in the
[InitialEditorConfig](lexical.md#initialeditorconfig). This is to be used when an extension
needs to register optional behavior if some node or type is present.

#### Parameters

##### config

[`InitialEditorConfig`](lexical.md#initialeditorconfig)

The InitialEditorConfig (accessible from an extension's init)

#### Returns

`object`

The known types and nodes as Sets

##### nodes

> **nodes**: `Set`\<[`KlassConstructor`](lexical.md#klassconstructor)\<*typeof* [`LexicalNode`](lexical.md#lexicalnode)\>\>

##### types

> **types**: `Set`\<`string`\>

***

### getPeerDependencyFromEditor() {#getpeerdependencyfromeditor}

> **getPeerDependencyFromEditor**\<`Extension`\>(`editor`, `extensionName`): `undefined` \| [`LexicalExtensionDependency`](lexical.md#lexicalextensiondependency)\<`Extension`\>

Defined in: [packages/lexical-extension/src/getPeerDependencyFromEditor.ts:41](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/getPeerDependencyFromEditor.ts#L41)

**`Experimental`**

Get the finalized config and output of an Extension that was used to build the
editor by name.

This can be used from the implementation of a LexicalNode or in other
situation where you have an editor reference but it's not easy to pass the
config around. Use this version if you do not have a concrete reference to
the Extension for some reason (e.g. it is an optional peer dependency, or you
are avoiding a circular import).

Both the explicit Extension type and the name are required.

#### Type Parameters

##### Extension

`Extension` *extends* [`AnyLexicalExtension`](lexical.md#anylexicalextension) = `never`

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

The editor that may have been built using extension

##### extensionName

`Extension`\[`"name"`\]

The name of the Extension

#### Returns

`undefined` \| [`LexicalExtensionDependency`](lexical.md#lexicalextensiondependency)\<`Extension`\>

The config and output of the Extension or undefined

#### Example

```tsx
import type { HistoryExtension } from "@lexical/history";
getPeerDependencyFromEditor<typeof HistoryExtension>(editor, "@lexical/history/History");
```

***

### getPeerDependencyFromEditorOrThrow() {#getpeerdependencyfromeditororthrow}

> **getPeerDependencyFromEditorOrThrow**\<`Extension`\>(`editor`, `extensionName`): [`LexicalExtensionDependency`](lexical.md#lexicalextensiondependency)\<`Extension`\>

Defined in: [packages/lexical-extension/src/getPeerDependencyFromEditor.ts:92](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/getPeerDependencyFromEditor.ts#L92)

Get the finalized config and output of an Extension that was used to build the
editor by name.

This can be used from the implementation of a LexicalNode or in other
situation where you have an editor reference but it's not easy to pass the
config around. Use this version if you do not have a concrete reference to
the Extension for some reason (e.g. it is an optional peer dependency, or you
are avoiding a circular import).

Both the explicit Extension type and the name are required.

#### Type Parameters

##### Extension

`Extension` *extends* [`AnyLexicalExtension`](lexical.md#anylexicalextension) = `never`

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

The editor that may have been built using extension

##### extensionName

`Extension`\[`"name"`\]

The name of the Extension

#### Returns

[`LexicalExtensionDependency`](lexical.md#lexicalextensiondependency)\<`Extension`\>

The config and output of the Extension

#### Example

```tsx
import type { EmojiExtension } from "./EmojiExtension";
export class EmojiNode extends TextNode {
  // other implementation details not included
  createDOM(
    config: EditorConfig,
    editor?: LexicalEditor | undefined
  ): HTMLElement {
    const dom = super.createDOM(config, editor);
    addClassNamesToElement(
      dom,
      getPeerDependencyFromEditorOrThrow<typeof EmojiExtension>(
        editor || $getEditor(),
        "@lexical/playground/emoji",
      ).config.emojiClass,
    );
    return dom;
  }
}
```

***

### namedSignals() {#namedsignals}

> **namedSignals**\<`Defaults`\>(`defaults`, `opts`): [`NamedSignalsOutput`](#namedsignalsoutput)\<`Defaults`\>

Defined in: [packages/lexical-extension/src/namedSignals.ts:30](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/namedSignals.ts#L30)

**`Experimental`**

Return an object with the same shape as `defaults` with a [Signal](#signal)
for each value. If specified, the second `opts` argument is a partial
of overrides to the defaults and will be used as the initial value.

Typically used to make a reactive version of some subset of the
configuration of an extension, so it can be reconfigured at runtime.

#### Type Parameters

##### Defaults

`Defaults`

#### Parameters

##### defaults

`Defaults`

The object with default values

##### opts

[`NamedSignalsOptions`](#namedsignalsoptions)\<`Defaults`\> = `{}`

Overrides to those default values

#### Returns

[`NamedSignalsOutput`](#namedsignalsoutput)\<`Defaults`\>

An object with signals initialized with the default values

***

### registerClearEditor() {#registercleareditor}

> **registerClearEditor**(`editor`, `$onClear`): () => `void`

Defined in: [packages/lexical-extension/src/ClearEditorExtension.ts:43](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/ClearEditorExtension.ts#L43)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### $onClear

() => `void`

#### Returns

> (): `void`

##### Returns

`void`

***

### registerTabIndentation() {#registertabindentation}

> **registerTabIndentation**(`editor`, `maxIndent?`, `$canIndent?`): () => `void`

Defined in: [packages/lexical-extension/src/TabIndentationExtension.ts:76](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/TabIndentationExtension.ts#L76)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### maxIndent?

`number` | [`ReadonlySignal`](#readonlysignal)\<`null` \| `number`\>

##### $canIndent?

[`CanIndentPredicate`](#canindentpredicate) | [`ReadonlySignal`](#readonlysignal)\<[`CanIndentPredicate`](#canindentpredicate)\>

#### Returns

> (): `void`

##### Returns

`void`

***

### signal() {#signal-1}

#### Call Signature

> **signal**\<`T`\>(`value`, `options?`): [`Signal`](#signal)\<`T`\>

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:59](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L59)

Create a new plain signal.

##### Type Parameters

###### T

`T`

##### Parameters

###### value

`T`

The initial value for the signal.

###### options?

[`SignalOptions`](#signaloptions)\<`T`\>

##### Returns

[`Signal`](#signal)\<`T`\>

A new signal.

#### Call Signature

> **signal**\<`T`\>(): [`Signal`](#signal)\<`undefined` \| `T`\>

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:60](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L60)

Create a new plain signal.

##### Type Parameters

###### T

`T` = `undefined`

##### Returns

[`Signal`](#signal)\<`undefined` \| `T`\>

A new signal.

***

### untracked() {#untracked}

> **untracked**\<`T`\>(`fn`): `T`

Defined in: [node\_modules/.pnpm/@preact+signals-core@1.12.1/node\_modules/@preact/signals-core/dist/signals-core.d.ts:32](https://github.com/facebook/lexical/tree/main/node_modules/.pnpm/@preact+signals-core@1.12.1/node_modules/@preact/signals-core/dist/signals-core.d.ts#L32)

Run a callback function that can access signal values without
subscribing to the signal updates.

#### Type Parameters

##### T

`T`

#### Parameters

##### fn

() => `T`

The callback function.

#### Returns

`T`

The value returned by the callback.

***

### watchedSignal() {#watchedsignal}

> **watchedSignal**\<`T`\>(`getSnapshot`, `register`): [`Signal`](#signal)\<`T`\>

Defined in: [packages/lexical-extension/src/watchedSignal.ts:19](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/watchedSignal.ts#L19)

**`Experimental`**

Create a Signal that will subscribe to a value from an external store when watched, similar to
React's [useSyncExternalStore](https://react.dev/reference/react/useSyncExternalStore).

#### Type Parameters

##### T

`T`

#### Parameters

##### getSnapshot

() => `T`

Used to get the initial value of the signal when created and when first watched.

##### register

(`self`) => () => `void`

A callback that will subscribe to some external store and update the signal, must return a dispose function.

#### Returns

[`Signal`](#signal)\<`T`\>

The signal

## References

### AnyLexicalExtension {#anylexicalextension}

Re-exports [AnyLexicalExtension](lexical.md#anylexicalextension)

***

### AnyLexicalExtensionArgument {#anylexicalextensionargument}

Re-exports [AnyLexicalExtensionArgument](lexical.md#anylexicalextensionargument)

***

### configExtension {#configextension}

Re-exports [configExtension](lexical.md#configextension)

***

### declarePeerDependency {#declarepeerdependency}

Re-exports [declarePeerDependency](lexical.md#declarepeerdependency)

***

### defineExtension {#defineextension}

Re-exports [defineExtension](lexical.md#defineextension)

***

### ExtensionConfigBase {#extensionconfigbase}

Re-exports [ExtensionConfigBase](lexical.md#extensionconfigbase)

***

### ExtensionRegisterState {#extensionregisterstate}

Re-exports [ExtensionRegisterState](lexical.md#extensionregisterstate)

***

### InitialEditorStateType {#initialeditorstatetype}

Re-exports [InitialEditorStateType](lexical.md#initialeditorstatetype)

***

### LexicalEditorWithDispose {#lexicaleditorwithdispose}

Re-exports [LexicalEditorWithDispose](lexical.md#lexicaleditorwithdispose)

***

### LexicalExtension {#lexicalextension}

Re-exports [LexicalExtension](lexical.md#lexicalextension)

***

### LexicalExtensionArgument {#lexicalextensionargument}

Re-exports [LexicalExtensionArgument](lexical.md#lexicalextensionargument)

***

### LexicalExtensionConfig {#lexicalextensionconfig}

Re-exports [LexicalExtensionConfig](lexical.md#lexicalextensionconfig-2)

***

### LexicalExtensionDependency {#lexicalextensiondependency}

Re-exports [LexicalExtensionDependency](lexical.md#lexicalextensiondependency)

***

### LexicalExtensionInit {#lexicalextensioninit}

Re-exports [LexicalExtensionInit](lexical.md#lexicalextensioninit-2)

***

### LexicalExtensionName {#lexicalextensionname}

Re-exports [LexicalExtensionName](lexical.md#lexicalextensionname-2)

***

### LexicalExtensionOutput {#lexicalextensionoutput}

Re-exports [LexicalExtensionOutput](lexical.md#lexicalextensionoutput-1)

***

### NormalizedLexicalExtensionArgument {#normalizedlexicalextensionargument}

Re-exports [NormalizedLexicalExtensionArgument](lexical.md#normalizedlexicalextensionargument)

***

### NormalizedPeerDependency {#normalizedpeerdependency}

Re-exports [NormalizedPeerDependency](lexical.md#normalizedpeerdependency)

***

### OutputComponentExtension {#outputcomponentextension}

Re-exports [OutputComponentExtension](lexical.md#outputcomponentextension)

***

### safeCast {#safecast}

Re-exports [safeCast](lexical.md#safecast)

***

### shallowMergeConfig {#shallowmergeconfig}

Re-exports [shallowMergeConfig](lexical.md#shallowmergeconfig)
