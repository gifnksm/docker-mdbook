# markdownlintのカスタマイズ

markdownlintのカスタマイズ方法を紹介します。

## 設定ファイル

markdownlintの設定ファイル`.markdownlint.jsonc`の内容を変更することで、markdownlintの動作をカスタマイズできます。
設定項目については、[markdownlint-cliのドキュメント]を参照してください。
また、markdownlintのルールについては[markdownlintのドキュメント]を参照してください。

mdbook-ja-templateの`.markdownlint.jsonc`の内容は以下のとおりです。

```json
{{#include ../../.markdownlint.jsonc}}
```

[markdownlint-cliのドキュメント]: https://github.com/igorshubovych/markdownlint-cli#configuration
[markdownlintのドキュメント]: https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md
