FROM ruby:2.2
MAINTAINER Minn Soe <contributions@minn.so>


#####################################################################
## Add Nodesource repository
#####################################################################
RUN curl --silent --location https://deb.nodesource.com/setup_4.x | bash -


#####################################################################
## Update OS and install/update utilities
#####################################################################
RUN apt-get update &&\
	apt-get install -y \
		python-pygments \
		nodejs \
		build-essential \
		default-jre && \
	npm install -g npm


#####################################################################
## Install ruby dependencies
#####################################################################

RUN bundle config --global frozen 1

RUN mkdir -p /usr/install
RUN mkdir -p /usr/deploy

WORKDIR /usr/install

COPY Gemfile /usr/install/
COPY Gemfile.lock /usr/install/
RUN bundle install

WORKDIR /usr/deploy
