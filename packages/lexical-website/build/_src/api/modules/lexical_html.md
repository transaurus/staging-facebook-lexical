# @lexical/html

## Functions

### $generateHtmlFromNodes() {#generatehtmlfromnodes}

> **$generateHtmlFromNodes**(`editor`, `selection?`): `string`

Defined in: [packages/lexical-html/src/index.ts:69](https://github.com/facebook/lexical/tree/main/packages/lexical-html/src/index.ts#L69)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### selection?

`null` | [`BaseSelection`](lexical.md#baseselection)

#### Returns

`string`

***

### $generateNodesFromDOM() {#generatenodesfromdom}

> **$generateNodesFromDOM**(`editor`, `dom`): [`LexicalNode`](lexical.md#lexicalnode)[]

Defined in: [packages/lexical-html/src/index.ts:42](https://github.com/facebook/lexical/tree/main/packages/lexical-html/src/index.ts#L42)

How you parse your html string to get a document is left up to you. In the browser you can use the native
DOMParser API to generate a document (see clipboard.ts), but to use in a headless environment you can use JSDom
or an equivalent library and pass in the document here.

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### dom

`Document` | `ParentNode`

#### Returns

[`LexicalNode`](lexical.md#lexicalnode)[]
