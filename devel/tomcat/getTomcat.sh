#!/bin/bash

source tomcat_common.sh

cd $TOMCAT_ARCHIVEDIR
download_file_if_not_present $tomcatArchivePath $tomcatURL"/"$tomcatArchiveName


