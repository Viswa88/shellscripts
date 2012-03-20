#!/bin/bash

source ../functions.sh

check_is_root

cd deb
run_script "vlc_deb.sh"
cd ..
