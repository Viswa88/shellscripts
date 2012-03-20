#!/bin/bash

cd ../
source devel_common.sh

cd $MAVEN_ARCHIVEDIR

if [ -d $MAVEN_INSTANCEDIR/$mavenName ]; then
	echo "----: INFO : Maven instance already exists, skipping..."
else
	echo "----: INFO : Installing maven..."
	tar zxf $mavenArchiveName
	mv -f $mavenName $MAVEN_INSTANCEDIR
fi

export PATH=$PATH:/opt/maven/instances/apache-maven-3.0.3/bin/
