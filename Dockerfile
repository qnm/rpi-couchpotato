FROM hypriot/rpi-python
MAINTAINER Rob Sharp <qnm@fea.st>

ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb-src http://archive.raspbian.org/raspbian wheezy main contrib non-free rpi" > /etc/apt/sources.list.d/debian-sources.list

RUN apt-get update && \
  apt-get install -y -q git-core python-lxml python-openssl

RUN mkdir ~/unrar-nonfree && \
    cd ~/unrar-nonfree && \
    apt-get build-dep -y unrar-nonfree && \
    apt-get source -b -y unrar-nonfree && \
    dpkg -i unrar*.deb && \
    cd && \
    rm -r ~/unrar-nonfree

## Install Couchpotato
RUN cd /opt && \
  git clone https://github.com/RuudBurger/CouchPotatoServer.git

## Expose port
EXPOSE 5050

## Set working directory
WORKDIR /opt

## Run Couchpotato
ENTRYPOINT ["python", "CouchPotatoServer/CouchPotato.py"]
