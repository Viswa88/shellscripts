#!/bin/bash

source tomcat_variables.sh
source ../../functions.sh

export JAVA_HOME=/usr/lib/jvm/jdk1.7.0/bin
# export JRE_HOME=/usr/lib/jvm/jdk1.7.0/jre/bin #doesn't work (Tomcat is not starting)

cd $tomcatInstanceDir
cd bin
./catalina.sh start

