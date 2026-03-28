# @lexical/react/LexicalHorizontalRuleNode

## Classes

### ~~HorizontalRuleNode~~ {#horizontalrulenode}

Defined in: [packages/lexical-react/src/LexicalHorizontalRuleNode.tsx:85](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalHorizontalRuleNode.tsx#L85)

#### Deprecated

A pure Lexical implementation is available in `@lexical/extension` as HorizontalRuleExtension

#### Extends

- [`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode)

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

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`constructor`](lexical_extension.md#constructor-1)

#### Methods

##### ~~$config()~~ {#config}

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

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`$config`](lexical_extension.md#config-4)

##### ~~afterCloneFrom()~~ {#afterclonefrom}

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

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`afterCloneFrom`](lexical_extension.md#afterclonefrom-2)

##### ~~config()~~ {#config-2}

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

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`config`](lexical_extension.md#config-6)

##### ~~createDOM()~~ {#createdom}

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

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`createDOM`](lexical_extension.md#createdom-2)

##### ~~createParentElementNode()~~ {#createparentelementnode}

> **createParentElementNode**(): [`ElementNode`](lexical.md#elementnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1414](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1414)

The creation logic for any required parent. Should be implemented if [isParentRequired](lexical.md#isparentrequired-6) returns true.

###### Returns

[`ElementNode`](lexical.md#elementnode)

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`createParentElementNode`](lexical_extension.md#createparentelementnode-2)

##### ~~decorate()~~ {#decorate}

> **decorate**(): `Element`

Defined in: [packages/lexical-react/src/LexicalHorizontalRuleNode.tsx:109](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalHorizontalRuleNode.tsx#L109)

The returned value is added to the LexicalEditor._decorators

###### Returns

`Element`

###### Overrides

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`decorate`](lexical_extension.md#decorate-2)

##### ~~exportDOM()~~ {#exportdom}

> **exportDOM**(): [`DOMExportOutput`](lexical.md#domexportoutput)

Defined in: [packages/lexical-extension/src/HorizontalRuleExtension.ts:75](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/HorizontalRuleExtension.ts#L75)

Controls how the this node is serialized to HTML. This is important for
copy and paste between Lexical and non-Lexical editors, or Lexical editors with different namespaces,
in which case the primary transfer format is HTML. It's also important if you're serializing
to HTML for any other reason via [@lexical/html!$generateHtmlFromNodes](lexical_html.md#generatehtmlfromnodes). You could
also use this method to build your own HTML renderer.

###### Returns

[`DOMExportOutput`](lexical.md#domexportoutput)

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`exportDOM`](lexical_extension.md#exportdom-2)

##### ~~exportJSON()~~ {#exportjson}

> **exportJSON**(): [`SerializedLexicalNode`](lexical.md#serializedlexicalnode)

Defined in: [packages/lexical/src/LexicalNode.ts:1136](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1136)

Controls how the this node is serialized to JSON. This is important for
copy and paste between Lexical editors sharing the same namespace. It's also important
if you're serializing to JSON for persistent storage somewhere.
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Returns

[`SerializedLexicalNode`](lexical.md#serializedlexicalnode)

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`exportJSON`](lexical_extension.md#exportjson-2)

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

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`getCommonAncestor`](lexical_extension.md#getcommonancestor-2)

##### ~~getIndexWithinParent()~~ {#getindexwithinparent}

> **getIndexWithinParent**(): `number`

Defined in: [packages/lexical/src/LexicalNode.ts:687](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L687)

Returns the zero-based index of this node within the parent.

###### Returns

`number`

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`getIndexWithinParent`](lexical_extension.md#getindexwithinparent-2)

##### ~~getKey()~~ {#getkey}

> **getKey**(): `string`

Defined in: [packages/lexical/src/LexicalNode.ts:679](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L679)

Returns this nodes key.

###### Returns

`string`

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`getKey`](lexical_extension.md#getkey-2)

##### ~~getLatest()~~ {#getlatest}

> **getLatest**(): `this`

Defined in: [packages/lexical/src/LexicalNode.ts:1012](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1012)

Returns the latest version of the node from the active EditorState.
This is used to avoid getting values from stale node references.

###### Returns

`this`

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`getLatest`](lexical_extension.md#getlatest-2)

##### ~~getNextSibling()~~ {#getnextsibling}

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

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`getNextSibling`](lexical_extension.md#getnextsibling-2)

##### ~~getNextSiblings()~~ {#getnextsiblings}

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

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`getNextSiblings`](lexical_extension.md#getnextsiblings-2)

##### ~~getNodesBetween()~~ {#getnodesbetween}

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

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`getNodesBetween`](lexical_extension.md#getnodesbetween-2)

##### ~~getParent()~~ {#getparent}

> **getParent**\<`T`\>(): `null` \| `T`

Defined in: [packages/lexical/src/LexicalNode.ts:707](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L707)

Returns the parent of this node, or null if none is found.

###### Type Parameters

###### T

`T` *extends* [`ElementNode`](lexical.md#elementnode)

###### Returns

`null` \| `T`

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`getParent`](lexical_extension.md#getparent-2)

##### ~~getParentKeys()~~ {#getparentkeys}

> **getParentKeys**(): `string`[]

Defined in: [packages/lexical/src/LexicalNode.ts:784](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L784)

Returns a list of the keys of every ancestor of this node,
all the way up to the RootNode.

###### Returns

`string`[]

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`getParentKeys`](lexical_extension.md#getparentkeys-2)

##### ~~getParentOrThrow()~~ {#getparentorthrow}

> **getParentOrThrow**\<`T`\>(): `T`

Defined in: [packages/lexical/src/LexicalNode.ts:718](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L718)

Returns the parent of this node, or throws if none is found.

###### Type Parameters

###### T

`T` *extends* [`ElementNode`](lexical.md#elementnode)

###### Returns

`T`

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`getParentOrThrow`](lexical_extension.md#getparentorthrow-2)

##### ~~getParents()~~ {#getparents}

> **getParents**(): [`ElementNode`](lexical.md#elementnode)[]

Defined in: [packages/lexical/src/LexicalNode.ts:769](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L769)

Returns a list of the every ancestor of this node,
all the way up to the RootNode.

###### Returns

[`ElementNode`](lexical.md#elementnode)[]

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`getParents`](lexical_extension.md#getparents-2)

##### ~~getPreviousSibling()~~ {#getprevioussibling}

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

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`getPreviousSibling`](lexical_extension.md#getprevioussibling-2)

##### ~~getPreviousSiblings()~~ {#getprevioussiblings}

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

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`getPreviousSiblings`](lexical_extension.md#getprevioussiblings-2)

##### ~~getTextContent()~~ {#gettextcontent}

> **getTextContent**(): `string`

Defined in: [packages/lexical-extension/src/HorizontalRuleExtension.ts:85](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/HorizontalRuleExtension.ts#L85)

Returns the text content of the node. Override this for
custom nodes that should have a representation in plain text
format (for copy + paste, for example)

###### Returns

`string`

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`getTextContent`](lexical_extension.md#gettextcontent-2)

##### ~~getTextContentSize()~~ {#gettextcontentsize}

> **getTextContentSize**(): `number`

Defined in: [packages/lexical/src/LexicalNode.ts:1076](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1076)

Returns the length of the string produced by calling getTextContent on this node.

###### Returns

`number`

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`getTextContentSize`](lexical_extension.md#gettextcontentsize-2)

##### ~~getTopLevelElement()~~ {#gettoplevelelement}

> **getTopLevelElement**(): `null` \| [`ElementNode`](lexical.md#elementnode) \| [`HorizontalRuleNode`](#horizontalrulenode)

Defined in: [packages/lexical/src/nodes/LexicalDecoratorNode.ts:17](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalDecoratorNode.ts#L17)

Returns the highest (in the EditorState tree)
non-root ancestor of this node, or null if none is found. See [lexical!$isRootOrShadowRoot](lexical.md#isrootorshadowroot)
for more information on which Elements comprise "roots".

###### Returns

`null` \| [`ElementNode`](lexical.md#elementnode) \| [`HorizontalRuleNode`](#horizontalrulenode)

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`getTopLevelElement`](lexical_extension.md#gettoplevelelement-2)

##### ~~getTopLevelElementOrThrow()~~ {#gettoplevelelementorthrow}

> **getTopLevelElementOrThrow**(): [`ElementNode`](lexical.md#elementnode) \| [`HorizontalRuleNode`](#horizontalrulenode)

Defined in: [packages/lexical/src/nodes/LexicalDecoratorNode.ts:18](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalDecoratorNode.ts#L18)

Returns the highest (in the EditorState tree)
non-root ancestor of this node, or throws if none is found. See [lexical!$isRootOrShadowRoot](lexical.md#isrootorshadowroot)
for more information on which Elements comprise "roots".

###### Returns

[`ElementNode`](lexical.md#elementnode) \| [`HorizontalRuleNode`](#horizontalrulenode)

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`getTopLevelElementOrThrow`](lexical_extension.md#gettoplevelelementorthrow-2)

##### ~~getType()~~ {#gettype}

> **getType**(): `string`

Defined in: [packages/lexical/src/LexicalNode.ts:593](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L593)

Returns the string type of this node.

###### Returns

`string`

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`getType`](lexical_extension.md#gettype-4)

##### ~~getWritable()~~ {#getwritable}

> **getWritable**(): `this`

Defined in: [packages/lexical/src/LexicalNode.ts:1032](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1032)

Returns a mutable version of the node using [$cloneWithProperties](lexical.md#clonewithproperties)
if necessary. Will throw an error if called outside of a Lexical Editor
[LexicalEditor.update](lexical.md#update) callback.

###### Returns

`this`

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`getWritable`](lexical_extension.md#getwritable-2)

##### ~~insertAfter()~~ {#insertafter}

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

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`insertAfter`](lexical_extension.md#insertafter-2)

##### ~~insertBefore()~~ {#insertbefore}

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

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`insertBefore`](lexical_extension.md#insertbefore-2)

##### ~~is()~~ {#is}

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

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`is`](lexical_extension.md#is-2)

##### ~~isAttached()~~ {#isattached}

> **isAttached**(): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:610](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L610)

Returns true if there is a path between this node and the RootNode, false otherwise.
This is a way of determining if the node is "attached" EditorState. Unattached nodes
won't be reconciled and will ultimately be cleaned up by the Lexical GC.

###### Returns

`boolean`

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`isAttached`](lexical_extension.md#isattached-2)

##### ~~isBefore()~~ {#isbefore}

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

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`isBefore`](lexical_extension.md#isbefore-2)

##### ~~isDirty()~~ {#isdirty}

> **isDirty**(): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:1001](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1001)

Returns true if this node has been marked dirty during this update cycle.

###### Returns

`boolean`

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`isDirty`](lexical_extension.md#isdirty-2)

##### ~~isInline()~~ {#isinline}

> **isInline**(): `false`

Defined in: [packages/lexical-extension/src/HorizontalRuleExtension.ts:89](https://github.com/facebook/lexical/tree/main/packages/lexical-extension/src/HorizontalRuleExtension.ts#L89)

###### Returns

`false`

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`isInline`](lexical_extension.md#isinline-2)

##### ~~isIsolated()~~ {#isisolated}

> **isIsolated**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalDecoratorNode.ts:34](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalDecoratorNode.ts#L34)

###### Returns

`boolean`

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`isIsolated`](lexical_extension.md#isisolated-2)

##### ~~isKeyboardSelectable()~~ {#iskeyboardselectable}

> **isKeyboardSelectable**(): `boolean`

Defined in: [packages/lexical/src/nodes/LexicalDecoratorNode.ts:42](https://github.com/facebook/lexical/tree/main/packages/lexical/src/nodes/LexicalDecoratorNode.ts#L42)

###### Returns

`boolean`

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`isKeyboardSelectable`](lexical_extension.md#iskeyboardselectable-2)

##### ~~isParentOf()~~ {#isparentof}

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

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`isParentOf`](lexical_extension.md#isparentof-2)

##### ~~isParentRequired()~~ {#isparentrequired}

> **isParentRequired**(): `boolean`

Defined in: [packages/lexical/src/LexicalNode.ts:1406](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1406)

Whether or not this node has a required parent. Used during copy + paste operations
to normalize nodes that would otherwise be orphaned. For example, ListItemNodes without
a ListNode parent or TextNodes with a ParagraphNode parent.

###### Returns

`boolean`

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`isParentRequired`](lexical_extension.md#isparentrequired-2)

##### ~~isSelected()~~ {#isselected}

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

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`isSelected`](lexical_extension.md#isselected-2)

##### ~~markDirty()~~ {#markdirty}

> **markDirty**(): `void`

Defined in: [packages/lexical/src/LexicalNode.ts:1475](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1475)

Marks a node dirty, triggering transforms and
forcing it to be reconciled during the update cycle.

###### Returns

`void`

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`markDirty`](lexical_extension.md#markdirty-2)

##### ~~remove()~~ {#remove}

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

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`remove`](lexical_extension.md#remove-2)

##### ~~replace()~~ {#replace}

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

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`replace`](lexical_extension.md#replace-2)

##### ~~resetOnCopyNodeFrom()~~ {#resetoncopynodefrom}

> **resetOnCopyNodeFrom**(`originalNode`): `void`

Defined in: [packages/lexical/src/LexicalNode.ts:560](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L560)

Reset state in this copy of originalNode, if necessary

###### Parameters

###### originalNode

`this`

###### Returns

`void`

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`resetOnCopyNodeFrom`](lexical_extension.md#resetoncopynodefrom-2)

##### ~~selectEnd()~~ {#selectend}

> **selectEnd**(): [`RangeSelection`](lexical.md#rangeselection)

Defined in: [packages/lexical/src/LexicalNode.ts:1422](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1422)

###### Returns

[`RangeSelection`](lexical.md#rangeselection)

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`selectEnd`](lexical_extension.md#selectend-2)

##### ~~selectNext()~~ {#selectnext}

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

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`selectNext`](lexical_extension.md#selectnext-2)

##### ~~selectPrevious()~~ {#selectprevious}

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

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`selectPrevious`](lexical_extension.md#selectprevious-2)

##### ~~selectStart()~~ {#selectstart}

> **selectStart**(): [`RangeSelection`](lexical.md#rangeselection)

Defined in: [packages/lexical/src/LexicalNode.ts:1418](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L1418)

###### Returns

[`RangeSelection`](lexical.md#rangeselection)

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`selectStart`](lexical_extension.md#selectstart-2)

##### ~~updateDOM()~~ {#updatedom}

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

###### Inherited from

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`updateDOM`](lexical_extension.md#updatedom-2)

##### ~~updateFromJSON()~~ {#updatefromjson}

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

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`updateFromJSON`](lexical_extension.md#updatefromjson-2)

##### ~~clone()~~ {#clone}

> `static` **clone**(`node`): [`HorizontalRuleNode`](#horizontalrulenode)

Defined in: [packages/lexical-react/src/LexicalHorizontalRuleNode.tsx:90](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalHorizontalRuleNode.tsx#L90)

Clones this node, creating a new node with a different key
and adding it to the EditorState (but not attaching it anywhere!). All nodes must
implement this method.

###### Parameters

###### node

[`HorizontalRuleNode`](#horizontalrulenode)

###### Returns

[`HorizontalRuleNode`](#horizontalrulenode)

###### Overrides

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`clone`](lexical_extension.md#clone-2)

##### ~~getType()~~ {#gettype-2}

> `static` **getType**(): `string`

Defined in: [packages/lexical-react/src/LexicalHorizontalRuleNode.tsx:86](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalHorizontalRuleNode.tsx#L86)

Returns the string type of this node. Every node must
implement this and it MUST BE UNIQUE amongst nodes registered
on the editor.

###### Returns

`string`

###### Overrides

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`getType`](lexical_extension.md#gettype-6)

##### ~~importDOM()~~ {#importdom}

> `static` **importDOM**(): `null` \| [`DOMConversionMap`](lexical.md#domconversionmap)

Defined in: [packages/lexical-react/src/LexicalHorizontalRuleNode.tsx:100](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalHorizontalRuleNode.tsx#L100)

###### Returns

`null` \| [`DOMConversionMap`](lexical.md#domconversionmap)

###### Overrides

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`importDOM`](lexical_extension.md#importdom-1)

##### ~~importJSON()~~ {#importjson}

> `static` **importJSON**(`serializedNode`): [`HorizontalRuleNode`](#horizontalrulenode)

Defined in: [packages/lexical-react/src/LexicalHorizontalRuleNode.tsx:94](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalHorizontalRuleNode.tsx#L94)

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

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`importJSON`](lexical_extension.md#importjson-2)

##### ~~transform()~~ {#transform}

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

[`HorizontalRuleNode`](lexical_extension.md#horizontalrulenode).[`transform`](lexical_extension.md#transform-2)

## Functions

### ~~$createHorizontalRuleNode()~~ {#createhorizontalrulenode}

> **$createHorizontalRuleNode**(): [`HorizontalRuleNode`](#horizontalrulenode)

Defined in: [packages/lexical-react/src/LexicalHorizontalRuleNode.tsx:121](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalHorizontalRuleNode.tsx#L121)

#### Returns

[`HorizontalRuleNode`](#horizontalrulenode)

#### Deprecated

A pure Lexical implementation is available in `@lexical/extension` as HorizontalRuleExtension

## References

### $isHorizontalRuleNode {#ishorizontalrulenode}

Re-exports [$isHorizontalRuleNode](lexical_extension.md#ishorizontalrulenode)

***

### INSERT\_HORIZONTAL\_RULE\_COMMAND {#insert_horizontal_rule_command}

Re-exports [INSERT_HORIZONTAL_RULE_COMMAND](lexical_extension.md#insert_horizontal_rule_command)

***

### SerializedHorizontalRuleNode {#serializedhorizontalrulenode}

Re-exports [SerializedHorizontalRuleNode](lexical_extension.md#serializedhorizontalrulenode)
