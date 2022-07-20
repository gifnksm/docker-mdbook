# mdBook で日本語の技術文書を書く

[mdBook] で日本語の技術文書を書くためのテンプレートです。

[MathJax] で文章中に数式を埋め込むことができます。

文中に `\\( \int x dx = \frac{x^2}{2} + C \\)` と書くと、
\\( \int x dx = \frac{x^2}{2} + C \\) という数式が表示されます。

独立した数式を埋め込むこともできます。

```math
\\[ \mu = \frac{1}{N} \sum_{i=0} x_i \\]
```

\\[\mu = \frac{1}{N} \sum_{i=0} x_i \\]

[mermaid.js] でグラフを描画できます。

```mermaid-source
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```

```mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```

[mdBook]: https://github.com/rust-lang/mdBook
[MathJax]: https://www.mathjax.org/
[mermaid.js]: https://mermaid-js.github.io/mermaid/
