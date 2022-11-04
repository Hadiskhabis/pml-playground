[doc [title Pandoc Markdown]
     [subtitle Sample document]

Tristano Ajmone, Author Two |
2022-10-23


This WIP document provides examples of how pandoc-markdown features are converted to PML via the [c pml-writer].
As new PML elements are implemented in the writer, their examples will be added to the document.

For more info, refer to the [link url=https://pandoc.org/MANUAL.htm text="Pandoc User’s Guide"].

[ch [title Block Elements]

[ch [title Block Quotations]

[list
[el See: [link url=https://pandoc.org/MANUAL.htm text="Pandoc User’s Guide"] » [link url=https://pandoc.org/MANUAL.html#block-quotations text="Block quotations"]]
]

[html
~~~~~
<!-- end of list -->
~~~~~
html]


[quote
Strange women lying in ponds distributing swords is no basis for a system of government.

Supreme executive power derives from a mandate from the masses, not from some farcical aquatic ceremony.
]

][ch [title Code blocks]

[list
[el See: [link url=https://pandoc.org/MANUAL.htm text="Pandoc User’s Guide"] » [link url=https://pandoc.org/MANUAL.html#verbatim-code-blocks text="Verbatim (code) blocks"]]
]

[ch [title Fenced code blocks]

[list
[el See: [link url=https://pandoc.org/MANUAL.htm text="Pandoc User’s Guide"] » [link url=https://pandoc.org/MANUAL.html#fenced-code-blocks text="Fenced code blocks"]]
]

[code
function HorizontalRule()
  return '[html\n<hr/>\nhtml]'
end
code]


]][ch [title Lists]

[list
[el See: [link url=https://pandoc.org/MANUAL.htm text="Pandoc User’s Guide"] » [link url=https://pandoc.org/MANUAL.html#lists text="Lists"]]
]

[ch [title Bullet Lists]

[list
[el Top level – [b bold].]
[el Top level – [i italic].

[list
[el Sub level.]
[el Sub level.

[list
[el Sub-sub level.]
]]
]]
[el Top level – [c inline code].]
]

][ch [title Ordered Lists]

Decimal numerals:

[list (html_style="list-style-type:decimal")
[el One

[list (html_style="list-style-type:decimal")
[el One-Sub

[list (html_style="list-style-type:decimal")
[el One-Sub-Sub]
]]
[el Two-Sub]
]]
[el Two]
[el Three]
[el Four]
]

Lower-roman numerals:

[list (html_style="list-style-type:lower-roman")
[el One]
[el Two]
[el Three]
[el Four]
]

Lower-alpha numerals:

[list (html_style="list-style-type:lower-alpha")
[el One]
[el Two]
[el Three]
[el Four]
]

Arbitrary start numbers:

[list (html_style="list-style-type:decimal")
[el Three (dec)]
[el Four]
[el Five

[list (html_style="list-style-type:upper-roman")
[el Two (roman uc)]
[el Three]
[el Four]
]]
[el Six]
[el Seven

[list (html_style="list-style-type:upper-alpha")
[el Three (alpha uc)]
[el Four]
[el Five]
]]
]

[quote
[b WARNING] — The code that handles the list [c start] attribute had to be commented out because [c html_start] crashes PMLC 3.1.0 due to a bug. (See: [link url=https://github.com/pml-lang/pml-companion/issues/91 text="Issue #91"])
]

]][ch [title Horizontal Rules]

[list
[el See: [link url=https://pandoc.org/MANUAL.htm text="Pandoc User’s Guide"] » [link url=https://pandoc.org/MANUAL.html#horizontal-rules text="Horizontal rules"]]
]

PML doesn’t support horizontal rules, so the element is rendered via raw HTML.

[html
~~~~~
<hr/>
~~~~~
html]


]][ch [title Inline Elements]

[ch [title Font Styles]

[list
[el See: [link url=https://pandoc.org/MANUAL.htm text="Pandoc User’s Guide"] » [link url=https://pandoc.org/MANUAL.html#inline-formatting text="Inline formatting"]]
]

These text formatting styles are natively supported by pandoc Markdown syntax:

[list
[el Some [b bold] text.]
[el Some [i italic] text.]
[el Some [c inline code] text.]
[el Some [sup superscript] text.]
[el Some [sub subscript] text.]
[el Some [strike strikeout] text.]
]

Pandoc also supports underline and small caps via custom classes and CSS:

[code
[Underline]{.underline}
[Small caps]{.smallcaps}
code]


][ch [title Links]

[list
[el See: [link url=https://pandoc.org/MANUAL.htm text="Pandoc User’s Guide"] » [link url=https://pandoc.org/MANUAL.html#links-1 text="Links"]]
]

Currently the PML writer discards links attributes and title, which will need to be handled in the future.

[list
[el Automatic link: [link url=https://www.pml-lang.dev text="https://www.pml-lang.dev"]]
[el Inline link: [link url=https://www.pml-lang.dev/docs/reference_manual/index.html text="PML Reference Manual"]]
]

[ch [title Empty Links]

The PML Writer corrects empty links by rendering the link text only:

[list
[el an empty link]
]

]][ch [title Images]

[list
[el See: [link url=https://pandoc.org/MANUAL.htm text="Pandoc User’s Guide"] » [link url=https://pandoc.org/MANUAL.html#images text="Images"]]
]

[quote
[b WARNING] — PML doesn’t support external images via HTTP! so we’ll be testing only with local images.
]

[ch [title Inline Images]

Images are considered by pandoc to be inline if they are not the only element in a paragraph.

[ch [title Local Image File]

An inline image: [image source="../_assets/pml-cool.png"]

An inline image with alt-text: [image source="../_assets/pml-cool.png" html_alt="Alt-text is cool too!"]

][ch [title Web Image]

An inline image: [image source="https://www.pml-lang.dev/images/PML_plane_200_200.png"]

An inline image with alt-text: [image source="https://www.pml-lang.dev/images/PML_plane_200_200.png" html_alt="Alt-text is cool too!"]

]][ch [title Captioned Images]

[image source="../_assets/pml-cool.png" html_alt="The PML cool image"][caption The PML cool image]

Captioned image without caption:

[image source="../_assets/pml-cool.png"]

[html
~~~~~
<!----------------------------- REFERENCE LINKS ------------------------------>
~~~~~
html]


[html
~~~~~
<!-- EOF -->
~~~~~
html]



]
]
]

]
