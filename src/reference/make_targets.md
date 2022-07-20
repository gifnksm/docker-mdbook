# makeターゲット一覧

mdbook-ja-templateのMakefileで用意されているターゲットの一覧です。

`make <ターゲット>`のようにターゲットを指定してコマンド実行することで、対応した処理が実行されます。

|       ターゲット       |                             説明                             |
| :--------------------- | :----------------------------------------------------------- |
| `build`                | HTMLファイルのビルド (デフォルトターゲット)                  |
| `check`                | Markdownファイルのチェック (すべてのツール)                  |
| `check-markdown`       | Markdownファイルのチェック (markdownlint)                    |
| `check-mdbook`         | Markdownファイルのチェック (mdbook test)                     |
| `check-textlint`       | Markdownファイルのチェック (textlint)                        |
| `clean`                | ビルド成果物の削除                                           |
| `fix`                  | Markdownファイルの自動修正 (すべてのツール)                  |
| `fix-markdown`         | Markdownファイルの自動修正 (markdownlint)                    |
| `fix-textlint`         | Markdownファイルの自動修正 (textlint)                        |
| `help`                 | ヘルプメッセージの表示                                       |
| `install-lint-tools`   | ホスト環境にチェックツールをインストールする                 |
| `pull`                 | 最新版のDockerコンテナをダウンロードする                     |
| `serve` [^1]           | HTMLファイルをビルドし、`http://localhost:3000/`でホストする |
| `setup-docker-compose` | Docker Compose 用の`.env`ファイルを作成する                  |
| `watch` [^1]           | HTMLファイルのビルド & Markdownファイル更新時の自動再ビルド  |

[^1]: `serve`および`watch`ではサーバプロセスが立ち上がります。Ctrl-C等でプロセスを終了させるまで端末の処理は戻りません。
