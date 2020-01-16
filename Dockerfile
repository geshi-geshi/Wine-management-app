FROM ruby:2.5.1
ENV LANG C.UTF-8
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN gem install bundler

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

ENV APP_HOME /wine_management_app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME