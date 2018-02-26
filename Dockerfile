# Dockerfile for jenkins
# Version 0.0.1
FROM jenkins:latest

MAINTAINER Claudio Walser <claudio.walser@srf.ch>

USER root

RUN groupadd --gid 999 docker; \
    usermod -a -G docker jenkins; \
    apt-get update && apt-get upgrade -y; \
    apt-get install -y python-pip python3 python3-pip rubygems-integration ruby2.3 ruby2.3-dev; \
    pip install pelican; \
    pip install markdown; \
    gem install fpm;

USER jenkins
