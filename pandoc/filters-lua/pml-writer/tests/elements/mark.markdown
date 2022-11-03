---
title: 'Span Test'
subtitle: "Rendering span nodes"
author: Tristano Ajmone
date: 2022-11-03
...


To highlight text, use the `mark` class (via `bracketed_spans` ext.):

> Some [highlighted text]{.mark} example.

Or, via the `native_spans` extension, only for HTML output:

> Some <span class="mark">highlighted text</span> example.

**References:**

- [Pandoc Manual » Highlighting](https://pandoc.org/MANUAL.html#highlighting)
- [`bracketed_spans`](https://pandoc.org/MANUAL.html#extension-bracketed_spans)
- [`native_spans`](https://pandoc.org/MANUAL.html#extension-native_spans)
