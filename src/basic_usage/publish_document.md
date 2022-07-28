# ウェブサイトとして公開する

Markdownファイルに対する変更をcommitしGitHub(またはGitLab)へpushします。
文章校正やMarkdownスタイルチェックの指摘への対応漏れがないことを確実にするため、
別ブランチを作成して変更内容をcommitするのが良いでしょう。
`main`ブランチに対するPull Request(Merge Request)を作成し、GitHub Actions(GitLab CI)のチェックが通ったことを確認したらマージしましょう。

変更が`main`ブランチに取り込まれると、公開されているウェブサイトの内容が更新されます。
公開されたウェブサイトには以下URLからアクセスできます。

* GitHubの場合: `https://<username>.github.io/<repository>`
* GitLabの場合: `https://<username>.gitlab.io/<repository>`

`<username>`はGitHubまたはGitLabのアカウント名、`<repository>`はGitリポジトリ名です。
