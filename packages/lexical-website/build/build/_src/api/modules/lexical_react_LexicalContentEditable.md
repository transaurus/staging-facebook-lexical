# @lexical/react/LexicalContentEditable

## Type Aliases

### ContentEditableElementProps {#contenteditableelementprops}

> **ContentEditableElementProps** = `object` & `Omit`\<`React.AllHTMLAttributes`\<`HTMLDivElement`\>, `"placeholder"`\>

Defined in: [packages/lexical-react/src/shared/LexicalContentEditableElement.tsx:18](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/LexicalContentEditableElement.tsx#L18)

#### Type Declaration

##### ariaActiveDescendant?

> `optional` **ariaActiveDescendant**: `React.AriaAttributes`\[`"aria-activedescendant"`\]

##### ariaAutoComplete?

> `optional` **ariaAutoComplete**: `React.AriaAttributes`\[`"aria-autocomplete"`\]

##### ariaControls?

> `optional` **ariaControls**: `React.AriaAttributes`\[`"aria-controls"`\]

##### ariaDescribedBy?

> `optional` **ariaDescribedBy**: `React.AriaAttributes`\[`"aria-describedby"`\]

##### ariaErrorMessage?

> `optional` **ariaErrorMessage**: `React.AriaAttributes`\[`"aria-errormessage"`\]

##### ariaExpanded?

> `optional` **ariaExpanded**: `React.AriaAttributes`\[`"aria-expanded"`\]

##### ariaInvalid?

> `optional` **ariaInvalid**: `React.AriaAttributes`\[`"aria-invalid"`\]

##### ariaLabel?

> `optional` **ariaLabel**: `React.AriaAttributes`\[`"aria-label"`\]

##### ariaLabelledBy?

> `optional` **ariaLabelledBy**: `React.AriaAttributes`\[`"aria-labelledby"`\]

##### ariaMultiline?

> `optional` **ariaMultiline**: `React.AriaAttributes`\[`"aria-multiline"`\]

##### ariaOwns?

> `optional` **ariaOwns**: `React.AriaAttributes`\[`"aria-owns"`\]

##### ariaRequired?

> `optional` **ariaRequired**: `React.AriaAttributes`\[`"aria-required"`\]

##### autoCapitalize?

> `optional` **autoCapitalize**: `HTMLDivElement`\[`"autocapitalize"`\]

##### data-testid?

> `optional` **data-testid**: `string` \| `null`

##### editor

> **editor**: [`LexicalEditor`](lexical.md#lexicaleditor)

***

### ContentEditableProps {#contenteditableprops}

> **ContentEditableProps** = `Omit`\<[`ContentEditableElementProps`](#contenteditableelementprops), `"editor"`\> & \{ `aria-placeholder?`: `void`; `placeholder?`: `null`; \} \| \{ `aria-placeholder`: `string`; `placeholder`: (`isEditable`) => `null` \| `JSX.Element` \| `JSX.Element`; \}

Defined in: [packages/lexical-react/src/LexicalContentEditable.tsx:23](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalContentEditable.tsx#L23)

***

### ~~Props~~ {#props}

> **Props** = [`ContentEditableProps`](#contenteditableprops)

Defined in: [packages/lexical-react/src/LexicalContentEditable.tsx:44](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalContentEditable.tsx#L44)

#### Deprecated

This type has been renamed to `ContentEditableProps` to provide a clearer and more descriptive name.
For backward compatibility, this type is still exported as `Props`, but it is recommended to migrate to using `ContentEditableProps` instead.

This alias is maintained for compatibility purposes but may be removed in future versions.
Please update your codebase to use `ContentEditableProps` to ensure long-term maintainability.

## Variables

### ContentEditable {#contenteditable}

> `const` **ContentEditable**: `ForwardRefExoticComponent`\<[`ContentEditableProps`](#contenteditableprops) & `RefAttributes`\<`HTMLDivElement`\>\>

Defined in: [packages/lexical-react/src/LexicalContentEditable.tsx:46](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalContentEditable.tsx#L46)

***

### ContentEditableElement {#contenteditableelement}

> `const` **ContentEditableElement**: `ForwardRefExoticComponent`\<`object` & `Omit`\<`AllHTMLAttributes`\<`HTMLDivElement`\>, `"placeholder"`\> & `RefAttributes`\<`HTMLDivElement`\>\>

Defined in: [packages/lexical-react/src/shared/LexicalContentEditableElement.tsx:126](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/LexicalContentEditableElement.tsx#L126)
