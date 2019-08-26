FROM ruby:2.5.1-stretch
RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
        && apt-get install -y nodejs
RUN apt-get update && \
	apt-get -yq install sqlite3 && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD . /var/app

WORKDIR /var/app

RUN mkdir -p ./log
RUN mkdir -p ./tmp/pids

COPY Gemfile Gemfile.lock ./
ENV BUNDLER_VERSION 2.0.2
RUN gem install bundler && bundle install --jobs 20 --retry 5
