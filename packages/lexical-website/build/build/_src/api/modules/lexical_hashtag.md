# @lexical/hashtag

## Classes

### HashtagNode {#hashtagnode}

Defined in: [packages/lexical-hashtag/src/LexicalHashtagNode.ts:15](https://github.com/facebook/lexical/tree/main/packages/lexical-hashtag/src/LexicalHashtagNode.ts#L15)

#### Extends

- [`TextNode`](lexical.md#textnode)

#### Methods

##### canInsertTextBefore() {#caninserttextbefore}

> **canInsertTextBefore**(): `boolean`

Defined in: [packages/lexical-hashtag/src/LexicalHashtagNode.ts:34](https://github.com/facebook/lexical/tree/main/packages/lexical-hashtag/src/LexicalHashtagNode.ts#L34)

This method is meant to be overridden by TextNode subclasses to control the behavior of those nodes
when a user event would cause text to be inserted before them in the editor. If true, Lexical will attempt
to insert text into this node. If false, it will insert the text in a new sibling node.

###### Returns

`boolean`

true if text can be inserted before the node, false otherwise.

###### Overrides

[`TextNode`](lexical.md#textnode).[`canInsertTextBefore`](lexical.md#caninserttextbefore-4)

##### createDOM() {#createdom}

> **createDOM**(`config`): `HTMLElement`

Defined in: [packages/lexical-hashtag/src/LexicalHashtagNode.ts:24](https://github.com/facebook/lexical/tree/main/packages/lexical-hashtag/src/LexicalHashtagNode.ts#L24)

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

##### isTextEntity() {#istextentity}

> **isTextEntity**(): `true`

Defined in: [packages/lexical-hashtag/src/LexicalHashtagNode.ts:38](https://github.com/facebook/lexical/tree/main/packages/lexical-hashtag/src/LexicalHashtagNode.ts#L38)

This method is meant to be overridden by TextNode subclasses to control the behavior of those nodes
when used with the registerLexicalTextEntity function. If you're using registerLexicalTextEntity, the
node class that you create and replace matched text with should return true from this method.

###### Returns

`true`

true if the node is to be treated as a "text entity", false otherwise.

###### Overrides

[`TextNode`](lexical.md#textnode).[`isTextEntity`](lexical.md#istextentity)

##### clone() {#clone}

> `static` **clone**(`node`): [`HashtagNode`](#hashtagnode)

Defined in: [packages/lexical-hashtag/src/LexicalHashtagNode.ts:20](https://github.com/facebook/lexical/tree/main/packages/lexical-hashtag/src/LexicalHashtagNode.ts#L20)

Clones this node, creating a new node with a different key
and adding it to the EditorState (but not attaching it anywhere!). All nodes must
implement this method.

###### Parameters

###### node

[`HashtagNode`](#hashtagnode)

###### Returns

[`HashtagNode`](#hashtagnode)

###### Overrides

[`TextNode`](lexical.md#textnode).[`clone`](lexical.md#clone-12)

##### getType() {#gettype}

> `static` **getType**(): `string`

Defined in: [packages/lexical-hashtag/src/LexicalHashtagNode.ts:16](https://github.com/facebook/lexical/tree/main/packages/lexical-hashtag/src/LexicalHashtagNode.ts#L16)

Returns the string type of this node. Every node must
implement this and it MUST BE UNIQUE amongst nodes registered
on the editor.

###### Returns

`string`

###### Overrides

[`TextNode`](lexical.md#textnode).[`getType`](lexical.md#gettype-18)

##### importJSON() {#importjson}

> `static` **importJSON**(`serializedNode`): [`HashtagNode`](#hashtagnode)

Defined in: [packages/lexical-hashtag/src/LexicalHashtagNode.ts:30](https://github.com/facebook/lexical/tree/main/packages/lexical-hashtag/src/LexicalHashtagNode.ts#L30)

Controls how the this node is deserialized from JSON. This is usually boilerplate,
but provides an abstraction between the node implementation and serialized interface that can
be important if you ever make breaking changes to a node schema (by adding or removing properties).
See [Serialization & Deserialization](https://lexical.dev/docs/concepts/serialization#lexical---html).

###### Parameters

###### serializedNode

[`SerializedTextNode`](lexical.md#serializedtextnode)

###### Returns

[`HashtagNode`](#hashtagnode)

###### Overrides

[`TextNode`](lexical.md#textnode).[`importJSON`](lexical.md#importjson-12)

## Interfaces

### HashtagConfig {#hashtagconfig}

Defined in: [packages/lexical-hashtag/src/LexicalHashtagExtension.ts:284](https://github.com/facebook/lexical/tree/main/packages/lexical-hashtag/src/LexicalHashtagExtension.ts#L284)

#### Properties

##### getHashtagMatch() {#gethashtagmatch}

> **getHashtagMatch**: (`text`) => `null` \| \{ `end`: `number`; `start`: `number`; \}

Defined in: [packages/lexical-hashtag/src/LexicalHashtagExtension.ts:292](https://github.com/facebook/lexical/tree/main/packages/lexical-hashtag/src/LexicalHashtagExtension.ts#L292)

The matching function used by the extension. Has a default
implementation that should be suitable for most use cases.

###### Parameters

###### text

`string`

The string of text to match

###### Returns

`null` \| \{ `end`: `number`; `start`: `number`; \}

`null` if no match, otherwise an object with the start and end index of the first `#hashtag` match

## Variables

### HashtagExtension {#hashtagextension}

> `const` **HashtagExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<[`HashtagConfig`](#hashtagconfig), `"@lexical/hashtag/Hashtag"`, `unknown`, `unknown`\>

Defined in: [packages/lexical-hashtag/src/LexicalHashtagExtension.ts:298](https://github.com/facebook/lexical/tree/main/packages/lexical-hashtag/src/LexicalHashtagExtension.ts#L298)

Add `#hashtag` support to the editor

## Functions

### $createHashtagNode() {#createhashtagnode}

> **$createHashtagNode**(`text`): [`HashtagNode`](#hashtagnode)

Defined in: [packages/lexical-hashtag/src/LexicalHashtagNode.ts:48](https://github.com/facebook/lexical/tree/main/packages/lexical-hashtag/src/LexicalHashtagNode.ts#L48)

Generates a HashtagNode, which is a string following the format of a # followed by some text, eg. #lexical.

#### Parameters

##### text

`string` = `''`

The text used inside the HashtagNode.

#### Returns

[`HashtagNode`](#hashtagnode)

- The HashtagNode with the embedded text.

***

### $isHashtagNode() {#ishashtagnode}

> **$isHashtagNode**(`node`): `node is HashtagNode`

Defined in: [packages/lexical-hashtag/src/LexicalHashtagNode.ts:57](https://github.com/facebook/lexical/tree/main/packages/lexical-hashtag/src/LexicalHashtagNode.ts#L57)

Determines if node is a HashtagNode.

#### Parameters

##### node

The node to be checked.

`undefined` | `null` | [`LexicalNode`](lexical.md#lexicalnode)

#### Returns

`node is HashtagNode`

true if node is a HashtagNode, false otherwise.
