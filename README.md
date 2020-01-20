# ワイン管理アプリ
https://www.wine-management-app.work/


<img width="1239" alt="read me" src="https://user-images.githubusercontent.com/44439885/72330829-8471dd00-36fa-11ea-8df8-73356addc125.png">

※テストユーザーを用意し、簡単ログインボタンを用意していますので、すぐにログインできます。


## 概要
ワインの登録/編集/削除機能、検索機能、お気に入り機能を備えたアプリです。

## 目的
以前ソムリエをやっていまして、
日本人はあまりワインの知識や興味がある人が少ないと思っております。<br>
ワインが詳しくない人にも情報を気軽に知れるようなアプリ、<br>
そして飲んで美味しかったワインなどの情報を他の方に共有できるようなアプリがあったらいいと思い
開発しました。<br>
<br>
<br>


ユーザーが好きなワインなどを共有できるようにアプリ上でワインの登録ができるようにし、<br>
そのワイン名称でそのまま楽天リンクへ行け、購入もスムーズにできる機能も作りました。<br>
もっともっとワインが身近なものになってほしいと思っています。


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
- docker
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
- エディタ周り(VSCode/IntelliJ)

git hubのissueを利用し、タスクを管理しながら開発しました。

機能ごとにブランチを分けてプルリクベースで本番を意識して開発しました。