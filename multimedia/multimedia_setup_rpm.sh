#!/bin/bash

source ../functions.sh

check_is_root

cd rpm
run_script "vlc_rpm.sh"
cd ..

