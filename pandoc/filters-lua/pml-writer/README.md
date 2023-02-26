# Pandoc PML Lua Writer

![Writer status][status badge]&nbsp;
![PML Version][pml badge]&nbsp;
![Pandoc Version][pandoc badge]

An attempt to implement a PML [custom pandoc writer] via Lua filters.

Builds via `rake pandoc`.

> **IMPORTANT** — The Lua filter contains many obsolete source comments about PML limitations which are no longer true.
> These comments are left over from PML 2.3.0 and don't take into account the new PML 4.x features.
> Therefore, until this notice is standing, always double check comments against current PMLC status; once all the old comments are purged remove this notice.

-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Folder Contents](#folder-contents)
- [Project Status](#project-status)
- [About Custom Writers](#about-custom-writers)
    - [Writer Template](#writer-template)
- [Dependencies](#dependencies)

<!-- /MarkdownTOC -->

-----

# Folder Contents

- [`/tests/`][tests/] — examples and test files.
- [`default.pml.lua`][default.pml.lua] — custom PML     template.
- [`pml-writer.lua`][pml-writer.lua] — custom PML writer (Lua).
- [`sample.lua`][sample.lua] — [official example of a custom HTML writer][sample.lua upstream].
- [`STATUS.md`][STATUS.md] — PML writer progress status and known issues.

After building locally (via Rake), you'll also find the HTML version of the sample, generated via PMLC from the converted PML document:

- [`/tests/output/pandoc.html`](./tests/output/pandoc.html) (_ignored by Git_)


# Project Status

> **WARNING** — The [`pml-writer.lua`][pml-writer.lua] file is being developed on a copy of [`sample.lua`][sample.lua], the sample HTML writer that used to ship with pandoc 2, so most of its functions still emit HTML output.
> The PML template [`default.pml.lua`][default.pml.lua] is still pretty much in a draft state.

<!-- separator -->

> **PANDOC 3 WARNING** — We're currently migrating the filter from pandoc v2 to v3, which introduced [significant changes in both Lua filters][Changes in pandoc 3.0] and pandoc syntax and elements.
> Some parts of the filter might not be up-to-date with the latest pandoc 3.x functionality.

Since PML is structurally similar to an HTML document, we'll be using the sample HTML writer from the pandoc project as the foundation for our custom PML writer.
In many cases, it should be sufficient to simply replace the HTML tags in output string with PML notes, so we could start working on these.
Other AST nodes will require _ad hoc_ adaptation to PML needs, and we'll address them according to each node's priority.


# About Custom Writers

> ### [Custom readers and writers]
>
> Pandoc can be extended with custom readers and writers written in Lua.
> (Pandoc includes a Lua interpreter, so Lua need not be installed separately.)
>
> To use a custom reader or writer, simply specify the path to the Lua script in place of the input or output format. For example:
>
> ```
> pandoc -t data/sample.lua
> pandoc -f my_custom_markup_language.lua -t latex -s
> ```
>
> [...]
>
> A custom writer is a Lua script that defines a function that specifies how to render each element in a Pandoc AST.


We've included in this folder the [HTML sample writer][sample.lua upstream], as a consultation reference:

- [`sample.lua`][sample.lua]


> **WARNING** — With pandoc 2.x, to get a documented example which can be modified according to needs, we could type:
>
> ```
> pandoc --print-default-data-file sample.lua
> ```
> This is no longer the case with pandoc 3.x, as the default `sample.lua` example file has changed to the `creole.lua` example reader which can be generated via:
>
> ```
> pandoc --print-default-data-file creole.lua
> ```
> Our filter relies on the `sample.lua` writer example, which can now be found at the pandoc source repository:
>
> - https://github.com/jgm/pandoc/blob/main/pandoc-lua-engine/test/sample.lua


## Writer Template

> Note that custom writers have no default template.
> If you want to use [`--standalone`][--standalone] with a custom writer, you will need to specify a template manually using [`--template`][--template] or add a new default template with the name `default.NAME_OF_CUSTOM_WRITER.lua` to the `templates` subdirectory of your user data directory (see [Templates]).

We've included in this folder the PML template, following the naming convention indicated above:

- [`default.pml.lua`][default.pml.lua]


# Dependencies

In order to build the assets in this folder, you'll need the following tools:

- [pmlc] — PML Companion.
- [pandoc][pandoc install] — use latest release.
- Ruby 3 — only required for the Rake toolchain of this project.

To use this pandoc filter in your own projects, you'll only need PMLC, pandoc and the `pml-writer.lua` and `default.pml.lua` files from this folder.

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[pmlc]: https://www.pml-lang.dev/downloads/install.html "PML Converter download page"

<!-- pandoc -->

[pandoc]: https://pandoc.org "Visit pandoc website"
[pandoc install]: https://pandoc.org/installing.html "Visit pandoc download page"

[custom pandoc writer]: https://pandoc.org/MANUAL.html#custom-readers-and-writers "Pandoc User's Guide » Custom readers and writers"
[Custom readers and writers]: https://pandoc.org/MANUAL.html#custom-readers-and-writers "Pandoc User's Guide » Custom readers and writers"

[Creating Custom Pandoc Writers in Lua]: https://pandoc.org/custom-writers.html "Pandoc documentation on Lua Writers"
[Changes in pandoc 3.0]: https://pandoc.org/custom-writers.html "Changes in Lua writers between pandoc 2 and 3"


[--standalone]: https://pandoc.org/MANUAL.html#option--standalone "Pandoc User's Guide » '--standalone' option"
[--template]: https://pandoc.org/MANUAL.html#option--template "Pandoc User's Guide » '--template' option"
[Templates]: https://pandoc.org/MANUAL.html#templates "Pandoc User's Guide » Templates"

[sample.lua upstream]: https://github.com/jgm/pandoc/blob/main/pandoc-lua-engine/test/sample.lua "Upstream source of 'sample.lua'"

<!-- badges -->

[status badge]: https://img.shields.io/badge/status-Alpha-orange "The writer is still in WIP Alpha stage"
[pml badge]: https://img.shields.io/badge/PML-4.0.0-yellow "Last tested with PML 4.0.0"
[pandoc badge]: https://img.shields.io/badge/pandoc-3.1-yellow "Last tested with pandoc 3.1"

<!-- project files & folders -->

[tests/]: ./tests/ "Navigate to samples and tests directory"

[default.pml.lua]: ./default.pml.lua "pandoc template for custom PML writer"
[pml-writer.lua]: ./pml-writer.lua "Custom PML writer"
[sample.lua]: ./sample.lua "Sample HTML writer"
[STATUS.md]: ./STATUS.md "View PML writer status"

<!-- EOF -->
