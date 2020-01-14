# ワイン管理アプリ
https://wine-management-app.herokuapp.com/

<img width="1237" alt="read me" src="https://user-images.githubusercontent.com/44439885/72314333-deaa7800-36d1-11ea-9887-950669c9cf1a.png">


## 概要
ワインの登録編集削除機能、検索機能、お気に入り機能を備えたアプリ

## 使用技術
- Ruby 2.5.1
- Ruby on Rails 5.2.3
- Rspec 3.9
- Mysql 5.7
- GitHub
- heroku
- Nginx
- Unicorn
- AWS
  - VPC
  - EC2 
  - RDS
  - S3
- scss
- bootstrap
- JQuery

## 機能一覧、使用gem
- ユーザー登録機能、ログイン機能(bcrypt)
- お気に入り機能
- ページネーション機能(will_paginate)
- 検索機能(ransack)
- 画像アップロード(S3/fog-aws/carrierwave/rmagick/mini_magick)
- ワインCRUD機能
- 楽天市場検索(楽天API/rakuten_web_service)
- SNSログイン機能(omniauth-twitter/facebook/google-oauth2/bootstrap-social-rails)

## 備考

- テスト周り(rails-controller-testing/factory_bot_rails/database_cleaner)
- UI周り(materialize-sass/material_icons/font-awesome-rails/data-confirm-modal)

git hubのissueを利用し、タスクを管理しながら開発しました。

ブランチ分けてプルリクベースで本番を意識して開発しました。


