#!/bin/bash

set -e

cd ../
source macysCommon.sh

echo "--- stopping SOLR server"
cd $TEST_SOLR_TOMCAT
bin/shutdown.sh 1>/dev/null 2>/dev/null
sleep 6
