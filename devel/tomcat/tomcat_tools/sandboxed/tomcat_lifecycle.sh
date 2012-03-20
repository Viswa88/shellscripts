#!/bin/sh

#TODO: clean up
source tomcat_variables.sh


main_script="tomcat_flow_full.sh"
other_script="tomcat_explode_wars.sh"
start_command="catalina.sh start" # catalina-jrebel.sh jpda start
start_command_enhanced="catalina-jrebel.sh jpda start"

# Before starting, stop any existing tomcat instance
start_if_not_started() {
  echo "---- executing - start_if_not_started"
  ps -aef | grep tomcat | grep -v "grep" | grep -v $0 | grep -v $main_script | grep -v $other_script | gawk -v FS="[ \t]*" '{print $2}' > /tmp/tomcat.pid
  if [ -s /tmp/tomcat.pid ]
  then
    echo "---- ERROR: another tomcat is started - exiting: "
    # ps -aef | grep tomcat | grep -v "grep" | grep -v $0 | grep -v $main_script | grep -v $other_script | gawk -v FS="[ \t]*" '{print $2}'
  else
    echo "---- no other tomcat started - starting up"
    $tomcatDir/bin/$start_command > /dev/null 2>&1
  fi
  
  rm /tmp/tomcat.pid
}

start_if_not_started_with_jrebel() {
  echo "---- executing - start_if_not_started_with_jrebel"
  ps -aef | grep tomcat | grep -v "grep" | grep -v $0 | grep -v $main_script | grep -v $other_script | gawk -v FS="[ \t]*" '{print $2}' > /tmp/tomcat.pid
  if [ -s /tmp/tomcat.pid ]
  then
    echo "---- ERROR: another tomcat is started - exiting"
  else
    echo "---- no other tomcat started - starting up"
    $tomcatDir/bin/$start_command_enhanced > /dev/null 2>&1
  fi
  
  rm /tmp/tomcat.pid
}


# 
stop_if_started() {
  echo "---- executing - stop_if_started"
  $tomcatDir/bin/catalina.sh stop > /dev/null 2>&1
  sleep 3
  
  echo "----  verifying if it has been really stopped"
  ps -aef | grep tomcat | grep -v "grep" | grep -v $0 | grep -v $main_script | grep -v $other_script | gawk -v FS="[ \t]*" '{lprint $2}' > /tmp/tomcat.pid
  if [ -s /tmp/tomcat.pid ]
  then
    echo "---- tomcat is still running - killing"
    kill -9 `cat /tmp/tomcat.pid`
  else
    echo "---- no other tomcat started - exiting"
  fi
  
  rm /tmp/tomcat.pid
}



status() {
    echo " ------------------INFO-------------------------- "
    echo " ------------------------------------------------ "
    echo " ------------ using port 8443: " `lsof -i -n -P | grep 8443`
    echo `lsof -i -n -P | grep 8443`
    echo " ------------------------------------------------ "
    echo " ------------ existing tomcat processes: " 
    ps -ef | grep tomcat | grep -v "grep" | grep -v $0 | grep -v $main_script | grep -v $other_script
    echo " ------------------------------------------------ "
    echo " ------------------------------------------------ "
    echo " ------------------------------------------------ "
}

# See how we were called.
case "$1" in
start)
  start_if_not_started
  ;;
start_with_jrebel)
  start_if_not_started_with_jrebel
  ;;
stop)
  stop_if_started
  ;;
status)
  status
  ;;
*)
  echo $"---- Usage: $0 {start|stop|status}"
  exit 1
esac

exit 0
