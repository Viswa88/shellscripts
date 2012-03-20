#!/bin/bash

source functions.sh

check_is_root

echo "-------------------------------------------------------------------------------------"
cd system
run_script "system_setup_deb.sh"
cd ..

echo "-------------------------------------------------------------------------------------"
cd devel
run_script "devel_setup_deb.sh"
cd ..

echo "-------------------------------------------------------------------------------------"
cd multimedia
run_script "multimedia_setup_deb.sh"
cd ..

echo "-------------------------------------------------------------------------------------"
cd programs
run_script "programs_setup_deb.sh"
cd ..

echo "-------------------------------------------------------------------------------------"
