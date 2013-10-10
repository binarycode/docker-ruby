FROM ubuntu:precise

MAINTAINER Ted Lilley <ted.lilley@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://ubuntu.wikimedia.org/ubuntu precise main restricted universe multiverse" > /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y git wget build-essential
RUN wget -O ruby-install-0.3.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.3.0.tar.gz
RUN tar -xzvf ruby-install-0.3.0.tar.gz
RUN cd ruby-install-0.3.0 && make install
RUN ruby-install -i /usr/local/ ruby 2.0.0-p247
RUN gem update --system
RUN gem install bundler

