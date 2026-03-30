# @lexical/rich-text

## Classes

### HeadingNode {#headingnode}

Defined in: [packages/lexical-rich-text/src/index.ts:221](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L221)

#### Extends

- [`ElementNode`](lexical.md#elementnode)

#### Constructors

##### Constructor

> **new HeadingNode**(`tag`, `key?`): [`HeadingNode`](#headingnode)

Defined in: [packages/lexical-rich-text/src/index.ts:238](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L238)

###### Parameters

###### tag

[`HeadingTagType`](#headingtagtype) = `'h1'`

###### key?

`string`

###### Returns

[`HeadingNode`](#headingnode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`constructor`](lexical.md#constructor-1)

#### Methods

##### afterCloneFrom() {#afterclonefrom}

> **afterCloneFrom**(`prevNode`): `void`

Defined in: [packages/lexical-rich-text/src/index.ts:233](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L233)

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

##### collapseAtStart() {#collapseatstart}

> **collapseAtStart**(): `true`

Defined in: [packages/lexical-rich-text/src/index.ts:395](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L395)

###### Returns

`true`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`collapseAtStart`](lexical.md#collapseatstart)

##### createDOM() {#createdom}

> **createDOM**(`config`): `HTMLElement`

Defined in: [packages/lexical-rich-text/src/index.ts:255](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L255)

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

Defined in: [packages/lexical-rich-text/src/index.ts:325](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L325)

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

> **exportJSON**(): [`SerializedHeadingNode`](#serializedheadingnode)

Defined in: [packages/lexical-rich-text/src/index.ts:361](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L361)

Controls how the this node is serialized to JSON. This is important for
copy and paste between Lexical editors sharing the same namespace. It's also important
if you're serializing to JSON for persistent storage somewhere.
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Returns

[`SerializedHeadingNode`](#serializedheadingnode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`exportJSON`](lexical.md#exportjson-2)

##### extractWithChild() {#extractwithchild}

> **extractWithChild**(): `boolean`

Defined in: [packages/lexical-rich-text/src/index.ts:405](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L405)

###### Returns

`boolean`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`extractWithChild`](lexical.md#extractwithchild)

##### getTag() {#gettag}

> **getTag**(): [`HeadingTagType`](#headingtagtype)

Defined in: [packages/lexical-rich-text/src/index.ts:243](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L243)

###### Returns

[`HeadingTagType`](#headingtagtype)

##### insertNewAfter() {#insertnewafter}

> **insertNewAfter**(`selection?`, `restoreSelection?`): [`HeadingNode`](#headingnode) \| [`ParagraphNode`](lexical.md#paragraphnode)

Defined in: [packages/lexical-rich-text/src/index.ts:369](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L369)

###### Parameters

###### selection?

[`RangeSelection`](lexical.md#rangeselection)

###### restoreSelection?

`boolean` = `true`

###### Returns

[`HeadingNode`](#headingnode) \| [`ParagraphNode`](lexical.md#paragraphnode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`insertNewAfter`](lexical.md#insertnewafter)

##### setTag() {#settag}

> **setTag**(`tag`): `this`

Defined in: [packages/lexical-rich-text/src/index.ts:247](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L247)

###### Parameters

###### tag

[`HeadingTagType`](#headingtagtype)

###### Returns

`this`

##### updateDOM() {#updatedom}

> **updateDOM**(`prevNode`, `dom`, `config`): `boolean`

Defined in: [packages/lexical-rich-text/src/index.ts:267](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L267)

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

##### updateFromJSON() {#updatefromjson}

> **updateFromJSON**(`serializedNode`): `this`

Defined in: [packages/lexical-rich-text/src/index.ts:355](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L355)

Update this LexicalNode instance from serialized JSON. It's recommended
to implement as much logic as possible in this method instead of the
static importJSON method, so that the functionality can be inherited in subclasses.

The LexicalUpdateJSON utility type should be used to ignore any type, version,
or children properties in the JSON so that the extended JSON from subclasses
are acceptable parameters for the super call.

If overridden, this method must call super.

###### Parameters

###### serializedNode

[`LexicalUpdateJSON`](lexical.md#lexicalupdatejson)\<[`SerializedHeadingNode`](#serializedheadingnode)\>

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

> `static` **clone**(`node`): [`HeadingNode`](#headingnode)

Defined in: [packages/lexical-rich-text/src/index.ts:229](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L229)

Clones this node, creating a new node with a different key
and adding it to the EditorState (but not attaching it anywhere!). All nodes must
implement this method.

###### Parameters

###### node

[`HeadingNode`](#headingnode)

###### Returns

[`HeadingNode`](#headingnode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`clone`](lexical.md#clone-2)

##### getType() {#gettype}

> `static` **getType**(): `string`

Defined in: [packages/lexical-rich-text/src/index.ts:225](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L225)

Returns the string type of this node. Every node must
implement this and it MUST BE UNIQUE amongst nodes registered
on the editor.

###### Returns

`string`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`getType`](lexical.md#gettype-6)

##### importDOM() {#importdom}

> `static` **importDOM**(): `null` \| [`DOMConversionMap`](lexical.md#domconversionmap)

Defined in: [packages/lexical-rich-text/src/index.ts:271](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L271)

###### Returns

`null` \| [`DOMConversionMap`](lexical.md#domconversionmap)

###### Overrides

`ElementNode.importDOM`

##### importJSON() {#importjson}

> `static` **importJSON**(`serializedNode`): [`HeadingNode`](#headingnode)

Defined in: [packages/lexical-rich-text/src/index.ts:349](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L349)

Controls how the this node is deserialized from JSON. This is usually boilerplate,
but provides an abstraction between the node implementation and serialized interface that can
be important if you ever make breaking changes to a node schema (by adding or removing properties).
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Parameters

###### serializedNode

[`SerializedHeadingNode`](#serializedheadingnode)

###### Returns

[`HeadingNode`](#headingnode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`importJSON`](lexical.md#importjson-2)

***

### QuoteNode {#quotenode}

Defined in: [packages/lexical-rich-text/src/index.ts:128](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L128)

#### Extends

- [`ElementNode`](lexical.md#elementnode)

#### Methods

##### canMergeWhenEmpty() {#canmergewhenempty}

> **canMergeWhenEmpty**(): `true`

Defined in: [packages/lexical-rich-text/src/index.ts:203](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L203)

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

##### collapseAtStart() {#collapseatstart-2}

> **collapseAtStart**(): `true`

Defined in: [packages/lexical-rich-text/src/index.ts:195](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L195)

###### Returns

`true`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`collapseAtStart`](lexical.md#collapseatstart)

##### createDOM() {#createdom-2}

> **createDOM**(`config`): `HTMLElement`

Defined in: [packages/lexical-rich-text/src/index.ts:139](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L139)

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

##### exportDOM() {#exportdom-2}

> **exportDOM**(`editor`): [`DOMExportOutput`](lexical.md#domexportoutput)

Defined in: [packages/lexical-rich-text/src/index.ts:157](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L157)

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

##### insertNewAfter() {#insertnewafter-2}

> **insertNewAfter**(`_`, `restoreSelection?`): [`ParagraphNode`](lexical.md#paragraphnode)

Defined in: [packages/lexical-rich-text/src/index.ts:187](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L187)

###### Parameters

###### \_

[`RangeSelection`](lexical.md#rangeselection)

###### restoreSelection?

`boolean`

###### Returns

[`ParagraphNode`](lexical.md#paragraphnode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`insertNewAfter`](lexical.md#insertnewafter)

##### updateDOM() {#updatedom-2}

> **updateDOM**(`prevNode`, `dom`): `boolean`

Defined in: [packages/lexical-rich-text/src/index.ts:144](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L144)

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

`boolean`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`updateDOM`](lexical.md#updatedom-2)

##### clone() {#clone-2}

> `static` **clone**(`node`): [`QuoteNode`](#quotenode)

Defined in: [packages/lexical-rich-text/src/index.ts:133](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L133)

Clones this node, creating a new node with a different key
and adding it to the EditorState (but not attaching it anywhere!). All nodes must
implement this method.

###### Parameters

###### node

[`QuoteNode`](#quotenode)

###### Returns

[`QuoteNode`](#quotenode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`clone`](lexical.md#clone-2)

##### getType() {#gettype-2}

> `static` **getType**(): `string`

Defined in: [packages/lexical-rich-text/src/index.ts:129](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L129)

Returns the string type of this node. Every node must
implement this and it MUST BE UNIQUE amongst nodes registered
on the editor.

###### Returns

`string`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`getType`](lexical.md#gettype-6)

##### importDOM() {#importdom-2}

> `static` **importDOM**(): `null` \| [`DOMConversionMap`](lexical.md#domconversionmap)

Defined in: [packages/lexical-rich-text/src/index.ts:148](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L148)

###### Returns

`null` \| [`DOMConversionMap`](lexical.md#domconversionmap)

###### Overrides

`ElementNode.importDOM`

##### importJSON() {#importjson-2}

> `static` **importJSON**(`serializedNode`): [`QuoteNode`](#quotenode)

Defined in: [packages/lexical-rich-text/src/index.ts:181](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L181)

Controls how the this node is deserialized from JSON. This is usually boilerplate,
but provides an abstraction between the node implementation and serialized interface that can
be important if you ever make breaking changes to a node schema (by adding or removing properties).
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Parameters

###### serializedNode

[`SerializedQuoteNode`](#serializedquotenode)

###### Returns

[`QuoteNode`](#quotenode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`importJSON`](lexical.md#importjson-2)

## Type Aliases

### HeadingTagType {#headingtagtype}

> **HeadingTagType** = `"h1"` \| `"h2"` \| `"h3"` \| `"h4"` \| `"h5"` \| `"h6"`

Defined in: [packages/lexical-rich-text/src/index.ts:218](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L218)

***

### SerializedHeadingNode {#serializedheadingnode}

> **SerializedHeadingNode** = [`Spread`](lexical.md#spread)\<\{ `tag`: `"h1"` \| `"h2"` \| `"h3"` \| `"h4"` \| `"h5"` \| `"h6"`; \}, [`SerializedElementNode`](lexical.md#serializedelementnode)\>

Defined in: [packages/lexical-rich-text/src/index.ts:114](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L114)

***

### SerializedQuoteNode {#serializedquotenode}

> **SerializedQuoteNode** = [`SerializedElementNode`](lexical.md#serializedelementnode)

Defined in: [packages/lexical-rich-text/src/index.ts:125](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L125)

## Variables

### DRAG\_DROP\_PASTE {#drag_drop_paste}

> `const` **DRAG\_DROP\_PASTE**: [`LexicalCommand`](lexical.md#lexicalcommand)\<`File`[]\>

Defined in: [packages/lexical-rich-text/src/index.ts:121](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L121)

***

### RichTextExtension {#richtextextension}

> `const` **RichTextExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<[`ExtensionConfigBase`](lexical.md#extensionconfigbase), `"@lexical/rich-text"`, `unknown`, `unknown`\>

Defined in: [packages/lexical-rich-text/src/index.ts:1132](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L1132)

An extension to register @lexical/rich-text behavior and nodes
([HeadingNode](#headingnode), [QuoteNode](#quotenode))

## Functions

### $createHeadingNode() {#createheadingnode}

> **$createHeadingNode**(`headingTag`): [`HeadingNode`](#headingnode)

Defined in: [packages/lexical-rich-text/src/index.ts:446](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L446)

#### Parameters

##### headingTag

[`HeadingTagType`](#headingtagtype) = `'h1'`

#### Returns

[`HeadingNode`](#headingnode)

***

### $createQuoteNode() {#createquotenode}

> **$createQuoteNode**(): [`QuoteNode`](#quotenode)

Defined in: [packages/lexical-rich-text/src/index.ts:208](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L208)

#### Returns

[`QuoteNode`](#quotenode)

***

### $isHeadingNode() {#isheadingnode}

> **$isHeadingNode**(`node`): `node is HeadingNode`

Defined in: [packages/lexical-rich-text/src/index.ts:452](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L452)

#### Parameters

##### node

`undefined` | `null` | [`LexicalNode`](lexical.md#lexicalnode)

#### Returns

`node is HeadingNode`

***

### $isQuoteNode() {#isquotenode}

> **$isQuoteNode**(`node`): `node is QuoteNode`

Defined in: [packages/lexical-rich-text/src/index.ts:212](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L212)

#### Parameters

##### node

`undefined` | `null` | [`LexicalNode`](lexical.md#lexicalnode)

#### Returns

`node is QuoteNode`

***

### eventFiles() {#eventfiles}

> **eventFiles**(`event`): \[`boolean`, `File`[], `boolean`\]

Defined in: [packages/lexical-rich-text/src/index.ts:502](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L502)

#### Parameters

##### event

`DragEvent` | [`PasteCommandType`](lexical.md#pastecommandtype)

#### Returns

\[`boolean`, `File`[], `boolean`\]

***

### registerRichText() {#registerrichtext}

> **registerRichText**(`editor`): () => `void`

Defined in: [packages/lexical-rich-text/src/index.ts:567](https://github.com/facebook/lexical/tree/main/packages/lexical-rich-text/src/index.ts#L567)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

#### Returns

> (): `void`

##### Returns

`void`
