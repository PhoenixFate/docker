docker run --name elasticsearch -di \
        --restart=always \
        -e ES_JAVA_OPTS="-Xms1024m -Xmx2048m" \
        -e "discovery.type=single-node" \
        -p 9200:9200 \
        -p 9300:9300 \
        elasticsearch:6.6.0
