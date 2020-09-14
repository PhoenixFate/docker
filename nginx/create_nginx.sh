#!/bin/bash
NGINX_DIR=/data/nginx
docker run -d -it \
    --name nginx \
	  --restart=always \
    -p 80:80 \
    -v ${NGINX_DIR}/conf:/etc/nginx \
    -v ${NGINX_DIR}/html:/usr/share/nginx/html \
    -v ${NGINX_DIR}/logs:/var/log/nginx \
    nginx


