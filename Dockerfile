FROM phusion/baseimage:0.9.19
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
#------------------------------------------------------------------------------

MAINTAINER Thomas Léveil <thomasleveil@gmail.com>

## Install dependencies
RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update &&\
  apt-get -y install \
    aria2 \
    unzip 

## Create a urt user
RUN useradd --home-dir /home/urt --create-home urt 

## Download Urban Terror
## if links are broken, check http://www.urbanterror.info/downloads/
RUN aria2c --file-allocation=none \
  http://www.happyurtday.com/releases/4x/UrbanTerror432_full.zip \
  http://files.cucurb.net/UrbanTerror/UrbanTerror432_full.zip \
  http://cdn.urbanterror.info/urt/43/releases/zips/UrbanTerror432_full.zip \
  --dir=/tmp \
    && unzip /tmp/UrbanTerror43*.zip -d /home/urt && rm /tmp/UrbanTerror43*.zip \
    && chown -R urt:urt /home/urt/ \
    && chmod +x /home/urt/UrbanTerror43/Quake3-UrT-Ded.*
