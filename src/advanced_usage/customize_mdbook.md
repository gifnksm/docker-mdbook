# mdBookのカスタマイズ

mdBookのカスタマイズ方法を紹介します。

## 設定ファイル

mdBookの設定ファイル`book.toml`の内容を変更することで、mdBookの動作をカスタマイズできます。
設定項目については、[mdBookのドキュメント]を参照してください。

mdbook-ja-templateの`book.toml`の内容は以下のとおりです。

```toml
{{#include ../../book.toml}}
```

## プラグイン

mdBookは`mdbook-*`という形式のコマンドをプラグインとして組み込み、出力内容の変更などを行うことができます。
mdBookで利用可能なプラグインの一覧は[Third party plugins]を参照してください。

mdbook-ja-templateでは以下のプラグインが組み込まれています。

* **[mdbook-mermaid]:** mdBookに[mermaid.js]サポートを追加するプラグイン
* **[mdbook-linkcheck]:** ドキュメント中に無効なリンクが含まれていないかチェックするプラグイン

### プラグインの追加

新たにプラグインを追加したい場合は、`docker/Dockerfile`を編集して、
コンテナ内にプラグインをインストールしてください。
プラグインのインストール方法や`book.toml`の設定方法はプラグインのドキュメントを参照してください。
多くのプラグインは`cargo install` でインストールできます。

以下に、[mdbook-toc]プラグインをインストールする場合の例を示します。

まず、`docker/Dockerfile`を以下のように編集してください。

```Dockerfile
FROM ${BASE_IMAGE}

# ↓追加
RUN cargo install mdbook-toc --version 0.9.0 --root /usr/local/bin
```

次に、`book.toml`に以下を追加してください。

```toml
[preprocessor.toc]
command = "mdbook-toc"
renderer = ["html"]
```

編集後`make build`などを実行すると、プラグインが有効になった状態でウェブサイトが生成されます。

[mdBookのドキュメント]: https://rust-lang.github.io/mdBook/format/configuration/index.html
[Third party plugins]: https://github.com/rust-lang/mdBook/wiki/Third-party-plugins
[mdbook-mermaid]: https://github.com/badboy/mdbook-mermaid
[mermaid.js]: https://mermaidjs.github.io/
[mdbook-linkcheck]: https://github.com/Michael-F-Bryan/mdbook-linkcheck
[mdbook-toc]: https://github.com/badboy/mdbook-toc
