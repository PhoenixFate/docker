#!/bin/bash
docker run -d -it \
    --name nacos \
    --restart=always \
    --env MODE=standalone \
    -p 8848:8848 \
    nacos/nacos-server
