# @lexical/react/TreeViewExtension

## Type Aliases

### TreeViewConfig {#treeviewconfig}

> **TreeViewConfig** = `Omit`\<`Parameters`\<*typeof* [`TreeView`](lexical_react_LexicalTreeView.md#treeview)\>\[`0`\], `"editor"`\>

Defined in: [packages/lexical-react/src/TreeViewExtension.tsx:16](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/TreeViewExtension.tsx#L16)

## Variables

### TreeViewExtension {#treeviewextension}

> `const` **TreeViewExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<[`TreeViewConfig`](#treeviewconfig), `"@lexical/react/TreeView"`, \{ `Component`: (`props`) => `Element`; \}, `unknown`\>

Defined in: [packages/lexical-react/src/TreeViewExtension.tsx:43](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/TreeViewExtension.tsx#L43)

Provides a configured TreeView debugging tool (React dependent)
as an output component with configurable class names.

## Functions

### TreeViewExtensionComponent() {#treeviewextensioncomponent}

> **TreeViewExtensionComponent**(`props`): `Element`

Defined in: [packages/lexical-react/src/TreeViewExtension.tsx:17](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/TreeViewExtension.tsx#L17)

#### Parameters

##### props

`Partial`\<[`TreeViewConfig`](#treeviewconfig)\>

#### Returns

`Element`
