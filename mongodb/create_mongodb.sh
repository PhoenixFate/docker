#!/bin/bash
MONGO_DIR=/data/mongodb
docker run  -d -it \
    --name mongodb \
	  --restart=always \
	  -p 27017:27017 \
	  -v ${MONGO_DIR}/data:/data/db \
	  mongo --auth

