#!/bin/bash

hudson_dir="/opt/hudson"

echo "--- If the Hudson directory doesn't exist, is is being created"
if [ ! -d $hudson_dir ];
then
    echo "--- Creating Hudson directory"
    mkdir $hudson_dir
fi

echo "--- Clearing the Hudson directory just in case"
rm -Rf $hudson_dir/*.*

echo "--- Downloading latest Hudson release"
echo "--- TODO: fix (doesn't work behind a proxy)"
#wget http://hudson-ci.org/latest/hudson.war --directory-prefix=$hudson_dir

echo "--- Creating Hudson log"
touch $hudson_dir/hudson.log
chmod +w $hudson_dir/hudson.log
