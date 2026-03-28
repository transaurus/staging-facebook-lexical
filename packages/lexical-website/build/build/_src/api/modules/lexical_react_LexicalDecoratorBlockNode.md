# @lexical/react/LexicalDecoratorBlockNode

## Classes

### DecoratorBlockNode {#decoratorblocknode}

Defined in: [packages/lexical-react/src/LexicalDecoratorBlockNode.ts:28](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalDecoratorBlockNode.ts#L28)

#### Extends

- [`DecoratorNode`](lexical.md#decoratornode)\<`JSX.Element`\>

#### Constructors

##### Constructor

> **new DecoratorBlockNode**(`format?`, `key?`): [`DecoratorBlockNode`](#decoratorblocknode)

Defined in: [packages/lexical-react/src/LexicalDecoratorBlockNode.ts:31](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalDecoratorBlockNode.ts#L31)

###### Parameters

###### format?

[`ElementFormatType`](lexical.md#elementformattype)

###### key?

`string`

###### Returns

[`DecoratorBlockNode`](#decoratorblocknode)

###### Overrides

[`DecoratorNode`](lexical.md#decoratornode).[`constructor`](lexical.md#constructor)

#### Properties

##### \_\_format {#__format}

> **\_\_format**: [`ElementFormatType`](lexical.md#elementformattype)

Defined in: [packages/lexical-react/src/LexicalDecoratorBlockNode.ts:29](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalDecoratorBlockNode.ts#L29)

##### importDOM()? {#importdom}

> `static` `optional` **importDOM**: () => `null` \| [`DOMConversionMap`](lexical.md#domconversionmap)\<`any`\>

Defined in: [packages/lexical/src/LexicalNode.ts:567](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L567)

###### Returns

`null` \| [`DOMConversionMap`](lexical.md#domconversionmap)\<`any`\>

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`importDOM`](lexical.md#importdom)

#### Methods

##### $config() {#config}

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

##### afterCloneFrom() {#afterclonefrom}

> **afterCloneFrom**(`prevNode`): `void`

Defined in: [packages/lexical-react/src/LexicalDecoratorBlockNode.ts:36](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalDecoratorBlockNode.ts#L36)

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

###### Overrides

[`DecoratorNode`](lexical.md#decoratornode).[`afterCloneFrom`](lexical.md#afterclonefrom)

##### canIndent() {#canindent}

> **canIndent**(): `false`

Defined in: [packages/lexical-react/src/LexicalDecoratorBlockNode.ts:56](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalDecoratorBlockNode.ts#L56)

###### Returns

`false`

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

`Config` *extends* [`StaticNodeConfigValue`](lexical.md#staticnodeconfigvalue)\<[`DecoratorBlockNode`](#decoratorblocknode), `Type`\>

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

Defined in: [packages/lexical-react/src/LexicalDecoratorBlockNode.ts:60](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalDecoratorBlockNode.ts#L60)

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

> **exportJSON**(): [`SerializedDecoratorBlockNode`](#serializeddecoratorblocknode)

Defined in: [packages/lexical-react/src/LexicalDecoratorBlockNode.ts:41](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalDecoratorBlockNode.ts#L41)

Controls how the this node is serialized to JSON. This is important for
copy and paste between Lexical editors sharing the same namespace. It's also important
if you're serializing to JSON for persistent storage somewhere.
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Returns

[`SerializedDecoratorBlockNode`](#serializeddecoratorblocknode)

###### Overrides

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

> **getFormat**(): [`ElementFormatType`](lexical.md#elementformattype)

Defined in: [packages/lexical-react/src/LexicalDecoratorBlockNode.ts:74](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalDecoratorBlockNode.ts#L74)

###### Returns

[`ElementFormatType`](lexical.md#elementformattype)

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

> **getTopLevelElement**(): `null` \| [`ElementNode`](lexical.md#elementnode) \| [`DecoratorBlockNode`](#decoratorblocknode)

Defined in: [packages/lexical/src/nodes/LexicalDecoratorNode.ts:17](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalDecoratorNode.ts#L17)

Returns the highest (in the EditorState tree)
non-root ancestor of this node, or null if none is found. See [lexical!$isRootOrShadowRoot](lexical.md#isrootorshadowroot)
for more information on which Elements comprise "roots".

###### Returns

`null` \| [`ElementNode`](lexical.md#elementnode) \| [`DecoratorBlockNode`](#decoratorblocknode)

###### Inherited from

[`DecoratorNode`](lexical.md#decoratornode).[`getTopLevelElement`](lexical.md#gettoplevelelement)

##### getTopLevelElementOrThrow() {#gettoplevelelementorthrow}

> **getTopLevelElementOrThrow**(): [`ElementNode`](lexical.md#elementnode) \| [`DecoratorBlockNode`](#decoratorblocknode)

Defined in: [packages/lexical/src/nodes/LexicalDecoratorNode.ts:18](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalDecoratorNode.ts#L18)

Returns the highest (in the EditorState tree)
non-root ancestor of this node, or throws if none is found. See [lexical!$isRootOrShadowRoot](lexical.md#isrootorshadowroot)
for more information on which Elements comprise "roots".

###### Returns

[`ElementNode`](lexical.md#elementnode) \| [`DecoratorBlockNode`](#decoratorblocknode)

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

> **isInline**(): `false`

Defined in: [packages/lexical-react/src/LexicalDecoratorBlockNode.ts:78](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalDecoratorBlockNode.ts#L78)

###### Returns

`false`

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

> **setFormat**(`format`): `this`

Defined in: [packages/lexical-react/src/LexicalDecoratorBlockNode.ts:68](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalDecoratorBlockNode.ts#L68)

###### Parameters

###### format

[`ElementFormatType`](lexical.md#elementformattype)

###### Returns

`this`

##### updateDOM() {#updatedom}

> **updateDOM**(): `false`

Defined in: [packages/lexical-react/src/LexicalDecoratorBlockNode.ts:64](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalDecoratorBlockNode.ts#L64)

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

Defined in: [packages/lexical-react/src/LexicalDecoratorBlockNode.ts:48](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalDecoratorBlockNode.ts#L48)

Update this LexicalNode instance from serialized JSON. It's recommended
to implement as much logic as possible in this method instead of the
static importJSON method, so that the functionality can be inherited in subclasses.

The LexicalUpdateJSON utility type should be used to ignore any type, version,
or children properties in the JSON so that the extended JSON from subclasses
are acceptable parameters for the super call.

If overridden, this method must call super.

###### Parameters

###### serializedNode

[`LexicalUpdateJSON`](lexical.md#lexicalupdatejson)\<[`SerializedDecoratorBlockNode`](#serializeddecoratorblocknode)\>

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

###### Overrides

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

## Type Aliases

### SerializedDecoratorBlockNode {#serializeddecoratorblocknode}

> **SerializedDecoratorBlockNode** = [`Spread`](lexical.md#spread)\<\{ `format`: [`ElementFormatType`](lexical.md#elementformattype); \}, [`SerializedLexicalNode`](lexical.md#serializedlexicalnode)\>

Defined in: [packages/lexical-react/src/LexicalDecoratorBlockNode.ts:21](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalDecoratorBlockNode.ts#L21)

## Functions

### $isDecoratorBlockNode() {#isdecoratorblocknode}

> **$isDecoratorBlockNode**(`node`): `node is DecoratorBlockNode`

Defined in: [packages/lexical-react/src/LexicalDecoratorBlockNode.ts:83](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalDecoratorBlockNode.ts#L83)

#### Parameters

##### node

`undefined` | `null` | [`LexicalNode`](lexical.md#lexicalnode)

#### Returns

`node is DecoratorBlockNode`
