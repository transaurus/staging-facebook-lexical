# @lexical/react/ExtensionComponent

## Type Aliases

### ExtensionComponentProps {#extensioncomponentprops}

> **ExtensionComponentProps**\<`Extension`\> = `object` & \[[`LexicalExtensionOutput`](lexical.md#lexicalextensionoutput-1)\<`Extension`\>\] *extends* \[\{ `Component`: infer OutputComponentType; \}\] ? `Omit`\<`ComponentProps`\<`OutputComponentType`\>, `"lexical:extension"`\> : `never`

Defined in: [packages/lexical-react/src/ExtensionComponent.tsx:17](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/ExtensionComponent.tsx#L17)

The lexical:extension prop combined with the props of the given Extension's
output Component.

#### Type Declaration

##### lexical:extension

> **lexical:extension**: `Extension`

The Extension

#### Type Parameters

##### Extension

`Extension` *extends* [`AnyLexicalExtension`](lexical.md#anylexicalextension)

## Functions

### ExtensionComponent() {#extensioncomponent}

> **ExtensionComponent**\<`Extension`\>(`__namedParameters`): `Element`

Defined in: [packages/lexical-react/src/ExtensionComponent.tsx:51](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/ExtensionComponent.tsx#L51)

A convenient way to get an Extension's output Component with [useExtensionComponent](lexical_react_useExtensionComponent.md#useextensioncomponent)
and construct it in one step.

#### Type Parameters

##### Extension

`Extension` *extends* [`AnyLexicalExtension`](lexical.md#anylexicalextension)

#### Parameters

##### \_\_namedParameters

[`ExtensionComponentProps`](#extensioncomponentprops)\<`Extension`\>

#### Returns

`Element`

#### Examples

Usage
```tsx
return (
  <ExtensionComponent
    lexical:extension={TreeViewExtension}
    viewClassName="tree-view-output" />
);
```

Alternative without ExtensionComponent
```tsx
const TreeViewComponent = useExtensionComponent(TreeViewExtension);
return (<TreeViewComponent viewClassName="tree-view-output" />);
```
