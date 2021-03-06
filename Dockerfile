FROM ruby:2.5.8
RUN apt-get update
RUN apt-get install -y \
    build-essential \
    nodejs \
    sudo \
    vim

WORKDIR /splatoon2chat
COPY Gemfile Gemfile.lock /splatoon2chat/
RUN gem install bundler -v '2.2.3' && bundle install