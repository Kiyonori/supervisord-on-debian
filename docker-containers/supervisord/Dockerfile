FROM php:8.5.1-cli

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      cron \
      supervisor \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/

# 定期処理の設定ファイル
COPY ./conf/cron.conf /etc/supervisor/conf.d/cron.conf
COPY ./conf/my-cron   /etc/cron.d/my-cron
RUN chmod 0644 /etc/cron.d/my-cron

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/cron.conf"]
