# PML Syntax Guide

This directory contains the source files and assets for the _PML Syntax Guide_, a document with guidelines for developers of PML syntaxes for code highlighters and editor/IDE plug-ins.

The [`pml-tests/`][pml-tests/] folder also provides PML documents testing edge cases and other parser behaviours to help documenting the inner workings of PMLC, as well as to detect any parsing behaviour changes in future version of PMLC.
Lacking an official PML syntax test suite, these test docs might also be a useful reference to any third party tool that needs to emulate the PMLC parser (e.g. a language server).

-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Directory Contents](#directory-contents)

<!-- /MarkdownTOC -->

-----

# Directory Contents

- [`pml-tests/`][pml-tests/] — PML docs for testing parser behaviour and edge cases.
- [`PML-Syntax-Guide.html`][sguide html] — converted HTML doc ([Live HTML Preview][sguide live]).
- [`sguide.asciidoc`][sguide adoc] — main AsciiDoc source file:
    + `*.adoc` — sub-sources.

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[pml-tests/]: ./pml-tests/ "Navigate to PML syntax tests folder"

[sguide adoc]: ./sguide.asciidoc "View source document"
[sguide html]: ./PML-Syntax-Guide.html "View HTML document"
[sguide live]: https://htmlpreview.github.io/?https://github.com/tajmone/pml-playground/blob/master/syntax-guide/PML-Syntax-Guide.html "Live HTML Preview of 'PML-Syntax-Guide.html'"

<!-- EOF -->
