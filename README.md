## Env Docker
docker大家肯定已经熟悉不过了

环境： Redis3.1+PHP5.6-fpm+Nginx+Mysql5.7


## 演示站点
http://blog.oeynet.org
   

## Usage
由于docker-compose up会默认得给项目加上一个前缀，在db-backup中links的必须要加上前缀才可以

1.git clone https://github.com/zhaojunlike/php-simple-bbs.git docker-oeynet-bbs

2.docker-compose up --build -d

## 第一次需要手动导入测试数据

导入默认的测试数据
```shell
$  docker network ls
$  docker run -it --link mysql-db:mysql --network client101vbbs_default -v `pwd`/data/backup:/data/backup:ro --rm mysql:5.7 sh -c 'exec mysql -h"mysql" -P"3306" -uroot -p"zhaojun" oeynet_client_bbs<./data/backup/oeynet_client_bbs.sql'
```

启用备份工具
```bash
docker-compose -f db-backup.yml up 
```

## Docker Containers
- composer 临时容器，安装composer包
- bower 临时容器，安装前端包、

下面就是nmp环境而已了
- nginx 
- php-fpm
- mysql-db
- redis

## Jenkins自动部署配置

1.

2.

3.
