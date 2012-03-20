#!/bin/bash

source variables.sh

echo "--- Copy some non-jar resources into the WEB-INF/classes/"
cp $install_dir/etc/sipxpbx/sipxconfig.properties $tomcat6Dir/webapps/sipxconfig/WEB-INF/classes/


echo "--- Copy the sipXconfig jars into the WEB-INF/lib/"
cp $install_dir/share/java/sipXecs/sipXconfig/*.jar $tomcat6Dir/webapps/sipxconfig/WEB-INF/lib/

echo "--- Renamed the spring libraries to remove the version number (temp)"
cd $tomcat6Dir/webapps/sipxconfig/WEB-INF/lib/
mv org.springframework.aop-3.0.0.RELEASE.jar org.springframework.aop.jar
mv org.springframework.asm-3.0.0.RELEASE.jar org.springframework.asm.jar
mv org.springframework.beans-3.0.0.RELEASE.jar org.springframework.beans.jar
mv org.springframework.context-3.0.0.RELEASE.jar org.springframework.context.jar
mv org.springframework.context.support-3.0.0.RELEASE.jar org.springframework.context.support.jar
mv org.springframework.core-3.0.0.RELEASE.jar org.springframework.core.jar
mv org.springframework.jdbc-3.0.0.RELEASE.jar org.springframework.jdbc.jar
mv org.springframework.expression-3.0.0.RELEASE.jar org.springframework.expression.jar
mv org.springframework.orm-3.0.0.RELEASE.jar org.springframework.orm.jar
mv org.springframework.transaction-3.0.0.RELEASE.jar org.springframework.transaction.jar
mv org.springframework.web-3.0.0.RELEASE.jar org.springframework.web.jar
mv org.springframework.web.servlet-3.0.0.RELEASE.jar org.springframework.web.servlet.jar



echo "--- Copy the sipXcommons jars into the WEB-INF/lib/"
cp $install_dir/share/java/sipXecs/sipXcommons/*.jar $tomcat6Dir/webapps/sipxconfig/WEB-INF/lib/


if [ -f $tomcat6Dir/webapps/sipxconfig/WEB-INF/lib/javax.servlet.jar ];
then
    echo "--- Removing javax.servlet.jar from the webapp library"
    rm $tomcat6Dir/webapps/sipxconfig/WEB-INF/lib/javax.servlet.jar
fi


cp $components_dir/sipXconfig/web/etc/log4j.properties $tomcat6Dir/webapps/sipxconfig/WEB-INF/


# ? javax.servlet.jsp.jar

# - note: overwrite `/opt/tomcat/tomcat6/webapps/sipxconfig/WEB-INF/lib/jdom-1.0.jar'? y
