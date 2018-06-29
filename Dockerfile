FROM phusion/baseimage:0.10.0
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
#------------------------------------------------------------------------------

## Install dependencies
RUN apt-get update \
  && apt-get -y install \
    aria2 \
    unzip

## Create a urt user
RUN useradd --home-dir /home/urt --create-home urt

## Download Urban Terror
## if links are broken, check http://www.urbanterror.info/downloads/
ARG CHECKSUM_UrbanTerror434_full_zip=9bf7f0092161391697d24f6b004a6c6b
RUN aria2c --file-allocation=none \
  --checksum=md5=$CHECKSUM_UrbanTerror434_full_zip \
  --check-integrity \
  http://cdn.urbanterror.info/urt/43/releases/zips/UrbanTerror434_full.zip \
  https://up.barbatos.fr/urt/UrbanTerror434_full.zip \
  https://www.happyurtday.com/releases/4x/UrbanTerror434_full.zip \
  --dir=/tmp \
    && unzip /tmp/UrbanTerror43*.zip -d /home/urt && rm /tmp/UrbanTerror43*.zip \
    && chown -R urt:urt /home/urt/ \
    && chmod +x /home/urt/UrbanTerror43/Quake3-UrT-Ded.*
