FROM ruby:2.5
RUN apt-get update && apt-get install -y\
    build-essential\
    libpq-dev\
    nodejs\
    postgresql-client\
    yarn
WORKDIR /my-app
COPY Gemfile Gemfile.lock /my-app/
RUN bundle install