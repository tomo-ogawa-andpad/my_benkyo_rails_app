# README
簡単な掲示板アプリ
## 初期データ作成
```
$ bin/rails db:seed
```

## 環境変数設定
`.env`ファイルを作成し、サービス開始日を環境変数として設定する
```
SERVICE_START_DATE=2023/2/18
```

## サーバ起動
```
$ bin/rails s
```
http://localhost:3000 にアクセス

## 初期データに含まれるユーザ
- 管理者ユーザ
  - メールアドレス：admin@example.com
  - パスワード：password123
- 一般ユーザ
  - メールアドレス：hoge@example.com
  - パスワード：password123

※管理者ユーザだけがユーザを新規登録する権限を持つ
