# Gitリポジトリを作成する

[mdbook-ja-template]と同じ内容のGitリポジトリを作成します。
mdbook-ja-templateはテンプレートリポジトリとして設定されているため、同じ内容のGitリポジトリを簡単に作成できます。

Gitリポジトリを作成するには、GitHubウェブサイトから作成する方法と、GitHub CLIで作成する方法があります。

## GitHubウェブサイトから作成する方法

以下手順に従うことで、GitHubウェブサイトからGitリポジトリを作成できます。

1. [Create a new repository from mdbook-ja-template]へアクセスする
2. 表示された入力フォームへ必要事項を記入する
3. "Create repository from template" ボタンを押す

## GitHub CLIで作成する方法

GitHub CLI (`gh`コマンド) を実行することでGitリポジトリを作成します。

以下は`repository`という名前の公開リポジトリを作成する場合のコマンド実行例です。
`--template https://github.com/gifnksm/mdbook-ja-template` オプションが、mdbook-ja-templateを使用することを示しています。
その他のオプション指定は必要に応じて追加・変更してください。

```console
$ gh repo create \
    --template https://github.com/gifnksm/mdbook-ja-template \
    --public \
    repository
✓ Created repository gifnksm/repository on GitHub
```

[mdbook-ja-template]: https://github.com/gifnksm/mdbook-ja-template
[Create a new repository from mdbook-ja-template]: https://github.com/gifnksm/mdbook-ja-template/generate
