# @lexical/selection

## Variables

### ~~trimTextContentFromAnchor()~~ {#trimtextcontentfromanchor}

> `const` **trimTextContentFromAnchor**: (`editor`, `anchor`, `delCount`) => `void` = `$trimTextContentFromAnchor`

Defined in: [packages/lexical-selection/src/index.ts:40](https://github.com/facebook/lexical/tree/main/packages/lexical-selection/src/index.ts#L40)

Trims text from a node in order to shorten it, eg. to enforce a text's max length. If it deletes text
that is an ancestor of the anchor then it will leave 2 indents, otherwise, if no text content exists, it deletes
the TextNode. It will move the focus to either the end of any left over text or beginning of a new TextNode.

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

The lexical editor.

##### anchor

[`Point`](lexical.md#point)

The anchor of the current selection, where the selection should be pointing.

##### delCount

`number`

The amount of characters to delete. Useful as a dynamic variable eg. textContentSize - maxLength;

#### Returns

`void`

#### Deprecated

renamed to [$trimTextContentFromAnchor](#trimtextcontentfromanchor-1) by @lexical/eslint-plugin rules-of-lexical

## Functions

### $addNodeStyle() {#addnodestyle}

> **$addNodeStyle**(`node`): `void`

Defined in: [packages/lexical-selection/src/lexical-node.ts:250](https://github.com/facebook/lexical/tree/main/packages/lexical-selection/src/lexical-node.ts#L250)

Gets the TextNode's style object and adds the styles to the CSS.

#### Parameters

##### node

[`TextNode`](lexical.md#textnode)

The TextNode to add styles to.

#### Returns

`void`

***

### $copyBlockFormatIndent() {#copyblockformatindent}

> **$copyBlockFormatIndent**(`srcNode`, `destNode`): `void`

Defined in: [packages/lexical-selection/src/range-selection.ts:47](https://github.com/facebook/lexical/tree/main/packages/lexical-selection/src/range-selection.ts#L47)

#### Parameters

##### srcNode

[`ElementNode`](lexical.md#elementnode)

##### destNode

[`ElementNode`](lexical.md#elementnode)

#### Returns

`void`

***

### $ensureForwardRangeSelection() {#ensureforwardrangeselection}

> **$ensureForwardRangeSelection**(`selection`): `void`

Defined in: [packages/lexical-selection/src/lexical-node.ts:433](https://github.com/facebook/lexical/tree/main/packages/lexical-selection/src/lexical-node.ts#L433)

Ensure that the given RangeSelection is not backwards. If it
is backwards, then the anchor and focus points will be swapped
in-place. Ensuring that the selection is a writable RangeSelection
is the responsibility of the caller (e.g. in a read-only context
you will want to clone $getSelection() before using this).

#### Parameters

##### selection

[`RangeSelection`](lexical.md#rangeselection)

a writable RangeSelection

#### Returns

`void`

***

### $forEachSelectedTextNode() {#foreachselectedtextnode}

> **$forEachSelectedTextNode**(`fn`): `void`

Defined in: [packages/lexical-selection/src/lexical-node.ts:358](https://github.com/facebook/lexical/tree/main/packages/lexical-selection/src/lexical-node.ts#L358)

#### Parameters

##### fn

(`textNode`) => `void`

#### Returns

`void`

***

### $getComputedStyleForElement() {#getcomputedstyleforelement}

> **$getComputedStyleForElement**(`element`): `null` \| `CSSStyleDeclaration`

Defined in: [packages/lexical-selection/src/utils.ts:238](https://github.com/facebook/lexical/tree/main/packages/lexical-selection/src/utils.ts#L238)

Gets the computed DOM styles of the element.

#### Parameters

##### element

[`ElementNode`](lexical.md#elementnode)

The node to check the styles for.

#### Returns

`null` \| `CSSStyleDeclaration`

the computed styles of the element or null if there is no DOM element or no default view for the document.

***

### $getComputedStyleForParent() {#getcomputedstyleforparent}

> **$getComputedStyleForParent**(`node`): `null` \| `CSSStyleDeclaration`

Defined in: [packages/lexical-selection/src/utils.ts:258](https://github.com/facebook/lexical/tree/main/packages/lexical-selection/src/utils.ts#L258)

Gets the computed DOM styles of the parent of the node.

#### Parameters

##### node

[`LexicalNode`](lexical.md#lexicalnode)

The node to check its parent's styles for.

#### Returns

`null` \| `CSSStyleDeclaration`

the computed styles of the node or null if there is no DOM element or no default view for the document.

***

### $getSelectionStyleValueForProperty() {#getselectionstylevalueforproperty}

> **$getSelectionStyleValueForProperty**(`selection`, `styleProperty`, `defaultValue`): `string`

Defined in: [packages/lexical-selection/src/range-selection.ts:592](https://github.com/facebook/lexical/tree/main/packages/lexical-selection/src/range-selection.ts#L592)

Returns the current value of a CSS property for TextNodes in the Selection, if set. If not set, it returns the defaultValue.
If all TextNodes do not have the same value, it returns an empty string.

#### Parameters

##### selection

The selection of TextNodes whose value to find.

[`RangeSelection`](lexical.md#rangeselection) | [`TableSelection`](lexical_table.md#tableselection-1)

##### styleProperty

`string`

The CSS style property.

##### defaultValue

`string` = `''`

The default value for the property, defaults to an empty string.

#### Returns

`string`

The value of the property for the selected TextNodes.

***

### $isAtNodeEnd() {#isatnodeend}

> **$isAtNodeEnd**(`point`): `boolean`

Defined in: [packages/lexical-selection/src/lexical-node.ts:106](https://github.com/facebook/lexical/tree/main/packages/lexical-selection/src/lexical-node.ts#L106)

Determines if the current selection is at the end of the node.

#### Parameters

##### point

[`Point`](lexical.md#point)

The point of the selection to test.

#### Returns

`boolean`

true if the provided point offset is in the last possible position, false otherwise.

***

### $isParentElementRTL() {#isparentelementrtl}

> **$isParentElementRTL**(`selection`): `boolean`

Defined in: [packages/lexical-selection/src/range-selection.ts:517](https://github.com/facebook/lexical/tree/main/packages/lexical-selection/src/range-selection.ts#L517)

Tests a parent element for right to left direction.

#### Parameters

##### selection

[`RangeSelection`](lexical.md#rangeselection)

The selection whose parent is to be tested.

#### Returns

`boolean`

true if the selections' parent element has a direction of 'rtl' (right to left), false otherwise.

***

### $isParentRTL() {#isparentrtl}

> **$isParentRTL**(`node`): `boolean`

Defined in: [packages/lexical-selection/src/utils.ts:270](https://github.com/facebook/lexical/tree/main/packages/lexical-selection/src/utils.ts#L270)

Determines whether a node's parent is RTL.

#### Parameters

##### node

[`LexicalNode`](lexical.md#lexicalnode)

The node to check whether it is RTL.

#### Returns

`boolean`

whether the node is RTL.

***

### $moveCaretSelection() {#movecaretselection}

> **$moveCaretSelection**(`selection`, `isHoldingShift`, `isBackward`, `granularity`): `void`

Defined in: [packages/lexical-selection/src/range-selection.ts:503](https://github.com/facebook/lexical/tree/main/packages/lexical-selection/src/range-selection.ts#L503)

Moves the selection according to the arguments.

#### Parameters

##### selection

[`RangeSelection`](lexical.md#rangeselection)

The selected text or nodes.

##### isHoldingShift

`boolean`

Is the shift key being held down during the operation.

##### isBackward

`boolean`

Is the selection selected backwards (the focus comes before the anchor)?

##### granularity

The distance to adjust the current selection.

`"character"` | `"word"` | `"lineboundary"`

#### Returns

`void`

***

### $moveCharacter() {#movecharacter}

> **$moveCharacter**(`selection`, `isHoldingShift`, `isBackward`): `void`

Defined in: [packages/lexical-selection/src/range-selection.ts:528](https://github.com/facebook/lexical/tree/main/packages/lexical-selection/src/range-selection.ts#L528)

Moves selection by character according to arguments.

#### Parameters

##### selection

[`RangeSelection`](lexical.md#rangeselection)

The selection of the characters to move.

##### isHoldingShift

`boolean`

Is the shift key being held down during the operation.

##### isBackward

`boolean`

Is the selection backward (the focus comes before the anchor)?

#### Returns

`void`

***

### $patchStyleText() {#patchstyletext}

> **$patchStyleText**(`selection`, `patch`): `void`

Defined in: [packages/lexical-selection/src/lexical-node.ts:314](https://github.com/facebook/lexical/tree/main/packages/lexical-selection/src/lexical-node.ts#L314)

Applies the provided styles to the TextNodes in the provided Selection.
Will update partially selected TextNodes by splitting the TextNode and applying
the styles to the appropriate one.

#### Parameters

##### selection

[`BaseSelection`](lexical.md#baseselection)

The selected node(s) to update.

##### patch

`Record`\<`string`, `string` \| `null` \| (`currentStyleValue`, `target`) => `string`\>

The patch to apply, which can include multiple styles. \{CSSProperty: value\} . Can also accept a function that returns the new property value.

#### Returns

`void`

***

### $setBlocksType() {#setblockstype}

> **$setBlocksType**\<`T`\>(`selection`, `$createElement`, `$afterCreateElement`): `void`

Defined in: [packages/lexical-selection/src/range-selection.ts:67](https://github.com/facebook/lexical/tree/main/packages/lexical-selection/src/range-selection.ts#L67)

Converts all nodes in the selection that are of one block type to another.

#### Type Parameters

##### T

`T` *extends* [`ElementNode`](lexical.md#elementnode)

#### Parameters

##### selection

The selected blocks to be converted.

`null` | [`BaseSelection`](lexical.md#baseselection)

##### $createElement

() => `T`

The function that creates the node. eg. $createParagraphNode.

##### $afterCreateElement

(`prevNodeSrc`, `newNodeDest`) => `void`

The function that updates the new node based on the previous one ($copyBlockFormatIndent by default)

#### Returns

`void`

***

### $shouldOverrideDefaultCharacterSelection() {#shouldoverridedefaultcharacterselection}

> **$shouldOverrideDefaultCharacterSelection**(`selection`, `isBackward`): `boolean`

Defined in: [packages/lexical-selection/src/range-selection.ts:462](https://github.com/facebook/lexical/tree/main/packages/lexical-selection/src/range-selection.ts#L462)

Determines if the default character selection should be overridden. Used with DecoratorNodes

#### Parameters

##### selection

[`RangeSelection`](lexical.md#rangeselection)

The selection whose default character selection may need to be overridden.

##### isBackward

`boolean`

Is the selection backwards (the focus comes before the anchor)?

#### Returns

`boolean`

true if it should be overridden, false if not.

***

### $sliceSelectedTextNodeContent() {#sliceselectedtextnodecontent}

> **$sliceSelectedTextNodeContent**\<`T`\>(`selection`, `textNode`, `mutates`): `T`

Defined in: [packages/lexical-selection/src/lexical-node.ts:47](https://github.com/facebook/lexical/tree/main/packages/lexical-selection/src/lexical-node.ts#L47)

Generally used to append text content to HTML and JSON. Grabs the text content and "slices"
it to be generated into the new TextNode.

#### Type Parameters

##### T

`T` *extends* [`TextNode`](lexical.md#textnode)

#### Parameters

##### selection

[`BaseSelection`](lexical.md#baseselection)

The selection containing the node whose TextNode is to be edited.

##### textNode

`T`

The TextNode to be edited.

##### mutates

'clone' to return a clone before mutating, 'self' to update in-place

`"clone"` | `"self"`

#### Returns

`T`

The updated TextNode or clone.

***

### $trimTextContentFromAnchor() {#trimtextcontentfromanchor-1}

> **$trimTextContentFromAnchor**(`editor`, `anchor`, `delCount`): `void`

Defined in: [packages/lexical-selection/src/lexical-node.ts:127](https://github.com/facebook/lexical/tree/main/packages/lexical-selection/src/lexical-node.ts#L127)

Trims text from a node in order to shorten it, eg. to enforce a text's max length. If it deletes text
that is an ancestor of the anchor then it will leave 2 indents, otherwise, if no text content exists, it deletes
the TextNode. It will move the focus to either the end of any left over text or beginning of a new TextNode.

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

The lexical editor.

##### anchor

[`Point`](lexical.md#point)

The anchor of the current selection, where the selection should be pointing.

##### delCount

`number`

The amount of characters to delete. Useful as a dynamic variable eg. textContentSize - maxLength;

#### Returns

`void`

***

### ~~$wrapNodes()~~ {#wrapnodes}

> **$wrapNodes**(`selection`, `createElement`, `wrappingElement`): `void`

Defined in: [packages/lexical-selection/src/range-selection.ts:162](https://github.com/facebook/lexical/tree/main/packages/lexical-selection/src/range-selection.ts#L162)

#### Parameters

##### selection

[`BaseSelection`](lexical.md#baseselection)

The selection of nodes to be wrapped.

##### createElement

() => [`ElementNode`](lexical.md#elementnode)

A function that creates the wrapping ElementNode. eg. $createParagraphNode.

##### wrappingElement

An element to append the wrapped selection and its children to.

`null` | [`ElementNode`](lexical.md#elementnode)

#### Returns

`void`

#### Deprecated

In favor of $setBlockTypes
Wraps all nodes in the selection into another node of the type returned by createElement.

***

### createDOMRange() {#createdomrange}

> **createDOMRange**(`editor`, `anchorNode`, `_anchorOffset`, `focusNode`, `_focusOffset`): `null` \| `Range`

Defined in: [packages/lexical-selection/src/utils.ts:47](https://github.com/facebook/lexical/tree/main/packages/lexical-selection/src/utils.ts#L47)

Creates a selection range for the DOM.

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

The lexical editor.

##### anchorNode

[`LexicalNode`](lexical.md#lexicalnode)

The anchor node of a selection.

##### \_anchorOffset

`number`

The amount of space offset from the anchor to the focus.

##### focusNode

[`LexicalNode`](lexical.md#lexicalnode)

The current focus.

##### \_focusOffset

`number`

The amount of space offset from the focus to the anchor.

#### Returns

`null` \| `Range`

The range of selection for the DOM that was created.

***

### createRectsFromDOMRange() {#createrectsfromdomrange}

> **createRectsFromDOMRange**(`editor`, `range`): `ClientRect`[]

Defined in: [packages/lexical-selection/src/utils.ts:124](https://github.com/facebook/lexical/tree/main/packages/lexical-selection/src/utils.ts#L124)

Creates DOMRects, generally used to help the editor find a specific location on the screen.

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

The lexical editor

##### range

`Range`

A fragment of a document that can contain nodes and parts of text nodes.

#### Returns

`ClientRect`[]

The selectionRects as an array.

***

### getCSSFromStyleObject() {#getcssfromstyleobject}

> **getCSSFromStyleObject**(`styles`): `string`

Defined in: [packages/lexical-selection/src/utils.ts:221](https://github.com/facebook/lexical/tree/main/packages/lexical-selection/src/utils.ts#L221)

Gets the CSS styles from the style object.

#### Parameters

##### styles

`Record`\<`string`, `string`\>

The style object containing the styles to get.

#### Returns

`string`

A string containing the CSS styles and their values.

***

### getStyleObjectFromCSS() {#getstyleobjectfromcss}

> **getStyleObjectFromCSS**(`css`): `Record`\<`string`, `string`\>

Defined in: [packages/lexical-selection/src/utils.ts:201](https://github.com/facebook/lexical/tree/main/packages/lexical-selection/src/utils.ts#L201)

Given a CSS string, returns an object from the style cache.

#### Parameters

##### css

`string`

The CSS property as a string.

#### Returns

`Record`\<`string`, `string`\>

The value of the given CSS property.

## References

### $cloneWithProperties {#clonewithproperties}

Re-exports [$cloneWithProperties](lexical.md#clonewithproperties)

***

### $selectAll {#selectall}

Re-exports [$selectAll](lexical.md#selectall)
