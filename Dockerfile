FROM ruby:3.0.2

LABEL maintainer="vjdavid621@gmail.com"

# Install node 14-LTS and yarn
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get update -qq && apt-get install -qq --no-install-recommends \
    nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
RUN npm install -g yarn@1

WORKDIR /usr/src/app/
COPY Gemfile* /usr/src/app/
ENV BUNDLE_PATH /gems
RUN bundle install
COPY . /usr/src/app/

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
