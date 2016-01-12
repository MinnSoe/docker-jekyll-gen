FROM frolvlad/alpine-oraclejdk8:slim
MAINTAINER Minn Soe <contributions@minn.io>

ENV LANG C.UTF-8
ENV BUILD_PACKAGES \
	bash curl-dev ruby-dev build-base nodejs libffi-dev libxml2 libxslt \
	libxslt-dev libxml2-dev zlib-dev zlib
ENV RUBY_PACKAGES ruby ruby-io-console ruby-bundler ruby-rdoc ruby-irb

#####################################################################
## Install packages
#####################################################################
RUN apk update && \
		apk upgrade && \
		apk add $BUILD_PACKAGES && \
    apk add $RUBY_PACKAGES && \
    rm -rf /var/cache/apk/* && \
		gem install bundler


#####################################################################
## Install ruby dependencies
#####################################################################
RUN bundle config --global frozen 1

RUN mkdir -p /usr/install && mkdir -p /usr/deploy

WORKDIR /usr/install

COPY Gemfile /usr/install/
COPY Gemfile.lock /usr/install/
RUN bundle install

WORKDIR /usr/deploy
