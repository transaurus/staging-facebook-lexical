# @lexical/eslint-plugin

## Interfaces

### FlatConfig {#flatconfig}

Defined in: [packages/lexical-eslint-plugin/src/index.ts:29](https://github.com/facebook/lexical/tree/main/packages/lexical-eslint-plugin/src/index.ts#L29)

#### Properties

##### plugins {#plugins}

> **plugins**: `object`

Defined in: [packages/lexical-eslint-plugin/src/index.ts:30](https://github.com/facebook/lexical/tree/main/packages/lexical-eslint-plugin/src/index.ts#L30)

###### @lexical

> **@lexical**: [`Plugin`](#plugin)

##### rules {#rules}

> **rules**: `object`

Defined in: [packages/lexical-eslint-plugin/src/index.ts:33](https://github.com/facebook/lexical/tree/main/packages/lexical-eslint-plugin/src/index.ts#L33)

###### @lexical/rules-of-lexical

> **@lexical/rules-of-lexical**: `"warn"` \| `"error"` \| `"off"`

***

### LegacyConfig {#legacyconfig}

Defined in: [packages/lexical-eslint-plugin/src/index.ts:21](https://github.com/facebook/lexical/tree/main/packages/lexical-eslint-plugin/src/index.ts#L21)

#### Properties

##### plugins {#plugins-1}

> **plugins**: `string`[]

Defined in: [packages/lexical-eslint-plugin/src/index.ts:22](https://github.com/facebook/lexical/tree/main/packages/lexical-eslint-plugin/src/index.ts#L22)

##### rules {#rules-1}

> **rules**: `object`

Defined in: [packages/lexical-eslint-plugin/src/index.ts:23](https://github.com/facebook/lexical/tree/main/packages/lexical-eslint-plugin/src/index.ts#L23)

###### @lexical/rules-of-lexical

> **@lexical/rules-of-lexical**: `"warn"` \| `"error"` \| `"off"`

***

### Plugin {#plugin}

Defined in: [packages/lexical-eslint-plugin/src/index.ts:38](https://github.com/facebook/lexical/tree/main/packages/lexical-eslint-plugin/src/index.ts#L38)

#### Properties

##### configs {#configs}

> **configs**: `object`

Defined in: [packages/lexical-eslint-plugin/src/index.ts:46](https://github.com/facebook/lexical/tree/main/packages/lexical-eslint-plugin/src/index.ts#L46)

###### all

> **all**: [`LegacyConfig`](#legacyconfig)

###### flat/all

> **flat/all**: [`FlatConfig`](#flatconfig)

###### flat/recommended

> **flat/recommended**: [`FlatConfig`](#flatconfig)

###### legacy-all

> **legacy-all**: [`LegacyConfig`](#legacyconfig)

###### legacy-recommended

> **legacy-recommended**: [`LegacyConfig`](#legacyconfig)

###### recommended

> **recommended**: [`LegacyConfig`](#legacyconfig)

##### meta {#meta}

> **meta**: `object`

Defined in: [packages/lexical-eslint-plugin/src/index.ts:39](https://github.com/facebook/lexical/tree/main/packages/lexical-eslint-plugin/src/index.ts#L39)

###### name

> **name**: `string`

###### version

> **version**: `string`

##### rules {#rules-2}

> **rules**: `object`

Defined in: [packages/lexical-eslint-plugin/src/index.ts:43](https://github.com/facebook/lexical/tree/main/packages/lexical-eslint-plugin/src/index.ts#L43)

###### rules-of-lexical

> **rules-of-lexical**: `RuleModule`

## Type Aliases

### RulesOfLexicalOptions {#rulesoflexicaloptions}

> **RulesOfLexicalOptions**\<\> = `Partial`\<`BaseMatchers`\<`ToMatcher` \| `ToMatcher`[]\>\>

Defined in: [packages/lexical-eslint-plugin/src/rules/rules-of-lexical.js:87](https://github.com/facebook/lexical/tree/main/packages/lexical-eslint-plugin/src/rules/rules-of-lexical.js#L87)

#### Type Parameters

## Variables

### plugin {#plugin-1}

> `const` **plugin**: [`Plugin`](#plugin) = `jsPlugin`

Defined in: [packages/lexical-eslint-plugin/src/index.ts:58](https://github.com/facebook/lexical/tree/main/packages/lexical-eslint-plugin/src/index.ts#L58)
