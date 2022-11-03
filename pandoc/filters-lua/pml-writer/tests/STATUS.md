# PML Lua Writer Status

Overall progress of the pandoc filter, pending tasks and known issues.

> **WARNING** — This status report is far from complete!
> Many implemented elements are omitted, as well as elements pending implementation.
>
> Currently, this document serves mostly as a memo for the features being worked upon.


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Doc Nodes/Elements](#doc-nodeselements)
    - [Source Code Annotations](#source-code-annotations)
- [Missing Features](#missing-features)
    - [Metadata](#metadata)
    - [TOC Settings](#toc-settings)
- [Known Issues](#known-issues)
    - [Headings Conversion](#headings-conversion)
    - [List Start Number](#list-start-number)
- [Code Improvements and Sanitation](#code-improvements-and-sanitation)

<!-- /MarkdownTOC -->

-----

# Doc Nodes/Elements

Status of pandoc AST nodes conversion functions, by function names to ease source look-up.

- [x] `BlockQuote()`
- [x] `BulletList()` — works, but not 100% complete.
- [x] `CaptionedImage()`
- [ ] `Cite()`
- [x] `Code()` &rarr; `[c` — works, but discards attributes.
- [x] `CodeBlock()` — work, but needs polishing.
- [ ] `DefinitionList()` &rarr; no PML equivalent!
- [ ] `DisplayMath()`
- [ ] `Div()`
- [ ] `DoubleQuoted()`
- [x] `Emph()`
- [x] `Header()` — works, but only if doc has Level 1 internal headings.
- [ ] `HorizontalRule()`
- [x] `Image()`
- [ ] `InlineMath()`
- [ ] `LineBlock()`
- [ ] `LineBreak()`
- [x] `Link()` — works, but discards title and attributes.
- [ ] `Note()` &rarr; `[fnote_def`
- [x] `OrderedList()` — fails due to PMLC bug, but code is there.
- [ ] `Para()`
- [ ] `Plain()`
- [x] `RawBlock()` — works, but can be improved.
- [ ] `RawInline()`
- [ ] `SingleQuoted()`
- [x] `SmallCaps()` &rarr; `[span (html_style=`
- [x] `SoftBreak()`
- [x] `Space()`
- [ ] `Span()`
- [x] `Str()`
- [x] `Strikeout()`
- [x] `Strong()`
- [x] `Subscript()`
- [x] `Superscript()`
- [x] `Table()` — works, but discards columns alignment and width info.
- [x] `Underline()` &rarr; `[span (html_style=`

## Source Code Annotations

In `pml-writer.lua`, pandoc AST element functions which haven't yet been adapted, or which are not completed, are preceded by a comment line starting with `-- @TDB:` or `-- @WIP:`, respectively, and followed by the element function name. E.g.

```lua
-- @TBD:Subscript()
-- @WIP:SoftBreak()
```

Similarly, any piece of code requiring developers' attention is marked with a comment in the form `-- @[A-Z]:` (e.g. `-- @NOTE:`, `-- @TODO:`, etc.) to allow quick navigation of pending issues via editor Search functionality.


# Missing Features

Aspects of the document format conversion which still need to be looked into.

## Metadata

Pandoc handles complex metadata info, but PML doesn't yet provide this feature, so we need to work out ways to avoid loss of meaningful metadata entries:

- [x] **author** & **date** — currently emitted as first paragraph:

      ```
      <author> | <date>
      ```

- [ ] _other_? — study what other metadata is worth keeping.

## TOC Settings

Some of pandoc TOC settings should be portable to PML via `[doc [options` sub-nodes, although most of these settings are not a priority (with the exception of the TOC title).

- [ ] **TOC title** &rarr; `[TOCTitle`
- [ ] **TOC position**? &rarr; `[TOCPosition `


# Known Issues

Problems that need addressing and which we are already aware of.

## Headings Conversion

When converting from pandoc markdown, the filter expects all in-document headings to be Level 1. If the author considers the document `title` (metadata) as the Level-1 entry, and uses Level 2 headings only withing the document (i.e. `##`) then the filter will produce an extra closing bracket at the document end, resulting in an error.

I need to find a way to track when there's a discrepancy between expected and actual headings.

## List Start Number

The code that handles the list `start` attribute has been implemented in the filter, but it had to be circumvented because `html_start` crashes PMLC 3.1.0 due to a bug. (See: [Issue #91](https://github.com/pml-lang/pml-companion/issues/91))


# Code Improvements and Sanitation

The Lua writer code could still be optimized, and there are aspects of the conversion process which haven't been fully tested yet.

- [ ] **PML Node Functions** — Some pandoc elements result in the emission of common PML nodes, so we might benefit from creating dedicated functions for PML nodes:
    + [x] `[caption` &rarr; `caption_node()` — shared by images, tables, and maybe other pandoc elements.
    + [ ] `[html` — raw HTML nodes are used by elements which have no PML counterpart, but could also be used as a temporary solution for unported elements, so the filter can be used even if not fully implemented.
    + [ ] Group PML node-emission functions together in the source file, and adopt a proper naming convention for them.
- [ ] **Contents Filtering** — since the filter is based on the Lua sample filter for an HTML writer, all element functions need to be checked to ensure that node contents and attributes values are handled properly according to PML rules.
    + [ ] **Contents escaping** — [node escaping rules] are handled via `escape()`, which has been quickly adapted to cover PML escaping rules, but its code might need improvements, and also the way its currently used is based on the sample filter and its needs for HTML:
        * [ ] Rename `escape()` to `node_escape()`.
        * [ ] Ensure that all pandoc element functions are correctly invoking the node escaping function, based on PML needs instead of HTML.
    + [ ] **Attributes escaping** — [attributes escaping rules] differ slightly, and only apply to quoted attributes. Currently the filter is not taking care of ensuring that quoted attributes are escaped at all.
        * [ ] Create `attr_escape()` function.
    + [ ] **HTML entities** — markdown documents might contain HTML entities (either named or code-point value based), so we need to ensure that these are always intercepted and converted to PML Unicode escapes. I'm not sure whether HTML entities are kept in the pandoc AST at all, and if they are I need to find out _how_ they are represented and stored, so I need to create some test documents to see how such entities in a markdown source are transformed in the JSON AST file.
- [ ] **Comments preservation** — markdown files can contain HTML comments, so it would be nice to be able to preserve them by converting them into PML comments.
    + [ ] Find out how HTML comments are represented in the AST. Are they Raw nodes?
    + [ ] What other input formats might carry comments? (i.e. other than HTML)
    + [ ] Find comments examples in pandoc native format to add to test suite.


<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[attributes escaping rules]: https://www.pml-lang.dev/docs/user_manual/index.html#attribute_escape_characters "PML User Manual » Escape Characters » Attributes"

[node escaping rules]: https://www.pml-lang.dev/docs/user_manual/index.html#node_escape_characters "PML User Manual » Escape Characters » Nodes"

<!-- EOF -->
