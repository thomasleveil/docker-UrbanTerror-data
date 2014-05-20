FROM phusion/baseimage:0.9.10
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
#------------------------------------------------------------------------------

MAINTAINER Thomas Léveil <thomasleveil@gmail.com>

## setup APT
RUN sed -i '1ideb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse' /etc/apt/sources.list
RUN sed -i '1ideb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse' /etc/apt/sources.list
RUN sed -i '1ideb mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main restricted universe multiverse' /etc/apt/sources.list
RUN sed -i '1ideb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse' /etc/apt/sources.list
RUN apt-get update
ENV DEBIAN_FRONTEND noninteractive

## Install dependencies
RUN apt-get -y install unzip aria2

## Create a urt user
RUN useradd --home-dir /home/urt --create-home urt 

## Download Urban Terror
## if links are broken, check http://www.urbanterror.info/downloads/
RUN aria2c \
	http://files.cucurb.net/UrbanTerror/UrbanTerror42_full018.zip \
	http://www.formulaworld.net/uploads/urt/UrbanTerror42_full018.zip \
	http://mirror.urtstats.net/urbanterror/UrbanTerror42_full018.zip \
	--dir=/

## Install Urban Terror
RUN unzip UrbanTerror42_full018.zip -d /home/urt
RUN chown -R urt:urt /home/urt/

#------------------------------------------------------------------------------
# Clean up APT when done.
rm -f UrbanTerror42_full018.zip
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
