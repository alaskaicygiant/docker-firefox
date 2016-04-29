FROM ubuntu:14.04.3
ENV DEBIAN_FRONTEND noninteractive \
  FIREFOXVERSION 45.0.2+build1-0ubuntu0.14.04.3

RUN apt-get update && apt-get install -y firefox
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886; \
    apt-get update; \
    apt-get install -y --no-install-recommends  dbus-x11 \
                                                adobe-flashplugin \
                                                libxext-dev \
                                                libxrender-dev \
                                                libxtst-dev \
                                                oracle-java8-installer \
                                                oracle-java8-set-default; \
    rm -rf /var/lib/apt/lists/*
