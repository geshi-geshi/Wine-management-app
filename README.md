# README

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
https://protected-sands-79333.herokuapp.com/

```
$ git push heroku master
$ heroku pg:reset DATABASE
$ heroku run rails db:migrate
$ heroku run rails db:seed

ログ確認（リアルタイム）
$ heroku logs --tail
heroku logs -t

HerokuのCLEARDB_DATABASE_URLを確認
$ heroku config --app protected-sands-79333

heroku DB接続
$ mysql -u DB_USERNAME -p -h DB_HOSTNAME DB_NAME

紐付け
$ git remote add heroku https://git.heroku.com/protected-sands-79333.git
```

