FROM ruby:2.4.0-alpine
RUN apk update && apk add nodejs build-base libxml2-dev libxslt-dev postgresql postgresql-dev sqlite sqlite-dev busybox-suid
WORKDIR /tmp/app
RUN bundle install -j 20 --path /usr/local/lib/ruby/gems/2.4.0
RUN rails new firstApp
WORKDIR /tmp/app/firstApp
RUN echo "gem 'tzinfo-data','>=1.2018.5'">>Gemfile
RUN echo "gem 'pg', '~> 0.21'">>Gemfile
RUN bundle install --no-cache
RUN chmod 777 -R /tmp/app/firstApp