# @lexical/react/ReactExtension

## Interfaces

### EditorChildrenComponentProps {#editorchildrencomponentprops}

Defined in: [packages/lexical-react/src/shared/types.ts:11](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/types.ts#L11)

#### Properties

##### children? {#children}

> `optional` **children**: `ReactNode`

Defined in: [packages/lexical-react/src/shared/types.ts:14](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/types.ts#L14)

##### contentEditable {#contenteditable}

> **contentEditable**: `null` \| `Element`

Defined in: [packages/lexical-react/src/shared/types.ts:13](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/types.ts#L13)

##### context {#context}

> **context**: [`LexicalComposerContextWithEditor`](lexical_react_LexicalComposerContext.md#lexicalcomposercontextwitheditor)

Defined in: [packages/lexical-react/src/shared/types.ts:12](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/types.ts#L12)

***

### ReactConfig {#reactconfig}

Defined in: [packages/lexical-react/src/shared/types.ts:52](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/types.ts#L52)

#### Properties

##### contentEditable {#contenteditable-1}

> **contentEditable**: `null` \| `Element`

Defined in: [packages/lexical-react/src/shared/types.ts:60](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/types.ts#L60)

The default root element of the editor as JSX. Uses `<ContentEditable />`
from @lexical/react/ContentEditable by default,
but may be null or another component.

This component is responsible for calling `editor.setRootElement(elem)`.

##### decorators {#decorators}

> **decorators**: readonly `DecoratorComponentType`[]

Defined in: [packages/lexical-react/src/shared/types.ts:80](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/types.ts#L80)

An array of JSX or components that return JSX that should be rendered
as children of Component. These will be merged by array concatenation.

##### EditorChildrenComponent {#editorchildrencomponent}

> **EditorChildrenComponent**: `EditorChildrenComponentType`

Defined in: [packages/lexical-react/src/shared/types.ts:74](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/types.ts#L74)

The component that renders the children of the editor context, by default
it is [DefaultEditorChildrenComponent](#defaulteditorchildrencomponent) which takes the given props
and renders them in this order:

- contentEditable
- children

##### ErrorBoundary {#errorboundary}

> **ErrorBoundary**: `ErrorBoundaryType`

Defined in: [packages/lexical-react/src/shared/types.ts:65](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/types.ts#L65)

The ErrorBoundary used for rendering decorators in the editor. By default
it is `ErrorBoundary` from @lexical/react/ErrorBoundary.

***

### ReactOutputs {#reactoutputs}

Defined in: [packages/lexical-react/src/shared/types.ts:83](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/types.ts#L83)

#### Properties

##### Component {#component}

> **Component**: `EditorComponentType`

Defined in: [packages/lexical-react/src/shared/types.ts:92](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/types.ts#L92)

The editor component, this can be used by Extensions that depend on this to
render the editor such as ReactPluginHostExtension or internally by
LexicalExtensionComposer.

All props have defaults based on the config and editor state, but may be
overridden.

##### context {#context-1}

> **context**: [`LexicalComposerContextWithEditor`](lexical_react_LexicalComposerContext.md#lexicalcomposercontextwitheditor)

Defined in: [packages/lexical-react/src/shared/types.ts:96](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/types.ts#L96)

This is equivalent to useLexicalComposerContext() from @lexical/react/LexicalComposerContext.

## Variables

### ReactExtension {#reactextension}

> `const` **ReactExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<[`ReactConfig`](#reactconfig), `"@lexical/react/React"`, \{ `Component`: (`props`) => `Element`; `context`: [`LexicalComposerContextWithEditor`](lexical_react_LexicalComposerContext.md#lexicalcomposercontextwitheditor); \}, `unknown`\>

Defined in: [packages/lexical-react/src/ReactExtension.tsx:75](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/ReactExtension.tsx#L75)

An extension to use or configure React for use with Lexical. In an editor, you
would typically use LexicalExtensionComposer (for React projects) or
ReactPluginHostExtension (to use React Extensions and plug-ins in a non-React
project).

See [ReactConfig](#reactconfig) for more detailed exextensionations of how to use
the config for this Extension.

For an Extension developer, you can defineConfig() override the extension with
decorators to add JSX inside the editor context that is not
location-dependent (e.g. floating UI that does not need to be mounted in
some specific location, or effects that return null).

## Functions

### DefaultEditorChildrenComponent() {#defaulteditorchildrencomponent}

> **DefaultEditorChildrenComponent**(`__namedParameters`): `Element`

Defined in: [packages/lexical-react/src/ReactExtension.tsx:42](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/ReactExtension.tsx#L42)

#### Parameters

##### \_\_namedParameters

[`EditorChildrenComponentProps`](#editorchildrencomponentprops)

#### Returns

`Element`

#### Example

The default EditorChildrenComponent implementation
```jsx
return (
  <>
    {contentEditable}
    {children}
  </>
);
```
