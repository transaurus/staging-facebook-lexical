# @lexical/react/useExtensionComponent

## Functions

### useExtensionComponent() {#useextensioncomponent}

> **useExtensionComponent**\<`Props`, `OutputComponent`, `Extension`\>(`extension`): `OutputComponent`

Defined in: [packages/lexical-react/src/useExtensionComponent.tsx:52](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/useExtensionComponent.tsx#L52)

Use a Component from the given Extension that uses the ReactExtension convention
of exposing a Component property in its output.

#### Type Parameters

##### Props

`Props` *extends* `Record`\<`never`, `never`\>

##### OutputComponent

`OutputComponent` *extends* `ComponentType`\<`Props`\>

##### Extension

`Extension` *extends* [`OutputComponentExtension`](lexical.md#outputcomponentextension)\<`OutputComponent`\>

#### Parameters

##### extension

`Extension`

An extension with a Component property in the output

#### Returns

`OutputComponent`

`getExtensionConfigFromEditor(useLexicalComposerContext()[0], extension).Component`

***

### useExtensionDependency() {#useextensiondependency}

> **useExtensionDependency**\<`Extension`\>(`extension`): [`LexicalExtensionDependency`](lexical.md#lexicalextensiondependency)\<`Extension`\>

Defined in: [packages/lexical-react/src/useExtensionComponent.tsx:19](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/useExtensionComponent.tsx#L19)

#### Type Parameters

##### Extension

`Extension` *extends* [`AnyLexicalExtension`](lexical.md#anylexicalextension)

#### Parameters

##### extension

`Extension`

#### Returns

[`LexicalExtensionDependency`](lexical.md#lexicalextensiondependency)\<`Extension`\>

***

### useOptionalExtensionDependency() {#useoptionalextensiondependency}

> **useOptionalExtensionDependency**\<`Extension`\>(`extension`): `undefined` \| [`LexicalExtensionDependency`](lexical.md#lexicalextensiondependency)\<`Extension`\>

Defined in: [packages/lexical-react/src/useExtensionComponent.tsx:28](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/useExtensionComponent.tsx#L28)

#### Type Parameters

##### Extension

`Extension` *extends* [`AnyLexicalExtension`](lexical.md#anylexicalextension)

#### Parameters

##### extension

`Extension`

#### Returns

`undefined` \| [`LexicalExtensionDependency`](lexical.md#lexicalextensiondependency)\<`Extension`\>

***

### usePeerExtensionDependency() {#usepeerextensiondependency}

> **usePeerExtensionDependency**\<`Extension`\>(`extensionName`): `undefined` \| [`LexicalExtensionDependency`](lexical.md#lexicalextensiondependency)\<`Extension`\>

Defined in: [packages/lexical-react/src/useExtensionComponent.tsx:34](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/useExtensionComponent.tsx#L34)

#### Type Parameters

##### Extension

`Extension` *extends* [`AnyLexicalExtension`](lexical.md#anylexicalextension)

#### Parameters

##### extensionName

`Extension`\[`"name"`\]

#### Returns

`undefined` \| [`LexicalExtensionDependency`](lexical.md#lexicalextensiondependency)\<`Extension`\>
