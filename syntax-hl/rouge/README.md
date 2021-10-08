# Rouge Lexer for PML

![Lexer Status][Status badge]&nbsp;
[![PML Version][PML badge]][Get PML]&nbsp;
[![Rouge Version][Rouge badge]][Rouge]&nbsp;
[![Asciidoctor Version][Asciidoctor badge]][Asciidoctor]&nbsp;
[![Sass Version][Sass badge]][Dart Sass]&nbsp;

Custom PML lexer for [Rouge], plus [Asciidoctor] assets and [Sass]/CSS themes for the HTML backend.

Build via: `rake rouge`

-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Directory Contents](#directory-contents)
- [Building and Updating](#building-and-updating)
- [Lexer Usage Instructions](#lexer-usage-instructions)
    - [Command Line and Scripts](#command-line-and-scripts)
    - [Asciidoctor API](#asciidoctor-api)
- [Acknowledgements](#acknowledgements)
- [Credits](#credits)
- [Links](#links)
    - [Rouge](#rouge)
    - [Asciidoctor](#asciidoctor)

<!-- /MarkdownTOC -->

-----

# Directory Contents

- [`/sass/`][sass/] — Custom Sass/CSS PML themes for Asciidoctor HTML.
- [`pml-sample.pml`][sample pml] — sample PML source.

Custom Ruby scripts, lexers and themes for [Rouge]:

- [`pml.rb`][pml.rb] — custom Rouge lexer for PML (WIP).
- [`custom-rouge-adapter.rb`][adapter] — tweaks the Rouge adapter for Asciidoctor that loads (requires) our `pml.rb` lexer and theme.
- [`pml-test-theme.rb`][theme.rb] — custom Rouge theme for testing PML.

Sample documents:

- [`asciidoctor-example.asciidoc`][example adoc] — Asciidoctor example document.
- [`asciidoctor-example.html`][example html] — converted HTML doc ([Live HTML Preview][example live])
- [`pml-syntax.asciidoc`][syntax adoc] — Asciidoctor test document for the PML lexer.
- [`pml-syntax.html`][syntax html] — converted HTML doc ([Live HTML Preview][syntax live])
- [`_attr-header.adoc`][_attr-header] — commonly shared header attributes.
- [`docinfo.html`][docinfo.html] — Asciidoctor [docinfo file] with our custom CSS (generated via [`sass/build.sh`][sass/build.sh]).


# Building and Updating

To build or update the contents of this directory, type in the terminal:

    rake rouge


# Lexer Usage Instructions

In order to use our custom PML lexer for Rouge in your own AsciiDoc projects you'll need to add to your project the `custom-rouge-adapter.rb` and `pml.rb` files found in this folder; then edit [`custom-rouge-adapter.rb`][adapter] by deleting (or commenting out) the following line:

```ruby
    require './pml-test-theme.rb' # DELME IN PRODUCTION!
```

You'll also need to let Asciidoctor (Ruby) know about the `custom-rouge-adapter.rb` extension.
Below are the instructions on how do to it via command line invocation and via the [Asciidoctor API].

If you want to configure your source document(s) to use the Rouge highlighter and a specific theme, add to its header the following attributes:

```asciidoc
:source-highlighter: rouge
:rouge-style: thankful_eyes
```

where `thankful_eyes` can be replaced with any valid Rouge theme.

But it's preferable to set these these attributes via the CLI invocation or Asciidoctor API, rather then embedding them into the source documents, in order to keep toolchain settings separate from the documents.


## Command Line and Scripts

If you're converting your documents via shell or batch scripts, you'll need to invoke Asciidoctor with the `--require` (`-r`) option, pointing to the location of `custom-rouge-adapter.rb` (absolute or relative path).


Example, to convert the `pml-syntax.asciidoc` in this folder from a Unix shell or script:

```sh
asciidoctor \
    -r ./custom-rouge-adapter.rb \
    pml-syntax.asciidoc
```

or, similarly, from the Windows CMD or a batch script:

```batch
asciidoctor ^
    -r .\custom-rouge-adapter.rb ^
    pml-syntax.asciidoc
```

To control Rogue settings attributes via command line invocation:

```sh
    -a source-highlighter=rouge \
    -a rouge-style=thankful_eyes \
```

## Asciidoctor API

If you're converting your documents via the [Asciidoctor API], you'll only need `require` the `custom-rouge-adapter.rb` at the beginning of your Ruby script, along with Asciidoctor:

```ruby
require 'asciidoctor'
require "path/to/custom-rouge-adapter.rb"
```

then invoke Asciidoctor as usual (e.g. via `Asciidoctor.convert_fil`, `Asciidoctor.load`, and so on).

To control Rogue settings attributes via the API:

```ruby
        attributes: {
          'source-highlighter' => 'rouge',
          'rouge-style' => 'thankful_eyes',
        }
```


# Acknowledgements

I'd like to express my gratitude to [Dan Allen]  (@mojavelinux) from the [Asciidoctor Project] for helping me out on how to make Rouge require a custom lexer:

- [asciidoctor#4080]


# Credits

Third party components and assets used in this directory tree:

- __[Gogh Flat] colour scheme__ — Used in our syntax highlighter theme. See [`../schemes/README.md`][Gogh Flat Credits] for full credits and license info.

-------------------------------------------------------------------------------

# Links

## Rouge

- [Rouge website][Rouge]
- [Rouge repository]
- [Rouge Tokens List]
- [Rouge Wiki]
- [Rouge documentation]
- [Redcarpet]

## Asciidoctor

- [Asciidoctor website][Asciidoctor]
- [Asciidoctor repository]:
    + [`rouge.rb`][rouge.rb] — Asciidoctor's native API for Rouge.
    + [asciidoctor#4080] — Rouge Highlighter: Add 'rouge-require' Option for Custom Lexers and Themes
- [Asciidoctor Documentation]:
    + [Syntax Highlighting][AsciiDr Syntax Highlighting]:
        * [Rouge][AsciiDr Rouge]
        * [Custom Syntax Highlighter Adapter]
    + [Process AsciiDoc Using the API][Asciidoctor API]:
        * [API Options]

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

<!-- PML -->

[Get PML]: https://www.pml-lang.dev/downloads/install.html "Go to the PML download page"

<!-- Rouge -->

[Rouge]: http://rouge.jneen.net "Rouge website"
[Rouge repository]: https://github.com/rouge-ruby/rouge "Rouge repository on GitHub"
[Rouge documentation]: https://rouge-ruby.github.io/docs/ "Rouge online documentation"
[Rouge Wiki]: https://github.com/rouge-ruby/rouge/wiki "Rouge Wiki on GitHub"

[Rouge Tokens List]: https://htmlpreview.github.io/?https://github.com/alan-if/Alan-Testbed/blob/master/syntax-hl/Rouge/themes/Rouge-Tokens.html "List of Rouge tokens and their CSS classes"

[cli.rb]: https://github.com/rouge-ruby/rouge/blob/master/lib/rouge/cli.rb#L235 "View source file at Rouge repository"

<!-- Asciidoctor -->

[Asciidoctor]: https://asciidoctor.org "Asciidoctor website"
[Asciidoctor repository]: https://github.com/asciidoctor/asciidoctor "Asciidoctor repository on GitHub"
[rouge.rb]: https://github.com/asciidoctor/asciidoctor/blob/master/lib/asciidoctor/syntax_highlighter/rouge.rb

[Asciidoctor Documentation]: https://docs.asciidoctor.org/asciidoctor/latest/

[docinfo file]: https://docs.asciidoctor.org/asciidoctor/latest/docinfo/ "Asciidoctor Manual » Docinfo Files"

[AsciiDr Syntax Highlighting]: https://docs.asciidoctor.org/asciidoctor/latest/syntax-highlighting/
[AsciiDr Rouge]: https://docs.asciidoctor.org/asciidoctor/latest/syntax-highlighting/rouge/
[Custom Syntax Highlighter Adapter]: https://docs.asciidoctor.org/asciidoctor/latest/syntax-highlighting/custom/

[Asciidoctor API]: https://docs.asciidoctor.org/asciidoctor/latest/api/ "See Asciidoctor Documentation on using the API"
[API Options]: https://docs.asciidoctor.org/asciidoctor/latest/api/options/

<!-- 3rd Party tools -->

[asciidoctor-pdf]: https://github.com/asciidoctor/asciidoctor-pdf "asciidoctor-pdf repository on GitHub"
[Dart Sass]: https://github.com/sass/dart-sass "Visit Dart Sass repository on GitHub"
[Redcarpet]: https://github.com/vmg/redcarpet "Redcarpet repository on GitHub"
[Sass]: https://sass-lang.com/dart-sass "Learn more about Dart Sass (Syntactically Awesome Style Sheets)"

[Gogh]: https://mayccoll.github.io/Gogh/ "Visit Gogh website"
[Gogh Flat]: https://github.com/Mayccoll/Gogh/blob/master/themes/flat.sh "View upstream source scheme at Gogh's repository on GitHub"
[Gogh Flat Credits]: ../schemes/README.md#gogh-flat "View full credits and license details for the Gogh Flat scheme"

<!-- badges -->

[Status badge]: https://img.shields.io/badge/status-WIP-orange "Lexer status: WIP Alpha"
[PML badge]: https://img.shields.io/badge/PML-2.0.0-yellow "Supported PML version (click for PML download page)"
[Rouge badge]: https://img.shields.io/badge/Rouge-3.26.1-yellow "Supported Rouge version (click to visit Rouge website)"
[Asciidoctor badge]: https://img.shields.io/badge/Asciidoctor-2.0.16-yellow "Supported Asciidoctor version (click to visit Asciidoctor website)"
[Sass badge]: https://img.shields.io/badge/Dart_Sass-1.40.0-yellow "Supported Dart Sass version (click to visit Dart Sass repository)"

<!-- project files and folders -->

[sass/]: ./sass/ "Navigate to Sass/SCSS folder"
[sass/build.sh]: ./sass/build.sh "View Sass/CSS and docinfo builder script"

[sample pml]: ./pml-sample.pml "View PML sample source doc"

[example adoc]: ./asciidoctor-example.asciidoc "Asciidoctor example (source doc)"
[example html]: ./asciidoctor-example.html "Asciidoctor example (generated HTML doc)"
[example live]: https://htmlpreview.github.io/?https://github.com/tajmone/pml-playground/blob/master/syntax-hl/rouge/asciidoctor-example.html "Live HTML Preview of 'asciidoctor-example.html'"

[syntax adoc]: ./pml-syntax.asciidoc "'PML Syntax' Asciidoctor (source doc)"
[syntax html]: ./pml-syntax.html "'PML Syntax' Asciidoctor (generated HTML doc)"
[syntax live]: https://htmlpreview.github.io/?https://github.com/tajmone/pml-playground/blob/master/syntax-hl/rouge/pml-syntax.html "Live HTML Preview of 'pml-syntax.html'"

[_attr-header]: ./_attr-header.adoc "Shared AsciiDoc header attributes"

[adapter]: ./custom-rouge-adapter.rb "Custom Rouge adapter for Asciidoctor"
[pml.rb]: ./pml.rb "Rouge's PML Lexer source"
[theme.rb]: ./pml-test-theme.rb "Rouge's test theme for PML Lexer"
[docinfo.html]: ./docinfo.html "Asciidoctor docinfo file"

<!-- Issues -->

[asciidoctor#4080]: https://github.com/asciidoctor/asciidoctor/issues/4080 "Rouge Highlighter: Add 'rouge-require' Option for Custom Lexers and Themes"

<!-- people and orgs -->

[Dan Allen]: https://github.com/mojavelinux "View Dan Allen's GitHub profile"

[Asciidoctor Project]: https://github.com/asciidoctor "View the Asciidoctor Project organization profile on GitHub"

<!-- EOF -->
