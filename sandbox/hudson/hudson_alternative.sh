#!/bin/bash

source ../../functions.sh

hudson_dir="/opt/hudson"

echo "----: INFO : Clearing the Hudson directory just in case"
rm -Rf $hudson_dir

echo "----: INFO : Recreating the Hudson directory"
mkdir -pv $hudson_dir
cd $hudson_dir

echo "----: INFO : Downloading latest Hudson release"
wget http://hudson-ci.org/latest/hudson.war --directory-prefix=$hudson_dir

echo "----: INFO : Creating Hudson log"
touch $hudson_dir"/hudson.log"
chmod a+w $hudson_dir"/hudson.log"
