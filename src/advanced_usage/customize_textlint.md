# textlintのカスタマイズ

textlintのカスタマイズ方法を紹介します。

## 設定ファイル

textlintの設定ファイル`.textlintrc`の内容を変更することで、textlintの動作をカスタマイズできます。
設定項目については、[textlintのドキュメント]を参照してください。

mdbook-ja-templateの`.textlintrc`の内容は以下のとおりです。

```json
{{#include ../../.textlintrc}}
```

## プラグイン

textlintはルールを導入することでチェック内容をカスタマイズできます。
textlintで利用可能なルールの一覧は[Collection of textlint rule]を参照してください。

### プラグインの追加

新たにルールを追加したい場合は、`docker/Dockerfile`を編集して、
コンテナ内にルールをインストールしてください。
ルールのインストール方法や`.textlintrc`の設定方法はルールのドキュメントを参照してください。
多くのルールは`cd /npm && npm install textlint-rule-*` でインストールできます。

以下に、[textlint-rule-no-todo]プラグインをインストールする場合の例を示します。

まず、`docker/Dockerfile`を以下のように編集してください。

```Dockerfile
FROM ${BASE_IMAGE}

# ↓追加
RUN cd /npm && npm install textlint-rule-no-todo@2
```

次に、`.textlintrc`に以下を追加してください。

```json
{
    ...,
    "rules": {
        "no-todo": true
    }
}
```

編集後`make check`などを実行すると、ルールが有効になった状態で文書校正が行われます。
また、`make install-lint-tools`を実行している場合、再度実行してください。

[textlintのドキュメント]: https://textlint.github.io/docs/configuring.html
[Collection of textlint rule]: https://github.com/textlint/textlint/wiki/Collection-of-textlint-rule#processor-plugin-list
[textlint-rule-no-todo]: https://github.com/textlint-rule/textlint-rule-no-todo
