---
title: 'Pandoc Markdown'
subtitle: "Sample document"
author:
- Tristano Ajmone
- Author Two
date: 2022-10-23
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

- Top level -- **bold**.
- Top level -- _italic_.
    + Sub level.
    + Sub level.
        * Sub-sub level.
- Top level -- `inline code`.

### Ordered Lists

Decimal numerals:

1. One
    1. One-Sub
        1. One-Sub-Sub
    #. Two-Sub
#. Two
#. Three
#. Four

Lower-roman numerals:

i. One
#. Two
#. Three
#. Four

Lower-alpha numerals:

a. One
#. Two
#. Three
#. Four

Arbitrary start numbers:

3. Three (dec)
#. Four
#. Five
    II.  Two (roman uc)
    #.  Three
    #.  Four
#. Six
#. Seven
    C.  Three (alpha uc)
    #.  Four
    #.  Five


> **WARNING** — The code that handles the list `start` attribute had to be commented out because `html_start` crashes PMLC 3.1.0 due to a bug. (See: [Issue #91](https://github.com/pml-lang/pml-companion/issues/91))


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

### Empty Links

The PML Writer corrects empty links by rendering the link text only:

- [an empty link]()


## Images

- See: [Pandoc User's Guide] » [Images](https://pandoc.org/MANUAL.html#images)

> **WARNING** --- PML doesn't support external images via HTTP! so we'll be testing only with local images.

### Inline Images

Images are considered by pandoc to be inline if they are not the only element in a paragraph.

#### Local Image File

An inline image: ![The PML cool image](../_assets/pml-cool.png)

An inline image with alt-text: ![The PML cool image](../_assets/pml-cool.png "Alt-text is cool too!")

#### Web Image

An inline image: ![The PML cool image](https://www.pml-lang.dev/images/PML_plane_200_200.png)

An inline image with alt-text: ![The PML cool image](https://www.pml-lang.dev/images/PML_plane_200_200.png "Alt-text is cool too!")

### Captioned Images

![The PML cool image](../_assets/pml-cool.png)

Captioned image without caption:

![](../_assets/pml-cool.png)

<!----------------------------- REFERENCE LINKS ------------------------------>

[Pandoc User's Guide]: https://pandoc.org/MANUAL.htm


<!-- EOF -->
