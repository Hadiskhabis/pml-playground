[doc [title TeX Math Test]
     [subtitle Inline- and display-math via MathJax.]

Tristano Ajmone |
2022-11-04


[html
<!-- Load required MathJax library -->
<script type="text/javascript" id="MathJax-script" async
  src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js">
</script>
html]

Inline math: [verbatim \\(z = x + y\\)]

Display math block:

[html
\[
\begin{vmatrix}
  a & b\\
  c & d
\end{vmatrix}
=ad-bc
\]
html]

[b References:]

[list
[el [link url=https://pandoc.org/MANUAL.html#math text="Pandoc Manual » Math"]]
[el [link url=https://www.mathjax.org/ text="MathJax"]]
]



]
