#!/bin/bash
MYCAT_DIR=/data/mycat
docker run -d -it \
    --name mycat \
	  --privileged=true \
	  --restart=always \
	  -p 8066:8066 \
	  -p 9066:9066 \
	  -e MYSQL_ROOT_PASSWORD=centos123qwer \
	  -v ${MYCAT_DIR}/conf:/usr/local/mycat/conf \
	  longhronshens/mycat-docker
