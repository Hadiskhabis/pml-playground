[doc title = A Sample PML Document \
     authors = Tristano Ajmone \
     date = 2021-07-09

  [const PML_Ver = "1.5.0"]

  [ch title = Basic Formatting

    PML <<PML_Ver>> supports text formatting in [b bold ], [i italic ], etc.

    You also include comments [- like this one -] in your source documents,
    to annotate your pending tasks without affecting the final document.

    [ch title = "Nested Comments" \
      id = nested_comments

      In PML, all comments are [i block comments ], and they can be nested to
      any level, which makes it very practical to temporarily exclude parts of
      text from the generated document.

      Thanks to the PML lexer for Rouge, [- which is finally ready[- and
      available on GitHub-], -] we can highlight PML code in Asciidoctor.

    ]
  ]
]
