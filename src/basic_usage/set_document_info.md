# 文書情報を設定する

文章を執筆する前に、文書のタイトルや著者などの文書情報を設定しましょう。

前節で作成したGitリポジトリの`book.toml`ファイルは以下のようになっています。

```toml
{{#include ../../book.toml}}
```

以下の設定項目を変更してください。
設定項目の意味については[mdBookのドキュメント]を参照してください。

* `book`セクション
  * `authors`: 著者名を設定する。複数設定する場合はカンマ区切りで記述する
  * `title`: 文書のタイトルを設定する
* `output.html`セクション
  * `git-repository-url`: 前節で作成したGitリポジトリのURLを設定する
  * `edit-url-template`: 前節で作成したGitリポジトリのURLの末尾に`/etc/main/{path}`を追加したものを設定する
  * `site-url`: リポジトリ名を設定する

`book.toml`はGitHubウェブサイト上で直接編集可能ですが、
Gitリポジトリをcloneして編集することを推奨します。
以降の節ではGitリポジトリをcloneしていることを前提に説明します。

[mdBookのドキュメント]: https://rust-lang.github.io/mdBook/format/configuration/index.html
