# ウェブサイトとして公開する

Markdownファイルに対する変更をcommitしGitHubへpushします。
文章校正やMarkdownスタイルチェックの指摘への対応漏れがないことを確実にするため、
別ブランチを作成して変更内容をcommitするのが良いでしょう。
`main`ブランチに対するPull Requestを作成し、GitHub Actionsのチェックが通ったことを確認したらマージしましょう。

変更が`main`ブランチに取り込まれると、公開されているウェブサイトの内容が更新されます。
公開されたウェブサイトには以下URLからアクセスできます。

```url
https://<username>.github.io/<repository>
```

`<username>`はGitHubのアカウント名、`<repository>`はGitリポジトリ名です。
