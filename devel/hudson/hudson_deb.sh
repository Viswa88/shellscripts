#!/bin/bash

source ../../functions.sh

hudson_dir="/opt/hudson"

echo "----: INFO : Clearing the Hudson directory just in case"
rm -Rf $hudson_dir

echo "----: INFO : Recreating the Hudson directory"
mkdir -pv $hudson_dir
cd $hudson_dir

echo "----: INFO : Installing Hudson"
wget -q -O - http://pkg.hudson-labs.org/debian/hudson-labs.org.key | sudo apt-key add -
sudo chmod a+w /etc/apt/sources.list.d/ 
sudo echo "deb http://pkg.hudson-labs.org/debian binary/" > /etc/apt/sources.list.d/hudson.list

sudo aptitude update
sudo aptitude install hudson


# http://wiki.hudson-ci.org/display/HUDSON/Installing+Hudson+on+Ubuntu
# http://www.zzorn.net/2009/11/setting-up-hudson-on-port-80-on-debian.html (to change port)
