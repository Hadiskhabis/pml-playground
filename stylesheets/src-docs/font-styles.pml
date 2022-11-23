[doc
    [title PML 3.1.0 Font Styles]

Updated: 2022-11-23

This sample document is designed to extensively test stylesheets against
basic PML font style nodes and their various combinations, to ensure that
styles are correctly rendered as expected.

[-***************************************************************************-]

[u:set baseliner_opts="{ gridHeight: 16, gridColor: 'red' }"]
[u:ins_file path=../_shared/baseliner_info.pml]

[u:set
  link_ex = "\[link url=https://github.com text=\"link example\"\]"
]

[-===========================================================================-]
[ch (id=font_individual) [title Font: Individual Styles]

Individual font styles:
[b bold text], lorem [i italic text], ipsum
[sub subscript text], dolor [sup superscript text], sit amet
[strike strikethrough text], consectetur [c inline code] adipisicing,
[u:get link_ex].

[b Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat, [u:get link_ex].]

[i Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat, [u:get link_ex].]

[sub Subscript: Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat, [u:get link_ex].]

[sup Superscript: Lorem ipsum dolor sit amet, consectetur adipisicing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
commodo consequat, [u:get link_ex].]

[strike Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat, [u:get link_ex].]

[c Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat.]

[link url=https://www.pml-lang.dev text=
"Link: Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat."]

]
[-===========================================================================-]
[ch (id=font_combined) [title Font: Combined Styles]

[note Inline-code [c \[c..\]] can only be combined with other styles as a child style because it can't contain sub-nodes!]

[-----------------------------------------------------------------------------]
[ch (id=font_combined_bold) [title Bold]

Bold-combined font styles:
[b [i bold + italic text]], lorem
[b [sub bold + subscript text]], ipsum
[b [sup bold + superscript text]], dolor
[b [strike bold + strikethrough text]], sit amet
[b [c bold + inline code]] consectetur,
[b bold + [u:get link_ex]] ex ea commodo.

[b [i Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat, [u:get link_ex].]]

[b [sub Subscript: Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat, [u:get link_ex].]]

[b [sup Superscript: Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat, [u:get link_ex].]]

[b [strike Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat, [u:get link_ex].]]

[b [c Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat.]]

[b [link url=https://www.pml-lang.dev text=
"Link: Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat."]]

]
[-----------------------------------------------------------------------------]
[ch (id=font_combined_italic) [title Italic]

Italic-combined font styles:
[i [b italic + bold text]], lorem
[i [sub italic + subscript text]], ipsum
[i [sup italic + superscript text]], dolor
[i [strike italic + strikethrough text]], sit amet
[i [c italic + inline code]] consectetur,
[i italic + [u:get link_ex]] ex ea commodo.

[i [b Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat, [u:get link_ex].]]

[i [sub Subscript: Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat, [u:get link_ex].]]

[i [sup Superscript: Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat, [u:get link_ex].]]

[i [strike Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat, [u:get link_ex].]]

[i [c Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat.]]

[i [link url=https://www.pml-lang.dev text=
"Link: Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat."]]

]
[-----------------------------------------------------------------------------]
[ch (id=font_combined_subscript) [title Subscript]

Subscript-combined font styles:
[sub [b subscript + bold text]], lorem
[sub [i subscript + italic text]], ipsum
[sub [sup subscript + superscript text]], dolor
[sub [strike subscript + strikethrough text]], sit amet
[sub [c subscript + inline code]] consectetur,
[sub subscript + [u:get link_ex]] ex ea commodo.


[sub [b Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat, [u:get link_ex].]]

[sub [i Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat, [u:get link_ex].]]

[sub [sup Superscript: Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat, [u:get link_ex].]]

[sub [strike Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat, [u:get link_ex].]]

[sub [c Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat.]]

[sub [link url=https://www.pml-lang.dev text=
"Link: Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat."]]

]
[-----------------------------------------------------------------------------]
[ch (id=font_combined_superscript) [title Superscript]

Superscript-combined font styles:
[sup [b superscript + bold text]], lorem
[sup [i superscript + italic text]], ipsum
[sup [sub superscript + subscript text]], dolor
[sup [strike superscript + strikethrough text]], sit amet
[sup [c superscript + inline code]] consectetur,
[sup superscript + [u:get link_ex]] ex ea commodo.


[sup [b Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat, [u:get link_ex].]]

[sup [i Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat, [u:get link_ex].]]

[sup [sub Subscript: Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat, [u:get link_ex].]]

[sup [strike Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat, [u:get link_ex].]]

[sup [c Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat.]]

[sup [link url=https://www.pml-lang.dev text=
"Link: Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat."]]

]
[-----------------------------------------------------------------------------]
[ch (id=font_combined_strikethrough) [title Strikethrough]

Strikethrough-combined font styles:
[strike [b strikethrough + bold text]], lorem
[strike [i strikethrough + italic text]], ipsum
[strike [sub strikethrough + subscript text]], dolor
[strike [sup strikethrough + superscript text]], sit amet
[strike [c strikethrough + inline code]] consectetur,
[strike strikethrough + [u:get link_ex]] ex ea commodo.


[strike [b Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat, [u:get link_ex].]]

[strike [i Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat, [u:get link_ex].]]

[strike [sub Subscript: Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat, [u:get link_ex].]]

[strike [sup Superscript: Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat, [u:get link_ex].]]

[strike [c Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat.]]

[strike [link url=https://www.pml-lang.dev text=
"Link: Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat."]]

]
]
[-********************************* doc end *********************************-]
]
