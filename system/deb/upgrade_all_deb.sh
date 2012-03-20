#!/bin/bash

source ../../functions.sh

check_is_root

echo "Updating system"
apt-get -y -qq update
apt-get -y upgrade
