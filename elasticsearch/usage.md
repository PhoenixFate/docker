https://blog.csdn.net/qq_40942490/article/details/111594267

docker安装elasticsearch
1.设置max_map_count不能启动es会启动不起来
查看max_map_count的值 默认是65530

cat /proc/sys/vm/max_map_count
1
重新设置max_map_count的值

sysctl -w vm.max_map_count=262144
1
2.下载镜像并运行
#拉取镜像
docker pull elasticsearch:7.7.0

#启动镜像
docker run --name elasticsearch -d -e ES_JAVA_OPTS="-Xms512m -Xmx512m" -e "discovery.type=single-node" -p 9200:9200 -p 9300:9300 elasticsearch:7.7.0
参数说明

--name表示镜像启动后的容器名称

-d: 后台运行容器，并返回容器ID；

-e: 指定容器内的环境变量

-p: 指定端口映射，格式为：主机(宿主)端口:容器端口
3.浏览器访问ip:9200 如果出现以下界面就是安装成功


4.安装elasticsearch-head
#拉取镜像
docker pull mobz/elasticsearch-head:5

#创建容器
docker create --name elasticsearch-head -p 9100:9100 mobz/elasticsearch-head:5

#启动容器
docker start elasticsearch-head
or
docker start 容器id （docker ps -a 查看容器id ）
5.浏览器打开: http://IP:9100


尝试连接easticsearch会发现无法连接上，由于是前后端分离开发，所以会存在跨域问题，需要在服务端做CORS的配置。
解决办法
6.修改docker中elasticsearch的elasticsearch.yml文件
docker exec -it elasticsearch /bin/bash （进不去使用容器id进入）

vi config/elasticsearch.yml
在最下面添加2行

http.cors.enabled: true
http.cors.allow-origin: "*"


退出并重启服务

exit
docker restart 容器id



7.ElasticSearch-head 操作时不修改配置，默认会报 406错误码
#复制vendor.js到外部
docker cp 容器id:/usr/src/app/_site/vendor.js /usr/local/

#修改vendor.js
vim vendor.js

修改完成在复制回容器

docker cp /usr/local/vendor.js  容器id:/usr/src/app/_site
1
重启elasticsearch-head

docker restart 容器id
1
最好就可以查询到es数据了


8.安装ik分词器
这里采用离线安装

下载分词器压缩包
下载地址：

https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.7.0/elasticsearch-analysis-ik-7.7.0.zip
将IK分词器上传到/tmp目录中（xftp）

将分词器安装进容器中

#将压缩包移动到容器中
docker cp /tmp/elasticsearch-analysis-ik-7.7.0.zip elasticsearch:/usr/share/elasticsearch/plugins

#进入容器
docker exec -it elasticsearch /bin/bash

#创建目录
mkdir /usr/share/elasticsearch/plugins/ik

#将文件压缩包移动到ik中
mv /usr/share/elasticsearch/plugins/elasticsearch-analysis-ik-7.7.0.zip /usr/share/elasticsearch/plugins/ik

#进入目录
cd /usr/share/elasticsearch/plugins/ik

#解压
unzip elasticsearch-analysis-ik-7.7.0.zip

#删除压缩包
rm -rf elasticsearch-analysis-ik-7.7.0.zip
退出并重启镜像

给大家个建议，这玩意装与不装都挺好，不装查到的东西也很精确够使，装上会查出一些没有用的！
————————————————
版权声明：本文为CSDN博主「Bright1668」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/qq_40942490/article/details/111594267