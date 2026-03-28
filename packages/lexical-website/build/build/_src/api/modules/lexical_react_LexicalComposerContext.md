# @lexical/react/LexicalComposerContext

## Type Aliases

### LexicalComposerContextType {#lexicalcomposercontexttype}

> **LexicalComposerContextType** = `object`

Defined in: [packages/lexical-react/src/LexicalComposerContext.ts:14](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalComposerContext.ts#L14)

#### Properties

##### getTheme() {#gettheme}

> **getTheme**: () => [`EditorThemeClasses`](lexical.md#editorthemeclasses) \| `null` \| `undefined`

Defined in: [packages/lexical-react/src/LexicalComposerContext.ts:15](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalComposerContext.ts#L15)

###### Returns

[`EditorThemeClasses`](lexical.md#editorthemeclasses) \| `null` \| `undefined`

***

### LexicalComposerContextWithEditor {#lexicalcomposercontextwitheditor}

> **LexicalComposerContextWithEditor** = \[[`LexicalEditor`](lexical.md#lexicaleditor), [`LexicalComposerContextType`](#lexicalcomposercontexttype)\]

Defined in: [packages/lexical-react/src/LexicalComposerContext.ts:18](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalComposerContext.ts#L18)

## Variables

### LexicalComposerContext {#lexicalcomposercontext}

> `const` **LexicalComposerContext**: `React.Context`\<[`LexicalComposerContextWithEditor`](#lexicalcomposercontextwitheditor) \| `null` \| `undefined`\>

Defined in: [packages/lexical-react/src/LexicalComposerContext.ts:23](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalComposerContext.ts#L23)

## Functions

### createLexicalComposerContext() {#createlexicalcomposercontext}

> **createLexicalComposerContext**(`parent`, `theme`): [`LexicalComposerContextType`](#lexicalcomposercontexttype)

Defined in: [packages/lexical-react/src/LexicalComposerContext.ts:29](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalComposerContext.ts#L29)

#### Parameters

##### parent

`undefined` | `null` | [`LexicalComposerContextWithEditor`](#lexicalcomposercontextwitheditor)

##### theme

`undefined` | `null` | [`EditorThemeClasses`](lexical.md#editorthemeclasses)

#### Returns

[`LexicalComposerContextType`](#lexicalcomposercontexttype)

***

### useLexicalComposerContext() {#uselexicalcomposercontext}

> **useLexicalComposerContext**(): [`LexicalComposerContextWithEditor`](#lexicalcomposercontextwitheditor)

Defined in: [packages/lexical-react/src/LexicalComposerContext.ts:52](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalComposerContext.ts#L52)

#### Returns

[`LexicalComposerContextWithEditor`](#lexicalcomposercontextwitheditor)
