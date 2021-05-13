[doc title = PML Sample Document: Bidirectional Text \
    authors = امرؤ القيس, משה קורדובירו‎ \
    date = 2021-05-13

    [ch title = RTL Headings & Paragraphs

    To ensure proper alignment and wrapping of RTL-only [c \[ch] nodes,
    they must be given the attribute [c html_dir=rtl].

    Although RTL-only paragraphs are usually properly handled in automatic,
    it's preferable to set the [c html_dir=rtl] attribute on [c \[p] nodes too.

    Here's an excerpt from the [i One Thousand and One Nights] classic,
    Vol.[sp]I, [i
        [link url = https://en.wikisource.org/wiki/Tale_of_the_Bull_and_the_Ass \
            text = Tale of the Bull and the Ass \
            html_title="English translation by Richard Francis Burton"
        ]]:

[insert file=chunks/arabic_arabian-nights.pml]

    ]


    [ch title = RTL Lists

    For lists containing only RTL text, the [c \[list] node is given the
    attribute [c html_dir=rtl].

        [ch title = Arabic List

[insert file=chunks/list_arabic.pml]

        ]

        [ch title = Hebrew List

[insert file=chunks/list_hebrew.pml]

        ]
    ]
]
