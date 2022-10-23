# PML Lua Writer Status

Overall progress of the pandoc filter, pending tasks and known issues.

> **WARNING** — This status report is far from complete!
> Many implemented elements are omitted, as well as elements pending implementation.
>
> Currently, this document serves mostly as a memo for the features being worked upon.


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Known Issues](#known-issues)
    - [Headings Conversion](#headings-conversion)
    - [List Start Number](#list-start-number)

<!-- /MarkdownTOC -->

-----

# Known Issues

## Headings Conversion

When converting from pandoc markdown, the filter expects all in-document headings to be Level 1. If the author considers the document `title` (metadata) as the Level-1 entry, and uses Level 2 headings only withing the document (i.e. `##`) then the filter will produce an extra closing bracket at the document end, resulting in an error.

I need to find a way to track when there's a discrepancy between expected and actual headings.

## List Start Number

The code that handles the list `start` attribute has been implemented in the filter, but it had to be circumvented because `html_start` crashes PMLC 3.1.0 due to a bug. (See: [Issue #91](https://github.com/pml-lang/pml-companion/issues/91))

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>



<!-- EOF -->
