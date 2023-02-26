[doc [title Lists Start Numbers Test]
     [subtitle Arbitrary start numbers w/ nesting]

Tristano Ajmone |
2022-10-23


[quote
[b WARNING] — The code that handles the list [c start] attribute had to be commented out because [c html_start] crashes PMLC 3.1.0 due to a bug. (See: [link (url=https://github.com/pml-lang/pml-companion/issues/91)Issue #91])
]

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

]
