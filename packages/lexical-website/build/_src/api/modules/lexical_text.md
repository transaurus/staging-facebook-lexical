# @lexical/text

## Type Aliases

### EntityMatch {#entitymatch}

> **EntityMatch** = `object`

Defined in: [packages/lexical-text/src/registerLexicalTextEntity.ts:19](https://github.com/facebook/lexical/tree/main/packages/lexical-text/src/registerLexicalTextEntity.ts#L19)

#### Properties

##### end {#end}

> **end**: `number`

Defined in: [packages/lexical-text/src/registerLexicalTextEntity.ts:19](https://github.com/facebook/lexical/tree/main/packages/lexical-text/src/registerLexicalTextEntity.ts#L19)

##### start {#start}

> **start**: `number`

Defined in: [packages/lexical-text/src/registerLexicalTextEntity.ts:19](https://github.com/facebook/lexical/tree/main/packages/lexical-text/src/registerLexicalTextEntity.ts#L19)

***

### TextNodeWithOffset {#textnodewithoffset}

> **TextNodeWithOffset** = `object`

Defined in: [packages/lexical-text/src/index.ts:11](https://github.com/facebook/lexical/tree/main/packages/lexical-text/src/index.ts#L11)

#### Properties

##### node {#node}

> **node**: [`TextNode`](lexical.md#textnode)

Defined in: [packages/lexical-text/src/index.ts:12](https://github.com/facebook/lexical/tree/main/packages/lexical-text/src/index.ts#L12)

##### offset {#offset}

> **offset**: `number`

Defined in: [packages/lexical-text/src/index.ts:13](https://github.com/facebook/lexical/tree/main/packages/lexical-text/src/index.ts#L13)

## Functions

### $canShowPlaceholder() {#canshowplaceholder}

> **$canShowPlaceholder**(`isComposing`): `boolean`

Defined in: [packages/lexical-text/src/canShowPlaceholder.ts:24](https://github.com/facebook/lexical/tree/main/packages/lexical-text/src/canShowPlaceholder.ts#L24)

Determines if the input should show the placeholder. If anything is in
in the root the placeholder should not be shown.

#### Parameters

##### isComposing

`boolean`

Is the editor in composition mode due to an active Input Method Editor?

#### Returns

`boolean`

true if the input should show the placeholder, false otherwise.

***

### $canShowPlaceholderCurry() {#canshowplaceholdercurry}

> **$canShowPlaceholderCurry**(`isEditorComposing`): () => `boolean`

Defined in: [packages/lexical-text/src/canShowPlaceholder.ts:74](https://github.com/facebook/lexical/tree/main/packages/lexical-text/src/canShowPlaceholder.ts#L74)

Returns a function that executes [$canShowPlaceholder](#canshowplaceholder)

#### Parameters

##### isEditorComposing

`boolean`

Is the editor in composition mode due to an active Input Method Editor?

#### Returns

A function that executes $canShowPlaceholder with arguments.

> (): `boolean`

##### Returns

`boolean`

***

### $findTextIntersectionFromCharacters() {#findtextintersectionfromcharacters}

> **$findTextIntersectionFromCharacters**(`root`, `targetCharacters`): `null` \| \{ `node`: [`TextNode`](lexical.md#textnode); `offset`: `number`; \}

Defined in: [packages/lexical-text/src/findTextIntersectionFromCharacters.ts:17](https://github.com/facebook/lexical/tree/main/packages/lexical-text/src/findTextIntersectionFromCharacters.ts#L17)

Finds a TextNode with a size larger than targetCharacters and returns
the node along with the remaining length of the text.

#### Parameters

##### root

[`RootNode`](lexical.md#rootnode)

The RootNode.

##### targetCharacters

`number`

The number of characters whose TextNode must be larger than.

#### Returns

`null` \| \{ `node`: [`TextNode`](lexical.md#textnode); `offset`: `number`; \}

The TextNode and the intersections offset, or null if no TextNode is found.

***

### $isRootTextContentEmpty() {#isroottextcontentempty}

> **$isRootTextContentEmpty**(`isEditorComposing`, `trim`): `boolean`

Defined in: [packages/lexical-text/src/isRootTextContentEmpty.ts:16](https://github.com/facebook/lexical/tree/main/packages/lexical-text/src/isRootTextContentEmpty.ts#L16)

Determines if the root has any text content and can trim any whitespace if it does.

#### Parameters

##### isEditorComposing

`boolean`

Is the editor in composition mode due to an active Input Method Editor?

##### trim

`boolean` = `true`

Should the root text have its whitespaced trimmed? Defaults to true.

#### Returns

`boolean`

true if text content is empty, false if there is text or isEditorComposing is true.

***

### $isRootTextContentEmptyCurry() {#isroottextcontentemptycurry}

> **$isRootTextContentEmptyCurry**(`isEditorComposing`, `trim?`): () => `boolean`

Defined in: [packages/lexical-text/src/isRootTextContentEmpty.ts:39](https://github.com/facebook/lexical/tree/main/packages/lexical-text/src/isRootTextContentEmpty.ts#L39)

Returns a function that executes [$isRootTextContentEmpty](#isroottextcontentempty)

#### Parameters

##### isEditorComposing

`boolean`

Is the editor in composition mode due to an active Input Method Editor?

##### trim?

`boolean`

Should the root text have its whitespaced trimmed? Defaults to true.

#### Returns

A function that executes $isRootTextContentEmpty based on arguments.

> (): `boolean`

##### Returns

`boolean`

***

### $rootTextContent() {#roottextcontent}

> **$rootTextContent**(): `string`

Defined in: [packages/lexical-text/src/rootTextContent.ts:14](https://github.com/facebook/lexical/tree/main/packages/lexical-text/src/rootTextContent.ts#L14)

Returns the root's text content.

#### Returns

`string`

The root's text content.

***

### registerLexicalTextEntity() {#registerlexicaltextentity}

> **registerLexicalTextEntity**\<`T`\>(`editor`, `getMatch`, `targetNode`, `createNode`): () => `void`[]

Defined in: [packages/lexical-text/src/registerLexicalTextEntity.ts:40](https://github.com/facebook/lexical/tree/main/packages/lexical-text/src/registerLexicalTextEntity.ts#L40)

Returns a tuple that can be rested (...) into mergeRegister to clean up
node transforms listeners that transforms text into another node, eg. a HashtagNode.

#### Type Parameters

##### T

`T` *extends* [`TextNode`](lexical.md#textnode)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

The lexical editor.

##### getMatch

(`text`) => `null` \| [`EntityMatch`](#entitymatch)

Finds a matching string that satisfies a regex expression.

##### targetNode

[`Klass`](lexical.md#klass)\<`T`\>

The node type that contains text to match with. eg. HashtagNode

##### createNode

(`textNode`) => `T`

A function that creates a new node to contain the matched text. eg createHashtagNode

#### Returns

() => `void`[]

An array containing the plain text and reverse node transform listeners.

#### Example

```ts
  useEffect(() => {
   return mergeRegister(
     ...registerLexicalTextEntity(editor, getMatch, targetNode, createNode),
   );
 }, [createNode, editor, getMatch, targetNode]);
```
Where targetNode is the type of node containing the text you want to transform (like a text input),
then getMatch uses a regex to find a matching text and creates the proper node to include the matching text.
