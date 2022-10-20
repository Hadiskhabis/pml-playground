# The PML Playground

[![PML Version][PML badge]][Get PML]&nbsp;
[![Build Status][Travis badge]][Travis link]

An open space to experiment with [PML]  (Practical Markup Language).
Created by [Tristano Ajmone] in April 2021; maintained by [Christian Neumanns], [Liam OBrien] and [Tristano Ajmone].

- https://github.com/tajmone/pml-playground


> **WARNING** — Due to breaking changes in PMLC 3.0.0 command line options, the following Rake tasks no longer work and were temporarily removed from the default build: `:samples` and `:css`.
> They will be amended and reintroduced as soon as possible.

<!-- separator -->

> **NOTE** — This repository contains various sub-projects, organized into different subfolders; some of them might be for older versions of PML because we haven't yet found the time to update them.
> Always check the PML version badge at the beginning of README files, which indicates the latest PML version against which a folder was last tested.

-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Repository Contents](#repository-contents)
- [About](#about)
- [Building](#building)
- [License](#license)
- [Links](#links)

<!-- /MarkdownTOC -->

-----

# Repository Contents

- [`/mustache/`][mustache/] — misc. mustache templates.
- [`/pandoc/`][pandoc/] — PML &hArr; pandoc assets.
- [`/pml-samples/`][pml-samples/] \[_broken_\] — shared PML sample documents and chunks.
- [`/stylesheets/`][stylesheets/] \[_broken_\] — PML CSS stylesheets playground.
- [`/syntax-guide/`][syntax-guide/] — _PML Syntax Guide_ doc + sources.
- [`/syntax-hl/`][syntax-hl/] — PML syntax highlighting.

# About

This repository is playground and testbed for experimenting with [PML]  (Practical Markup Language), a new [lightweight markup language] created by [Christian Neumanns].

The project is open to all PML pioneers who are willing to experiment with this wonderful newborn language and documentation system — the lucky few who will have the chance to shape PML's future, by exploring its potential and proposing new features while the language is still growing.


# Building

This repository is powered by [Rake].

To build/update the project, open a terminal (CMD, Bash, etc.) anywhere within the repository directory tree and type:

    rake

To forcefully build/update, even if dependencies didn't change, type:

    rake -B


# License

Since this project is open to contributions and makes extensive use of third party assets, it doesn't have a project wide license.
Each individual asset is governed by its own license, as indicated in the source files or its `LICENSE` file (if present).

# Links

- [www.pml-lang.dev] — PML website:
    + [PML Changelog]
    + [PML Nodes Reference Manual]
    + [PML User Manual]
    + [PMLC Commands Reference Manual]

<!-- MarkdownTOC:excluded -->
## Articles

Articles by [Christian Neumanns]:

- [_We need a new document markup language  — here is why_][2019article]
- _[The advantages of Document Markup Languages vs WYSIWYG editors]_

<!-- MarkdownTOC:excluded -->
## PML on GitHub

- [@pml-lang] — __PML Lang__ organization:
    + [pml-lang/pml-companion] — source code (Java) repository of the PML Companion tool.
    + [pml-lang/pml-nodes-refman] — [PML Nodes Reference Manual] source repository.
    + [pml-lang/pml-userman] — [PML User Manual] source repository.

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[lightweight markup language]: https://en.wikipedia.org/wiki/Lightweight_markup_language "Wikipedia page 'Lightweight markup language'"

[Rake]: https://ruby.github.io/rake/ "Visit Rake website"

<!-- PML -->

[www.pml-lang.dev]: https://www.pml-lang.dev "Visit PML website"
[PML]: https://www.pml-lang.dev "Visit PML website"
[Get PML]: https://www.pml-lang.dev/downloads/install.html "Go to the PML download page"
[PML binaries]: https://www.pml-lang.dev/downloads/install.html "Download precompiled PML binaries"

<!-- PML Docs & Articles -->

[PML Changelog]: https://www.pml-lang.dev/docs/changelog/index.html "View the PML Changelog"
[PML Nodes Reference Manual]: https://www.pml-lang.dev/docs/reference_manual/index.html "Read the online PML Nodes Reference Manual"
[PML User Manual]: https://www.pml-lang.dev/docs/user_manual/index.html "Read the online PML User Manual"
[PMLC Commands Reference Manual]: https://www.pml-lang.dev/docs/commands_manual/index.html "Read the online PMLC Commands Reference Manual"

[2019article]: https://www.freecodecamp.org/news/we-need-a-new-document-markup-language-c22e0ec44e15/ "Read full article at freeCodeCamp"
[The advantages of Document Markup Languages vs WYSIWYG editors]: https://www.pml-lang.dev/docs/articles/advantages-markup-language-vs-word-processor/index.html "Read full article at PMl website"

<!-- PML GitHub -->

[@pml-lang]: https://github.com/pml-lang "View GitHub profile of the Practical Markup Language organization"
[pml-lang/pml-companion]: https://github.com/pml-lang/pml-companion "Visit repository on GitHub"
[pml-lang/pml-nodes-refman]: https://github.com/pml-lang/pml-nodes-refman "Visit repository on GitHub"
[pml-lang/pml-userman]: https://github.com/pml-lang/pml-userman "Visit repository on GitHub"

<!-- badges -->

[PML badge]: https://img.shields.io/badge/PML-3.1.0-yellow "Supported PML version (click for PML Companion download page)"
[Travis badge]: https://travis-ci.com/tajmone/Sublime-PML.svg?branch=main
[Travis link]: https://travis-ci.com/tajmone/Sublime-PML "Travis CI: EditorConfig validation status"

<!-- project files and folders -->

[mustache/]: ./mustache/ "Navigate to mustache templates folder"
[pandoc/]: ./pandoc/ "Navigate to pandoc folder"
[pml-samples/]: ./pml-samples/ "Navigate to PML samples folder"
[stylesheets/]: ./stylesheets/ "Navigate to CSS stylesheets folder"
[syntax-guide/]: ./syntax-guide/ "Navigate to PML Syntax Guide folder"
[syntax-hl/]: ./syntax-hl/ "Navigate to syntax highlighters folder"

<!-- people -->

[Christian Neumanns]: https://github.com/pml-lang "View Christian Neumanns's GitHub profile"
[Liam OBrien]: https://github.com/celtic-coder "View Liam OBrien's GitHub profile"
[Tristano Ajmone]: https://github.com/tajmone "View Tristano Ajmone's GitHub profile"

<!-- EOF -->
