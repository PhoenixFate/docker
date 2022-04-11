docker run -id -p 5044:5044 \
        -p 9600:9600 \
        --name logstash \
        --privileged=true \
        --restart=always \
        -v /data/logstash/config:/usr/share/logstash/config \
        -v /data/logstash/pipeline:/usr/share/logstash/pipeline \
        logstash:6.6.0