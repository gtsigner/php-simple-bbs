#!/bin/bash
#mysqldump -u$MYSQL_USER -p$MYSQL_PASSWORD -h=$MYSQL_HOST -A lottery_v1|gzip >/backup/sys.sql.gz
#mysqldump -u$MYSQL_USER -p$MYSQL_PASSWORD -h=$MYSQL_HOST -A lottery_v1|gzip >/backup/table-data-`date "+%Y-%m-%d"`.sql.gz
mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -h$MYSQL_HOST $MYSQL_DATABASE < /backup/default.sql
