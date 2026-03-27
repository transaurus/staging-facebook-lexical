# @lexical/react/useLexicalNodeSelection

## Functions

### useLexicalNodeSelection() {#uselexicalnodeselection}

> **useLexicalNodeSelection**(`key`): \[`boolean`, (`selected`) => `void`, () => `void`\]

Defined in: [packages/lexical-react/src/useLexicalNodeSelection.ts:57](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/useLexicalNodeSelection.ts#L57)

A custom hook to manage the selection state of a specific node in a Lexical editor.

This hook provides utilities to:
- Check if a node is selected.
- Update its selection state.
- Clear the selection.

#### Parameters

##### key

`string`

The key of the node to track selection for.

#### Returns

\[`boolean`, (`selected`) => `void`, () => `void`\]

A tuple containing:
- `isSelected` (boolean): Whether the node is currently selected.
- `setSelected` (function): A function to set the selection state of the node.
- `clearSelected` (function): A function to clear the selection of the node.
