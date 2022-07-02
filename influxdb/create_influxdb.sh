# 8083 web端口 8086 数据写入端口
docker run -di \
        --restart=always \
        --privileged=true \
        -p 8083:8083 \
        -p 8086:8086 \
        --expose 8090 \
        --expose 8099 \
        --name influxsrv \
        tutum/influxdb
