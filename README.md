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

启用备份工具(会备份两次,一次备份到default.sql 一次备份到时间.sql)
```bash
docker-compose -f db-backup.yml up 
```

启用反备份工具（会把data/default.sql数据覆盖到数据库）
```bash
docker-compose -f db-restore.yml up 
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

1.启动安装

2.安装插件

3.系统设定

4.创建Job
