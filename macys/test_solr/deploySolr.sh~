#!/bin/bash

cd ../
source macysCommon.sh

echo "--- enshuring preconditions"
if [ ! -d $SOLR_TOMCAT ]
then
    echo "--- Error: solr tomcat doesn't exist"
    exit
fi

echo "--- cleaning main server"
cd $SOLR_TOMCAT
bin/catalina.sh stop 1>/dev/null 2>/dev/null
sleep 10
rm -rf webapps/solr/
rm -rf webapps/solr.war
rm -rf work/Catalina/localhost/solr/
rm -f logs/catalina.out 2>/dev/null


echo "--- deploying SOLR"
cp $SOLR_ARCHIVEDIR/apache-solr-3.5.0/dist/$SOLR_NAME.war $SOLR_TOMCAT/webapps/solr.war


echo "--- starting SOLR"
$SOLR_TOMCAT/bin/startup.sh
