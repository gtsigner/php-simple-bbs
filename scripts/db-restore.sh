#!/usr/bin/env bash
#    image: mysql:5.7
#    environment:
#      MYSQL_HOST: mysql
#      MYSQL_DATABASE: package_v1
#      MYSQL_USER: root
#      MYSQL_PASSWORD: zhaojun
#      MYSQL_DEFAULT_NAME: default
#    external_links:
#      - dockeroeynetbbs_mysql_1:mysql
#    volumes:
#      - /etc/localtime:/etc/localtime:ro
#      - ./data/backup:/backup:rw
#      - ./dockerfiles/backup/:/app:ro
#    entrypoint:
#      - /bin/bash
#    command: /app/backup-default.sh
containerName=phpsimplebbs_mysql_1
network=phpsimplebbs_default
docker run --rm --network=${network} -e MYSQL_HOST=mysql -e MYSQL_DATABASE=package_v1 -e MYSQL_USER=root -e MYSQL_PASSWORD=zhaojun \
-e MYSQL_DEFAULT_NAME=default --link ${containerName}:mysql -v $PWD/data/backup:/backup -v $PWD/dockerfiles/backup/:/app \
--entrypoint /bin/bash mysql:5.7 /app/backup-default.sh