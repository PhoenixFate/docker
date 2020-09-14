#!/bin/bash
RANCHER_DIR=/data/rancher
docker run -d -it \
    --name rancher \
	  --restart=always \
	  -p 6680:80 \
	  -p 6443:443 \
	  -v ${RANCHER_DIR}/rancher:/var/lib/rancher \
	  -v ${RANCHER_DIR}/auditlog:/var/log/auditlog \
	  rancher/rancher
