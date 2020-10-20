FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /sharemusic
WORKDIR /sharemusic

COPY Gemfile /sharemusic/Gemfile
COPY Gemfile.lock /sharemusic/Gemfile.lock

RUN bundle install
COPY . /sharemusic