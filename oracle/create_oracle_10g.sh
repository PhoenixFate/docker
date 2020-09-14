#!/bin/bash
docker run -d -it \
    --name oracle10g \
	  --restart=always \
	  --privileged=true \
	  --shm-size=2g \
	  -p 1520:1521 \
	  klwang/oracle10g
