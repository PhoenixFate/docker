#!/bin/bash
docker run -d -it \
    --name oracle11g \
	  --restart=always \
	  --privileged=true \
	  --shm-size=2g \
	  -p 1521:1521 \
	  registry.cn-hangzhou.aliyuncs.com/helowin/oracle_11g
