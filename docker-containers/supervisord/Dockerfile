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
RUN chmod 0600 /etc/supervisor/conf.d/cron.conf \
 && chmod 0600 /etc/cron.d/my-cron

ARG APP_USER_ID
ARG APP_USER_GROUP_ID

# コンテナ内で作成されるファイルを、ホスト側のユーザーIDと一致させる
RUN if ! getent group ${APP_USER_GROUP_ID} > /dev/null 2>&1; then \
      groupadd -g ${APP_USER_GROUP_ID} app-user; \
    fi \
 && useradd \
      -u ${APP_USER_ID} \
      -g ${APP_USER_GROUP_ID} \
      -M \
      -s /usr/sbin/nologin \
      app-user

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/cron.conf"]
