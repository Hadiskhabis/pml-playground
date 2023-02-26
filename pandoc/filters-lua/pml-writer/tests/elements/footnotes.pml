[doc [title Footnotes Test]
     [subtitle Rendering footnotes as end-notes.]

Tristano Ajmone |
2022-11-14


A plain footnote[fnote_ref did=fn1], one containing styles[fnote_ref did=fn2],
and another[fnote_ref did=fn3] with block elements.

[b References:]

[list
[el [link (url=https://pandoc.org/MANUAL.html#footnotes)Pandoc Manual » Footnotes]]
]


[- Footnotes definitions -]

[fnote_def (id=fn1)
I’m a plain footnote.
]

[fnote_def (id=fn2)
I’m a footnote [i with] [b styles].
]

[fnote_def (id=fn3)
I’m a complex footnote with multiple paragraphs and block elements.

This is my second paragraph.

[quote
I even contain a quotation.
]
]

[fnotes]

]
