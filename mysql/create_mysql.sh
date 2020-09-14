#!/bin/bash
MYSQL_DIR=/data/mysql
docker run -d -it \
    --name mysql \
    -p 3306:3306 \
	  --restart=always \
    -v ${MYSQL_DIR}/my.cnf:/etc/mysql/my.cnf \
	  -v ${MYSQL_DIR}/logs:/var/log/mysql \
    -v ${MYSQL_DIR}/data:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=centos123qwer \
    mysql
