FROM mysql:5.7

RUN apt-get update && apt-get install -y cron && apt-get clean all

ADD start.sh /
RUN chmod 755 /start.sh

ENV CRON_EXPR="0 0/12 * *"
ENV BACKUP_DIR=/backup
ENV BACKUP_FILE=mysql

ENTRYPOINT /bin/bash
CMD /start.sh