#!/bin/bash
TOMCAT_DIR=/data/tomcat
TOMCAT_HTTP_PORT=8089
docker run -d -it \
    --name tomcat \
	  --restart=always \
    -p ${TOMCAT_HTTP_PORT}:8080 \
    -v ${TOMCAT_DIR}/webapps:/usr/local/tomcat/webapps \
    -v ${TOMCAT_DIR}/logs:/usr/local/tomcat/logs \
    -v /etc/localtime:/etc/localtime:ro \
    -e TZ="Asia/Shanghai" \
    tomcat:7

