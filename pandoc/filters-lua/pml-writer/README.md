# Pandoc PML Lua Writer

![Writer status][status badge]&nbsp;
![PML Version][pml badge]&nbsp;
![Pandoc Version][pandoc badge]

An attempt to implement a PML [custom pandoc writer] via Lua filters.

Builds via `rake pandoc`.

> **IMPORTANT** — The Lua filter contains many obsolete source comments about PML limitations which are no longer true.
> These comments are left over from PML 2.3.0 and don't take into account the new PML 3.x features.
> Therefore, until this notice is standing always double check comments against current PMLC status; once all the old comments are purged remove this notice.

-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Folder Contents](#folder-contents)
- [Project Status](#project-status)
- [About Custom Writers](#about-custom-writers)
- [Dependencies](#dependencies)

<!-- /MarkdownTOC -->

-----

# Folder Contents

- [`/tests/`][tests/] — examples and test files.
- [`default.pml.lua`][default.pml.lua] — custom PML     template.
- [`pml-writer.lua`][pml-writer.lua] — custom PML writer (Lua).
- [`sample.lua`][sample.lua] — official example of a custom HTML writer.
- [`STATUS.md`][STATUS.md] — PML writer progress status and known issues.

After building locally (via Rake), you'll also find the HTML version of the sample, generated via PMLC from the converted PML document:

- [`/tests/output/pandoc.html`](./tests/output/pandoc.html) (_ignored by Git_)


# Project Status

> **WARNING** — The [`pml-writer.lua`][pml-writer.lua] file is being developed on a copy of [`sample.lua`][sample.lua], the sample HTML writer that ships with pandoc, so most of its functions still emit HTML output.
> The PML template [`default.pml.lua`][default.pml.lua] is still pretty much in a draft state.

Since PML is structurally similar to an HTML document, we'll be using the sample HTML writer that ships with pandoc as the foundation for our custom PML writer.
In many cases, it should be sufficient to simply replace the HTML tags in output string with PML notes, so we could start working on these.
Other AST nodes will require _ad hoc_ adaptation to PML needs, and we'll address them according to each node's priority.


# About Custom Writers

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

[custom pandoc writer]: https://pandoc.org/MANUAL.html#custom-writers "Pandoc User's Guide » Custom writers"
[Custom writers]: https://pandoc.org/MANUAL.html#custom-writers "Pandoc User's Guide » Custom writers"

[--standalone]: https://pandoc.org/MANUAL.html#option--standalone "Pandoc User's Guide » '--standalone' option"
[--template]: https://pandoc.org/MANUAL.html#option--template "Pandoc User's Guide » '--template' option"
[Templates]: https://pandoc.org/MANUAL.html#templates "Pandoc User's Guide » Templates"

<!-- badges -->

[status badge]: https://img.shields.io/badge/status-Alpha-orange "The writer is still in WIP Alpha stage"
[pml badge]: https://img.shields.io/badge/PML-3.1.0-yellow "Last tested with PML 3.1.0"
[pandoc badge]: https://img.shields.io/badge/pandoc-2.19.2-yellow "Last tested with pandoc 2.17.1.1"

<!-- project files & folders -->

[tests/]: ./tests/ "Navigate to samples and tests directory"

[default.pml.lua]: ./default.pml.lua "pandoc template for custom PML writer"
[pml-writer.lua]: ./pml-writer.lua "Custom PML writer"
[sample.lua]: ./sample.lua "Sample HTML writer"
[STATUS.md]: ./STATUS.md "View PML writer status"

<!-- EOF -->
