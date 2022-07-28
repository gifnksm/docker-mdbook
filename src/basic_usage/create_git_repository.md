# Gitリポジトリを作成する

mdbook-ja-templateと同じ内容のGitリポジトリを作成します。
GitHubにリポジトリを作成する方法と、GitLabにリポジトリを作成する方法のそれぞれについて説明します。

## GitHubにリポジトリを作成する方法

mdbook-ja-templateはテンプレートリポジトリとして設定されているため、同じ内容のGitリポジトリを簡単に作成できます。

Gitリポジトリを作成するには、GitHubウェブサイトから作成する方法と、GitHub CLIで作成する方法があります。
どちらの方法でも生成されるリポジトリは同じ内容です。

### GitHubウェブサイトから作成する方法

以下手順に従うことで、GitHubウェブサイトからGitリポジトリを作成できます。

1. [Create a new repository from mdbook-ja-template]へアクセスする
2. 表示された入力フォームへ必要事項を記入する
3. "Create repository from template" ボタンを押す

### GitHub CLIで作成する方法

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

[Create a new repository from mdbook-ja-template]: https://github.com/gifnksm/mdbook-ja-template/generate

## GitLabにリポジトリを作成する方法

以下手順に従うことで、mdbook-ja-templateプロジェクトをフォークして新たなプロジェクト(Gitリポジトリ)を作成できます。

1. [Fork project]へアクセスする
2. 表示された入力フォームへ必要事項を記入する
3. "Fork project" ボタンを押す

新規作成したプロジェクトは、mdbook-ja-templateとフォークの関係となります。
フォークの関係を維持したくない場合、プロジェクトの「設定」→「一般」→「高度な設定」→「フォークの関係を削除」より、「フォークの関係を削除」ボタンを押してください。

[Fork project]: https://gitlab.com/gifnksm/mdbook-ja-template/-/forks/new
