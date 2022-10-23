# PML Writer Tests

Various source documents to test that our custom PML writer is working as expected and that all AST elements and their attributes are covered.


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Directory Contents](#directory-contents)
- [Introduction](#introduction)
- [Third Party Credits](#third-party-credits)
- [Reference Links](#reference-links)

<!-- /MarkdownTOC -->

-----

# Directory Contents

- [`/_assets/`][_assets/] — shared docs images, etc.
- [`/elements/`][elements/] — test specific pandoc/PML elements (lists, footnotes, etc.).
- [`/features/`][features/] — test high order pandoc/PML features (metadata, escapes, etc.).
- [`/samples/`][samples/] — test entire sample documents.
- [`PANDOC_COPYING`][PANDOC_COPYING] — pandoc GPLv2 license.


# Introduction

In order to test the PML writer, we need multiple sample documents in various formats natively supported by pandoc, since each different format might support some document features not supported by others.

The `:pandoc` Rake task currently autodetects and tests the following source documents file extensions (recursively into the whole directory tree):

1. `**/*.markdown` — [pandoc's Markdown].
2. `**/*.native` — pandoc's native format (Haskell).

Each sample document will be converted both to PML and to its representation in pandoc JSON AST, because the latter offers detailed insights into what the custom writer is handling; the generated PML document is then converted to HTML via pmlc:

- `<filename>.{markdown,native}` &rArr; **pandoc**:
    + `<filename>.json` — pandoc JSON AST (_ignored by Git_)
    + `<filename>.pml` &rArr; **pmlc**:
        * `<filename>.html` (_ignored by Git_)

The JSON representation is generated via `pandoc -t json`.
Since pandoc generates the JSON AST as a single line, the Rake task prettifies it via Ruby, in order to render it more human readable.

# Third Party Credits

The following test files were taken (and in some cases adapted to need) from the pandoc repository [`test/`][test/] folder (click on filename to see upstream source):

- [`features/writers-lang-and-dir.native`][writers-lang-and-dir.native]

Pandoc is Copyright © 2006-2022 John MacFarlane, [released under GPL, version 2 or later]:

```
Pandoc
Copyright (C) 2006-2022 John MacFarlane <jgm at berkeley dot edu>

With the exceptions noted below, this code is released under the [GPL],
version 2 or later:

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

The GNU General Public License is available in the file COPYING.md in
the source distribution.  On Debian systems, the complete text of the
GPL can be found in `/usr/share/common-licenses/GPL`.

[GPL]: https://www.gnu.org/copyleft/gpl.html

Pandoc's complete source code is available from the [Pandoc home page].

[Pandoc home page]: https://pandoc.org

Pandoc includes some code with different copyrights, or subject to different
licenses.  The copyright and license statements for these sources are included
below.  All are GPL-compatible licenses.
```

A full copy of the GPLv2 license is included in this folder:

- [`PANDOC_COPYING`][PANDOC_COPYING]


-------------------------------------------------------------------------------

# Reference Links

- [jgm/pandoc] — official pandoc repository.
    + [`test/`][test/] — test folder with examples.

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[released under GPL, version 2 or later]: https://github.com/jgm/pandoc/blob/master/COPYING.md "View full text of GPLv2 license at pandoc's repository"

[PANDOC_COPYING]: ./PANDOC_COPYING "View full text of GPLv2"

<!-- pandoc -->

[pandoc repository]: https://github.com/jgm/pandoc "Visit pandoc repository at GitHub"
[jgm/pandoc]: https://github.com/jgm/pandoc "Visit pandoc repository at GitHub"
[test/]: https://github.com/jgm/pandoc/tree/master/test "pandoc repository » 'test/' folder"

[pandoc's Markdown]: https://pandoc.org/MANUAL.html#pandocs-markdown "Learn more about pandoc's Markdown flavour"

<!-- upstream links -->

[writers-lang-and-dir.native]: https://github.com/jgm/pandoc/blob/18ab8642692caca2716fd9b5a0e6dbfd3d9cf9cc/test/writers-lang-and-dir.native "View upstream source at pandoc repository"

<!-- files & folders -->

[_assets/]: ./_assets/ "Navigate to folder"
[elements/]: ./elements/ "Navigate to folder"
[features/]: ./features/ "Navigate to folder"
[samples/]: ./samples/ "Navigate to folder"
[PANDOC_COPYING]: ./PANDOC_COPYING "view pandoc GPLv2 license"


<!-- EOF -->
