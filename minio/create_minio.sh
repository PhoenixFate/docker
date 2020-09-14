#!/bin/bash
MINIO_DIR=/data/minio
docker run -it -d \
    --name minio \
    --restart=always \
    -p 9000:9000 \
    -e MINIO_ACCESS_KEY=admin \
    -e MINIO_SECRET_KEY=centos123qwer \
    -v ${MINIO_DIR}/data:/data \
    -v ${MINIO_DIR}/config:/root/.minio \
    minio/minio server /data



