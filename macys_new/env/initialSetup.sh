#!/bin/bash

cd ../
source macysCommon.sh

sudo rm -rf /www/*
sudo mkdir -p /www/a/data/import/xml/in
sudo mkdir -p /www/a/config/deployment
sudo chmod -R 777 /www
cd $WORKSPACE
#mvn -pl stella-webapp process-resources -Pinstall-config -Dcurrent.env=dev-config/sandbox_inttest
mvn -pl stella-webapp process-resources -Pinstall-config

