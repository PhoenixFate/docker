docker run -d -it -p 1522:1521 -p 5501:5500 \
--restart=always \
-e ORACLE_SID=ORCL \
-e ORACLE_PDB=ORCLPDB \
-e ORACLE_PWD=123456 \
-e ORACLE_CHARACTERSET=zhs16gbk \
-e ORACLE_BASE=/opt/oracle \
-e ORACLE_HOME=/opt/oracle/product/19c/dbhome_1 \
-e PATH=/opt/oracle/product/19c/dbhome_1/bin:/opt/oracle/product/19c/dbhome_1/OPatch/:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
-v /data/oracle19c:/opt/oracle/oradata \
--name oracle19c \
registry.cn-hangzhou.aliyuncs.com/zhuyijun/oracle:19c