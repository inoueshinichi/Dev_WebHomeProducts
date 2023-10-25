# Nginx web server with staging building of certbot

# FROM certbot/certbot:v2.7.3 as builder

# SSL証明書(デジタル署名＋公開鍵)と秘密鍵の発行
# https://qiita.com/mttt/items/aa2ba3a0677a803d0436
# https://qiita.com/s-katsumata/items/629222b24113d7a49b79
# ARG HOST_WEB_DOMAIN
# RUN certbot --nginx -d $HOST_WEB_DOMAIN -m $EMAIL --agree-tos

# SSL証明書と秘密鍵を踏み台イメージからコピー
# COPY --from=builder /etc/letsencrypt/live/$HOST_WEB_DOMAIN/fullchain.pem /etc/letsencrypt/live/$HOST_WEB_DOMAIN
# COPY --from=builder /etc/letsencrypt/live/$HOST_WEB_DOMAIN/privkey.pem /etc/letsencrypt/live/$HOST_WEB_DOMAIN

FROM nginx:1.25.3

ARG EMAIL
LABEL author=$EMAIL

# Refresh repository
RUN apt-get update && apt-get upgrade -y

# Install Certbot
RUN apt-get install -y certbot 

#  Depoly
ARG HOST_WEB_DOMAIN
RUN certbot certonly --webroot -w /usr/share/nginx/html -d $HOST_WEB_DOMAIN -m $EMAIL --agree-tos --non-interactive

# Setting nginx
ARG NAIVE_WEB_HTTP_PORT
EXPOSE $NAIVE_WEB_HTTP_PORT
ARG HOST_APP_DOMAIN
ARG EXPORT_APP_HTTP_PORT
ENV APP_HTTP_SERVER=http://$HOST_APP_DOMAIN:$EXPORT_APP_HTTP_PORT

COPY ./nginx.conf.tmp /etc/nginx/nginx.conf.tmp
COPY ./html/ /usr/share/nginx/html/

# ShellScript
COPY ./start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

CMD ["sh", "/usr/local/bin/start.sh"]