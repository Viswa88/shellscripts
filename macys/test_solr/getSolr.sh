#!/bin/bash

set -e

cd ../
source macysCommon.sh

echo "--- enshuring preconditions"
mkdir -p $SOLR_ARCHIVEDIR
mkdir -p $TEST_SOLR_LOCATION

echo "--- cleaning up"
cd $TEST_SOLR_LOCATION
sudo rm -rf bin
sudo rm -rf conf
sudo rm -f README.txt
sudo rm -f solr.xml


echo "--- retrieving SOLR"
cd $SOLR_ARCHIVEDIR

if [ ! -f $SOLR_ARCHIVEDIR/$TEST_SOLR_ARCHIVE ]
then
	wget http://mirrors.hostingromania.ro/apache.org//lucene/solr/3.5.0/$TEST_SOLR_ARCHIVE
fi


echo "--- unzipping SOLR archive"
rm -rf $TEST_SOLR_NAME
unzip $TEST_SOLR_ARCHIVE 1>/dev/null


echo "--- installing SOLR"
cp -Rf $TEST_SOLR_NAME/example/solr/* $TEST_SOLR_LOCATION
sudo cp -rf $WORKSPACE/stella-search/config/solr/conf/* $TEST_SOLR_LOCATION/conf/


echo "--- perform additional SOLR related configuration"
cd /www/a/config/deployment/dev-config/sandbox/ui/
sudo cp $WORKSPACE/config/dev-config/sandbox/ui/solr.connection.properties .
