# From one of the official ruby images
FROM ruby:2.6.0-alpine

# Installing required packages
RUN \
  apk --update add build-base libffi-dev \
  libxml2-dev libxslt-dev postgresql-dev \
  ruby-json ruby-rake ruby-rdoc tzdata && \
  gem install bundler -v "$BUNDLER_VERSION" --no-document

# Use libxml2, libxslt a packages from alpine for building nokogiri
RUN bundle config build.nokogiri --use-system-libraries

# Available (and reused) args
# Use --build-arg APP_PATH=/usr/app to use another app directory
# Use --build-arg PORT=5000 to use another app default port
ARG APP_PATH='/var/www/vuttr-api'
ARG PORT=3000

# Setting env up
ENV RAILS_ENV='production'
ENV RAKE_ENV='production'
ENV BUNDLER_VERSION 2.0.1

# Metadata
LABEL maintainer="hello@nelsonmfinda.me"

# Adding gems
COPY Gemfile* ./
RUN bundle install --jobs 20 --retry 5 --without development test

# Configuring main directory
RUN mkdir -p $APP_PATH
WORKDIR $APP_PATH

# Adding project files
COPY . $APP_PATH

EXPOSE $PORT
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
