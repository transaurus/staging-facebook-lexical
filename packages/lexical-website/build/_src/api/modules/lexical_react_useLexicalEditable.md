# @lexical/react/useLexicalEditable

## Functions

### useLexicalEditable() {#uselexicaleditable}

> **useLexicalEditable**(): `boolean`

Defined in: [packages/lexical-react/src/useLexicalEditable.ts:31](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/useLexicalEditable.ts#L31)

Get the current value for [LexicalEditor.isEditable](lexical.md#iseditable)
using [useLexicalSubscription](lexical_react_useLexicalSubscription.md#uselexicalsubscription).
You should prefer this over manually observing the value with
[LexicalEditor.registerEditableListener](lexical.md#registereditablelistener),
which is a bit tricky to do correctly, particularly when using
React StrictMode (the default for development) or concurrency.

#### Returns

`boolean`
