# Docker Composeの使い方

mdbook-ja-templateではコマンド実行のためにDocker Composeを使用しています。
mdbook-ja-templateの`docker-compose.yml`の内容は以下のとおりです。

```yaml
{{#include ../../docker-compose.yml}}
```

## コンテナ内のコマンドを直接実行する

コンテナ内のコマンドを直接実行する場合は、Docker Composeを使用してください。

## UID, GIDの設定

Docker Composeの起動時は現在操作しているユーザのユーザIDとグループIDを環境変数として与える必要があります。
コンテナ内のプロセスが生成するファイルの所有者をrootではなく、現在のユーザにするためです。

コンテナ内で`mdbook help`コマンドを実行する場合は、以下のようにDocker Composeを実行してください。
`UID`, `GID`は環境変数ではなくシェルの変数であるため、Docker Composeプロセスへと通知するために環境変数として明に設定する必要があります。

```console
env UID=${UID} GID=${GID} docker compose run --rm mdbook help
```

`.env`ファイルを用意することで、コマンドラインで`UID`/`GID`を設定することを省略できます。
以下コマンドを実行することで`.env`ファイルが生成されます。
すでに`.env`ファイルが存在する場合、内容は上書きされてしまうので注意してください。

```console
make setup-docker-compose
# => .envが生成される
docker compose run --rm mdbook help
# => UID, GIDの設定は暗黙的に行われる
```

## コマンドの実行

以下の形式でコマンドを実行できます。

```console
docker compose run --rm <コマンド名> <引数>
```

コマンド名には以下を指定できます。

* `mdbook`: mdbookコマンドを実行する
* `mdbook-mermaid`: mdbook-mermaidコマンドを実行する
* `mdbook-linkcheck`: mdbook-linkcheckコマンドを実行する
* `markdownlint`: markdownlintコマンドを実行する
* `textlint`: textlintコマンドを実行する
* `exec`: 引数で指定されたコマンドを実行する

コンテナ内でbashの会話型セッションを開始する場合のコマンド例を以下に示します。

```console
docker compose run --rm exec bash
```
