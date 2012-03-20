#!/bin/bash

cd ../
source macysCommon.sh

echo "--- starting SOLR server"
cd $SOLR_TOMCAT
bin/startup.sh 1>/dev/null

