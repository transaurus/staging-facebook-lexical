# @lexical/code

## Classes

### CodeHighlightNode {#codehighlightnode}

Defined in: [packages/lexical-code-core/src/CodeHighlightNode.ts:37](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeHighlightNode.ts#L37)

#### Extends

- [`TextNode`](lexical.md#textnode)

#### Constructors

##### Constructor

> **new CodeHighlightNode**(`text`, `highlightType?`, `key?`): [`CodeHighlightNode`](#codehighlightnode)

Defined in: [packages/lexical-code-core/src/CodeHighlightNode.ts:41](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeHighlightNode.ts#L41)

###### Parameters

###### text

`string` = `''`

###### highlightType?

`null` | `string`

###### key?

`string`

###### Returns

[`CodeHighlightNode`](#codehighlightnode)

###### Overrides

[`TextNode`](lexical.md#textnode).[`constructor`](lexical.md#constructor-5)

#### Methods

##### afterCloneFrom() {#afterclonefrom}

> **afterCloneFrom**(`prevNode`): `void`

Defined in: [packages/lexical-code-core/src/CodeHighlightNode.ts:62](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeHighlightNode.ts#L62)

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

[`TextNode`](lexical.md#textnode).[`afterCloneFrom`](lexical.md#afterclonefrom-4)

##### canHaveFormat() {#canhaveformat}

> **canHaveFormat**(): `boolean`

Defined in: [packages/lexical-code-core/src/CodeHighlightNode.ts:78](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeHighlightNode.ts#L78)

###### Returns

`boolean`

true if the text node supports font styling, false otherwise.

###### Overrides

[`TextNode`](lexical.md#textnode).[`canHaveFormat`](lexical.md#canhaveformat)

##### createDOM() {#createdom}

> **createDOM**(`config`): `HTMLElement`

Defined in: [packages/lexical-code-core/src/CodeHighlightNode.ts:82](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeHighlightNode.ts#L82)

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

[`TextNode`](lexical.md#textnode).[`createDOM`](lexical.md#createdom-10)

##### createParentElementNode() {#createparentelementnode}

> **createParentElementNode**(): [`ElementNode`](lexical.md#elementnode)

Defined in: [packages/lexical-code-core/src/CodeHighlightNode.ts:143](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeHighlightNode.ts#L143)

The creation logic for any required parent. Should be implemented if [isParentRequired](lexical.md#isparentrequired-6) returns true.

###### Returns

[`ElementNode`](lexical.md#elementnode)

###### Overrides

[`TextNode`](lexical.md#textnode).[`createParentElementNode`](lexical.md#createparentelementnode-4)

##### exportJSON() {#exportjson}

> **exportJSON**(): `SerializedCodeHighlightNode`

Defined in: [packages/lexical-code-core/src/CodeHighlightNode.ts:127](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeHighlightNode.ts#L127)

Controls how the this node is serialized to JSON. This is important for
copy and paste between Lexical editors sharing the same namespace. It's also important
if you're serializing to JSON for persistent storage somewhere.
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Returns

`SerializedCodeHighlightNode`

###### Overrides

[`TextNode`](lexical.md#textnode).[`exportJSON`](lexical.md#exportjson-6)

##### getHighlightType() {#gethighlighttype}

> **getHighlightType**(): `undefined` \| `null` \| `string`

Defined in: [packages/lexical-code-core/src/CodeHighlightNode.ts:67](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeHighlightNode.ts#L67)

###### Returns

`undefined` \| `null` \| `string`

##### isParentRequired() {#isparentrequired}

> **isParentRequired**(): `true`

Defined in: [packages/lexical-code-core/src/CodeHighlightNode.ts:139](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeHighlightNode.ts#L139)

Whether or not this node has a required parent. Used during copy + paste operations
to normalize nodes that would otherwise be orphaned. For example, ListItemNodes without
a ListNode parent or TextNodes with a ParagraphNode parent.

###### Returns

`true`

###### Overrides

[`TextNode`](lexical.md#textnode).[`isParentRequired`](lexical.md#isparentrequired-4)

##### setFormat() {#setformat}

> **setFormat**(`format`): `this`

Defined in: [packages/lexical-code-core/src/CodeHighlightNode.ts:135](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeHighlightNode.ts#L135)

Sets the node format to the provided TextFormatType or 32-bit integer. Note that the TextFormatType
version of the argument can only specify one format and doing so will remove all other formats that
may be applied to the node. For toggling behavior, consider using [TextNode.toggleFormat](lexical.md#toggleformat)

###### Parameters

###### format

`number`

TextFormatType or 32-bit integer representing the node format.

###### Returns

`this`

this TextNode.
// TODO 0.12 This should just be a `string`.

###### Overrides

[`TextNode`](lexical.md#textnode).[`setFormat`](lexical.md#setformat-2)

##### setHighlightType() {#sethighlighttype}

> **setHighlightType**(`highlightType?`): `this`

Defined in: [packages/lexical-code-core/src/CodeHighlightNode.ts:72](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeHighlightNode.ts#L72)

###### Parameters

###### highlightType?

`null` | `string`

###### Returns

`this`

##### updateDOM() {#updatedom}

> **updateDOM**(`prevNode`, `dom`, `config`): `boolean`

Defined in: [packages/lexical-code-core/src/CodeHighlightNode.ts:92](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeHighlightNode.ts#L92)

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

[`TextNode`](lexical.md#textnode).[`updateDOM`](lexical.md#updatedom-10)

##### updateFromJSON() {#updatefromjson}

> **updateFromJSON**(`serializedNode`): `this`

Defined in: [packages/lexical-code-core/src/CodeHighlightNode.ts:119](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeHighlightNode.ts#L119)

Update this LexicalNode instance from serialized JSON. It's recommended
to implement as much logic as possible in this method instead of the
static importJSON method, so that the functionality can be inherited in subclasses.

The LexicalUpdateJSON utility type should be used to ignore any type, version,
or children properties in the JSON so that the extended JSON from subclasses
are acceptable parameters for the super call.

If overridden, this method must call super.

###### Parameters

###### serializedNode

[`LexicalUpdateJSON`](lexical.md#lexicalupdatejson)\<`SerializedCodeHighlightNode`\>

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

[`TextNode`](lexical.md#textnode).[`updateFromJSON`](lexical.md#updatefromjson-4)

##### clone() {#clone}

> `static` **clone**(`node`): [`CodeHighlightNode`](#codehighlightnode)

Defined in: [packages/lexical-code-core/src/CodeHighlightNode.ts:54](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeHighlightNode.ts#L54)

Clones this node, creating a new node with a different key
and adding it to the EditorState (but not attaching it anywhere!). All nodes must
implement this method.

###### Parameters

###### node

[`CodeHighlightNode`](#codehighlightnode)

###### Returns

[`CodeHighlightNode`](#codehighlightnode)

###### Overrides

[`TextNode`](lexical.md#textnode).[`clone`](lexical.md#clone-12)

##### getType() {#gettype}

> `static` **getType**(): `string`

Defined in: [packages/lexical-code-core/src/CodeHighlightNode.ts:50](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeHighlightNode.ts#L50)

Returns the string type of this node. Every node must
implement this and it MUST BE UNIQUE amongst nodes registered
on the editor.

###### Returns

`string`

###### Overrides

[`TextNode`](lexical.md#textnode).[`getType`](lexical.md#gettype-18)

##### importJSON() {#importjson}

> `static` **importJSON**(`serializedNode`): [`CodeHighlightNode`](#codehighlightnode)

Defined in: [packages/lexical-code-core/src/CodeHighlightNode.ts:113](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeHighlightNode.ts#L113)

Controls how the this node is deserialized from JSON. This is usually boilerplate,
but provides an abstraction between the node implementation and serialized interface that can
be important if you ever make breaking changes to a node schema (by adding or removing properties).
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Parameters

###### serializedNode

`SerializedCodeHighlightNode`

###### Returns

[`CodeHighlightNode`](#codehighlightnode)

###### Overrides

[`TextNode`](lexical.md#textnode).[`importJSON`](lexical.md#importjson-12)

***

### CodeNode {#codenode}

Defined in: [packages/lexical-code-core/src/CodeNode.ts:70](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeNode.ts#L70)

#### Extends

- [`ElementNode`](lexical.md#elementnode)

#### Constructors

##### Constructor

> **new CodeNode**(`language?`, `key?`): [`CodeNode`](#codenode)

Defined in: [packages/lexical-code-core/src/CodeNode.ts:86](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeNode.ts#L86)

###### Parameters

###### language?

`null` | `string`

###### key?

`string`

###### Returns

[`CodeNode`](#codenode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`constructor`](lexical.md#constructor-1)

#### Methods

##### afterCloneFrom() {#afterclonefrom-2}

> **afterCloneFrom**(`prevNode`): `void`

Defined in: [packages/lexical-code-core/src/CodeNode.ts:93](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeNode.ts#L93)

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

##### canIndent() {#canindent}

> **canIndent**(): `false`

Defined in: [packages/lexical-code-core/src/CodeNode.ts:367](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeNode.ts#L367)

###### Returns

`false`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`canIndent`](lexical.md#canindent)

##### collapseAtStart() {#collapseatstart}

> **collapseAtStart**(): `boolean`

Defined in: [packages/lexical-code-core/src/CodeNode.ts:371](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeNode.ts#L371)

###### Returns

`boolean`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`collapseAtStart`](lexical.md#collapseatstart)

##### createDOM() {#createdom-2}

> **createDOM**(`config`): `HTMLElement`

Defined in: [packages/lexical-code-core/src/CodeNode.ts:101](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeNode.ts#L101)

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

##### exportDOM() {#exportdom}

> **exportDOM**(`editor`): [`DOMExportOutput`](lexical.md#domexportoutput)

Defined in: [packages/lexical-code-core/src/CodeNode.ts:176](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeNode.ts#L176)

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

> **exportJSON**(): [`SerializedCodeNode`](#serializedcodenode)

Defined in: [packages/lexical-code-core/src/CodeNode.ts:279](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeNode.ts#L279)

Controls how the this node is serialized to JSON. This is important for
copy and paste between Lexical editors sharing the same namespace. It's also important
if you're serializing to JSON for persistent storage somewhere.
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Returns

[`SerializedCodeNode`](#serializedcodenode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`exportJSON`](lexical.md#exportjson-2)

##### getIsSyntaxHighlightSupported() {#getissyntaxhighlightsupported}

> **getIsSyntaxHighlightSupported**(): `boolean`

Defined in: [packages/lexical-code-core/src/CodeNode.ts:395](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeNode.ts#L395)

###### Returns

`boolean`

##### getLanguage() {#getlanguage}

> **getLanguage**(): `undefined` \| `null` \| `string`

Defined in: [packages/lexical-code-core/src/CodeNode.ts:385](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeNode.ts#L385)

###### Returns

`undefined` \| `null` \| `string`

##### getTheme() {#gettheme}

> **getTheme**(): `undefined` \| `string`

Defined in: [packages/lexical-code-core/src/CodeNode.ts:405](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeNode.ts#L405)

###### Returns

`undefined` \| `string`

##### insertNewAfter() {#insertnewafter}

> **insertNewAfter**(`selection`, `restoreSelection`): `null` \| [`ParagraphNode`](lexical.md#paragraphnode) \| [`TabNode`](lexical.md#tabnode) \| [`CodeHighlightNode`](#codehighlightnode)

Defined in: [packages/lexical-code-core/src/CodeNode.ts:288](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeNode.ts#L288)

###### Parameters

###### selection

[`RangeSelection`](lexical.md#rangeselection)

###### restoreSelection

`boolean` = `true`

###### Returns

`null` \| [`ParagraphNode`](lexical.md#paragraphnode) \| [`TabNode`](lexical.md#tabnode) \| [`CodeHighlightNode`](#codehighlightnode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`insertNewAfter`](lexical.md#insertnewafter)

##### setIsSyntaxHighlightSupported() {#setissyntaxhighlightsupported}

> **setIsSyntaxHighlightSupported**(`isSupported`): `this`

Defined in: [packages/lexical-code-core/src/CodeNode.ts:389](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeNode.ts#L389)

###### Parameters

###### isSupported

`boolean`

###### Returns

`this`

##### setLanguage() {#setlanguage}

> **setLanguage**(`language`): `this`

Defined in: [packages/lexical-code-core/src/CodeNode.ts:379](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeNode.ts#L379)

###### Parameters

###### language

`undefined` | `null` | `string`

###### Returns

`this`

##### setTheme() {#settheme}

> **setTheme**(`theme`): `this`

Defined in: [packages/lexical-code-core/src/CodeNode.ts:399](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeNode.ts#L399)

###### Parameters

###### theme

`undefined` | `null` | `string`

###### Returns

`this`

##### updateDOM() {#updatedom-2}

> **updateDOM**(`prevNode`, `dom`, `config`): `boolean`

Defined in: [packages/lexical-code-core/src/CodeNode.ts:124](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeNode.ts#L124)

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

Defined in: [packages/lexical-code-core/src/CodeNode.ts:272](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeNode.ts#L272)

Update this LexicalNode instance from serialized JSON. It's recommended
to implement as much logic as possible in this method instead of the
static importJSON method, so that the functionality can be inherited in subclasses.

The LexicalUpdateJSON utility type should be used to ignore any type, version,
or children properties in the JSON so that the extended JSON from subclasses
are acceptable parameters for the super call.

If overridden, this method must call super.

###### Parameters

###### serializedNode

[`LexicalUpdateJSON`](lexical.md#lexicalupdatejson)\<[`SerializedCodeNode`](#serializedcodenode)\>

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

##### clone() {#clone-2}

> `static` **clone**(`node`): [`CodeNode`](#codenode)

Defined in: [packages/lexical-code-core/src/CodeNode.ts:82](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeNode.ts#L82)

Clones this node, creating a new node with a different key
and adding it to the EditorState (but not attaching it anywhere!). All nodes must
implement this method.

###### Parameters

###### node

[`CodeNode`](#codenode)

###### Returns

[`CodeNode`](#codenode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`clone`](lexical.md#clone-2)

##### getType() {#gettype-2}

> `static` **getType**(): `string`

Defined in: [packages/lexical-code-core/src/CodeNode.ts:78](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeNode.ts#L78)

Returns the string type of this node. Every node must
implement this and it MUST BE UNIQUE amongst nodes registered
on the editor.

###### Returns

`string`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`getType`](lexical.md#gettype-6)

##### importDOM() {#importdom}

> `static` **importDOM**(): `null` \| [`DOMConversionMap`](lexical.md#domconversionmap)

Defined in: [packages/lexical-code-core/src/CodeNode.ts:201](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeNode.ts#L201)

###### Returns

`null` \| [`DOMConversionMap`](lexical.md#domconversionmap)

###### Overrides

`ElementNode.importDOM`

##### importJSON() {#importjson-2}

> `static` **importJSON**(`serializedNode`): [`CodeNode`](#codenode)

Defined in: [packages/lexical-code-core/src/CodeNode.ts:268](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeNode.ts#L268)

Controls how the this node is deserialized from JSON. This is usually boilerplate,
but provides an abstraction between the node implementation and serialized interface that can
be important if you ever make breaking changes to a node schema (by adding or removing properties).
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Parameters

###### serializedNode

[`SerializedCodeNode`](#serializedcodenode)

###### Returns

[`CodeNode`](#codenode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`importJSON`](lexical.md#importjson-2)

## Type Aliases

### SerializedCodeNode {#serializedcodenode}

> **SerializedCodeNode** = [`Spread`](lexical.md#spread)\<\{ `language`: `string` \| `null` \| `undefined`; `theme?`: `string`; \}, [`SerializedElementNode`](lexical.md#serializedelementnode)\>

Defined in: [packages/lexical-code-core/src/CodeNode.ts:44](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeNode.ts#L44)

## Variables

### ~~CODE\_LANGUAGE\_FRIENDLY\_NAME\_MAP~~ {#code_language_friendly_name_map}

> `const` **CODE\_LANGUAGE\_FRIENDLY\_NAME\_MAP**: `Record`\<`string`, `string`\> = `LexicalCodePrism.CODE_LANGUAGE_FRIENDLY_NAME_MAP`

Defined in: [packages/lexical-code/src/index.ts:30](https://github.com/facebook/lexical/tree/main/packages/lexical-code/src/index.ts#L30)

#### Deprecated

moved to `@lexical/code-prism`

***

### ~~CODE\_LANGUAGE\_MAP~~ {#code_language_map}

> `const` **CODE\_LANGUAGE\_MAP**: `Record`\<`string`, `string`\> = `LexicalCodePrism.CODE_LANGUAGE_MAP`

Defined in: [packages/lexical-code/src/index.ts:33](https://github.com/facebook/lexical/tree/main/packages/lexical-code/src/index.ts#L33)

#### Deprecated

moved to `@lexical/code-prism`

***

### CodeExtension {#codeextension}

> `const` **CodeExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<[`ExtensionConfigBase`](lexical.md#extensionconfigbase), `"@lexical/code"`, `unknown`, `unknown`\>

Defined in: [packages/lexical-code-core/src/CodeExtension.ts:16](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeExtension.ts#L16)

Add code blocks to the editor (syntax highlighting provided separately)

***

### DEFAULT\_CODE\_LANGUAGE {#default_code_language}

> `const` **DEFAULT\_CODE\_LANGUAGE**: `"javascript"` = `'javascript'`

Defined in: [packages/lexical-code-core/src/CodeNode.ts:52](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeNode.ts#L52)

***

### ~~getCodeLanguageOptions()~~ {#getcodelanguageoptions}

> `const` **getCodeLanguageOptions**: () => \[`string`, `string`\][] = `LexicalCodePrism.getCodeLanguageOptions`

Defined in: [packages/lexical-code/src/index.ts:35](https://github.com/facebook/lexical/tree/main/packages/lexical-code/src/index.ts#L35)

#### Returns

\[`string`, `string`\][]

#### Deprecated

moved to `@lexical/code-prism`

***

### ~~getCodeLanguages()~~ {#getcodelanguages}

> `const` **getCodeLanguages**: () => `string`[] = `LexicalCodePrism.getCodeLanguages`

Defined in: [packages/lexical-code/src/index.ts:37](https://github.com/facebook/lexical/tree/main/packages/lexical-code/src/index.ts#L37)

#### Returns

`string`[]

#### Deprecated

moved to `@lexical/code-prism`

***

### ~~getCodeThemeOptions()~~ {#getcodethemeoptions}

> `const` **getCodeThemeOptions**: () => \[`string`, `string`\][] = `LexicalCodePrism.getCodeThemeOptions`

Defined in: [packages/lexical-code/src/index.ts:39](https://github.com/facebook/lexical/tree/main/packages/lexical-code/src/index.ts#L39)

#### Returns

\[`string`, `string`\][]

#### Deprecated

moved to `@lexical/code-prism`

***

### ~~getLanguageFriendlyName()~~ {#getlanguagefriendlyname}

> `const` **getLanguageFriendlyName**: (`lang`) => `string` = `LexicalCodePrism.getLanguageFriendlyName`

Defined in: [packages/lexical-code/src/index.ts:41](https://github.com/facebook/lexical/tree/main/packages/lexical-code/src/index.ts#L41)

#### Parameters

##### lang

`string`

#### Returns

`string`

#### Deprecated

moved to `@lexical/code-prism`

***

### ~~normalizeCodeLang()~~ {#normalizecodelang}

> `const` **normalizeCodeLang**: (`lang`) => `string` = `LexicalCodePrism.normalizeCodeLanguage`

Defined in: [packages/lexical-code/src/index.ts:43](https://github.com/facebook/lexical/tree/main/packages/lexical-code/src/index.ts#L43)

#### Parameters

##### lang

`string`

#### Returns

`string`

#### Deprecated

renamed to `normalizeCodeLanguage` and moved to `@lexical/code-prism`

***

### ~~normalizeCodeLanguage()~~ {#normalizecodelanguage}

> `const` **normalizeCodeLanguage**: (`lang`) => `string` = `LexicalCodePrism.normalizeCodeLanguage`

Defined in: [packages/lexical-code/src/index.ts:45](https://github.com/facebook/lexical/tree/main/packages/lexical-code/src/index.ts#L45)

#### Parameters

##### lang

`string`

#### Returns

`string`

#### Deprecated

moved to `@lexical/code-prism`

***

### ~~PrismTokenizer~~ {#prismtokenizer}

> `const` **PrismTokenizer**: [`Tokenizer`](lexical_code-prism.md#tokenizer) = `LexicalCodePrism.PrismTokenizer`

Defined in: [packages/lexical-code/src/index.ts:47](https://github.com/facebook/lexical/tree/main/packages/lexical-code/src/index.ts#L47)

#### Deprecated

moved to `@lexical/code-prism`

***

### ~~registerCodeHighlighting()~~ {#registercodehighlighting}

> `const` **registerCodeHighlighting**: (`editor`, `tokenizer?`) => () => `void` = `LexicalCodePrism.registerCodeHighlighting`

Defined in: [packages/lexical-code/src/index.ts:49](https://github.com/facebook/lexical/tree/main/packages/lexical-code/src/index.ts#L49)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### tokenizer?

[`Tokenizer`](lexical_code-prism.md#tokenizer)

#### Returns

> (): `void`

##### Returns

`void`

#### Deprecated

moved to `@lexical/code-prism`

## Functions

### $createCodeHighlightNode() {#createcodehighlightnode}

> **$createCodeHighlightNode**(`text`, `highlightType?`): [`CodeHighlightNode`](#codehighlightnode)

Defined in: [packages/lexical-code-core/src/CodeHighlightNode.ts:160](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeHighlightNode.ts#L160)

#### Parameters

##### text

`string` = `''`

##### highlightType?

`null` | `string`

#### Returns

[`CodeHighlightNode`](#codehighlightnode)

***

### $createCodeNode() {#createcodenode}

> **$createCodeNode**(`language?`, `theme?`): [`CodeNode`](#codenode)

Defined in: [packages/lexical-code-core/src/CodeNode.ts:410](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeNode.ts#L410)

#### Parameters

##### language?

`null` | `string`

##### theme?

`null` | `string`

#### Returns

[`CodeNode`](#codenode)

***

### $getCodeLineDirection() {#getcodelinedirection}

> **$getCodeLineDirection**(`anchor`): `null` \| `"ltr"` \| `"rtl"`

Defined in: [packages/lexical-code-core/src/FlatStructureUtils.ts:67](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/FlatStructureUtils.ts#L67)

Determines the visual writing direction of a code line.

Scans the line segments (CodeHighlightNode/TabNode) from start to end
and returns the first strong direction found ("ltr" or "rtl").
If no strong character is found, falls back to the parent element's
direction. Returns null if indeterminate.

#### Parameters

##### anchor

[`LineBreakNode`](lexical.md#linebreaknode) | [`TabNode`](lexical.md#tabnode) | [`CodeHighlightNode`](#codehighlightnode)

#### Returns

`null` \| `"ltr"` \| `"rtl"`

***

### $getEndOfCodeInLine() {#getendofcodeinline}

> **$getEndOfCodeInLine**(`anchor`): [`TabNode`](lexical.md#tabnode) \| [`CodeHighlightNode`](#codehighlightnode)

Defined in: [packages/lexical-code-core/src/FlatStructureUtils.ts:213](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/FlatStructureUtils.ts#L213)

#### Parameters

##### anchor

[`TabNode`](lexical.md#tabnode) | [`CodeHighlightNode`](#codehighlightnode)

#### Returns

[`TabNode`](lexical.md#tabnode) \| [`CodeHighlightNode`](#codehighlightnode)

***

### $getFirstCodeNodeOfLine() {#getfirstcodenodeofline}

> **$getFirstCodeNodeOfLine**(`anchor`): [`LineBreakNode`](lexical.md#linebreaknode) \| [`TabNode`](lexical.md#tabnode) \| [`CodeHighlightNode`](#codehighlightnode)

Defined in: [packages/lexical-code-core/src/FlatStructureUtils.ts:47](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/FlatStructureUtils.ts#L47)

#### Parameters

##### anchor

[`LineBreakNode`](lexical.md#linebreaknode) | [`TabNode`](lexical.md#tabnode) | [`CodeHighlightNode`](#codehighlightnode)

#### Returns

[`LineBreakNode`](lexical.md#linebreaknode) \| [`TabNode`](lexical.md#tabnode) \| [`CodeHighlightNode`](#codehighlightnode)

***

### $getLastCodeNodeOfLine() {#getlastcodenodeofline}

> **$getLastCodeNodeOfLine**(`anchor`): [`LineBreakNode`](lexical.md#linebreaknode) \| [`TabNode`](lexical.md#tabnode) \| [`CodeHighlightNode`](#codehighlightnode)

Defined in: [packages/lexical-code-core/src/FlatStructureUtils.ts:53](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/FlatStructureUtils.ts#L53)

#### Parameters

##### anchor

[`LineBreakNode`](lexical.md#linebreaknode) | [`TabNode`](lexical.md#tabnode) | [`CodeHighlightNode`](#codehighlightnode)

#### Returns

[`LineBreakNode`](lexical.md#linebreaknode) \| [`TabNode`](lexical.md#tabnode) \| [`CodeHighlightNode`](#codehighlightnode)

***

### $getStartOfCodeInLine() {#getstartofcodeinline}

> **$getStartOfCodeInLine**(`anchor`, `offset`): `null` \| \{ `node`: [`LineBreakNode`](lexical.md#linebreaknode) \| [`TabNode`](lexical.md#tabnode) \| [`CodeHighlightNode`](#codehighlightnode); `offset`: `number`; \}

Defined in: [packages/lexical-code-core/src/FlatStructureUtils.ts:100](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/FlatStructureUtils.ts#L100)

#### Parameters

##### anchor

[`TabNode`](lexical.md#tabnode) | [`CodeHighlightNode`](#codehighlightnode)

##### offset

`number`

#### Returns

`null` \| \{ `node`: [`LineBreakNode`](lexical.md#linebreaknode) \| [`TabNode`](lexical.md#tabnode) \| [`CodeHighlightNode`](#codehighlightnode); `offset`: `number`; \}

***

### $isCodeHighlightNode() {#iscodehighlightnode}

> **$isCodeHighlightNode**(`node`): `node is CodeHighlightNode`

Defined in: [packages/lexical-code-core/src/CodeHighlightNode.ts:167](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeHighlightNode.ts#L167)

#### Parameters

##### node

`undefined` | `null` | [`LexicalNode`](lexical.md#lexicalnode) | [`CodeHighlightNode`](#codehighlightnode)

#### Returns

`node is CodeHighlightNode`

***

### $isCodeNode() {#iscodenode}

> **$isCodeNode**(`node`): `node is CodeNode`

Defined in: [packages/lexical-code-core/src/CodeNode.ts:417](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeNode.ts#L417)

#### Parameters

##### node

`undefined` | `null` | [`LexicalNode`](lexical.md#lexicalnode)

#### Returns

`node is CodeNode`

***

### getDefaultCodeLanguage() {#getdefaultcodelanguage}

> **getDefaultCodeLanguage**(): `string`

Defined in: [packages/lexical-code-core/src/CodeNode.ts:53](https://github.com/facebook/lexical/tree/main/packages/lexical-code-core/src/CodeNode.ts#L53)

#### Returns

`string`
