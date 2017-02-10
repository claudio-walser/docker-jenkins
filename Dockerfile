# Dockerfile for jenkins
# Version 0.0.1
FROM jenkins:latest

MAINTAINER Claudio Walser <claudio.walser@srf.ch>

USER root

RUN whoami; \
	apt-get update && apt-get upgrade -y; \
	apt-get install -y python-pip python3 python3-pip rubygems ruby2.1 ruby2.1-dev; \
	pip install pelican; \
	pip install markdown; \
	gem install fpm;

USER jenkins