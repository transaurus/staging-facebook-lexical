# @lexical/react/LexicalCollaborationContext

## Type Aliases

### CollaborationContextType {#collaborationcontexttype}

> **CollaborationContextType** = `object`

Defined in: [packages/lexical-react/src/LexicalCollaborationContext.tsx:14](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalCollaborationContext.tsx#L14)

#### Properties

##### color {#color}

> **color**: `string`

Defined in: [packages/lexical-react/src/LexicalCollaborationContext.tsx:15](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalCollaborationContext.tsx#L15)

##### isCollabActive {#iscollabactive}

> **isCollabActive**: `boolean`

Defined in: [packages/lexical-react/src/LexicalCollaborationContext.tsx:16](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalCollaborationContext.tsx#L16)

##### name {#name}

> **name**: `string`

Defined in: [packages/lexical-react/src/LexicalCollaborationContext.tsx:17](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalCollaborationContext.tsx#L17)

##### yjsDocMap {#yjsdocmap}

> **yjsDocMap**: `Map`\<`string`, `Doc`\>

Defined in: [packages/lexical-react/src/LexicalCollaborationContext.tsx:18](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalCollaborationContext.tsx#L18)

## Variables

### CollaborationContext {#collaborationcontext}

> `const` **CollaborationContext**: `Context`\<`null` \| [`CollaborationContextType`](#collaborationcontexttype)\>

Defined in: [packages/lexical-react/src/LexicalCollaborationContext.tsx:42](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalCollaborationContext.tsx#L42)

## Functions

### LexicalCollaboration() {#lexicalcollaboration}

> **LexicalCollaboration**(`__namedParameters`): `Element`

Defined in: [packages/lexical-react/src/LexicalCollaborationContext.tsx:58](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalCollaborationContext.tsx#L58)

#### Parameters

##### \_\_namedParameters

###### children

`ReactNode`

#### Returns

`Element`

***

### useCollaborationContext() {#usecollaborationcontext}

> **useCollaborationContext**(`username?`, `color?`): [`CollaborationContextType`](#collaborationcontexttype)

Defined in: [packages/lexical-react/src/LexicalCollaborationContext.tsx:68](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalCollaborationContext.tsx#L68)

#### Parameters

##### username?

`string`

##### color?

`string`

#### Returns

[`CollaborationContextType`](#collaborationcontexttype)
