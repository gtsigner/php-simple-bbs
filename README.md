##
环境： Redis3.1+PHP5.6-fpm+Nginx+Mysql5.7

## Usage
1.git clone .

2.docker-compose up --build

## 第一次需要手动导入测试数据
1.查看docker-compose 网络

```
$docker network ls
NETWORK ID          NAME                  DRIVER              SCOPE
eb94c90c4aae        30goinghome_default   bridge              local
70e90a580013        bridge                bridge              local
92abe5bb5b5e        host                  host                local
4e85e7e6b5f3        none                  null                local
```


3.导入默认得数据

//启动一个迁移数据容器
```shell
$ docker run -it --link mysql-db:mysql --network 30goinghome_default -v `pwd`/data/backup:/data/backup:ro --rm mysql:5.7 sh -c 'exec mysql -h"mysql" -P"3306" -uroot -p"zhaojun" package_v1</data/backup/data-default.sql'
```



