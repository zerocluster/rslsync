FROM centos:latest

LABEL maintainer="zdm <zdm@softvisio.net>"

USER root

ADD resilio-sync.repo /etc/yum.repos.d

ADD rslsync.conf /var/local/rslsync/rslsync.conf

WORKDIR /var/local/rslsync

SHELL [ "/bin/bash", "-l", "-c" ]

RUN \
    source <( curl -fsSL https://bitbucket.org/softvisio/scripts/raw/master/setup-host.sh ) \
    \
    && curl -L https://linux-packages.resilio.com/resilio-sync/key.asc | sudo apt-key add \
    && echo "deb http://linux-packages.resilio.com/resilio-sync/deb resilio-sync non-free" | sudo tee /etc/apt/sources.list.d/resilio-sync.list \
    && apt update && apt -y install resilio-sync \
    \
    && mkdir /var/local/rslsync/.sync \
    && mkdir /var/local/rslsync/data

ENTRYPOINT [ "rslsync", "--nodaemon", "--config", "/var/local/rslsync/rslsync.conf" ]
