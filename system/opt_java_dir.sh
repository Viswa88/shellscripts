#!/bin/bash

source ../functions.sh
source ../variables.sh

chmod -Rf a+w /opt/

cd /opt

echo "----: INFO : creating standard directory structure (in /opt)"

create_dir_if_it_does_not_exist $KIT_BASEDIR

create_dir_if_it_does_not_exist $ECLIPSE_BASEDIR
create_dir_if_it_does_not_exist $ECLIPSE_BASEDIR/instances
create_dir_if_it_does_not_exist $ECLIPSE_BASEDIR/workspaces
create_dir_if_it_does_not_exist $ECLIPSE_BASEDIR/workspaces
create_dir_if_it_does_not_exist $ECLIPSE_ARCHIVEDIR


create_dir_if_it_does_not_exist $MAVEN_BASEDIR
create_dir_if_it_does_not_exist $MAVEN_BASEDIR/repos
create_dir_if_it_does_not_exist $MAVEN_BASEDIR/instances
create_dir_if_it_does_not_exist $MAVEN_ARCHIVEDIR

create_dir_if_it_does_not_exist $TOMCAT_BASEDIR
create_dir_if_it_does_not_exist $TOMCAT_ARCHIVEDIR

chmod -Rf a+w /opt/
