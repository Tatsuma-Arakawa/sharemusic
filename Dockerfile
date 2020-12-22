FROM ruby:2.5.8

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs && \
    apt-get install -y nginx

ADD nginx.conf /etc/nginx/sites-available/sharemusic.conf
RUN rm -f /etc/nginx/sites-enabled/default && \
    ln -s /etc/nginx/sites-available/sharemusic.conf /etc/nginx/sites-enabled/sharemusic.conf

RUN mkdir /sharemusic
WORKDIR /sharemusic
COPY Gemfile /sharemusic/Gemfile
COPY Gemfile.lock /sharemusic/Gemfile.lock
RUN bundle install
COPY . /sharemusic
RUN mkdir /sharemusic/tmp/sockets

RUN apt-get install -y vim

CMD bundle exec puma -d && \
    /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf