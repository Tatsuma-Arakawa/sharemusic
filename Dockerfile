FROM ruby:2.5.8

RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                       libpq-dev \        
                       nodejs           

RUN mkdir /sharemusic

ENV APP_ROOT /sharemusic
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
ADD . $APP_ROOT

RUN apt-get install -y vim

CMD ["rails", "server", "-b", "0.0.0.0"] 