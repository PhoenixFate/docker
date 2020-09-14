#!/bin/bash
docker run -d -it \
    --name rancher \
	  --restart=always \
	  -p 9980:8080 \
	  rancher/server
