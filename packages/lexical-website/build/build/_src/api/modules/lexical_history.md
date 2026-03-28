# @lexical/history

## Interfaces

### HistoryConfig {#historyconfig}

Defined in: [packages/lexical-history/src/index.ts:540](https://github.com/facebook/lexical/tree/main/packages/lexical-history/src/index.ts#L540)

#### Properties

##### createInitialHistoryState() {#createinitialhistorystate}

> **createInitialHistoryState**: (`editor`) => [`HistoryState`](#historystate)

Defined in: [packages/lexical-history/src/index.ts:549](https://github.com/facebook/lexical/tree/main/packages/lexical-history/src/index.ts#L549)

The initial history state, the default is [createEmptyHistoryState](#createemptyhistorystate).

###### Parameters

###### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

###### Returns

[`HistoryState`](#historystate)

##### delay {#delay}

> **delay**: `number`

Defined in: [packages/lexical-history/src/index.ts:545](https://github.com/facebook/lexical/tree/main/packages/lexical-history/src/index.ts#L545)

The time (in milliseconds) the editor should delay generating a new history stack,
instead of merging the current changes with the current stack. The default is 300ms.

##### disabled {#disabled}

> **disabled**: `boolean`

Defined in: [packages/lexical-history/src/index.ts:553](https://github.com/facebook/lexical/tree/main/packages/lexical-history/src/index.ts#L553)

Whether history is disabled or not

##### now() {#now}

> **now**: () => `number`

Defined in: [packages/lexical-history/src/index.ts:557](https://github.com/facebook/lexical/tree/main/packages/lexical-history/src/index.ts#L557)

The now() function, defaults to Date.now.

###### Returns

`number`

***

### SharedHistoryConfig {#sharedhistoryconfig}

Defined in: [packages/lexical-history/src/index.ts:601](https://github.com/facebook/lexical/tree/main/packages/lexical-history/src/index.ts#L601)

#### Properties

##### disabled {#disabled-1}

> **disabled**: `boolean`

Defined in: [packages/lexical-history/src/index.ts:605](https://github.com/facebook/lexical/tree/main/packages/lexical-history/src/index.ts#L605)

Whether shared history is disabled or not

##### parentEditor {#parenteditor}

> **parentEditor**: `null` \| [`LexicalEditor`](lexical.md#lexicaleditor)

Defined in: [packages/lexical-history/src/index.ts:611](https://github.com/facebook/lexical/tree/main/packages/lexical-history/src/index.ts#L611)

The parentEditor to use, by default it is derived from
`config.parentEditor` which can be provided by
NestedEditorExtension

## Type Aliases

### HistoryState {#historystate}

> **HistoryState** = `object`

Defined in: [packages/lexical-history/src/index.ts:56](https://github.com/facebook/lexical/tree/main/packages/lexical-history/src/index.ts#L56)

#### Properties

##### current {#current}

> **current**: `null` \| [`HistoryStateEntry`](#historystateentry)

Defined in: [packages/lexical-history/src/index.ts:57](https://github.com/facebook/lexical/tree/main/packages/lexical-history/src/index.ts#L57)

##### redoStack {#redostack}

> **redoStack**: [`HistoryStateEntry`](#historystateentry)[]

Defined in: [packages/lexical-history/src/index.ts:58](https://github.com/facebook/lexical/tree/main/packages/lexical-history/src/index.ts#L58)

##### undoStack {#undostack}

> **undoStack**: [`HistoryStateEntry`](#historystateentry)[]

Defined in: [packages/lexical-history/src/index.ts:59](https://github.com/facebook/lexical/tree/main/packages/lexical-history/src/index.ts#L59)

***

### HistoryStateEntry {#historystateentry}

> **HistoryStateEntry** = `object`

Defined in: [packages/lexical-history/src/index.ts:52](https://github.com/facebook/lexical/tree/main/packages/lexical-history/src/index.ts#L52)

#### Properties

##### editor {#editor}

> **editor**: [`LexicalEditor`](lexical.md#lexicaleditor)

Defined in: [packages/lexical-history/src/index.ts:53](https://github.com/facebook/lexical/tree/main/packages/lexical-history/src/index.ts#L53)

##### editorState {#editorstate}

> **editorState**: [`EditorState`](lexical.md#editorstate)

Defined in: [packages/lexical-history/src/index.ts:54](https://github.com/facebook/lexical/tree/main/packages/lexical-history/src/index.ts#L54)

## Variables

### HistoryExtension {#historyextension}

> `const` **HistoryExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<[`HistoryConfig`](#historyconfig), `"@lexical/history/History"`, [`NamedSignalsOutput`](lexical_extension.md#namedsignalsoutput)\<\{ `delay`: `number`; `disabled`: `boolean`; `historyState`: [`HistoryState`](#historystate); `now`: () => `number`; \}\>, `unknown`\>

Defined in: [packages/lexical-history/src/index.ts:565](https://github.com/facebook/lexical/tree/main/packages/lexical-history/src/index.ts#L565)

Registers necessary listeners to manage undo/redo history stack and related
editor commands, via the @lexical/history module.

***

### SharedHistoryExtension {#sharedhistoryextension}

> `const` **SharedHistoryExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<[`SharedHistoryConfig`](#sharedhistoryconfig), `"@lexical/history/SharedHistory"`, [`NamedSignalsOutput`](lexical_extension.md#namedsignalsoutput)\<\{ `disabled`: `boolean`; `parentEditor`: `null` \| [`LexicalEditor`](lexical.md#lexicaleditor); \}\>, `unknown`\>

Defined in: [packages/lexical-history/src/index.ts:619](https://github.com/facebook/lexical/tree/main/packages/lexical-history/src/index.ts#L619)

Registers necessary listeners to manage undo/redo history stack and related
editor commands, via the @lexical/history module, only if the parent editor
has a history plugin implementation.

## Functions

### createEmptyHistoryState() {#createemptyhistorystate}

> **createEmptyHistoryState**(): [`HistoryState`](#historystate)

Defined in: [packages/lexical-history/src/index.ts:532](https://github.com/facebook/lexical/tree/main/packages/lexical-history/src/index.ts#L532)

Creates an empty history state.

#### Returns

[`HistoryState`](#historystate)

- The empty history state, as an object.

***

### registerHistory() {#registerhistory}

> **registerHistory**(`editor`, `historyState`, `delay`, `dateNow`): () => `void`

Defined in: [packages/lexical-history/src/index.ts:427](https://github.com/facebook/lexical/tree/main/packages/lexical-history/src/index.ts#L427)

Registers necessary listeners to manage undo/redo history stack and related editor commands.
It returns `unregister` callback that cleans up all listeners and should be called on editor unmount.

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

The lexical editor.

##### historyState

[`HistoryState`](#historystate)

The history state, containing the current state and the undo/redo stack.

##### delay

The time (in milliseconds) the editor should delay generating a new history stack,
instead of merging the current changes with the current stack.

`number` | [`ReadonlySignal`](lexical_extension.md#readonlysignal)\<`number`\>

##### dateNow

() => `number`

#### Returns

The listeners cleanup callback function.

> (): `void`

##### Returns

`void`
