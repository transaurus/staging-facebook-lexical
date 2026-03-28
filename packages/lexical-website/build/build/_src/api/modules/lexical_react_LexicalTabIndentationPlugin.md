# @lexical/react/LexicalTabIndentationPlugin

## Functions

### TabIndentationPlugin() {#tabindentationplugin}

> **TabIndentationPlugin**(`__namedParameters`): `null`

Defined in: [packages/lexical-react/src/LexicalTabIndentationPlugin.tsx:23](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTabIndentationPlugin.tsx#L23)

This plugin adds the ability to indent content using the tab key. Generally, we don't
recommend using this plugin as it could negatively affect accessibility for keyboard
users, causing focus to become trapped within the editor.

#### Parameters

##### \_\_namedParameters

###### $canIndent?

[`CanIndentPredicate`](lexical_extension.md#canindentpredicate)

By default, indents are set on all elements for which the ElementNode.canIndent returns true.
This option allows you to set indents for specific nodes without overriding the method for others.

###### maxIndent?

`number`

#### Returns

`null`

## References

### registerTabIndentation {#registertabindentation}

Re-exports [registerTabIndentation](lexical_extension.md#registertabindentation)
