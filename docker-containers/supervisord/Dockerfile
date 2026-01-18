FROM php:8.5.1-cli

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      supervisor \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/
