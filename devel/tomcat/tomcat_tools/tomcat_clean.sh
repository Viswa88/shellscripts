#!/bin/bash

#- note: this should not remove the war or do anything else more fancy - if a more complex script is needed (for SCS or anything else) it should just call this one

source tomcat_variables.sh
source ../../functions.sh

if [ $# -ne 1 ]
then
    echo "--- Error in $0 - Invalid Argument Count"
    exit
fi

clear_dir_if_exists $tomcatInstanceDir/temp
clear_dir_if_exists $tomcatInstanceDir/logs
clear_dir_if_exists $tomcatInstanceDir/webapps/$1
