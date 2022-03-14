# PML Style Sheets

[![PML Version][PML badge]][PML link]&nbsp;
[![Sass Version][Sass badge]][Dart Sass]&nbsp;
![Status][Status badge]

Experimenting with PML CSS files via [Sass].


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Directory Contents](#directory-contents)
- [Building](#building)
- [How Tests Work](#how-tests-work)
    - [Stylesheet Folders](#stylesheet-folders)
    - [Test Documents](#test-documents)
- [Dependencies](#dependencies)
- [Reference Links](#reference-links)

<!-- /MarkdownTOC -->

-----

# Directory Contents

- [`/_shared/`][_shared/] — assets shared by all test docs.
- [`/css__default/`][css__default/] — PML default CSS tests.
- [`/src-docs/`][src-docs/] — test docs sources (PML).
- [`fetch.bat`][fetch.bat] — fetch latest [default PML stylesheets] from [converter] repository using cURL:
    + [`pml-default.css`][pml-default.css]
    + [`pml-print-default.css`][pml-print-default.css]

> **WARNING!** — The generated CSS files and HTML documents are not tracked by Git, so in order to view the test documents you'll have to build them locally via Rake.


# Building

The tests in this folder are controlled via the `css` Rake task (included in default task).

To build just the samples:

    rake css

or, to force-rebuild them:

    rake css -B


# How Tests Work

The tests system in this directory is designed to allow contributors to add new stylesheets or test documents without having to tweak the main `Rakefile`.

The `Rakefile` is driven rules based on pattern-matching naming conventions, so as long as you abide to the following descriptions you can add new assets to this directory and they will be immediately automated.

## Stylesheet Folders

Every folder with a name starting in `css__` contains a different stylesheet to be testes.
The stylesheets are build from Sass, and each folder _**must**_ contain two Sass main sources named:

- `pml-default.scss`
- `pml-print-default.scss`

You can add as many Sass modules (`_*.scss`) as needed within each stylesheet folder, and you may organize your Sass modules into subfolders too (`**/_*.scss`).

When rake detects changes to the Sass sources or their modules, it will automatically (re)compiler them to CSS (in the `css/` subfolder, which is where the HTML docs will be looking for them).

The [`/css__default/`][css__default/] folder is a special case, since its Sass sources simply import the default PML stylesheets found in the root folder of the stylesheets project:

- [`pml-default.css`][pml-default.css]
- [`pml-print-default.css`][pml-print-default.css]

It's intended for comparison with other custom CSS files.

## Test Documents

Any `*.pml` document inside the [`/src-docs/`][src-docs/] folder will be converted to HTML and copied to each and every `css__*/` stylesheet folder (the HTML file only, without the default generated CSS files), so that each stylesheet can be tested using the same documents.

Rake will track any changes to the test documents sources, along with their assets (in [`/_shared/`][_shared/]) and update any files as required.

Test documents should be created as a single `.pml` source file, and any required dependencies should be added to the [`/_shared/`][_shared/] directory instead, so that Rake can track their changes — assets include reusable PML file snippets, images, JavaScript, etc.
Any files within the [`/_shared/`][_shared/] directory tree (i.e. sub-folders included) will be considered by Rake as requirements (dependencies) of the PML test documents, with the exception of Markdown files (`.md`) which will be ignored.


# Dependencies

To build the assets in this folder you'll need [Dart Sass].

-------------------------------------------------------------------------------

# Reference Links

<!-- MarkdownTOC:excluded -->
## PML

- [PML User Manual]
    + [Customization][man » Customization]
        * [CSS][man » CSS]

<!-- MarkdownTOC:excluded -->
## CSS Schools

The various CSS design schools of thought (methodologies).

- [ACSS] — _Atomic CSS_.
- [BEM] — _Block, Element, Modifier_ methodology:
    + [BEM Methodology] — official documentation.
    + [BEM 101] — article at [CSS-Tricks.com].
- [oCSS] — _organic Cascade Style Sheet_.
- [OOCSS] — _Object-Oriented CSS_, by Nicole Sullivan.
    + _[An Introduction to OOCSS]_
    + _[OOCSS, The Future of Writing CSS]_
- [rscss] — _Reasonable System for CSS Stylesheet Structure_.
- [SMACSS] — _Scalar and Modular Architecture for CSS_ (free eBook).

<!-- MarkdownTOC:excluded -->
## CSS References

- [A List Apart]
- [CSS-Tricks.com]
- [W3Schools CSS Tutorial]

<!-- MarkdownTOC:excluded -->
## CSS Processors

The various[CSS preprocessors] (and post-processors).

- [Sass] — _Syntactically Awesome Style Sheets_:
    + [Dart Sass]
- [Less] — _Leaner Style Sheets_.
- [Stylus]
- [PostCSS]

<!-- MarkdownTOC:excluded -->
## HTML/CSS boilerplates

- [H5BP] — HTML5 Boilerplate.
- [Modernizr] — browser-features detection library.
- [Normalize.css] — a modern, HTML5-ready alternative to CSS resets.

<!-- MarkdownTOC:excluded -->
## Good Design Practices

<!-- MarkdownTOC:excluded -->
### Vertical Rhythm

Articles:

- _[Why is Vertical Rhythm an Important Typography Practice?][Why Vertical Rhythm?]_ — Zell Liew (2016).
- _[Is Web Typography Completely Broken?]_— Zell Liew (2016).
- _[Compose to a Vertical Rhythm]_ — Richard Rutter (2006).
- _[More Meaningful Typography]_ — by Tim BrownMay (2011) at [A List Apart].

Online Tools:

- [drewish » vertical-rhythm]
- [Grid Lover]
- [Modular Scale]
- [type-scale.com]


<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

<!-- PML -->

[converter]: https://github.com/pml-lang/converter "Visit PML converter repository"

[default PML stylesheets]: https://github.com/pml-lang/converter/tree/main/work/resources/resources/css "View PML default stylesheets at converter repository"

<!-- PML Docs -->

[PML User Manual]: https://www.pml-lang.dev/docs/user_manual/index.html "Read PML User Manual online"
[man » Customization]: https://www.pml-lang.dev/docs/user_manual/index.html#ch__17 "PML User Manual » Customization"
[man » CSS]: https://www.pml-lang.dev/docs/user_manual/index.html#ch__16 "PML User Manual » Customization » CSS"

<!-- CSS refs -->

[A List Apart]: https://alistapart.com/
[CSS-Tricks.com]: https://css-tricks.com

<!-- W3Schools -->

[W3Schools CSS Tutorial]: https://www.w3schools.com/csS/default.asp "W3Schools » CSS Tutorial » Home"

<!-- CSS schools -->

[ACSS]: https://acss.io/ "Atomic CSS."

[SMACSS]: http://smacss.com "SMACSS website + free book"

[BEM]: https://en.bem.info "BEM website"
[BEM Methodology]: https://en.bem.info/methodology "BEM documentation"
[BEM 101]: https://css-tricks.com/bem-101/ "Intro article on BEM"

[oCSS]: https://krasimir.github.io/organic-css "organic Cascade Style Sheet"

[OOCSS]: https://en.wikipedia.org/wiki/OOCSS "Wikipedia » OOCSS"
[An Introduction to OOCSS]: https://www.smashingmagazine.com/2011/12/an-introduction-to-object-oriented-css-oocss/ "SmashingMag article (2011)"
[OOCSS, The Future of Writing CSS]: https://www.keycdn.com/blog/oocss "Keycdn article (2019)"

[rscss]: https://rscss.io/ "rscss (Reasonable System for CSS Stylesheet Structure website."

<!-- HTML/CSS boilerplates -->

[H5BP]: https://html5boilerplate.com "HTML5 Boilerplate"
[Modernizr]: https://modernizr.com/ "Modernizr"
[Normalize.css]: https://necolas.github.io/normalize.css "Normalize.css"

<!-- CSS preprocessors -->

[CSS preprocessors]: https://developer.mozilla.org/en-US/docs/Glossary/CSS_preprocessor "CSS preprocessors article from Mozilla.org"

[Sass]: https://sass-lang.com "Visit Sass website"
[Dart Sass]: https://github.com/sass/dart-sass "Visit Dart Sass repository"

[Less]: https://lesscss.org "LESS CSS website"

[Stylus]: https://stylus-lang.com "Stylus website"

[PostCSS]: https://postcss.org "PostCSS website"

<!-- Sass libs/frameworks -->

[Bourbon]: https://www.bourbon.io "Bourbon is a lightweight Sass tool set"

<!-- vertical rhythm articles -->

[Is Web Typography Completely Broken?]: https://zellwk.com/blog/web-typography-broken "Article by Zell Liew (2016)"
[Why Vertical Rhythm?]: https://zellwk.com/blog/why-vertical-rhythms "Article by Zell Liew (2016)"
[Compose to a Vertical Rhythm]: https://24ways.org/2006/compose-to-a-vertical-rhythm "Article by Richard Rutter (2006)"
[More Meaningful Typography]: https://alistapart.com/article/more-meaningful-typography/ "Article by Tim BrownMay (2011)"

<!-- vertical rhythm online tools -->

[type-scale.com]: https://type-scale.com/
[drewish » vertical-rhythm]: https://drewish.com/tools/vertical-rhythm/
[Grid Lover]: https://www.gridlover.net/try
[Modular Scale]: https://www.modularscale.com/

<!-- badges -->

[PML badge]: https://img.shields.io/badge/PML-2.2.0-yellow "Supported PML version (click for PML download page)"
[PML link]: https://www.pml-lang.dev/downloads/install.html "Go to the PML download page"
[SASS badge]: https://img.shields.io/badge/Dart_Sass-1.49.5-yellow "Supported Dart Sass version (click for download page)"
[Status badge]: https://img.shields.io/badge/status-WIP-red "Project Status: Work in Progress"

<!-- project files and folders -->

[_shared/]: ./_shared/ "Navigate to shared assets folder"
[css__default/]: ./css__default/ "Navigate to PML Default CSS test folder"
[src-docs/]: ./src-docs/ "Navigate to test docs sources folder"

[fetch.bat]: ./fetch.bat
[pml-default.css]: ./pml-default.css
[pml-print-default.css]: ./pml-print-default.css

<!-- EOF -->
