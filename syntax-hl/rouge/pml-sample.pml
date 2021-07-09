[doc title = A Sample PML Document \
     authors = Tristano Ajmone \
     date = 2021-07-09

  [ch title = Basic Formatting

    PML supports text formatting in [b bold ], [i italic ], etc.

    You also include comments [- like this one -] in your source documents,
    to annotate your pending tasks without affecting the final document.

    [ch title = "Nested Comments" \
      id = nested_comments

      In PML, all comments are [i block comments ], and they can be nested to
      any level, which makes it very practical to temporarily exclude parts of
      text from the generated document.

      Thanks to the PML lexer for Rouge, [- which if finally ready[- and
      available on GitHub-], -] we can highlight PML code in Asciidoctor.

    ]
  ]
]
