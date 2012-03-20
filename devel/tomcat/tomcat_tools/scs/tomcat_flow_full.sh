#!/bin/bash
# NOTE: if some other process is using port 8443 (SSL), the behavior of this script is not specified (yet)
# TODO: make a clean backup of the Tomcat server.xml and maintain that...change the port from 8080 to 8081 (freeswitch needs 8080)


if [ "`whoami`" != root ]; then
  echo "You must be root in order to run this script." >&2
  exit 1
fi


source variables.sh


echo "--- Turning on debug mode"
export SIPXCONFIG_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=4241"


echo "--- Building sipXconfig...this will take about one minute"
## $scripts_dir/redeploy.sh > /dev/null 2>&1


$scripts_dir/tomcat_clean.sh sipxconfig

#TODO: make this work (it will fail here)
cd scs
./tomcat_getApp.sh
cd ..

echo "--- Stopping the config server to allow the Tomcat server to fulfill that role"
$install_dir/bin/sipxproc --stop ConfigServer


$scripts_dir/tomcat_explode_wars.sh # at this point, Tomcat should be started and after this point, stopped


$scripts_dir/tomcat_jrebel.sh sipxconfig


$scripts_dir/tomcat_initializeApp.sh


echo "--- Removing the war as it's no longer needed"
rm $tomcat6Dir/webapps/sipxconfig.war



export CATALINA_OPTS="-Xms512m -Xmx512m -XX:MaxPermSize=256m"
$scripts_dir/tomcat_lifecycle.sh start_with_jrebel

