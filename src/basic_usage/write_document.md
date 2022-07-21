# 本文を執筆する

<!-- markdownlint-disable MD048 -->

`src/SUMMARY.md`を作成した後は、本文となる文章を執筆しましょう。

`make serve`または`make watch`を実行している場合、`src/SUMMARY.md`を編集した時点で`src/`ディレクトリ配下に本文を執筆するMarkdownファイルが生成されます。
これらのコマンドを実行していない場合でも、`make build`を実行することでMarkdownファイルが生成されます。

Markdownファイルで使用可能なMarkdown記法については[mdBookのドキュメント]を参照してください。
通常のMarkdown文法に加え、mdbook-ja-templateでは以下の機能が使用可能です。

- [mdBook固有機能]
- [MathJax]による数式の埋め込み
- [mermaid.js]によるフローチャート等の埋め込み

## サンプル

各種機能の使用例を紹介します。

### Rustコードの埋め込み

本文中にRustのコードを埋め込むことができます。
コード中の実行ボタンを押すことで、コードの実行結果を表示できます。

- ソースコード

    ~~~markdown
    ```rust
    fn main() {
        println!("Hello, world!");
    }
    ```
    ~~~

- 表示結果

    ```rust
    fn main() {
        println!("Hello, world!");
    }
    ```

### 数式の埋め込み

`\\(`と`\\)`で数式を囲うことで、本文中に数式を埋め込むことができます。
`\\[`と`\\]`で数式を囲うことで、独立した段落に数式を埋め込むことができます。

- ソースコード

    ~~~markdown
    \\(x\\)の不定積分:

    \\(\int x dx = \frac{x^2}{2} + C\\)
    ~~~

- 表示結果

    \\(x\\)の不定積分:

    \\[\int x dx = \frac{x^2}{2} + C\\]

### フローチャートの埋め込み

本文中にmermaid.jsで記述された図を埋め込むことができます。

- ソースコード

    ~~~markdown
    ```mermaid
    flowchart LR
        A[Start] --> B{Is it?}
        B -->|Yes| C[OK]
        C --> D[Rethink]
        D --> B
        B ---->|No| E[End]
    ```
    ~~~

- 表示結果

    ```mermaid
    flowchart LR
        A[Start] --> B{Is it?}
        B -->|Yes| C[OK]
        C --> D[Rethink]
        D --> B
        B ---->|No| E[End]
    ```

[mdBookのドキュメント]: https://rust-lang.github.io/mdBook/format/markdown.html
[mdBook固有機能]: https://rust-lang.github.io/mdBook/format/mdbook.html
[MathJax]: https://rust-lang.github.io/mdBook/format/mathjax.html
[mermaid.js]: https://mermaid-js.github.io/mermaid/
