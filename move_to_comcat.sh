#!/bin/bash
    
service tomcat6 start

PROFILE=template
VERSION=14.06
mkdir -p /tmp/georchestra_deploy_tmp
cd /tmp/georchestra_deploy_tmp

cp `find ~/.m2/repository/ -iname "*-${VERSION}-${PROFILE}.war"` ./
   
mv geonetwork-main-${VERSION}-${PROFILE}.war geonetwork-private.war
mv extractorapp-${VERSION}-${PROFILE}.war extractorapp-private.war
mv mapfishapp-${VERSION}-${PROFILE}.war mapfishapp-private.war
mv ldapadmin-${VERSION}-${PROFILE}.war ldapadmin-private.war
mv cas-server-webapp-${VERSION}-${PROFILE}.war cas.war
mv downloadform-${VERSION}-${PROFILE}.war downloadform-private.war
#geowebcache-webapp-14.06-template.war
mv header-${VERSION}-${PROFILE}.war header-private.war
mv geoserver-webapp-${VERSION}-${PROFILE}.war geoserver-private.war
mv catalogapp-${VERSION}-${PROFILE}.war catalogapp-private.war
mv analytics-${VERSION}-${PROFILE}.war analytics-private.war
mv security-proxy-${VERSION}-${PROFILE}.war ROOT.war

#Copy WAR files in Tomcat webapps dir:

service tomcat6 stop
cp -f /tmp/georchestra_deploy_tmp/* /var/lib/tomcat6/webapps/
service tomcat6 start
