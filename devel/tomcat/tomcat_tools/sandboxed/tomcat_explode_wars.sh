#!/bin/bash

source tomcat_variables.sh

echo "--- Exploding war - stopping potentialy started Tomcat instance "
$scripts_dir/tomcat_lifecycle.sh stop
sleep 2

echo "--- Exploding war - starting briefly"
$scripts_dir/tomcat_lifecycle.sh start
sleep 4


echo "--- Exploding war - stopping for now"
$scripts_dir/tomcat_lifecycle.sh stop
sleep 1
