#!/bin/bash

source ../../functions.sh

check_is_root

echo "If on Ubuntu: "
echo "sudo add-apt-repository "deb http://archive.canonical.com/ lucid partner""
echo "sudo apt-get update"

install_deb "sun-java6-jdk"

#sudo apt-get install sun-java6-plugin
#sudo apt-get install sun-java6-fonts

