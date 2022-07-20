# mdbook-ja-template

[mdBook] で日本語の技術文書を書くためのテンプレートです。
Markdownの文書をHTMLに変換し、ウェブブラウザから読むことができます。

本テンプレートは以下を含みます。

* 執筆時に使用する各種コマンド・ライブラリを導入済みの [Docker コンテナイメージ]
* 執筆時の典型的タスクを簡単に実行するための [Makefile]
* [mdBook] の拡張機能
  * [mermaid.js] によるグラフ描画 ([mdbook-mermaid] を使用)
* 文書の記載内容を検証するためのチェック機能
  * Markdownファイルの構文チェック機能 ([markdownlint] を使用)
  * 文書の校正機能 ([textlint] を使用)
* GitHub Actionsでの自動ビルド、自動テスト、および、GitHub Pagesへの自動デプロイ機能

生成されたHTMLファイルはGitHub Actionsの実行によりGitHub Pagesへデプロイされます。
デプロイされたページのURLは以下の形式になります。

`https://<username>.github.io/<repository>`

本テンプレートから生成されたHTMLは <https://gifnksm.github.io/mdbook-ja-template/> でホストされています。

## [Makefile] のターゲット一覧

`make <ターゲット>` のようにターゲットを指定することで、指定されたターゲットを実行できます。

|    ターゲット    |                          説明                          |
| :--------------- | :----------------------------------------------------- |
| `build`          | HTML ファイルのビルド (デフォルトターゲット)           |
| `check`          | ソースファイルに対する各種チェック                     |
| `check-markdown` | `.md` ファイルの構文チェック                           |
| `check-mdbook`   | ドキュメント中の Rust ソースコードのコンパイルチェック |
| `check-textlint` | ドキュメントの文章の更正チェック                       |
| `clean`          | ビルド成果物の削除                                     |
| `fix`            | ソースファイル中の修正可能な誤りの修正                 |
| `fix-markdown`   | `.md` ファイルの修正 (markdownlint)                    |
| `fix-textlint`   | `.md` ファイルの修正 (textlint)                        |
| `help`           | ヘルプの表示                                           |
| `serve`          | HTML ファイルをホストするサーバの起動                  |
| `setup-host`     | ホスト環境で必要な設定ファイルとツールを設定します     |
| `watch`          | ソースコード変更の監視 & 変更時の自動再ビルド          |

[mdBook]: https://github.com/rust-lang/mdBook
[Docker コンテナイメージ]: https://github.com/gifnksm/docker-mdbook-ja
[mermaid.js]: https://mermaid-js.github.io/mermaid/
[mdbook-mermaid]: https://github.com/badboy/mdbook-mermaid
[Makefile]: ./Makefile
[markdownlint]: https://github.com/DavidAnson/markdownlint
[textlint]: https://textlint.github.io/
