# @lexical/react/LexicalTreeView

## Functions

### TreeView() {#treeview}

> **TreeView**(`props`): `Element`

Defined in: [packages/lexical-react/src/LexicalTreeView.tsx:40](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTreeView.tsx#L40)

TreeView is a React component that provides a visual representation of
the Lexical editor's state and enables debugging features like time travel
and custom tree node rendering.

#### Parameters

##### props

The properties passed to the TreeView component.

###### customPrintNode?

[`CustomPrintNodeFn`](lexical_devtools-core.md#customprintnodefn)

A function for customizing the display of nodes in the tree.

###### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

The Lexical editor instance to be visualized and debugged.

###### timeTravelButtonClassName?

`string`

Custom class name for the time travel toggle button.

###### timeTravelPanelButtonClassName?

`string`

Custom class name for buttons inside the time travel panel.

###### timeTravelPanelClassName?

`string`

Custom class name for the overall time travel panel container.

###### timeTravelPanelSliderClassName?

`string`

Custom class name for the time travel slider in the panel.

###### treeTypeButtonClassName?

`string`

Custom class name for the tree type toggle button.

###### viewClassName?

`string`

Custom class name for the tree view container.

#### Returns

`Element`

- A React element that visualizes the editor's state and supports debugging interactions.
