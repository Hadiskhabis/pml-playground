---
title: 'Pandoc Markdown'
subtitle: "Sample document"
author:
- Tristano Ajmone
- Author Two
date: 2022-02-06
...

This WIP document provides examples of how pandoc-markdown features are converted to PML via the `pml-writer`.
As new PML elements are implemented in the writer, their examples will be added to the document.

For more info, refer to the [Pandoc User's Guide].


# Block Elements

## Block Quotations

- See: [Pandoc User's Guide] » [Block quotations](https://pandoc.org/MANUAL.html#block-quotations)

<!-- end of list -->

> Strange women lying in ponds distributing swords is no basis for a system of government.
>
> Supreme executive power derives from a mandate from the masses, not from some farcical aquatic ceremony.


## Code blocks

- See: [Pandoc User's Guide] » [Verbatim (code) blocks](https://pandoc.org/MANUAL.html#verbatim-code-blocks)

### Fenced code blocks

- See: [Pandoc User's Guide] » [Fenced code blocks](https://pandoc.org/MANUAL.html#fenced-code-blocks)

```
function HorizontalRule()
  return '[html\n<hr/>\nhtml]'
end
```

## Lists

- See: [Pandoc User's Guide] » [Lists](https://pandoc.org/MANUAL.html#lists)

### Bullet Lists

- Bold: **Lorem ipsum**.
- Italic: _Lorem ipsum_.
- Code: `Lorem ipsum`.

### Ordered Lists

1. AAA
    1. Sub-element 1.
        1. Sub-sub-element.
    1. Sub-element 2.
2. BBB
3. CCC
4. DDD


## Horizontal Rules

- See: [Pandoc User's Guide] » [Horizontal rules](https://pandoc.org/MANUAL.html#horizontal-rules)

PML doesn't support horizontal rules, so the element is rendered via raw HTML.

*  *  *


# Inline Elements

## Font Styles

- See: [Pandoc User's Guide] » [Inline formatting](https://pandoc.org/MANUAL.html#inline-formatting)

These text formatting styles are natively supported by pandoc Markdown syntax:

- Some **bold** text.
- Some _italic_ text.
- Some `inline code` text.
- Some ^superscript^ text.
- Some ~subscript~ text.
- Some ~~strikeout~~ text.

Pandoc also supports underline and small caps via custom classes and CSS:

```
[Underline]{.underline}
[Small caps]{.smallcaps}
```

## Links

- See: [Pandoc User's Guide] » [Links](https://pandoc.org/MANUAL.html#links-1)

Currently the PML writer discards links attributes and title, which will need to be handled in the future.

- Automatic link: <https://www.pml-lang.dev>
- Inline link: [PML Reference Manual](https://www.pml-lang.dev/docs/reference_manual/index.html)

[Pandoc User's Guide]: https://pandoc.org/MANUAL.htm
