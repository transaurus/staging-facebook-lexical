# @lexical/mark

## Classes

### MarkNode {#marknode}

Defined in: [packages/lexical-mark/src/MarkNode.ts:36](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/MarkNode.ts#L36)

#### Extends

- [`ElementNode`](lexical.md#elementnode)

#### Constructors

##### Constructor

> **new MarkNode**(`ids`, `key?`): [`MarkNode`](#marknode)

Defined in: [packages/lexical-mark/src/MarkNode.ts:72](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/MarkNode.ts#L72)

###### Parameters

###### ids

readonly `string`[] = `NO_IDS`

###### key?

`string`

###### Returns

[`MarkNode`](#marknode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`constructor`](lexical.md#constructor-1)

#### Methods

##### addID() {#addid}

> **addID**(`id`): `this`

Defined in: [packages/lexical-mark/src/MarkNode.ts:123](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/MarkNode.ts#L123)

###### Parameters

###### id

`string`

###### Returns

`this`

##### afterCloneFrom() {#afterclonefrom}

> **afterCloneFrom**(`prevNode`): `void`

Defined in: [packages/lexical-mark/src/MarkNode.ts:48](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/MarkNode.ts#L48)

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

Defined in: [packages/lexical-mark/src/MarkNode.ts:156](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/MarkNode.ts#L156)

###### Returns

`false`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`canBeEmpty`](lexical.md#canbeempty)

##### canInsertTextAfter() {#caninserttextafter}

> **canInsertTextAfter**(): `false`

Defined in: [packages/lexical-mark/src/MarkNode.ts:152](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/MarkNode.ts#L152)

###### Returns

`false`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`canInsertTextAfter`](lexical.md#caninserttextafter)

##### canInsertTextBefore() {#caninserttextbefore}

> **canInsertTextBefore**(): `false`

Defined in: [packages/lexical-mark/src/MarkNode.ts:148](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/MarkNode.ts#L148)

###### Returns

`false`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`canInsertTextBefore`](lexical.md#caninserttextbefore)

##### createDOM() {#createdom}

> **createDOM**(`config`): `HTMLElement`

Defined in: [packages/lexical-mark/src/MarkNode.ts:77](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/MarkNode.ts#L77)

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

##### deleteID() {#deleteid}

> **deleteID**(`id`): `this`

Defined in: [packages/lexical-mark/src/MarkNode.ts:128](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/MarkNode.ts#L128)

###### Parameters

###### id

`string`

###### Returns

`this`

##### excludeFromCopy() {#excludefromcopy}

> **excludeFromCopy**(`destination`): `boolean`

Defined in: [packages/lexical-mark/src/MarkNode.ts:187](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/MarkNode.ts#L187)

###### Parameters

###### destination

`"clone"` | `"html"`

###### Returns

`boolean`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`excludeFromCopy`](lexical.md#excludefromcopy)

##### exportJSON() {#exportjson}

> **exportJSON**(): [`SerializedMarkNode`](#serializedmarknode)

Defined in: [packages/lexical-mark/src/MarkNode.ts:65](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/MarkNode.ts#L65)

Controls how the this node is serialized to JSON. This is important for
copy and paste between Lexical editors sharing the same namespace. It's also important
if you're serializing to JSON for persistent storage somewhere.
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Returns

[`SerializedMarkNode`](#serializedmarknode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`exportJSON`](lexical.md#exportjson-2)

##### extractWithChild() {#extractwithchild}

> **extractWithChild**(`child`, `selection`, `destination`): `boolean`

Defined in: [packages/lexical-mark/src/MarkNode.ts:164](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/MarkNode.ts#L164)

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

##### getIDs() {#getids}

> **getIDs**(): `string`[]

Defined in: [packages/lexical-mark/src/MarkNode.ts:113](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/MarkNode.ts#L113)

###### Returns

`string`[]

##### hasID() {#hasid}

> **hasID**(`id`): `boolean`

Defined in: [packages/lexical-mark/src/MarkNode.ts:109](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/MarkNode.ts#L109)

###### Parameters

###### id

`string`

###### Returns

`boolean`

##### insertNewAfter() {#insertnewafter}

> **insertNewAfter**(`selection`, `restoreSelection`): `null` \| [`ElementNode`](lexical.md#elementnode)

Defined in: [packages/lexical-mark/src/MarkNode.ts:139](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/MarkNode.ts#L139)

###### Parameters

###### selection

[`RangeSelection`](lexical.md#rangeselection)

###### restoreSelection

`boolean` = `true`

###### Returns

`null` \| [`ElementNode`](lexical.md#elementnode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`insertNewAfter`](lexical.md#insertnewafter)

##### isInline() {#isinline}

> **isInline**(): `true`

Defined in: [packages/lexical-mark/src/MarkNode.ts:160](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/MarkNode.ts#L160)

###### Returns

`true`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`isInline`](lexical.md#isinline-2)

##### setIDs() {#setids}

> **setIDs**(`ids`): `this`

Defined in: [packages/lexical-mark/src/MarkNode.ts:117](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/MarkNode.ts#L117)

###### Parameters

###### ids

readonly `string`[]

###### Returns

`this`

##### updateDOM() {#updatedom}

> **updateDOM**(`prevNode`, `element`, `config`): `boolean`

Defined in: [packages/lexical-mark/src/MarkNode.ts:86](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/MarkNode.ts#L86)

Called when a node changes and should update the DOM
in whatever way is necessary to make it align with any changes that might
have happened during the update.

Returning "true" here will cause lexical to unmount and recreate the DOM node
(by calling createDOM). You would need to do this if the element tag changes,
for instance.

###### Parameters

###### prevNode

`this`

###### element

`HTMLElement`

###### config

[`EditorConfig`](lexical.md#editorconfig)

###### Returns

`boolean`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`updateDOM`](lexical.md#updatedom-2)

##### updateFromJSON() {#updatefromjson}

> **updateFromJSON**(`serializedNode`): `this`

Defined in: [packages/lexical-mark/src/MarkNode.ts:61](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/MarkNode.ts#L61)

Update this LexicalNode instance from serialized JSON. It's recommended
to implement as much logic as possible in this method instead of the
static importJSON method, so that the functionality can be inherited in subclasses.

The LexicalUpdateJSON utility type should be used to ignore any type, version,
or children properties in the JSON so that the extended JSON from subclasses
are acceptable parameters for the super call.

If overridden, this method must call super.

###### Parameters

###### serializedNode

[`LexicalUpdateJSON`](lexical.md#lexicalupdatejson)\<[`SerializedMarkNode`](#serializedmarknode)\>

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

##### clone() {#clone}

> `static` **clone**(`node`): [`MarkNode`](#marknode)

Defined in: [packages/lexical-mark/src/MarkNode.ts:44](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/MarkNode.ts#L44)

Clones this node, creating a new node with a different key
and adding it to the EditorState (but not attaching it anywhere!). All nodes must
implement this method.

###### Parameters

###### node

[`MarkNode`](#marknode)

###### Returns

[`MarkNode`](#marknode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`clone`](lexical.md#clone-2)

##### getType() {#gettype}

> `static` **getType**(): `string`

Defined in: [packages/lexical-mark/src/MarkNode.ts:40](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/MarkNode.ts#L40)

Returns the string type of this node. Every node must
implement this and it MUST BE UNIQUE amongst nodes registered
on the editor.

###### Returns

`string`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`getType`](lexical.md#gettype-6)

##### importDOM() {#importdom}

> `static` **importDOM**(): `null`

Defined in: [packages/lexical-mark/src/MarkNode.ts:53](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/MarkNode.ts#L53)

###### Returns

`null`

###### Overrides

`ElementNode.importDOM`

##### importJSON() {#importjson}

> `static` **importJSON**(`serializedNode`): [`MarkNode`](#marknode)

Defined in: [packages/lexical-mark/src/MarkNode.ts:57](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/MarkNode.ts#L57)

Controls how the this node is deserialized from JSON. This is usually boilerplate,
but provides an abstraction between the node implementation and serialized interface that can
be important if you ever make breaking changes to a node schema (by adding or removing properties).
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Parameters

###### serializedNode

[`SerializedMarkNode`](#serializedmarknode)

###### Returns

[`MarkNode`](#marknode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`importJSON`](lexical.md#importjson-2)

## Type Aliases

### SerializedMarkNode {#serializedmarknode}

> **SerializedMarkNode** = [`Spread`](lexical.md#spread)\<\{ `ids`: `string`[]; \}, [`SerializedElementNode`](lexical.md#serializedelementnode)\>

Defined in: [packages/lexical-mark/src/MarkNode.ts:26](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/MarkNode.ts#L26)

## Variables

### MarkExtension {#markextension}

> `const` **MarkExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<[`ExtensionConfigBase`](lexical.md#extensionconfigbase), `"@lexical/mark"`, `unknown`, `unknown`\>

Defined in: [packages/lexical-mark/src/index.ts:163](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/index.ts#L163)

Configures [MarkNode](#marknode)

## Functions

### $createMarkNode() {#createmarknode}

> **$createMarkNode**(`ids`): [`MarkNode`](#marknode)

Defined in: [packages/lexical-mark/src/MarkNode.ts:192](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/MarkNode.ts#L192)

#### Parameters

##### ids

readonly `string`[] = `NO_IDS`

#### Returns

[`MarkNode`](#marknode)

***

### $getMarkIDs() {#getmarkids}

> **$getMarkIDs**(`node`, `offset`): `null` \| `string`[]

Defined in: [packages/lexical-mark/src/index.ts:138](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/index.ts#L138)

#### Parameters

##### node

[`TextNode`](lexical.md#textnode)

##### offset

`number`

#### Returns

`null` \| `string`[]

***

### $isMarkNode() {#ismarknode}

> **$isMarkNode**(`node`): `node is MarkNode`

Defined in: [packages/lexical-mark/src/MarkNode.ts:196](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/MarkNode.ts#L196)

#### Parameters

##### node

`null` | [`LexicalNode`](lexical.md#lexicalnode)

#### Returns

`node is MarkNode`

***

### $unwrapMarkNode() {#unwrapmarknode}

> **$unwrapMarkNode**(`node`): `void`

Defined in: [packages/lexical-mark/src/index.ts:22](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/index.ts#L22)

#### Parameters

##### node

[`MarkNode`](#marknode)

#### Returns

`void`

***

### $wrapSelectionInMarkNode() {#wrapselectioninmarknode}

> **$wrapSelectionInMarkNode**(`selection`, `isBackward`, `id`, `createNode?`): `void`

Defined in: [packages/lexical-mark/src/index.ts:37](https://github.com/facebook/lexical/tree/main/packages/lexical-mark/src/index.ts#L37)

#### Parameters

##### selection

[`RangeSelection`](lexical.md#rangeselection)

##### isBackward

`boolean`

##### id

`string`

##### createNode?

(`ids`) => [`MarkNode`](#marknode)

#### Returns

`void`
