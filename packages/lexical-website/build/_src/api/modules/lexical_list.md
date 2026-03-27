# @lexical/list

## Classes

### ListItemNode {#listitemnode}

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:77](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L77)

#### Extends

- [`ElementNode`](lexical.md#elementnode)

#### Constructors

##### Constructor

> **new ListItemNode**(`value`, `checked`, `key?`): [`ListItemNode`](#listitemnode)

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:107](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L107)

###### Parameters

###### value

`number` = `1`

###### checked

`undefined` | `boolean`

###### key?

`string`

###### Returns

[`ListItemNode`](#listitemnode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`constructor`](lexical.md#constructor-1)

#### Methods

##### afterCloneFrom() {#afterclonefrom}

> **afterCloneFrom**(`prevNode`): `void`

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:117](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L117)

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

[`ElementNode`](lexical.md#elementnode).[`afterCloneFrom`](lexical.md#afterclonefrom-2)

##### append() {#append}

> **append**(...`nodes`): `this`

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:198](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L198)

###### Parameters

###### nodes

...[`LexicalNode`](lexical.md#lexicalnode)[]

###### Returns

`this`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`append`](lexical.md#append)

##### canMergeWhenEmpty() {#canmergewhenempty}

> **canMergeWhenEmpty**(): `true`

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:469](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L469)

Determines whether this node, when empty, can merge with a first block
of nodes being inserted.

This method is specifically called in [RangeSelection.insertNodes](lexical.md#insertnodes-4)
to determine merging behavior during nodes insertion.

###### Returns

`true`

###### Example

```ts
// In a ListItemNode or QuoteNode implementation:
canMergeWhenEmpty(): true {
 return true;
}
```

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`canMergeWhenEmpty`](lexical.md#canmergewhenempty)

##### collapseAtStart() {#collapseatstart}

> **collapseAtStart**(`selection`): `true`

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:322](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L322)

###### Parameters

###### selection

[`RangeSelection`](lexical.md#rangeselection)

###### Returns

`true`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`collapseAtStart`](lexical.md#collapseatstart)

##### createDOM() {#createdom}

> **createDOM**(`config`): `HTMLElement`

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:123](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L123)

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

[`ElementNode`](lexical.md#elementnode).[`createDOM`](lexical.md#createdom-2)

##### createParentElementNode() {#createparentelementnode}

> **createParentElementNode**(): [`ElementNode`](lexical.md#elementnode)

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:465](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L465)

The creation logic for any required parent. Should be implemented if [isParentRequired](lexical.md#isparentrequired-6) returns true.

###### Returns

[`ElementNode`](lexical.md#elementnode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`createParentElementNode`](lexical.md#createparentelementnode-2)

##### exportDOM() {#exportdom}

> **exportDOM**(`editor`): [`DOMExportOutput`](lexical.md#domexportoutput)

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:172](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L172)

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

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`exportDOM`](lexical.md#exportdom-2)

##### exportJSON() {#exportjson}

> **exportJSON**(): [`SerializedListItemNode`](#serializedlistitemnode)

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:190](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L190)

Controls how the this node is serialized to JSON. This is important for
copy and paste between Lexical editors sharing the same namespace. It's also important
if you're serializing to JSON for persistent storage somewhere.
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Returns

[`SerializedListItemNode`](#serializedlistitemnode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`exportJSON`](lexical.md#exportjson-2)

##### extractWithChild() {#extractwithchild}

> **extractWithChild**(`child`, `selection`): `boolean`

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:446](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L446)

###### Parameters

###### child

[`LexicalNode`](lexical.md#lexicalnode)

###### selection

[`BaseSelection`](lexical.md#baseselection)

###### Returns

`boolean`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`extractWithChild`](lexical.md#extractwithchild)

##### getChecked() {#getchecked}

> **getChecked**(): `undefined` \| `boolean`

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:373](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L373)

###### Returns

`undefined` \| `boolean`

##### getIndent() {#getindent}

> **getIndent**(): `number`

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:397](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L397)

###### Returns

`number`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`getIndent`](lexical.md#getindent)

##### getValue() {#getvalue}

> **getValue**(): `number`

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:361](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L361)

###### Returns

`number`

##### insertAfter() {#insertafter}

> **insertAfter**(`node`, `restoreSelection`): [`LexicalNode`](lexical.md#lexicalnode)

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:258](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L258)

Inserts a node after this LexicalNode (as the next sibling).

###### Parameters

###### node

[`LexicalNode`](lexical.md#lexicalnode)

###### restoreSelection

`boolean` = `true`

Whether or not to attempt to resolve the
selection to the appropriate place after the operation is complete.

###### Returns

[`LexicalNode`](lexical.md#lexicalnode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`insertAfter`](lexical.md#insertafter-2)

##### insertNewAfter() {#insertnewafter}

> **insertNewAfter**(`_`, `restoreSelection`): [`ParagraphNode`](lexical.md#paragraphnode) \| [`ListItemNode`](#listitemnode)

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:311](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L311)

###### Parameters

###### \_

[`RangeSelection`](lexical.md#rangeselection)

###### restoreSelection

`boolean` = `true`

###### Returns

[`ParagraphNode`](lexical.md#paragraphnode) \| [`ListItemNode`](#listitemnode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`insertNewAfter`](lexical.md#insertnewafter)

##### isParentRequired() {#isparentrequired}

> **isParentRequired**(): `true`

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:461](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L461)

Whether or not this node has a required parent. Used during copy + paste operations
to normalize nodes that would otherwise be orphaned. For example, ListItemNodes without
a ListNode parent or TextNodes with a ParagraphNode parent.

###### Returns

`true`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`isParentRequired`](lexical.md#isparentrequired-2)

##### remove() {#remove}

> **remove**(`preserveEmptyParent?`): `void`

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:288](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L288)

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

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`remove`](lexical.md#remove-2)

##### replace() {#replace}

> **replace**\<`N`\>(`replaceWithNode`, `includeChildren?`): `N`

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:214](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L214)

Replaces this LexicalNode with the provided node, optionally transferring the children
of the replaced node to the replacing node.

###### Type Parameters

###### N

`N` *extends* [`LexicalNode`](lexical.md#lexicalnode)

###### Parameters

###### replaceWithNode

`N`

###### includeChildren?

`boolean`

Whether or not to transfer the children of this node to the replacing node.

###### Returns

`N`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`replace`](lexical.md#replace-2)

##### resetOnCopyNodeFrom() {#resetoncopynodefrom}

> **resetOnCopyNodeFrom**(`original`): `void`

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:304](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L304)

Reset state in this copy of originalNode, if necessary

###### Parameters

###### original

`this`

###### Returns

`void`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`resetOnCopyNodeFrom`](lexical.md#resetoncopynodefrom-2)

##### setChecked() {#setchecked}

> **setChecked**(`checked?`): `this`

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:386](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L386)

###### Parameters

###### checked?

`boolean`

###### Returns

`this`

##### setIndent() {#setindent}

> **setIndent**(`indent`): `this`

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:414](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L414)

###### Parameters

###### indent

`number`

###### Returns

`this`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`setIndent`](lexical.md#setindent)

##### setValue() {#setvalue}

> **setValue**(`value`): `this`

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:367](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L367)

###### Parameters

###### value

`number`

###### Returns

`this`

##### toggleChecked() {#togglechecked}

> **toggleChecked**(): `this`

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:392](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L392)

###### Returns

`this`

##### updateDOM() {#updatedom}

> **updateDOM**(`prevNode`, `dom`, `config`): `boolean`

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:152](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L152)

Called when a node changes and should update the DOM
in whatever way is necessary to make it align with any changes that might
have happened during the update.

Returning "true" here will cause lexical to unmount and recreate the DOM node
(by calling createDOM). You would need to do this if the element tag changes,
for instance.

###### Parameters

###### prevNode

[`ListItemNode`](#listitemnode)

###### dom

`HTMLElement`

###### config

[`EditorConfig`](lexical.md#editorconfig)

###### Returns

`boolean`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`updateDOM`](lexical.md#updatedom-2)

##### updateFromJSON() {#updatefromjson}

> **updateFromJSON**(`serializedNode`): `this`

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:163](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L163)

Update this LexicalNode instance from serialized JSON. It's recommended
to implement as much logic as possible in this method instead of the
static importJSON method, so that the functionality can be inherited in subclasses.

The LexicalUpdateJSON utility type should be used to ignore any type, version,
or children properties in the JSON so that the extended JSON from subclasses
are acceptable parameters for the super call.

If overridden, this method must call super.

###### Parameters

###### serializedNode

[`LexicalUpdateJSON`](lexical.md#lexicalupdatejson)\<[`SerializedListItemNode`](#serializedlistitemnode)\>

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

[`ElementNode`](lexical.md#elementnode).[`updateFromJSON`](lexical.md#updatefromjson-2)

##### updateListItemDOM() {#updatelistitemdom}

> **updateListItemDOM**(`prevNode`, `dom`, `config`): `void`

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:130](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L130)

###### Parameters

###### prevNode

`null` | [`ListItemNode`](#listitemnode)

###### dom

`HTMLLIElement`

###### config

[`EditorConfig`](lexical.md#editorconfig)

###### Returns

`void`

***

### ListNode {#listnode}

Defined in: [packages/lexical-list/src/LexicalListNode.ts:55](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListNode.ts#L55)

#### Extends

- [`ElementNode`](lexical.md#elementnode)

#### Constructors

##### Constructor

> **new ListNode**(`listType`, `start`, `key?`): [`ListNode`](#listnode)

Defined in: [packages/lexical-list/src/LexicalListNode.ts:84](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListNode.ts#L84)

###### Parameters

###### listType

[`ListType`](#listtype) = `'number'`

###### start

`number` = `1`

###### key?

`string`

###### Returns

[`ListNode`](#listnode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`constructor`](lexical.md#constructor-1)

#### Methods

##### afterCloneFrom() {#afterclonefrom-2}

> **afterCloneFrom**(`prevNode`): `void`

Defined in: [packages/lexical-list/src/LexicalListNode.ts:92](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListNode.ts#L92)

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

[`ElementNode`](lexical.md#elementnode).[`afterCloneFrom`](lexical.md#afterclonefrom-2)

##### canBeEmpty() {#canbeempty}

> **canBeEmpty**(): `false`

Defined in: [packages/lexical-list/src/LexicalListNode.ts:188](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListNode.ts#L188)

###### Returns

`false`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`canBeEmpty`](lexical.md#canbeempty)

##### canIndent() {#canindent}

> **canIndent**(): `false`

Defined in: [packages/lexical-list/src/LexicalListNode.ts:192](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListNode.ts#L192)

###### Returns

`false`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`canIndent`](lexical.md#canindent)

##### createDOM() {#createdom-2}

> **createDOM**(`config`, `_editor?`): `HTMLElement`

Defined in: [packages/lexical-list/src/LexicalListNode.ts:126](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListNode.ts#L126)

Called during the reconciliation process to determine which nodes
to insert into the DOM for this Lexical Node.

This method must return exactly one HTMLElement. Nested elements are not supported.

Do not attempt to update the Lexical EditorState during this phase of the update lifecycle.

###### Parameters

###### config

[`EditorConfig`](lexical.md#editorconfig)

###### \_editor?

[`LexicalEditor`](lexical.md#lexicaleditor)

allows access to the editor for context during reconciliation.

###### Returns

`HTMLElement`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`createDOM`](lexical.md#createdom-2)

##### exportDOM() {#exportdom-2}

> **exportDOM**(`editor`): [`DOMExportOutput`](lexical.md#domexportoutput)

Defined in: [packages/lexical-list/src/LexicalListNode.ts:164](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListNode.ts#L164)

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

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`exportDOM`](lexical.md#exportdom-2)

##### exportJSON() {#exportjson-2}

> **exportJSON**(): [`SerializedListNode`](#serializedlistnode)

Defined in: [packages/lexical-list/src/LexicalListNode.ts:179](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListNode.ts#L179)

Controls how the this node is serialized to JSON. This is important for
copy and paste between Lexical editors sharing the same namespace. It's also important
if you're serializing to JSON for persistent storage somewhere.
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Returns

[`SerializedListNode`](#serializedlistnode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`exportJSON`](lexical.md#exportjson-2)

##### extractWithChild() {#extractwithchild-2}

> **extractWithChild**(`child`): `boolean`

Defined in: [packages/lexical-list/src/LexicalListNode.ts:225](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListNode.ts#L225)

###### Parameters

###### child

[`LexicalNode`](lexical.md#lexicalnode)

###### Returns

`boolean`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`extractWithChild`](lexical.md#extractwithchild)

##### getListType() {#getlisttype}

> **getListType**(): [`ListType`](#listtype)

Defined in: [packages/lexical-list/src/LexicalListNode.ts:110](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListNode.ts#L110)

###### Returns

[`ListType`](#listtype)

##### getStart() {#getstart}

> **getStart**(): `number`

Defined in: [packages/lexical-list/src/LexicalListNode.ts:114](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListNode.ts#L114)

###### Returns

`number`

##### getTag() {#gettag}

> **getTag**(): [`ListNodeTagType`](#listnodetagtype)

Defined in: [packages/lexical-list/src/LexicalListNode.ts:99](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListNode.ts#L99)

###### Returns

[`ListNodeTagType`](#listnodetagtype)

##### setListType() {#setlisttype}

> **setListType**(`type`): `this`

Defined in: [packages/lexical-list/src/LexicalListNode.ts:103](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListNode.ts#L103)

###### Parameters

###### type

[`ListType`](#listtype)

###### Returns

`this`

##### setStart() {#setstart}

> **setStart**(`start`): `this`

Defined in: [packages/lexical-list/src/LexicalListNode.ts:118](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListNode.ts#L118)

###### Parameters

###### start

`number`

###### Returns

`this`

##### splice() {#splice}

> **splice**(`start`, `deleteCount`, `nodesToInsert`): `this`

Defined in: [packages/lexical-list/src/LexicalListNode.ts:196](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListNode.ts#L196)

###### Parameters

###### start

`number`

###### deleteCount

`number`

###### nodesToInsert

[`LexicalNode`](lexical.md#lexicalnode)[]

###### Returns

`this`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`splice`](lexical.md#splice)

##### updateDOM() {#updatedom-2}

> **updateDOM**(`prevNode`, `dom`, `config`): `boolean`

Defined in: [packages/lexical-list/src/LexicalListNode.ts:140](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListNode.ts#L140)

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

[`EditorConfig`](lexical.md#editorconfig)

###### Returns

`boolean`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`updateDOM`](lexical.md#updatedom-2)

##### updateFromJSON() {#updatefromjson-2}

> **updateFromJSON**(`serializedNode`): `this`

Defined in: [packages/lexical-list/src/LexicalListNode.ts:157](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListNode.ts#L157)

Update this LexicalNode instance from serialized JSON. It's recommended
to implement as much logic as possible in this method instead of the
static importJSON method, so that the functionality can be inherited in subclasses.

The LexicalUpdateJSON utility type should be used to ignore any type, version,
or children properties in the JSON so that the extended JSON from subclasses
are acceptable parameters for the super call.

If overridden, this method must call super.

###### Parameters

###### serializedNode

[`LexicalUpdateJSON`](lexical.md#lexicalupdatejson)\<[`SerializedListNode`](#serializedlistnode)\>

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

[`ElementNode`](lexical.md#elementnode).[`updateFromJSON`](lexical.md#updatefromjson-2)

## Interfaces

### CheckListConfig {#checklistconfig}

Defined in: [packages/lexical-list/src/index.ts:335](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/index.ts#L335)

#### Properties

##### disableTakeFocusOnClick {#disabletakefocusonclick}

> **disableTakeFocusOnClick**: `boolean`

Defined in: [packages/lexical-list/src/index.ts:336](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/index.ts#L336)

***

### ListConfig {#listconfig}

Defined in: [packages/lexical-list/src/index.ts:295](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/index.ts#L295)

#### Properties

##### hasStrictIndent {#hasstrictindent}

> **hasStrictIndent**: `boolean`

Defined in: [packages/lexical-list/src/index.ts:300](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/index.ts#L300)

When `true`, enforces strict indentation rules for list items, ensuring consistent structure.
When `false` (default), indentation is more flexible.

##### shouldPreserveNumbering {#shouldpreservenumbering}

> **shouldPreserveNumbering**: `boolean`

Defined in: [packages/lexical-list/src/index.ts:301](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/index.ts#L301)

***

### RegisterListOptions {#registerlistoptions}

Defined in: [packages/lexical-list/src/index.ts:79](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/index.ts#L79)

#### Properties

##### restoreNumbering? {#restorenumbering}

> `optional` **restoreNumbering**: `boolean`

Defined in: [packages/lexical-list/src/index.ts:80](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/index.ts#L80)

## Type Aliases

### ListNodeTagType {#listnodetagtype}

> **ListNodeTagType** = `"ul"` \| `"ol"`

Defined in: [packages/lexical-list/src/LexicalListNode.ts:52](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListNode.ts#L52)

***

### ListType {#listtype}

> **ListType** = `"number"` \| `"bullet"` \| `"check"`

Defined in: [packages/lexical-list/src/LexicalListNode.ts:50](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListNode.ts#L50)

***

### SerializedListItemNode {#serializedlistitemnode}

> **SerializedListItemNode** = [`Spread`](lexical.md#spread)\<\{ `checked`: `boolean` \| `undefined`; `value`: `number`; \}, [`SerializedElementNode`](lexical.md#serializedelementnode)\>

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:48](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L48)

***

### SerializedListNode {#serializedlistnode}

> **SerializedListNode** = [`Spread`](lexical.md#spread)\<\{ `listType`: [`ListType`](#listtype); `start`: `number`; `tag`: [`ListNodeTagType`](#listnodetagtype); \}, [`SerializedElementNode`](lexical.md#serializedelementnode)\>

Defined in: [packages/lexical-list/src/LexicalListNode.ts:41](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListNode.ts#L41)

## Variables

### CheckListExtension {#checklistextension}

> `const` **CheckListExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<[`CheckListConfig`](#checklistconfig), `"@lexical/list/CheckList"`, [`NamedSignalsOutput`](lexical_extension.md#namedsignalsoutput)\<[`CheckListConfig`](#checklistconfig)\>, `unknown`\>

Defined in: [packages/lexical-list/src/index.ts:346](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/index.ts#L346)

Registers checklist functionality for [ListNode](#listnode) and
[ListItemNode](#listitemnode) with a
[INSERT\_CHECK\_LIST\_COMMAND](#insert_check_list_command) listener and
the expected keyboard and mouse interactions for
checkboxes.

***

### INSERT\_CHECK\_LIST\_COMMAND {#insert_check_list_command}

> `const` **INSERT\_CHECK\_LIST\_COMMAND**: [`LexicalCommand`](lexical.md#lexicalcommand)\<`void`\>

Defined in: [packages/lexical-list/src/checkList.ts:41](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/checkList.ts#L41)

***

### INSERT\_ORDERED\_LIST\_COMMAND {#insert_ordered_list_command}

> `const` **INSERT\_ORDERED\_LIST\_COMMAND**: [`LexicalCommand`](lexical.md#lexicalcommand)\<`void`\>

Defined in: [packages/lexical-list/src/index.ts:72](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/index.ts#L72)

***

### INSERT\_UNORDERED\_LIST\_COMMAND {#insert_unordered_list_command}

> `const` **INSERT\_UNORDERED\_LIST\_COMMAND**: [`LexicalCommand`](lexical.md#lexicalcommand)\<`void`\>

Defined in: [packages/lexical-list/src/index.ts:70](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/index.ts#L70)

***

### ListExtension {#listextension}

> `const` **ListExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<[`ListConfig`](#listconfig), `"@lexical/list/List"`, [`NamedSignalsOutput`](lexical_extension.md#namedsignalsoutput)\<[`ListConfig`](#listconfig)\>, `unknown`\>

Defined in: [packages/lexical-list/src/index.ts:308](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/index.ts#L308)

Configures [ListNode](#listnode), [ListItemNode](#listitemnode) and registers
the strict indent transform if `hasStrictIndent` is true (default false).

***

### REMOVE\_LIST\_COMMAND {#remove_list_command}

> `const` **REMOVE\_LIST\_COMMAND**: [`LexicalCommand`](lexical.md#lexicalcommand)\<`void`\>

Defined in: [packages/lexical-list/src/index.ts:75](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/index.ts#L75)

***

### UPDATE\_LIST\_START\_COMMAND {#update_list_start_command}

> `const` **UPDATE\_LIST\_START\_COMMAND**: [`LexicalCommand`](lexical.md#lexicalcommand)\<\{ `listNodeKey`: [`NodeKey`](lexical.md#nodekey); `newStart`: `number`; \}\>

Defined in: [packages/lexical-list/src/index.ts:66](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/index.ts#L66)

## Functions

### $createListItemNode() {#createlistitemnode}

> **$createListItemNode**(`checked?`): [`ListItemNode`](#listitemnode)

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:610](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L610)

Creates a new List Item node, passing true/false will convert it to a checkbox input.

#### Parameters

##### checked?

`boolean`

Is the List Item a checkbox and, if so, is it checked? undefined/null: not a checkbox, true/false is a checkbox and checked/unchecked, respectively.

#### Returns

[`ListItemNode`](#listitemnode)

The new List Item.

***

### $createListNode() {#createlistnode}

> **$createListNode**(`listType`, `start`): [`ListNode`](#listnode)

Defined in: [packages/lexical-list/src/LexicalListNode.ts:369](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListNode.ts#L369)

Creates a ListNode of listType.

#### Parameters

##### listType

[`ListType`](#listtype) = `'number'`

The type of list to be created. Can be 'number', 'bullet', or 'check'.

##### start

`number` = `1`

Where an ordered list starts its count, start = 1 if left undefined.

#### Returns

[`ListNode`](#listnode)

The new ListNode

***

### $getListDepth() {#getlistdepth}

> **$getListDepth**(`listNode`): `number`

Defined in: [packages/lexical-list/src/utils.ts:27](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/utils.ts#L27)

Checks the depth of listNode from the root node.

#### Parameters

##### listNode

[`ListNode`](#listnode)

The ListNode to be checked.

#### Returns

`number`

The depth of the ListNode.

***

### $handleListInsertParagraph() {#handlelistinsertparagraph}

> **$handleListInsertParagraph**(`restoreNumbering`): `boolean`

Defined in: [packages/lexical-list/src/formatList.ts:508](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/formatList.ts#L508)

Attempts to insert a ParagraphNode at selection and selects the new node. The selection must contain a ListItemNode
or a node that does not already contain text. If its grandparent is the root/shadow root, it will get the ListNode
(which should be the parent node) and insert the ParagraphNode as a sibling to the ListNode. If the ListNode is
nested in a ListItemNode instead, it will add the ParagraphNode after the grandparent ListItemNode.
Throws an invariant if the selection is not a child of a ListNode.

#### Parameters

##### restoreNumbering

`boolean` = `false`

#### Returns

`boolean`

true if a ParagraphNode was inserted successfully, false if there is no selection
or the selection does not contain a ListItemNode or the node already holds text.

***

### $insertList() {#insertlist}

> **$insertList**(`listType`): `void`

Defined in: [packages/lexical-list/src/formatList.ts:68](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/formatList.ts#L68)

Inserts a new ListNode. If the selection's anchor node is an empty ListItemNode and is a child of
the root/shadow root, it will replace the ListItemNode with a ListNode and the old ListItemNode.
Otherwise it will replace its parent with a new ListNode and re-insert the ListItemNode and any previous children.
If the selection's anchor node is not an empty ListItemNode, it will add a new ListNode or merge an existing ListNode,
unless the the node is a leaf node, in which case it will attempt to find a ListNode up the branch and replace it with
a new ListNode, or create a new ListNode at the nearest root/shadow root.

#### Parameters

##### listType

[`ListType`](#listtype)

The type of list, "number" | "bullet" | "check".

#### Returns

`void`

***

### $isListItemNode() {#islistitemnode}

> **$isListItemNode**(`node`): `node is ListItemNode`

Defined in: [packages/lexical-list/src/LexicalListItemNode.ts:619](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListItemNode.ts#L619)

Checks to see if the node is a ListItemNode.

#### Parameters

##### node

The node to be checked.

`undefined` | `null` | [`LexicalNode`](lexical.md#lexicalnode)

#### Returns

`node is ListItemNode`

true if the node is a ListItemNode, false otherwise.

***

### $isListNode() {#islistnode}

> **$isListNode**(`node`): `node is ListNode`

Defined in: [packages/lexical-list/src/LexicalListNode.ts:381](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/LexicalListNode.ts#L381)

Checks to see if the node is a ListNode.

#### Parameters

##### node

The node to be checked.

`undefined` | `null` | [`LexicalNode`](lexical.md#lexicalnode)

#### Returns

`node is ListNode`

true if the node is a ListNode, false otherwise.

***

### $removeList() {#removelist}

> **$removeList**(): `void`

Defined in: [packages/lexical-list/src/formatList.ts:257](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/formatList.ts#L257)

Searches for the nearest ancestral ListNode and removes it. If selection is an empty ListItemNode
it will remove the whole list, including the ListItemNode. For each ListItemNode in the ListNode,
removeList will also generate new ParagraphNodes in the removed ListNode's place. Any child node
inside a ListItemNode will be appended to the new ParagraphNodes.

#### Returns

`void`

***

### ~~insertList()~~ {#insertlist-3}

> **insertList**(`editor`, `listType`): `void`

Defined in: [packages/lexical-list/src/index.ts:278](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/index.ts#L278)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

The lexical editor.

##### listType

[`ListType`](#listtype)

The type of list, "number" | "bullet" | "check".

#### Returns

`void`

#### Deprecated

use [$insertList](#insertlist) from an update or command listener.

Inserts a new ListNode. If the selection's anchor node is an empty ListItemNode and is a child of
the root/shadow root, it will replace the ListItemNode with a ListNode and the old ListItemNode.
Otherwise it will replace its parent with a new ListNode and re-insert the ListItemNode and any previous children.
If the selection's anchor node is not an empty ListItemNode, it will add a new ListNode or merge an existing ListNode,
unless the the node is a leaf node, in which case it will attempt to find a ListNode up the branch and replace it with
a new ListNode, or create a new ListNode at the nearest root/shadow root.

***

### registerCheckList() {#registerchecklist}

> **registerCheckList**(`editor`, `options?`): () => `void`

Defined in: [packages/lexical-list/src/checkList.ts:51](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/checkList.ts#L51)

Registers the checklist plugin with the editor.

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

The LexicalEditor instance.

##### options?

Optional configuration.
  - disableTakeFocusOnClick: If true, clicking a checklist item will not focus the editor (useful for mobile).

###### disableTakeFocusOnClick?

`boolean` \| [`Signal`](lexical_extension.md#signal)\<`boolean`\>

#### Returns

> (): `void`

##### Returns

`void`

***

### registerList() {#registerlist}

> **registerList**(`editor`, `options?`): () => `void`

Defined in: [packages/lexical-list/src/index.ts:83](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/index.ts#L83)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### options?

[`RegisterListOptions`](#registerlistoptions)

#### Returns

> (): `void`

##### Returns

`void`

***

### registerListStrictIndentTransform() {#registerliststrictindenttransform}

> **registerListStrictIndentTransform**(`editor`): () => `void`

Defined in: [packages/lexical-list/src/index.ts:183](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/index.ts#L183)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

#### Returns

> (): `void`

##### Returns

`void`

***

### ~~removeList()~~ {#removelist-3}

> **removeList**(`editor`): `void`

Defined in: [packages/lexical-list/src/index.ts:291](https://github.com/facebook/lexical/tree/main/packages/lexical-list/src/index.ts#L291)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

The lexical editor.

#### Returns

`void`

#### Deprecated

use [$removeList](#removelist) from an update or command listener.

Searches for the nearest ancestral ListNode and removes it. If selection is an empty ListItemNode
it will remove the whole list, including the ListItemNode. For each ListItemNode in the ListNode,
removeList will also generate new ParagraphNodes in the removed ListNode's place. Any child node
inside a ListItemNode will be appended to the new ParagraphNodes.
