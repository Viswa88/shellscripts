#!/bin/bash

cd ../
cd  system/
sudo ./system_setup_deb.sh
./opt_java_dir.sh

cd ../
cd programs/
sudo ./programs_setup_deb.sh

cd ../
cd devel/
cd maven/
./get_maven.sh
./install_maven.sh
cd ../
cd tomcat/
./getTomcat.sh

cd ../../
cd macys/
cd solr/
./solrAll.sh

cd ../
cd env
./initialSetup.sh

