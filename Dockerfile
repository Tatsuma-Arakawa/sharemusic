FROM ruby:2.5

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs

RUN mkdir /sharemusic
WORKDIR /sharemusic

COPY Gemfile /sharemusic/Gemfile
COPY Gemfile.lock /sharemusic/Gemfile.lock

RUN bundle install
COPY . /sharemusic