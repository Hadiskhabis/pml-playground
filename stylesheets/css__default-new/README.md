# New Default Style Sheet

An attempt to reorganize the default CSS according to [SMACSS] guidelines, using Sass sources, and improving the styles at the same time.

-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Sass Sources](#sass-sources)
- [About](#about)
- [WIP Status](#wip-status)

<!-- /MarkdownTOC -->

-----

# Sass Sources

- [`_base.scss`][_base.scss] — SMACSS [Base Rules]
- [`_layout.scss`][_layout.scss] — SMACSS [Layout Rules]
- [`_modules.scss`][_modules.scss] — SMACSS [Module Rules]
- [`_normalize.scss`][_normalize.scss] — [normalize.css] v8.0.1 (tweaked).
- [`_states.scss`][_states.scss] — SMACSS [State Rules]
- [`_theme.scss`][_theme.scss] — SMACSS [Theme Rules]
- [`pml-default.scss`][pml-default.scss] &rarr; `pml-default.css`
- [`pml-print-default.scss`][pml-print-default.scss] &rarr; `pml-print-default.css`


# About

These Sass stylesheets were recreated starting off from the original PML 3.1.0 CSS files:

- `pml-default.css` &rarr; renamed to: `pml-default.scss`
- `pml-print-default.css` &rarr; renamed to: `pml-print-default.scss`

Our goal here is to port the default stylesheets from plain CSS to Sass, so that we can benefit from Sass advanced features and its abstraction of raw CSS, which will improve future maintenance.

At the same time, we'd like to apply the SMACSS methodology to the stylesheets, which should lead to a better and clearer design of PML stylesheets in general.

In the long term, this should result in a custom framework for building PML specific stylesheets, which could then be used as the foundation of multiple native stylesheets and themes, and also be used by PML users to quickly create their own custom CSS in an easy and guided manner.

Needless to say, all of this is fairly experimental right now, and the default stylesheets are more or less _drafts_ that were put together in the early PMl stages as a starting point. None of us being web-design experts, _we're learning as we go_, so it's ultimately an explorative journey for us.

One thing we're pretty sure about is that although there are tons of Sass and CSS frameworks for website and blogs design out there, we couldn't find anything specifically targeting documentation or books.


# WIP Status

- [ ] [`pml-default.scss`][pml-default.scss]:
    + [x] Split CSS rules into modules according to SMACSS rules:
        * [x] [Base Rules] &rarr; [`_base.scss`][_base.scss]
        * [x] [Layout Rules] &rarr; [`_layout.scss`][_layout.scss]
        * [x] [Module Rules] &rarr; [`_modules.scss`][_modules.scss]
        * [x] [State Rules] &rarr; [`_states.scss`][_states.scss]
        * [x] [Theme Rules] &rarr; [`_theme.scss`][_theme.scss]
    + [ ] Handle leftover definitions which don't seem to belong to any of the above.
    + [ ] Improve CSS:
        * [ ] Substitute default values with variables, to allow customization:
            - [ ] colors
            - [ ] margins, borders, etc.
            - [ ] font-faces
        * [ ] Vertical rhythm.
        * [ ] Media queries for smaller screens.
- [ ] [`pml-print-default.scss`][pml-print-default.scss] — _Currently as in original!_
    + [ ] ???

Should `pml-print-default.scss` be split into a separate subset of SMACSS files (`_print-base.scss`, etc.) or should we just include the print styles and media queries with the other modules?

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[normalize.css]: github.com/necolas/normalize.css

<!-- SMACSS -->

[SMACSS]: http://smacss.com "SMACSS website + free book"

[Base Rules]: http://smacss.com/book/type-base "SMACSS Book » Base Rules"
[Layout Rules]: http://smacss.com/book/type-layout "SMACSS Book » Layout Rules"
[Module Rules]: http://smacss.com/book/type-module "SMACSS Book » Module Rules"
[State Rules]: http://smacss.com/book/type-state "SMACSS Book » State Rules"
[Theme Rules]: http://smacss.com/book/type-theme "SMACSS Book » Theme Rules"

<!-- Sass sources -->

[_base.scss]: ./_base.scss "View Sass source"
[_layout.scss]: ./_layout.scss "View Sass source"
[_modules.scss]: ./_modules.scss "View Sass source"
[_normalize.scss]: ./_normalize.scss "View Sass source"
[_states.scss]: ./_states.scss "View Sass source"
[_theme.scss]: ./_theme.scss "View Sass source"
[pml-default.scss]: ./pml-default.scss "View Sass source"
[pml-print-default.scss]: ./pml-print-default.scss "View Sass source"

<!-- EOF -->
