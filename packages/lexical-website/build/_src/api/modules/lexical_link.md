# @lexical/link

## Classes

### AutoLinkNode {#autolinknode}

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:443](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L443)

#### Extends

- [`LinkNode`](#linknode)

#### Constructors

##### Constructor

> **new AutoLinkNode**(`url`, `attributes`, `key?`): [`AutoLinkNode`](#autolinknode)

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:448](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L448)

###### Parameters

###### url

`string` = `''`

###### attributes

[`AutoLinkAttributes`](#autolinkattributes) = `{}`

###### key?

`string`

###### Returns

[`AutoLinkNode`](#autolinknode)

###### Overrides

[`LinkNode`](#linknode).[`constructor`](#constructor-1)

#### Properties

##### \_\_isUnlinked {#__isunlinked}

> **\_\_isUnlinked**: `boolean`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:446](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L446)

Indicates whether the autolink was ever unlinked. *

#### Methods

##### afterCloneFrom() {#afterclonefrom}

> **afterCloneFrom**(`prevNode`): `void`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:460](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L460)

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

[`LinkNode`](#linknode).[`afterCloneFrom`](#afterclonefrom-2)

##### canBeEmpty() {#canbeempty}

> **canBeEmpty**(): `boolean`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:264](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L264)

###### Returns

`boolean`

###### Inherited from

[`LinkNode`](#linknode).[`canBeEmpty`](#canbeempty-2)

##### canInsertTextAfter() {#caninserttextafter}

> **canInsertTextAfter**(): `false`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:260](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L260)

###### Returns

`false`

###### Inherited from

[`LinkNode`](#linknode).[`canInsertTextAfter`](#caninserttextafter-2)

##### canInsertTextBefore() {#caninserttextbefore}

> **canInsertTextBefore**(): `false`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:256](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L256)

###### Returns

`false`

###### Inherited from

[`LinkNode`](#linknode).[`canInsertTextBefore`](#caninserttextbefore-2)

##### createDOM() {#createdom}

> **createDOM**(`config`): `LinkHTMLElementType`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:496](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L496)

Called during the reconciliation process to determine which nodes
to insert into the DOM for this Lexical Node.

This method must return exactly one HTMLElement. Nested elements are not supported.

Do not attempt to update the Lexical EditorState during this phase of the update lifecycle.

###### Parameters

###### config

[`EditorConfig`](lexical.md#editorconfig)

###### Returns

`LinkHTMLElementType`

###### Overrides

[`LinkNode`](#linknode).[`createDOM`](#createdom-2)

##### exportJSON() {#exportjson}

> **exportJSON**(): [`SerializedAutoLinkNode`](#serializedautolinknode)

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:532](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L532)

Controls how the this node is serialized to JSON. This is important for
copy and paste between Lexical editors sharing the same namespace. It's also important
if you're serializing to JSON for persistent storage somewhere.
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Returns

[`SerializedAutoLinkNode`](#serializedautolinknode)

###### Overrides

[`LinkNode`](#linknode).[`exportJSON`](#exportjson-2)

##### extractWithChild() {#extractwithchild}

> **extractWithChild**(`child`, `selection`, `destination`): `boolean`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:272](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L272)

###### Parameters

###### child

[`LexicalNode`](lexical.md#lexicalnode)

###### selection

[`BaseSelection`](lexical.md#baseselection)

###### destination

`"clone"` | `"html"`

###### Returns

`boolean`

###### Inherited from

[`LinkNode`](#linknode).[`extractWithChild`](#extractwithchild-2)

##### getIsUnlinked() {#getisunlinked}

> **getIsUnlinked**(): `boolean`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:486](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L486)

###### Returns

`boolean`

##### getRel() {#getrel}

> **getRel**(): `null` \| `string`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:227](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L227)

###### Returns

`null` \| `string`

###### Inherited from

[`LinkNode`](#linknode).[`getRel`](#getrel-2)

##### getTarget() {#gettarget}

> **getTarget**(): `null` \| `string`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:217](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L217)

###### Returns

`null` \| `string`

###### Inherited from

[`LinkNode`](#linknode).[`getTarget`](#gettarget-2)

##### getTitle() {#gettitle}

> **getTitle**(): `null` \| `string`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:237](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L237)

###### Returns

`null` \| `string`

###### Inherited from

[`LinkNode`](#linknode).[`getTitle`](#gettitle-2)

##### getType() {#gettype}

> **getType**(): `string`

Defined in: [packages/lexical/src/LexicalNode.ts:593](https://github.com/facebook/lexical/tree/main/packages/lexical/src/LexicalNode.ts#L593)

Returns the string type of this node.

###### Returns

`string`

###### Inherited from

`LinkNode.getType`

##### getURL() {#geturl}

> **getURL**(): `string`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:207](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L207)

###### Returns

`string`

###### Inherited from

[`LinkNode`](#linknode).[`getURL`](#geturl-2)

##### insertNewAfter() {#insertnewafter}

> **insertNewAfter**(`_`, `restoreSelection`): `null` \| [`ElementNode`](lexical.md#elementnode)

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:539](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L539)

###### Parameters

###### \_

[`RangeSelection`](lexical.md#rangeselection)

###### restoreSelection

`boolean` = `true`

###### Returns

`null` \| [`ElementNode`](lexical.md#elementnode)

###### Overrides

[`LinkNode`](#linknode).[`insertNewAfter`](#insertnewafter-2)

##### isEmailURI() {#isemailuri}

> **isEmailURI**(): `boolean`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:291](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L291)

###### Returns

`boolean`

###### Inherited from

[`LinkNode`](#linknode).[`isEmailURI`](#isemailuri-2)

##### isInline() {#isinline}

> **isInline**(): `true`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:268](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L268)

###### Returns

`true`

###### Inherited from

[`LinkNode`](#linknode).[`isInline`](#isinline-2)

##### isWebSiteURI() {#iswebsiteuri}

> **isWebSiteURI**(): `boolean`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:295](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L295)

###### Returns

`boolean`

###### Inherited from

[`LinkNode`](#linknode).[`isWebSiteURI`](#iswebsiteuri-2)

##### sanitizeUrl() {#sanitizeurl}

> **sanitizeUrl**(`url`): `string`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:183](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L183)

###### Parameters

###### url

`string`

###### Returns

`string`

###### Inherited from

[`LinkNode`](#linknode).[`sanitizeUrl`](#sanitizeurl-2)

##### setIsUnlinked() {#setisunlinked}

> **setIsUnlinked**(`value`): `this`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:490](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L490)

###### Parameters

###### value

`boolean`

###### Returns

`this`

##### setRel() {#setrel}

> **setRel**(`rel`): `this`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:231](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L231)

###### Parameters

###### rel

`null` | `string`

###### Returns

`this`

###### Inherited from

[`LinkNode`](#linknode).[`setRel`](#setrel-2)

##### setTarget() {#settarget}

> **setTarget**(`target`): `this`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:221](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L221)

###### Parameters

###### target

`null` | `string`

###### Returns

`this`

###### Inherited from

[`LinkNode`](#linknode).[`setTarget`](#settarget-2)

##### setTitle() {#settitle}

> **setTitle**(`title`): `this`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:241](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L241)

###### Parameters

###### title

`null` | `string`

###### Returns

`this`

###### Inherited from

[`LinkNode`](#linknode).[`setTitle`](#settitle-2)

##### setURL() {#seturl}

> **setURL**(`url`): `this`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:211](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L211)

###### Parameters

###### url

`string`

###### Returns

`this`

###### Inherited from

[`LinkNode`](#linknode).[`setURL`](#seturl-2)

##### shouldMergeAdjacentLink() {#shouldmergeadjacentlink}

> **shouldMergeAdjacentLink**(`_otherLink`): `boolean`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:482](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L482)

###### Parameters

###### \_otherLink

[`LinkNode`](#linknode)

###### Returns

`boolean`

###### Overrides

[`LinkNode`](#linknode).[`shouldMergeAdjacentLink`](#shouldmergeadjacentlink-2)

##### updateDOM() {#updatedom}

> **updateDOM**(`prevNode`, `anchor`, `config`): `boolean`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:504](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L504)

Called when a node changes and should update the DOM
in whatever way is necessary to make it align with any changes that might
have happened during the update.

Returning "true" here will cause lexical to unmount and recreate the DOM node
(by calling createDOM). You would need to do this if the element tag changes,
for instance.

###### Parameters

###### prevNode

`this`

###### anchor

`LinkHTMLElementType`

###### config

[`EditorConfig`](lexical.md#editorconfig)

###### Returns

`boolean`

###### Overrides

[`LinkNode`](#linknode).[`updateDOM`](#updatedom-2)

##### updateFromJSON() {#updatefromjson}

> **updateFromJSON**(`serializedNode`): `this`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:519](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L519)

Update this LexicalNode instance from serialized JSON. It's recommended
to implement as much logic as possible in this method instead of the
static importJSON method, so that the functionality can be inherited in subclasses.

The LexicalUpdateJSON utility type should be used to ignore any type, version,
or children properties in the JSON so that the extended JSON from subclasses
are acceptable parameters for the super call.

If overridden, this method must call super.

###### Parameters

###### serializedNode

[`LexicalUpdateJSON`](lexical.md#lexicalupdatejson)\<[`SerializedAutoLinkNode`](#serializedautolinknode)\>

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

[`LinkNode`](#linknode).[`updateFromJSON`](#updatefromjson-2)

##### updateLinkDOM() {#updatelinkdom}

> **updateLinkDOM**(`prevNode`, `anchor`, `config`): `void`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:129](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L129)

###### Parameters

###### prevNode

`null` | [`AutoLinkNode`](#autolinknode)

###### anchor

`LinkHTMLElementType`

###### config

[`EditorConfig`](lexical.md#editorconfig)

###### Returns

`void`

###### Inherited from

[`LinkNode`](#linknode).[`updateLinkDOM`](#updatelinkdom-2)

##### clone() {#clone}

> `static` **clone**(`node`): [`AutoLinkNode`](#autolinknode)

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:469](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L469)

Clones this node, creating a new node with a different key
and adding it to the EditorState (but not attaching it anywhere!). All nodes must
implement this method.

###### Parameters

###### node

[`AutoLinkNode`](#autolinknode)

###### Returns

[`AutoLinkNode`](#autolinknode)

###### Overrides

[`LinkNode`](#linknode).[`clone`](#clone-2)

##### getType() {#gettype-2}

> `static` **getType**(): `string`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:465](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L465)

Returns the string type of this node. Every node must
implement this and it MUST BE UNIQUE amongst nodes registered
on the editor.

###### Returns

`string`

###### Overrides

[`LinkNode`](#linknode).[`getType`](#gettype-4)

##### importDOM() {#importdom}

> `static` **importDOM**(): `null`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:527](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L527)

###### Returns

`null`

###### Overrides

[`LinkNode`](#linknode).[`importDOM`](#importdom-2)

##### importJSON() {#importjson}

> `static` **importJSON**(`serializedNode`): [`AutoLinkNode`](#autolinknode)

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:515](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L515)

Controls how the this node is deserialized from JSON. This is usually boilerplate,
but provides an abstraction between the node implementation and serialized interface that can
be important if you ever make breaking changes to a node schema (by adding or removing properties).
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Parameters

###### serializedNode

[`SerializedAutoLinkNode`](#serializedautolinknode)

###### Returns

[`AutoLinkNode`](#autolinknode)

###### Overrides

[`LinkNode`](#linknode).[`importJSON`](#importjson-2)

***

### LinkNode {#linknode}

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:79](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L79)

#### Extends

- [`ElementNode`](lexical.md#elementnode)

#### Extended by

- [`AutoLinkNode`](#autolinknode)

#### Constructors

##### Constructor

> **new LinkNode**(`url`, `attributes`, `key?`): [`LinkNode`](#linknode)

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:101](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L101)

###### Parameters

###### url

`string` = `''`

###### attributes

[`LinkAttributes`](#linkattributes) = `{}`

###### key?

`string`

###### Returns

[`LinkNode`](#linknode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`constructor`](lexical.md#constructor-1)

#### Methods

##### afterCloneFrom() {#afterclonefrom-2}

> **afterCloneFrom**(`prevNode`): `void`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:114](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L114)

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

##### canBeEmpty() {#canbeempty-2}

> **canBeEmpty**(): `boolean`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:264](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L264)

###### Returns

`boolean`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`canBeEmpty`](lexical.md#canbeempty)

##### canInsertTextAfter() {#caninserttextafter-2}

> **canInsertTextAfter**(): `false`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:260](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L260)

###### Returns

`false`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`canInsertTextAfter`](lexical.md#caninserttextafter)

##### canInsertTextBefore() {#caninserttextbefore-2}

> **canInsertTextBefore**(): `false`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:256](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L256)

###### Returns

`false`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`canInsertTextBefore`](lexical.md#caninserttextbefore)

##### createDOM() {#createdom-2}

> **createDOM**(`config`): `LinkHTMLElementType`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:122](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L122)

Called during the reconciliation process to determine which nodes
to insert into the DOM for this Lexical Node.

This method must return exactly one HTMLElement. Nested elements are not supported.

Do not attempt to update the Lexical EditorState during this phase of the update lifecycle.

###### Parameters

###### config

[`EditorConfig`](lexical.md#editorconfig)

###### Returns

`LinkHTMLElementType`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`createDOM`](lexical.md#createdom-2)

##### exportJSON() {#exportjson-2}

> **exportJSON**(): [`SerializedLinkNode`](#serializedlinknode) \| [`SerializedAutoLinkNode`](#serializedautolinknode)

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:197](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L197)

Controls how the this node is serialized to JSON. This is important for
copy and paste between Lexical editors sharing the same namespace. It's also important
if you're serializing to JSON for persistent storage somewhere.
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Returns

[`SerializedLinkNode`](#serializedlinknode) \| [`SerializedAutoLinkNode`](#serializedautolinknode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`exportJSON`](lexical.md#exportjson-2)

##### extractWithChild() {#extractwithchild-2}

> **extractWithChild**(`child`, `selection`, `destination`): `boolean`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:272](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L272)

###### Parameters

###### child

[`LexicalNode`](lexical.md#lexicalnode)

###### selection

[`BaseSelection`](lexical.md#baseselection)

###### destination

`"clone"` | `"html"`

###### Returns

`boolean`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`extractWithChild`](lexical.md#extractwithchild)

##### getRel() {#getrel-2}

> **getRel**(): `null` \| `string`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:227](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L227)

###### Returns

`null` \| `string`

##### getTarget() {#gettarget-2}

> **getTarget**(): `null` \| `string`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:217](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L217)

###### Returns

`null` \| `string`

##### getTitle() {#gettitle-2}

> **getTitle**(): `null` \| `string`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:237](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L237)

###### Returns

`null` \| `string`

##### getURL() {#geturl-2}

> **getURL**(): `string`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:207](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L207)

###### Returns

`string`

##### insertNewAfter() {#insertnewafter-2}

> **insertNewAfter**(`_`, `restoreSelection`): `null` \| [`ElementNode`](lexical.md#elementnode)

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:247](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L247)

###### Parameters

###### \_

[`RangeSelection`](lexical.md#rangeselection)

###### restoreSelection

`boolean` = `true`

###### Returns

`null` \| [`ElementNode`](lexical.md#elementnode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`insertNewAfter`](lexical.md#insertnewafter)

##### isEmailURI() {#isemailuri-2}

> **isEmailURI**(): `boolean`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:291](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L291)

###### Returns

`boolean`

##### isInline() {#isinline-2}

> **isInline**(): `true`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:268](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L268)

###### Returns

`true`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`isInline`](lexical.md#isinline-2)

##### isWebSiteURI() {#iswebsiteuri-2}

> **isWebSiteURI**(): `boolean`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:295](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L295)

###### Returns

`boolean`

##### sanitizeUrl() {#sanitizeurl-2}

> **sanitizeUrl**(`url`): `string`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:183](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L183)

###### Parameters

###### url

`string`

###### Returns

`string`

##### setRel() {#setrel-2}

> **setRel**(`rel`): `this`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:231](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L231)

###### Parameters

###### rel

`null` | `string`

###### Returns

`this`

##### setTarget() {#settarget-2}

> **setTarget**(`target`): `this`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:221](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L221)

###### Parameters

###### target

`null` | `string`

###### Returns

`this`

##### setTitle() {#settitle-2}

> **setTitle**(`title`): `this`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:241](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L241)

###### Parameters

###### title

`null` | `string`

###### Returns

`this`

##### setURL() {#seturl-2}

> **setURL**(`url`): `this`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:211](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L211)

###### Parameters

###### url

`string`

###### Returns

`this`

##### shouldMergeAdjacentLink() {#shouldmergeadjacentlink-2}

> **shouldMergeAdjacentLink**(`otherLink`): `boolean`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:301](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L301)

###### Parameters

###### otherLink

[`LinkNode`](#linknode)

###### Returns

`boolean`

##### updateDOM() {#updatedom-2}

> **updateDOM**(`prevNode`, `anchor`, `config`): `boolean`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:152](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L152)

Called when a node changes and should update the DOM
in whatever way is necessary to make it align with any changes that might
have happened during the update.

Returning "true" here will cause lexical to unmount and recreate the DOM node
(by calling createDOM). You would need to do this if the element tag changes,
for instance.

###### Parameters

###### prevNode

`this`

###### anchor

`LinkHTMLElementType`

###### config

[`EditorConfig`](lexical.md#editorconfig)

###### Returns

`boolean`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`updateDOM`](lexical.md#updatedom-2)

##### updateFromJSON() {#updatefromjson-2}

> **updateFromJSON**(`serializedNode`): `this`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:174](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L174)

Update this LexicalNode instance from serialized JSON. It's recommended
to implement as much logic as possible in this method instead of the
static importJSON method, so that the functionality can be inherited in subclasses.

The LexicalUpdateJSON utility type should be used to ignore any type, version,
or children properties in the JSON so that the extended JSON from subclasses
are acceptable parameters for the super call.

If overridden, this method must call super.

###### Parameters

###### serializedNode

[`LexicalUpdateJSON`](lexical.md#lexicalupdatejson)\<[`SerializedLinkNode`](#serializedlinknode)\>

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

##### updateLinkDOM() {#updatelinkdom-2}

> **updateLinkDOM**(`prevNode`, `anchor`, `config`): `void`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:129](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L129)

###### Parameters

###### prevNode

`null` | [`LinkNode`](#linknode)

###### anchor

`LinkHTMLElementType`

###### config

[`EditorConfig`](lexical.md#editorconfig)

###### Returns

`void`

##### clone() {#clone-2}

> `static` **clone**(`node`): [`LinkNode`](#linknode)

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:93](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L93)

Clones this node, creating a new node with a different key
and adding it to the EditorState (but not attaching it anywhere!). All nodes must
implement this method.

###### Parameters

###### node

[`LinkNode`](#linknode)

###### Returns

[`LinkNode`](#linknode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`clone`](lexical.md#clone-2)

##### getType() {#gettype-4}

> `static` **getType**(): `string`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:89](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L89)

Returns the string type of this node. Every node must
implement this and it MUST BE UNIQUE amongst nodes registered
on the editor.

###### Returns

`string`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`getType`](lexical.md#gettype-6)

##### importDOM() {#importdom-2}

> `static` **importDOM**(): `null` \| [`DOMConversionMap`](lexical.md#domconversionmap)

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:161](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L161)

###### Returns

`null` \| [`DOMConversionMap`](lexical.md#domconversionmap)

###### Overrides

`ElementNode.importDOM`

##### importJSON() {#importjson-2}

> `static` **importJSON**(`serializedNode`): [`LinkNode`](#linknode)

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:170](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L170)

Controls how the this node is deserialized from JSON. This is usually boilerplate,
but provides an abstraction between the node implementation and serialized interface that can
be important if you ever make breaking changes to a node schema (by adding or removing properties).
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Parameters

###### serializedNode

[`SerializedLinkNode`](#serializedlinknode)

###### Returns

[`LinkNode`](#linknode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`importJSON`](lexical.md#importjson-2)

## Interfaces

### AutoLinkConfig {#autolinkconfig}

Defined in: [packages/lexical-link/src/LexicalAutoLinkExtension.ts:509](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalAutoLinkExtension.ts#L509)

#### Properties

##### changeHandlers {#changehandlers}

> **changeHandlers**: [`ChangeHandler`](#changehandler)[]

Defined in: [packages/lexical-link/src/LexicalAutoLinkExtension.ts:511](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalAutoLinkExtension.ts#L511)

##### excludeParents {#excludeparents}

> **excludeParents**: (`parent`) => `boolean`[]

Defined in: [packages/lexical-link/src/LexicalAutoLinkExtension.ts:512](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalAutoLinkExtension.ts#L512)

###### Parameters

###### parent

[`ElementNode`](lexical.md#elementnode)

###### Returns

`boolean`

##### matchers {#matchers}

> **matchers**: [`LinkMatcher`](#linkmatcher)[]

Defined in: [packages/lexical-link/src/LexicalAutoLinkExtension.ts:510](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalAutoLinkExtension.ts#L510)

***

### ClickableLinkConfig {#clickablelinkconfig}

Defined in: [packages/lexical-link/src/ClickableLinkExtension.ts:40](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/ClickableLinkExtension.ts#L40)

#### Properties

##### disabled {#disabled}

> **disabled**: `boolean`

Defined in: [packages/lexical-link/src/ClickableLinkExtension.ts:44](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/ClickableLinkExtension.ts#L44)

Disable this extension when true (default false)

##### newTab {#newtab}

> **newTab**: `boolean`

Defined in: [packages/lexical-link/src/ClickableLinkExtension.ts:42](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/ClickableLinkExtension.ts#L42)

Open clicked links in a new tab when true (default false)

## Type Aliases

### AutoLinkAttributes {#autolinkattributes}

> **AutoLinkAttributes** = `Partial`\<[`Spread`](lexical.md#spread)\<[`LinkAttributes`](#linkattributes), \{ `isUnlinked?`: `boolean`; \}\>\>

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:57](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L57)

***

### ChangeHandler() {#changehandler}

> **ChangeHandler** = (`url`, `prevUrl`) => `void`

Defined in: [packages/lexical-link/src/LexicalAutoLinkExtension.ts:36](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalAutoLinkExtension.ts#L36)

#### Parameters

##### url

`string` | `null`

##### prevUrl

`string` | `null`

#### Returns

`void`

***

### LinkAttributes {#linkattributes}

> **LinkAttributes** = `object`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:51](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L51)

#### Properties

##### rel? {#rel}

> `optional` **rel**: `null` \| `string`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:52](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L52)

##### target? {#target}

> `optional` **target**: `null` \| `string`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:53](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L53)

##### title? {#title}

> `optional` **title**: `null` \| `string`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:54](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L54)

***

### LinkMatcher() {#linkmatcher}

> **LinkMatcher** = (`text`) => `LinkMatcherResult` \| `null`

Defined in: [packages/lexical-link/src/LexicalAutoLinkExtension.ts:49](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalAutoLinkExtension.ts#L49)

#### Parameters

##### text

`string`

#### Returns

`LinkMatcherResult` \| `null`

***

### SerializedAutoLinkNode {#serializedautolinknode}

> **SerializedAutoLinkNode** = [`Spread`](lexical.md#spread)\<\{ `isUnlinked`: `boolean`; \}, [`SerializedLinkNode`](#serializedlinknode)\>

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:434](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L434)

***

### SerializedLinkNode {#serializedlinknode}

> **SerializedLinkNode** = [`Spread`](lexical.md#spread)\<\{ `url`: `string`; \}, [`Spread`](lexical.md#spread)\<[`LinkAttributes`](#linkattributes), [`SerializedElementNode`](lexical.md#serializedelementnode)\>\>

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:61](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L61)

## Variables

### AutoLinkExtension {#autolinkextension}

> `const` **AutoLinkExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<[`AutoLinkConfig`](#autolinkconfig), `"@lexical/link/AutoLink"`, `unknown`, `unknown`\>

Defined in: [packages/lexical-link/src/LexicalAutoLinkExtension.ts:589](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalAutoLinkExtension.ts#L589)

An extension to automatically create AutoLinkNode from text
that matches the configured matchers. No default implementation
is provided for any matcher, see [createLinkMatcherWithRegExp](#createlinkmatcherwithregexp)
for a helper function to create a matcher from a RegExp, and the
Playground's [AutoLinkPlugin](https://github.com/facebook/lexical/blob/main/packages/lexical-playground/src/plugins/AutoLinkPlugin/index.tsx)
for some example RegExps that could be used.

The given `matchers` and `changeHandlers` will be merged by
concatenating the configured arrays.

***

### ClickableLinkExtension {#clickablelinkextension}

> `const` **ClickableLinkExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<[`ClickableLinkConfig`](#clickablelinkconfig), `"@lexical/link/ClickableLink"`, [`NamedSignalsOutput`](lexical_extension.md#namedsignalsoutput)\<[`ClickableLinkConfig`](#clickablelinkconfig)\>, `unknown`\>

Defined in: [packages/lexical-link/src/ClickableLinkExtension.ts:132](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/ClickableLinkExtension.ts#L132)

Normally in a Lexical editor the `CLICK_COMMAND` on a LinkNode will cause the
selection to change instead of opening a link. This extension can be used to
restore the default behavior, e.g. when the editor is not editable.

***

### LinkExtension {#linkextension}

> `const` **LinkExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<`LinkConfig`, `"@lexical/link/Link"`, [`NamedSignalsOutput`](lexical_extension.md#namedsignalsoutput)\<`LinkConfig`\>, `unknown`\>

Defined in: [packages/lexical-link/src/LexicalLinkExtension.ts:136](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkExtension.ts#L136)

Provides [LinkNode](#linknode), an implementation of
[TOGGLE\_LINK\_COMMAND](#toggle_link_command), and a [PASTE\_COMMAND](lexical.md#paste_command)
listener to wrap selected nodes in a link when a
URL is pasted and `validateUrl` is defined.

***

### TOGGLE\_LINK\_COMMAND {#toggle_link_command}

> `const` **TOGGLE\_LINK\_COMMAND**: [`LexicalCommand`](lexical.md#lexicalcommand)\<`string` \| `object` & [`LinkAttributes`](#linkattributes) \| `null`\>

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:579](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L579)

***

### ~~toggleLink()~~ {#togglelink}

> `const` **toggleLink**: (`urlOrAttributes`, `attributes`) => `void` = `$toggleLink`

Defined in: [packages/lexical-link/src/index.ts:42](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/index.ts#L42)

Generates or updates a LinkNode. It can also delete a LinkNode if the URL is null,
but saves any children and brings them up to the parent node.

#### Parameters

##### urlOrAttributes

The URL the link directs to, or an attributes object with an url property

`null` | `string` | [`LinkAttributes`](#linkattributes) & `object`

##### attributes

[`LinkAttributes`](#linkattributes) = `{}`

Optional HTML a tag attributes. \{ target, rel, title \}

#### Returns

`void`

#### Deprecated

renamed to [$toggleLink](#togglelink-1) by @lexical/eslint-plugin rules-of-lexical

## Functions

### $createAutoLinkNode() {#createautolinknode}

> **$createAutoLinkNode**(`url`, `attributes?`): [`AutoLinkNode`](#autolinknode)

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:561](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L561)

Takes a URL and creates an AutoLinkNode. AutoLinkNodes are generally automatically generated
during typing, which is especially useful when a button to generate a LinkNode is not practical.

#### Parameters

##### url

`string` = `''`

The URL the LinkNode should direct to.

##### attributes?

`Partial`\<[`Spread`](lexical.md#spread)\<[`LinkAttributes`](#linkattributes), \{ `isUnlinked?`: `boolean`; \}\>\>

Optional HTML a tag attributes. \{ target, rel, title \}

#### Returns

[`AutoLinkNode`](#autolinknode)

The LinkNode.

***

### $createLinkNode() {#createlinknode}

> **$createLinkNode**(`url`, `attributes?`): [`LinkNode`](#linknode)

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:416](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L416)

Takes a URL and creates a LinkNode.

#### Parameters

##### url

`string` = `''`

The URL the LinkNode should direct to.

##### attributes?

[`LinkAttributes`](#linkattributes)

Optional HTML a tag attributes \{ target, rel, title \}

#### Returns

[`LinkNode`](#linknode)

The LinkNode.

***

### $isAutoLinkNode() {#isautolinknode}

> **$isAutoLinkNode**(`node`): `node is AutoLinkNode`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:573](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L573)

Determines if node is an AutoLinkNode.

#### Parameters

##### node

The node to be checked.

`undefined` | `null` | [`LexicalNode`](lexical.md#lexicalnode)

#### Returns

`node is AutoLinkNode`

true if node is an AutoLinkNode, false otherwise.

***

### $isLinkNode() {#islinknode}

> **$isLinkNode**(`node`): `node is LinkNode`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:428](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L428)

Determines if node is a LinkNode.

#### Parameters

##### node

The node to be checked.

`undefined` | `null` | [`LexicalNode`](lexical.md#lexicalnode)

#### Returns

`node is LinkNode`

true if node is a LinkNode, false otherwise.

***

### $toggleLink() {#togglelink-1}

> **$toggleLink**(`urlOrAttributes`, `attributes`): `void`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:710](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L710)

Generates or updates a LinkNode. It can also delete a LinkNode if the URL is null,
but saves any children and brings them up to the parent node.

#### Parameters

##### urlOrAttributes

The URL the link directs to, or an attributes object with an url property

`null` | `string` | [`LinkAttributes`](#linkattributes) & `object`

##### attributes

[`LinkAttributes`](#linkattributes) = `{}`

Optional HTML a tag attributes. \{ target, rel, title \}

#### Returns

`void`

***

### createLinkMatcherWithRegExp() {#createlinkmatcherwithregexp}

> **createLinkMatcherWithRegExp**(`regExp`, `urlTransformer`): (`text`) => `null` \| \{ `index`: `number`; `length`: `number`; `text`: `string`; `url`: `string`; \}

Defined in: [packages/lexical-link/src/LexicalAutoLinkExtension.ts:51](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalAutoLinkExtension.ts#L51)

#### Parameters

##### regExp

`RegExp`

##### urlTransformer

(`text`) => `string`

#### Returns

> (`text`): `null` \| \{ `index`: `number`; `length`: `number`; `text`: `string`; `url`: `string`; \}

##### Parameters

###### text

`string`

##### Returns

`null` \| \{ `index`: `number`; `length`: `number`; `text`: `string`; `url`: `string`; \}

***

### formatUrl() {#formaturl}

> **formatUrl**(`url`): `string`

Defined in: [packages/lexical-link/src/LexicalLinkNode.ts:906](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalLinkNode.ts#L906)

Formats a URL string by adding appropriate protocol if missing

#### Parameters

##### url

`string`

URL to format

#### Returns

`string`

Formatted URL with appropriate protocol

***

### registerAutoLink() {#registerautolink}

> **registerAutoLink**(`editor`, `config`): () => `void`

Defined in: [packages/lexical-link/src/LexicalAutoLinkExtension.ts:521](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/LexicalAutoLinkExtension.ts#L521)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### config

[`AutoLinkConfig`](#autolinkconfig) = `defaultConfig`

#### Returns

> (): `void`

##### Returns

`void`

***

### registerClickableLink() {#registerclickablelink}

> **registerClickableLink**(`editor`, `stores`, `eventOptions`): () => `void`

Defined in: [packages/lexical-link/src/ClickableLinkExtension.ts:47](https://github.com/facebook/lexical/tree/main/packages/lexical-link/src/ClickableLinkExtension.ts#L47)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### stores

[`NamedSignalsOutput`](lexical_extension.md#namedsignalsoutput)\<[`ClickableLinkConfig`](#clickablelinkconfig)\>

##### eventOptions

`Pick`\<`AddEventListenerOptions`, `"signal"`\> = `{}`

#### Returns

> (): `void`

##### Returns

`void`
