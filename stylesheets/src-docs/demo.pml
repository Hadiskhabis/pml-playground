[doc
    [title PML 3.1.0 Stylesheet Demo]
    [subtitle () (doc subtitle node)]

Updated: 2022-11-19

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

[ch (id=heading2sub) [title Subtitled Heading Level 2]
                    [subtitle I'm The Subtitle]
[ch (id=heading3sub) [title Subtitled Heading Level 3]
                    [subtitle I'm The Subtitle]
[ch (id=heading4sub) [title Subtitled Heading Level 4]
                    [subtitle I'm The Subtitle]
[ch (id=heading5sub) [title Subtitled Heading Level 5]
                    [subtitle I'm The Subtitle]
[ch (id=heading6sub) [title Subtitled Heading Level 6]
                    [subtitle I'm The Subtitle]
]]]]]

[- Headers -]

[ch (id=headers) [title Header Node]

A header is a small title displayed on a separate line.
It's not included in the table of contents.
Headers can be inserted anywhere in a document.

[header A Header]

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat.

[header Another Header]

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

]

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

[- Lists -]

[ch (id=lists) [title Lists]

[ch (id=bullet-lists) [title Bullet Lists]

[list
    [el Item.]
    [el Item.]
    [el Item.]
    [el Lorem ipsum dolor sit amet, consectetur adipisicing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna
        aliqua. Ut enim ad minim veniam, quis nostrud exercitation
        ullamco laboris nisi ut aliquip ex ea commodo consequat.]
    [el Duis aute irure dolor in reprehenderit in voluptate velit
        esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
        occaecat cupidatat non proident, sunt in culpa qui officia
        deserunt mollit anim id est laborum.]
]


Without bullet markers (via [c html_style="list-style-type:none"] attribute):

[list (html_style="list-style-type:none")
    [el Item.]
    [el Item.]
    [el Item.]
    [el Lorem ipsum dolor sit amet, consectetur adipisicing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna
        aliqua. Ut enim ad minim veniam, quis nostrud exercitation
        ullamco laboris nisi ut aliquip ex ea commodo consequat.]
    [el Duis aute irure dolor in reprehenderit in voluptate velit
        esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
        occaecat cupidatat non proident, sunt in culpa qui officia
        deserunt mollit anim id est laborum.]
]

Using an emoji as the bullet marker (via [c html_style="list-style-type: '\\2B50'"] attribute):

[list (html_style="list-style-type: '\\2B50'")
    [el Item.]
    [el Item.]
    [el Item.]
    [el Lorem ipsum dolor sit amet, consectetur adipisicing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna
        aliqua. Ut enim ad minim veniam, quis nostrud exercitation
        ullamco laboris nisi ut aliquip ex ea commodo consequat.]
    [el Duis aute irure dolor in reprehenderit in voluptate velit
        esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
        occaecat cupidatat non proident, sunt in culpa qui officia
        deserunt mollit anim id est laborum.]
]

][ch (id=ordered-lists) [title Ordered Lists]

[note   PML doesn't support ordered lists via dedicated nodes,
        but it's possible to turn an ordinary (bulleted) list
        into an ordered list via the [c html_style"list-style-type:"]
        attribute.]

Decimal numerals markers ([c list-style-type:decimal]):

[list (html_style="list-style-type:decimal")
    [el Item.]
    [el Item.]
    [el Item.]
    [el Lorem ipsum dolor sit amet, consectetur adipisicing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna
        aliqua. Ut enim ad minim veniam, quis nostrud exercitation
        ullamco laboris nisi ut aliquip ex ea commodo consequat.]
    [el Duis aute irure dolor in reprehenderit in voluptate velit
        esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
        occaecat cupidatat non proident, sunt in culpa qui officia
        deserunt mollit anim id est laborum.]
]

Roman numerals markers ([c list-style-type:lower-roman]):

[list (html_style="list-style-type:lower-roman")
    [el Item.]
    [el Item.]
    [el Item.]
    [el Lorem ipsum dolor sit amet, consectetur adipisicing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna
        aliqua. Ut enim ad minim veniam, quis nostrud exercitation
        ullamco laboris nisi ut aliquip ex ea commodo consequat.]
    [el Duis aute irure dolor in reprehenderit in voluptate velit
        esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
        occaecat cupidatat non proident, sunt in culpa qui officia
        deserunt mollit anim id est laborum.]
]

]]

[- Footnotes -]

[ch (id=footnotes) [title Footnotes]

This group of footnotes will be show below this paragraph.
[fnote A simple footnote.]
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
[fnote A styled [i footnote].]

[fnotes]

[ch (id=endnotes-example) [title Endnotes Example]

The notes within this section[fnote_ref did=blocknote1]
will be shown at the end of the document, in the
[link url=#endnotes text="Endnotes section"].

Their numbering will start over from 1, since they are a different
set of notes altogether.[fnote Another simple footnote.]


[fnote_def (id=blocknote1)
    A complex footnotes containing block nodes.

    Defined via a [c fnote_def] node:

    [code
    [fnote_def (id = note-id)
        Note contents.
    ]
    code]
]

]]


[- Media -]

[ch (id=media) [title Media]

[ch (id=images) [title Images]

Simple image:

[image  source = https://placekitten.com/550/300
        html_alt = "Kitten-Smitten!"]

[header Captioned Image with Border]

A captioned image with [c link] and [c border] attribute:

[image  source = https://placekitten.com/600/400
        link = https://placekitten.com/600/400
        border = yes]
[caption Caption: I was smitten by this kitten]



[header Images Positioning]

Right aligned image via [c align] attribute:
[image  source = https://placekitten.com/300/250
        align = right]

[note
    [header All Images Are Block Elements!]

    It's not possible to have images floating around the text
    because PML wraps images within [c <figure>] tags, over which
    authors don't have any control beyond the exposed [c \[image]
    node attributes.

    Of course, this could be achieved via raw HTML, but that's beyond
    the goals of this test document.
]

][ch (id=audio) [title Audio]

Plain [c \[audio] node:

[audio source=https://upload.wikimedia.org/wikipedia/commons/b/b2/Whistling_blackbird.ogg]


[header Captioned Audio]

[audio source=https://upload.wikimedia.org/wikipedia/commons/5/58/Barking_of_a_dog_2.ogg]
[caption Barking Dog]


[header Audio Attributes]

This [c \[audio] node uses the [c border] and [c align] attributes:

[audio  source=https://upload.wikimedia.org/wikipedia/commons/5/58/Barking_of_a_dog_2.ogg
        border = yes
        align = center]

[- Video -]

][ch (id=video) [title Video]

Plain [c \[video] node:

[video source = https://upload.wikimedia.org/wikipedia/commons/e/e8/Fire_burning.ogv]


[header Captioned Video]

[video source = https://upload.wikimedia.org/wikipedia/commons/e/e8/Fire_burning.ogv]
[caption Fire Burning]


[header Video Attributes]

This [c \[video] node uses the [c border], [c align], [c width] and [c height] attributes:

[video  source = https://upload.wikimedia.org/wikipedia/commons/e/e6/Explanations-of-a-magic-trick-across-the-life-span-Video1.ogv
        width = 720
        height = 480
        border = yes
        align = center]

[- YouTube Video -]

][ch (id=youtube) [title YouTube Video]

Captioned [c \[youtube_video] node with [c align], [c width] and [c height] attributes:

[youtube_video yid = NLOmBEiUCKw
        width = 720
        height = 540
        align = center]
[caption Samuel Malavsky (1894–1983): [i Haven Yakir Li Efraim]]

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

[ch (id=table-captioned) [title Captioned Table]

[table_data (halign="C,L,R")
    Position, Product, Price
    -
    1, Organic food, 12.50
    2, Meditation lessons, 150.00
    -
    ,,Total: 162.50
table_data]
[caption My Table Caption]

]]

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


[- Endnotes -]

[ch (id=endnotes) [title Endnotes]

[fnotes]

]

[- doc-end -]

]
