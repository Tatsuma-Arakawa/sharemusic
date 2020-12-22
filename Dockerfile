FROM ruby:2.5.8

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs

ADD nginx.conf /etc/nginx/sites-available/app.conf
RUN rm -f /etc/nginx/sites-enabled/default && \
    ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/app.conf

RUN mkdir /sharemusic
WORKDIR /sharemusic

COPY Gemfile /sharemusic/Gemfile
COPY Gemfile.lock /sharemusic/Gemfile.lock

RUN bundle install
COPY . /sharemusic

RUN apt-get install -y vim

CMD ["rails", "server", "-b", "0.0.0.0"] 