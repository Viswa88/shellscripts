#!/bin/bash

source variables.sh

echo "--- Copy war to tomcat webaps dir"
cp $install_dir/share/java/sipXecs/sipXconfig/sipxconfig.war $tomcat6Dir/webapps

