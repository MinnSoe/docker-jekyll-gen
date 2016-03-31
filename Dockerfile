FROM phusion/passenger-full:latest
MAINTAINER Minn Soe <contributions@minn.io>

ENV LANG C.UTF-8

#####################################################################
## Install packages
#####################################################################
RUN npm update && \
		npm install -g gulp phantomjs-prebuilt && \
		apt-get update && apt-get install -y nasm zlib1g-dev optipng
