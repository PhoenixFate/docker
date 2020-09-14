#!/bin/bash
SOLR_DIR=/data/solr
# -v ${SOLR_DIR}:/opt/solr-8.2.0 这个需要根据实际情况来改变
docker run -d -it \
	  --name solr \
	  --restart=always \
	  --privileged=true \
	  -p 8983:8983 \
	  -v ${SOLR_DIR}:/opt/solr-8.2.0 \
	  -v ${SOLR_DIR}/core-data:/var/solr \
	  solr
