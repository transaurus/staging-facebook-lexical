# @lexical/headless/dom

## Functions

### withDOM() {#withdom}

> **withDOM**\<`T`\>(`f`): `T`

Defined in: [packages/lexical-headless/src/dom.ts:28](https://github.com/facebook/lexical/tree/main/packages/lexical-headless/src/dom.ts#L28)

Call the given synchronous function with a window object,
either from the browser or happy-dom in a non-browser
environment. It will also set window, document, and MutationObserver
on globalThis while the callback is running. This is
useful primarily to parse and render HTML server-side.

It is not safe to do anything asynchronous during this callback.

#### Type Parameters

##### T

`T`

#### Parameters

##### f

(`window`) => `T`

A function that uses the window object

#### Returns

`T`

The result of that function.
