---
title: 'Escaping Tests'
date: 2022-02-28
...

This document tests whether PML escaping rules are correctly applied during conversion.

- [PML User Manual][]:
    + [Escape Characters]
        * [Nodes Escaping rules]
        * [Attributes Escaping rules]

# Nodes Text

The escaping rules for text inside nodes (i.e. normal text) are:

    mandatory:  \   [   ]
    optional:   \t  \r  \n  \uhhhh  \Uhhhhhhhh

## Test Mandatory Text Escapes

Path C:\\Windows\\ | node \[b bold\]

Path `C:\Windows\` | node `[b bold]`


<!---------------------------- REFERENCE LINKS ------------------------------->

[PML User Manual]: https://www.pml-lang.dev/docs/user_manual/index.html
[Escape Characters]: https://www.pml-lang.dev/docs/user_manual/index.html#escape_characters
[Nodes Escaping rules]: https://www.pml-lang.dev/docs/user_manual/index.html#ch__12
[Attributes Escaping rules]: https://www.pml-lang.dev/docs/user_manual/index.html#ch__13
