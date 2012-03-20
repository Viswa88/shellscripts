#!/bin/bash

source ../functions.sh

chmod -Rf a+w /opt/

cd /opt

echo "----: INFO : creating standard directory structure (in /opt)"

create_dir_if_it_does_not_exist /opt/installs

create_dir_if_it_does_not_exist /opt/kits

echo "----: INFO : setting write and execute rights on /opt"

chmod -Rf a+w /opt/
