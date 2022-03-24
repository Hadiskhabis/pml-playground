[- PML 2.3.0 | 2022-08-11 -]

[doc [title Style Sheet Demo Document]

This is a demo document to test stylesheets against an average HTML page covering most supported elements.

[u:set baseliner_opts="{ gridHeight: 16 , gridColor: 'red' }"]
[u:ins_file path=../_shared/baseliner_info.pml]

[u:set
  link_ex = "\[link url=https://github.com text=\"link example\"\]"
]

[- Headings -]

[ch (id=heading2) [title Heading Level 2]
[ch (id=heading3) [title Heading Level 3]
[ch (id=heading4) [title Heading Level 4]
[ch (id=heading5) [title Heading Level 5]
[ch (id=heading6) [title Heading Level 6]
]]]]]

[- Text Styles -]

[ch (id=text-styles) [title Text Styles]

Individual font styles:
[b bold text], lorem [i italic text], ipsum
[sub subscript text], dolor [sup superscript text], sit amet
[strike strikethrough text], consectetur [c inline code] adipisicing,
[u:get link_ex].

[ch (id=text-styles-combined) [title Combined Text Styles]

Bold-combined font styles:
[b [i bold + italic text]], lorem
[b [sub bold + subscript text]], ipsum
[b [sup bold + superscript text]], dolor
[b [strike bold + strikethrough text]], sit amet
[b [c bold + inline code]] consectetur,
[b bold + [u:get link_ex]] ex ea commodo.

Italic-combined font styles:
[i [b italic + bold text]], lorem
[i [sub italic + subscript text]], ipsum
[i [sup italic + superscript text]], dolor
[i [strike italic + strikethrough text]], sit amet
[i [c italic + inline code]] consectetur,
[i italic + [u:get link_ex]] ex ea commodo.

Subscript-combined font styles:
[sub [b subscript + bold text]], lorem
[sub [i subscript + italic text]], ipsum
[sub [sup subscript + superscript text]], dolor
[sub [strike subscript + strikethrough text]], sit amet
[sub [c subscript + inline code]] consectetur,
[sub subscript + [u:get link_ex]] ex ea commodo.

Superscript-combined font styles:
[sup [b superscript + bold text]], lorem
[sup [i superscript + italic text]], ipsum
[sup [sub superscript + subscript text]], dolor
[sup [strike superscript + strikethrough text]], sit amet
[sup [c superscript + inline code]] consectetur,
[sup superscript + [u:get link_ex]] ex ea commodo.

Strikethrough-combined font styles:
[strike [b strikethrough + bold text]], lorem
[strike [i strikethrough + italic text]], ipsum
[strike [sub strikethrough + subscript text]], dolor
[strike [sup strikethrough + superscript text]], sit amet
[strike [c strikethrough + inline code]] consectetur,
[strike strikethrough + [u:get link_ex]] ex ea commodo.

[note Inline-code [c \[c..\]] can only be combined with other styles as a child style because it can't contain sub-nodes!]

]]

[- Tables -]

[ch (id=tables) [title Tables]

[table_data (halign="C,L,R")
    Position, Product, Price
    -
    1, Organic food, 12.50
    2, Meditation lessons, 150.00
    -
    ,,Total: 162.50
table_data]

]

[- Admonitions -]

[ch (id=admonitions) [title Admonitions]

Admonitions and notes are useful asides blocks to encapsulate comments, tips
and warning into boxes that are visually contrasted from the main text flow.

[admon (label=Tip)
The [c \[admon] node allows defining a custom [i label] for the block.
]

The [c label] attribute is mandatory on all admonitions.

[admon (label=Warning)
This means that PML admonitions are not restricted to predefined labels.
]

Since notes are the most commonly used admonition, PML provides a dedicated
[c \[note] node, which is just an admonition shorthand that doesn't require defining
a [c label] attribute.

[note This is a [c \[note] node, which also belongs to the [i admonitions] family.]

Both [c \[admon] and [c \[note] nodes are rendered using the same HTML classes,
so they share the same CSS styles.

[ch (id=admonitions_nested) [title Nested Admonitions]

You are free to nest admonitions and notes into each other.

[admon (label=Tip)
Admonitions are nestable.
[note Nesting admonitions can be useful.]
[admon (label=Warning)
But don't over-do-it! Results will look poor on devices with a small screen.
]]

]]

[- Quotations -]

[ch (id=quotations) [title Quotations]

[quote (source="Thomas Szasz")
We achieve active mastery over illness and death by delegating all
responsibility for their management to physicians, and by exiling the sick and
the dying to hospitals.

But hospitals serve the convenience of staff not patients: we cannot be properly
ill in a hospital, nor die in one decently; we can do so only among those who
love and value us.

The result is the institutionalized dehumanization of the ill, characteristic of
our age.
]

]

[- Verbatim Text -]

[ch (id=verbatim) [title Verbatim Text]

[ch (id=monospace) [title Monospace]

[monospace
      1
    1   1
  1   2   1
1   3   3   1
]
]

[ch (id=sourcecode) [title Source Code]

[code (lang=ruby)
def sum_eq_n?(arr, n)
  return true if arr.empty? && n == 0

  arr.product(arr).reject { |a,b| a == b }.any? { |a,b| a + b == n }
end
code]
]

[ch (id=input) [title Input]

[input
pmlc create_reference_manual -output_directory path/to/dir
input]
]

[ch (id=output) [title Output]

[output
Congratulations!
The new database has been created successfully.
output]

]]

[- doc-end -]
]
