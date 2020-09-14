#!/bin/bash
REDIS_DIR=/data/redis
docker run -d -it \
    --name redis \
    --privileged=true \
    --restart=always \
    -p 6379:6379 \
    -v ${REDIS_DIR}/data:/data \
	  -v ${REDIS_DIR}/conf/redis.conf:/etc/redis/redis.conf \
    redis redis-server /etc/redis/redis.conf --appendonly yes
