FROM ruby:2.5.8
RUN apt-get update
RUN apt-get install -y mysql-devel
RUN apt-get install -y 

WORKDIR /splatoon2chat
COPY Gemfile Gemfile.lock /splatoon2chat/
RUN gem install bundler && bundle install
