docker run \
        --restart=always \
        --privileged=true \
        --volume=/:/rootfs:ro \
        --volume=/var/run:/var/run:rw \
        --volume=/sys:/sys:ro \
        --volume=/var/lib/docker/:/var/lib/docker:ro \
        --publish=8098:8080 --detach=true \
        --link influxsrv:influxsrv --name=cadvisor \
        google/cadvisor:latest \
        -storage_driver=influxdb -storage_driver_db=cadvisor -storage_driver_user=cadvisor -storage_driver_password=cadvisor  -storage_driver_host=influxsrv:8086


#参数详解：
#-itd：已交互模式运行容器，并分配伪终端，并在后台启动容器
#-p: 端口映射 8080为cadvisor的管理平台端口
#--name：给容器起个名字
#--mout：把宿主机的相文目录绑定到容器中，这些目录都是cadvisor需要采集的目录文件和监控内容
#google/cadvisor：以这个镜像运行容器(本地有使用本地，没有先去下载然后启动容器)
#-storage_driver：需要指定cadvisor的存储驱动这里是influxdb
#-storage_driver_db：需要指定存储的数据库
#-storage_driver_user：influxdb数据库的用户名 默认为root
#-storage_driver_password：influxdb数据库的密码 默认为root
#-storage_driver_host：influxdb数据库的地址和端口