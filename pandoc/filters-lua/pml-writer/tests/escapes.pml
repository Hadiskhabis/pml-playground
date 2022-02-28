[doc [title Escaping Tests]


2022-02-28


This document tests whether PML escaping rules are correctly applied during conversion.

[list
[el [link url=https://www.pml-lang.dev/docs/user_manual/index.html text="PML User Manual"]:

[list
[el [link url=https://www.pml-lang.dev/docs/user_manual/index.html#escape_characters text="Escape Characters"]

[list
[el [link url=https://www.pml-lang.dev/docs/user_manual/index.html#ch__12 text="Nodes Escaping rules"]]
[el [link url=https://www.pml-lang.dev/docs/user_manual/index.html#ch__13 text="Attributes Escaping rules"]]
]]
]]
]

[ch [title Nodes Text]

The escaping rules for text inside nodes (i.e. normal text) are:

[code
mandatory:  \   [   ]
optional:   \t  \r  \n  \uhhhh  \Uhhhhhhhh
code]


[ch [title Test Mandatory Text Escapes]

Path C:\\Windows\\ | node \[b bold\]

Path [c C:\\Windows\\] | node [c \[b bold\]]

[html
<!---------------------------- REFERENCE LINKS ------------------------------->
html]


]
]

]
