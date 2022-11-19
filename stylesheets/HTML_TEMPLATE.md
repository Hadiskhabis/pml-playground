# PML 3.1.0 HTML Template

Info on the HTML template used by PML, for CSS developers.


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [About](#about)
- [Template Structure](#template-structure)
- [The ToC](#the-toc)

<!-- /MarkdownTOC -->

-----

# About

Since PML templates are still in their early stage, they aren't well documented.

This document attempts to collect some useful information to guide CSS development.

The official documentation on individual nodes does provide examples of their HTML output, which is useful when trying to style PML nodes which result in complex HTML structures.


# Template Structure

Here's the overall structure of the HTML output (comments added):

```html
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="generator" content="PML {{PML_version}} (www.pml-lang.dev)" />
        <title>Document Title</title>
        <!-- CSS stylesheets -->
    </head>
    <body>
    <!-- end of header-template -->
        <div class="pml-doc-wrapper">
            <header class="pml-doc-header">
            </header>
                <div class="pml-doc-content">
                    <aside class="pml-doc-left">
                        <!-- ToC if positioned left -->
                    </aside>
                    <article id="doc__" class="pml-doc-text" id="doc__">
                        <h1 class="pml-doc-title">Document Title</h1>
                        <h1 class="pml-doc-title">Document Subtitle</h1>
                        <!-- ToC if positioned top -->
                        <!-- ... document contents ... -->
                    </article>
                    <aside class="pml-doc-right">
                    </aside>
                </div>
                <footer class="pml-doc-footer">
                </footer>
            </div>
        </div>
    <!-- beginning of footer-template -->
    </body>
</html>
```

The comments adjacent to opening and closing `<body>` tags mark the separation lines between custom header- and footer-templates interventions and PMLC generated contents (over which users have no templating control).

**Notes:**

- The `<header>` and `<footer>` are unused, and their contents can't be controlled via custom templates, since the tags falls outside of the user templates boundaries.
- A `[doc [subtitle` node is rendered as an `<h1>` heading, so a document with both title and subtitle will have two consecutive Level-1 headings.
- It's not clear why why the `<article>` tag contains a double `id="doc__"`.
- The right-hand `<aside>` (class `pml-doc-right`) doesn't have any apparent use right now, since the `TOC_position` parameter only accepts `left`, `top` and `none` as values.

# The ToC

The ToC, if present, can be either positioned left or top.

When the ToC is positioned left, it will be injected within the `<aside class="pml-doc-left">` tag, whereas when top-positioned it will be injected right after the document title/subtitle headings, within `<article>`.

The generated ToC has a rather baroque structure:

```html
<nav class="pml-toc">
    <h2 class="pml-toc-title">Table of Contents</h2>
    <div class="pml-toc-tree" id="TOCTree">
        <ul>
            <li class="pml-toc-leaf-node"><a href="#ch__1">Chap 1</a></li>
            <li class="pml-toc-branch-node">
                <details>
                    <summary><a href="#ch__2">Chap 2</a></summary>
                    <ul>
                        <li class="pml-toc-leaf-node"><a href="#ch__3">Sub Chap 2.1</a></li>
                        <li class="pml-toc-leaf-node"><a href="#ch__4">Sub Chap 2.2</a></li>
                    </ul>
                </details>
            </li>
        </ul>
    </div>
</nav>
```

where branch and leaf entries are distinguished by the `.pml-toc-branch-node` and `.pml-toc-leaf-node` classes on `<li>`, respectively, and the former exploits definition list tags `<detail>` and `<summary>` to provide a clickable folding tree structure without resorting to JavaScript.

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>



<!-- EOF -->
