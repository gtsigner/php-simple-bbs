#!/bin/bash
#备份默认的数据，开发环境
#mysqldump -u$MYSQL_USER -p$MYSQL_PASSWORD -h=$MYSQL_HOST -A lottery_v1|gzip >/backup/sys.sql.gz
#mysqldump -u$MYSQL_USER -p$MYSQL_PASSWORD -h=$MYSQL_HOST -A lottery_v1|gzip >/backup/table-data-`date "+%Y-%m-%d"`.sql.gz
mysqldump -u$MYSQL_USER -p$MYSQL_PASSWORD -h$MYSQL_HOST $MYSQL_DATABASE > /backup/$MYSQL_DEFAULT_NAME.sql
mysqldump -u$MYSQL_USER -p$MYSQL_PASSWORD -h$MYSQL_HOST $MYSQL_DATABASE > /backup/$MYSQL_DATABASE-"$(date "+%Y%m%d-%H.%M")".sql