FROM ruby:2.1.4-onbuild
MAINTAINER Minn Soe <contributions@minn.so>

## onbuild tag will grab local Gemfile and will bring in Jekyll.


#####################################################################
## Inject Nodesource Repository
#####################################################################
RUN curl -sL https://deb.nodesource.com/setup | bash -


#####################################################################
## Update OS and Install/Update Utilities
#####################################################################
RUN apt-get update &&\
	apt-get install -y \
		python-pygments \
		nodejs \
		default-jre && \
	npm install -g npm


#####################################################################
## Expose Default Port for Built-In Server
#####################################################################
EXPOSE 4000