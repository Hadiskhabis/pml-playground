---
title: 'TeX Math Test'
subtitle: "Inline- and display-math via MathJax."
author: Tristano Ajmone
date: 2022-11-04
...


```{=html}
<!-- Load required MathJax library -->
<script type="text/javascript" id="MathJax-script" async
  src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js">
</script>
```

Inline math: $z = x + y$

Display math block:

$$
\begin{vmatrix}
  a & b\\
  c & d
\end{vmatrix}
=ad-bc
$$

**References:**

- [Pandoc Manual » Math](https://pandoc.org/MANUAL.html#math)
- [MathJax](https://www.mathjax.org/)
