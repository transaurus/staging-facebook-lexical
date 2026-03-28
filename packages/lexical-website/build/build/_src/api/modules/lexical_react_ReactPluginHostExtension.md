# @lexical/react/ReactPluginHostExtension

## Interfaces

### DecoratorComponentProps {#decoratorcomponentprops}

Defined in: [packages/lexical-react/src/shared/types.ts:21](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/types.ts#L21)

#### Properties

##### context {#context}

> **context**: [`LexicalComposerContextWithEditor`](lexical_react_LexicalComposerContext.md#lexicalcomposercontextwitheditor)

Defined in: [packages/lexical-react/src/shared/types.ts:22](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/types.ts#L22)

***

### HostMountCommandArg {#hostmountcommandarg}

Defined in: [packages/lexical-react/src/ReactPluginHostExtension.tsx:38](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/ReactPluginHostExtension.tsx#L38)

#### Properties

##### root {#root}

> **root**: `Root`

Defined in: [packages/lexical-react/src/ReactPluginHostExtension.tsx:39](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/ReactPluginHostExtension.tsx#L39)

***

### MountPluginCommandArg {#mountplugincommandarg}

Defined in: [packages/lexical-react/src/ReactPluginHostExtension.tsx:42](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/ReactPluginHostExtension.tsx#L42)

#### Properties

##### domNode? {#domnode}

> `optional` **domNode**: `null` \| `Element` \| `DocumentFragment`

Defined in: [packages/lexical-react/src/ReactPluginHostExtension.tsx:45](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/ReactPluginHostExtension.tsx#L45)

##### element {#element}

> **element**: `null` \| `Element`

Defined in: [packages/lexical-react/src/ReactPluginHostExtension.tsx:44](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/ReactPluginHostExtension.tsx#L44)

##### key {#key}

> **key**: `string`

Defined in: [packages/lexical-react/src/ReactPluginHostExtension.tsx:43](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/ReactPluginHostExtension.tsx#L43)

## Variables

### REACT\_PLUGIN\_HOST\_MOUNT\_PLUGIN\_COMMAND {#react_plugin_host_mount_plugin_command}

> `const` **REACT\_PLUGIN\_HOST\_MOUNT\_PLUGIN\_COMMAND**: [`LexicalCommand`](lexical.md#lexicalcommand)\<[`MountPluginCommandArg`](#mountplugincommandarg)\>

Defined in: [packages/lexical-react/src/ReactPluginHostExtension.tsx:113](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/ReactPluginHostExtension.tsx#L113)

***

### REACT\_PLUGIN\_HOST\_MOUNT\_ROOT\_COMMAND {#react_plugin_host_mount_root_command}

> `const` **REACT\_PLUGIN\_HOST\_MOUNT\_ROOT\_COMMAND**: [`LexicalCommand`](lexical.md#lexicalcommand)\<[`HostMountCommandArg`](#hostmountcommandarg)\>

Defined in: [packages/lexical-react/src/ReactPluginHostExtension.tsx:111](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/ReactPluginHostExtension.tsx#L111)

***

### ReactPluginHostExtension {#reactpluginhostextension}

> `const` **ReactPluginHostExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<[`ExtensionConfigBase`](lexical.md#extensionconfigbase), `"@lexical/react/ReactPluginHost"`, \{ `mountedPluginsStore`: [`Signal`](lexical_extension.md#signal)\<\{ `plugins`: `Map`\<`string`, [`MountPluginCommandArg`](#mountplugincommandarg)\>; \}\>; `mountReactPlugin`: (`arg`) => `void`; `mountReactPluginHost`: (`container`) => `boolean`; \}, `unknown`\>

Defined in: [packages/lexical-react/src/ReactPluginHostExtension.tsx:164](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/ReactPluginHostExtension.tsx#L164)

This extension provides a React host for editors that are not built
with LexicalExtensionComposer (e.g. you are using Vanilla JS or some
other framework).

You must use [mountReactPluginHost](#mountreactpluginhost) for any React content to work.
Afterwards, you may use [mountReactExtensionComponent](#mountreactextensioncomponent) to
render UI for a specific React Extension.
[mountReactPluginComponent](#mountreactplugincomponent) and
[mountReactPluginElement](#mountreactpluginelement) can be used to render
legacy React plug-ins (or any React content).

## Functions

### mountReactExtensionComponent() {#mountreactextensioncomponent}

> **mountReactExtensionComponent**\<`Extension`\>(`editor`, `opts`): `void`

Defined in: [packages/lexical-react/src/ReactPluginHostExtension.tsx:48](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/ReactPluginHostExtension.tsx#L48)

#### Type Parameters

##### Extension

`Extension` *extends* [`AnyLexicalExtension`](lexical.md#anylexicalextension)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### opts

`object` & `Omit`\<[`MountPluginCommandArg`](#mountplugincommandarg), `"element"`\>

#### Returns

`void`

***

### mountReactPluginComponent() {#mountreactplugincomponent}

> **mountReactPluginComponent**\<`P`\>(`editor`, `opts`): `void`

Defined in: [packages/lexical-react/src/ReactPluginHostExtension.tsx:75](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/ReactPluginHostExtension.tsx#L75)

#### Type Parameters

##### P

`P` *extends* `Record`\<`never`, `never`\> = `Record`\<`never`, `never`\>

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### opts

`object` & `Omit`\<[`MountPluginCommandArg`](#mountplugincommandarg), `"element"`\>

#### Returns

`void`

***

### mountReactPluginElement() {#mountreactpluginelement}

> **mountReactPluginElement**(`editor`, `opts`): `void`

Defined in: [packages/lexical-react/src/ReactPluginHostExtension.tsx:91](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/ReactPluginHostExtension.tsx#L91)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### opts

[`MountPluginCommandArg`](#mountplugincommandarg)

#### Returns

`void`

***

### mountReactPluginHost() {#mountreactpluginhost}

> **mountReactPluginHost**(`editor`, `container`): `void`

Defined in: [packages/lexical-react/src/ReactPluginHostExtension.tsx:101](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/ReactPluginHostExtension.tsx#L101)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

##### container

`Container`

#### Returns

`void`
