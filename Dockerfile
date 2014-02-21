FROM phusion/baseimage:0.9.6
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
#------------------------------------------------------------------------------
ADD build.sh /tmp/build.sh
RUN chmod +x /tmp/build.sh
RUN /tmp/build.sh
