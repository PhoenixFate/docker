#!/bin/bash
NEXUS_DIR=/data/nexus-data
docker run -d -it\
    --name nexus \
	  --privileged=true \
	  --restart=always \
	  -p 8666:8081 \
	  -v ${NEXUS_DIR}/:/nexus-data/ \
	  sonatype/nexus3:3.20.1

