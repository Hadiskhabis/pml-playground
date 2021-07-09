# Rouge Lexer for PML

![Lexer Status][Status badge]&nbsp;
[![PML Version][PML badge]][Get PML]&nbsp;
[![Rouge Version][Rouge badge]][Rouge]&nbsp;
[![Asciidoctor Version][Asciidoctor badge]][Asciidoctor]&nbsp;

Custom PML lexer for [Rouge], plus [Asciidoctor] assets and Sass/CSS themes for the HTML backend.


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Directory Contents](#directory-contents)
- [Acknowledgements](#acknowledgements)

<!-- /MarkdownTOC -->

-----

# Directory Contents

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
- [`build.sh`][build.sh] — converts all documents to HTML using our custom `pml.rb` lexer and assets.


# Acknowledgements

I'd like to express my gratitude to [Dan Allen]  (@mojavelinux) from the [Asciidoctor Project] for helping me out on how to make Rouge require a custom lexer:

- [asciidoctor#4080]

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

[List of tokens]: https://github.com/rouge-ruby/rouge/wiki/List-of-tokens "Rouge Wiki » List of tokens"

[cli.rb]: https://github.com/rouge-ruby/rouge/blob/master/lib/rouge/cli.rb#L235 "View source file at Rouge repository"

<!-- Asciidoctor -->

[Asciidoctor]: https://asciidoctor.org "Asciidoctor website"

<!-- badges -->

[Status badge]: https://img.shields.io/badge/status-WIP-orange "Lexer status: WIP Alpha"
[PML badge]: https://img.shields.io/badge/PML-1.5.0-yellow "Supported PML version (click for PML download page)"
[Rouge badge]: https://img.shields.io/badge/Rouge-3.26.0-yellow "Supported Rouge version (click to visit Rouge website)"
[Asciidoctor badge]: https://img.shields.io/badge/Asciidoctor-2.0.15-yellow "Supported Asciidoctor version (click to visit Asciidoctor website)"

<!-- project files and folders -->

[sample pml]: ./pml-sample.pml

[build.sh]: ./build.sh

[example adoc]: ./asciidoctor-example.asciidoc
[example html]: ./asciidoctor-example.html
[example live]: https://htmlpreview.github.io/?https://github.com/tajmone/pml-playground/blob/master/syntax-hl/rouge/asciidoctor-example.html "Live HTML Preview of 'asciidoctor-example.html'"

[syntax adoc]: ./pml-syntax.asciidoc
[syntax html]: ./pml-syntax.html
[syntax live]: https://htmlpreview.github.io/?https://github.com/tajmone/pml-playground/blob/master/syntax-hl/rouge/pml-syntax.html "Live HTML Preview of 'pml-syntax.html'"

[adapter]: ./custom-rouge-adapter.rb
[pml.rb]: ./pml.rb
[theme.rb]: ./pml-test-theme.rb

<!-- Issues -->

[asciidoctor#4080]: https://github.com/asciidoctor/asciidoctor/issues/4080 "Rouge Highlighter: Add 'rouge-require' Option for Custom Lexers and Themes"

<!-- people and orgs -->

[Dan Allen]: https://github.com/mojavelinux "View Dan Allen's GitHub profile"

[Asciidoctor Project]: https://github.com/asciidoctor "View the Asciidoctor Project organization profile on GitHub"

<!-- EOF -->
