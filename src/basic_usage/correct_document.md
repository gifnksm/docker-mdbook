# 文書校正する

文書校正およびMarkdownファイルのスタイルチェックを実行するためには、リポジトリのルートディレクトリで以下のコマンドを実行してください。
チェックが実行され、指摘内容が表示されます。
指摘に従い、文章を修正しましょう。

```console
make check -k
```

一部の指摘については、自動で修正可能です。
以下コマンドを実行してください。

```console
make fix -k
```

`make`の`-k`オプションを指定することで、すべてのツールでチェックすることを強制できます。
`-k`オプションを指定しない場合、一部のツールでの指摘しか表示されないことがあります。

## Visual Studio Code への統合

Visual Studio Code (VSCode) を使用している場合、文書校正およびMarkdownファイルのスタイルチェックがVSCode上で行われるよう設定できます。
以下手順に従って設定してください。

1. VSCodeの拡張機能[markdownlint][markdownlint-ext]をインストールする (インストール済みの場合、実施不要)
2. VSCodeの拡張機能[vscode-textlint]をインストールする (インストール済みの場合、実施不要)
3. Gitリポジトリのルートディレクトリで以下コマンドを実行し、必要なツール一式をホスト環境にインストールする

```console
make install-lint-tools
```

ツール一式はGitリポジトリのルートディレクトリ配下にインストールされるため、一般ユーザーの権限でインストール可能です。

ツール一式のインストール後、Dockerコンテナのアップデート等によりツールが更新された場合、上記コマンドを再度実行してください。
更新されたツールによりチェックが行われるようになります。

## その他のエディタ・IDEへの統合

VSCode以外のエディタ・IDEについても、[markdownlint-cli]や[textlint]に対応したものであれば同等の機能が使用できるはずです。

[markdownlint-ext]: https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint
[vscode-textlint]: https://marketplace.visualstudio.com/items?itemName=taichi.vscode-textlint
[markdownlint-cli]: https://github.com/igorshubovych/markdownlint-cli
[textlint]: https://textlint.github.io/
