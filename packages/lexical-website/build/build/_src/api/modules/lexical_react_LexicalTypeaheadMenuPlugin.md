# @lexical/react/LexicalTypeaheadMenuPlugin

## Type Aliases

### MenuTextMatch {#menutextmatch}

> **MenuTextMatch** = `object`

Defined in: [packages/lexical-react/src/shared/LexicalMenu.tsx:41](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/LexicalMenu.tsx#L41)

#### Properties

##### leadOffset {#leadoffset}

> **leadOffset**: `number`

Defined in: [packages/lexical-react/src/shared/LexicalMenu.tsx:42](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/LexicalMenu.tsx#L42)

##### matchingString {#matchingstring}

> **matchingString**: `string`

Defined in: [packages/lexical-react/src/shared/LexicalMenu.tsx:43](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/LexicalMenu.tsx#L43)

##### replaceableString {#replaceablestring}

> **replaceableString**: `string`

Defined in: [packages/lexical-react/src/shared/LexicalMenu.tsx:44](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/LexicalMenu.tsx#L44)

***

### TriggerFn() {#triggerfn}

> **TriggerFn** = (`text`, `editor`) => [`MenuTextMatch`](#menutextmatch) \| `null`

Defined in: [packages/lexical-react/src/shared/LexicalMenu.tsx:732](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/LexicalMenu.tsx#L732)

#### Parameters

##### text

`string`

##### editor

[`LexicalEditor`](lexical.md#lexicaleditor)

#### Returns

[`MenuTextMatch`](#menutextmatch) \| `null`

***

### TypeaheadMenuPluginProps {#typeaheadmenupluginprops}

> **TypeaheadMenuPluginProps**\<`TOption`\> = `object`

Defined in: [packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx:196](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx#L196)

#### Type Parameters

##### TOption

`TOption` *extends* [`MenuOption`](lexical_react_LexicalNodeMenuPlugin.md#menuoption)

#### Properties

##### anchorClassName? {#anchorclassname}

> `optional` **anchorClassName**: `string`

Defined in: [packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx:209](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx#L209)

##### commandPriority? {#commandpriority}

> `optional` **commandPriority**: [`CommandListenerPriority`](lexical.md#commandlistenerpriority)

Defined in: [packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx:210](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx#L210)

##### ignoreEntityBoundary? {#ignoreentityboundary}

> `optional` **ignoreEntityBoundary**: `boolean`

Defined in: [packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx:213](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx#L213)

##### menuRenderFn? {#menurenderfn}

> `optional` **menuRenderFn**: [`MenuRenderFn`](lexical_react_LexicalNodeMenuPlugin.md#menurenderfn)\<`TOption`\>

Defined in: [packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx:206](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx#L206)

##### onClose()? {#onclose}

> `optional` **onClose**: () => `void`

Defined in: [packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx:208](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx#L208)

###### Returns

`void`

##### onOpen()? {#onopen}

> `optional` **onOpen**: (`resolution`) => `void`

Defined in: [packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx:207](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx#L207)

###### Parameters

###### resolution

[`MenuResolution`](lexical_react_LexicalNodeMenuPlugin.md#menuresolution)

###### Returns

`void`

##### onQueryChange() {#onquerychange}

> **onQueryChange**: (`matchingString`) => `void`

Defined in: [packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx:197](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx#L197)

###### Parameters

###### matchingString

`string` | `null`

###### Returns

`void`

##### onSelectOption() {#onselectoption}

> **onSelectOption**: (`option`, `textNodeContainingQuery`, `closeMenu`, `matchingString`) => `void`

Defined in: [packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx:198](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx#L198)

###### Parameters

###### option

`TOption`

###### textNodeContainingQuery

[`TextNode`](lexical.md#textnode) | `null`

###### closeMenu

() => `void`

###### matchingString

`string`

###### Returns

`void`

##### options {#options}

> **options**: `TOption`[]

Defined in: [packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx:204](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx#L204)

##### parent? {#parent}

> `optional` **parent**: `HTMLElement`

Defined in: [packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx:211](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx#L211)

##### preselectFirstItem? {#preselectfirstitem}

> `optional` **preselectFirstItem**: `boolean`

Defined in: [packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx:212](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx#L212)

##### triggerFn {#triggerfn-1}

> **triggerFn**: [`TriggerFn`](#triggerfn)

Defined in: [packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx:205](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx#L205)

## Variables

### PUNCTUATION {#punctuation}

> `const` **PUNCTUATION**: "\\.,\\+\\\*\\?\\$\\@\\\|#\{\}\\(\\)\\^\\-\\\[\\\]\\\\/!%'\"~=\<\>\_:;" = `'\\.,\\+\\*\\?\\$\\@\\|#{}\\(\\)\\^\\-\\[\\]\\\\/!%\'"~=<>_:;'`

Defined in: [packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx:36](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx#L36)

***

### SCROLL\_TYPEAHEAD\_OPTION\_INTO\_VIEW\_COMMAND {#scroll_typeahead_option_into_view_command}

> `const` **SCROLL\_TYPEAHEAD\_OPTION\_INTO\_VIEW\_COMMAND**: [`LexicalCommand`](lexical.md#lexicalcommand)\<\{ `index`: `number`; `option`: [`MenuOption`](lexical_react_LexicalNodeMenuPlugin.md#menuoption); \}\>

Defined in: [packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx:143](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx#L143)

## Functions

### getScrollParent() {#getscrollparent}

> **getScrollParent**(`element`, `includeHidden`): `HTMLElement` \| `HTMLBodyElement`

Defined in: [packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx:111](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx#L111)

#### Parameters

##### element

`HTMLElement`

##### includeHidden

`boolean`

#### Returns

`HTMLElement` \| `HTMLBodyElement`

***

### LexicalTypeaheadMenuPlugin() {#lexicaltypeaheadmenuplugin}

> **LexicalTypeaheadMenuPlugin**\<`TOption`\>(`__namedParameters`): `null` \| `Element`

Defined in: [packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx:216](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx#L216)

#### Type Parameters

##### TOption

`TOption` *extends* [`MenuOption`](lexical_react_LexicalNodeMenuPlugin.md#menuoption)

#### Parameters

##### \_\_namedParameters

[`TypeaheadMenuPluginProps`](#typeaheadmenupluginprops)\<`TOption`\>

#### Returns

`null` \| `Element`

***

### useBasicTypeaheadTriggerMatch() {#usebasictypeaheadtriggermatch}

> **useBasicTypeaheadTriggerMatch**(`trigger`, `__namedParameters`): [`TriggerFn`](#triggerfn)

Defined in: [packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx:148](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/LexicalTypeaheadMenuPlugin.tsx#L148)

#### Parameters

##### trigger

`string`

##### \_\_namedParameters

###### allowWhitespace?

`boolean` = `false`

###### maxLength?

`number` = `75`

###### minLength?

`number` = `1`

###### punctuation?

`string` = `PUNCTUATION`

#### Returns

[`TriggerFn`](#triggerfn)

***

### useDynamicPositioning() {#usedynamicpositioning}

> **useDynamicPositioning**(`resolution`, `targetElement`, `onReposition`, `onVisibilityChange?`): `void`

Defined in: [packages/lexical-react/src/shared/LexicalMenu.tsx:206](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/shared/LexicalMenu.tsx#L206)

#### Parameters

##### resolution

`null` | [`MenuResolution`](lexical_react_LexicalNodeMenuPlugin.md#menuresolution)

##### targetElement

`null` | `HTMLElement`

##### onReposition

() => `void`

##### onVisibilityChange?

(`isInView`) => `void`

#### Returns

`void`

## References

### MenuOption {#menuoption}

Re-exports [MenuOption](lexical_react_LexicalNodeMenuPlugin.md#menuoption)

***

### MenuRenderFn {#menurenderfn-1}

Re-exports [MenuRenderFn](lexical_react_LexicalNodeMenuPlugin.md#menurenderfn)

***

### MenuResolution {#menuresolution}

Re-exports [MenuResolution](lexical_react_LexicalNodeMenuPlugin.md#menuresolution)
