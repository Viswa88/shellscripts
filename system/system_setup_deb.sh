#!/bin/bash

source ../functions.sh

check_is_root

cd deb
run_script "upgrade_all_deb.sh"
cd ..

run_script "opt_dir.sh"
