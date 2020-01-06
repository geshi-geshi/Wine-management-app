# ワイン管理アプリ
https://wine-management-app.herokuapp.com/

## 概要
ワインの登録編集削除機能、検索機能、お気に入り機能を備えたアプリ

## 環境
Ruby 2.5.1
Ruby on Rails 5.2.3
Rspec 3.9

## 機能一覧
ユーザー登録機能、ログイン機能
お気に入り機能
ページネーション機能(will_paginate)
検索機能(ransack)
画像アップロード(s3)
ワインCRUD機能
楽天市場検索(楽天api)

```
$ source ~/.bash_profile

MySQL起動
$ mysql.server start

RSpecを実行
$ bundle exec rspec

MySQL停止
$ mysql.server stop
```

heroku
https://wine-management-app.herokuapp.com/

```
$ git push heroku master
$ heroku pg:reset DATABASE
$ heroku run rails db:migrate
$ heroku run rails db:seed

ログ確認（リアルタイム）
$ heroku logs --tail
heroku logs -t

heroku DB接続
$ mysql -u DB_USERNAME -p -h DB_HOSTNAME DB_NAME

紐付け
$ git remote add heroku https://git.heroku.com/wine-management-app.git
```

