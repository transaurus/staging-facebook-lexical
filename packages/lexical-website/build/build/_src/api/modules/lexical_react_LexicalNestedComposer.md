# @lexical/react/LexicalNestedComposer

## Interfaces

### LexicalNestedComposerProps {#lexicalnestedcomposerprops}

Defined in: [packages/lexical-react/src/LexicalNestedComposer.tsx:33](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNestedComposer.tsx#L33)

#### Properties

##### children? {#children}

> `optional` **children**: `ReactNode`

Defined in: [packages/lexical-react/src/LexicalNestedComposer.tsx:41](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNestedComposer.tsx#L41)

Any children (e.g. plug-ins) for this editor. Note that the nested editor
does not inherit any plug-ins or registrations from those plug-ins (such
as transforms and command listeners that may be necessary for correct
operation of those nodes) from the parent editor. If you are using nodes
that require plug-ins they must also be instantiated here.

##### initialEditor {#initialeditor}

> **initialEditor**: [`LexicalEditor`](lexical.md#lexicaleditor)

Defined in: [packages/lexical-react/src/LexicalNestedComposer.tsx:46](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNestedComposer.tsx#L46)

The nested editor, created outside of this component (typically in the
implementation of a LexicalNode) with createEditor

##### ~~initialNodes?~~ {#initialnodes}

> `optional` **initialNodes**: readonly ([`KlassConstructor`](lexical.md#klassconstructor)\<*typeof* [`LexicalNode`](lexical.md#lexicalnode)\> \| [`LexicalNodeReplacement`](lexical.md#lexicalnodereplacement))[]

Defined in: [packages/lexical-react/src/LexicalNestedComposer.tsx:63](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNestedComposer.tsx#L63)

###### Deprecated

This feature is not safe or correctly implemented and will be
removed in v0.32.0. The only correct time to configure the nodes is when
creating the initialEditor.

###### Example

```ts
// This is normally in the implementation of a LexicalNode that
// owns the nested editor
editor = createEditor({nodes: [], parentEditor: $getEditor()});
```

##### initialTheme? {#initialtheme}

> `optional` **initialTheme**: [`EditorThemeClasses`](lexical.md#editorthemeclasses)

Defined in: [packages/lexical-react/src/LexicalNestedComposer.tsx:50](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNestedComposer.tsx#L50)

Optionally overwrite the theme of the initialEditor

##### skipCollabChecks? {#skipcollabchecks}

> `optional` **skipCollabChecks**: `true`

Defined in: [packages/lexical-react/src/LexicalNestedComposer.tsx:68](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNestedComposer.tsx#L68)

If this is not explicitly set to true, and the collab plugin is active,
rendering the children of this component will not happen until collab is ready.

##### skipEditableListener? {#skipeditablelistener}

> `optional` **skipEditableListener**: `true`

Defined in: [packages/lexical-react/src/LexicalNestedComposer.tsx:77](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNestedComposer.tsx#L77)

If this is not explicitly set to true, the editable state of the nested
editor will automatically follow the parent editor's editable state.
When set to true, the nested editor is responsible for managing its own
editable state.

Available since v0.29.0

## Functions

### LexicalNestedComposer() {#lexicalnestedcomposer}

> **LexicalNestedComposer**(`__namedParameters`): `Element`

Defined in: [packages/lexical-react/src/LexicalNestedComposer.tsx:87](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalNestedComposer.tsx#L87)

#### Parameters

##### \_\_namedParameters

[`LexicalNestedComposerProps`](#lexicalnestedcomposerprops)

#### Returns

`Element`
