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
  http://1.mirror.eu.urtnet.info/urt/43/releases/zips/UrbanTerror43_full_2.zip \
  http://3.mirror.eu.urtnet.info/urt/43/releases/zips/UrbanTerror43_full_2.zip \
  http://www.happyurtday.com/releases/4x/UrbanTerror43_full_2.zip \
  http://files.cucurb.net/UrbanTerror/UrbanTerror43_full_2.zip \
  --dir=/tmp \
    && unzip /tmp/UrbanTerror43_full*.zip -d /home/urt && rm /tmp/UrbanTerror43_full*.zip \
    && chown -R urt:urt /home/urt/ \
    && chmod +x /home/urt/UrbanTerror43/Quake3-UrT-Ded.*