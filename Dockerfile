# FROM ruby:2.7.8

# RUN apt-get update && apt-get install -y npm && npm install -g yarn

# RUN mkdir -p /var/app
# COPY . /var/app
# WORKDIR /var/app

# RUN bundle install
# RUN cp .env.example .env
# RUN bundle exec rake db:create db:migrate

# CMD rails s -b 0.0.0.0


FROM ruby:2.7.8
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY .env.example .env
RUN bundle exec rails db:create db:migrate
