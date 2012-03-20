#!/bin/bash

#SOLR_ARCHIVEDIR=/opt/kits/solr
#SOLR_LOCATION=/opt/solr/runtime
#SOLR_NAME=apache-solr-3.5.0

set -e

cd ../
source macysCommon.sh


# in /opt/kits/solr
echo "1. --- retrieving SOLR"
mkdir -p $SOLR_ARCHIVEDIR
cd $SOLR_ARCHIVEDIR
if [ ! -f $SOLR_ARCHIVEDIR/$SOLR_ARCHIVE ]
then
	wget http://apache.deathculture.net//lucene/solr/3.5.0/$SOLR_ARCHIVE
fi

echo "1. --- unzipping SOLR archive"
rm -rf $SOLR_NAME
unzip $SOLR_ARCHIVE 1>/dev/null



# in /opt/solr/runtime
echo "2. --- cleaning up"
cd $SOLR_LOCATION
sudo rm -rf bin
sudo rm -rf conf
sudo rm -f README.txt
sudo rm -f solr.xml

echo "2. --- enshuring preconditions"
mkdir -p $SOLR_LOCATION/conf/


# in /opt/solr/runtime
echo "3. --- installing SOLR"
cp -Rf $SOLR_ARCHIVEDIR/$SOLR_NAME/example/solr/* $SOLR_LOCATION
sudo cp -rf $WORKSPACE/stella-search/config/solr/conf/* $SOLR_LOCATION/conf/

echo "3. --- perform additional SOLR related configuration"
cd /www/a/config/deployment/dev-config/sandbox/ui/
sudo cp $WORKSPACE/config/dev-config/sandbox/ui/solr.connection.properties .

