export DEBIAN_FRONTEND=noninteractive

apt-get -y install unzip aria2

## if links are broken, check http://www.urbanterror.info/downloads/
aria2c \
http://files.cucurb.net/UrbanTerror/UrbanTerror42_full018.zip \
http://www.formulaworld.net/uploads/urt/UrbanTerror42_full018.zip \
http://mirror.urtstats.net/urbanterror/UrbanTerror42_full018.zip \
--dir=/

adduser urt
unzip UrbanTerror42_full018.zip -d /home/urt
chown -R urt:urt /home/urt/UrbanTerror42
rm -f UrbanTerror42_full018.zip

#------------------------------------------------------------------------------
# Clean up APT when done.
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*