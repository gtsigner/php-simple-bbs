##
环境： Redis3.1+PHP5.6-fpm+Nginx+Mysql5.7

## Usage
1.git clone 

2.docker-compose up --build -d

## 第一次需要手动导入测试数据

导入默认的测试数据
```shell
$  docker network ls
$  docker run -it --link mysql-db:mysql --network client101vbbs_default -v `pwd`/data/backup:/data/backup:ro --rm mysql:5.7 sh -c 'exec mysql -h"mysql" -P"3306" -uroot -p"zhaojun" oeynet_client_bbs<./data/backup/oeynet_client_bbs.sql'
```



