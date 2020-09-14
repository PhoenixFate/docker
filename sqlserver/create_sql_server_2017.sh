#!/bin/bash
SQlSERVER_DIR=/data/sqlServer
docker run -d -it \
    --name sqlServer2017 \
	  --restart=always \
    --privileged=true \
	  -e 'ACCEPT_EULA=Y' \
	  -e 'SA_PASSWORD=Centos123qwer' \
	  -p 1433:1433 \
	  -v ${SQlSERVER_DIR}/2017:/var/opt/mssql \
	  microsoft/mssql-server-linux:2017-latest
