FROM ruby:2.4.0-alpine
RUN apk update && apk add nodejs build-base libxml2-dev libxslt-dev postgresql postgresql-dev sqlite sqlite-dev busybox-suid curl
WORKDIR /tmp/app
COPY Gemfile /tmp/app/Gemfile
RUN bundle install -j 20 --path /usr/local/lib/ruby/gems/2.4.0
RUN rails new firstApp
WORKDIR /tmp/app/firstApp
RUN sed -i '/tzinfo-data/d' ./Gemfile
RUN echo "gem 'tzinfo-data','>=1.2018.5'">>Gemfile
RUN echo "gem 'pg', '~> 0.21'">>Gemfile
RUN bundle install --no-cache
RUN chmod 777 -R /tmp/app/firstApp
RUN bundle exec rake db:migrate

EXPOSE 3000
CMD ["/usr/local/bin/bundle", "exec", "rails", "server", "-e", "development"]
#ENTRYPOINT ["/usr/local/bin/bundle", "exec", "rails", "server", "-p", "5000", "-e", "development"]
