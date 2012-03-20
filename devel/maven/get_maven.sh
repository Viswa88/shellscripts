#!/bin/bash

cd ../
source devel_common.sh

cd $MAVEN_ARCHIVEDIR

if [ -f $mavenArchivePath ]; then
	echo "------: WARN : File: "$mavenArchivePath" already exists...skipping download"
else
	wget $mavenArchiveURL
	echo "----: INFO : Downloaded: "$mavenArchiveName" in: "$mavenArchivePath
fi
