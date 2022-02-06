# Pandoc PML Lua Writer

![Writer status][status badge]&nbsp;
![PML Version][pml badge]&nbsp;
![Pandoc Version][pandoc badge]

An attempt to implement a PML [custom pandoc writer] via Lua filters.

-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Folder Contents](#folder-contents)
- [Project Status](#project-status)
- [Sample Docs and Workflow](#sample-docs-and-workflow)
- [About Custom writers](#about-custom-writers)
- [Dependencies](#dependencies)

<!-- /MarkdownTOC -->

-----

# Folder Contents

- [`sample.lua`][sample.lua] — reference sample custom HTML writer.
- [`pml-writer.lua`][pml-writer.lua] — custom PML writer (Lua).
- [`default.pml.lua`][default.pml.lua] — custom PML template.
- [`build.sh`][build.sh] — converts sample docs to JSON AST and PML.
- [`pandoc.markdown`][pandoc.markdown] — sample doc in pandoc markdown:
    + [`pandoc.json`][pandoc.json] — converted to JSON AST.
    + [`pandoc.pml`][pandoc.pml] — converted to PML via custom writer.

After building locally, you'll also find the HTML version of the sample, generated via PMLC from the converted PML document:

- [`output/pandoc.html`](./output/pandoc.html) (ignored by Git)


# Project Status

> **WARNING** — The [`pml-writer.lua`][pml-writer.lua] file is being developed on a copy of [`sample.lua`][sample.lua], the sample HTML writer that ships with pandoc, so most of its functions still emit HTML output.
> The PML template [`default.pml.lua`][default.pml.lua] is still pretty much in a draft state.

Since PML is structurally similar to an HTML document, we'll be using the sample HTML writer that ships with pandoc as the foundation for our custom PML writer.
In many cases, it should be sufficient to simply replace the HTML tags in output string with PML notes, so we could start working on these.
Other AST nodes will require _ad hoc_ adaptation to PML needs, and we'll address them according to each node's priority.


# Sample Docs and Workflow

In order to test the PML writer, we'll need multiple sample documents in various formats natively supported by pandoc, since each different format might support some document features not supported by other formats.

Each sample document will be converted both to PML and to its representation in pandoc JSON AST, because the latter offers detailed insights into what the custom writer is handling.

Currently, we have only a single sample document:

- [`pandoc.markdown`][pandoc.markdown]

and it's JSON AST and PML conversions (also tracked by the repository):

- [`pandoc.json`][pandoc.json]
- [`pandoc.pml`][pandoc.pml]

The JSON representation is generated via `pandoc -t json`.
Because pandoc generates the JSON AST as a single line, we pipe it through the `jsome` tool (Node.js) to prettify it and make it more human readable.


# About Custom writers

> ### [Custom writers]
>
> Pandoc can be extended with custom writers written in Lua.
> (Pandoc includes a Lua interpreter, so Lua need not be installed separately.)
>
> To use a custom writer, simply specify the path to the Lua script in place of the output format. For example:
>
> ```
> pandoc -t data/sample.lua
> ```
>
> Creating a custom writer requires writing a Lua function for each possible element in a pandoc document.
> To get a documented example which you can modify according to your needs, do
>
> ```
> pandoc --print-default-data-file sample.lua
> ```

We've included in this folder the sample writer, as a consultation reference:

- [`sample.lua`][sample.lua]

> Note that custom writers have no default template.
> If you want to use [`--standalone`][--standalone] with a custom writer, you will need to specify a template manually using [`--template`][--template] or add a new default template with the name `default.NAME_OF_CUSTOM_WRITER.lua` to the `templates` subdirectory of your user data directory (see [Templates]).

We've included in this folder the PML template, following the naming convention indicated above:

- [`default.pml.lua`][default.pml.lua]


# Dependencies

In order to use the assets in this folder, you'll need the following tools:

- [pmlc] — PML converter.
- [pandoc][pandoc install] — use latest release.
- [jsome] — NPM package to prettify JSON.

Windows users will also need a Bash environment (with common tools) to run the shell scripts (if you've installed Git for Windows you already have it).

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[jsome]: https://www.npmjs.com/package/jsome "jsome package at NPM"
[pmlc]: https://www.pml-lang.dev/downloads/install.html "PML Converter download page"

<!-- pandoc -->

[pandoc]: https://pandoc.org "Visit pandoc website"
[pandoc install]: https://pandoc.org/installing.html "Visit pandoc download page"

[custom pandoc writer]: https://pandoc.org/MANUAL.html#custom-writers "Pandoc User's Guide » Custom writers"
[Custom writers]: https://pandoc.org/MANUAL.html#custom-writers "Pandoc User's Guide » Custom writers"

[--standalone]: https://pandoc.org/MANUAL.html#option--standalone "Pandoc User's Guide » '--standalone' option"
[--template]: https://pandoc.org/MANUAL.html#option--template "Pandoc User's Guide » '--template' option"
[Templates]: https://pandoc.org/MANUAL.html#templates "Pandoc User's Guide » Templates"

<!-- badges -->

[status badge]: https://img.shields.io/badge/status-Alpha-orange "The writer is still in WIP Alpha stage"
[pml badge]: https://img.shields.io/badge/PML-2.2.0-yellow "Last tested with PML 2.2.0"
[pandoc badge]: https://img.shields.io/badge/pandoc-2.17.1.1-yellow "Last tested with pandoc 2.17.1.1"

<!-- project files -->

[build.sh]: ./build.sh "View builder script"
[default.pml.lua]: ./default.pml.lua "pandoc template for custom PML writer"
[pandoc.json]: ./pandoc.json "ample pandoc markdown doc converted to JSON AST"
[pandoc.markdown]: ./pandoc.markdown "Sample doc in pandoc markdown"
[pandoc.pml]: ./pandoc.pml "Sample pandoc markdown doc converted to PML"
[pml-writer.lua]: ./pml-writer.lua "Custom PML writer"
[sample.lua]: ./sample.lua "Sample HTML writer"

<!-- EOF -->
