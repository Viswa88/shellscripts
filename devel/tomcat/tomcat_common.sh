#!/bin/bash

cd ../
source devel_common.sh

tomcatURL="http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.26/bin"


# $1 - tomcat directory (tomcat7)
# $2 - name of application to clean
clear_Catalina_localhost_app() {
	if [ $# -ne 2 ]
	then
		echo "#--------: ERROR : in $0 - Invalid Argument Count"
		exit
	fi

	echo "----: INFO : Attempting to clear .../work/Catalina/localhost/appNanme from Tomcat directory: " # TODO: needs work
	if [ -d $1/work/Catalina/localhost/$2/ ];
	then
		echo "----: INFO : Clearing work dir" # TODO: needs work
		rm -Rf $1/work/Catalina/localhost/$2
	else 
		echo "------: WARN : Work dir is already clean ... skipping" # TODO: needs work
	fi
}
