#!/bin/bash

source ../functions.sh
source tomcat/tomcat_variables.sh

nexusDir="/opt/nexus"
nexusWarName="nexus-webapp-1.8.0.war"
nexusTomcat7Dir=$nexusDir/$tomcat7FileName


copy_src_file_dest_file_with_no_override $tomcat7Archive $nexusDir $nexusDir/$tomcat7ArchiveName


echo "----: INFO : Attempting to unarchive the "$tomcat7ArchiveName" instance"
if [ -d $nexusTomcat7Dir ]
then
    echo "------: WARN : "$tomcat7FileName" has already been anarchived in the "$nexusDir" directory ... skipping"
else 
	echo "----: INFO : Unarchiving "$tomcat7FileName" in "$nexusDir
	tar -zxf $tomcat7ArchiveName
fi


cd $nexusDir
download_file_if_not_present $nexusDir/$nexusWarName http://nexus.sonatype.org/downloads/$nexusWarName

copy_src_file_dest_file_with_no_override $nexusDir/$nexusWarName $nexusTomcat7Dir/webapps $nexusTomcat7Dir/webapps/$nexusWarName


mv $nexusTomcat7Dir/webapps/$nexusWarName $nexusTomcat7Dir/webapps/nexus.war
