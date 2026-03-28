# @lexical/dragon

## Interfaces

### DragonConfig {#dragonconfig}

Defined in: [packages/lexical-dragon/src/index.ts:130](https://github.com/facebook/lexical/tree/main/packages/lexical-dragon/src/index.ts#L130)

#### Properties

##### disabled {#disabled}

> **disabled**: `boolean`

Defined in: [packages/lexical-dragon/src/index.ts:131](https://github.com/facebook/lexical/tree/main/packages/lexical-dragon/src/index.ts#L131)

## Variables

### DragonExtension {#dragonextension}

> `const` **DragonExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<[`DragonConfig`](#dragonconfig), `"@lexical/dragon"`, [`NamedSignalsOutput`](lexical_extension.md#namedsignalsoutput)\<[`DragonConfig`](#dragonconfig)\>, `unknown`\>

Defined in: [packages/lexical-dragon/src/index.ts:138](https://github.com/facebook/lexical/tree/main/packages/lexical-dragon/src/index.ts#L138)

Add Dragon speech to text input support to the editor, via the
@lexical/dragon module.

## Functions

### registerDragonSupport() {#registerdragonsupport}

> **registerDragonSupport**(`editor`): () => `void`

Defined in: [packages/lexical-dragon/src/index.ts:19](https://github.com/facebook/lexical/tree/main/packages/lexical-dragon/src/index.ts#L19)

#### Parameters

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

#### Returns

> (): `void`

##### Returns

`void`
