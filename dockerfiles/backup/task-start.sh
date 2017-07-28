#!/bin/bash
#自动备份工具
cat <<EOF > /etc/cron.d/mysqldump
$CRON_EXPR root /mysqldump.sh >> /var/log/cron.log 2>&1
EOF
chmod 0644 /etc/cron.d/mysqldump
cat <<EOF > /mysqldump.sh
#!/bin/bash
/usr/local/mysql/bin/mysqldump --verbose -h $DB_HOST --all-databases --ignore-table=mysql.event -uroot -p$MYSQL_ROOT_PASSWORD | gzip > $BACKUP_DIR/$BACKUP_FILE-\$(date +"%Y%m%d-%H%M").sql.gz
EOF
chmod 0755 /mysqldump.sh
#启动备份
/usr/sbin/cron
touch /var/log/cron.log && tail -f /var/log/cron.log