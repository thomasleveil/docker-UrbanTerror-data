FROM phusion/baseimage:0.9.15
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
#------------------------------------------------------------------------------

MAINTAINER Thomas Léveil <thomasleveil@gmail.com>

## Install dependencies
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update &&\
    apt-get -y install unzip aria2 &&\
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## Create a urt user
RUN useradd --home-dir /home/urt --create-home urt 

## Download Urban Terror
## if links are broken, check http://www.urbanterror.info/downloads/
RUN aria2c --file-allocation=none \
	http://up.barbatos.fr/urt/UrbanTerror42_full021.zip \
	http://mirror.urtstats.net/urbanterror/UrbanTerror42_full021.zip \
	http://files.cucurb.net/UrbanTerror/UrbanTerror42_full021.zip \
	--dir=/tmp &&\
    unzip /tmp/UrbanTerror42_full*.zip -d /home/urt && rm /tmp/UrbanTerror42_full*.zip &&\
    chown -R urt:urt /home/urt/

