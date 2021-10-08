[doc [title A Sample PML Document]

  [!set PML_Ver = "2.0.0"]

  [ch [title Basic Formatting]

    PML [!get PML_Ver] supports text formatting in [b bold ], [i italic ], etc.

    You also include comments [- like this one -] in your source documents,
    to annotate your pending tasks without affecting the final document.

    [ch [title (id = nested_comments) "Nested Comments"]

      In PML, all comments are [i block comments ], and they can be nested to
      any level, which makes it very practical to temporarily exclude parts of
      text from the generated document.

      Thanks to the PML lexer for Rouge, [- which is finally ready[- and
      available on GitHub-], -] we can highlight PML code in Asciidoctor.

    ]
  ]
]
