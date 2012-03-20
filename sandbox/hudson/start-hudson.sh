#!/bin/bash

echo "--- Setting up Hudson related system variables"
hudson_dir="/opt/hudson"
HUDSON_WAR="$hudson_dir"/hudson.war
HUDSON_LOG="$hudson_dir"/hudson.log

echo "--- Starting up Hudson"
nohup nice java -jar $HUDSON_WAR > $HUDSON_LOG 2>&1 &

# TODO: do this with a dedicated hudson user in the future; only this user should have rights to the log and perhaps the whole hudson dir
# http://weblogs.java.net/blog/2008/10/08/installing-hudson-service-redhat
