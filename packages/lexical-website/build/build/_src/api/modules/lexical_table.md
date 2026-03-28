# @lexical/table

## Classes

### TableCellNode {#tablecellnode}

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:59](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L59)

#### Extends

- [`ElementNode`](lexical.md#elementnode)

#### Constructors

##### Constructor

> **new TableCellNode**(`headerState`, `colSpan`, `width?`, `key?`): [`TableCellNode`](#tablecellnode)

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:126](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L126)

###### Parameters

###### headerState

`number` = `TableCellHeaderStates.NO_STATUS`

###### colSpan

`number` = `1`

###### width?

`number`

###### key?

`string`

###### Returns

[`TableCellNode`](#tablecellnode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`constructor`](lexical.md#constructor-1)

#### Methods

##### afterCloneFrom() {#afterclonefrom}

> **afterCloneFrom**(`node`): `void`

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:86](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L86)

Perform any state updates on the clone of prevNode that are not already
handled by the constructor call in the static clone method. If you have
state to update in your clone that is not handled directly by the
constructor, it is advisable to override this method but it is required
to include a call to `super.afterCloneFrom(prevNode)` in your
implementation. This is only intended to be called by
[$cloneWithProperties](lexical.md#clonewithproperties) function or via a super call.

###### Parameters

###### node

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

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:317](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L317)

###### Returns

`false`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`canBeEmpty`](lexical.md#canbeempty)

##### canIndent() {#canindent}

> **canIndent**(): `false`

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:321](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L321)

###### Returns

`false`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`canIndent`](lexical.md#canindent)

##### collapseAtStart() {#collapseatstart}

> **collapseAtStart**(): `true`

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:313](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L313)

###### Returns

`true`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`collapseAtStart`](lexical.md#collapseatstart)

##### createDOM() {#createdom}

> **createDOM**(`config`): `HTMLTableCellElement`

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:141](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L141)

Called during the reconciliation process to determine which nodes
to insert into the DOM for this Lexical Node.

This method must return exactly one HTMLElement. Nested elements are not supported.

Do not attempt to update the Lexical EditorState during this phase of the update lifecycle.

###### Parameters

###### config

[`EditorConfig`](lexical.md#editorconfig)

###### Returns

`HTMLTableCellElement`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`createDOM`](lexical.md#createdom-2)

##### exportDOM() {#exportdom}

> **exportDOM**(`editor`): [`DOMExportOutput`](lexical.md#domexportoutput)

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:169](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L169)

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

> **exportJSON**(): [`SerializedTableCellNode`](#serializedtablecellnode)

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:197](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L197)

Controls how the this node is serialized to JSON. This is important for
copy and paste between Lexical editors sharing the same namespace. It's also important
if you're serializing to JSON for persistent storage somewhere.
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Returns

[`SerializedTableCellNode`](#serializedtablecellnode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`exportJSON`](lexical.md#exportjson-2)

##### getBackgroundColor() {#getbackgroundcolor}

> **getBackgroundColor**(): `null` \| `string`

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:258](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L258)

###### Returns

`null` \| `string`

##### getColSpan() {#getcolspan}

> **getColSpan**(): `number`

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:211](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L211)

###### Returns

`number`

##### getHeaderStyles() {#getheaderstyles}

> **getHeaderStyles**(): `number`

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:244](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L244)

###### Returns

`number`

##### getRowSpan() {#getrowspan}

> **getRowSpan**(): `number`

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:221](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L221)

###### Returns

`number`

##### getTag() {#gettag}

> **getTag**(): `"td"` \| `"th"`

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:231](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L231)

###### Returns

`"td"` \| `"th"`

##### getVerticalAlign() {#getverticalalign}

> **getVerticalAlign**(): `undefined` \| `string`

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:268](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L268)

###### Returns

`undefined` \| `string`

##### getWidth() {#getwidth}

> **getWidth**(): `undefined` \| `number`

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:254](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L254)

###### Returns

`undefined` \| `number`

##### hasHeader() {#hasheader}

> **hasHeader**(): `boolean`

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:294](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L294)

###### Returns

`boolean`

##### hasHeaderState() {#hasheaderstate}

> **hasHeaderState**(`headerState`): `boolean`

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:290](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L290)

###### Parameters

###### headerState

`number`

###### Returns

`boolean`

##### isShadowRoot() {#isshadowroot}

> **isShadowRoot**(): `boolean`

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:309](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L309)

###### Returns

`boolean`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`isShadowRoot`](lexical.md#isshadowroot)

##### setBackgroundColor() {#setbackgroundcolor}

> **setBackgroundColor**(`newBackgroundColor`): `this`

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:262](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L262)

###### Parameters

###### newBackgroundColor

`null` | `string`

###### Returns

`this`

##### setColSpan() {#setcolspan}

> **setColSpan**(`colSpan`): `this`

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:215](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L215)

###### Parameters

###### colSpan

`number`

###### Returns

`this`

##### setHeaderStyles() {#setheaderstyles}

> **setHeaderStyles**(`headerState`, `mask`): `this`

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:235](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L235)

###### Parameters

###### headerState

`number`

###### mask

`number` = `TableCellHeaderStates.BOTH`

###### Returns

`this`

##### setRowSpan() {#setrowspan}

> **setRowSpan**(`rowSpan`): `this`

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:225](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L225)

###### Parameters

###### rowSpan

`number`

###### Returns

`this`

##### setVerticalAlign() {#setverticalalign}

> **setVerticalAlign**(`newVerticalAlign`): `this`

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:272](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L272)

###### Parameters

###### newVerticalAlign

`undefined` | `null` | `string`

###### Returns

`this`

##### setWidth() {#setwidth}

> **setWidth**(`width`): `this`

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:248](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L248)

###### Parameters

###### width

`undefined` | `number`

###### Returns

`this`

##### toggleHeaderStyle() {#toggleheaderstyle}

> **toggleHeaderStyle**(`headerStateToToggle`): `this`

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:278](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L278)

###### Parameters

###### headerStateToToggle

`number`

###### Returns

`this`

##### updateDOM() {#updatedom}

> **updateDOM**(`prevNode`): `boolean`

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:298](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L298)

Called when a node changes and should update the DOM
in whatever way is necessary to make it align with any changes that might
have happened during the update.

Returning "true" here will cause lexical to unmount and recreate the DOM node
(by calling createDOM). You would need to do this if the element tag changes,
for instance.

###### Parameters

###### prevNode

`this`

###### Returns

`boolean`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`updateDOM`](lexical.md#updatedom-2)

##### updateFromJSON() {#updatefromjson}

> **updateFromJSON**(`serializedNode`): `this`

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:113](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L113)

Update this LexicalNode instance from serialized JSON. It's recommended
to implement as much logic as possible in this method instead of the
static importJSON method, so that the functionality can be inherited in subclasses.

The LexicalUpdateJSON utility type should be used to ignore any type, version,
or children properties in the JSON so that the extended JSON from subclasses
are acceptable parameters for the super call.

If overridden, this method must call super.

###### Parameters

###### serializedNode

[`LexicalUpdateJSON`](lexical.md#lexicalupdatejson)\<[`SerializedTableCellNode`](#serializedtablecellnode)\>

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

> `static` **clone**(`node`): [`TableCellNode`](#tablecellnode)

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:77](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L77)

Clones this node, creating a new node with a different key
and adding it to the EditorState (but not attaching it anywhere!). All nodes must
implement this method.

###### Parameters

###### node

[`TableCellNode`](#tablecellnode)

###### Returns

[`TableCellNode`](#tablecellnode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`clone`](lexical.md#clone-2)

##### getType() {#gettype}

> `static` **getType**(): `string`

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:73](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L73)

Returns the string type of this node. Every node must
implement this and it MUST BE UNIQUE amongst nodes registered
on the editor.

###### Returns

`string`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`getType`](lexical.md#gettype-6)

##### importDOM() {#importdom}

> `static` **importDOM**(): `null` \| [`DOMConversionMap`](lexical.md#domconversionmap)

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:96](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L96)

###### Returns

`null` \| [`DOMConversionMap`](lexical.md#domconversionmap)

###### Overrides

`ElementNode.importDOM`

##### importJSON() {#importjson}

> `static` **importJSON**(`serializedNode`): [`TableCellNode`](#tablecellnode)

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:109](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L109)

Controls how the this node is deserialized from JSON. This is usually boilerplate,
but provides an abstraction between the node implementation and serialized interface that can
be important if you ever make breaking changes to a node schema (by adding or removing properties).
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Parameters

###### serializedNode

[`SerializedTableCellNode`](#serializedtablecellnode)

###### Returns

[`TableCellNode`](#tablecellnode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`importJSON`](lexical.md#importjson-2)

***

### TableNode {#tablenode}

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:173](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L173)

#### Extends

- [`ElementNode`](lexical.md#elementnode)

#### Constructors

##### Constructor

> **new TableNode**(`key?`): [`TableNode`](#tablenode)

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:231](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L231)

###### Parameters

###### key?

`string`

###### Returns

[`TableNode`](#tablenode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`constructor`](lexical.md#constructor-1)

#### Properties

##### \_\_colWidths? {#__colwidths}

> `optional` **\_\_colWidths**: readonly `number`[]

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:178](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L178)

##### \_\_frozenColumnCount {#__frozencolumncount}

> **\_\_frozenColumnCount**: `number`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:176](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L176)

##### \_\_frozenRowCount {#__frozenrowcount}

> **\_\_frozenRowCount**: `number`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:177](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L177)

#### Methods

##### afterCloneFrom() {#afterclonefrom-2}

> **afterCloneFrom**(`prevNode`): `void`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:201](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L201)

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

> **canBeEmpty**(): `false`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:450](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L450)

###### Returns

`false`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`canBeEmpty`](lexical.md#canbeempty)

##### canIndent() {#canindent-2}

> **canIndent**(): `false`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:593](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L593)

###### Returns

`false`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`canIndent`](lexical.md#canindent)

##### canSelectBefore() {#canselectbefore}

> **canSelectBefore**(): `true`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:589](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L589)

###### Returns

`true`

##### createDOM() {#createdom-2}

> **createDOM**(`config`, `editor?`): `HTMLElement`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:273](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L273)

Called during the reconciliation process to determine which nodes
to insert into the DOM for this Lexical Node.

This method must return exactly one HTMLElement. Nested elements are not supported.

Do not attempt to update the Lexical EditorState during this phase of the update lifecycle.

###### Parameters

###### config

[`EditorConfig`](lexical.md#editorconfig)

###### editor?

[`LexicalEditor`](lexical.md#lexicaleditor)

###### Returns

`HTMLElement`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`createDOM`](lexical.md#createdom-2)

##### exportDOM() {#exportdom-2}

> **exportDOM**(`editor`): [`DOMExportOutput`](lexical.md#domexportoutput)

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:368](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L368)

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

> **exportJSON**(): [`SerializedTableNode`](#serializedtablenode)

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:239](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L239)

Controls how the this node is serialized to JSON. This is important for
copy and paste between Lexical editors sharing the same namespace. It's also important
if you're serializing to JSON for persistent storage somewhere.
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Returns

[`SerializedTableNode`](#serializedtablenode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`exportJSON`](lexical.md#exportjson-2)

##### extractWithChild() {#extractwithchild}

> **extractWithChild**(`child`, `selection`, `destination`): `boolean`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:251](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L251)

###### Parameters

###### child

[`LexicalNode`](lexical.md#lexicalnode)

###### selection

`null` | [`BaseSelection`](lexical.md#baseselection)

###### destination

`"clone"` | `"html"`

###### Returns

`boolean`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`extractWithChild`](lexical.md#extractwithchild)

##### getCellNodeFromCords() {#getcellnodefromcords}

> **getCellNodeFromCords**(`x`, `y`, `table`): `null` \| [`TableCellNode`](#tablecellnode)

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:525](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L525)

###### Parameters

###### x

`number`

###### y

`number`

###### table

`TableDOMTable`

###### Returns

`null` \| [`TableCellNode`](#tablecellnode)

##### getCellNodeFromCordsOrThrow() {#getcellnodefromcordsorthrow}

> **getCellNodeFromCordsOrThrow**(`x`, `y`, `table`): [`TableCellNode`](#tablecellnode)

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:545](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L545)

###### Parameters

###### x

`number`

###### y

`number`

###### table

`TableDOMTable`

###### Returns

[`TableCellNode`](#tablecellnode)

##### getColumnCount() {#getcolumncount}

> **getColumnCount**(): `number`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:597](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L597)

###### Returns

`number`

##### getColWidths() {#getcolwidths}

> **getColWidths**(): `undefined` \| readonly `number`[]

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:184](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L184)

###### Returns

`undefined` \| readonly `number`[]

##### getCordsFromCellNode() {#getcordsfromcellnode}

> **getCordsFromCellNode**(`tableCellNode`, `table`): `object`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:458](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L458)

###### Parameters

###### tableCellNode

[`TableCellNode`](#tablecellnode)

###### table

`TableDOMTable`

###### Returns

`object`

###### x

> **x**: `number`

###### y

> **y**: `number`

##### getDOMCellFromCords() {#getdomcellfromcords}

> **getDOMCellFromCords**(`x`, `y`, `table`): `null` \| [`TableDOMCell`](#tabledomcell)

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:487](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L487)

###### Parameters

###### x

`number`

###### y

`number`

###### table

`TableDOMTable`

###### Returns

`null` \| [`TableDOMCell`](#tabledomcell)

##### getDOMCellFromCordsOrThrow() {#getdomcellfromcordsorthrow}

> **getDOMCellFromCordsOrThrow**(`x`, `y`, `table`): [`TableDOMCell`](#tabledomcell)

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:511](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L511)

###### Parameters

###### x

`number`

###### y

`number`

###### table

`TableDOMTable`

###### Returns

[`TableDOMCell`](#tabledomcell)

##### getFrozenColumns() {#getfrozencolumns}

> **getFrozenColumns**(): `number`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:575](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L575)

###### Returns

`number`

##### getFrozenRows() {#getfrozenrows}

> **getFrozenRows**(): `number`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:585](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L585)

###### Returns

`number`

##### getRowStriping() {#getrowstriping}

> **getRowStriping**(): `boolean`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:559](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L559)

###### Returns

`boolean`

##### isShadowRoot() {#isshadowroot-2}

> **isShadowRoot**(): `boolean`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:454](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L454)

###### Returns

`boolean`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`isShadowRoot`](lexical.md#isshadowroot)

##### scaleDOMColWidths() {#scaledomcolwidths}

> **scaleDOMColWidths**(`dom`, `scale`): `void`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:354](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L354)

###### Parameters

###### dom

`HTMLElement`

###### scale

`number`

###### Returns

`void`

##### setColWidths() {#setcolwidths}

> **setColWidths**(`colWidths`): `this`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:189](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L189)

###### Parameters

###### colWidths

`undefined` | readonly `number`[]

###### Returns

`this`

##### setFrozenColumns() {#setfrozencolumns}

> **setFrozenColumns**(`columnCount`): `this`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:569](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L569)

###### Parameters

###### columnCount

`number`

###### Returns

`this`

##### setFrozenRows() {#setfrozenrows}

> **setFrozenRows**(`rowCount`): `this`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:579](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L579)

###### Parameters

###### rowCount

`number`

###### Returns

`this`

##### setRowStriping() {#setrowstriping}

> **setRowStriping**(`newRowStriping`): `this`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:563](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L563)

###### Parameters

###### newRowStriping

`boolean`

###### Returns

`this`

##### updateDOM() {#updatedom-2}

> **updateDOM**(`prevNode`, `dom`, `config`): `boolean`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:341](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L341)

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

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:222](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L222)

Update this LexicalNode instance from serialized JSON. It's recommended
to implement as much logic as possible in this method instead of the
static importJSON method, so that the functionality can be inherited in subclasses.

The LexicalUpdateJSON utility type should be used to ignore any type, version,
or children properties in the JSON so that the extended JSON from subclasses
are acceptable parameters for the super call.

If overridden, this method must call super.

###### Parameters

###### serializedNode

[`LexicalUpdateJSON`](lexical.md#lexicalupdatejson)\<[`SerializedTableNode`](#serializedtablenode)\>

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

##### updateTableElement() {#updatetableelement}

> **updateTableElement**(`prevNode`, `tableElement`, `config`): `void`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:319](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L319)

###### Parameters

###### prevNode

`null` | [`TableNode`](#tablenode)

###### tableElement

`HTMLTableElement`

###### config

[`EditorConfig`](lexical.md#editorconfig)

###### Returns

`void`

##### updateTableWrapper() {#updatetablewrapper}

> **updateTableWrapper**(`prevNode`, `tableWrapper`, `tableElement`, `config`): `void`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:298](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L298)

###### Parameters

###### prevNode

`null` | [`TableNode`](#tablenode)

###### tableWrapper

`HTMLDivElement`

###### tableElement

`HTMLTableElement`

###### config

[`EditorConfig`](lexical.md#editorconfig)

###### Returns

`void`

##### clone() {#clone-2}

> `static` **clone**(`node`): [`TableNode`](#tablenode)

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:197](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L197)

Clones this node, creating a new node with a different key
and adding it to the EditorState (but not attaching it anywhere!). All nodes must
implement this method.

###### Parameters

###### node

[`TableNode`](#tablenode)

###### Returns

[`TableNode`](#tablenode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`clone`](lexical.md#clone-2)

##### getType() {#gettype-2}

> `static` **getType**(): `string`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:180](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L180)

Returns the string type of this node. Every node must
implement this and it MUST BE UNIQUE amongst nodes registered
on the editor.

###### Returns

`string`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`getType`](lexical.md#gettype-6)

##### importDOM() {#importdom-2}

> `static` **importDOM**(): `null` \| [`DOMConversionMap`](lexical.md#domconversionmap)

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:209](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L209)

###### Returns

`null` \| [`DOMConversionMap`](lexical.md#domconversionmap)

###### Overrides

`ElementNode.importDOM`

##### importJSON() {#importjson-2}

> `static` **importJSON**(`serializedNode`): [`TableNode`](#tablenode)

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:218](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L218)

Controls how the this node is deserialized from JSON. This is usually boilerplate,
but provides an abstraction between the node implementation and serialized interface that can
be important if you ever make breaking changes to a node schema (by adding or removing properties).
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Parameters

###### serializedNode

[`SerializedTableNode`](#serializedtablenode)

###### Returns

[`TableNode`](#tablenode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`importJSON`](lexical.md#importjson-2)

***

### TableObserver {#tableobserver}

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:161](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L161)

#### Constructors

##### Constructor

> **new TableObserver**(`editor`, `tableNodeKey`): [`TableObserver`](#tableobserver)

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:182](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L182)

###### Parameters

###### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

###### tableNodeKey

`string`

###### Returns

[`TableObserver`](#tableobserver)

#### Properties

##### abortController {#abortcontroller}

> **abortController**: `AbortController`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:179](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L179)

##### anchorCell {#anchorcell}

> **anchorCell**: `null` \| [`TableDOMCell`](#tabledomcell)

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:170](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L170)

##### anchorCellNodeKey {#anchorcellnodekey}

> **anchorCellNodeKey**: `null` \| `string`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:172](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L172)

##### anchorX {#anchorx}

> **anchorX**: `number`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:167](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L167)

##### anchorY {#anchory}

> **anchorY**: `number`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:168](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L168)

##### editor {#editor}

> **editor**: [`LexicalEditor`](lexical.md#lexicaleditor)

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:174](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L174)

##### focusCell {#focuscell}

> **focusCell**: `null` \| [`TableDOMCell`](#tabledomcell)

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:171](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L171)

##### focusCellNodeKey {#focuscellnodekey}

> **focusCellNodeKey**: `null` \| `string`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:173](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L173)

##### focusX {#focusx}

> **focusX**: `number`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:162](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L162)

##### focusY {#focusy}

> **focusY**: `number`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:163](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L163)

##### hasHijackedSelectionStyles {#hashijackedselectionstyles}

> **hasHijackedSelectionStyles**: `boolean`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:176](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L176)

##### isHighlightingCells {#ishighlightingcells}

> **isHighlightingCells**: `boolean`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:166](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L166)

##### isSelecting {#isselecting}

> **isSelecting**: `boolean`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:177](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L177)

##### listenerOptions {#listeneroptions}

> **listenerOptions**: `object`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:180](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L180)

###### signal

> **signal**: `AbortSignal`

##### listenersToRemove {#listenerstoremove}

> **listenersToRemove**: `Set`\<() => `void`\>

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:164](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L164)

##### pointerType {#pointertype}

> **pointerType**: `null` \| `string`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:178](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L178)

##### table {#table}

> **table**: `TableDOMTable`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:165](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L165)

##### tableNodeKey {#tablenodekey}

> **tableNodeKey**: `string`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:169](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L169)

##### tableSelection {#tableselection}

> **tableSelection**: `null` \| [`TableSelection`](#tableselection-1)

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:175](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L175)

#### Methods

##### $clearHighlight() {#clearhighlight}

> **$clearHighlight**(`setEmptySelection`): `void`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:274](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L274)

###### Parameters

###### setEmptySelection

`boolean` = `true`

###### Returns

`void`

##### $clearText() {#cleartext}

> **$clearText**(): `void`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:516](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L516)

###### Returns

`void`

##### $disableHighlightStyle() {#disablehighlightstyle}

> **$disableHighlightStyle**(): `void`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:311](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L311)

###### Returns

`void`

##### $enableHighlightStyle() {#enablehighlightstyle}

> **$enableHighlightStyle**(): `void`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:299](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L299)

###### Returns

`void`

##### $formatCells() {#formatcells}

> **$formatCells**(`type`): `void`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:488](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L488)

###### Parameters

###### type

[`TextFormatType`](lexical.md#textformattype)

###### Returns

`void`

##### $getAnchorTableCell() {#getanchortablecell}

> **$getAnchorTableCell**(): `null` \| [`TableCellNode`](#tablecellnode)

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:427](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L427)

###### Returns

`null` \| [`TableCellNode`](#tablecellnode)

##### $getAnchorTableCellOrThrow() {#getanchortablecellorthrow}

> **$getAnchorTableCellOrThrow**(): [`TableCellNode`](#tablecellnode)

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:432](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L432)

###### Returns

[`TableCellNode`](#tablecellnode)

##### $getFocusTableCell() {#getfocustablecell}

> **$getFocusTableCell**(): `null` \| [`TableCellNode`](#tablecellnode)

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:441](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L441)

###### Returns

`null` \| [`TableCellNode`](#tablecellnode)

##### $getFocusTableCellOrThrow() {#getfocustablecellorthrow}

> **$getFocusTableCellOrThrow**(): [`TableCellNode`](#tablecellnode)

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:445](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L445)

###### Returns

[`TableCellNode`](#tablecellnode)

##### $lookup() {#lookup}

> **$lookup**(): `object`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:221](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L221)

###### Returns

`object`

###### tableElement

> **tableElement**: [`HTMLTableElementWithWithTableSelectionState`](#htmltableelementwithwithtableselectionstate)

###### tableNode

> **tableNode**: [`TableNode`](#tablenode)

##### $setAnchorCellForSelection() {#setanchorcellforselection}

> **$setAnchorCellForSelection**(`cell`): `void`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:451](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L451)

###### Parameters

###### cell

[`TableDOMCell`](#tabledomcell)

###### Returns

`void`

##### $setFocusCellForSelection() {#setfocuscellforselection}

> **$setFocusCellForSelection**(`cell`, `ignoreStart`): `boolean`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:354](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L354)

###### Parameters

###### cell

[`TableDOMCell`](#tabledomcell)

###### ignoreStart

`boolean` = `false`

###### Returns

`boolean`

##### $updateTableTableSelection() {#updatetabletableselection}

> **$updateTableTableSelection**(`selection`): `void`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:320](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L320)

###### Parameters

###### selection

`null` | [`TableSelection`](#tableselection-1)

###### Returns

`void`

##### getTable() {#gettable}

> **getTable**(): `TableDOMTable`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:209](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L209)

###### Returns

`TableDOMTable`

##### removeListeners() {#removelisteners}

> **removeListeners**(): `void`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:213](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L213)

###### Returns

`void`

##### trackTable() {#tracktable}

> **trackTable**(): `void`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:228](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L228)

###### Returns

`void`

***

### TableRowNode {#tablerownode}

Defined in: [packages/lexical-table/src/LexicalTableRowNode.ts:34](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableRowNode.ts#L34)

#### Extends

- [`ElementNode`](lexical.md#elementnode)

#### Constructors

##### Constructor

> **new TableRowNode**(`height?`, `key?`): [`TableRowNode`](#tablerownode)

Defined in: [packages/lexical-table/src/LexicalTableRowNode.ts:72](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableRowNode.ts#L72)

###### Parameters

###### height?

`number`

###### key?

`string`

###### Returns

[`TableRowNode`](#tablerownode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`constructor`](lexical.md#constructor-1)

#### Methods

##### afterCloneFrom() {#afterclonefrom-4}

> **afterCloneFrom**(`prevNode`): `void`

Defined in: [packages/lexical-table/src/LexicalTableRowNode.ts:46](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableRowNode.ts#L46)

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

##### canBeEmpty() {#canbeempty-4}

> **canBeEmpty**(): `false`

Defined in: [packages/lexical-table/src/LexicalTableRowNode.ts:123](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableRowNode.ts#L123)

###### Returns

`false`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`canBeEmpty`](lexical.md#canbeempty)

##### canIndent() {#canindent-4}

> **canIndent**(): `false`

Defined in: [packages/lexical-table/src/LexicalTableRowNode.ts:127](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableRowNode.ts#L127)

###### Returns

`false`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`canIndent`](lexical.md#canindent)

##### createDOM() {#createdom-4}

> **createDOM**(`config`): `HTMLElement`

Defined in: [packages/lexical-table/src/LexicalTableRowNode.ts:85](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableRowNode.ts#L85)

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

##### exportJSON() {#exportjson-4}

> **exportJSON**(): [`SerializedTableRowNode`](#serializedtablerownode)

Defined in: [packages/lexical-table/src/LexicalTableRowNode.ts:77](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableRowNode.ts#L77)

Controls how the this node is serialized to JSON. This is important for
copy and paste between Lexical editors sharing the same namespace. It's also important
if you're serializing to JSON for persistent storage somewhere.
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Returns

[`SerializedTableRowNode`](#serializedtablerownode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`exportJSON`](lexical.md#exportjson-2)

##### extractWithChild() {#extractwithchild-2}

> **extractWithChild**(`child`, `selection`, `destination`): `boolean`

Defined in: [packages/lexical-table/src/LexicalTableRowNode.ts:97](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableRowNode.ts#L97)

###### Parameters

###### child

[`LexicalNode`](lexical.md#lexicalnode)

###### selection

`null` | [`BaseSelection`](lexical.md#baseselection)

###### destination

`"clone"` | `"html"`

###### Returns

`boolean`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`extractWithChild`](lexical.md#extractwithchild)

##### getHeight() {#getheight}

> **getHeight**(): `undefined` \| `number`

Defined in: [packages/lexical-table/src/LexicalTableRowNode.ts:115](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableRowNode.ts#L115)

###### Returns

`undefined` \| `number`

##### isShadowRoot() {#isshadowroot-4}

> **isShadowRoot**(): `boolean`

Defined in: [packages/lexical-table/src/LexicalTableRowNode.ts:105](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableRowNode.ts#L105)

###### Returns

`boolean`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`isShadowRoot`](lexical.md#isshadowroot)

##### setHeight() {#setheight}

> **setHeight**(`height?`): `this`

Defined in: [packages/lexical-table/src/LexicalTableRowNode.ts:109](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableRowNode.ts#L109)

###### Parameters

###### height?

`number`

###### Returns

`this`

##### updateDOM() {#updatedom-4}

> **updateDOM**(`prevNode`): `boolean`

Defined in: [packages/lexical-table/src/LexicalTableRowNode.ts:119](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableRowNode.ts#L119)

Called when a node changes and should update the DOM
in whatever way is necessary to make it align with any changes that might
have happened during the update.

Returning "true" here will cause lexical to unmount and recreate the DOM node
(by calling createDOM). You would need to do this if the element tag changes,
for instance.

###### Parameters

###### prevNode

`this`

###### Returns

`boolean`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`updateDOM`](lexical.md#updatedom-2)

##### updateFromJSON() {#updatefromjson-4}

> **updateFromJSON**(`serializedNode`): `this`

Defined in: [packages/lexical-table/src/LexicalTableRowNode.ts:64](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableRowNode.ts#L64)

Update this LexicalNode instance from serialized JSON. It's recommended
to implement as much logic as possible in this method instead of the
static importJSON method, so that the functionality can be inherited in subclasses.

The LexicalUpdateJSON utility type should be used to ignore any type, version,
or children properties in the JSON so that the extended JSON from subclasses
are acceptable parameters for the super call.

If overridden, this method must call super.

###### Parameters

###### serializedNode

[`LexicalUpdateJSON`](lexical.md#lexicalupdatejson)\<[`SerializedTableRowNode`](#serializedtablerownode)\>

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

##### clone() {#clone-4}

> `static` **clone**(`node`): [`TableRowNode`](#tablerownode)

Defined in: [packages/lexical-table/src/LexicalTableRowNode.ts:42](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableRowNode.ts#L42)

Clones this node, creating a new node with a different key
and adding it to the EditorState (but not attaching it anywhere!). All nodes must
implement this method.

###### Parameters

###### node

[`TableRowNode`](#tablerownode)

###### Returns

[`TableRowNode`](#tablerownode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`clone`](lexical.md#clone-2)

##### getType() {#gettype-4}

> `static` **getType**(): `string`

Defined in: [packages/lexical-table/src/LexicalTableRowNode.ts:38](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableRowNode.ts#L38)

Returns the string type of this node. Every node must
implement this and it MUST BE UNIQUE amongst nodes registered
on the editor.

###### Returns

`string`

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`getType`](lexical.md#gettype-6)

##### importDOM() {#importdom-4}

> `static` **importDOM**(): `null` \| [`DOMConversionMap`](lexical.md#domconversionmap)

Defined in: [packages/lexical-table/src/LexicalTableRowNode.ts:51](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableRowNode.ts#L51)

###### Returns

`null` \| [`DOMConversionMap`](lexical.md#domconversionmap)

###### Overrides

`ElementNode.importDOM`

##### importJSON() {#importjson-4}

> `static` **importJSON**(`serializedNode`): [`TableRowNode`](#tablerownode)

Defined in: [packages/lexical-table/src/LexicalTableRowNode.ts:60](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableRowNode.ts#L60)

Controls how the this node is deserialized from JSON. This is usually boilerplate,
but provides an abstraction between the node implementation and serialized interface that can
be important if you ever make breaking changes to a node schema (by adding or removing properties).
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Parameters

###### serializedNode

[`SerializedTableRowNode`](#serializedtablerownode)

###### Returns

[`TableRowNode`](#tablerownode)

###### Overrides

[`ElementNode`](lexical.md#elementnode).[`importJSON`](lexical.md#importjson-2)

## Interfaces

### TableConfig {#tableconfig}

Defined in: [packages/lexical-table/src/LexicalTableExtension.ts:26](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableExtension.ts#L26)

#### Properties

##### hasCellBackgroundColor {#hascellbackgroundcolor}

> **hasCellBackgroundColor**: `boolean`

Defined in: [packages/lexical-table/src/LexicalTableExtension.ts:35](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableExtension.ts#L35)

When `false` (default `true`), the background color of TableCellNode will always be removed.

##### hasCellMerge {#hascellmerge}

> **hasCellMerge**: `boolean`

Defined in: [packages/lexical-table/src/LexicalTableExtension.ts:31](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableExtension.ts#L31)

When `false` (default `true`), merged cell support (colspan and rowspan) will be disabled and all
tables will be forced into a regular grid with 1x1 table cells.

##### hasHorizontalScroll {#hashorizontalscroll}

> **hasHorizontalScroll**: `boolean`

Defined in: [packages/lexical-table/src/LexicalTableExtension.ts:43](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableExtension.ts#L43)

When `true` (default `true`), tables will be wrapped in a `<div>` to enable horizontal scrolling

##### hasNestedTables {#hasnestedtables}

> **hasNestedTables**: `boolean`

Defined in: [packages/lexical-table/src/LexicalTableExtension.ts:49](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableExtension.ts#L49)

**`Experimental`**

When `true` (default `false`), nested tables will be allowed.

 Nested tables are not officially supported.

##### hasTabHandler {#hastabhandler}

> **hasTabHandler**: `boolean`

Defined in: [packages/lexical-table/src/LexicalTableExtension.ts:39](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableExtension.ts#L39)

When `true` (default `true`), the tab key can be used to navigate table cells.

***

### TableSelection {#tableselection-1}

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:109](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L109)

#### Implements

- [`BaseSelection`](lexical.md#baseselection)

#### Properties

##### \_cachedNodes {#_cachednodes}

> **\_cachedNodes**: `null` \| [`LexicalNode`](lexical.md#lexicalnode)[]

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:113](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L113)

###### Implementation of

`BaseSelection._cachedNodes`

##### anchor {#anchor}

> **anchor**: [`PointType`](lexical.md#pointtype-1)

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:111](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L111)

##### dirty {#dirty}

> **dirty**: `boolean`

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:114](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L114)

###### Implementation of

`BaseSelection.dirty`

##### focus {#focus}

> **focus**: [`PointType`](lexical.md#pointtype-1)

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:112](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L112)

##### tableKey {#tablekey}

> **tableKey**: `string`

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:110](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L110)

#### Methods

##### clone() {#clone-6}

> **clone**(): [`TableSelection`](#tableselection-1)

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:195](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L195)

###### Returns

[`TableSelection`](#tableselection-1)

###### Implementation of

`BaseSelection.clone`

##### extract() {#extract}

> **extract**(): [`LexicalNode`](lexical.md#lexicalnode)[]

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:207](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L207)

###### Returns

[`LexicalNode`](lexical.md#lexicalnode)[]

###### Implementation of

`BaseSelection.extract`

##### getCachedNodes() {#getcachednodes}

> **getCachedNodes**(): `null` \| [`LexicalNode`](lexical.md#lexicalnode)[]

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:165](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L165)

###### Returns

`null` \| [`LexicalNode`](lexical.md#lexicalnode)[]

###### Implementation of

`BaseSelection.getCachedNodes`

##### getNodes() {#getnodes}

> **getNodes**(): [`LexicalNode`](lexical.md#lexicalnode)[]

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:293](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L293)

###### Returns

[`LexicalNode`](lexical.md#lexicalnode)[]

###### Implementation of

`BaseSelection.getNodes`

##### getShape() {#getshape}

> **getShape**(): [`TableSelectionShape`](#tableselectionshape)

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:254](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L254)

###### Returns

[`TableSelectionShape`](#tableselectionshape)

##### getStartEndPoints() {#getstartendpoints}

> **getStartEndPoints**(): \[[`PointType`](lexical.md#pointtype-1), [`PointType`](lexical.md#pointtype-1)\]

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:126](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L126)

###### Returns

\[[`PointType`](lexical.md#pointtype-1), [`PointType`](lexical.md#pointtype-1)\]

###### Implementation of

`BaseSelection.getStartEndPoints`

##### getTextContent() {#gettextcontent}

> **getTextContent**(): `string`

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:368](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L368)

###### Returns

`string`

###### Implementation of

`BaseSelection.getTextContent`

##### hasFormat() {#hasformat}

> **hasFormat**(`type`): `boolean`

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:226](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L226)

Returns whether the provided TextFormatType is present on the Selection.
This will be true if any paragraph in table cells has the specified format.

###### Parameters

###### type

[`TextFormatType`](lexical.md#textformattype)

the TextFormatType to check for.

###### Returns

`boolean`

true if the provided format is currently toggled on on the Selection, false otherwise.

##### insertNodes() {#insertnodes}

> **insertNodes**(`nodes`): `void`

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:241](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L241)

###### Parameters

###### nodes

[`LexicalNode`](lexical.md#lexicalnode)[]

###### Returns

`void`

###### Implementation of

`BaseSelection.insertNodes`

##### insertRawText() {#insertrawtext}

> **insertRawText**(`text`): `void`

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:211](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L211)

###### Parameters

###### text

`string`

###### Returns

`void`

###### Implementation of

`BaseSelection.insertRawText`

##### insertText() {#inserttext}

> **insertText**(): `void`

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:215](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L215)

###### Returns

`void`

###### Implementation of

`BaseSelection.insertText`

##### is() {#is}

> **is**(`selection`): `boolean`

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:173](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L173)

###### Parameters

###### selection

`null` | [`BaseSelection`](lexical.md#baseselection)

###### Returns

`boolean`

###### Implementation of

`BaseSelection.is`

##### isBackward() {#isbackward}

> **isBackward**(): `boolean`

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:161](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L161)

Returns whether the Selection is "backwards", meaning the focus
logically precedes the anchor in the EditorState.

###### Returns

`boolean`

true if the Selection is backwards, false otherwise.

###### Implementation of

`BaseSelection.isBackward`

##### isCollapsed() {#iscollapsed}

> **isCollapsed**(): `boolean`

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:203](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L203)

###### Returns

`boolean`

###### Implementation of

`BaseSelection.isCollapsed`

##### isValid() {#isvalid}

> **isValid**(): `boolean`

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:137](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L137)

[$createTableSelection](#createtableselection) unfortunately makes it very easy to create
nonsense selections, so we have a method to see if the selection probably
makes sense.

###### Returns

`boolean`

true if the TableSelection is (probably) valid

##### set() {#set}

> **set**(`tableKey`, `anchorCellKey`, `focusCellKey`): `void`

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:182](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L182)

###### Parameters

###### tableKey

`string`

###### anchorCellKey

`string`

###### focusCellKey

`string`

###### Returns

`void`

##### setCachedNodes() {#setcachednodes}

> **setCachedNodes**(`nodes`): `void`

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:169](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L169)

###### Parameters

###### nodes

`null` | [`LexicalNode`](lexical.md#lexicalnode)[]

###### Returns

`void`

###### Implementation of

`BaseSelection.setCachedNodes`

## Type Aliases

### HTMLTableElementWithWithTableSelectionState {#htmltableelementwithwithtableselectionstate}

> **HTMLTableElementWithWithTableSelectionState** = `HTMLTableElement` & `object`

Defined in: [packages/lexical-table/src/LexicalTableSelectionHelpers.ts:1134](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelectionHelpers.ts#L1134)

#### Type Declaration

##### \_\_lexicalTableSelection?

> `optional` **\_\_lexicalTableSelection**: [`TableObserver`](#tableobserver)

***

### InsertTableCommandPayload {#inserttablecommandpayload}

> **InsertTableCommandPayload** = `Readonly`\<\{ `columns`: `string`; `includeHeaders?`: [`InsertTableCommandPayloadHeaders`](#inserttablecommandpayloadheaders); `rows`: `string`; \}\>

Defined in: [packages/lexical-table/src/LexicalTableCommands.ts:20](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCommands.ts#L20)

***

### InsertTableCommandPayloadHeaders {#inserttablecommandpayloadheaders}

> **InsertTableCommandPayloadHeaders** = `Readonly`\<\{ `columns`: `boolean`; `rows`: `boolean`; \}\> \| `boolean`

Defined in: [packages/lexical-table/src/LexicalTableCommands.ts:13](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCommands.ts#L13)

***

### SerializedTableCellNode {#serializedtablecellnode}

> **SerializedTableCellNode** = [`Spread`](lexical.md#spread)\<\{ `backgroundColor?`: `null` \| `string`; `colSpan?`: `number`; `headerState`: `TableCellHeaderState`; `rowSpan?`: `number`; `verticalAlign?`: `string`; `width?`: `number`; \}, [`SerializedElementNode`](lexical.md#serializedelementnode)\>

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:46](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L46)

***

### SerializedTableNode {#serializedtablenode}

> **SerializedTableNode** = [`Spread`](lexical.md#spread)\<\{ `colWidths?`: readonly `number`[]; `frozenColumnCount?`: `number`; `frozenRowCount?`: `number`; `rowStriping?`: `boolean`; \}, [`SerializedElementNode`](lexical.md#serializedelementnode)\>

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:52](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L52)

***

### SerializedTableRowNode {#serializedtablerownode}

> **SerializedTableRowNode** = [`Spread`](lexical.md#spread)\<\{ `height?`: `number`; \}, [`SerializedElementNode`](lexical.md#serializedelementnode)\>

Defined in: [packages/lexical-table/src/LexicalTableRowNode.ts:26](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableRowNode.ts#L26)

***

### TableDOMCell {#tabledomcell}

> **TableDOMCell** = `object`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:49](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L49)

#### Properties

##### elem {#elem}

> **elem**: `HTMLElement`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:50](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L50)

##### hasBackgroundColor {#hasbackgroundcolor}

> **hasBackgroundColor**: `boolean`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:52](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L52)

##### highlighted {#highlighted}

> **highlighted**: `boolean`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:51](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L51)

##### x {#x}

> **x**: `number`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:53](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L53)

##### y {#y}

> **y**: `number`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:54](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L54)

***

### TableMapType {#tablemaptype}

> **TableMapType** = [`TableMapValueType`](#tablemapvaluetype)[][]

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:51](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L51)

***

### TableMapValueType {#tablemapvaluetype}

> **TableMapValueType** = `object`

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:46](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L46)

#### Properties

##### cell {#cell}

> **cell**: [`TableCellNode`](#tablecellnode)

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:47](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L47)

##### startColumn {#startcolumn}

> **startColumn**: `number`

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:49](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L49)

##### startRow {#startrow}

> **startRow**: `number`

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:48](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L48)

***

### TableSelectionShape {#tableselectionshape}

> **TableSelectionShape** = `object`

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:39](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L39)

#### Properties

##### fromX {#fromx}

> **fromX**: `number`

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:40](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L40)

##### fromY {#fromy}

> **fromY**: `number`

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:41](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L41)

##### toX {#tox}

> **toX**: `number`

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:42](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L42)

##### toY {#toy}

> **toY**: `number`

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:43](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L43)

## Variables

### ~~$deleteTableColumn\_\_EXPERIMENTAL()~~ {#deletetablecolumn__experimental}

> `const` **$deleteTableColumn\_\_EXPERIMENTAL**: () => `void` = `$deleteTableColumnAtSelection`

Defined in: [packages/lexical-table/src/LexicalTableUtils.ts:797](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableUtils.ts#L797)

#### Returns

`void`

#### Deprecated

renamed to [$deleteTableColumnAtSelection](#deletetablecolumnatselection)

***

### ~~$deleteTableRow\_\_EXPERIMENTAL()~~ {#deletetablerow__experimental}

> `const` **$deleteTableRow\_\_EXPERIMENTAL**: () => `void` = `$deleteTableRowAtSelection`

Defined in: [packages/lexical-table/src/LexicalTableUtils.ts:713](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableUtils.ts#L713)

#### Returns

`void`

#### Deprecated

renamed to [$deleteTableRowAtSelection](#deletetablerowatselection)

***

### ~~$insertTableColumn\_\_EXPERIMENTAL()~~ {#inserttablecolumn__experimental}

> `const` **$insertTableColumn\_\_EXPERIMENTAL**: (`insertAfter`) => `null` \| [`TableCellNode`](#tablecellnode) = `$insertTableColumnAtSelection`

Defined in: [packages/lexical-table/src/LexicalTableUtils.ts:478](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableUtils.ts#L478)

Inserts a column before or after the current focus cell node,
taking into account any spans. If successful, returns the
first inserted cell node.

#### Parameters

##### insertAfter

`boolean` = `true`

#### Returns

`null` \| [`TableCellNode`](#tablecellnode)

#### Deprecated

renamed to [$insertTableColumnAtSelection](#inserttablecolumnatselection)

***

### ~~$insertTableRow\_\_EXPERIMENTAL()~~ {#inserttablerow__experimental}

> `const` **$insertTableRow\_\_EXPERIMENTAL**: (`insertAfter`) => `null` \| [`TableRowNode`](#tablerownode) = `$insertTableRowAtSelection`

Defined in: [packages/lexical-table/src/LexicalTableUtils.ts:295](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableUtils.ts#L295)

Inserts a table row before or after the current focus cell node,
taking into account any spans. If successful, returns the
inserted table row node.

#### Parameters

##### insertAfter

`boolean` = `true`

#### Returns

`null` \| [`TableRowNode`](#tablerownode)

#### Deprecated

renamed to [$insertTableRowAtSelection](#inserttablerowatselection)

***

### INSERT\_TABLE\_COMMAND {#insert_table_command}

> `const` **INSERT\_TABLE\_COMMAND**: [`LexicalCommand`](lexical.md#lexicalcommand)\<[`InsertTableCommandPayload`](#inserttablecommandpayload)\>

Defined in: [packages/lexical-table/src/LexicalTableCommands.ts:26](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCommands.ts#L26)

***

### TableCellHeaderStates {#tablecellheaderstates}

> `const` **TableCellHeaderStates**: `object`

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:36](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L36)

#### Type Declaration

##### BOTH {#both}

> **BOTH**: `number` = `3`

##### COLUMN {#column}

> **COLUMN**: `number` = `2`

##### NO\_STATUS {#no_status}

> **NO\_STATUS**: `number` = `0`

##### ROW {#row}

> **ROW**: `number` = `1`

***

### TableExtension {#tableextension}

> `const` **TableExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<[`TableConfig`](#tableconfig), `"@lexical/table/Table"`, [`NamedSignalsOutput`](lexical_extension.md#namedsignalsoutput)\<[`TableConfig`](#tableconfig)\>, `unknown`\>

Defined in: [packages/lexical-table/src/LexicalTableExtension.ts:56](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableExtension.ts#L56)

Configures [TableNode](#tablenode), [TableRowNode](#tablerownode), [TableCellNode](#tablecellnode) and
registers table behaviors (see [TableConfig](#tableconfig))

## Functions

### $computeTableMap() {#computetablemap}

> **$computeTableMap**(`tableNode`, `cellA`, `cellB`): \[[`TableMapType`](#tablemaptype), [`TableMapValueType`](#tablemapvaluetype), [`TableMapValueType`](#tablemapvaluetype)\]

Defined in: [packages/lexical-table/src/LexicalTableUtils.ts:1025](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableUtils.ts#L1025)

#### Parameters

##### tableNode

[`TableNode`](#tablenode)

##### cellA

[`TableCellNode`](#tablecellnode)

##### cellB

[`TableCellNode`](#tablecellnode)

#### Returns

\[[`TableMapType`](#tablemaptype), [`TableMapValueType`](#tablemapvaluetype), [`TableMapValueType`](#tablemapvaluetype)\]

***

### $computeTableMapSkipCellCheck() {#computetablemapskipcellcheck}

> **$computeTableMapSkipCellCheck**(`tableNode`, `cellA`, `cellB`): \[[`TableMapType`](#tablemaptype), `null` \| [`TableMapValueType`](#tablemapvaluetype), `null` \| [`TableMapValueType`](#tablemapvaluetype)\]

Defined in: [packages/lexical-table/src/LexicalTableUtils.ts:1040](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableUtils.ts#L1040)

#### Parameters

##### tableNode

[`TableNode`](#tablenode)

##### cellA

`null` | [`TableCellNode`](#tablecellnode)

##### cellB

`null` | [`TableCellNode`](#tablecellnode)

#### Returns

\[[`TableMapType`](#tablemaptype), `null` \| [`TableMapValueType`](#tablemapvaluetype), `null` \| [`TableMapValueType`](#tablemapvaluetype)\]

***

### $createTableCellNode() {#createtablecellnode}

> **$createTableCellNode**(`headerState`, `colSpan`, `width?`): [`TableCellNode`](#tablecellnode)

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:460](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L460)

#### Parameters

##### headerState

`number` = `TableCellHeaderStates.NO_STATUS`

##### colSpan

`number` = `1`

##### width?

`number`

#### Returns

[`TableCellNode`](#tablecellnode)

***

### $createTableNode() {#createtablenode}

> **$createTableNode**(): [`TableNode`](#tablenode)

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:664](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L664)

#### Returns

[`TableNode`](#tablenode)

***

### $createTableNodeWithDimensions() {#createtablenodewithdimensions}

> **$createTableNodeWithDimensions**(`rowCount`, `columnCount`, `includeHeaders`): [`TableNode`](#tablenode)

Defined in: [packages/lexical-table/src/LexicalTableUtils.ts:40](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableUtils.ts#L40)

#### Parameters

##### rowCount

`number`

##### columnCount

`number`

##### includeHeaders

[`InsertTableCommandPayloadHeaders`](#inserttablecommandpayloadheaders) = `true`

#### Returns

[`TableNode`](#tablenode)

***

### $createTableRowNode() {#createtablerownode}

> **$createTableRowNode**(`height?`): [`TableRowNode`](#tablerownode)

Defined in: [packages/lexical-table/src/LexicalTableRowNode.ts:146](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableRowNode.ts#L146)

#### Parameters

##### height?

`number`

#### Returns

[`TableRowNode`](#tablerownode)

***

### $createTableSelection() {#createtableselection}

> **$createTableSelection**(): [`TableSelection`](#tableselection-1)

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:385](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L385)

#### Returns

[`TableSelection`](#tableselection-1)

***

### $createTableSelectionFrom() {#createtableselectionfrom}

> **$createTableSelectionFrom**(`tableNode`, `anchorCell`, `focusCell`): [`TableSelection`](#tableselection-1)

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:396](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L396)

#### Parameters

##### tableNode

[`TableNode`](#tablenode)

##### anchorCell

[`TableCellNode`](#tablecellnode)

##### focusCell

[`TableCellNode`](#tablecellnode)

#### Returns

[`TableSelection`](#tableselection-1)

***

### ~~$deleteTableColumn()~~ {#deletetablecolumn}

> **$deleteTableColumn**(`tableNode`, `targetIndex`): [`TableNode`](#tablenode)

Defined in: [packages/lexical-table/src/LexicalTableUtils.ts:585](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableUtils.ts#L585)

#### Parameters

##### tableNode

[`TableNode`](#tablenode)

##### targetIndex

`number`

#### Returns

[`TableNode`](#tablenode)

#### Deprecated

This function does not support merged cells. Use [$deleteTableColumnAtSelection](#deletetablecolumnatselection) instead.

***

### $deleteTableColumnAtSelection() {#deletetablecolumnatselection}

> **$deleteTableColumnAtSelection**(): `void`

Defined in: [packages/lexical-table/src/LexicalTableUtils.ts:715](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableUtils.ts#L715)

#### Returns

`void`

***

### $deleteTableRowAtSelection() {#deletetablerowatselection}

> **$deleteTableRowAtSelection**(): `void`

Defined in: [packages/lexical-table/src/LexicalTableUtils.ts:608](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableUtils.ts#L608)

#### Returns

`void`

***

### $findCellNode() {#findcellnode}

> **$findCellNode**(`node`): `null` \| [`TableCellNode`](#tablecellnode)

Defined in: [packages/lexical-table/src/LexicalTableSelectionHelpers.ts:1748](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelectionHelpers.ts#L1748)

#### Parameters

##### node

[`LexicalNode`](lexical.md#lexicalnode)

#### Returns

`null` \| [`TableCellNode`](#tablecellnode)

***

### $findTableNode() {#findtablenode}

> **$findTableNode**(`node`): `null` \| [`TableNode`](#tablenode)

Defined in: [packages/lexical-table/src/LexicalTableSelectionHelpers.ts:1753](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelectionHelpers.ts#L1753)

#### Parameters

##### node

[`LexicalNode`](lexical.md#lexicalnode)

#### Returns

`null` \| [`TableNode`](#tablenode)

***

### $getElementForTableNode() {#getelementfortablenode}

> **$getElementForTableNode**(`editor`, `tableNode`): `TableDOMTable`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:614](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L614)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### tableNode

[`TableNode`](#tablenode)

#### Returns

`TableDOMTable`

***

### $getNodeTriplet() {#getnodetriplet}

> **$getNodeTriplet**(`source`): \[[`TableCellNode`](#tablecellnode), [`TableRowNode`](#tablerownode), [`TableNode`](#tablenode)\]

Defined in: [packages/lexical-table/src/LexicalTableUtils.ts:1113](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableUtils.ts#L1113)

#### Parameters

##### source

[`LexicalNode`](lexical.md#lexicalnode) | [`PointType`](lexical.md#pointtype-1) | [`TableCellNode`](#tablecellnode)

#### Returns

\[[`TableCellNode`](#tablecellnode), [`TableRowNode`](#tablerownode), [`TableNode`](#tablenode)\]

***

### $getTableAndElementByKey() {#gettableandelementbykey}

> **$getTableAndElementByKey**(`tableNodeKey`, `editor`): `object`

Defined in: [packages/lexical-table/src/LexicalTableObserver.ts:65](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableObserver.ts#L65)

#### Parameters

##### tableNodeKey

`string`

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor) = `...`

#### Returns

`object`

##### tableElement

> **tableElement**: [`HTMLTableElementWithWithTableSelectionState`](#htmltableelementwithwithtableselectionstate)

##### tableNode

> **tableNode**: [`TableNode`](#tablenode)

***

### $getTableCellNodeFromLexicalNode() {#gettablecellnodefromlexicalnode}

> **$getTableCellNodeFromLexicalNode**(`startingNode`): `null` \| [`TableCellNode`](#tablecellnode)

Defined in: [packages/lexical-table/src/LexicalTableUtils.ts:82](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableUtils.ts#L82)

#### Parameters

##### startingNode

[`LexicalNode`](lexical.md#lexicalnode)

#### Returns

`null` \| [`TableCellNode`](#tablecellnode)

***

### $getTableCellNodeRect() {#gettablecellnoderect}

> **$getTableCellNodeRect**(`tableCellNode`): `null` \| \{ `colSpan`: `number`; `columnIndex`: `number`; `rowIndex`: `number`; `rowSpan`: `number`; \}

Defined in: [packages/lexical-table/src/LexicalTableUtils.ts:1332](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableUtils.ts#L1332)

#### Parameters

##### tableCellNode

[`TableCellNode`](#tablecellnode)

#### Returns

`null` \| \{ `colSpan`: `number`; `columnIndex`: `number`; `rowIndex`: `number`; `rowSpan`: `number`; \}

***

### $getTableColumnIndexFromTableCellNode() {#gettablecolumnindexfromtablecellnode}

> **$getTableColumnIndexFromTableCellNode**(`tableCellNode`): `number`

Defined in: [packages/lexical-table/src/LexicalTableUtils.ts:126](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableUtils.ts#L126)

#### Parameters

##### tableCellNode

[`TableCellNode`](#tablecellnode)

#### Returns

`number`

***

### $getTableNodeFromLexicalNodeOrThrow() {#gettablenodefromlexicalnodeorthrow}

> **$getTableNodeFromLexicalNodeOrThrow**(`startingNode`): [`TableNode`](#tablenode)

Defined in: [packages/lexical-table/src/LexicalTableUtils.ts:106](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableUtils.ts#L106)

#### Parameters

##### startingNode

[`LexicalNode`](lexical.md#lexicalnode)

#### Returns

[`TableNode`](#tablenode)

***

### $getTableRowIndexFromTableCellNode() {#gettablerowindexfromtablecellnode}

> **$getTableRowIndexFromTableCellNode**(`tableCellNode`): `number`

Defined in: [packages/lexical-table/src/LexicalTableUtils.ts:118](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableUtils.ts#L118)

#### Parameters

##### tableCellNode

[`TableCellNode`](#tablecellnode)

#### Returns

`number`

***

### $getTableRowNodeFromTableCellNodeOrThrow() {#gettablerownodefromtablecellnodeorthrow}

> **$getTableRowNodeFromTableCellNodeOrThrow**(`startingNode`): [`TableRowNode`](#tablerownode)

Defined in: [packages/lexical-table/src/LexicalTableUtils.ts:94](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableUtils.ts#L94)

#### Parameters

##### startingNode

[`LexicalNode`](lexical.md#lexicalnode)

#### Returns

[`TableRowNode`](#tablerownode)

***

### ~~$insertTableColumn()~~ {#inserttablecolumn}

> **$insertTableColumn**(`tableNode`, `targetIndex`, `shouldInsertAfter`, `columnCount`, `table`): [`TableNode`](#tablenode)

Defined in: [packages/lexical-table/src/LexicalTableUtils.ts:376](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableUtils.ts#L376)

#### Parameters

##### tableNode

[`TableNode`](#tablenode)

##### targetIndex

`number`

##### shouldInsertAfter

`boolean` = `true`

##### columnCount

`number`

##### table

`TableDOMTable`

#### Returns

[`TableNode`](#tablenode)

#### Deprecated

This function does not support merged cells. Use [$insertTableColumnAtSelection](#inserttablecolumnatselection) or $insertTableColumnAtNode instead.

***

### $insertTableColumnAtSelection() {#inserttablecolumnatselection}

> **$insertTableColumnAtSelection**(`insertAfter`): `null` \| [`TableCellNode`](#tablecellnode)

Defined in: [packages/lexical-table/src/LexicalTableUtils.ts:440](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableUtils.ts#L440)

Inserts a column before or after the current focus cell node,
taking into account any spans. If successful, returns the
first inserted cell node.

#### Parameters

##### insertAfter

`boolean` = `true`

#### Returns

`null` \| [`TableCellNode`](#tablecellnode)

***

### ~~$insertTableRow()~~ {#inserttablerow}

> **$insertTableRow**(`tableNode`, `targetIndex`, `shouldInsertAfter`, `rowCount`, `table`): [`TableNode`](#tablenode)

Defined in: [packages/lexical-table/src/LexicalTableUtils.ts:172](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableUtils.ts#L172)

#### Parameters

##### tableNode

[`TableNode`](#tablenode)

##### targetIndex

`number`

##### shouldInsertAfter

`boolean` = `true`

##### rowCount

`number`

##### table

`TableDOMTable`

#### Returns

[`TableNode`](#tablenode)

#### Deprecated

This function does not support merged cells. Use [$insertTableRowAtSelection](#inserttablerowatselection) or $insertTableRowAtNode instead.

***

### $insertTableRowAtSelection() {#inserttablerowatselection}

> **$insertTableRowAtSelection**(`insertAfter`): `null` \| [`TableRowNode`](#tablerownode)

Defined in: [packages/lexical-table/src/LexicalTableUtils.ts:257](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableUtils.ts#L257)

Inserts a table row before or after the current focus cell node,
taking into account any spans. If successful, returns the
inserted table row node.

#### Parameters

##### insertAfter

`boolean` = `true`

#### Returns

`null` \| [`TableRowNode`](#tablerownode)

***

### $isScrollableTablesActive() {#isscrollabletablesactive}

> **$isScrollableTablesActive**(`editor`): `boolean`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:150](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L150)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor) = `...`

#### Returns

`boolean`

***

### $isSimpleTable() {#issimpletable}

> **$isSimpleTable**(`table`): `boolean`

Defined in: [packages/lexical-table/src/LexicalTableUtils.ts:1262](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableUtils.ts#L1262)

Checks if the table does not have any merged cells.

#### Parameters

##### table

[`TableNode`](#tablenode)

Table to check for if it has any merged cells.

#### Returns

`boolean`

True if the table does not have any merged cells, false otherwise.

***

### $isTableCellNode() {#istablecellnode}

> **$isTableCellNode**(`node`): `node is TableCellNode`

Defined in: [packages/lexical-table/src/LexicalTableCellNode.ts:468](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableCellNode.ts#L468)

#### Parameters

##### node

`undefined` | `null` | [`LexicalNode`](lexical.md#lexicalnode)

#### Returns

`node is TableCellNode`

***

### $isTableNode() {#istablenode}

> **$isTableNode**(`node`): `node is TableNode`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:668](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L668)

#### Parameters

##### node

`undefined` | `null` | [`LexicalNode`](lexical.md#lexicalnode)

#### Returns

`node is TableNode`

***

### $isTableRowNode() {#istablerownode}

> **$isTableRowNode**(`node`): `node is TableRowNode`

Defined in: [packages/lexical-table/src/LexicalTableRowNode.ts:150](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableRowNode.ts#L150)

#### Parameters

##### node

`undefined` | `null` | [`LexicalNode`](lexical.md#lexicalnode)

#### Returns

`node is TableRowNode`

***

### $isTableSelection() {#istableselection}

> **$isTableSelection**(`x`): `x is TableSelection`

Defined in: [packages/lexical-table/src/LexicalTableSelection.ts:381](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelection.ts#L381)

#### Parameters

##### x

`unknown`

#### Returns

`x is TableSelection`

***

### $mergeCells() {#mergecells}

> **$mergeCells**(`cellNodes`): `null` \| [`TableCellNode`](#tablecellnode)

Defined in: [packages/lexical-table/src/LexicalTableUtils.ts:817](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableUtils.ts#L817)

#### Parameters

##### cellNodes

[`TableCellNode`](#tablecellnode)[]

#### Returns

`null` \| [`TableCellNode`](#tablecellnode)

***

### $moveTableColumn() {#movetablecolumn}

> **$moveTableColumn**(`tableNode`, `originColumn`, `targetColumn`): `void`

Defined in: [packages/lexical-table/src/LexicalTableUtils.ts:1296](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableUtils.ts#L1296)

Moves a column from one position to another within a simple (non-merged) table.

#### Parameters

##### tableNode

[`TableNode`](#tablenode)

The table node to modify.

##### originColumn

`number`

The index of the column to move.

##### targetColumn

`number`

The index to move the column to.

#### Returns

`void`

***

### $removeTableRowAtIndex() {#removetablerowatindex}

> **$removeTableRowAtIndex**(`tableNode`, `indexToDelete`): [`TableNode`](#tablenode)

Defined in: [packages/lexical-table/src/LexicalTableUtils.ts:154](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableUtils.ts#L154)

#### Parameters

##### tableNode

[`TableNode`](#tablenode)

##### indexToDelete

`number`

#### Returns

[`TableNode`](#tablenode)

***

### $unmergeCell() {#unmergecell}

> **$unmergeCell**(): `void`

Defined in: [packages/lexical-table/src/LexicalTableUtils.ts:926](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableUtils.ts#L926)

#### Returns

`void`

***

### applyTableHandlers() {#applytablehandlers}

> **applyTableHandlers**(`tableNode`, `element`, `editor`, `hasTabHandler`, `tableObservers`): [`TableObserver`](#tableobserver)

Defined in: [packages/lexical-table/src/LexicalTableSelectionHelpers.ts:366](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelectionHelpers.ts#L366)

#### Parameters

##### tableNode

[`TableNode`](#tablenode)

##### element

`HTMLElement`

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### hasTabHandler

`boolean`

##### tableObservers

`TableObservers`

#### Returns

[`TableObserver`](#tableobserver)

***

### getDOMCellFromTarget() {#getdomcellfromtarget}

> **getDOMCellFromTarget**(`node`): `null` \| [`TableDOMCell`](#tabledomcell)

Defined in: [packages/lexical-table/src/LexicalTableSelectionHelpers.ts:1193](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelectionHelpers.ts#L1193)

#### Parameters

##### node

`null` | `Node`

#### Returns

`null` \| [`TableDOMCell`](#tabledomcell)

***

### getTableElement() {#gettableelement}

> **getTableElement**\<`T`\>(`tableNode`, `dom`): [`HTMLTableElementWithWithTableSelectionState`](#htmltableelementwithwithtableselectionstate) \| `T` & `null`

Defined in: [packages/lexical-table/src/LexicalTableSelectionHelpers.ts:121](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelectionHelpers.ts#L121)

#### Type Parameters

##### T

`T` *extends* `null` \| `HTMLElement`

#### Parameters

##### tableNode

[`TableNode`](#tablenode)

##### dom

`T`

#### Returns

[`HTMLTableElementWithWithTableSelectionState`](#htmltableelementwithwithtableselectionstate) \| `T` & `null`

***

### getTableObserverFromTableElement() {#gettableobserverfromtableelement}

> **getTableObserverFromTableElement**(`tableElement`): `null` \| [`TableObserver`](#tableobserver)

Defined in: [packages/lexical-table/src/LexicalTableSelectionHelpers.ts:1158](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableSelectionHelpers.ts#L1158)

#### Parameters

##### tableElement

[`HTMLTableElementWithWithTableSelectionState`](#htmltableelementwithwithtableselectionstate)

#### Returns

`null` \| [`TableObserver`](#tableobserver)

***

### registerTableCellUnmergeTransform() {#registertablecellunmergetransform}

> **registerTableCellUnmergeTransform**(`editor`): () => `void`

Defined in: [packages/lexical-table/src/LexicalTablePluginHelpers.ts:267](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTablePluginHelpers.ts#L267)

Register a transform to ensure that all TableCellNode have a colSpan and rowSpan of 1.
This should only be registered when you do not want to support merged cells.

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

The editor

#### Returns

An unregister callback

> (): `void`

##### Returns

`void`

***

### registerTablePlugin() {#registertableplugin}

> **registerTablePlugin**(`editor`, `options?`): () => `void`

Defined in: [packages/lexical-table/src/LexicalTablePluginHelpers.ts:402](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTablePluginHelpers.ts#L402)

Register table command listeners and the table integrity transforms. The
table selection observer should be registered separately after this with
[registerTableSelectionObserver](#registertableselectionobserver).

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

The editor

##### options?

`Pick`\<[`NamedSignalsOutput`](lexical_extension.md#namedsignalsoutput)\<[`TableConfig`](#tableconfig)\>, `"hasNestedTables"`\>

#### Returns

An unregister callback

> (): `void`

##### Returns

`void`

***

### registerTableSelectionObserver() {#registertableselectionobserver}

> **registerTableSelectionObserver**(`editor`, `hasTabHandler`): () => `void`

Defined in: [packages/lexical-table/src/LexicalTablePluginHelpers.ts:322](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTablePluginHelpers.ts#L322)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### hasTabHandler

`boolean` = `true`

#### Returns

> (): `void`

##### Returns

`void`

***

### setScrollableTablesActive() {#setscrollabletablesactive}

> **setScrollableTablesActive**(`editor`, `active`): `void`

Defined in: [packages/lexical-table/src/LexicalTableNode.ts:156](https://github.com/facebook/lexical/tree/main/packages/lexical-table/src/LexicalTableNode.ts#L156)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### active

`boolean`

#### Returns

`void`
