[doc
    [title PML Documentation Samples]
    [subtitle () (Edited for PML 3.1.0)]

Updated: 2022-11-23[nl]
Docs source: PML 3.1.0

This document collates excerpts from the official PML manuals in order to
offer a preview of how the PML docs would look with a given stylesheet.

Since each PML reference document has a unique style-pattern in its way
of presenting its contents, selected excerpts from multiple documentation
files were gathered in order to represent their distinguishing formatting
and styling traits.

[note   The excerpts from the PML documentation found here might have been
        tweaked and adapted according to need, and keeping their contents
        accurate and up to date with their latest upstream version is beyond
        the goals of this project.
        Furthermore, the excerpts will only be updated if they underwent
        significant formatting or styling changes, or if some breaking
        changes in the syntax prevent their conversion.]

[admon (label=warning)
    The PML documentation often uses HTML attributes to customize
    the style of its contents, therefore always inspect elements
    with the browser DevTools to check if inline styles are being
    applied.
]

[- *********************************************************************** -]
[ch (id=nodesref) [title PML Nodes Reference Manual]

    [table
        [tr [tc [b PML Version]][tc PMLC 3.1.0 2022-10-03]]
        [tr [tc [b License]][tc [link url=https://creativecommons.org/licenses/by-nd/4.0/ text="CC BY-ND 4.0"]]]
        [tr [tc [b Author and Copyright]][tc Christian Neumanns]]
        [tr [tc [b Website]][tc [link url=https://www.pml-lang.dev/]]]
    ]

Excerpts from the
[link   url=https://www.pml-lang.dev/docs/reference_manual/index.html#fundamental_block_nodes
        text="PML Nodes Reference Manual"]
v3.1.0.

The [i PML Nodes Reference Manual] presents each node adopting the same
formatting and styling pattern consistently across the document.
The [c \[doc] node section was picked, along with the beginning of its
following section in order to visually test how new node sections are
represented.


[ch ( id="fundamental_block_nodes" ) [title Fundamental Nodes]
    [ch ( id="node_doc" ) [title Document]

        [b Name: ][c doc]

        [b Kind:] Node with child nodes

        [header Description]
        [p Every PML document must start with a 'doc' node. It is the root node of the document.]

        [header Attributes]
        [list
            [el
                [header Node Identifier]
                [table
                    [tr [tc [b Name]][tc id]]
                    [tr [tc [b Is positional parameter]][tc No]]
                    [tr [tc [b Description]][tc A unique identifier for the node.[nl][nl]An id can be used to:[nl]- identify a node so that an internal link can be done with an 'xref' (cross reference) node.[nl]- identify a node so that it can be styled individually with CSS[nl]- create an HTML anchor so that it can be accessed with the # (hash) sign (e.g. writing id=foo will enable you to have an HTML link ending with #foo.[nl][nl]An identifier must start with a letter or an underscore, and can be followed by any number of letters, digits, underscores, dots, and hyphens. Note for programmers: The regex of an identifier is: \[a-zA-Z_\]\[a-zA-Z0-9_\\.-\]*. Identifiers are case-sensitive. The following identifiers are all different: name, Name, and NAME.[nl]]]
                    [tr [tc [b Type]][tc string or null]]
                    [tr [tc [b Required]][tc no]]
                    [tr [tc [b Default Value]][tc null]]
                    [tr [tc [b Example(s)]][tc id = basic_concept]]
                ]
            ]

        ]

        [b HTML Attributes:] allowed

        [header Example]
        [list
            [el
                [p PML code:]
                [code
                    [doc [title A Nice Surprise]

                        Author: Giovanni Spiridigliotsky

                        Lorem ipsum blah blah blah
                    ]
                code]
            ]
            [el
                [p Result:]
                [html
                    <div style="border: 1px dotted grey; padding-left: 1em; padding-right: 1em;border-radius: 7px;">
                    <h1 class="pml-doc-title">A Nice Surprise</h1>
                    <p class="pml-paragraph">Author: Giovanni Spiridigliotsky</p>
                    <p class="pml-paragraph">Lorem ipsum blah blah blah </p>

                    </div>

                html]
            ]
            [el
                [p HTML code generated:]
                [code
                    <h1 class="pml-doc-title">A Nice Surprise</h1>
                    <p class="pml-paragraph">Author: Giovanni Spiridigliotsky</p>
                    <p class="pml-paragraph">Lorem ipsum blah blah blah </p>

                code]
            ]
        ]

    ]

    [ch ( id="node_p" ) [title Paragraph]

        [b Name: ][c p]

        [b Kind:] Node with child nodes

        [header Description]
        [p A paragraph is a set of one or more sentences.[nl]It is not required to embed a paragraph within a node. Text not explicitly embedded in a node is automatically converted to a paragraph node.[nl]A double-new-line creates a paragraph break. All other whitespace is converted to a single space. Hence, two sentences separated by a single new-line will result in a single paragraph composed of two sentences.]

    \[…\]

    ]
]
]

[- *********************************************************************** -]
[ch (id=cmdman) [title PMLC Commands Reference Manual]

    [table
        [tr [tc [b PML Version]][tc PMLC 3.1.0 2022-10-03]]
        [tr [tc [b License]][tc [link url=https://creativecommons.org/licenses/by-nd/4.0/ text="CC BY-ND 4.0"]]]
        [tr [tc [b Author and Copyright]][tc Christian Neumanns]]
        [tr [tc [b Website]][tc [link url=https://www.pml-lang.dev/]]]
    ]

Excerpts from the
[link   url=https://www.pml-lang.dev/docs/commands_manual/index.html#command_PML_to_HTML
        text="PML Nodes Reference Manual"]
v3.1.0.

The [i PMLC Commands Reference Manual] presents its contents adopting a
consistent tables based approach, so I picked the beginning part of the
[i Convert PML to HTML] section because it had the widest and contents-richer
tables.


[ch ( id="command_PML_to_HTML" ) [title Convert PML to HTML]
    [b Name: ][c PML_to_HTML]

    [b Alternative name: ][c p2h]

    [header Description]
    [p Convert a PML document into an HTML document.]

    [header Examples]
    [input
        ~~~
        pmlc p2h article.pml
        pmlc p2h --output ../website/docs/about/index.html about.pml
        ~~~
    ]

    [header Input Parameters]
    [list
        [el
            [header PML Input File]
            [table
                [tr [tc [b Name]][tc input]]
                [tr [tc [b Alternative name]][tc i]]
                [tr [tc [b Is positional parameter]][tc Yes (# 1)]]
                [tr [tc [b Description]][tc The path of the PML file to be converted to HTML.[nl]If this parameter is not specified, or if the value is explicitly set to 'stdin' then the PML input is read from the OS's standard input device.]]
                [tr [tc [b Type]][tc file_path or null]]
                [tr [tc [b Required]][tc no]]
                [tr [tc [b Default Value]][tc null]]
                [tr [tc [b Example(s)]][tc input/text/article.pml]]
            ]
        ]

        [el
            [header CSS Files]
            [table
                [tr [tc [b Name]][tc CSS_files]]
                [tr [tc [b Alternative name]][tc css]]
                [tr [tc [b Is positional parameter]][tc No]]
                [tr [tc [b Description]][tc This parameter is used to explicitly specify one or more CSS files to be used in the final HTML document.[nl][nl]The value is a comma separated list of directories and/or files.[nl]If a directory is specified, then all files in the directory (including files in sub-directories) are used.[nl]All directory and file paths can be absolute or relative.[nl]Each file must be a valid CSS file.[nl][nl]By default, file(s) in sub-directory 'config/PML_to_HTML/css' of PMLC's shared data directory are used.[nl]If these default files are to be used together with other CSS files specified by this parameter, then the default files location must also explicitly be specified in the parameter]]
                [tr [tc [b Type]][tc directory_or_file_paths or null]]
                [tr [tc [b Required]][tc no]]
                [tr [tc [b Default Value]][tc \[C:\\Users\\Lisa\\AppData\\Roaming\\PML_Companion\\3_0\\config\\PML_to_HTML\\css\\pml-default.css, C:\\Users\\Lisa\\AppData\\Roaming\\PML_Companion\\3_0\\config\\PML_to_HTML\\css\\pml-print-default.css\]]]
                [tr [tc [b Example(s)]][tc ../../shared/css, css]]
            ]
        ]
    ]
]

]

[- *********************************************************************** -]
[ch (id=userman) [title PML User Manual]

    [table
        [tr [tc [b PML Version]][tc 3.1.0 2022-10-03]]
        [tr [tc [b License]][tc [link url=https://creativecommons.org/licenses/by-nd/4.0/ text="CC BY-ND 4.0"]]]
        [tr [tc [b Author and Copyright]][tc Christian Neumanns]]
        [tr [tc [b Website]][tc [link url=https://www.pml-lang.dev/]]]
        [tr [tc [b PML Markup Code]][tc [link url=https://github.com/pml-lang/user-manual text=Github]]]
    ]

Excerpts from the
[link   url=https://www.pml-lang.dev/docs/user_manual/index.html#escape_characters
        text="PML User Manual"]
v3.1.0, file [c 07_07_escaping.pml].

Unlike other PML documents, the [i PML User Manual] doesn't feature a
repetitive formatting pattern to present its contents, because its more
"free form" in nature.

I picked the [i Escape Characters] section as a representative sample
because it's the section containing more examples of the formatting styles
adopted across the document, and because of its tables.


[ch (id=escape_characters) [title Escape Characters]

    Character escape rules in [i node text] and [i attribute values] are slightly different, as explained in the following chapters.

    [ch (id=node_escape_characters) [title Nodes]

        As seen already, characters [c \[] and [c \]] define the start and end of a node.

        Therefore, if these characters are used in text, they must be escaped, to avoid confusion. This is done by prefixing the character with a backslash ([c \\]). For instance, instead of writing [c \[], we have to write [c \\\[].

        As a backslash is used as escape character, it must itself also be escaped when it is used in text. Hence, instead of writing [c \\], we have to write [c \\\\].

        Here is an example to demonstrate how escaping works:

        [list
            [el [header PML code:]
                [code
                    File path = C:\\tests\\example.txt

                    Instead of writing \\, we have to write \\\\

                    Instead of writing \[, we have to write \\\[
                code]
            ]

            [el [header Result:]
                File path = C:\\tests\\example.txt

                Instead of writing \\, we have to write \\\\

                Instead of writing \[, we have to write \\\[
            ]
        ]

        The final rule is simple: Characters [c \[], [c \]], and [c \\] must be preceded by [c \\] when they are used in normal text.

        Besides characters that [i must] be escaped, there are also characters that [i can] be escaped if desired, as shown in the following table:
        [table_data
            Character or name, Escape sequence, Mandatory
            -
            \, \\, yes
            [, \[, yes
            ], \], yes
            Tab, \t, no
            Carriage return, \r, no
            Line feed, \n, no
            Unicode escape 4 hex digits, \uhhhh (e.g. \u2764 for "heart shape": ♥), no
            Unicode escape 8 hex digits, \Uhhhhhhhh (e.g. \U0001F600 for "grinning face": 😀), no
        table_data]
    ]

    [ch (id=attribute_escape_characters) [title Attributes]

        Escape sequences are not supported in [i un]quoted attribute values.

        If an attribute value is quoted, the following escape sequences are supported:
        [table_data
            Character or name, Escape sequence, Mandatory
            -
            ", \", yes
            \, \\, yes
            [, \[, no
            ], \], no
            Tab, \t, no
            Carriage return, \r, no
            Line feed, \n, no
            Unicode escape 4 hex digits, \uhhhh (e.g. \u2764 for "heart shape": ♥), no
            Unicode escape 8 hex digits, \Uhhhhhhhh (e.g. \U0001F600 for "grinning face": 😀), no
        table_data]

        Example: Suppose we want to assign the value [c C:\\temp\\test.txt] to attribute [c path]. In this case the value can be quoted or unquoted. If the value is quoted then [c \\] must be escaped:
        [table_data (halign="R,L")
            Quoted:, path = "C:\\temp\\test.txt"
            Unquoted:, path = C:\temp\test.txt
        table_data]
    ]
]

]

[- doc-end -]

]
