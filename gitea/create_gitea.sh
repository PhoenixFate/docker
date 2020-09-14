#!/bin/bash
GITEA_DIR=/data/gitea
docker run -d -it \
    --name gitea \
	  --restart=always \
	  --privileged=true \
	  -p 3050:3000 \
	  -p 10052:22 \
	  -v ${GITEA_DIR}/:/data \
	  gitea/gitea
