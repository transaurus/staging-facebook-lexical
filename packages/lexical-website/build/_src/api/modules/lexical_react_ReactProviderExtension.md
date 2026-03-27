# @lexical/react/ReactProviderExtension

## Variables

### ReactProviderExtension {#reactproviderextension}

> `const` **ReactProviderExtension**: [`LexicalExtension`](lexical.md#lexicalextension)\<[`ExtensionConfigBase`](lexical.md#extensionconfigbase), `"@lexical/react/ReactProvider"`, `unknown`, `unknown`\>

Defined in: [packages/lexical-react/src/ReactProviderExtension.tsx:18](https://github.com/facebook/lexical/tree/main/packages/lexical-react/src/ReactProviderExtension.tsx#L18)

An extension used to declare that there is a LexicalExtensionComposer or
ReactPluginHostExtension available so that we can issue runtime warnings
when plugins that depend on React are hosted in an environment
where it is not ever going to be rendered.

It is a separate extension so it can be used as a peer dependency.
