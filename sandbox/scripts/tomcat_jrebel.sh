#!/bin/bash

source variables.sh

if [ $# -ne 1 ]
then
    echo "--- Error in $0 - Invalid Argument Count"
    echo "--- Syntax: $0 name_of_war_to_copy_jrebel_into"
    exit
fi

# TODO: try to externalize file and dir checking into functions
if [ ! -f $scripts_dir/jrebel/rebel.xml ]
then
    echo "--- Error: rebel.xml doesn't exist"
    exit
fi

if [ ! -d $tomcat6Dir/webapps/$1/WEB-INF/classes ]
then
    echo "--- Error: target directory doesn't exist: " 
    exit
fi

echo "--- Enabling rebel.xml in the exploded war"
cp $scripts_dir/jrebel/rebel.xml $tomcat6Dir/webapps/$1/WEB-INF/classes
