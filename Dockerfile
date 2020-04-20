# FROM	ベースを指定
FROM ruby:2.5.1

# ENV	永続的な環境変数を設定
ENV LANG C.UTF-8

# RUN	パッケージをコンテナにインストールするために使用
# yarnパッケージ管理ツールインストール
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y yarn

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN gem install bundler

# WORKDIR	あとに続く説明の作業ディレクトリを設定
WORKDIR /tmp
# ADD	ファイルとディレクトリをコンテナにコピー
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

ENV APP_HOME /wine_management_app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME