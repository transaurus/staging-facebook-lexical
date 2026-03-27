# @lexical/react/useLexicalSubscription

## Type Aliases

### LexicalSubscription {#lexicalsubscription}

> **LexicalSubscription**\<`T`\> = `object`

Defined in: [packages/lexical-react/src/useLexicalSubscription.tsx:15](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/useLexicalSubscription.tsx#L15)

#### Type Parameters

##### T

`T`

#### Properties

##### initialValueFn() {#initialvaluefn}

> **initialValueFn**: () => `T`

Defined in: [packages/lexical-react/src/useLexicalSubscription.tsx:16](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/useLexicalSubscription.tsx#L16)

###### Returns

`T`

##### subscribe() {#subscribe}

> **subscribe**: (`callback`) => () => `void`

Defined in: [packages/lexical-react/src/useLexicalSubscription.tsx:17](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/useLexicalSubscription.tsx#L17)

###### Parameters

###### callback

(`value`) => `void`

###### Returns

> (): `void`

###### Returns

`void`

## Functions

### useLexicalSubscription() {#uselexicalsubscription}

> **useLexicalSubscription**\<`T`\>(`subscription`): `T`

Defined in: [packages/lexical-react/src/useLexicalSubscription.tsx:24](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/useLexicalSubscription.tsx#L24)

Shortcut to Lexical subscriptions when values are used for render.

#### Type Parameters

##### T

`T`

#### Parameters

##### subscription

(`editor`) => [`LexicalSubscription`](#lexicalsubscription)\<`T`\>

The function to create the [LexicalSubscription](#lexicalsubscription). This function's identity must be stable (e.g. defined at module scope or with useCallback).

#### Returns

`T`
