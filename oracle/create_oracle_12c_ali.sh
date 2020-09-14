#!/bin/bash
docker run -d -it \
    --name oracle12c \
	  --restart=always \
    --privileged=true \
    -p 1522:1521 \
    --shm-size=2g \
	  registry.cn-hangzhou.aliyuncs.com/limingong/oracle12c:12.2.0.1-ee
