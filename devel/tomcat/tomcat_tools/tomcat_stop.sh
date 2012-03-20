#!/bin/bash

source tomcat_variables.sh
source ../../functions.sh

cd $tomcatInstanceDir
cd bin
./catalina.sh stop

