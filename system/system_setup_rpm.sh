#!/bin/bash

source ../functions.sh

check_is_root

run_script "rpm/upgrade_all_rpm.sh"
run_script "opt_dir.sh"

