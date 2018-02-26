# Dockerfile for jenkins
# Version 0.0.1
FROM jenkins:latest

MAINTAINER Claudio Walser <claudio.walser@srf.ch>

USER root

RUN apt-get update && apt-get upgrade -y; \
    apt-get install -y python-pip python3 python3-pip rubygems-integration ruby2.3 ruby2.3-dev; \
    pip install pelican; \
    pip install markdown; \
    gem install fpm;


RUN groupadd --gid 999 docker; \
    usermod -a -G docker jenkins; \
    apt-get -y install apt-transport-https \
         ca-certificates \
         curl \
         gnupg2 \
         software-properties-common; \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey; \
    add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
       $(lsb_release -cs) \
       stable"; \
    apt-get update; \
    apt-get -y install docker-ce;


USER jenkins
