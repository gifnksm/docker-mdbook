# SUMMARY.mdを作る

ウェブサイトでの表示を確認したら、文書の目次となる`src/SUMMARY.md`を作りましょう。

Gitリポジトリの`src/`ディレクトリ配下のファイルをすべて削除して、`src/SUMMARY.md`を作成しましょう。

`src/SUMMARY.md`の中身は以下のようになります。
作成したい文章の内容に沿った目次を作成しましょう。

```markdown
# Summary

[はじめに](intro.md)

- [ユーザーズガイド](guide/README.md)
  - [インストール方法](guide/install.md)
  - [使い方](guide/usage.md)
- [リファレンスガイド](reference/README.md)
  - [コマンド一覧](reference/commands.md)
  - [メッセージ一覧](reference/messages.md)

---

- [付録](appendix.md)
```

`src/SUMMARY.md`の構造については[mdBookのドキュメント]を参照してください。
通常のMarkdownファイルとは異なり、`src/SUMMARY.md`では一部のMarkdown文法しか使用できません。
`src/SUMMARY.md`の内容に問題がある場合は、`make serve`/`make watch`/`make build`の出力にエラーが表示されます。
出力された内容に従ってファイルを修正してください。

## Tips

文書執筆を楽にするテクニックを紹介します。

### ドラフト

以下のようにURLが空のリンクを記載することで、該当するページがドラフトであることを示すことができます。
ドラフトのページは、ウェブサイト上では灰色で表示され、`src/`配下にファイルは作成されません。

```markdown
[ページ名]()
```

空のリンクはMarkdownlintのルール[MD042 - No empty links][MD042]によって警告されます。
警告を無効化するためには、以下を`src/SUMMARY.md`の先頭に追加してください。

```html
<!-- markdownlint-disable MD042 -->
```

## サンプル

以下に、本ドキュメントの`SUMMARY.md`を示します。

```markdown
{{#include ../SUMMARY.md}}
```

[mdBookのドキュメント]: https://rust-lang.github.io/mdBook/format/summary.html
[MD042]: https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md#md042
