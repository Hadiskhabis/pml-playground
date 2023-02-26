[doc [title Escaping Tests]


2022-02-28


This document tests whether PML escaping rules are correctly applied during conversion.

[list
[el [link (url=https://www.pml-lang.dev/docs/user_manual/index.html)PML User Manual]:

[list
[el [link (url=https://www.pml-lang.dev/docs/user_manual/index.html#escape_characters)Escape Characters]

[list
[el [link (url=https://www.pml-lang.dev/docs/user_manual/index.html#ch__12)Nodes Escaping rules]]
[el [link (url=https://www.pml-lang.dev/docs/user_manual/index.html#ch__13)Attributes Escaping rules]]
]]
]]
]

[ch [title Nodes Text]

The escaping rules for text inside nodes (i.e. normal text) are:

[code ()
~~~~~~~
mandatory:  \   [   ]
optional:   \t  \r  \n  \uhhhh  \Uhhhhhhhh
~~~~~~~
]


[ch [title Test Mandatory Text Escapes]

Path C:\\Windows\\ | node \[b bold\]

Path [c C:\\Windows\\] | node [c \[b bold\]]

Path [b C:\\Windows\\] | node [i \[b bold\]]

Path [strike C:\\Windows\\] | node \[b bold\]

Path [sup C:\\Windows\\] | node [span (html_style="font-variant: small-caps;") \[b bold\]]

Path [sub C:\\Windows\\] | node [span (html_style="text-decoration: underline;") \[b bold\]]

[ch [title \[H3\] Heading]

[list
[el Path C:\\Windows\\ | node [c \[b bold\]] | node [b \[b bold\]]]
]

[ch [title \[H4\] Heading]

[quote
Path C:\\Windows\\ | node [c \[b bold\]]

[quote
Path C:\\Windows\\ | node [c \[b bold\]]
]

[list
[el Path C:\\Windows\\ | node [c \[b bold\]] | node [b \[b bold\]]]
]
]

[html
~~~~~
<!---------------------------- REFERENCE LINKS ------------------------------->
~~~~~
]


]]]]

]
